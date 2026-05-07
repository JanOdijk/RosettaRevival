(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : GENMDICTDATA
 *  Creation date   : 13 MARCH 1991
 *  Author          : Frank Uittenbogaard                                  
 *                                                                  
 *  Copyright (c) 1990, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         : Generates mdict.isf
 *
 *  Logical Names   : logfile, mdict (target), mdicttext (source), askeyfile
 *
 *EMP:::===================================================================*)

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

pragma C_Include('cisam.pf');
pragma C_Include('ldlexconvert.pf');
pragma C_Include('files.pf');
pragma C_Include('string.pf');
pragma C_Include('interface1.pf');
pragma C_Include('ldmdict.pf');
pragma C_Include('mdictdef.pf');
pragma C_Include('strtokey.pf');
pragma C_Include('logname.pf');




PROGRAM GENMDICTDATA(Lognames);
WITH CISAM,
     LDLEXCONVERT,
     LOGNAME,
     FILES,
     STRNG,
     INTERFACE1,
     LDMDICT,
     MDICTDEF,
     STRTOKEY;
WITH LOOPHOLES;
label
  error;
var
  Lognames : Text;
  intstat,
  pos, 
  NewSize: integer;
  logfile,
  textfile: FILES_Text;
  NrRejected,
  NrAccepted: INTEGER;
  Mdictfile: CISAM_FileType;
  status   : CISAM_StatusType;
  MdictRec : MDICTDEF_RecordDef;
  KeyString: STRING_String;
  Buffer   : STRING(100);
  BufferLength: FILES_IORange;

BEGIN
  reset(Lognames);
  Logname_Init(LogNames);
  FILES_Open(textfile,'mdicttext',9,1);

  FILES_Open(logfile,'logfile',7,3);

  MdictFile := CISAM_initfile(Logname_Tr('mdict'), 5, 
                           Adr(MdictRec), SIZEof(MdictRec), CISAM_indexed);
  CISAM_DefineKey(MdictFile, Adr(MdictRec.stem)-Adr(MdictRec), SIZEof(MdictRec.stem),
                   CISAM_String, CISAM_Duplicate, CISAM_Up);
  CISAM_DefineKey(MdictFile, Adr(MdictRec.KEY)-Adr(MdictRec), SIZEof(MdictRec.KEY),
                   CISAM_Value, CISAM_Duplicate, CISAM_Up);
  CISAM_Open(MdictFile, CISAM_out,CISAM_new);

  STRTOKEY_OpenSkeyRead;
  writeln;


  NrAccepted := 0;
  NrRejected := 0;
  while not FILES_EndOfFile(textfile) do with MdictRec do
  begin
    kind := BasType;
    FILES_ReadToEndOfLine(textfile, buffer, BufferLength);
    if BufferLength < LDMDICT_MaxStem
    then goto error; { incomplete line }
    FILES_SkipLine(textfile);
    FOR pos := 1 TO LDMDICT_MaxStem DO stem[pos] := buffer[pos];
    {stem := Retype(buffer,LDMDICT_StemType);}
    pos := LDMDICT_MaxStem+1;
    LDLEXCONVERT_TextToCC(buffer, pos, MdictRec);
    LDLEXCONVERT_TextToPhon(buffer, pos, MdictRec);
    case buffer[pos] of
      'A': where := OnlyAn;
      'G': where := OnlyGen;
      'B': where := BothAnGen;
    end;
    pos := pos+1;
    STRING_Constant(KeyString, buffer, BufferLength);
    STRING_ExtractEnd(KeyString, KeyString, pos);
    STRING_Trim(KeyString, KeyString);
    if not STRTOKEY_GetSkey(KeyString, key)
    then begin
      FILES_WriteString(logfile, 'No skey found for: ', 0, true);
      FILES_WriteString(logfile, KeyString, 0, true);
      FILES_WriteLine(logfile, true);
      NrRejected := NrRejected+1;
    end
    else begin
      CISAM_Write(MdictFile, Sizeof(MdictRec));
      status := CISAM_OwnStatus;
      intstat := CISAM_IntegerStatus;
{      if status <> CISAM_NoError
      then begin
        FILES_WriteString(logfile, 'Write failure for: ', 0, true);
        FILES_WriteString(logfile, KeyString, 0, true);
        FILES_WriteLine(logfile, true);
        NrRejected := NrRejected+1; 
      end
      else } NrAccepted := NrAccepted+1;
    end;
error:
  end;
  FILES_WriteString(logfile,'Number of processed records: ', 0, true);
  FILES_WriteInteger(logfile,NrAccepted,8,true);
  FILES_WriteLine(logfile, true);
  FILES_WriteString(logfile,'Number of failures: ', 0, true);
  FILES_WriteInteger(logfile,NrRejected,8,true);
  FILES_WriteLine(logfile, true);
  CISAM_Close(MdictFile);
  STRTOKEY_CloseSkey;
  FILES_Close(textfile);
  FILES_Close(logfile);
END.
