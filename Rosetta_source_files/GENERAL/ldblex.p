(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LDBLEX
 *  Creation date   :  7-JAN-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : Implementation of the abstract datatype BLEX.
 *                    The module provides I/O functions for accessing
 *                    BLEX.
 *
 *EMP:::===================================================================*)

Export(LDBLEX);
pragma C_include('logname.pf');
pragma C_include('cisam.pf');
pragma C_include('windows.pf');
pragma C_include('debug.pf');
pragma C_include('listree.pf');
pragma C_include('mem.pf');
pragma C_include('ldgetkey.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('lsstree.pf');
pragma C_include('maket.pf');
pragma C_include('ldblex.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM LDBLEX;
WITH     LOGNAME,
         CISAM,
         GLOBDEF,
         WINDOWS,
         DEBUG,
         LISTREE,
         MEM,
         LDGETKEY,
         LSDOMAINT,
         LSSTREE,
         MAKET;
WITH LOOPHOLES;


CONST
   MaxHashTable = 997;
   History      = 5;
VAR
   buffer: LSDOMAINT_BLEXstruct;
   Blex  : CISAM_FileType;
   HashTable : ARRAY[0..MaxHashTable] OF RECORD
                                            key,
                                            sentenceid : INTEGER;
                                            rec        : LSDOMAINT_BLEXstruct
                                         END;
 

   PROCEDURE InitHashTable;
   VAR
      i : 0..MaxHashTable;
   BEGIN
      FOR i := 0 TO MaxHashTable DO 
         WITH HashTable[i] DO BEGIN
            key        := -1;
            sentenceid := -1
         END;
   END {InitHashTable};


   PROCEDURE StoreKey(k: INTEGER; r: LSDOMAINT_BLexStruct); 
                                   {cf. Wirth: Alg. + Data Str. = Programs,}
                                   {page 266-269                           }
   VAR
      h, d   : INTEGER;
      f      : BOOLEAN;
   BEGIN
      DEBUG_WriteStr('-> StoreKey',DEBUG_MaxIO, 0,TRUE);
      DEBUG_WriteInteger(k, 5, TRUE);
      Debug_WriteLine(TRUE);
      h := abs(k) mod MaxHashTable; f := FALSE; d := 1;
      REPEAT
         IF (HashTable[h].key = -1) OR 
            ((GlobDef_GetSentenceId-HashTable[h].sentenceid) > History ) THEN BEGIN
            DEBUG_WriteStr('Stored at entry : ', DEBUG_MaxIO, 0,TRUE);
            DEBUG_WriteInteger(h, 5, TRUE);
            Debug_WriteLine(TRUE);
            WITH HashTable[h] DO BEGIN
               key := k;
               sentenceid := GlobDef_GetSentenceId;
               rec := r
            END;       
            f := TRUE
            END
         ELSE BEGIN {collision}
            DEBUG_WriteStr('collision at ',DEBUG_MaxIO, 0,TRUE);
            DEBUG_WriteInteger(h, 5, TRUE);
            Debug_WriteLine(TRUE);
            h := h+d; d := d+2;
            IF h >= MaxHashTable THEN h := h-MaxHashTable;
            IF d = MaxHashTable THEN BEGIN
               writeln('BLEX: Hash table overflow');
               f := TRUE;
            END;
         END
      UNTIL f;
      DEBUG_WriteStr('<- StoreKey',DEBUG_MaxIO, 0,TRUE);
      Debug_WriteLine(TRUE);
   END {StoreKey};


   FUNCTION FindKey(k: INTEGER; VAR rec: LSDOMAINT_BLexStruct): BOOLEAN;
                          {cf. Wirth: Alg. + Data Str. = Programs,}
                          {page 266-269                           }
   VAR
      h, d   : INTEGER;
      present,
      f      : BOOLEAN;
   BEGIN
      DEBUG_WriteStr('-> FindKey',DEBUG_MaxIO, 0,TRUE);
      DEBUG_WriteInteger(k, 5, TRUE);
      Debug_WriteLine(TRUE);
      h := abs(k) mod MaxHashTable; f := FALSE; d := 1; present := TRUE;
      REPEAT
         IF (HashTable[h].key = -1) OR 
            ((GlobDef_GetSentenceId-HashTable[h].sentenceid) > History ) THEN BEGIN
            present := FALSE;
            DEBUG_WriteStr('not present',DEBUG_MaxIO, 0,TRUE);
            Debug_WriteLine(TRUE);
            END
         ELSE IF HashTable[h].key = k THEN BEGIN
            f := TRUE;
            rec := HashTable[h].rec;
            DEBUG_WriteStr('found at entry ',DEBUG_MaxIO, 0,TRUE);
            DEBUG_WriteInteger(h, 5, TRUE);
            Debug_WriteLine(TRUE);
            END
        ELSE IF ((GlobDef_GetSentenceId-HashTable[h].sentenceid) > History ) THEN BEGIN
            present := FALSE;
            DEBUG_WriteStr('not present',DEBUG_MaxIO, 0,TRUE);
            Debug_WriteLine(TRUE);
            END
         ELSE BEGIN {collision}
            DEBUG_WriteStr('collision at ',DEBUG_MaxIO, 0,TRUE);
            DEBUG_WriteInteger(h, 5, TRUE);
            Debug_WriteLine(TRUE);
            h := h+d; d := d+2;
            IF h >= MaxHashTable THEN h := h-MaxHashTable;
            IF d = MaxHashTable THEN BEGIN
               writeln('BLEX: Hash table overflow');
               present := FALSE;
               f := TRUE;
            END;
         END;
      UNTIL f OR NOT present;
      FindKey := present
   END {FindKey};



PROCEDURE LDBLEX_OpenBLex;

BEGIN

   IF GLOBDEF_GetAnGenMode = anmode THEN
      BLex := CISAM_initfile(LOGNAME_findfile(Logname_Tr('ablex')), 5,
                            Adr(buffer), SizeOf(buffer), CISAM_indexed)
   ELSE
      BLex := CISAM_initfile(LOGNAME_findfile(Logname_Tr('gblex')), 5,
                            Adr(buffer), SizeOf(buffer), CISAM_indexed);
   CISAM_DefineKey(BLex, Adr(buffer.key)-Adr(buffer), SizeOf(buffer.key),
                    CISAM_Value, CISAM_NoDuplicate, CISAM_Up);
   CISAM_Open(BLex, CISAM_inp, CISAM_old);

   InitHashTable;
END {LDBLEX_OpenBLex};


PROCEDURE LDBLEX_OpenBLexWrite;

BEGIN

   BLex := CISAM_initfile(LOGNAME_findfile(Logname_Tr('blex')), 4,
                            Adr(buffer), SizeOf(buffer), CISAM_indexed);

   CISAM_DefineKey(BLex, Adr(buffer.key)-Adr(buffer), SizeOf(buffer.key),
                    CISAM_Value, CISAM_NoDuplicate, CISAM_Up);
{
   CISAM_OptimizeMemory(Blex, 127);
   CISAM_OptimizeBucket(Blex, 4, 0);
   CISAM_SetOption(Blex, CISAM_FabDFW, 0, TRUE);
}
   CISAM_Open(BLex, CISAM_out, CISAM_new);

END {LDBLEX_OpenBLexWrite};


PROCEDURE LDBLEX_OpenBLexUpdate;

BEGIN

   BLex := CISAM_initfile(LOGNAME_findfile(Logname_Tr('blex')), 4,
                            Adr(buffer), SizeOf(buffer), CISAM_indexed);
   CISAM_DefineKey(BLex, Adr(buffer.key)-Adr(buffer), SizeOf(buffer.key),
                    CISAM_Value, CISAM_NoDuplicate, CISAM_Up);
   CISAM_FileSharing(Blex, CISAM_IO);
{
   CISAM_SetOption(BLex, CISAM_RabRrl, 0, true);
}
   CISAM_Open(BLex, CISAM_IO, CISAM_old);
   InitHashTable;

END {LDBLEX_OpenBLexUpdate};


FUNCTION LDBLEX_Read(key  : INTEGER): LISTREE_pStree;
VAR 
   boolstatus: BOOLEAN;
   intstat   : INTEGER;
   status    : CISAM_StatusType;
   recsize   : INTEGER;
   t         : LSSTREE_pStree;
   basekey   : INTEGER;
BEGIN
   DEBUG_WriteStr('-> BLEX',Debug_MaxIO, 0, TRUE);
   Debug_WriteLine(TRUE);
   DEBUG_WriteInteger(key, 5, TRUE);
   Debug_WriteLine(TRUE);
   boolstatus := FindKey(key, buffer);
   IF boolstatus THEN BEGIN
      t := MAKET_StreeFromBlexRec(buffer.cat, buffer);
      IF NOT buffer.IsBxpr THEN BEGIN
         basekey := LDGetKey_Get(Retype(t,LISTREE_pStree));
         boolstatus := FindKey(basekey, buffer);
         IF boolstatus THEN BEGIN
            t := MAKET_StreeFromBlexRec(buffer.cat, buffer);
            LDGetKey_Put(Retype(t,LISTREE_pStree), key);
            END
         ELSE BEGIN
            CISAM_ReadByKey(BLex, recsize, Adr(basekey), SizeOf(basekey));
            status := CISAM_OwnStatus;
            IF status = CISAM_NoError THEN BEGIN
               StoreKey(basekey, buffer);
               t := MAKET_StreeFromBlexRec(buffer.cat, buffer);
               LDGetKey_Put(Retype(t,LISTREE_pStree), key);
               END
            ELSE t := NIL
         END
      END;
      LDBLEX_Read := Retype(t,LISTREE_pStree)
      END
   ELSE BEGIN
      CISAM_SetIndex(BLex, 1);
      CISAM_ReadByKey(BLex, recsize, Adr(key), SizeOf(key));
      status    := CISAM_OwnStatus;
      intstat := CISAM_IntegerStatus;
      DEBUG_WriteStr('status : ',Debug_MaxIO, 0, TRUE);
      DEBUG_WriteInteger(intstat, 5, TRUE);
      Debug_WriteLine(TRUE);
      IF status = CISAM_NoError THEN BEGIN
         StoreKey(key, buffer);
         t := MAKET_StreeFromBlexRec(buffer.cat, buffer);
         IF NOT buffer.IsBxpr THEN BEGIN
            basekey := LDGetKey_Get(Retype(t,LISTREE_pStree));
            CISAM_ReadByKey(BLex, recsize, Adr(basekey), SizeOf(basekey));
            status := CISAM_OwnStatus;
            IF status = CISAM_NoError THEN BEGIN
               StoreKey(basekey, buffer);
               t := MAKET_StreeFromBlexRec(buffer.cat, buffer);
               LDGetKey_Put(Retype(t,LISTREE_pStree), key);
               END
            ELSE t := NIL
         END;
         LDBLEX_Read := Retype(t,LISTREE_pStree)
         END
      ELSE BEGIN
         DEBUG_WriteStr('Key not found',0,Debug_MaxIO,TRUE);
         Debug_WriteLine(TRUE);
         LDBLEX_Read := NIL;
      END;
   END;

   DEBUG_WriteStr('<- BLEX',0,Debug_MaxIO,TRUE);
   Debug_WriteLine(TRUE);

END {LDBLEX_Read};

{ Read procedure without use of hash table (used by lexicon editor }
FUNCTION LDBLEX_ReadDirect(key  : INTEGER): LISTREE_pStree;
VAR 
   intstat   : INTEGER;
   status    : CISAM_StatusType;
   recsize   : INTEGER;
   t         : LSSTREE_pStree;
   basekey   : INTEGER;
BEGIN
   DEBUG_WriteStr('-> BLEX',Debug_MaxIO, 0, TRUE);
   Debug_WriteLine(TRUE);
   DEBUG_WriteInteger(key, 5, TRUE);
   Debug_WriteLine(TRUE);
   CISAM_SetIndex(BLex, 1);
   CISAM_ReadByKey(BLex, recsize, Adr(key), SizeOf(key));
   status    := CISAM_OwnStatus;
   intstat := CISAM_IntegerStatus;
   DEBUG_WriteStr('status : ',Debug_MaxIO, 0, TRUE);
   DEBUG_WriteInteger(intstat, 5, TRUE);
   Debug_WriteLine(TRUE);
   IF status = CISAM_NoError THEN BEGIN
      t := MAKET_StreeFromBlexRec(buffer.cat, buffer);
      IF NOT buffer.IsBxpr THEN BEGIN
         basekey := LDGetKey_Get(Retype(t,LISTREE_pStree));
         CISAM_ReadByKey(BLex, recsize, Adr(basekey), SizeOf(basekey));
         status := CISAM_OwnStatus;
         IF status = CISAM_NoError THEN BEGIN
            t := MAKET_StreeFromBlexRec(buffer.cat, buffer);
            LDGetKey_Put(Retype(t,LISTREE_pStree), key);
            END
         ELSE t := NIL
      END;
      LDBLEX_ReadDirect := Retype(t,LISTREE_pStree)
      END
   ELSE BEGIN
      DEBUG_WriteStr('Key not found',0,Debug_MaxIO,TRUE);
      Debug_WriteLine(TRUE);
      LDBLEX_ReadDirect := NIL;
   END;

   DEBUG_WriteStr('<- BLEX',0,Debug_MaxIO,TRUE);
   Debug_WriteLine(TRUE);

END {LDBLEX_ReadDirect};


FUNCTION LDBLEX_ReadSequential(VAR rec: LDBLEX_pBLEXStruct): BOOLEAN;
TYPE
   pBLEXStruct = ^LSDOMAINT_BLEXStruct;
VAR
   b    : pBLEXStruct;
   rsize : INTEGER;
   status : CISAM_StatusType;
BEGIN
   CISAM_ReadNext(BLex, rsize);
   status := CISAM_OwnStatus;
   Mem_NewDefault(SizeOf(LSDOMAINT_BlexStruct), Retype(b,Mem_Ptr)); b^ := buffer;
   rec    := Retype(b,LDBLEX_pBLEXStruct);
   LDBLEX_ReadSequential := status = CISAM_NoError;
END {LDBLEX_ReadSequential};


FUNCTION LDBLEX_WriteSequential(rec: LDBLEX_pBLEXStruct): INTEGER;
VAR
   b    : ^LSDOMAINT_BLEXStruct;
   status : CISAM_StatusType;
BEGIN
   Retype(b,LDBLEX_pBLEXStruct) := rec;
   buffer := b^;
   CISAM_Write(BLex, SizeOf(buffer));
   status := CISAM_OwnStatus;
   LDBLEX_WriteSequential := CISAM_IntegerStatus;
END {LDBLEX_WriteSequential};


FUNCTION LDBLEX_Update(rec: LDBLEX_pBLEXStruct): CISAM_StatusType;
VAR
   b    : ^LSDOMAINT_BLEXStruct;
   status : CISAM_StatusType;
BEGIN
   Retype(b,LDBLEX_pBLEXStruct) := rec;
   buffer := b^;
   CISAM_Update(BLex, SizeOf(buffer));
   status := CISAM_OwnStatus;
   LDBLEX_Update := status;
END {LDBLEX_Update};


FUNCTION LDBLEX_Delete: CISAM_StatusType;
VAR
   status : CISAM_StatusType;
BEGIN
   CISAM_Delete(BLex);
   status := CISAM_OwnStatus;
   LDBLEX_Delete := status;
END {LDBLEX_Delete};


PROCEDURE LDBLEX_Release;
BEGIN
   CISAM_Release(BLex);
END {LDBLEX_Release};

PROCEDURE LDBLEX_Reset;
BEGIN
   CISAM_Reset(BLex);
END {LDBLEX_Reset};

PROCEDURE LDBLEX_CloseBLex;
BEGIN
   CISAM_Close(BLex);
END {LDBLEX_CloseBLex};

