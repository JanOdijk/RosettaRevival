(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : FIXIDGEN
 *  Creation date   : 11-DEC-1986
 *  Author          : J. Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

pragma C_include('lifixiddict.pf');
pragma C_include('cisam.pf');
pragma C_include('files.pf');
pragma C_include('logname.pf');


PROGRAM FIXIDGEN(LogNames);

WITH  LIFIXIDDICT, CISAM, FILES, LOGNAME;

LABEL 99;

VAR
   LogNames : Text;
   DictFile : FILES_Text;
   rec      : LIFIXIDDICT_RecordDef;
   ch       : CHAR;
   ll, cc   : FILES_IORange;
   line     : STRING(120);
   curline  : INTEGER;
   NrIndices: INTEGER;
   IdList   : ARRAY[1..LIFIXIDDICT_MaxIdList] OF LIFIXIDDICT_RecordDef;

PROCEDURE WriteLetterTreeToFile;
VAR
   IdDict    : CISAM_FileType;
   i         : INTEGER;
BEGIN
   IdDict := CISAM_InitFile(LogName_Tr('OutputIdDict'), 12, 
                            Loopholes.Adr(rec), Loopholes.SizeOf(rec), 
                            CISAM_sequential);
   CISAM_Open(IdDict, CISAM_out, CISAM_New);

   FOR i:=1 TO NrIndices DO BEGIN
      rec := IdList[i];
      CISAM_Write(IdDict, Loopholes.SizeOf(rec));   
   END;

   CISAM_Close(IdDict);
END {WriteLetterTreeToFile};


FUNCTION AddWord(CONST str: STRING;
                 len: INTEGER;
                 i  : INTEGER;
                 index : INTEGER;
                 VAR lastindex : INTEGER): INTEGER;
VAR
   returnindex,
   nxtindex,
   newindex    : INTEGER;
   found       : BOOLEAN;
BEGIN
{
   writeln(str[i], len, i, index, lastindex);
}
   returnindex := index;
   newindex    := index;
   found       := FALSE;
   WHILE (newindex <> -1) AND NOT found DO BEGIN
      index := newindex;
      IF IdList[index].ch <> str[i] 
      THEN newindex := IdList[index].nxtchar
      ELSE found := TRUE      
   END;
   IF NOT found THEN BEGIN
      lastindex := lastindex+1;
      newindex  := lastindex;
      IF index <> -1 
      THEN IdList[index].nxtchar := newindex
      ELSE returnindex := newindex;
      WITH IdList[newindex] DO BEGIN
         ch := str[i];
         mark := FALSE;
         nxtlevel := -1;
         nxtchar  := -1;
      END;
      index := newindex
   END;

   IF i = len THEN BEGIN
      IdList[index].mark := TRUE
      END
   ELSE BEGIN
      nxtindex := AddWord(str, len, i+1, IdList[index].nxtlevel, lastindex);
      IdList[index].nxtlevel := nxtindex
   END;    
   AddWord := returnindex
END {AddWord};


PROCEDURE AddToLetterTree(CONST s: STRING;
                          i: integer);
VAR 
   dummy : INTEGER;
BEGIN
   dummy := AddWord(s, i, 1, 1, NrIndices);
END {AddToLetterTree};


PROCEDURE InitLetterTree;
BEGIN
   NrIndices := 1;
   WITH IdList[NrIndices] DO BEGIN
      ch := 'a';
      mark := FALSE;
      nxtlevel := -1;
      nxtchar  := -1;
   END;
END {InitLetterTree};


PROCEDURE error(CONST s: STRING; i: integer);
BEGIN
   writeln(s, ' ', i);
   GOTO 99
END {error};


PROCEDURE GetChar;
BEGIN
   IF cc = ll THEN BEGIN
      IF FILES_EndOfFile(DictFile) THEN BEGIN
         writeln('FILE INCOMPLETE');
         GOTO 99
      END;
      ll := 119; cc := 0;
      FILES_ReadToEndOfLine(DictFile, line, ll);
      FILES_SkipLine(DictFile);
      ll := ll+1; line[ll] := ' '
   END;
   cc := cc+1; ch := line[cc]
END {GetChar};


PROCEDURE GetCh;
BEGIN
   GetChar;
   IF ch = '{' THEN BEGIN
      WHILE ch <> '}' DO GetChar;
      GetChar
   END
END {GetCh};


PROCEDURE SkipSpaces;
BEGIN
   WHILE ch = ' ' DO GetCh;
END {SkipSpaces};


PROCEDURE Word(VAR s: STRING; 
               VAR i : INTEGER);
BEGIN
   WHILE ch in ['a'..'z', 'A'..'Z', '¿'..'ý',  '0'..'9', '¢', 'µ', 
                '.', '-', '''', '!', '?', '¡', '/', ':']
         DO BEGIN
      i := i+1;
      s[i] := ch;
{
      write(ch);
}
      GetCh
   END;
{
   writeln;
}
END {Stem};


PROCEDURE Entry;
VAR
   i,j : INTEGER;
   w   : STRING(LIFIXIDDICT_MaxStr);
BEGIN
   curline := curline+1;

   FOR j := 1 TO LIFIXIDDICT_MaxStr DO w[j] := ' ';
   i := 0;
   Word(w,i);
   Skipspaces;
   i := i+1; w[i] := ' ';

   Word(w, i);
   SkipSpaces;
   WHILE ch <> ',' DO BEGIN
      i := i+1; w[i] := ' ';
      Word(w,i);
      SkipSpaces; 
   END;
   GetCh; 

   (*----------------------------------------------------------------------*
    * Code Generation for the current entry.
    *----------------------------------------------------------------------*)

    AddToLetterTree(w,i);


END {Entry};


PROCEDURE Dict;

BEGIN
   reset(Lognames);
   Logname_Init(LogNames);

   FILES_Open(DictFile, 'InputIdDict', 11, 0 );
   InitLetterTree;

   SkipSpaces;
   WHILE not ( ch = '@' ) DO BEGIN

      Entry;
      SkipSpaces;

   END;

   WriteLetterTreeToFile;

END;

BEGIN
   cc := 0; ll := 0; curline := 0; ch := ' ';

   Dict;

99:

END {SDICTGEN}.
