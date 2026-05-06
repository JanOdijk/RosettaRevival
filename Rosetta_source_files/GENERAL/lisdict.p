(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LISDICT
 *  Creation date   :  7-JAN-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : Implementation of the abstract datatype SDICT.
 *                    The module provides I/O functions for accessing
 *                    SDICT.
 *
 *EMP:::===================================================================*)

Export(LISDICT);
pragma C_Include('globdef.pf');
pragma C_Include('logname.pf');
pragma C_Include('debug.pf');
pragma C_Include('cisam.pf');
pragma C_Include('lisdict.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM LISDICT;
WITH     LOGNAME,
         CISAM,
         GLOBDEF,
         DEBUG;
WITH LOOPHOLES;

VAR
   buffer: LISDICT_RecordDef;
   SDict : CISAM_FileType;

PROCEDURE LISDICT_OpenSdict;
BEGIN

   IF GLOBDEF_GetAnGenMode = AnMode THEN
      SDict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('asdict')), 6,
                            Adr(buffer), SizeOf(buffer), CISAM_indexed)
   ELSE
      SDict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('gsdict')), 6,
                            Adr(buffer), SizeOf(buffer), CISAM_indexed);

   CISAM_DefineKey(SDict, Adr(buffer.fkey)-Adr(buffer), SizeOf(buffer.fkey),
                    CISAM_Value, CISAM_Duplicate, CISAM_Up);
   CISAM_DefineKey(SDict, Adr(buffer.skey)-Adr(buffer), SizeOf(buffer.skey),
                    CISAM_Value, CISAM_NoDuplicate, CISAM_Up);
   CISAM_Open(SDict, CISAM_inp, CISAM_old);

END {LISDICT_OpenSDICT};


PROCEDURE LISDICT_OpenSDICTWrite;

BEGIN

   Sdict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('sdict')), 5,
                            Adr(buffer), SizeOf(buffer), CISAM_indexed);
   CISAM_DefineKey(SDict, Adr(buffer.fkey)-Adr(buffer), SizeOf(buffer.fkey),
                    CISAM_Value, CISAM_Duplicate, CISAM_Up);
   CISAM_DefineKey(SDict, Adr(buffer.skey)-Adr(buffer), SizeOf(buffer.skey),
                    CISAM_Value, CISAM_NoDuplicate, CISAM_Up);
   CISAM_Open(Sdict, CISAM_out, CISAM_new);

END {LISDICT_OpenSDICTWrite};


PROCEDURE LISDICT_OpenSDICTUpdate;

BEGIN

   Sdict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('sdict')), 5,
                            Adr(buffer), SizeOf(buffer), CISAM_indexed);
   CISAM_DefineKey(SDict, Adr(buffer.fkey)-Adr(buffer), SizeOf(buffer.fkey),
                    CISAM_Value, CISAM_Duplicate, CISAM_Up);
   CISAM_DefineKey(SDict, Adr(buffer.skey)-Adr(buffer), SizeOf(buffer.skey),
                    CISAM_Value, CISAM_NoDuplicate, CISAM_Up);
   CISAM_FileSharing(Sdict,CISAM_IO);
{
   CISAM_SetOption(Sdict, CISAM_RabRrl, 0, true);
}
   CISAM_Open(Sdict,CISAM_IO,CISAM_old);

END {LISDICT_OpenSDICTUpdate};


FUNCTION LISDICT_WriteSequential(rec: LISDICT_RecordDef): INTEGER;
VAR
   status : CISAM_StatusType;
BEGIN
   buffer := rec;
   CISAM_Write(SDict, SizeOf(buffer));
   status := CISAM_OwnStatus;
   LISDICT_WriteSequential := CISAM_IntegerStatus
END {LISDICT_WriteSequential};



FUNCTION LISDICT_Update(rec: LISDICT_RecordDef): CISAM_StatusType;
VAR
   status : CISAM_StatusType;
BEGIN
   buffer := rec;
   CISAM_Update(SDict, SizeOf(buffer));
   status := CISAM_OwnStatus;
   LISDICT_Update := status
END {LISDICT_Update};



