(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : GENSDICTDATA
 *  Creation date   : 19 MARCH 1991
 *  Author          : Frank Uittenbogaard                                  
 *                                                                  
 *  Copyright (c) 1990, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         : Generates sdict.isf
 *
 *  Logical Names   : logfile, sdict (target), sdicttext (source), 
 *                    askeyfile
 *
 *EMP:::===================================================================*)

pragma C_Include('cisam.pf');
pragma C_Include('files.pf');
pragma C_Include('string.pf');
pragma C_Include('str.pf');
pragma C_Include('lisdict.pf');
pragma C_Include('strtokey.pf');
pragma C_Include('strkeyrecdef.pf');
pragma C_Include('logname.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
PROGRAM GENSDICTDATA(Lognames);
WITH CISAM,
     FILES,
     STRNG,
     LOGNAME,
     STR,
     LISDICT,
     STRKEYRECDEF,
     STRTOKEY;
WITH LOOPHOLES;


label
  error;
var
  Lognames :Text;
  i, 
  intstat,
  pos, 
  NewSize: integer;
  logfile,
  textfile: FILES_Text;
  NrRejected,
  NrAccepted: INTEGER;
  Sdictfile: CISAM_FileType;
  status   : CISAM_StatusType;
  SdictRec : LISdict_RecordDef;
  KeyString: STRING_String;
  Buffer   : STRING(200);
  BufferLength: FILES_IORANGE;
  SubBuffer   : STRING(100);
  SubBufferLength: integer;

procedure ReadUntilSpace;
begin
  { skip spaces }
  while (pos <= BufferLength) and (Buffer[pos] = ' ')
  do pos := pos+1;
  { read characters until end of buffer or space }
  SubBufferLength := 0; SubBuffer := '';
  while (pos <= BufferLength) and (Buffer[pos] <> ' ')
  do begin
    SubBufferLength := SubBufferLength+1;
    {SubBuffer[SubBufferLength] := Buffer[pos];}
    SubBuffer := SubBuffer || Buffer[pos];

    pos := pos+1;
  end;
  if pos < BufferLength { buffer[pos] = space }
  then pos := pos+1; { skip this space }
end;

BEGIN
  Reset(Lognames);
  Logname_Init(Lognames);

  STRTOKEY_OpenSkeyRead;

  SdictFile := CISAM_initfile(LogName_Tr('Sdict'), 5,
                           Adr(SdictRec), SIZEof(SdictRec), CISAM_indexed);
  CISAM_DefineKey(SdictFile, Adr(SdictRec.fkey)-Adr(SdictRec), SIZEof(SdictRec.fkey),
	    CISAM_Value, CISAM_Duplicate, CISAM_Up);
  CISAM_DefineKey(SdictFile, Adr(SdictRec.skey)-Adr(SdictRec), SIZEof(SdictRec.skey),
	    CISAM_Value, CISAM_NoDuplicate, CISAM_Up);
  CISAM_Open(SdictFile, CISAM_out, CISAM_new);


  FILES_Open(logfile,'logfile',7,3);
  FILES_Open(textfile,'Sdicttext',10,1);
 

  NrAccepted := 0;
  NrRejected := 0;
  while not FILES_EndOfFile(textfile) do with SdictRec do
  begin
    FILES_ReadToEndOfLine(textfile, buffer, BufferLength);
    if BufferLength < 2
    then goto error; { incomplete line }
    FILES_SkipLine(textfile);
    pos := 1;
    ReadUntilSpace;    
    STRING_Constant(KeyString, SubBuffer, SubBufferLength);
    if not STRTOKEY_GetSkey(KeyString, fkey)
    then begin
      FILES_WriteString(logfile, 'No fkey found for: ', 0, true);
      FILES_WriteString(logfile, KeyString, 0, true);
      FILES_WriteLine(logfile, true);
      NrRejected := NrRejected+1;
      {Goto error};
    end;
    ReadUntilSpace;    
    STRING_Constant(KeyString, SubBuffer, SubBufferLength);
    if not STRTOKEY_GetSkey(KeyString, skey)
    then begin
      FILES_WriteString(logfile, 'No skey found for: ', 0, true);
      FILES_WriteString(logfile, KeyString, 0, true);
      FILES_WriteLine(logfile, true);
      NrRejected := NrRejected+1;
      {Goto error};
    end;
    ReadUntilSpace;    
    STRING_Constant(KeyString, SubBuffer, SubBufferLength);
    if not STRTOKEY_GetSkey(KeyString, ctxt[1])
    then begin
      FILES_WriteString(logfile, 'No context key found for: ', 0, true);
      FILES_WriteString(logfile, KeyString, 0, true);
      FILES_WriteLine(logfile, true);
      NrRejected := NrRejected+1;
      {Goto error};
    end;
    nr := 1;
    CISAM_Write(SdictFile, Sizeof(SdictRec));
    status := CISAM_OwnStatus;
    intstat := CISAM_IntegerStatus;
{    if status <> CISAM_NoError
    then begin
      FILES_WriteString(logfile, 'Write failure for: ', 0, true);
      FILES_WriteString(logfile, KeyString, 0, true);
      FILES_WriteLine(logfile, true);
      NrRejected := NrRejected+1; 
      goto error;
    end
    else } NrAccepted := NrAccepted+1;
  end;
error:
  FILES_WriteString(logfile,'Number of processed records: ', 0, true);
  FILES_WriteInteger(logfile,NrAccepted,8,true);
  FILES_WriteLine(logfile, true);
  FILES_WriteString(logfile,'Number of failures: ', 0, true);
  FILES_WriteInteger(logfile,NrRejected,8,true);
  FILES_WriteLine(logfile, true);
  CISAM_Close(SdictFile);
  STRTOKEY_CloseSkey;
  FILES_Close(textfile);
  FILES_Close(logfile);
END.
