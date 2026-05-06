(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LDMDICT
 *  Creation date   :  7-JAN-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : Implementation of the abstract datatype MDICT.
 *                    The module provides I/O functions for accessing
 *                    AMDICT and GMDICT.
 *
 *EMP:::===================================================================*)

pragma C_Include('strings.pf');
Export(LDMDICT);
pragma C_Include('logname.pf');
pragma C_Include('cisam.pf');
pragma C_Include('globdef.pf');
pragma C_Include('interface1.pf');
pragma C_Include('str.pf');
pragma C_Include('string.pf');
pragma C_Include('debug.pf');
pragma C_Include('limorfdef.pf');
pragma C_Include('lsphondef.pf');
pragma C_Include('mdictdef.pf');
pragma C_Include('ldmdict.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM LDMDICT;
WITH     LOGNAME,
         CISAM,
         GLOBDEF,
         INTERFACE1,
         STR,
         STRNG,
         DEBUG,
         LIMORFDEF,
         LSPHONDEF,
         MDICTDEF;
WITH LOOPHOLES;

VAR
   buffer: MDICTDEF_RecordDef;
   MDict : CISAM_FileType;
   InitStem: LDMDICT_StemType;

PROCEDURE LDMDICT_OpenMdict;
VAR
   i : INTEGER;
BEGIN

   IF GLOBDEF_GetAnGenMode = anmode THEN
      MDict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('amdict')), 6,
                            Adr(buffer), SizeOf(buffer), CISAM_indexed)
   ELSE
      MDict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('gmdict')), 6,
                            Adr(buffer), SizeOf(buffer), CISAM_indexed);

   CISAM_DefineKey(MDict, Adr(buffer.stem)-Adr(buffer), SizeOf(buffer.stem),
                    CISAM_String, CISAM_Duplicate, CISAM_Up);
   CISAM_DefineKey(MDict, Adr(buffer.KEY)-Adr(buffer), SizeOf(buffer.KEY),
                    CISAM_Value, CISAM_Duplicate, CISAM_Up);
{
   CISAM_OptimizeMemory(MDict, 127);
   CISAM_OptimizeBucket(MDict, 4, 0);
   CISAM_OptimizeBucket(MDict, 4, 1);
}
   CISAM_Open(MDict, CISAM_inp, CISAM_old);
   FOR i:=1 TO LDMDICT_MAXSTEM DO InitStem[i] := ' ';

END {LDMDICT_OpenMdict};


PROCEDURE LDMDICT_OpenMDictWrite;

BEGIN

   MDict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('mdict')), 5,
                            Adr(buffer), SizeOf(buffer), CISAM_indexed);
   CISAM_DefineKey(MDict, Adr(buffer.stem)-Adr(buffer), SizeOf(buffer.stem),
                    CISAM_String, CISAM_Duplicate, CISAM_Up);
   CISAM_DefineKey(MDict, Adr(buffer.KEY)-Adr(buffer), SizeOf(buffer.KEY),
                    CISAM_Value, CISAM_Duplicate, CISAM_Up);
{
   CISAM_OptimizeMemory(MDict, 127);
   CISAM_OptimizeBucket(MDict, 4, 0);
   CISAM_OptimizeBucket(MDict, 4, 1);
   CISAM_SetOption(MDict, CISAM_FabDFW, 0, TRUE);
}
   CISAM_Open(MDict, CISAM_out, CISAM_new);

END {LDMDICT_OpenMDictWrite};


PROCEDURE LDMDICT_OpenMDictUpdate;
var
   i : INTEGER;
BEGIN
   MDict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('mdict')), 5, 
                            Adr(buffer), SizeOf(buffer), CISAM_indexed);
   CISAM_DefineKey(MDict, Adr(buffer.stem)-Adr(buffer), SizeOf(buffer.stem),
                    CISAM_String, CISAM_Duplicate, CISAM_Up);
   CISAM_DefineKey(MDict, Adr(buffer.KEY)-Adr(buffer), SizeOf(buffer.KEY),
                    CISAM_Value, CISAM_Duplicate, CISAM_Up);
   CISAM_FileSharing(MDict, CISAM_IO);
{
   CISAM_SetOption(MDict, CISAM_RabRrl, 0, true);
}
   CISAM_Open(MDict, CISAM_IO,CISAM_old);
   FOR i:=1 TO LDMDICT_MAXSTEM DO InitStem[i] := ' ';

