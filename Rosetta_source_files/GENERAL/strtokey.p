(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : StrToKey
 *  Creation date   :  18-MAY-1988
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(StrToKey);
pragma C_include('strkeyrecdef.pf');
pragma C_include('logname.pf');
pragma C_include('cisam.pf');
pragma C_include('globdef.pf');
pragma C_include('windows.pf');
pragma C_include('string.pf');
pragma C_include('strtokey.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM StrToKey;
WITH     LOGNAME,
         StrKeyRecDef,
         CISAM,
         GLOBDEF,
         WINDOWS,
         STRNG;
WITH LOOPHOLES;

CONST
   MaxHashTable = 997;

VAR
   SkeyDict : CISAM_FileType;
   SkeyRec  : StrKeyRecDef_RecordDef;
   MkeyDict : CISAM_FileType;
   MkeyRec  : StrKeyRecDef_RecordDef;
   InitStr  : StrKeyRecDef_StrType;

   HashTable : ARRAY[0..MaxHashTable] OF RECORD
                                            key,
                                            k   : INTEGER;
                                            s   : StrKeyRecDef_StrType
                                         END;



   PROCEDURE InitHashTable;
   VAR
      i : 0..MaxHashTable;
   BEGIN
      FOR i := 0 TO MaxHashTable DO 
         WITH HashTable[i] DO BEGIN
            key        := -1;
            k          := -1
         END;
   END {InitHashTable};


   PROCEDURE StoreKey(str: StrKeyRecDef_StrType; inkey: INTEGER); 
                                   {cf. Wirth: Alg. + Data Str. = Programs,}
                                   {page 266-269                           }
   VAR
      j,
      h, d   : INTEGER;
      f      : BOOLEAN;
   BEGIN
      j := ord(str[1]) + 30*ord(str[2]) + 900*ord(str[4]);
      h := abs(j) mod MaxHashTable; f := FALSE; d := 1;
      REPEAT
         IF (HashTable[h].k = -1) THEN BEGIN
{
            DEBUG_WriteStr('Stored at entry : ', DEBUG_MaxIO, 0,TRUE);
            DEBUG_WriteInteger(h, 5, TRUE);
            Debug_WriteLine(TRUE);
}
            WITH HashTable[h] DO BEGIN
               k   := inkey;
               s   := str;
            END;       
            f := TRUE
            END
         ELSE BEGIN {collision}
{
            DEBUG_WriteStr('collision at ',DEBUG_MaxIO, 0,TRUE);
            DEBUG_WriteInteger(h, 5, TRUE);
            Debug_WriteLine(TRUE);
}
            h := h+d; d := d+2;
            IF h >= MaxHashTable THEN h := h-MaxHashTable;
            IF d = MaxHashTable THEN BEGIN
               writeln('BLEX: Hash table overflow');
               f := TRUE;
            END;
         END
      UNTIL f;
{
      DEBUG_WriteStr('<- StoreKey',DEBUG_MaxIO, 0,TRUE);
      Debug_WriteLine(TRUE);
}
   END {StoreKey};


   FUNCTION FindKey(str: StrKeyRecDef_StrType; VAR outkey: INTEGER): BOOLEAN;
                          {cf. Wirth: Alg. + Data Str. = Programs,}
                          {page 266-269                           }
   VAR
      j,
      h, d   : INTEGER;
      present,
      f      : BOOLEAN;
   BEGIN
      j := ord(str[1]) + 30*ord(str[2]) + 900*ord(str[4]);
      h := abs(j) mod MaxHashTable; f := FALSE; d := 1; present := TRUE;
      REPEAT
         IF (HashTable[h].k = -1) THEN BEGIN
            present := FALSE;
{
            DEBUG_WriteStr('not present',DEBUG_MaxIO, 0,TRUE);
            Debug_WriteLine(TRUE);
}
            END
         ELSE IF HashTable[h].s = str THEN BEGIN
            f := TRUE;
            outkey := HashTable[h].k;
{
            DEBUG_WriteStr('found at entry ',DEBUG_MaxIO, 0,TRUE);
            DEBUG_WriteInteger(h, 5, TRUE);
            Debug_WriteLine(TRUE);
}
            END
         ELSE BEGIN {collision}
{
            DEBUG_WriteStr('collision at ',DEBUG_MaxIO, 0,TRUE);
            DEBUG_WriteInteger(h, 5, TRUE);
            Debug_WriteLine(TRUE);
}
            h := h+d; d := d+2;
            IF h >= MaxHashTable THEN h := h-MaxHashTable;
            IF d = MaxHashTable THEN BEGIN
               writeln('BLEX: Hash table overflow');
               f := TRUE;
            END;
         END;
      UNTIL f OR NOT present;
      FindKey := present
   END {FindKey};



PROCEDURE StrToKey_OpenSkeyRead;
VAR
   i : INTEGER;
BEGIN {StrToKey_OpenSkey}
   IF GLOBDEF_GetAnGenMode = AnMode THEN 
      SkeyDict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('askeyfile')), 9, 
                            Adr(skeyrec), SizeOf(skeyrec), CISAM_indexed)
   ELSE
      SkeyDict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('gskeyfile')), 9, 
                            Adr(skeyrec), SizeOf(skeyrec), CISAM_indexed);
   CISAM_DefineKey(SkeyDict, Adr(skeyrec.strkey)-Adr(skeyrec), SizeOf(skeyrec.strkey), 
                    CISAM_String, CISAM_NoDuplicate, CISAM_Up);
   CISAM_DefineKey(SkeyDict, Adr(skeyrec.intkey)-Adr(skeyrec), SizeOf(skeyrec.intkey), 
                    CISAM_Value, CISAM_Duplicate, CISAM_Down);
{
   CISAM_OptimizeMemory(Skeydict, 127);
   CISAM_OptimizeBucket(SkeyDict, 4, 0);
   CISAM_OptimizeBucket(SkeyDict, 4, 1);
}
   CISAM_Open(SkeyDict, CISAM_inp, CISAM_Old);
   FOR i := 1 TO StrKeyRecDef_MaxStrLength DO InitStr := ' ';
   InitHashTable;
