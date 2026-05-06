(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LIIDDICT
 *  Creation date   :  7-JAN-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : Implementation of the abstract datatype IDDICT.
 *                    The module provides I/O functions for accessing
 *                    IDDICT.
 *
 *EMP:::===================================================================*)

Export(LIIDDICT);
pragma C_Include('cisam.pf');
pragma C_Include('logname.pf');
pragma C_Include('globdef.pf');
pragma C_Include('strtokey.pf');
pragma C_Include('log.pf');
pragma C_Include('string.pf');
pragma C_Include('debug.pf');
pragma C_Include('liiddict.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM LIIDDICT;
WITH     CISAM,
         LOGNAME,
         GLOBDEF,
         STRTOKEY,
         LOG,
         STRNG,
         DEBUG;
WITH LOOPHOLES;

VAR
   buffer1  : LIIDDICT_RecordDef;
   IDDICT   : CISAM_FileType;


PROCEDURE LIIDDICT_OpenIDDICT;
BEGIN

   IF GLOBDEF_GetAnGenMode = AnMode THEN 
      IDDICT := CISAM_initfile(LOGNAME_findfile(Logname_Tr('aiddict')), 7,
			    Adr(buffer1), SizeOf(buffer1), CISAM_indexed)
   ELSE
      IDDICT := CISAM_initfile(LOGNAME_findfile(Logname_Tr('giddict')), 7,
			    Adr(buffer1), SizeOf(buffer1), CISAM_indexed);

   CISAM_DefineKey(IDDICT, Adr(buffer1.args)-Adr(buffer1), SizeOf(buffer1.args),
		    CISAM_String, CISAM_Duplicate, CISAM_Up);
   CISAM_DefineKey(IDDICT, Adr(buffer1.idskey)-Adr(buffer1), SizeOf(buffer1.idskey),
		    CISAM_Value, CISAM_Duplicate, CISAM_Up);
   CISAM_DefineKey(IDDICT, Adr(buffer1.headkey)-Adr(buffer1), SizeOf(buffer1.headkey),
		    CISAM_Value, CISAM_Duplicate, CISAM_Up);
   CISAM_Open(IDDICT, CISAM_inp, CISAM_old);

END {LIIDDICT_OpenIDDICT};


PROCEDURE LIIDDICT_OpenIDDICTWrite;

BEGIN

   IDDICT := CISAM_initfile(LOGNAME_findfile(Logname_Tr('iddict')), 6,
                            Adr(buffer1), SizeOf(buffer1), CISAM_indexed);

   CISAM_DefineKey(IDDICT, Adr(buffer1.args)-Adr(buffer1), SizeOf(buffer1.args),
		    CISAM_String, CISAM_Duplicate, CISAM_Up);
   CISAM_DefineKey(IDDICT, Adr(buffer1.idskey)-Adr(buffer1), SizeOf(buffer1.idskey),
		    CISAM_Value, CISAM_Duplicate, CISAM_Up);
   CISAM_DefineKey(IDDICT, Adr(buffer1.headkey)-Adr(buffer1), SizeOf(buffer1.headkey),
		    CISAM_Value, CISAM_Duplicate, CISAM_Up);

   CISAM_Open(iddict,CISAM_out,CISAM_new);

END {LIIDDICT_OpenIDDICTWrite};


PROCEDURE LIIDDICT_OpenIDDICTUpdate;

BEGIN

   IDDICT := CISAM_initfile(LOGNAME_findfile(Logname_Tr('iddict')), 6,
                            Adr(buffer1), SizeOf(buffer1), CISAM_indexed);

   CISAM_DefineKey(IDDICT, Adr(buffer1.args)-Adr(buffer1), SizeOf(buffer1.args),
		    CISAM_String, CISAM_Duplicate, CISAM_Up);
   CISAM_DefineKey(IDDICT, Adr(buffer1.idskey)-Adr(buffer1), SizeOf(buffer1.idskey),
		    CISAM_Value, CISAM_Duplicate, CISAM_Up);
   CISAM_DefineKey(IDDICT, Adr(buffer1.headkey)-Adr(buffer1), SizeOf(buffer1.headkey),
		    CISAM_Value, CISAM_Duplicate, CISAM_Up);

   CISAM_FileSharing(idDict,CISAM_IO);
{
   CISAM_SetOption(IDDict, CISAM_RabRrl, 0, true);
}
   CISAM_Open(iddict,CISAM_IO,CISAM_old);

END {LIIDDICT_OpenIDDICTUpdate};


FUNCTION LIIDDICT_WriteSequential(rec: LIIDDICT_RecordDef): BOOLEAN;
VAR
   status : CISAM_StatusType;
BEGIN
   buffer1 := rec;
   CISAM_Write(IDDICT, SizeOf(buffer1));
   status := CISAM_OwnStatus;
   LIIDDICT_WriteSequential := status = CISAM_NoError;
END {LIIDDICT_WriteSequential};


FUNCTION LIIDDICT_Update(rec: LIIDDICT_RecordDef): CISAM_StatusType;
VAR
   status : CISAM_StatusType;
BEGIN
   buffer1 := rec;
   CISAM_Update(idDict, SizeOf(buffer1));
   status := CISAM_OwnStatus;
   LIIDDICT_Update := status;
END {LIIDDICT_Update};


FUNCTION LIIDDICT_Delete: CISAM_StatusType;
VAR
   status : CISAM_StatusType;
BEGIN
   CISAM_Delete(idDict);
   status := CISAM_OwnStatus;
   LIIDDICT_Delete := status;
END {LIIDDICT_Delete};




FUNCTION LIIDDICT_GetAIDDICT(args          : LIIDDICT_IdArgs;
                                      VAR rec     : LIIDDICT_RecordDef)
                                      : BOOLEAN; 
VAR 
   status    : CISAM_StatusType;
   intstat,
   recsize   : INTEGER;
   i         : INTEGER;
   argstr    : STRING_String;
BEGIN
   DEBUG_WriteStr('-> IDDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
   writeln('nrags ', args.nrargs);
   FOR i := args.nrargs+1 TO LIIDDICT_MaxIdArgs DO args.argkeys[i] := 0;

   CISAM_SetIndex(IDDICT, 1);
   CISAM_ReadByKey(IDDICT, recsize, Adr(args), SizeOf(args));
   status    := CISAM_OwnStatus;
   intstat   := CISAM_IntegerStatus;
   DEBUG_WriteInteger(intstat, 5, TRUE);
   Debug_WriteLine(TRUE);
   IF status = CISAM_NoError THEN BEGIN
      rec := buffer1;
      DEBUG_WriteStr('args found, corresponding idskey is:',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(rec.idskey, 5, TRUE);
      Debug_WriteLine(TRUE);
      LIIDDICT_GetAIDDICT := TRUE;
      END
   ELSE BEGIN
      DEBUG_WriteStr('args not found',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(intstat, 5, TRUE);
      Debug_WriteLine(TRUE);
      LIIDDICT_GetAIDDICT := FALSE;
   END;

   DEBUG_WriteStr('<- IDDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LIIDDICT_GetAIDDICT};


FUNCTION LIIDDICT_GetNextAIDDICT(args : LIIDDICT_IdArgs;
                                          VAR rec     : LIIDDICT_RecordDef)
                                         : BOOLEAN; 
VAR 
   status    : CISAM_StatusType;
   intstat,
   recsize   : INTEGER;
   i         : INTEGER;

   FUNCTION EqualArgs(k1, k2: LIIDDICT_IdArgs): BOOLEAN;
   VAR
      equal : BOOLEAN;
   BEGIN
      equal := FALSE;
      IF k1.nrargs = k2.nrargs THEN BEGIN
         equal := TRUE; i := 0;
         WHILE equal AND (i < k1.nrargs) DO BEGIN
            i := i+1;
            equal := (k1.argkeys[i] = k2.argkeys[i])
         END;
      END;
      EqualArgs := equal
   END {EqualArgs};

BEGIN
   DEBUG_WriteStr('-> IDDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   FOR i := args.nrargs+1 TO LIIDDICT_MaxIdArgs DO args.argkeys[i] := 0;

   CISAM_ReadNext(IDDICT, recsize);
   intstat   := CISAM_IntegerStatus;
   status := CISAM_OwnStatus;
   DEBUG_WriteInteger(intstat, 5, TRUE);
   Debug_WriteLine(TRUE);
   IF status = CISAM_NoError THEN BEGIN
      IF EqualArgs(args,buffer1.args)  THEN BEGIN
         rec := buffer1;
         DEBUG_WriteStr('args found, corresponding idskey is:',DEBUG_MaxIO,0,TRUE);
         DEBUG_WriteInteger(rec.idskey, 5, TRUE);
         Debug_WriteLine(TRUE);
	 LIIDDICT_GetNextAIDDICT := TRUE;
         END
      ELSE BEGIN
         LIIDDICT_GetNextAIDDICT := FALSE;
      END
      END
   ELSE BEGIN
      DEBUG_WriteStr('args not found',DEBUG_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
      LIIDDICT_GetNextAIDDICT := FALSE;
   END;

   DEBUG_WriteStr('<- IDDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LIIDDICT_GetNextAIDDICT};


FUNCTION LIIDDICT_IsIdKey(idskey   : INTEGER): BOOLEAN; 
VAR 
   status    : CISAM_StatusType;
   intstat,
   recsize   : INTEGER;
BEGIN
   CISAM_SetIndex(IDDICT, 2);
   CISAM_ReadByKey(IDDICT, recsize, Adr(idskey), SizeOf(idskey));
   status    := CISAM_OwnStatus;
   intstat   := CISAM_IntegerStatus;
   IF status = CISAM_NoError THEN BEGIN
      LIIDDICT_IsIdKey := TRUE;
      END
   ELSE BEGIN
      LIIDDICT_IsIdKey := FALSE;
   END;
END {LIIDDICT_IsIdKey};


FUNCTION LIIDDICT_GetGIDDICT(idskey   : INTEGER;
                                      VAR rec     : LIIDDICT_RecordDef)
                                      : BOOLEAN; 
VAR 
   status    : CISAM_StatusType;
   intstat,
   recsize   : INTEGER;
   i         : INTEGER;
BEGIN
   DEBUG_WriteStr('-> IDDICT',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteInteger(idskey, 5, TRUE);
   Debug_WriteLine(TRUE);
   CISAM_SetIndex(IDDICT, 2);
   CISAM_ReadByKey(IDDICT, recsize, Adr(idskey), SizeOf(idskey));
   status    := CISAM_OwnStatus;
   intstat   := CISAM_IntegerStatus;
   IF status = CISAM_NoError THEN BEGIN
      rec := buffer1;
      DEBUG_WriteStr('idskey found, corresponding args are:',DEBUG_MaxIO,0,TRUE);
      FOR i:=1 TO rec.args.nrargs DO BEGIN
         DEBUG_WriteInteger(rec.args.argkeys[i], 5, TRUE);
         DEBUG_WriteStr(' ', DEBUG_MaxIO, 0, TRUE);
      END;
      Debug_WriteLine(TRUE);
      LIIDDICT_GetGIDDICT := TRUE;
      END
   ELSE BEGIN
      DEBUG_WriteStr('idskey not found',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(intstat, 5, TRUE);
      Debug_WriteLine(TRUE);
      LIIDDICT_GetGIDDICT := FALSE;
   END;

   DEBUG_WriteStr('<- IDDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LIIDDICT_GetIDDICT};


FUNCTION LIIDDICT_GetNextGIDDICT(idskey : INTEGER;
                                          VAR rec     : LIIDDICT_RecordDef)
                                          : BOOLEAN; 
VAR 
   status    : CISAM_StatusType;
   recsize   : INTEGER;
   i         : INTEGER;
BEGIN
   DEBUG_WriteStr('-> IDDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   CISAM_ReadNext(IDDICT, recsize);
   status := CISAM_OwnStatus;
   IF status = CISAM_NoError THEN BEGIN
      IF idskey = buffer1.idskey  THEN BEGIN
         rec := buffer1;
         DEBUG_WriteStr('idskey found, corresponding args are:',DEBUG_MaxIO,0,TRUE);
         FOR i:=1 TO rec.args.nrargs DO BEGIN
            DEBUG_WriteInteger(rec.args.argkeys[i], 5, TRUE);
            DEBUG_WriteStr(' ', DEBUG_MaxIO, 0, TRUE);
         END;
         Debug_WriteLine(TRUE);
	 LIIDDICT_GetNextGIDDICT := TRUE;
         END
      ELSE BEGIN
         LIIDDICT_GetNextGIDDICT := FALSE;
      END
      END
   ELSE BEGIN
      DEBUG_WriteStr('idskey not found',DEBUG_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
      LIIDDICT_GetNextGIDDICT := FALSE;
   END;

   DEBUG_WriteStr('<- IDDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LIIDDICT_GetNextGIDDICT};



FUNCTION LIIDDICT_GetheadIDDICT(headkey   : INTEGER;
                                      VAR rec     : LIIDDICT_RecordDef)
                                      : BOOLEAN; 
VAR 
   status    : CISAM_StatusType;
   intstat,
   recsize   : INTEGER;
   i         : INTEGER;
BEGIN
   DEBUG_WriteStr('-> IDDICT',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteInteger(headkey, 5, TRUE);
   Debug_WriteLine(TRUE);
   CISAM_SetIndex(IDDICT, 3);
   CISAM_ReadByKey(IDDICT, recsize, Adr(headkey), SizeOf(headkey));
   status    := CISAM_OwnStatus;
   intstat   := CISAM_IntegerStatus;
   IF status = CISAM_NoError THEN BEGIN
      rec := buffer1;
      DEBUG_WriteStr('headkey found, corresponding args are:',DEBUG_MaxIO,0,TRUE);
      FOR i:=1 TO rec.args.nrargs DO BEGIN
         DEBUG_WriteInteger(rec.args.argkeys[i], 5, TRUE);
         DEBUG_WriteStr(' ', DEBUG_MaxIO, 0, TRUE);
      END;
      Debug_WriteLine(TRUE);
      LIIDDICT_GetheadIDDICT := TRUE;
      END
   ELSE BEGIN
      DEBUG_WriteStr('headkey not found',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(intstat, 5, TRUE);
      Debug_WriteLine(TRUE);
      LIIDDICT_GetheadIDDICT := FALSE;
   END;

   DEBUG_WriteStr('<- IDDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LIIDDICT_GetIDDICT};


FUNCTION LIIDDICT_GetNextheadIDDICT(headkey : INTEGER;
                                          VAR rec     : LIIDDICT_RecordDef)
                                          : BOOLEAN; 
VAR 
   status    : CISAM_StatusType;
   recsize   : INTEGER;
   i         : INTEGER;
BEGIN
   DEBUG_WriteStr('-> IDDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   CISAM_ReadNext(IDDICT, recsize);
   status := CISAM_OwnStatus;
   IF status = CISAM_NoError THEN BEGIN
      IF headkey = buffer1.headkey  THEN BEGIN
         rec := buffer1;
         DEBUG_WriteStr('headkey found, corresponding args are:',DEBUG_MaxIO,0,TRUE);
         FOR i:=1 TO rec.args.nrargs DO BEGIN
            DEBUG_WriteInteger(rec.args.argkeys[i], 5, TRUE);
            DEBUG_WriteStr(' ', DEBUG_MaxIO, 0, TRUE);
         END;
         Debug_WriteLine(TRUE);
	 LIIDDICT_GetNextheadIDDICT := TRUE;
         END
      ELSE BEGIN
         LIIDDICT_GetNextheadIDDICT := FALSE;
      END
      END
   ELSE BEGIN
      DEBUG_WriteStr('headkey not found',DEBUG_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
      LIIDDICT_GetNextheadIDDICT := FALSE;
   END;

   DEBUG_WriteStr('<- IDDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LIIDDICT_GetNextheadIDDICT};

FUNCTION LIIDDICT_GetNextIDDict(VAR rec     : LIIDDICT_RecordDef
                                          ): BOOLEAN; 
VAR 
   status    : CISAM_StatusType;
   recsize   : INTEGER;
BEGIN
   DEBUG_WriteStr('-> IDDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   CISAM_ReadNext(IDDICT, recsize);
   status := CISAM_OwnStatus;
   IF status = CISAM_NoError 
   THEN BEGIN
      rec := buffer1;
      DEBUG_WriteStr('idskey found, corresponding skey is:',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(rec.headkey, 5, TRUE);
      Debug_WriteLine(TRUE);
      LIIDDICT_GetNextIDDICT := TRUE;
   END
   ELSE BEGIN
      DEBUG_WriteStr('idskey not found',DEBUG_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
      LIIDDICT_GetNextIDDICT := FALSE;
   END;

   DEBUG_WriteStr('<- IDDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LIIDDICT_GetNextIDDICT};

FUNCTION LIIDDICT_SetIndex(ind: INTEGER): BOOLEAN;
BEGIN
   CISAM_SetIndex(IDDICT, ind);
   LIIDDICT_SetIndex := (CISAM_OwnStatus = CISAM_NoError);
END {LIIDDICT_SetIndex};

PROCEDURE LIIDDICT_Release;
BEGIN
   CISAM_Release(IDDICT);
END {LIIDDICT_Release};

PROCEDURE LIIDDICT_Reset;
BEGIN
   CISAM_Reset(IDDICT);
END {LIIDDICT_Reset};

PROCEDURE LIIDDICT_CloseIDDICT;
BEGIN
   CISAM_Close(IDDICT);
END {LIIDDICT_CloseIDDICT};