FUNCTION LISDICT_Delete: CISAM_StatusType;
VAR
   status : CISAM_StatusType;
BEGIN
   CISAM_Delete(SDict);
   status := CISAM_OwnStatus;
   LISDICT_Delete := status
END {LISDICT_Delete};



FUNCTION LISDICT_GetASdict(fkey     : INTEGER;
                                    VAR rec  : LISDICT_RecordDef)
                                    : BOOLEAN; 
VAR 
   status : CISAM_StatusType;
   intstat,
   recsize: INTEGER;
BEGIN
   DEBUG_WriteStr('-> SDICT',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteInteger(fkey, 5, TRUE);
   Debug_WriteLine(TRUE);
   CISAM_SetIndex(SDICT, 1);
   CISAM_ReadByKey(SDICT, recsize, Adr(fkey), SizeOf(fkey));
   status    := CISAM_OwnStatus;
   intstat   := CISAM_IntegerStatus;
   IF status = CISAM_NoError THEN BEGIN
      rec := buffer;
      DEBUG_WriteStr('fkey found, corresponding skey is:',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(rec.skey, 5, TRUE);
      Debug_WriteLine(TRUE);
      LISDICT_GetASDICT := true;
      END
   ELSE BEGIN
      DEBUG_WriteStr('fkey not found',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(intstat, 5, TRUE);
      Debug_WriteLine(TRUE);
      LISDICT_GetASDICT := false;
   END;

   DEBUG_WriteStr('<- SDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LISDICT_GetSDICT};


FUNCTION LISDICT_GetNextASDICT(fkey     : INTEGER;
                                        VAR rec  : LISDICT_RecordDef)
                                        : BOOLEAN; 
VAR 
   status    : CISAM_StatusType;
   recsize   : INTEGER;
BEGIN
   DEBUG_WriteStr('-> SDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   CISAM_ReadNext(SDICT, recsize);
   status := CISAM_OwnStatus;
   IF status = CISAM_NoError THEN BEGIN
      IF fkey = buffer.fkey  THEN BEGIN
         rec := buffer;
         DEBUG_WriteStr('fkey found, corresponding skey is:',DEBUG_MaxIO,0,TRUE);
         DEBUG_WriteInteger(rec.skey, 5, TRUE);
         Debug_WriteLine(TRUE);
         LISDICT_GetNextASDICT := true;
         END
      ELSE BEGIN
         LISDICT_GetNextASDICT := false;
      END
      END
   ELSE BEGIN
      DEBUG_WriteStr('fkey not found',DEBUG_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
      LISDICT_GetNextASDICT := false;
   END;

   DEBUG_WriteStr('<- SDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LISDICT_GetNextASDICT};


FUNCTION LISDICT_GetGSDICT(skey : INTEGER;
                                    VAR rec  : LISDICT_RecordDef)
                                    : BOOLEAN; 
VAR 
   status : CISAM_StatusType;
   recsize: INTEGER;
BEGIN
   DEBUG_WriteStr('-> SDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
   CISAM_SetIndex(SDICT, 2);
   CISAM_ReadByKey(SDICT, recsize, Adr(skey), SizeOf(skey));
   status := CISAM_OwnStatus;
   IF status = CISAM_NoError THEN BEGIN
      rec := buffer;
      DEBUG_WriteStr('skey found, corresponding fkey is:',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(rec.fkey, 5, TRUE);
      Debug_WriteLine(TRUE);
      LISDICT_GetGSDICT := TRUE
      END
   ELSE BEGIN
      DEBUG_WriteStr('skey not found',DEBUG_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
      LISDICT_GetGSDICT := FALSE;
   END;

   DEBUG_WriteStr('<- SDICT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LISDICT_GetGSDICT};


PROCEDURE LISDICT_Release;
BEGIN
   CISAM_Release(SDICT);
END {LISDICT_release};

PROCEDURE LISDICT_Reset;
BEGIN
   CISAM_Reset(SDICT);
END {LISDICT_Reset};

PROCEDURE LISDICT_CloseSDICT;
BEGIN
   CISAM_Close(SDICT);
END {LISDICT_CloseSDICT};

