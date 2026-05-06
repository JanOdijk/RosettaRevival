(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LIILDict
 *  Creation date   :  7-JAN-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : Implementation of the abstract datatype ILDict.
 *                    The module provides I/O functions for accessing
 *                    ILDict.
 *
 *EMP:::===================================================================*)

Export(LIILDICT);
pragma C_Include('globdef.pf');
pragma C_Include('logname.pf');
pragma C_Include('log.pf');
pragma C_Include('debug.pf');
pragma C_Include('cisam.pf');
pragma C_Include('liildict.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM LIILDict;
WITH     LOGNAME,
         CISAM,
         GLOBDEF,
         LOG,
         DEBUG;
WITH LOOPHOLES;

VAR
   buffer1  : LIILDict_RecordDef;
   ILDict   : CISAM_FileType;


PROCEDURE LIILDict_OpenILDict;
BEGIN

   IF GLOBDEF_GetAnGenMode = AnMode THEN 
      ILDict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('aildict')), 7,
			    Adr(buffer1), SizeOf(buffer1), CISAM_indexed)
   ELSE
      ILDict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('gildict')), 7,
			    Adr(buffer1), SizeOf(buffer1), CISAM_indexed);

   CISAM_DefineKey(ILDict, Adr(buffer1.skey)-Adr(buffer1), SizeOf(buffer1.skey),
		    CISAM_Value, CISAM_Duplicate, CISAM_Up);
   CISAM_DefineKey(ILDict, Adr(buffer1.mkey)-Adr(buffer1), SizeOf(buffer1.mkey),
		    CISAM_Value, CISAM_Duplicate, CISAM_Up);
   CISAM_Open(ILDict, CISAM_inp, CISAM_old);

END {LIILDict_OpenILDict};


PROCEDURE LIILDICT_OpenILDictWrite;

BEGIN

   ILDict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('ildict')), 6,
                            Adr(buffer1), SizeOf(buffer1), CISAM_indexed);
   CISAM_DefineKey(ILDict, Adr(buffer1.skey)-Adr(buffer1), SizeOf(buffer1.skey),
		    CISAM_Value, CISAM_Duplicate, CISAM_Up);
   CISAM_DefineKey(ILDict, Adr(buffer1.mkey)-Adr(buffer1), SizeOf(buffer1.mkey),
		    CISAM_Value, CISAM_Duplicate, CISAM_Up);
{
   CISAM_OptimizeMemory(ILdict, 127);
   CISAM_OptimizeBucket(ILDict, 4, 0);
   CISAM_OptimizeBucket(ILDict, 4, 1);
   CISAM_SetOption(ILDict, CISAM_FabDFW, 0, TRUE);
}
   CISAM_Open(ILDict, CISAM_out, CISAM_new);

END {LIILDICT_OpenILDictWrite};


PROCEDURE LIILDICT_OpenILDictUpdate;

BEGIN

   ILDict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('ildict')), 6,
                            Adr(buffer1), SizeOf(buffer1), CISAM_indexed);
   CISAM_DefineKey(ILDict, Adr(buffer1.skey)-Adr(buffer1), SizeOf(buffer1.skey),
		    CISAM_Value, CISAM_Duplicate, CISAM_Up);
   CISAM_DefineKey(ILDict, Adr(buffer1.mkey)-Adr(buffer1), SizeOf(buffer1.mkey),
		    CISAM_Value, CISAM_Duplicate, CISAM_Up);
   CISAM_FileSharing(IlDict,CISAM_IO);
{
   CISAM_SetOption(ILDict, CISAM_RabRrl, 0, true);
}
   CISAM_Open(ILDict, CISAM_IO, CISAM_old);

END {LIILDICT_OpenILDictUpdate};


FUNCTION LIILDICT_WriteSequential(rec: LIILDICT_RecordDef): BOOLEAN;
VAR
   status : CISAM_StatusType;
BEGIN
   buffer1 := rec;
   CISAM_Write(ILDict, SizeOf(buffer1));
   status := CISAM_OwnStatus;
   LIILDICT_WriteSequential := status = CISAM_NoError;
END {LIILDICT_WriteSequential};


FUNCTION LIILDICT_Update(rec: LIILDICT_RecordDef): CISAM_Statustype;
VAR
   status : CISAM_StatusType;
BEGIN
   buffer1 := rec;
   CISAM_Update(ILDict, SizeOf(buffer1));
   status := CISAM_OwnStatus;
   LIILDICT_Update := status;
END {LIILDICT_Update};


FUNCTION LIILDICT_Delete: CISAM_Statustype;
VAR
   status : CISAM_StatusType;
