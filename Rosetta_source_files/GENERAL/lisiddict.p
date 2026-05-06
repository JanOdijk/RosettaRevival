(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LISIDDICT
 *  Creation date   :  7-JAN-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : Implementation of the abstract datatype SIDDICT.
 *                    The module provides I/O functions for accessing
 *                    SIDDICT.
 *
 *EMP:::===================================================================*)

Export(LISIDDICT);
pragma C_include('cisam.pf');
pragma C_include('logname.pf');
pragma C_include('globdef.pf');
pragma C_include('log.pf');
pragma C_include('debug.pf');
pragma C_include('lisiddict.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM LISIDDICT;
WITH CISAM, GLOBDEF, LOG, DEBUG, LOGNAME;
WITH Loopholes;

VAR
   buffer1  : LISIDDICT_RecordDef;
   SIDDICT   : CISAM_FileType;


PROCEDURE LISIDDICT_OpenSIDDICT;
BEGIN

   IF GLOBDEF_GetAnGenMode = AnMode THEN 
      SIDDICT := CISAM_initfile(LOGNAME_findfile(Logname_Tr('asiddict')), 8,
			    Adr(buffer1), SizeOf(buffer1), CISAM_indexed)
   ELSE
      SIDDICT := CISAM_initfile(LOGNAME_findfile(Logname_Tr('gsiddict')), 8,
			    Adr(buffer1), SizeOf(buffer1), CISAM_indexed);

   CISAM_DefineKey(SIDDICT, Retype(Adr(buffer1.skey)-Adr(buffer1),INTEGER), SizeOf(buffer1.skey),
		    CISAM_Value, CISAM_Duplicate, CISAM_Up);
   CISAM_DefineKey(SIDDICT, Retype(Adr(buffer1.sidskey)-Adr(buffer1),INTEGER), SizeOf(buffer1.sidskey),
		    CISAM_Value, CISAM_NoDuplicate, CISAM_Up);
   CISAM_Open(SIDDICT, CISAM_inp, CISAM_old);

END {LISIDDICT_OpenSIDDICT};


PROCEDURE LISIDDICT_OpenSIDDICTWrite;

BEGIN
   Siddict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('siddict')), 7,
                            Adr(buffer1), SizeOf(buffer1), CISAM_indexed);

   CISAM_DefineKey(SIDDICT, Retype(Adr(buffer1.skey)-Adr(buffer1),INTEGER), SizeOf(buffer1.skey),
		    CISAM_Value, CISAM_Duplicate, CISAM_Up);
   CISAM_DefineKey(SIDDICT, Retype(Adr(buffer1.sidskey)-Adr(buffer1),INTEGER), SizeOf(buffer1.sidskey),
		    CISAM_Value, CISAM_NoDuplicate, CISAM_Up);

   CISAM_Open(Siddict, CISAM_out, CISAM_new);

END {LISIDDICT_OpenSIDDICTWrite};


PROCEDURE LISIDDICT_OpenSIDDICTUpdate;

BEGIN

   Siddict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('siddict')), 7,
                            Adr(buffer1), SizeOf(buffer1), CISAM_indexed);

   CISAM_DefineKey(SIDDICT, Retype(Adr(buffer1.skey)-Adr(buffer1),INTEGER), SizeOf(buffer1.skey),
		    CISAM_Value, CISAM_Duplicate, CISAM_Up);
   CISAM_DefineKey(SIDDICT, Retype(Adr(buffer1.sidskey)-Adr(buffer1),INTEGER), SizeOf(buffer1.sidskey),
		    CISAM_Value, CISAM_NoDuplicate, CISAM_Up);

   CISAM_FileSharing(SidDict,CISAM_io);
{
   CISAM_SetOption(SidDict, CISAM_RabRrl, 0, true);
}
   CISAM_Open(Siddict,CISAM_io,CISAM_old);

END {LISIDDICT_OpenSIDDICTWrite};


FUNCTION LISIDDICT_WriteSequential(rec: LISIDDICT_RecordDef): INTEGER;
VAR
   status : CISAM_StatusType;
