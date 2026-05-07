(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : GENILDICTDATA
 *  Creation date   : 15 MARCH 1991
 *  Author          : Frank Uittenbogaard                                  
 *                                                                  
 *  Copyright (c) 1990, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         : Generates ildict.isf
 *
 *  Logical Names   : logfile, ildict (target), ildicttext (source), 
 *                    askeyfile, mkeyfile
 *
 *EMP:::===================================================================*)

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
pragma C_Include('logname.pf');
pragma C_Include('globdef.pf');
pragma C_Include('logname.pf');
pragma C_Include('files.pf');
pragma C_Include('str.pf');
pragma C_Include('string.pf');
pragma C_Include('strtomkey.pf');
pragma C_Include('strtokey.pf');
pragma C_Include('cisam.pf');
pragma C_Include('liildict.pf');

PROGRAM GENILDICTDATA(Lognames);
WITH
      CISAM,
         LOGNAME,
         FILES,
         STRNG,
         STR,
         LIILDICT,
         STRTOMKEY,
         STRTOKEY;
WITH Loopholes;
label
  error;
var
  Lognames : Text;
  i, 
  intstat,
  pos, 
  NewSize: integer;
  logfile,
  textfile: FILES_Text;
  NrRejected,
  NrAccepted: INTEGER;
  Ildictfile: CISAM_FileType;
  status   : CISAM_StatusType;
  IldictRec : LIILDICT_RecordDef;
  KeyString: STRING_String;
  Buffer   : STRING(200);
  BufferLength: Files_IORange;
  SubBuffer   : STRING(100);
  SubBufferLength: integer;

procedure ReadUntilSpace;
begin
  { skip spaces }
  while (pos <= BufferLength) and (Buffer[pos] = ' ')
  do pos := pos+1;
  { read characters until end of buffer or space }
  SubBufferLength := 0;
  SubBuffer := '';

  while (pos <= BufferLength) and (Buffer[pos] <> ' ')
  do begin
    SubBufferLength := SubBufferLength+1;
{     SubBuffer[SubBufferLength] := Buffer[pos];}
   SubBuffer := SubBuffer || Buffer[pos];

    pos := pos+1;
  end;
  if pos < BufferLength { buffer[pos] = space }
  then pos := pos+1; { skip this space }
end;

function ReadStr(n: integer; 
                 var str: packed array[lb..ub: integer] of char): boolean;
var
  i: integer;
begin
  i := 1;
  while (i <= n) and (pos <= BufferLength) do
  begin
    str[i] := Buffer[pos];
    i := i+1;
    pos := pos+1;
  end;
  ReadStr := (i = n+1);
end;

BEGIN
   reset(LogNames);
   Logname_Init(LogNames);

  FILES_Open(logfile,'logfile',7,3);
  FILES_Open(textfile,'Ildicttext',10,1);


  IldictFile := CISAM_initfile(Logname_Tr('Ildict'), 6,
                           Adr(IldictRec), SizeOf(IldictRec), CISAM_indexed);
  CISAM_DefineKey(IldictFile, Adr(IldictRec.skey)-Adr(IldictRec), SizeOf(IldictRec.skey),
	    CISAM_Value, CISAM_Duplicate, CISAM_Up);
  CISAM_DefineKey(IldictFile, Adr(IldictRec.mkey)-Adr(IldictRec), SizeOf(IldictRec.mkey),
	    CISAM_Value, CISAM_Duplicate, CISAM_Up);
  CISAM_Open(IldictFile, CISAM_out, CISAM_new);

  STRTOMKEY_OpenMkeyRead;
  STRTOKEY_OpenSkeyRead;

writeln;
 
  NrAccepted := 0;
  NrRejected := 0;
  while not FILES_EndOfFile(textfile) do with IldictRec do
  begin
{
if ((NrAccepted mod 100) = 0) OR ((NrRejected mod 100) = 0) THEN BEGIN
   writeln(NrAccepted)
END;
}
    FILES_ReadToEndOfLine(textfile, buffer, BufferLength);
    if BufferLength < LIILDICT_MaxMdLength
    then goto error; { incomplete line }
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
    if skey = 80324 then writeln('skey 80324 found');
    ReadUntilSpace;    
    STRING_Constant(KeyString, SubBuffer, SubBufferLength);
    if not STRTOMKEY_GetMkey(KeyString, mkey)
    then begin
      FILES_WriteString(logfile, 'No mkey found for: ', 0, true);
      FILES_WriteString(logfile, KeyString, 0, true);
      FILES_WriteLine(logfile, true);
      NrRejected := NrRejected+1;
      {goto error};
    end;
    ReadUntilSpace;
    if not STR_StrToInteger(SubBuffer, SubBufferLength, spref)
    then begin
      FILES_WriteString(logfile, 'spref not integer. ', 0, true);
      FILES_WriteLine(logfile, true);
      NrRejected := NrRejected+1;
      {goto error};
    end;
    ReadUntilSpace;
    if not STR_StrToInteger(SubBuffer, SubBufferLength, mpref)
    then begin
      FILES_WriteString(logfile, 'mpref not integer. ', 0, true);
      FILES_WriteLine(logfile, true);
      NrRejected := NrRejected+1;
      {goto error;}
    end;
    if not Readstr(LIILDICT_MaxMdLength, md)
    then begin
      FILES_WriteString(logfile, 'Incomplete description for mkey: ', 0, true);
      FILES_WriteString(logfile, KeyString, 0, true);
      FILES_WriteLine(logfile, true);
      NrRejected := NrRejected+1;
      {goto error;}
    end;
{     if not Readstr(LIILDICT_MaxLPInfoLength, info)
    then begin
      FILES_WriteString(logfile, 'Incomplete info for mkey: ', 0, true);
      FILES_WriteString(logfile, KeyString, 0, true);
      FILES_WriteLine(logfile, true);
      NrRejected := NrRejected+1;
      goto error;
    end;
}
    info := '     ';
    case buffer[pos] of
      'A': ag := LIILDICT_Analysis;
      'G': ag := LIILDICT_Generation;
      'B': ag := LIILDICT_Both;
      otherwise 
        begin
          FILES_WriteString(logfile, 'Incorrect AnGenSwitch. ', 0, true);
          FILES_WriteLine(logfile, true);
          NrRejected := NrRejected+1;
          {goto error;}
        end;
    end;
    pos := pos+1;
    IF buffer[pos] = 'T' THEN marked := TRUE 
    ELSE IF  buffer[pos] = 'F' THEN marked := FALSE 
    ELSE BEGIN
          FILES_WriteString(logfile, 'Incorrect mark ', 0, true);
          FILES_WriteLine(logfile, true);
          NrRejected := NrRejected+1;
    END; 
    CISAM_Write(IldictFile, SizeOf(IldictRec));
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
  CISAM_Close(IldictFile);
  STRTOKEY_CloseSkey;
  STRTOMKEY_CloseMkey;
  FILES_Close(textfile);
  FILES_Close(logfile);
END.
