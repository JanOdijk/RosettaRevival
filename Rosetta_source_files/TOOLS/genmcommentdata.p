(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : GENMCOMMENTDATA
 *  Creation date   : 9 APRIL 1991
 *  Author          : Frank Uittenbogaard                                  
 *                                                                  
 *  Copyright (c) 1990, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         : Generates mcomment.isf
 *
 *  Logical Names   : logfile, mcomment (target), mcommenttext (source), 
 *                    askeyfile
 *
 *EMP:::===================================================================*)

pragma C_Include('cisam.pf');
pragma C_Include('files.pf');
pragma C_Include('string.pf');
pragma C_Include('str.pf');
pragma C_Include('limcomment.pf');
pragma C_Include('globdef.pf');
pragma C_Include('strtokey.pf');
pragma C_Include('strtomkey.pf');
pragma C_Include('strkeyrecdef.pf');
pragma C_Include('logname.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
PROGRAM GENMCOMMENTDATA(Lognames);
WITH CISAM,
     FILES,
     STRNG,
     LOGNAME,
     GLOBDEF,
     STR,
     LIMCOMMENT,
     STRKEYRECDEF,
     STRTOMKEY,
     STRTOKEY;
WITH LOOPHOLES;


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
  mcommentfile: CISAM_FileType;
  status   : CISAM_StatusType;
  mcommentRec : LImcomment_RecordDef;
  KeyString: STRING_String;
  Buffer   : STRING(200);
  BufferLength: FILES_IORange;
  SubBuffer   : STRING(100);
  SubBufferLength: FILES_IORange;

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

function ReadStr(n: integer; 
                 var str: STRING): boolean;
var
  i: integer;
begin
  i := 1;
  while (i <= n) and (pos <= BufferLength) do
  begin
    str := str || Buffer[pos];
    i := i+1;
    pos := pos+1;
  end;
  ReadStr := (i = n+1);
end;

BEGIN
  Reset(Lognames);
  Logname_Init(Lognames);
  GlobDef_SetAnGenMode(AnMode);

  STRTOKEY_OpenSkeyRead;
  STRTOMKEY_OpenMkeyRead;

  mcommentfile := CISAM_InitFile(LogName_Tr('mcomment'), 8, 
                   Adr(mcommentRec), SIZEof(mcommentRec), CISAM_indexed);
  CISAM_DefineKey(mcommentfile, Adr(mcommentRec.mkey)-Adr(mcommentRec), 
                   SIZEof(mcommentRec.mkey), 
                   CISAM_Value, CISAM_Duplicate, CISAM_Up);
  CISAM_Open(mcommentfile, CISAM_out, CISAM_New);

  FILES_Open(logfile,'logfile',7,3);
  FILES_Open(textfile,'mcommenttext',12,1);

  NrAccepted := 0;
  NrRejected := 0;
  while not FILES_EndOfFile(textfile) do with mcommentRec do
  begin
    FILES_ReadToEndOfLine(textfile, buffer, BufferLength);
    if BufferLength < STRKEYRECDEF_MaxStrlength
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
      {Goto error;}
    end;
    ReadUntilSpace;    
    STRING_Constant(KeyString, SubBuffer, SubBufferLength);
    if not STRTOMKEY_GetMkey(KeyString, mkey)
    then begin
      FILES_WriteString(logfile, 'No mkey found for: ', 0, true);
      FILES_WriteString(logfile, KeyString, 0, true);
      FILES_WriteLine(logfile, true);
      NrRejected := NrRejected+1;
      {goto error;}
    end;

    commentline := '';
    if not ReadStr(LImcomment_MaxStrLength, commentline)
    then begin
      FILES_WriteString(logfile, 'Incomplete commentline for mkey: ', 0, true);
      FILES_WriteString(logfile, KeyString, 0, true);
      FILES_WriteLine(logfile, true);
      NrRejected := NrRejected+1;
      Goto error;
    end;

    CISAM_Write(mcommentFile, Sizeof(mcommentRec));
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
  CISAM_Close(mcommentFile);
  STRTOKEY_CloseSkey;
  STRTOMKEY_CloseMkey;
  FILES_Close(textfile);
  FILES_Close(logfile);
END.