BEGIN
   buffer1 := rec;
   CISAM_Write(SidDict, SizeOf(buffer1));
   status := CISAM_OwnStatus;
   LISIDDICT_WriteSequential := CISAM_IntegerStatus;
END {LISIDDICT_WriteSequential};


FUNCTION LISIDDICT_Update(rec: LISIDDICT_RecordDef): CISAM_StatusType;
VAR
   status : CISAM_StatusType;
BEGIN
   buffer1 := rec;
   CISAM_Update(SidDict, SizeOf(buffer1));
   status := CISAM_OwnStatus;
   LISIDDICT_Update := status;
END {LISIDDICT_Update};


FUNCTION LISIDDICT_Delete: CISAM_StatusType;
VAR
   status : CISAM_StatusType;
BEGIN
   CISAM_Delete(SidDict);
   status := CISAM_OwnStatus;
   LISIDDICT_Delete := status;
END {LISIDDICT_Delete};


FUNCTION LISIDDICT_GetASIDDict(skey        : INTEGER;
                                        VAR rec     : LISIDDICT_RecordDef)
                                      : BOOLEAN; 
VAR 
   status    : CISAM_StatusType;
   intstat,
   recsize   : INTEGER;
BEGIN
   DEBUG_WriteStr('-> SIDDICT',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteInteger(skey, 5, TRUE);
   Debug_WriteLine(TRUE);
   CISAM_SetIndex(SIDDICT, 1);
   CISAM_ReadByKey(SIDDICT, recsize, Adr(skey), SizeOf(skey));
   status    := CISAM_OwnStatus;
   intstat   := CISAM_IntegerStatus;
   DEBUG_WriteInteger(intstat, 5, TRUE);
   Debug_WriteLine(TRUE);
   IF status = CISAM_NoError THEN BEGIN
      rec := buffer1;
      DEBUG_WriteStr('skey found, corresponding sidskey is:',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(rec.sidskey, 5, TRUE);
      Debug_WriteLine(TRUE);
      LISIDDICT_GetASIDDICT := TRUE;
      END
   ELSE BEGIN
      DEBUG_WriteStr('skey not found',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(intstat, 5, TRUE);
      Debug_WriteLine(TRUE);
      LISIDDICT_GetASIDDICT := FALSE;
   END;

   DEBUG_WriteStr('<- SIDDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LISIDDICT_GetASIDDICT};


FUNCTION LISIDDICT_GetNextASIDDict(skey        : INTEGER;
                                         VAR rec     : LISIDDICT_RecordDef)
                                         : BOOLEAN; 
VAR 
   status    : CISAM_StatusType;
   intstat,
   recsize   : INTEGER;
BEGIN
   DEBUG_WriteStr('-> SIDDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   CISAM_ReadNext(SIDDICT, recsize);
   intstat   := CISAM_IntegerStatus;
   status := CISAM_OwnStatus;
   DEBUG_WriteInteger(intstat, 5, TRUE);
   Debug_WriteLine(TRUE);
   IF status = CISAM_NoError THEN BEGIN
      IF skey = buffer1.skey  THEN BEGIN
         rec := buffer1;
         DEBUG_WriteStr('skey found, corresponding sidskey is:',DEBUG_MaxIO,0,TRUE);
         DEBUG_WriteInteger(rec.sidskey, 5, TRUE);
         Debug_WriteLine(TRUE);
	 LISIDDICT_GetNextASIDDICT := TRUE;
         END
      ELSE BEGIN
         LISIDDICT_GetNextASIDDICT := FALSE;
      END
      END
   ELSE BEGIN
      DEBUG_WriteStr('skey not found',DEBUG_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
      LISIDDICT_GetNextASIDDICT := FALSE;
   END;

   DEBUG_WriteStr('<- SIDDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LISIDDICT_GetNextASIDDICT};


FUNCTION LISIDDICT_GetGSIDDict(sidskey   : INTEGER;
                                          VAR rec     : LISIDDICT_RecordDef)
                                      : BOOLEAN; 
VAR 
   status    : CISAM_StatusType;
   intstat,
   recsize   : INTEGER;
BEGIN
   DEBUG_WriteStr('-> SIDDICT',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteInteger(sidskey, 5, TRUE);
   Debug_WriteLine(TRUE);
   CISAM_SetIndex(SIDDICT, 2);
   CISAM_ReadByKey(SIDDICT, recsize, Adr(sidskey), SizeOf(sidskey));
   status    := CISAM_OwnStatus;
   intstat   := CISAM_IntegerStatus;
   IF status = CISAM_NoError THEN BEGIN
      rec := buffer1;
      DEBUG_WriteStr('sidskey found, corresponding skey is:',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(rec.skey, 5, TRUE);
      Debug_WriteLine(TRUE);
      LISIDDICT_GetGSIDDICT := TRUE;
      END
   ELSE BEGIN
      DEBUG_WriteStr('sidskey not found',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(intstat, 5, TRUE);
      Debug_WriteLine(TRUE);
      LISIDDICT_GetGSIDDICT := FALSE;
   END;

   DEBUG_WriteStr('<- SIDDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LISIDDICT_GetSIDDICT};


FUNCTION LISIDDICT_GetNextGSIDDict(sidskey : INTEGER;
                                         VAR rec     : LISIDDICT_RecordDef)
                                      : BOOLEAN; 
VAR 
   status    : CISAM_StatusType;
   recsize   : INTEGER;
BEGIN
   DEBUG_WriteStr('-> SIDDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   CISAM_ReadNext(SIDDICT, recsize);
   status := CISAM_OwnStatus;
   IF status = CISAM_NoError THEN BEGIN
      IF sidskey = buffer1.sidskey  THEN BEGIN
         rec := buffer1;
         DEBUG_WriteStr('sidskey found, corresponding skey is:',DEBUG_MaxIO,0,TRUE);
         DEBUG_WriteInteger(rec.skey, 5, TRUE);
         Debug_WriteLine(TRUE);
	 LISIDDICT_GetNextGSIDDICT := TRUE;
         END
      ELSE BEGIN
         LISIDDICT_GetNextGSIDDICT := FALSE;
      END
      END
   ELSE BEGIN
      DEBUG_WriteStr('sidskey not found',DEBUG_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
      LISIDDICT_GetNextGSIDDICT := FALSE;
   END;

   DEBUG_WriteStr('<- SIDDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LISIDDICT_GetNextGSIDDICT};



FUNCTION LISIDDICT_GetNextSIDDict(VAR rec     : LISIDDICT_RecordDef
                                          ): BOOLEAN; 
VAR 
   status    : CISAM_StatusType;
   recsize   : INTEGER;
BEGIN
   DEBUG_WriteStr('-> SIDDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   CISAM_ReadNext(SIDDICT, recsize);
   status := CISAM_OwnStatus;
   IF status = CISAM_NoError 
   THEN BEGIN
      rec := buffer1;
      DEBUG_WriteStr('sidskey found, corresponding skey is:',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(rec.skey, 5, TRUE);
      Debug_WriteLine(TRUE);
      LISIDDICT_GetNextSIDDICT := TRUE;
   END
   ELSE BEGIN
      DEBUG_WriteStr('sidskey not found',DEBUG_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
      LISIDDICT_GetNextSIDDICT := FALSE;
   END;

   DEBUG_WriteStr('<- SIDDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LISIDDICT_GetNextSIDDICT};

FUNCTION LISIDDICT_SetIndex(ind: INTEGER): BOOLEAN;
BEGIN
   CISAM_SetIndex(SIDDICT, ind);
   LISIDDICT_SetIndex := (CISAM_OwnStatus = CISAM_NoError);
END {LISIDDICT_SetIndex};

PROCEDURE LISIDDICT_Release;
BEGIN
   CISAM_Release(SIDDICT);
END {LISIDDICT_Release};

PROCEDURE LISIDDICT_Reset;
BEGIN
   CISAM_Reset(SIDDICT);
END {LISIDDICT_Reset};

PROCEDURE LISIDDICT_CloseSIDDICT;
BEGIN
   CISAM_Close(SIDDICT);
END {LISIDDICT_CloseSIDDICT};

