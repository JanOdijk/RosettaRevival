(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : StrToMKey
 *  Creation date   :  18-MAY-1988
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(StrToMKey);
pragma C_include('liildict.pf');
pragma C_include('logname.pf');
pragma C_include('cisam.pf');
pragma C_include('globdef.pf');
pragma C_include('windows.pf');
pragma C_include('string.pf');
pragma C_include('strtomkey.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM StrToMKey;
WITH     LIILDICT,
         LOGNAME,
         CISAM,
         GLOBDEF,
         WINDOWS,
         STRNG;
WITH LOOPHOLES;

CONST
   MaxHashTable = 997;

VAR
   MkeyDict : CISAM_FileType;
   MkeyRec  : StrToMkey_RecordDef;
   InitStr  : StrToMkey_StrType;

   HashTable : ARRAY[0..MaxHashTable] OF RECORD
                                            key,
                                            k   : INTEGER;
                                            s   : StrToMKey_StrType;
                                            md  : LIILDICT_MeaningDescr
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


   PROCEDURE StoreKey(str: StrToMKey_StrType; inkey: INTEGER;
                      mdescr : LIILDICT_MeaningDescr); 
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
               md  := Mdescr;
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


   FUNCTION FindKey(str: StrToMKey_StrType; VAR outkey: INTEGER;
                    VAR mdescr: LIILDICT_MeaningDescr): BOOLEAN;
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
            mdescr := HashTable[h].md;
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



PROCEDURE StrToMkey_OpenMkeyRead;
VAR
   i : INTEGER;
BEGIN {StrToMkey_OpenMkey}
   MkeyDict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('mkeyfile')), 8, 
                            Adr(Mkeyrec), SizeOf(Mkeyrec), CISAM_indexed);
   CISAM_DefineKey(MkeyDict, Adr(Mkeyrec.strkey)-Adr(Mkeyrec), SizeOf(Mkeyrec.strkey), 
                    CISAM_String, CISAM_NoDuplicate, CISAM_Up);
   CISAM_DefineKey(MkeyDict, Adr(Mkeyrec.intkey)-Adr(Mkeyrec), SizeOf(Mkeyrec.intkey), 
                    CISAM_Value, CISAM_Duplicate, CISAM_Down);
   CISAM_Open(MkeyDict, CISAM_inp, CISAM_Old);
   FOR i := 1 TO StrToMKey_MaxStrLength DO InitStr := ' ';
END {StrToMkey_OpenMkey};


PROCEDURE StrToMkey_OpenMkeyWrite;
VAR
   i : INTEGER;
BEGIN {StrToMkey_OpenMkey}
   MkeyDict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('mkeyfile')), 8, 
                            Adr(Mkeyrec), SizeOf(Mkeyrec), CISAM_indexed);
   CISAM_DefineKey(MkeyDict, Adr(Mkeyrec.strkey)-Adr(Mkeyrec), SizeOf(Mkeyrec.strkey), 
                    CISAM_String, CISAM_NoDuplicate, CISAM_Up);
   CISAM_DefineKey(MkeyDict, Adr(Mkeyrec.intkey)-Adr(Mkeyrec), SizeOf(Mkeyrec.intkey), 
                    CISAM_Value, CISAM_Duplicate, CISAM_Down);

   CISAM_FileSharing(MkeyDict, CISAM_IO);
   CISAM_Open(MkeyDict, CISAM_out, CISAM_New);


   FOR i := 1 TO StrToMKey_MaxStrLength DO InitStr := ' ';
END {StrToMkey_OpenMkey};


PROCEDURE StrToMkey_OpenMkeyUpdate;
VAR
   i : INTEGER;
BEGIN {StrToMkey_OpenMkey}
   MkeyDict := CISAM_initfile(LOGNAME_findfile(Logname_Tr('mkeyfile')), 8, 
                            Adr(Mkeyrec), SizeOf(Mkeyrec), CISAM_indexed);
   CISAM_DefineKey(MkeyDict, Adr(Mkeyrec.strkey)-Adr(Mkeyrec), SizeOf(Mkeyrec.strkey), 
                    CISAM_String, CISAM_NoDuplicate, CISAM_Up);
   CISAM_DefineKey(MkeyDict, Adr(Mkeyrec.intkey)-Adr(Mkeyrec), SizeOf(Mkeyrec.intkey), 
                    CISAM_Value, CISAM_Duplicate, CISAM_Down);
   CISAM_FileSharing(MkeyDict, CISAM_IO);
   CISAM_TimeOut(MkeyDict,-1);
   CISAM_Open(MkeyDict, CISAM_IO, CISAM_Old);
   FOR i := 1 TO StrToMKey_MaxStrLength DO InitStr := ' ';
END {StrToMkey_OpenMkey};


FUNCTION StrToMkey_GetMkey(strkey: STRING_String;
                                   VAR intkey: INTEGER): BOOLEAN;
VAR
   str : StrToMKey_StrType;
   len : String_Range;
   status : CISAM_StatusType;
   recsize: INTEGER;
   helpstr: STRING(StrToMkey_MaxStrLength);
   j : INTEGER;
