(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LIMCOMMENT
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
EXPORT(LIMCOMMENT);
pragma C_Include('logname.pf');
pragma C_Include('limcomment.pf');
pragma C_Include('string.pf');
pragma C_Include('cisam.pf');

PROGRAM LIMCOMMENT;
WITH LOGNAME, STRNG, CISAM;
WITH LOOPHOLES;

VAR
   McommentDict: CISAM_FileType;
   McommentRec : LIMCOMMENT_RecordDef;
   InitStr     : LIMCOMMENT_CommentType;



 PROCEDURE LIMCOMMENT_OpenMcommentRead;
VAR
   i : INTEGER;
BEGIN {LIMCOMMENT_OpenMcomment}
   McommentDict := CISAM_InitFile(LOGNAME_findfile(Logname_Tr('Mcomment')), 8,
                   Adr(McommentRec), SizeOf(McommentRec), CISAM_indexed);
   CISAM_DefineKey(McommentDict, Adr(McommentRec.mkey) - Adr(McommentRec), 
                    SizeOf(McommentRec.mkey), 
                    CISAM_Value, CISAM_Duplicate, CISAM_Up);
   CISAM_Open(McommentDict, CISAM_inp, CISAM_Old);
   FOR i := 1 TO LIMCOMMENT_MaxStrLength DO InitStr := ' ';
END {LIMCOMMENT_OpenMcomment};


 PROCEDURE LIMCOMMENT_OpenMcommentWrite;
VAR
   i : INTEGER;
BEGIN {LIMCOMMENT_OpenMcommentWrite}
   McommentDict := CISAM_InitFile(LOGNAME_findfile(Logname_Tr('Mcomment')), 8,
                   Adr(McommentRec), SizeOf(McommentRec), CISAM_indexed);
   CISAM_DefineKey(McommentDict, Adr(McommentRec.mkey) - Adr(McommentRec), 
                    SizeOf(McommentRec.mkey), 
                    CISAM_Value, CISAM_Duplicate, CISAM_Up);
   CISAM_Open(McommentDict, CISAM_out, CISAM_New);
   FOR i := 1 TO LIMCOMMENT_MaxStrLength DO InitStr := ' ';
END {LIMCOMMENT_OpenMcommentWrite};


 PROCEDURE LIMCOMMENT_OpenMcommentUpdate;
VAR
   i : INTEGER;
BEGIN {LIMCOMMENT_OpenMcommentUpdate}
   McommentDict := CISAM_InitFile(LOGNAME_findfile(Logname_Tr('Mcomment')), 8,
                   Adr(McommentRec), SizeOf(McommentRec), CISAM_indexed);
   CISAM_DefineKey(McommentDict, Adr(McommentRec.mkey) - Adr(McommentRec), 
                    SizeOf(McommentRec.mkey), 
                    CISAM_Value, CISAM_Duplicate, CISAM_Up);
   CISAM_FileSharing(McommentDict, CISAM_IO);
   CISAM_Open(McommentDict, CISAM_IO, CISAM_Old);
   FOR i := 1 TO LIMCOMMENT_MaxStrLength DO InitStr := ' ';
END {LIMCOMMENT_OpenMcommentUpdate};


 FUNCTION LIMCOMMENT_GetCommentLine(skey, mkey: INTEGER;
                                      VAR commentline: STRING_String): BOOLEAN;
VAR
   str    : STRING_String;
   status : CISAM_StatusType;
   recsize: INTEGER;
   found, 
   exitloop  : BOOLEAN;
BEGIN {LIMCOMMENT_GetCommentLine}
   CISAM_ReadByKey(McommentDict, recsize, Adr(mkey), SizeOf(mkey));
   status    := CISAM_OwnStatus;
   found := false;
   IF status = CISAM_NoError THEN BEGIN
      IF McommentRec.skey <> skey
      THEN BEGIN
        exitloop := false;
        REPEAT
          CISAM_ReadNext(McommentDict, recsize);
          status := CISAM_OwnStatus;
          IF status = CISAM_NoError THEN 
            IF McommentRec.mkey <> mkey  
            THEN exitloop := true
            ELSE BEGIN
              IF McommentRec.skey = skey
              THEN BEGIN
                found := true;
                exitloop := true;
              END
            END
          ELSE exitloop := true;
        UNTIL exitloop;
      END
      ELSE found := true;
   END;
   IF found
   THEN BEGIN
      STRING_Constant(str, McommentRec.commentline, LIMCOMMENT_MaxStrLength);
      STRING_Trim(commentline, str);
      LIMCOMMENT_GetCommentLine := TRUE
      END
   ELSE BEGIN
      LIMCOMMENT_GetCommentLine := FALSE
   END;
END {LIMCOMMENT_GetCommentLine};


 FUNCTION LIMCOMMENT_GetNextCommentLine(skey, mkey: INTEGER;
                                      VAR commentline: STRING_String): BOOLEAN;
VAR
   str    : STRING_String;
   status : CISAM_StatusType;
   recsize: INTEGER;
   found, 
   exitloop  : BOOLEAN;
BEGIN {LIMCOMMENT_GetNextCommentLine}
   found := false;
   exitloop := false;
   REPEAT
     CISAM_ReadNext(McommentDict, recsize);
     status := CISAM_OwnStatus;
     IF status = CISAM_NoError THEN 
        IF McommentRec.mkey <> mkey  
        THEN exitloop := true
        ELSE BEGIN 
          IF McommentRec.skey = skey
          THEN BEGIN
            found := true;
            exitloop := true;
          END
        END
     ELSE exitloop := true;
   UNTIL exitloop;     
   IF found
   THEN BEGIN
      STRING_Constant(str, McommentRec.commentline, LIMCOMMENT_MaxStrLength);
      STRING_Trim(commentline, str);
      LIMCOMMENT_GetNextCommentLine := TRUE
      END
   ELSE BEGIN
      LIMCOMMENT_GetNextCommentLine := FALSE
   END;
END {LIMCOMMENT_GetNextCommentLine};


 FUNCTION LIMCOMMENT_WriteSequential(skey, mkey: integer;
                                             commentline: STRING_String
                                            ): BOOLEAN;
VAR
   status : CISAM_StatusType;
   len : String_Range;
BEGIN
   McommentRec.skey := skey;
   McommentRec.mkey := mkey;
   McommentRec.commentline := InitStr;
   STRING_ExtractChars(McommentRec.commentline, len, commentline,
                       1, LIMCOMMENT_MaxStrLength);
   CISAM_Write(McommentDict, SizeOf(McommentRec));
   status := CISAM_OwnStatus;
   LIMCOMMENT_WriteSequential := status = CISAM_NoError;
END {LIMCOMMENT_WriteSequential};
  

 FUNCTION LIMCOMMENT_Update(commentline: STRING_String): CISAM_Statustype;
VAR
   status : CISAM_StatusType;
   len: String_Range;
BEGIN
   McommentRec.commentline := InitStr;
   STRING_ExtractChars(McommentRec.commentline, len, commentline,
                       1, LIMCOMMENT_MaxStrLength);
   CISAM_Update(McommentDict, SizeOf(McommentRec));
   status := CISAM_OwnStatus;
   LIMCOMMENT_Update := status;
END {LIMCOMMENT_Update};


 FUNCTION LIMCOMMENT_Delete: CISAM_Statustype;
VAR
   status : CISAM_StatusType;
BEGIN
   CISAM_Delete(McommentDict);
   status := CISAM_OwnStatus;
   LIMCOMMENT_Delete := status;
END {LIMCOMMENT_Delete};



 PROCEDURE LIMCOMMENT_Release;
BEGIN {LIMCOMMENT_Release}
   CISAM_Release(McommentDict)
END {LIMCOMMENT_Release};

 PROCEDURE LIMCOMMENT_CloseMcomment;
BEGIN {LIMCOMMENT_CloseMcomment}
   CISAM_Close(McommentDict)
END {LIMCOMMENT_CloseMcomment};

