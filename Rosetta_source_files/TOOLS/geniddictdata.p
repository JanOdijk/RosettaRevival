(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : GENIDDICTDATA
 *  Creation date   : 9 APRIL 1991
 *  Author          : Frank Uittenbogaard                                  
 *                                                                  
 *  Copyright (c) 1990, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         : Generates iddict.isf
 *
 *  Logical Names   : logfile, iddict (target), iddicttext (source), 
 *                    askeyfile
 *
 *EMP:::===================================================================*)

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
pragma C_Include('lsdomaint.pf');
pragma C_Include('lsstrtotype.pf');
pragma C_Include('files.pf');
pragma C_Include('string.pf');
pragma C_Include('str.pf');
pragma C_Include('liiddict.pf');
pragma C_Include('strkeyrecdef.pf');
pragma C_Include('strtokey.pf');
pragma C_Include('cisam.pf');
pragma C_Include('logname.pf');

PROGRAM GENIDDICTDATA(Lognames);
WITH     LSDOMAINT, LSSTRTOTYPE, FILES, STRNG, STR, LIIDDICT, STRKEYRECDEF,
         STRTOKEY, LOGNAME, CISAM;

WITH LoopHoles;

label
  error;
var
  Lognames       : Text;
  i, 
  intstat,
  CurrentPosition, 
  NewSize        : integer;
  logfile,
  textfile       : FILES_Text;
  NrRejected,
  NrAccepted     : INTEGER;
  Iddictfile     : CISAM_FileType;
  status         : CISAM_StatusType;
  IddictRec      : LIIddict_RecordDef;
  AuxPattern     : LSDOMAINT_SynPatternType;
  KeyString      : STRING_String;
  Buffer         : STRING(200);
  BufferLength   : FILES_IORANGE;
  SubBuffer      : STRING(100);
  SubBufferLength: integer;

procedure ReadUntilSpace;
begin
  { skip spaces }
  while (CurrentPosition <= BufferLength) and (Buffer[CurrentPosition] = ' ')
  do CurrentPosition := CurrentPosition+1;
  { read characters until end of buffer or space }
  SubBufferLength := 0; SubBuffer := '';
  while (CurrentPosition <= BufferLength) and (Buffer[CurrentPosition] <> ' ')
  do begin
    SubBufferLength := SubBufferLength+1;
    SubBuffer :=  SubBuffer || Buffer[CurrentPosition];
    CurrentPosition := CurrentPosition+1;
  end;
  if CurrentPosition < BufferLength { buffer[CurrentPosition] = space }
  then CurrentPosition := CurrentPosition+1; { skip this space }
end;

BEGIN
  reset(Lognames);
  Logname_Init(Lognames);

  FILES_Open(logfile,'logfile',7,3);
  FILES_Open(textfile,'Iddicttext',10,1);


  IddictFile := CISAM_initfile(Logname_Tr('Iddict'), 6,
                           Adr(IddictRec), SizeOf(IddictRec), CISAM_indexed);
  CISAM_DefineKey(IddictFile, Adr(IddictRec.args)-Adr(IddictRec), SizeOf(IddictRec.args),
		    CISAM_String, CISAM_Duplicate, CISAM_Up);
  CISAM_DefineKey(IddictFile, Adr(IddictRec.idskey)-Adr(IddictRec), SizeOf(IddictRec.idskey),
		    CISAM_Value, CISAM_Duplicate, CISAM_Up);
  CISAM_DefineKey(IddictFile, Adr(IddictRec.headkey)-Adr(IddictRec), SizeOf(IddictRec.headkey),
		    CISAM_Value, CISAM_Duplicate, CISAM_Up);
  CISAM_Open(IddictFile,CISAM_out,CISAM_new);

  STRTOKEY_OpenSkeyRead;
writeln;
  NrAccepted := 0;
  NrRejected := 0;
  while not FILES_EndOfFile(textfile) do with IddictRec do
  begin
    FILES_ReadToEndOfLine(textfile, buffer, BufferLength);
    if BufferLength < 2
    then goto error; { incomplete line }
    FILES_SkipLine(textfile);
    CurrentPosition := 1;
    ReadUntilSpace;    
    STRING_Constant(KeyString, SubBuffer, SubBufferLength);
    if not STRTOKEY_GetSkey(KeyString, headkey)
    then begin
      FILES_WriteString(logfile, 'No headkey found for: ', 0, true);
      FILES_WriteString(logfile, KeyString, 0, true);
      FILES_WriteLine(logfile, true);
      NrRejected := NrRejected+1;
      {Goto error};
    end;
    ReadUntilSpace;    
    if not STR_StrToInteger(SubBuffer, SubBufferLength, args.NrArgs)
    then begin
      NrRejected := NrRejected+1;
      {Goto error};
    end;
    FOR i := args.nrargs+1 TO LIIDDICT_MaxIdArgs DO args.argkeys[i] := 0;
    for i := 1 to args.NrArgs do
    begin
      ReadUntilSpace;    
      STRING_Constant(KeyString, SubBuffer, SubBufferLength);
      if not STRTOKEY_GetSkey(KeyString, args.argkeys[i])
      then begin
        FILES_WriteString(logfile, 'No argument key found for: ', 0, true);
        FILES_WriteString(logfile, KeyString, 0, true);
        FILES_WriteLine(logfile, true);
        NrRejected := NrRejected+1;
        {Goto error};
      end;
    end;
    ReadUntilSpace;    
    STRING_Constant(KeyString, SubBuffer, SubBufferLength);
    if not STRTOKEY_GetSkey(KeyString, idskey)
    then begin
      FILES_WriteString(logfile, 'No idiom skey found for: ', 0, true);
      FILES_WriteString(logfile, KeyString, 0, true);
      FILES_WriteLine(logfile, true);
      NrRejected := NrRejected+1;
      {Goto error};
    end;
    ReadUntilSpace;    
    if not LSSTRTOTYPE_SynPatternType(SubBuffer, SubBufferLength, AuxPattern)
    then begin
      FILES_WriteString(logfile, 'IncorrectPattern: ', 0, true);
      FILES_WriteStr(logfile, SubBuffer, SubBufferLength, 0, true);
      FILES_WriteLine(logfile, true);
      NrRejected := NrRejected+1;
      {Goto error};
    end
    else pattern := ord(AuxPattern);
 
    CISAM_Write(IddictFile, SizeOf(IddictRec));
    status := CISAM_OwnStatus;
    intstat := CISAM_IntegerStatus;
    if status <> CISAM_NoError
    then begin
      FILES_WriteString(logfile, 'Write failure for: ', 0, true);
      FILES_WriteString(logfile, KeyString, 0, true);
      FILES_WriteLine(logfile, true);
      NrRejected := NrRejected+1; 
      {goto error;}
    end
    else  NrAccepted := NrAccepted+1;
  end;
error:
  FILES_WriteString(logfile,'Number of processed records: ', 0, true);
  FILES_WriteInteger(logfile,NrAccepted,8,true);
  FILES_WriteLine(logfile, true);
  FILES_WriteString(logfile,'Number of failures: ', 0, true);
  FILES_WriteInteger(logfile,NrRejected,8,true);
  FILES_WriteLine(logfile, true);
  CISAM_Close(IddictFile);
  STRTOKEY_CloseSkey;
  FILES_Close(textfile);
  FILES_Close(logfile);
END.
