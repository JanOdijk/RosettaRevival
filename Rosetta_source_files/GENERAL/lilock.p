(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LILOCK
 *  Creation date   : 23-OKT-1990
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
export(LILOCK);
pragma C_Include('logname.pf');
pragma C_Include('lilock.pf');
pragma C_Include('cisam.pf');

PROGRAM LILOCK;
WITH LOGNAME, CISAM;
WITH LOOPHOLES;

VAR
   LockFile: CISAM_FileType;
   LockRec : LILOCK_RecordDef;


PROCEDURE LILOCK_InitLock;
VAR
   status : CISAM_StatusType;
BEGIN {LILOCK_InitLock}
   LockFile := CISAM_InitFile(LOGNAME_findfile(Logname_Tr('lockedlemmas')), 
                   12, Adr(LockRec), SizeOf(LockRec), CISAM_indexed);
   CISAM_DefineKey(LockFile, Adr(LockRec.skey) - Adr(LockRec), 
                    SizeOf(LockRec.skey), 
                    CISAM_Value, CISAM_NoDuplicate, CISAM_Up);
   CISAM_Open(LockFile, CISAM_out, CISAM_New); 
   status := CISAM_OwnStatus;
   CISAM_Close(LockFile);
   status := CISAM_OwnStatus;
END {LILOCK_InitLock};


PROCEDURE LILOCK_OpenLockUpdate;
VAR
   status : CISAM_StatusType;
BEGIN {LILOCK_OpenLockUpdate}
   LockFile := CISAM_InitFile(LOGNAME_findfile(Logname_Tr('lockedlemmas')), 
                   12, Adr(LockRec), SizeOf(LockRec), CISAM_indexed);
   CISAM_DefineKey(LockFile, Adr(LockRec.skey) - Adr(LockRec),
                    SizeOf(LockRec.skey), 
                    CISAM_Value, CISAM_NoDuplicate, CISAM_Up);
   CISAM_FileSharing(LockFile, CISAM_IO);
   CISAM_Open(LockFile, CISAM_IO, CISAM_Old);
   status := CISAM_OwnStatus;
END {LILOCK_OpenLockUpdate};


FUNCTION LILOCK_Write(skey: integer): BOOLEAN;
VAR
   status : CISAM_StatusType;
BEGIN
   LockRec.skey := skey;
   LockRec.user := 0;
   CISAM_Write(LockFile, SizeOf(LockRec));
   status := CISAM_OwnStatus;
   LILOCK_Write := status = CISAM_NoError;
END {LILOCK_WriteSequential};
  

FUNCTION LILOCK_Delete(skey: integer): CISAM_Statustype;
VAR
   status : CISAM_StatusType;
   recsize: integer;
BEGIN
   CISAM_ReadByKey(LockFile, recsize, Adr(skey), SizeOf(skey));
   status := CISAM_OwnStatus;
   CISAM_Delete(LockFile);
   status := CISAM_OwnStatus;
   LILOCK_Delete := status;
END {LILOCK_Delete};



PROCEDURE LILOCK_CloseLock;
BEGIN {LILOCK_CloseLock}
   CISAM_Close(LockFile)
END {LILOCK_CloseLock};

