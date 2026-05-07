(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : GENSCOMMENTTEXT
 *  Creation date   : 25 MARCH 1991
 *  Author          : Frank Uittenbogaard                                  
 *                                                                  
 *  Copyright (c) 1990, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         : Generates scomment.dict
 *
 *  Logical Names   : logfile, scomment (source), scommenttext (target), 
 *                    askeyfile
 *
 *EMP:::===================================================================*)

pragma C_Include('cisam.pf');
pragma C_Include('files.pf');
pragma C_Include('string.pf');
pragma C_Include('str.pf');
pragma C_Include('liscomment.pf');
pragma C_Include('strtokey.pf');
pragma C_Include('logname.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
PROGRAM GENSCOMMENTTEXT(Lognames);
WITH CISAM,
     FILES,
     STRNG,
     LOGNAME,
     STR,
     LISCOMMENT,
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
  Scommentfile: CISAM_FileType;
  ScommentRec : LIScomment_RecordDef;
  SkeyString: STRING_String;

function ReadNextScomment: boolean;
begin
  CISAM_ReadNext(ScommentFile, NewSize);
  ReadNextScomment := (CISAM_OwnStatus = CISAM_NoError);
end;

BEGIN
  Reset(Lognames);
  Logname_Init(Lognames);

  STRTOKEY_OpenSkeyRead;

  ScommentFile := CISAM_InitFile(LogName_Tr('scomment'), 8, 
                  Adr(ScommentRec), SIZEof(ScommentRec), CISAM_indexed);
  CISAM_DefineKey(ScommentFile, Adr(ScommentRec.skey)- Adr(ScommentRec),
                  SIZEof(ScommentRec.skey), 
                   CISAM_Value, CISAM_Duplicate, CISAM_Up);
  CISAM_FileSharing(ScommentFile, CISAM_out
                    {[CISAM_out,CISAM_Inp,CISAM_Upd,CISAM_Del]});
  CISAM_Open(ScommentFile, CISAM_Inp, CISAM_Old);

  FILES_Open(logfile,'logfile',7,3);
  FILES_Open(textfile,'Scommenttext',12,3);

  NrAccepted := 0;
  NrRejected := 0;
  while ReadNextScomment do with ScommentRec do
  begin
    if not STRTOKEY_GetSKeyStr(skey, SKeyString)
    then begin
      NrRejected := NrRejected+1;
      FILES_WriteString(logfile, 'No skey found for: ', 0, true);
      FILES_WriteInteger(logfile, skey, 10, true);
      FILES_WriteLine(logfile, true);
      goto error;
    end;
    FILES_WriteString(textfile, SKeyString, STRING_Length(SKeyString)+1, true);
    FILES_WriteStr(textfile, commentline, LISCOMMENT_MaxStrLength, 
                       LISCOMMENT_MaxStrLength, true);
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
  CISAM_Close(ScommentFile);
  STRTOKEY_CloseSkey;
  FILES_Close(textfile);
  FILES_Close(logfile);
END.