BEGIN {StrToMkey_GetMkey}
   STRING_UpperCase(strkey, strkey);
   str := InitStr;
   STRING_ExtractChars(helpstr, len, strkey, 1, STRING_Length(strkey));   
   FOR j:=1 TO len DO str[j] := helpstr[j];
   CISAM_SetIndex(MkeyDict, 1);
   CISAM_ReadByKey(MkeyDict, recsize, Adr(str), SizeOf(str));
   status    := CISAM_OwnStatus;
   IF status = CISAM_NoError THEN BEGIN
      intkey := Mkeyrec.intkey;
      StrToMkey_GetMkey := TRUE
      END
   ELSE BEGIN
      intkey := -1;
      StrToMkey_GetMkey := FALSE
   END;
END {StrToMkey_GetMkey};


FUNCTION StrToMkey_GetMkeyStr(intkey: INTEGER;
                                      VAR strkey: STRING_String): BOOLEAN;
VAR
   str    : STRING_String;
   status : CISAM_StatusType;
   recsize: INTEGER;
BEGIN {StrToMkey_GetMkeyStr}
   CISAM_SetIndex(MkeyDict, 2);
   CISAM_ReadByKey(MkeyDict, recsize, Adr(intkey), SizeOf(intkey));
   status    := CISAM_OwnStatus;
   IF status = CISAM_NoError THEN BEGIN
      STRING_Constant(str, Mkeyrec.strkey, StrToMKey_MaxStrLength);
      STRING_Trim(strkey, str);
      StrToMkey_GetMkeyStr := TRUE
      END
   ELSE BEGIN
      StrToMkey_GetMkeyStr := FALSE
   END;
END {StrToMkey_GetMkeyStr};


FUNCTION StrToMkey_GetMkeyRec(intkey: INTEGER;
                                      VAR rec: StrToMkey_RecordDef): BOOLEAN;
VAR
   str    : STRING_String;
   status : CISAM_StatusType;
   recsize: INTEGER;
BEGIN {StrToMkey_GetMkeyRec}
   CISAM_SetIndex(MkeyDict, 2);
   CISAM_ReadByKey(MkeyDict, recsize, Adr(intkey), SizeOf(intkey));
   status    := CISAM_OwnStatus;
   IF status = CISAM_NoError THEN BEGIN
      rec := MkeyRec;
      StrToMkey_GetMkeyRec := TRUE
      END
   ELSE BEGIN
      StrToMkey_GetMkeyRec := FALSE
   END;
END {StrToMkey_GetMkeyRec};


FUNCTION StrToMkey_PutMkey(strkey: STRING_String;
                                    intkey: INTEGER;
                                    VAR mdescr: LIILDICT_MeaningDescr): BOOLEAN;
VAR
   str : StrToMKey_StrType;
   len : String_Range;
   status : CISAM_StatusType;
   recsize: INTEGER;
   helpstr: STRING(StrToMkey_MaxStrLength);
   j : INTEGER;
BEGIN {StrToMkey_GetMkey}
   STRING_UpperCase(strkey, strkey);
   Mkeyrec.strkey := InitStr;
   Mkeyrec.intkey := intkey;
   MKeyRec.md     := mdescr;
   STRING_ExtractChars(helpstr, len, strkey, 1, STRING_Length(strkey)); 
   FOR j:=1 TO len DO Mkeyrec.strkey[j] := helpstr[j];
   CISAM_SetIndex(MkeyDict, 1);
   CISAM_Write(MkeyDict, SizeOf(Mkeyrec));
   status    := CISAM_OwnStatus;
   IF status = CISAM_NoError THEN BEGIN
      StrToMkey_PutMkey := TRUE
      END
   ELSE BEGIN
      StrToMkey_PutMkey := FALSE
   END;
END {StrToMkey_PutMkey};


FUNCTION StrToMkey_GetHighestMkey(var mkey: INTEGER): BOOLEAN;
VAR
   status : CISAM_StatusType;
   recsize: INTEGER;
BEGIN {StrToMkey_GetHighestMkey}
   CISAM_SetIndex(MkeyDict, 2);
   CISAM_Reset(MkeyDict);
   CISAM_ReadNext(MkeyDict, recsize);
   status    := CISAM_OwnStatus;
   IF status = CISAM_NoError THEN BEGIN
      mkey := Mkeyrec.IntKey;
      StrToMkey_GetHighestMkey := TRUE
      END
   ELSE BEGIN
      StrToMkey_GetHighestMkey := FALSE
   END;
END {StrToMkey_GetHighestMkey};


PROCEDURE StrToMkey_Release;
BEGIN {StrToMkey_Release}
   CISAM_Release(MkeyDict)
END {StrToMkey_Release};


PROCEDURE StrToMkey_CloseMkey;
BEGIN {StrToMkey_CloseMkey}
   CISAM_Close(MkeyDict)
END {StrToMkey_CloseMkey};



