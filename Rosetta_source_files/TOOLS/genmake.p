(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : GenMake
 *  Creation date   : 
 *  Author          : J. Rous
 *
 *  Copyright (c) 1991, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

pragma C_include('strings.pf');
pragma C_include('cisam.pf');
pragma C_include('logname.pf');


PROGRAM GenMake;

WITH  CISAM, LOGNAME;

LABEL 99;

VAR

   LogNames : Text;
   mf       : Text;
   ch       : CHAR;
   ll, cc   : INTEGER;
   line     : STRING(120);
   curline  : INTEGER;
   EndOfFile: BOOLEAN;
   Targets,
   Sources,
   Actions  : BOOLEAN;

PROCEDURE error(CONST s: STRING; i: integer);
BEGIN
   writeln(s, ' ', i);
   GOTO 99
END {error};


PROCEDURE GetChar;
var c : CHAR;
BEGIN
   IF cc = ll THEN BEGIN
      writeln;
      IF eof(mf) THEN BEGIN
         EndOfFile := TRUE;
         END
      ELSE BEGIN
         ll := 0; cc := 0; curline := curline+1; line := '';
         WHILE NOT eoln(mf) DO BEGIN
            ll := ll+1; 
            read(mf,c);
            line := line||c;
         END;
         readln(mf);
         ll := ll+1; line := line||' '
      END
   END;
   cc := cc+1; ch := line[cc];
END {GetChar};


PROCEDURE PutChar(c: CHAR);
BEGIN
   write(c);
END;


PROCEDURE PutChars(CONST s: STRING);
BEGIN
   write(s);
END;


FUNCTION IsEndOfLine: BOOLEAN;
BEGIN
   IsEndOfLine := (cc=ll) OR EndOfFile
END {IsEndOfLine};

PROCEDURE GetCh;
BEGIN
   GetChar;
   { Skip Comments }
   WHILE (ch = '#') AND (cc = 1) DO BEGIN
      PutChar(ch); GetChar;
      WHILE (cc<>1) AND NOT EndOfFile DO BEGIN
         PutChar(ch);
         GetChar;
      END;
   END
END {GetCh};


PROCEDURE SkipSpaces;
BEGIN
   WHILE (ch IN [' ',chr(9)]) AND NOT EndOfFile DO BEGIN
      PutChar(ch);
      GetCh; 
   END;
END {SkipSpaces};

PROCEDURE SkipSpacesNoLine;
BEGIN
   WHILE (ch IN [' ',chr(9)]) AND (cc < ll) DO BEGIN
      PutChar(ch);
      GetCh; 
   END;
END {SkipSpacesNoLine};

PROCEDURE SkipLine;
BEGIN
   cc := ll; GetCh
END;

PROCEDURE FindFile(CONST fin1,fin2: STRING; 
                   VAR fout: STRING);
VAR
  dummy : CISAM_Time; 
  nr    : INTEGER;
  found : BOOLEAN;
  s     : STRING(100);
BEGIN
   nr := 1; found := FALSE; 
   IF (Targets OR Sources) AND
      (fin1 <> '') THEN fout := fin1||'/target/'||fin2
   ELSE fout := fin1||'/'||fin2;
   WHILE NOT found AND (nr <> -1) DO BEGIN
      IF LogName_TranslateEquiNr(fin1,s,nr) THEN BEGIN
         s := s||fin2; 
         cisam_revisiondate(s,0,found,dummy);
         IF found THEN fout := s;
         END
      ELSE nr := -1;
   END;
END {FindFile};


PROCEDURE ProcessFileName;
VAR
   part1, part2, part3 : STRING(50);
   npart : STRING(100);
BEGIN
   part1 := '';
   part2 := '';
   part3 := '';

   WHILE NOT (ch IN ['/','\',';',' '])  DO BEGIN 
      part1 := part1 || ch;
      GetCh;
   END;
   IF part1 = '$(language)' THEN part1 := LogName_Tr('language');
   IF (ch = '/')  THEN BEGIN
      GetCh;
      WHILE NOT (ch IN ['\',';',' '])  DO BEGIN
         part2 := part2 || ch;
         GetCh;
      END;
      FindFile(part1, part2, npart);
      PutChars(npart)
      END
   ELSE PutChars(part1);

   SkipSpacesNoLine;
END;


PROCEDURE DepDescr;
VAR
   nextsource, 
   nexttarget     : BOOLEAN;
   npart,
   part1,
   part2          : String(100);
BEGIN

   Targets := TRUE;
   nexttarget := FALSE;
   REPEAT
      SkipSpacesNoLine;
      ProcessFileName;
      IF ch <> ':' THEN BEGIN
         nexttarget := TRUE;
         IF ch = '\' THEN BEGIN
            PutChar(ch); GetCh; SkipSpacesNoLine;
            SkipLine;
         END;
         END
      ELSE nexttarget := FALSE; 
   UNTIL NOT nexttarget;

   SkipSpacesNoLine;
   IF ch <> ':' THEN error('expected colon ',curline);
   PutChar(ch); GetCh; SkipSpacesNoLine;

   Targets := FALSE;
   Sources := TRUE;
   IF IsEndOfLine THEN BEGIN
      {no dependencies} 
      SkipLine
      END
   ELSE BEGIN
      nextsource := FALSE;
      REPEAT
         SkipSpacesNoLine;
         ProcessFileName;
         IF ch = '\' THEN BEGIN 
            PutChar('\'); GetCh; SkipSpacesNoLine; 
            SkipLine;
            nextsource := TRUE;
            END
         ELSE IF ch = ';' THEN BEGIN 
               PutChar(';'); GetCh; SkipSpacesNoLine;
               SkipLine;
               nextsource := FALSE;
            END
         ELSE BEGIN
            nextsource := TRUE;
         END;
      UNTIL NOT nextsource;
   END;

   Sources := FALSE;
   Actions := TRUE;
   SkipSpacesNoLine;
   WHILE NOT IsEndOfLine DO BEGIN
      IF ch = '@' THEN BEGIN
         PutChar(ch); GetCh;
      END;
      part1 := ''; 
      part2 := '';
      WHILE NOT (ch IN ['/',' ']) DO BEGIN
         part1 := part1 || ch;
         GetCh;
      END;
      IF (part1 = 'actions') THEN BEGIN
         IF ch = '/' THEN GetCh;
         WHILE ch <> ' ' DO BEGIN
            part2 := part2 || ch;
            GetCh;
         END;
         FindFile(part1, part2, npart);
         PutChars(npart);
         WHILE NOT IsEndOfLine DO BEGIN
            PutChar(ch); GetCh;
         END
         END
      ELSE BEGIN
         PutChars(part1);
         WHILE NOT IsEndOfLine DO BEGIN
            PutChar(ch); GetCh;
         END
      END;
      SkipLine; 
      SkipSpacesNoLine;
   END;
   Actions := FALSE;
END {DepDescr};



PROCEDURE MakeFile;
VAR
   include : String(100);
BEGIN

   reset(Lognames,'lognames');
   Logname_Init(LogNames);
   reset(mf,Logname_Tr('inputfile'));

   SkipSpaces;
   WHILE NOT EndOfFile DO BEGIN
      IF ch = '!' THEN BEGIN
         GetCh; include := '';
         WHILE (ch <> ' ') AND NOT IsEndOfLine DO BEGIN
            include := include||ch; GetCh;
         END;
         IF include = 'include' THEN BEGIN
            PutChars(include);
            SkipSpacesNoLine;
            ProcessFileName;
            writeln;
            END
         ELSE BEGIN
            PutChar('.'); PutChars(include);
            WHILE NOT IsEndOfLine DO BEGIN
            PutChar(ch); GetCh;
            END;
         END
         END
      ELSE IF ch = '.' THEN BEGIN
         PutChar('.'); GetCh; DepDescr;
         END
      ELSE DepDescr;
      SkipSpaces;
   END;

END;

BEGIN
   cc := 0; ll := 0; curline := 0; ch := ' ';
   
   MakeFile;

99:

END {MakeFile}.
