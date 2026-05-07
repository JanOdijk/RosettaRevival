(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : GENSIDDICTDATA
 *  Creation date   : 19 MARCH 1991
 *  Author          : Frank Uittenbogaard                                  
 *                                                                  
 *  Copyright (c) 1990, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         : Generates siddict.isf
 *
 *  Logical Names   : logfile, siddict (target), siddicttext (source), 
 *                    askeyfile, mkeyfile
 *
 *EMP:::===================================================================*)

pragma C_Include('cisam.pf');
pragma C_Include('files.pf');
pragma C_Include('string.pf');
pragma C_Include('str.pf');
pragma C_Include('lisiddict.pf');
pragma C_Include('strkeyrecdef.pf');
pragma C_Include('strtomkey.pf');
pragma C_Include('strtokey.pf');
pragma C_Include('logname.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM GENSIDDICTDATA(Lognames);
WITH CISAM,
     FILES,
     STRNG,
     STR,
     LOGNAME,
     LISIDDICT,
     STRKEYRECDEF,
     STRTOMKEY,
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
  Siddictfile: CISAM_FileType;
  status   : CISAM_StatusType;
  SiddictRec : LISiddict_RecordDef;
  KeyString: STRING_String;
  Buffer   : STRING(200);
  BufferLength: FILES_IORange;
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
    SubBuffer := SubBuffer || Buffer[pos];
    pos := pos+1;
  end;
  if pos < BufferLength { buffer[pos] = space }
  then pos := pos+1; { skip this space }
end;

BEGIN
  reset(Lognames);
  Logname_Init(LogNames);

  FILES_Open(logfile,'logfile',7,3);
  FILES_Open(textfile,'Siddicttext',11,1);

  SiddictFile := CISAM_initfile(Logname_Tr('Siddict'), 7,
                           Adr(SiddictRec), SIZEof(SiddictRec), CISAM_indexed);
  CISAM_DefineKey(SiddictFile, Adr(SiddictRec.skey)-Adr(SiddictRec), SIZEof(SiddictRec.skey),
                   CISAM_Value, CISAM_Duplicate, CISAM_Up);
  CISAM_DefineKey(SiddictFile, Adr(SiddictRec.sidskey)-Adr(SiddictRec), SIZEof(SiddictRec.sidskey),
                   CISAM_Value, CISAM_NoDuplicate, CISAM_Up);
  CISAM_Open(SiddictFile, CISAM_out, CISAM_new);

  STRTOKEY_OpenSkeyRead;
  STRTOMKEY_OpenMkeyRead;

writeln;
  NrAccepted := 0;
  NrRejected := 0;
  while not FILES_EndOfFile(textfile) do with SiddictRec do
  begin
    FILES_ReadToEndOfLine(textfile, buffer, BufferLength);
    if BufferLength < 2
    then goto error;  { incomplete line }
    FILES_SkipLine(textfile);
    pos := 1;
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
    if not STRTOKEY_GetSkey(KeyString, arg)
    then begin
      FILES_WriteString(logfile, 'No skey found for: ', 0, true);
      FILES_WriteString(logfile, KeyString, 0, true);
      FILES_WriteLine(logfile, true);
      NrRejected := NrRejected+1;
      {Goto error};
    end;
    ReadUntilSpace;
    if not STR_StrToInteger(SubBuffer, SubBufferLength, argnr)
    then begin
      FILES_WriteString(logfile, 'argnr not integer. ', 0, true);
      FILES_WriteLine(logfile, true);
      NrRejected := NrRejected+1;
      {goto error};
    end;
    ReadUntilSpace;    
    STRING_Constant(KeyString, SubBuffer, SubBufferLength);
    if not STRTOKEY_GetSkey(KeyString, sidskey)
    then begin
      FILES_WriteString(logfile, 'No skey found for: ', 0, true);
      FILES_WriteString(logfile, KeyString, 0, true);
      FILES_WriteLine(logfile, true);
      NrRejected := NrRejected+1;
      {Goto error};
    end;
    ReadUntilSpace;    
    if (SubBufferLength = 1) and (SubBuffer[1] = '0')
    then sidmkey := 0
    else begin
      STRING_Constant(KeyString, SubBuffer, SubBufferLength);
      if not STRTOMKEY_GetMkey(KeyString, sidmkey)
      then begin
        FILES_WriteString(logfile, 'No mkey found for: ', 0, true);
        FILES_WriteString(logfile, KeyString, 0, true);
        FILES_WriteLine(logfile, true);
        NrRejected := NrRejected+1;
        {goto error};
      end;
    end;
    CISAM_Write(SiddictFile, Sizeof(SiddictRec));
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
  CISAM_Close(SiddictFile);
  STRTOKEY_CloseSkey;
  STRTOMKEY_CloseMkey;
  FILES_Close(textfile);
  FILES_Close(logfile);
END.
