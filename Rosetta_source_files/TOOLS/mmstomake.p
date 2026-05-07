(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : MMStoMake
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


PROGRAM MMStoMake;

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
   Silent   : BOOLEAN;

PROCEDURE error(CONST s: STRING; i: integer);
BEGIN
   writeln(s, ' ', i);
   GOTO 99
END {error};


PROCEDURE GetChar;
var c : CHAR;
BEGIN
   IF cc = ll THEN BEGIN
      IF NOT Silent THEN writeln;
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
   IF ch IN ['A'..'Z'] THEN BEGIN
      ch := chr(ord(ch)+32)
   END;
END {GetChar};


PROCEDURE PutChar(c: CHAR);
BEGIN
   IF NOT Silent THEN write(c);
END;


PROCEDURE PutChars(CONST s: STRING);
BEGIN
   IF NOT Silent THEN write(s);
END;


FUNCTION IsEndOfLine: BOOLEAN;
BEGIN
   IsEndOfLine := (cc=ll) OR EndOfFile
END {IsEndOfLine};

PROCEDURE GetCh;
BEGIN
   GetChar;
   { Skip Comments }
   WHILE (ch = '!') AND (cc = 1) DO BEGIN
      PutChar('#'); GetChar;
      WHILE (cc<>1) AND NOT EndOfFile DO BEGIN
         PutChar(ch);
         GetChar;
      END;
   END
END {GetCh};


PROCEDURE SkipSpaces;
BEGIN
   WHILE (ch = ' ') AND NOT EndOfFile DO BEGIN
      PutChar(ch);
      GetCh; 
   END;
END {SkipSpaces};

PROCEDURE SkipSpacesNoLine;
BEGIN
   WHILE (ch = ' ') AND (cc < ll) DO BEGIN
      PutChar(ch);
      GetCh; 
   END;
END {SkipSpacesNoLine};

PROCEDURE SkipLine;
BEGIN
   cc := ll; GetCh
END;


PROCEDURE ProcessFileName;
VAR
   part1, part2, part3 : STRING(50);
BEGIN
   part1 := '';
   part2 := '';
   part3 := '';

   WHILE NOT (ch IN [':',' ',','])  DO BEGIN 
      part1 := part1 || ch;
      GetCh;
   END;

   IF (ch = ':')  THEN BEGIN
      GetCh;
      WHILE NOT (ch IN ['.',',',' '])  DO BEGIN
         part2 := part2 || ch;
         GetCh;
      END;
      IF ch = '.' THEN BEGIN
         GetCh;
         WHILE NOT (ch IN [',',' '])  DO BEGIN
            part3 := part3 || ch;
            GetCh;
         END;
         IF part3 = 'obj' THEN part3 := 'o'
         ELSE IF (part3 = 'pen') AND Targets THEN Silent := TRUE
         ELSE IF (part3 = 'opt') AND Targets THEN Silent := TRUE
         ELSE IF (part3 = 'exe') AND Targets THEN Silent := TRUE
         ELSE IF (part3 = 'pen') AND Sources THEN part3 := 'pf'
         ELSE IF (part3 = 'pas') THEN part3 := 'p'
         ELSE IF (part3 = 'env') THEN part3 := 'pf';

         PutChars(part1||'/'||part2||'.'||part3);
         END  
      ELSE BEGIN
         PutChars(part1||'/'||part2)
      END;
      END
   ELSE PutChars(part1);

   SkipSpacesNoLine;
END;


PROCEDURE DepDescr;
VAR
   nextsource, 
   nexttarget     : BOOLEAN;
   part1          : String(100);
   SaveSilent     : BOOLEAN;
BEGIN

   Targets := TRUE;
   nexttarget := FALSE;
   REPEAT
      SkipSpacesNoLine;
      ProcessFileName;
      IF ch = ',' THEN BEGIN
         nexttarget := TRUE;
         GetCh; SkipSpacesNoline;
         IF IsEndOfLine THEN BEGIN
            PutChars(' \');
            SkipLine;
            END
         ELSE IF ch = '-' THEN BEGIN 
            Getch; SkipSpacesNoLine;
            PutChars(' \'); 
            SkipLine
         END
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
         IF ch = ',' THEN BEGIN 
            PutChar(' '); GetCh; SkipSpacesNoLine; 
            nextsource := TRUE;
            IF ch = '-' THEN BEGIN 
               Getch; SkipSpacesNoLine;
               PutChar('\'); 
               SkipLine;
            END;
            END
         ELSE BEGIN
            nextsource := FALSE;
            PutChar(';');
            SkipLine;
        END;
      UNTIL NOT nextsource;
   END;

   Sources := FALSE;
   Actions := TRUE;
   SaveSilent := Silent; Silent := TRUE;
   SkipSpacesNoLine;
   Silent := SaveSilent;
   WHILE NOT IsEndOfLine DO BEGIN
      IF ch IN ['0'..'9'] THEN BEGIN
         WHILE NOT IsEndOfLine DO BEGIN
            GetCh;
         END
         END
      ELSE BEGIN
      PutChar(chr(9));
      IF ch = '@' THEN BEGIN
         PutChar(ch); GetCh;
      END;
      part1 := '';
      WHILE NOT (ch IN [':',' ']) DO BEGIN
         part1 := part1 || ch;
         PutChar(ch); GetCh;
      END;
      IF (part1 = 'actions') THEN BEGIN
         IF ch = ':' THEN BEGIN
            PutChar('/'); GetCh;
         END;
         WHILE NOT IsEndOfLine DO BEGIN
            PutChar(ch); GetCh;
         END
         END
      ELSE BEGIN
         WHILE NOT IsEndOfLine DO BEGIN
            PutChar(ch); GetCh;
         END
      END;
      END;
      SkipLine; 
      SaveSilent := Silent; Silent := TRUE;
      SkipSpacesNoLine;
      Silent := SaveSilent;
   END;
   Actions := FALSE;
END {DepDescr};



PROCEDURE MakeFile;
VAR
   include : STRING(100);
BEGIN

   reset(Lognames,'lognames');
   Logname_Init(LogNames);
   reset(mf,Logname_Tr('inputfile'));

   SkipSpaces;
   SILENT := FALSE;
   WHILE NOT EndOfFile DO BEGIN
      include := '';
      IF ch = '.' THEN WHILE NOT IsEndOfLine DO GetCh
      ELSE DepDescr;
      Silent := FALSE;
      SkipSpaces;
   END;

END;

BEGIN
   cc := 0; ll := 0; curline := 0; ch := ' ';
   
   MakeFile;

99:

END {MakeFile}.