END {StrToKey_OpenSkey};


PROCEDURE StrToKey_OpenSkeyWrite;
VAR
   i : INTEGER;
BEGIN {StrToKey_OpenSkeyWrite}
   IF GLOBDEF_GetAnGenMode = AnMode THEN  BEGIN
      SkeyDict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('askeyfile')), 9, 
                            Adr(skeyrec), SizeOf(skeyrec), CISAM_indexed)
      END
   ELSE
      SkeyDict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('gskeyfile')), 9, 
                            Adr(skeyrec), SizeOf(skeyrec), CISAM_indexed);
   CISAM_DefineKey(SkeyDict, Adr(skeyrec.strkey)-Adr(skeyrec), SizeOf(skeyrec.strkey), 
                    CISAM_String, CISAM_NoDuplicate, CISAM_Up);
   CISAM_DefineKey(SkeyDict, Adr(skeyrec.intkey)-Adr(skeyrec), SizeOf(skeyrec.intkey), 
                    CISAM_Value, CISAM_Duplicate, CISAM_Down);
{
   CISAM_OptimizeMemory(Skeydict, 127);
   CISAM_OptimizeBucket(SkeyDict, 4, 0);
   CISAM_OptimizeBucket(SkeyDict, 4, 1);
   CISAM_SetOption(SkeyDict, CISAM_FabDFW, 0, TRUE);
}
writeln('here2');
   CISAM_Open(SkeyDict, CISAM_out, CISAM_New);
writeln(CISAM_IntegerStatus);
   FOR i := 1 TO StrKeyRecDef_MaxStrLength DO InitStr := ' ';
END {StrToKey_OpenSkeyWrite};


PROCEDURE StrToKey_OpenSkeyUpdate;
VAR
   i : INTEGER;