BEGIN
   CISAM_Delete(ILDict);
   status := CISAM_OwnStatus;
   LIILDICT_Delete := status;
END {LIILDICT_Delete};


FUNCTION LIILDict_GetAILDict(skey     : INTEGER;
                                    VAR rec    : LIILDict_RecordDef)
                                    : BOOLEAN; 
VAR 
   status    : CISAM_StatusType;
   intstat,
   recsize   : INTEGER;
   found, 
   exitloop  : BOOLEAN;
BEGIN
   DEBUG_WriteStr('-> ILDict',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteInteger(skey, 5, TRUE);
   Debug_WriteLine(TRUE);
   CISAM_SetIndex(ILDict, 1);
   CISAM_ReadByKey(ILDict, recsize, Adr(skey), SizeOf(skey));
   status    := CISAM_OwnStatus;
   intstat   := CISAM_IntegerStatus;
   DEBUG_WriteInteger(intstat, 5, TRUE);
   Debug_WriteLine(TRUE);
   found := false;
   IF status = CISAM_NoError THEN BEGIN
      IF buffer1.marked 
      THEN BEGIN
        DEBUG_WriteStr('buffer marked',DEBUG_MaxIO,0,TRUE);
        Debug_WriteLine(TRUE);
        exitloop := false;
        REPEAT
          CISAM_ReadNext(ILDict, recsize);
          intstat   := CISAM_IntegerStatus;
          status := CISAM_OwnStatus;
          DEBUG_WriteInteger(intstat, 5, TRUE);
          Debug_WriteLine(TRUE);
          IF status = CISAM_NoError THEN 
            IF skey <> buffer1.skey  
            THEN exitloop := true
            ELSE BEGIN
              IF NOT buffer1.marked
              THEN BEGIN
                DEBUG_WriteStr('buffer not marked',DEBUG_MaxIO,0,TRUE);
                Debug_WriteLine(TRUE);
                found := true;
                exitloop := true;
                END
              ELSE BEGIN
                DEBUG_WriteStr('buffer marked',DEBUG_MaxIO,0,TRUE);
                Debug_WriteLine(TRUE);
              END
            END
          ELSE exitloop := true;
        UNTIL exitloop;
      END
      ELSE BEGIN
        found := true;
        DEBUG_WriteStr('buffer not marked',DEBUG_MaxIO,0,TRUE);
        Debug_WriteLine(TRUE);
      END;
   END;
   IF found
   THEN BEGIN
      rec := buffer1;
      DEBUG_WriteStr('skey found, corresponding mkey is:',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(rec.mkey, 5, TRUE);
      Debug_WriteLine(TRUE);
      LIILDict_GetAILDict := TRUE;
   END ELSE BEGIN
      DEBUG_WriteStr('skey not found',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(intstat, 5, TRUE);
      Debug_WriteLine(TRUE);
      LIILDict_GetAILDict := FALSE;
   END;

   DEBUG_WriteStr('<- ILDict',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LIILDict_GetAILDict};


FUNCTION LIILDict_GetNextAILDict(skey     : INTEGER;
                                    VAR rec    : LIILDict_RecordDef)
                                    : BOOLEAN; 
VAR 
   status    : CISAM_StatusType;
   intstat,
   recsize   : INTEGER;
   found, 
   exitloop  : BOOLEAN;
BEGIN
   DEBUG_WriteStr('-> ILDict',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
   found := false;
   exitloop := false;
   REPEAT
     CISAM_ReadNext(ILDict, recsize);
     intstat   := CISAM_IntegerStatus;
     status := CISAM_OwnStatus;
     DEBUG_WriteInteger(intstat, 5, TRUE);
     Debug_WriteLine(TRUE);
     IF status = CISAM_NoError THEN 
        IF skey <> buffer1.skey  
        THEN exitloop := true
        ELSE BEGIN
          IF NOT buffer1.marked
          THEN BEGIN
            found := true;
            exitloop := true;
          END
        END
     ELSE exitloop := true;
   UNTIL exitloop;     
   IF found
   THEN BEGIN
     rec := buffer1;
     DEBUG_WriteStr('skey found, corresponding mkey is:',DEBUG_MaxIO,0,TRUE);
     DEBUG_WriteInteger(rec.mkey, 5, TRUE);
     Debug_WriteLine(TRUE);
     LIILDict_GetNextAILDict := TRUE;
   END
   ELSE BEGIN
      DEBUG_WriteStr('skey not found',DEBUG_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
      LIILDict_GetNextAILDict := FALSE;
   END;

   DEBUG_WriteStr('<- ILDict',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LIILDict_GetNextAILDict};


FUNCTION LIILDict_GetGILDict(mkey     : INTEGER;
                                    VAR rec    : LIILDict_RecordDef)
                                    : BOOLEAN; 
VAR 
   status    : CISAM_StatusType;
   intstat,
   recsize   : INTEGER;
   found,
   exitloop  : BOOLEAN;
BEGIN
   DEBUG_WriteStr('-> ILDict',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteInteger(mkey, 5, TRUE);
   Debug_WriteLine(TRUE);
   CISAM_SetIndex(ILDict, 2);
   CISAM_ReadByKey(ILDict, recsize, Adr(mkey), SizeOf(mkey));
   status    := CISAM_OwnStatus;
   intstat   := CISAM_IntegerStatus;
   found := false;
   IF status = CISAM_NoError THEN BEGIN
      IF buffer1.marked 
      THEN BEGIN
        exitloop := false;
        REPEAT
          CISAM_ReadNext(ILDict, recsize);
          intstat   := CISAM_IntegerStatus;
          status := CISAM_OwnStatus;
          DEBUG_WriteInteger(intstat, 5, TRUE);
          Debug_WriteLine(TRUE);
          IF status = CISAM_NoError THEN 
            IF mkey <> buffer1.mkey  
            THEN exitloop := true
            ELSE BEGIN
              IF NOT buffer1.marked
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
      rec := buffer1;
      DEBUG_WriteStr('mkey found, corresponding skey is:',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(rec.skey, 5, TRUE);
      Debug_WriteLine(TRUE);
      LIILDict_GetGILDict := TRUE;
   END 
   ELSE BEGIN
      DEBUG_WriteStr('mkey not found',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(intstat, 5, TRUE);
      Debug_WriteLine(TRUE);
      LIILDict_GetGILDict := FALSE;
   END;

   DEBUG_WriteStr('<- ILDict',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LIILDict_GetILDict};


FUNCTION LIILDict_GetNextGILDict(mkey     : INTEGER;
                                    VAR rec    : LIILDict_RecordDef)
                                    : BOOLEAN; 
VAR 
   status    : CISAM_StatusType;
   intstat,
   recsize   : INTEGER;
   found,
   exitloop  : BOOLEAN;
BEGIN
   DEBUG_WriteStr('-> ILDict',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   found := false;
   exitloop := false;
   REPEAT
     CISAM_ReadNext(ILDict, recsize);
     status := CISAM_OwnStatus;
     intstat  := CISAM_IntegerStatus;
     DEBUG_WriteInteger(intstat, 5, TRUE);
     Debug_WriteLine(TRUE);
     IF status = CISAM_NoError THEN 
        IF Mkey <> buffer1.Mkey  
        THEN exitloop := true
        ELSE BEGIN
          IF NOT buffer1.marked
          THEN BEGIN
            found := true;
            exitloop := true;
          END
        END
     ELSE exitloop := true;
   UNTIL exitloop;     
   IF found
   THEN BEGIN
      rec := buffer1;
      DEBUG_WriteStr('mkey found, corresponding skey is:',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(rec.skey, 5, TRUE);
      Debug_WriteLine(TRUE);
      LIILDict_GetNextGILDict := TRUE;
   END
   ELSE BEGIN
      DEBUG_WriteStr('mkey not found',DEBUG_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
      LIILDict_GetNextGILDict := FALSE;
   END;

   DEBUG_WriteStr('<- ILDict',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LIILDict_GetNextGILDict};



FUNCTION LIILDict_GetAILDictAll(skey     : INTEGER;
                                    VAR rec    : LIILDict_RecordDef)
                                    : BOOLEAN; 
VAR 
   status    : CISAM_StatusType;
   intstat,
   recsize   : INTEGER;
BEGIN
   DEBUG_WriteStr('-> ILDict',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteInteger(skey, 5, TRUE);
   Debug_WriteLine(TRUE);
   CISAM_SetIndex(ILDict, 1);
   CISAM_ReadByKey(ILDict, recsize, Adr(skey), SizeOf(skey));
   status    := CISAM_OwnStatus;
   intstat   := CISAM_IntegerStatus;
   DEBUG_WriteInteger(intstat, 5, TRUE);
   Debug_WriteLine(TRUE);
   IF status = CISAM_NoError THEN BEGIN
      rec := buffer1;
      DEBUG_WriteStr('skey found, corresponding mkey is:',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(rec.mkey, 5, TRUE);
      Debug_WriteLine(TRUE);
      LIILDict_GetAILDictAll := TRUE;
      END
   ELSE BEGIN
      DEBUG_WriteStr('skey not found',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(intstat, 5, TRUE);
      Debug_WriteLine(TRUE);
      LIILDict_GetAILDictAll := FALSE;
   END;

   DEBUG_WriteStr('<- ILDict',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LIILDict_GetAILDictAll};


FUNCTION LIILDict_GetNextAILDictAll(skey     : INTEGER;
                                    VAR rec    : LIILDict_RecordDef)
                                    : BOOLEAN; 
VAR 
   status    : CISAM_StatusType;
   intstat,
   recsize   : INTEGER;
BEGIN
   DEBUG_WriteStr('-> ILDict',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   CISAM_ReadNext(ILDict, recsize);
   intstat   := CISAM_IntegerStatus;
   status := CISAM_OwnStatus;
   DEBUG_WriteInteger(intstat, 5, TRUE);
   Debug_WriteLine(TRUE);
   IF status = CISAM_NoError THEN BEGIN
      IF skey = buffer1.skey  THEN BEGIN
         rec := buffer1;
         DEBUG_WriteStr('skey found, corresponding mkey is:',DEBUG_MaxIO,0,TRUE);
         DEBUG_WriteInteger(rec.mkey, 5, TRUE);
         Debug_WriteLine(TRUE);
	 LIILDict_GetNextAILDictAll := TRUE;
         END
      ELSE BEGIN
         LIILDict_GetNextAILDictAll := FALSE;
      END
      END
   ELSE BEGIN
      DEBUG_WriteStr('skey not found',DEBUG_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
      LIILDict_GetNextAILDictAll := FALSE;
   END;

   DEBUG_WriteStr('<- ILDict',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LIILDict_GetNextAILDictAll};


FUNCTION LIILDict_GetGILDictAll(mkey     : INTEGER;
                                    VAR rec    : LIILDict_RecordDef)
                                    : BOOLEAN; 
VAR 
   status    : CISAM_StatusType;
   intstat,
   recsize   : INTEGER;
BEGIN
   DEBUG_WriteStr('-> ILDict',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteInteger(mkey, 5, TRUE);
   Debug_WriteLine(TRUE);
   CISAM_SetIndex(ILDict, 2);
   CISAM_ReadByKey(ILDict, recsize, Adr(mkey), SizeOf(mkey));
   status    := CISAM_OwnStatus;
   intstat   := CISAM_IntegerStatus;
   IF status = CISAM_NoError THEN BEGIN
      rec := buffer1;
      DEBUG_WriteStr('mkey found, corresponding skey is:',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(rec.skey, 5, TRUE);
      Debug_WriteLine(TRUE);
      LIILDict_GetGILDictAll := TRUE;
      END
   ELSE BEGIN
      DEBUG_WriteStr('mkey not found',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(intstat, 5, TRUE);
      Debug_WriteLine(TRUE);
      LIILDict_GetGILDictAll := FALSE;
   END;

   DEBUG_WriteStr('<- ILDict',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LIILDict_GetILDict};


FUNCTION LIILDict_GetNextGILDictAll(mkey     : INTEGER;
                                    VAR rec    : LIILDict_RecordDef)
                                    : BOOLEAN; 
VAR 
   status    : CISAM_StatusType;
   recsize   : INTEGER;
BEGIN
   DEBUG_WriteStr('-> ILDict',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   CISAM_ReadNext(ILDict, recsize);
   status := CISAM_OwnStatus;
   IF status = CISAM_NoError THEN BEGIN
      IF mkey = buffer1.mkey  THEN BEGIN
         rec := buffer1;
         DEBUG_WriteStr('mkey found, corresponding skey is:',DEBUG_MaxIO,0,TRUE);
         DEBUG_WriteInteger(rec.skey, 5, TRUE);
         Debug_WriteLine(TRUE);
	 LIILDict_GetNextGILDictAll := TRUE;
         END
      ELSE BEGIN
         LIILDict_GetNextGILDictAll := FALSE;
      END
      END
   ELSE BEGIN
      DEBUG_WriteStr('mkey not found',DEBUG_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
      LIILDict_GetNextGILDictAll := FALSE;
   END;

   DEBUG_WriteStr('<- ILDict',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LIILDict_GetNextGILDictAll};



PROCEDURE LIILDict_Release;
BEGIN
   CISAM_Release(ILDict);
END {LIILDict_Release};

PROCEDURE LIILDict_Reset;
BEGIN
   CISAM_Reset(ILDict);
END {LIILDict_Reset};

PROCEDURE LIILDict_CloseILDict;
BEGIN
   CISAM_Close(ILDict);
END {LIILDict_CloseILDict};

