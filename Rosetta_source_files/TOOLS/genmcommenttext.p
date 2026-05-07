(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : GENMCOMMENTTEXT
 *  Creation date   : 25 MARCH 1991
 *  Author          : Frank Uittenbogaard                                  
 *                                                                  
 *  Copyright (c) 1990, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         : Generates mcomment.dict
 *
 *  Logical Names   : logfile, mcomment (source), mcommenttext (target), 
 *                    askeyfile, mkeyfile
 *
 *EMP:::===================================================================*)

pragma C_Include('cisam.pf');
pragma C_Include('files.pf');
pragma C_Include('string.pf');
pragma C_Include('str.pf');
pragma C_Include('limcomment.pf');
pragma C_Include('strtokey.pf');
pragma C_Include('strtomkey.pf');
pragma C_Include('logname.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
PROGRAM GENMCOMMENTTEXT(Lognames);
WITH CISAM,
     FILES,
     STRNG,
     LOGNAME,
     STR,
     LIMCOMMENT,
     STRTOMKEY,
     STRTOKEY;
WITH LOOPHOLES;


label
  error;
var
  Lognames : Text;
  NewSize: integer;
  logfile,
  textfile: FILES_Text;
  NrRejected,
  NrAccepted: INTEGER;
  Mcommentfile: CISAM_FileType;
  McommentRec : LIMcomment_RecordDef;
  SkeyString,
  MKeyString: STRING_String;

function ReadNextMcomment: boolean;
begin
  CISAM_ReadNext(McommentFile, NewSize);
  ReadNextMcomment := (CISAM_OwnStatus = CISAM_NoError);
end;

BEGIN
  Reset(Lognames);
  Logname_Init(Lognames);

  STRTOKEY_OpenSkeyRead;
  STRTOMKEY_OpenMkeyRead;

  McommentFile := CISAM_InitFile(LogName_Tr('Mcomment'), 8, 
                  Adr(McommentRec), SIZEof(McommentRec), CISAM_indexed);
  CISAM_DefineKey(McommentFile, Adr(McommentRec.mkey)-Adr(McommentRec), 
                   SIZEof(McommentRec.mkey), 
                   CISAM_Value, CISAM_Duplicate, CISAM_Up);
  CISAM_FileSharing(McommentFile, CISAM_out
                    {[CISAM_out,CISAM_Inp,CISAM_Upd,CISAM_Del]});
  CISAM_Open(McommentFile, CISAM_Inp, CISAM_Old);

  FILES_Open(logfile,'logfile',7,3);
  FILES_Open(textfile,'Mcommenttext',12,3);

  NrAccepted := 0;
  NrRejected := 0;
  while ReadNextMcomment do with McommentRec do
  begin
    if not STRTOKEY_GetSkeyStr(skey, SKeyString)
    then begin
      NrRejected := NrRejected+1;
      FILES_WriteString(logfile, 'No skey found for: ', 0, true);
      FILES_WriteInteger(logfile, skey, 10, true);
      FILES_WriteLine(logfile, true);
      goto error;
    end;
    FILES_WriteString(textfile, SKeyString, STRING_Length(SKeyString)+1, true);
    if not STRTOMKEY_GetMkeyStr(mkey, MKeyString)
    then begin
      NrRejected := NrRejected+1;
      FILES_WriteString(logfile, 'No mkey found for: ', 0, true);
      FILES_WriteInteger(logfile, mkey, 10, true);
      FILES_WriteString(logfile, ' and skey: ', 0, true);
      FILES_WriteString(logfile, SKeyString, STRING_Length(SKeyString)+1, true);
      FILES_WriteLine(logfile, true);
      FILES_WriteLine(textfile, true);
      goto error;
    end;
    FILES_WriteString(textfile, MKeyString, STRING_Length(MKeyString)+1, true);
    FILES_WriteStr(textfile, commentline, LIMCOMMENT_MaxStrLength,
                   LIMCOMMENT_MaxStrLength, true);
    FILES_WriteLine(textfile, true);
    NrAccepted := NrAccepted+1;
  end;
error:
  FILES_WriteString(logfile,'Number of processed records: ', 0, true);
  FILES_WriteInteger(logfile,NrAccepted,8,true);
  FILES_WriteLine(logfile, true);
  FILES_WriteString(logfile,'Number of keys not found: ', 0, true);
  FILES_WriteInteger(logfile,NrRejected,8,true);
  FILES_WriteLine(logfile, true);
  CISAM_Close(McommentFile);
  STRTOKEY_CloseSkey;
  STRTOMKEY_CloseMkey;
  FILES_Close(textfile);
  FILES_Close(logfile);
END.