BEGIN {StrToKey_OpenSkeyUpdate}
   IF GLOBDEF_GetAnGenMode = AnMode THEN 
      SkeyDict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('askeyfile')), 9, 
                            Adr(skeyrec), SizeOf(skeyrec), CISAM_indexed)
   ELSE
      SkeyDict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('gskeyfile')), 9, 
                            Adr(skeyrec), SizeOf(skeyrec), CISAM_indexed);
   CISAM_DefineKey(SkeyDict, Adr(skeyrec.strkey)-Adr(skeyrec), SizeOf(skeyrec.strkey), 
                    CISAM_String, CISAM_NoDuplicate, CISAM_Up);
   CISAM_DefineKey(SkeyDict, Adr(skeyrec.intkey)-Adr(skeyrec), SizeOf(skeyrec.intkey), 
                    CISAM_Value, CISAM_Duplicate, CISAM_Down);
   CISAM_FileSharing(SkeyDict, CISAM_io);
   CISAM_TimeOut(SkeyDict, -1);
   CISAM_Open(SkeyDict, CISAM_io, CISAM_Old);
   FOR i := 1 TO StrKeyRecDef_MaxStrLength DO InitStr := ' ';
END {StrToKey_OpenSkeyUpdate};


FUNCTION StrToKey_GetSkey(strkey: STRING_String;
                                   VAR intkey: INTEGER): BOOLEAN;
VAR
   str : StrKeyRecDef_StrType;
   len : String_Range;
   status : CISAM_StatusType;
   recsize: INTEGER;
   helpstr: STRING(StrKeyRecDef_MaxStrLength);
   j : INTEGER;
BEGIN {StrToKey_GetSkey}
   STRING_UpperCase(strkey, strkey);
   str := InitStr;
   STRING_ExtractChars(helpstr, len, strkey, 1, STRING_Length(strkey));   
   FOR j:=1 TO len DO str[j] := helpstr[j];
   CISAM_SetIndex(SkeyDict, 1);
   CISAM_ReadByKey(SkeyDict, recsize, Adr(str), SizeOf(str));
   status    := CISAM_OwnStatus;
   IF status = CISAM_NoError THEN BEGIN
      intkey := skeyrec.intkey;
      StrToKey_GetSkey := TRUE;
      CISAM_Release(SkeyDict);
      END
   ELSE BEGIN
writeln('error ',CISAM_integerstatus);
      intkey := -1;
      StrToKey_GetSkey := FALSE
   END;
END {StrToKey_GetSkey};


FUNCTION StrToKey_GetSkeyNR(strkey: STRING_String;
                                   VAR intkey: INTEGER): BOOLEAN;
VAR
   str : StrKeyRecDef_StrType;
   len : String_Range;
   status : CISAM_StatusType;
   recsize: INTEGER;
   helpstr: STRING(StrKeyRecDef_MaxStrLength);
   j : INTEGER;
BEGIN {StrToKey_GetSkey}
   STRING_UpperCase(strkey, strkey);
   str := InitStr;
   STRING_ExtractChars(helpstr, len, strkey, 1, STRING_Length(strkey));   
   FOR j:=1 TO len DO str[j] := helpstr[j];
   CISAM_SetIndex(SkeyDict, 1);
   CISAM_ReadByKey(SkeyDict, recsize, Adr(str), SizeOf(str));
   status    := CISAM_OwnStatus;
   IF status = CISAM_NoError THEN BEGIN
      intkey := skeyrec.intkey;
      StrToKey_GetSkeyNR := TRUE;
      END
   ELSE BEGIN
      intkey := -1;
      StrToKey_GetSkeyNR := FALSE
   END;
END {StrToKey_GetSkeyNR};


FUNCTION StrToKey_GetSkeyHash(strkey: STRING_String;
                                   VAR intkey: INTEGER): BOOLEAN;
VAR
   boolstatus: BOOLEAN;
   str : StrKeyRecDef_StrType;
   len : String_Range;
   status : CISAM_StatusType;
   recsize: INTEGER;
   helpstr: STRING(StrKeyRecDef_MaxStrLength);
   j : INTEGER;
