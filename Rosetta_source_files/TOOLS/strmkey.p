(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : STRMKEY
 *  Creation date   : 11-MAY-1988
 *  Author          : J. Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)
pragma C_Include('cisam.pf');
pragma C_Include('strtomkey.pf');
pragma C_Include('liildict.pf');
pragma C_Include('files.pf');
pragma C_Include('string.pf');
pragma C_Include('globdef.pf');
pragma C_Include('logname.pf');


PROGRAM STRMKEY(LogNames);
WITH
     CISAM, LOGNAME, LIILDICT, STRTOMKEY, FILES, STRNG, GLOBDEF;

LABEL 99;

VAR
   LogNames : Text;
   DictFile : FILES_Text;
   ch       : CHAR;
   ll, cc   : FILES_IORange;
   line     : STRING(120);
   curentry : INTEGER;
   emptymdescr: LIILDict_MeaningDescr;

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


PROCEDURE StrKey(VAR c: STRING_String);
BEGIN
   STRING_ConstantEmpty(c);
   WHILE NOT ((ch = ' ') OR (ch = '@') OR ( ch = '|') ) DO BEGIN
      STRING_AppendChar(c, c, ch);
      GetCh
   END;
END {StrKey};


PROCEDURE MD(VAR m: LIILDict_MeaningDescr);
VAR i: INTEGER;
BEGIN
   m := emptymdescr;
   i := 0;
   WHILE ( ch <> '"' ) AND ( i < LIILDict_MaxMDLength ) DO BEGIN
      i := i+1; m[i] := ch; 
      GetCh
   END;
   IF ( i = LIILDICT_MaxMDLength ) AND ( ch <> '"' ) THEN BEGIN
      error(' Meaning description too long in entry ', curentry);
   END;
END {MD};


PROCEDURE Entry;
VAR
   str   : STRING_String;
   mdescr: LIILDict_MeaningDescr;
BEGIN
   curentry := curentry+1;

   REPEAT
      IF ch = '|' THEN BEGIN
         GetCh; Skipspaces;
      END;
      StrKey(str);
      SkipSpaces;

      (*----------------------------------------------------------------------*
       * Write StrKeyDICT record to file
       *----------------------------------------------------------------------*)

      IF ( ch = '"' ) THEN BEGIN
         GetCh; SkipSpaces;
         MD(mdescr);
         GetCh; SkipSpaces
         END
      ELSE BEGIN
         mdescr := emptymdescr
      END;

      StrToMKey_PutMkey(str, curentry, mdescr);

   UNTIL (ch <> '|');

   Skipspaces;


END {Entry};


PROCEDURE CompleteDict;

BEGIN

   StrToMKey_OpenMkeyWrite;

   FILES_Open(DictFile, 'inputfile', 9, 1 );

   SkipSpaces;

   WHILE not ( ch = '@' ) DO BEGIN

      Entry;
      SkipSpaces;
   END;

   StrToMKey_CloseMkey; 

END;

VAR
   i: INTEGER;
BEGIN

   reset(LogNames);
   Logname_Init(LogNames);

   cc := 0; ll := 0; curentry := 0; ch := ' ';
   FOR i := 1 TO LIILDict_MaxMDLength DO emptymdescr[i] := ' ';

   CompleteDict;

99:

END {SDICTGEN}.
