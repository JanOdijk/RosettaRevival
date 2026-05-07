(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : STRKEY
 *  Creation date   : 11-MAY-1988
 *  Author          : J. Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

pragma C_Include('cisam.pf');
pragma C_Include('strtokey.pf');
pragma C_Include('files.pf');
pragma C_Include('string.pf');
pragma C_Include('str.pf');
pragma C_Include('globdef.pf');
pragma C_Include('logname.pf');


PROGRAM STRKEY(LogNames);
WITH
     CISAM, LOGNAME, STRTOKEY, FILES, STRNG, STR, GLOBDEF;

LABEL 99;

VAR
   LogNames : Text;
   DictFile : FILES_Text;
   ch       : CHAR;
   ll, cc   : FILES_IORange;
   line     : STRING(120);
   curentry : INTEGER;

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


PROCEDURE IntKey(VAR i: INTEGER);
BEGIN
   i := 0;
   WHILE NOT (( ch = ',') OR (ch = ' ')) DO BEGIN
      i := i*10;
      i := i+(ord(ch)-ord('0'));
      GetCh
   END;
END {IntKey};

PROCEDURE StrKey(VAR c: STRING_String);
BEGIN
   STRING_ConstantEmpty(c);
   WHILE NOT ((ch = ' ') OR (ch = '@') OR ( ch = '|') ) DO BEGIN
      STRING_AppendChar(c, c, ch);
      GetCh
   END;
END {StrKey};


PROCEDURE Entry;
VAR
   str : STRING_String;
   key : INTEGER;
BEGIN
   curentry := curentry + 1;

   REPEAT
      IF ch = '|' THEN BEGIN
         GetCh; Skipspaces;
      END;
      IntKey(key); SkipSpaces;
      GetCh; SkipSpaces;
      StrKey(str);
      SkipSpaces;

      (*----------------------------------------------------------------------*
       * Write StrKeyDICT record to file
       *----------------------------------------------------------------------*)

      StrToKey_Putskey(str, key);

   UNTIL (ch <> '|');

   Skipspaces;

END {Entry};


PROCEDURE CompleteDict;

BEGIN
   Globdef_SetAnGenMode(AnMode);
   StrToKey_OpenskeyWrite;

   FILES_Open(DictFile, 'inputfile', 9, 1 );

   SkipSpaces;
   WHILE not ( ch = '@' ) DO BEGIN

      Entry;
      SkipSpaces;
   END;

   StrToKey_Closeskey; 

END;

BEGIN
   reset(LogNames);
   Logname_Init(LogNames);

   cc := 0; ll := 0; curentry := 0; ch := ' ';

   CompleteDict;

99:

END {SDICTGEN}.
