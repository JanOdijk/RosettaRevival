(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LISCOMMENT
 *  Creation date   : 16-OKT-1990
 *  Author          : Frank Uittenbogaard
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
EXPORT(LISCOMMENT);
pragma C_Include('logname.pf');
pragma C_Include('liscomment.pf');
pragma C_Include('string.pf');
pragma C_Include('cisam.pf');


PROGRAM LISCOMMENT;
WITH LOGNAME, CISAM, STRNG;
WITH LOOPHOLES;

VAR
   ScommentDict: CISAM_FileType;
   ScommentRec : LISCOMMENT_RecordDef;
   InitStr     : LISCOMMENT_CommentType;



 PROCEDURE LISCOMMENT_OpenScommentRead;
VAR
   i : INTEGER;
BEGIN {LISCOMMENT_OpenScomment}
   ScommentDict := CISAM_InitFile(LOGNAME_findfile(Logname_Tr('scomment')), 8,
                    Adr(ScommentRec.skey), SizeOf(ScommentRec), 
                    CISAM_indexed);
   CISAM_DefineKey(ScommentDict, Adr(ScommentRec.skey)-Adr(ScommentRec),
                    SizeOf(ScommentRec.skey), 
                    CISAM_Value, CISAM_Duplicate, CISAM_Up);
   CISAM_Open(ScommentDict, CISAM_inp, CISAM_Old);
   FOR i := 1 TO LISCOMMENT_MaxStrLength DO InitStr := ' ';
END {LISCOMMENT_OpenScomment};


 PROCEDURE LISCOMMENT_OpenScommentWrite;
VAR
   i : INTEGER;
BEGIN {LISCOMMENT_OpenScommentWrite}
   ScommentDict := CISAM_InitFile(LOGNAME_findfile(Logname_Tr('scomment')),8,
                    Adr(ScommentRec), SizeOf(ScommentRec), CISAM_indexed);
   CISAM_DefineKey(ScommentDict, Adr(ScommentRec.skey)-Adr(ScommentRec),
                    SizeOf(ScommentRec.skey), 
                    CISAM_Value, CISAM_Duplicate, CISAM_Up);
   CISAM_Open(ScommentDict, CISAM_out, CISAM_New);
   FOR i := 1 TO LISCOMMENT_MaxStrLength DO InitStr := ' ';
END {LISCOMMENT_OpenScommentWrite};


 PROCEDURE LISCOMMENT_OpenScommentUpdate;
VAR
   i : INTEGER;
BEGIN {LISCOMMENT_OpenScommentUpdate}
   ScommentDict := CISAM_InitFile(LOGNAME_findfile(Logname_Tr('scomment')), 8,
                   Adr(ScommentRec), SizeOf(ScommentRec), CISAM_indexed);
   CISAM_DefineKey(ScommentDict, Adr(ScommentRec.skey)-Adr(ScommentRec),
                    SizeOf(ScommentRec.skey), 
                    CISAM_Value, CISAM_Duplicate, CISAM_Up);
   CISAM_FileSharing(ScommentDict, CISAM_IO);
   CISAM_Open(ScommentDict, CISAM_IO, CISAM_Old);
   FOR i := 1 TO LISCOMMENT_MaxStrLength DO InitStr := ' ';
END {LISCOMMENT_OpenScommentUpdate};


 FUNCTION LISCOMMENT_GetCommentLine(skey: INTEGER;
                                      VAR commentline: STRING_String): BOOLEAN;
VAR
   str    : STRING_String;
   status : CISAM_StatusType;
   recsize: INTEGER;
BEGIN {LISCOMMENT_GetCommentLine}
   CISAM_ReadByKey(ScommentDict, recsize, Adr(skey), SizeOf(skey));
   status    := CISAM_OwnStatus;
   IF status = CISAM_NoError THEN BEGIN
      STRING_Constant(str, ScommentRec.commentline, LISCOMMENT_MaxStrLength);
      STRING_Trim(commentline, str);
      LISCOMMENT_GetCommentLine := TRUE
      END
   ELSE BEGIN
      LISCOMMENT_GetCommentLine := FALSE
   END;
END {LISCOMMENT_GetCommentLine};


 FUNCTION LISCOMMENT_GetNextCommentLine(skey: INTEGER;
                                      VAR commentline: STRING_String): BOOLEAN;
VAR
   str    : STRING_String;
   status : CISAM_StatusType;
   recsize: INTEGER;
BEGIN {LISCOMMENT_GetNextCommentLine}
   CISAM_ReadNext(ScommentDict, recsize);
   status    := CISAM_OwnStatus;
   LISCOMMENT_GetNextCommentLine := FALSE;
   IF status = CISAM_NoError THEN 
      IF ScommentRec.skey = skey
      THEN BEGIN
        STRING_Constant(str, ScommentRec.commentline, LISCOMMENT_MaxStrLength);
        STRING_Trim(commentline, str);
        LISCOMMENT_GetNextCommentLine := TRUE;
      END
END {LISCOMMENT_GetNextCommentLine};


 FUNCTION LISCOMMENT_WriteSequential(skey: integer;
                                             commentline: STRING_String
                                            ): BOOLEAN;
VAR
   status : CISAM_StatusType;
   len: String_Range;
BEGIN
   ScommentRec.skey := skey;
   ScommentRec.CommentLine := InitStr;
   STRING_ExtractChars(ScommentRec.Commentline, len, commentline, 
                       1, LISCOMMENT_MaxStrLength);
   CISAM_Write(ScommentDict, SizeOf(ScommentRec));
   status := CISAM_OwnStatus;
   LISCOMMENT_WriteSequential := status = CISAM_NoError;
END {LISCOMMENT_WriteSequential};
  

 FUNCTION LISCOMMENT_Update(commentline: STRING_String): CISAM_Statustype;
VAR
   status : CISAM_StatusType;
   len: String_Range;
BEGIN
   ScommentRec.CommentLine := InitStr;
   STRING_ExtractChars(ScommentRec.Commentline, len, commentline, 
                       1, LISCOMMENT_MaxStrLength);
   CISAM_Update(ScommentDict, SizeOf(ScommentRec));
   status := CISAM_OwnStatus;
   LISCOMMENT_Update := status;
END {LISCOMMENT_Update};


 FUNCTION LISCOMMENT_Delete: CISAM_Statustype;
VAR
   status : CISAM_StatusType;
BEGIN
   CISAM_Delete(ScommentDict);
   status := CISAM_OwnStatus;
   LISCOMMENT_Delete := status;
END {LISCOMMENT_Delete};



 PROCEDURE LISCOMMENT_Release;
BEGIN {LISCOMMENT_Release}
   CISAM_Release(ScommentDict)
END {LISCOMMENT_Release};

 PROCEDURE LISCOMMENT_CloseScomment;
BEGIN {LISCOMMENT_CloseScomment}
   CISAM_Close(ScommentDict)
END {LISCOMMENT_CloseScomment};