BEGIN {StrToKey_GetSkey}
   STRING_UpperCase(strkey, strkey);
   str := InitStr;
   STRING_ExtractChars(helpstr, len, strkey, 1, STRING_Length(strkey));   
   FOR j:=1 TO len DO str[j] := helpstr[j];
   boolstatus := FindKey(str, intkey);
   IF boolstatus THEN BEGIN
      StrToKey_GetSkeyHash := TRUE
      END
   ELSE BEGIN
      CISAM_SetIndex(SkeyDict, 1);
      CISAM_ReadByKey(SkeyDict, recsize, Adr(str), SizeOf(str));
      status    := CISAM_OwnStatus;
      IF status = CISAM_NoError THEN BEGIN
         intkey := skeyrec.intkey;
         StoreKey(str, intkey);
         StrToKey_GetSkeyHash := TRUE
         END
      ELSE BEGIN
         intkey := -1;
         StrToKey_GetSkeyHash := FALSE
      END;
   END;
END {StrToKey_GetSkeyHash};


FUNCTION StrToKey_GetSkeyStr(intkey: INTEGER;
                                      VAR strkey: STRING_String): BOOLEAN;
VAR
   str    : STRING_String;
   status : CISAM_StatusType;
   recsize: INTEGER;
BEGIN {StrToKey_GetSkeyStr}
   CISAM_SetIndex(SkeyDict, 2);
   CISAM_ReadByKey(SkeyDict, recsize, Adr(intkey), SizeOf(intkey));
   status    := CISAM_OwnStatus;
   IF status = CISAM_NoError THEN BEGIN
      STRING_Constant(str, skeyrec.strkey, StrKeyRecDef_MaxStrLength);
      STRING_Trim(strkey, str);
      StrToKey_GetSkeyStr := TRUE
      END
   ELSE BEGIN
      StrToKey_GetSkeyStr := FALSE
   END;
END {StrToKey_GetSkeyStr};


FUNCTION StrToKey_PutSkey(strkey: STRING_String;
                                   intkey: INTEGER): BOOLEAN;
VAR
   str : StrKeyRecDef_StrType;
   len : String_Range;
   status : CISAM_StatusType;
   recsize: INTEGER;
   helpstr: STRING(StrKeyRecDef_MaxStrLength);
   j : INTEGER;
BEGIN {StrToKey_GetSkey}
   STRING_UpperCase(strkey, strkey);
   skeyrec.strkey := InitStr;
   skeyrec.intkey := intkey;
   STRING_ExtractChars(helpstr, len, strkey, 1, STRING_Length(strkey));   
   FOR j:=1 TO len DO skeyrec.strkey[j] := helpstr[j];
   CISAM_SetIndex(SkeyDict, 1);
   CISAM_Write(SkeyDict, SizeOf(skeyrec));
   status    := CISAM_OwnStatus;
   IF status = CISAM_NoError THEN BEGIN
      StrToKey_PutSkey := TRUE
      END
   ELSE BEGIN
writeln('error ',CISAM_integerstatus);
      StrToKey_PutSkey := FALSE
   END;
END {StrToKey_PutSkey};

FUNCTION StrToKey_GetHighestSkey(var skey: integer): boolean;
var
   recsize: INTEGER;
   status : CISAM_StatusType;
BEGIN
   CISAM_SetIndex(SkeyDict, 2);
   CISAM_Reset(SkeyDict);
   CISAM_ReadNext(SkeyDict, recsize);
   status    := CISAM_OwnStatus;
   IF status = CISAM_NoError THEN BEGIN
      skey := skeyrec.IntKey;
      StrToKey_GetHighestSkey := TRUE
      END
   ELSE BEGIN
      StrToKey_GetHighestSkey := FALSE
   END;
END;

PROCEDURE StrToKey_Release;
BEGIN {StrToKey_Release}
   CISAM_Release(SkeyDict)
END {StrToKey_Release};

PROCEDURE StrToKey_CloseSkey;
BEGIN {StrToKey_CloseSkey}
   CISAM_Close(SkeyDict)
END {StrToKey_CloseSkey};