END {LDMDICT_OpenMDictUpdate};




FUNCTION LDMDICT_GetAMdict(stem     : STRING_String;
                                    VAR kind : INTERFACE1_KeyType;
                                    VAR CC   : LIMORFDEF_ContextConds;
                                    VAR FON  : LIMORFDEF_pPhonInfo;
                                    VAR Where: LDMDICT_WhereType;
                                    VAR KEY  : INTEGER)
                                    : BOOLEAN; 
VAR 
   status : CISAM_StatusType;
   LSFON  : LSPHONDEF_pPhonInfo;
   helpstem: STRING(LDMDICT_MaxStem);
   newstem: LDMDICT_StemType;
   len1   : Str_Range;
   len2   : String_Range;
   recsize: INTEGER;
   j      : INTEGER;
BEGIN
   DEBUG_WriteStr('-> MDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   newstem := InitStem;
   len1    := STRING_length(stem);
   STRING_ExtractChars(helpstem, len2, stem, 1, len1);
   FOR j:=1 TO len2 DO newstem[j] := helpstem[j];
   DEBUG_WriteStr(newstem,DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
   CISAM_SetIndex(MDict, 1);
   CISAM_ReadByKey(MDict, recsize, Adr(newstem), SizeOf(newstem));
   status    := CISAM_OwnStatus;
   IF status = CISAM_NoError THEN BEGIN
      kind := buffer.kind;
      CC   := buffer.CC;
      where:= buffer.where;
      LSFON := LSPHONDEF_MakePhonInfo; LSFON^ := buffer.FON;

      (*-------------------------------------------------------------------*
       * A type-cast operation in order to be able to transport LS phonetical
       * information to LI calling function.
       *-------------------------------------------------------------------*)

      FON  := Retype(LSFON,LIMORFDEF_pPhonInfo);
      KEY  := buffer.key;
      DEBUG_WriteInteger(KEY, 5, TRUE);
      Debug_WriteLine(TRUE);
      LDMDICT_GetAMDict := true;
      END
   ELSE BEGIN
      DEBUG_WriteStr('String not found',DEBUG_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
      LDMDICT_GetAMDict := false;
   END;

   DEBUG_WriteStr('<- MDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LDMDICT_GetMdict};


FUNCTION LDMDICT_GetNextAMDict(stem     : STRING_String;
                                        VAR kind : INTERFACE1_KeyType;
                                        VAR CC   : LIMORFDEF_ContextConds;
                                        VAR FON  : LIMORFDEF_pPhonInfo;
                                        VAR Where: LDMDICT_WhereType;
                                        VAR KEY  : INTEGER)
                                        : BOOLEAN; 
VAR 
   status : CISAM_StatusType;
   LSFON  : LSPHONDEF_pPhonInfo;
   newstem: LDMDICT_StemType;
   len1,
   len2   : INTEGER;
   recsize   : INTEGER;
BEGIN
   DEBUG_WriteStr('-> MDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   CISAM_ReadNext(MDict, recsize);
   status := CISAM_OwnStatus;
   IF status = CISAM_NoError THEN BEGIN
      IF stem = buffer.stem THEN BEGIN

         kind := buffer.kind;
         CC   := buffer.CC;
         where:= buffer.where;

         LSFON := LSPHONDEF_MakePhonInfo; LSFON^ := buffer.FON;
   
         (*-------------------------------------------------------------------*
          * A type-cast operation in order to be able to transport LS phonetical
          * information to LI calling function.
          *-------------------------------------------------------------------*)
   
         FON  := Retype(LSFON,LIMORFDEF_pPhonInfo);
         KEY  := buffer.key;
         DEBUG_WriteInteger(KEY, 5, TRUE);
         Debug_WriteLine(TRUE);
         LDMDICT_GetNextAMDict := true;
         END
      ELSE BEGIN
         LDMDICT_GetNextAMDict := false;
      END
      END
   ELSE BEGIN
      DEBUG_WriteStr('String not found',DEBUG_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
      LDMDICT_GetNextAMDict := false;
   END;

   DEBUG_WriteStr('<- MDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LDMDICT_GetMdict};


FUNCTION LDMDICT_GetGMdict(VAR stem : STRING_String;
                                    kind     : INTERFACE1_KeyType;
                                    VAR CC   : LIMORFDEF_ContextConds;
                                    VAR FON  : LIMORFDEF_pPhonInfo;
                                    VAR Where: LDMDICT_WhereType;
                                    KEY  : INTEGER)
                                    : BOOLEAN; 
VAR 
   status : CISAM_StatusType;
   LSFON  : LSPHONDEF_pPhonInfo;
   newstem: String(LDMDICT_MaxStem);
   len1   : Str_Range;
   found  : BOOLEAN;
   recsize: INTEGER;
   intstat: INTEGER;
BEGIN
   DEBUG_WriteStr('-> MDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
   found := FALSE;
   CISAM_SetIndex(MDict, 2);
   CISAM_ReadByKey(MDict, recsize, Adr(KEY), SizeOf(KEY));
   status := CISAM_OwnStatus;
   intstat := CISAM_IntegerStatus;
   DEBUG_WriteInteger(intstat, 5, TRUE);
   Debug_WriteLine(TRUE);
   IF status = CISAM_NoError THEN BEGIN
      IF ( KEY = buffer.KEY ) AND ( kind = buffer.kind ) THEN BEGIN
	 found := TRUE;
	 STR_Trim(newstem, len1, buffer.stem, LDMDICT_MAXSTEM);
	 STRING_Constant(stem, newstem, len1);
	 kind := buffer.kind;
	 CC   := buffer.CC;
         where:= buffer.where;
	 LSFON := LSPHONDEF_MakePhonInfo; LSFON^ := buffer.FON;
   
	 (*-------------------------------------------------------------------*
	  * A type-cast operation in order to be able to transport LS phonetical
	  * information to LI calling function.
	  *-------------------------------------------------------------------*)
   
	 FON  := Retype(LSFON,LIMORFDEF_pPhonInfo);
	 DEBUG_WriteString(stem,Debug_MaxIO,TRUE);
	 Debug_WriteLine(TRUE);
	 END
      ELSE IF ( KEY = buffer.KEY ) THEN BEGIN
	 found := LDMDICT_GetNextGMDict(stem, kind, CC, FON, where, KEY);
      END
   END;

   LDMDICT_GetGMDict := found;

   IF not found THEN BEGIN
      DEBUG_WriteStr('Key not found',DEBUG_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
   END;

   DEBUG_WriteStr('<- MDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LDMDICT_GetGMdict};


FUNCTION LDMDICT_GetNextGMDict(VAR stem : STRING_String;
                                        kind     : INTERFACE1_KeyType;
                                        VAR CC   : LIMORFDEF_ContextConds;
                                        VAR FON  : LIMORFDEF_pPhonInfo;
                                        VAR Where: LDMDICT_WhereType;
                                        KEY      : INTEGER)
                                        : BOOLEAN; 
VAR 
   status : CISAM_StatusType;
   LSFON  : LSPHONDEF_pPhonInfo;
   newstem: String(LDMDICT_MaxStem);
   len1   : Str_Range;
   newkey,
   found  : BOOLEAN;
   recsize: INTEGER;
BEGIN
   DEBUG_WriteStr('-> MDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
   found := FALSE;
   newkey := FALSE;
   REPEAT
      CISAM_ReadNext(MDict, recsize);
      status := CISAM_OwnStatus;
      IF status = CISAM_NoError THEN BEGIN
	 IF ( KEY = buffer.KEY ) AND ( kind = buffer.kind ) THEN BEGIN
            found := TRUE;
	    STR_Trim(newstem, len1, buffer.stem, LDMDICT_MAXSTEM);
	    STRING_Constant(stem, newstem, len1);
	    kind := buffer.kind;
	    CC   := buffer.CC;
            where:= buffer.where;
	    LSFON := LSPHONDEF_MakePhonInfo; LSFON^ := buffer.FON;
   
	    (*-------------------------------------------------------------------*
	     * A type-cast operation in order to be able to transport LS phonetical
	     * information to LI calling function.
	     *-------------------------------------------------------------------*)
   
	    FON  := Retype(LSFON,LIMORFDEF_pPhonInfo);
	    DEBUG_WriteString(stem,Debug_MaxIO,TRUE);
	    Debug_WriteLine(TRUE);
            END
         ELSE IF ( KEY <> buffer.KEY ) THEN BEGIN
            newkey := TRUE
	 END
      END
   UNTIL found OR newkey OR ( status <> CISAM_NoError );

   LDMDICT_GetNextGMDict := found;

   IF not found THEN BEGIN
      DEBUG_WriteStr('String not found',DEBUG_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
   END;
   DEBUG_WriteStr('<- MDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LDMDICT_GetNextGMdict};


FUNCTION LDMDICT_WriteSequential(rec: LDMDICT_pMDictStruct): BOOLEAN;
VAR
   b    : ^MDICTDEF_RecordDef;
   status : CISAM_StatusType;
   int    : INTEGER;
BEGIN
   Retype(b,LDMDICT_pMDICTStruct):= rec;
   buffer := b^;
   CISAM_Write(Mdict, SizeOf(buffer));
   int := CISAM_IntegerStatus;
   status := CISAM_OwnStatus;
   LDMDICT_WriteSequential := status = CISAM_NoError;
END {LDMDICT_WriteSequential};


FUNCTION LDMDICT_Update(rec: LDMDICT_pMDictStruct): CISAM_StatusType;
VAR
   b    : ^MDICTDEF_RecordDef;
   status : CISAM_StatusType;
   int    : INTEGER;
BEGIN
   Retype(b,LDMDICT_pMDICTStruct):= rec;
   buffer := b^;
   CISAM_Update(Mdict, SizeOf(buffer));
   int := CISAM_IntegerStatus;
   status := CISAM_OwnStatus;
   LDMDICT_Update := status;
END {LDMDICT_Update};


FUNCTION LDMDICT_Delete: CISAM_StatusType;
VAR
   status : CISAM_StatusType;
   int    : INTEGER;
BEGIN
   CISAM_Delete(Mdict);
   int := CISAM_IntegerStatus;
   status := CISAM_OwnStatus;
   LDMDICT_Delete := status;
END {LDMDICT_Delete};

PROCEDURE LDMDICT_Release;
BEGIN
   CISAM_Release(MDICT);
END {LDMDICT_Release};

PROCEDURE LDMDICT_Reset;
BEGIN
   CISAM_Reset(MDICT);
END {LDMDICT_Reset};


PROCEDURE LDMDICT_CloseMDict;
BEGIN
   CISAM_Close(MDict);
END {LDMDICT_CloseMDict};

PROCEDURE LDMDICT_ReadRegardless(b: BOOLEAN);
VAR
   status : CISAM_StatusType;
BEGIN
{
   CISAM_SetOption(MDict, CISAM_RabRrl, 0, b);
}   status := CISAM_OwnStatus;
END {LDMDICT_ReadRegardless};

FUNCTION LDMDICT_GetNextMDict(VAR KEY  : INTEGER): BOOLEAN; 
VAR 
   status : CISAM_StatusType;
   LSFON  : LSPHONDEF_pPhonInfo;
   newstem: LDMDICT_StemType;
   len1,
   len2   : INTEGER;
   recsize   : INTEGER;
BEGIN
   DEBUG_WriteStr('-> MDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   CISAM_ReadNext(MDict, recsize);
   status := CISAM_OwnStatus;
   IF status = CISAM_NoError THEN BEGIN
         KEY  := buffer.key;
         DEBUG_WriteInteger(KEY, 5, TRUE);
         Debug_WriteLine(TRUE);
         LDMDICT_GetNextMDict := true;
      END
   ELSE BEGIN
      DEBUG_WriteStr('Record not found',DEBUG_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
      LDMDICT_GetNextMDict := false;
   END;

   DEBUG_WriteStr('<- MDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LDMDICT_GetMdict};


