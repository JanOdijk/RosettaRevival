(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : CONSTRAINTGEN
 *  Creation date   : 26-JUL-1988
 *  Author          : J. Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *
 *EMP:::===================================================================*)

pragma C_include('strings.pf');
pragma C_include('string.pf');
pragma C_include('str.pf');
pragma C_include('logname.pf');
pragma C_include('files.pf');


PROGRAM CONSTRAINTGEN(Lognames);
WITH STRINGS, STRNG, STR, FILES, LOGNAME;

LABEL 99;

CONST

   (*----------------------------------------------------------------------*
    * ErrorLimit    : Maximum number of "back-on-the-rails" actions
    *----------------------------------------------------------------------*)
   ErrorLimit    = 30;

TYPE
   StatusType = ( Correct, InCorrect );

   plosident = ^losident;
   losident = record
                arg:STRING_string;
                next:plosident
              end;
   setofidents = record
                   first,last:plosident
                 end;

VAR

   (*----------------------------------------------------------------------*
    * Global variable section
    *----------------------------------------------------------------------*)
   LogNames  : Text;

   (*----------------------------------------------------------------------*
    * DictFile  : File variable for the input source file
    * Constr    : File variable for the output text file 
    *----------------------------------------------------------------------*)
   DictFile   : FILES_Text;
   Constr     : FILES_Text;

   (*----------------------------------------------------------------------*
    * ch         : The last read character from the input file.
    * ll         : The maximum number of characters on one line.
    * cc         : The column position in the current line of the last
    *              read character.
    * line       : The current line of the input file.
    * curline    : The current line number
    * Status     : Correct : No syntax error
    *              InCorrect : At least one syntax errors
    * errorcount : Number of "back-on-the-rails" actions
    *----------------------------------------------------------------------*)
   ch         : CHAR;
   ll, cc     : FILES_IORange;
   line       : STRING(120);
   curline    : INTEGER;
   Status     : StatusType;
   errorcount : INTEGER;

   (*----------------------------------------------------------------------*
    * StartCPU           : CPU time at beginning of compilation
    * StopCPU            : CPU time at the end of compilation
    *----------------------------------------------------------------------*)
   StartCPU,
   StopCPU    : INTEGER;

   CatSet : SetOfIdents;

procedure initsetofidents(var S1:setofidents);
begin
S1.first:=nil;S1.last:=nil
end;
function stillidents(S1:setofidents):boolean;
begin
if S1.first<>nil then stillidents:=true
else stillidents:=false
end;
procedure appendident(str:STRING_string;var S1:setofidents);
var p:plosident;
begin
new(p);
p^.arg:=str;
p^.next:=nil;
if S1.first=nil then
   begin
   S1.first:=p;
   S1.last:=p
   end
else
   begin
   S1.last^.next:=p;
   S1.last:=p
   end 
end;
procedure takeident(var str:STRING_string;var S1:setofidents);
begin
if S1.first=nil then STRING_constantempty(str)
else
   begin
   str:=S1.first^.arg;
   if S1.first=S1.last then
   	begin
   	S1.first:=nil;S1.last:=nil
   	end
   else S1.first:=S1.first^.next
   end
end;


PROCEDURE GetCH; FORWARD;
PROCEDURE SkipSpaces; FORWARD;
PROCEDURE CatSection; FORWARD;


PROCEDURE error(CONST s: STRING; i: integer);
BEGIN
   writeln(s, ' ', i);
   ErrorCount := ErrorCount+1;
   Status := InCorrect;   
   IF ErrorCount >= ErrorLimit THEN BEGIN   
      GOTO 99
      END
   ELSE BEGIN

      WHILE ((ch <> ';') AND (ch <> '@')) DO GetCh;
      IF ch = '@' THEN GOTO 99;
      GetCh; SkipSpaces;

      WHILE NOT ( ch = '@' ) DO BEGIN
 
         CatSection;
         SkipSpaces;

      END;

      GOTO 99;
   END;
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
      ll := ll+1; line[ll] := ' ';
      curline := curline + 1;
   END;
   cc := cc+1; ch := line[cc]; 
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


PROCEDURE Category(VAR c: STRING_String);
BEGIN
   STRING_ConstantEmpty(c);
   WHILE ch in ['A'..'Z'] DO BEGIN
      STRING_AppendChar(c, c, ch);
      GetCh
   END;
END {Category};


PROCEDURE CatSection;

(*-------------------------------------------------------------------------*
 * The procedure Entry is the central part of the program. It checks the
 * syntax of a lexicon lemma and generates the code for all the output files
 *-------------------------------------------------------------------------*)

VAR 
   cat  : STRING_String;

PROCEDURE Expression;
BEGIN
   FILES_WriteStr(Constr, '           ', FILES_MaxIO, 0, Left);
   WHILE (ch <> '"') AND (ch <> ';') AND (ch <> '@') AND (ch <> '$') DO BEGIN
      FILES_WriteChar(Constr, ch);
      GetCh;
      IF (FILES_Position(Constr) > 60) AND (ch = ' ') THEN BEGIN
         FILES_WriteLine(Constr, TRUE);
         FILES_WriteStr(Constr, '           ', FILES_MaxIO, 0, Left);
      END
   END;
   FILES_WriteLine(Constr, Left);
   IF ch = '@' THEN error('Incorrect end of file marker ', curline);
END {Expression};


PROCEDURE ErrorMessage;
VAR
   i        : INTEGER;
   peculiar : BOOLEAN;
BEGIN
   IF ch = '$' THEN BEGIN
      peculiar := TRUE;
      GetCh; IF ch <> 'P' THEN error('Expected symbol P on line ',curline);
      GetCh; SkipSpaces
      END
   ELSE peculiar := FALSE;

   IF ch <> '"' THEN error('No open quotes on line ', curline);
   GetCh; SkipSpaces;
   i := 0;
   FILES_WriteStr(Constr, '      Warning(f, ''', FILES_MaxIO, 0, Left);
   WHILE ch <> '"' DO BEGIN
      i := i+1;
      IF i > String_Max THEN error('Error message too long on line ', curline);
      FILES_WriteChar(Constr, ch);
      GetCh;
   END;
   GetCh; SkipSpaces;
   IF peculiar THEN BEGIN
      FILES_WriteStr(Constr, '      '', TRUE);', FILES_MaxIO, 0, Left);
      END
   ELSE BEGIN
      FILES_WriteStr(Constr, '      '', FALSE);', FILES_MaxIO, 0, Left);
   END;
   FILES_WriteLine(Constr, Left);
   FILES_WriteStr(Constr, '      status := FALSE;', FILES_MaxIO, 0, Left);
   FILES_WriteLine(Constr, Left);
END {ErrorMessage};


PROCEDURE Clause;
BEGIN
   IF ch <> ':' THEN error('No colon on line ', curline);
   GetCh; SkipSpaces;

   FILES_WriteStr(Constr, '   IF NOT (', FILES_MaxIO, 0, Left);
   FILES_WriteLine(Constr, Left);
   Expression;
   FILES_WriteStr(Constr, '          ) THEN BEGIN', FILES_MaxIO, 0, Left);
   FILES_WriteLine(Constr, Left);

   ErrorMessage;
   FILES_WriteStr(Constr, '   END;', FILES_MaxIO, 0, Left);
   FILES_WriteLine(Constr, Left);
END {Clause};


BEGIN {CatSection}

   IF ch <> '<' THEN error('Expected < symbol on line ', curline);
   GetCh; SkipSpaces;

   Category(Cat); AppendIdent(Cat, CatSet);
   SkipSpaces;

   FILES_WriteStr(Constr, 'FUNCTION Constr_', FILES_MaxIO, 0, Left);
   FILES_WriteString(Constr, Cat, 0, Left);
   FILES_WriteStr(Constr, '(rec: LSDOMAINT_', FILES_MaxIO, 0, Left);
   FILES_WriteString(Constr, Cat, 0, Left);
   FILES_WriteStr(Constr, 'record; VAR f: FILES_Text): BOOLEAN;', FILES_MaxIO, 0, Left);
   FILES_WriteLine(Constr, Left);
   FILES_WriteStr(Constr, 'VAR status : BOOLEAN;', FILES_MaxIO, 0, Left);
   FILES_WriteLine(Constr, Left);
   FILES_WriteStr(Constr, 'BEGIN', FILES_MaxIO, 0, Left);
   FILES_WriteLine(Constr, Left);
   FILES_WriteStr(Constr, '   status := TRUE;', FILES_MaxIO, 0, Left);
   FILES_WriteLine(Constr, Left);
   FILES_WriteStr(Constr, '   WITH rec DO BEGIN', FILES_MaxIO, 0, Left);
   FILES_WriteLine(Constr, Left);

   WHILE ch <> '>' DO BEGIN
      Clause;
   END;   

   FILES_WriteStr(Constr, '   END;', FILES_MaxIO, 0, Left);
   FILES_WriteLine(Constr, Left);
   FILES_WriteStr(Constr, '   Constr_', FILES_MaxIO, 0, Left);
   FILES_WriteString(Constr, Cat, 0, Left);
   FILES_WriteStr(Constr, ' := status;', FILES_MaxIO, 0, Left);
   FILES_WriteLine(Constr, Left);
   FILES_WriteStr(Constr, 'END;', FILES_MaxIO, 0, Left);
   FILES_WriteLine(Constr, Left);

   IF ch <> '>' THEN error('Expected > symbol on line ', curline);
   GetCh; 
   FILES_WriteLine(Constr, Left);
   FILES_WriteLine(Constr, Left);

END {CatSection};


PROCEDURE ModuleHeading;
BEGIN
FILES_WriteStr(Constr, 'pragma C_include(''lsdomaint.pf'');',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'pragma C_include(''files.pf'');',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'pragma C_include(''lsauxdom.pf'');',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'pragma C_include(''lsconstraints.pf'');',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'PROGRAM LSCONSTRAINTS;',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'VAR curline: INTEGER;',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'FUNCTION IMPLIES(p1, p2: BOOLEAN): BOOLEAN;',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'BEGIN',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, '   IMPLIES := ((NOT p1) OR p2);',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'END {IMPLIES};',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'FUNCTION IFF(p1, p2: BOOLEAN): BOOLEAN;',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'BEGIN',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, '   IFF := (((NOT p1) AND (NOT p2)) OR (p1 AND p2));',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'END {IFF};',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'PROCEDURE WARNING(VAR f : FILES_Text;',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, '                  w: PACKED ARRAY[lb1..ub1: INTEGER] OF CHAR;',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, '                  p: BOOLEAN);',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'BEGIN',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, '   IF NOT p THEN BEGIN write(''WARNING: '');',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, '   writeln(w);',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, '   writeln(''WARNING: Violated constraints in lemma ending on line '', curline) END;',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, '   IF p THEN FILES_WriteStr(f, ''PECULIAR: '',FILES_MaxIO, 0, Left)', FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, '   ELSE FILES_WriteStr(f, ''WARNING : '',FILES_MaxIO, 0, Left);',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, '   FILES_WriteStr(f, w, (ub1-lb1+1), 0, Left);',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'FILES_WriteStr(f, '' ....near line '',FILES_MaxIO, 0, Left);',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'FILES_WriteInteger(f, curline, 0, Left);',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'FILES_WriteLine(f, Left);',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'END {WARNING};',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteLine(Constr, Left);
END {ModuleHeading};


PROCEDURE ModuleEnd;
VAR
   c  : STRING_String;
   cs : SetOfIdents;
BEGIN
FILES_WriteStr(Constr, 'FUNCTION InCatSet(c : LSDOMAINT_SyntCat): BOOLEAN;',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'BEGIN',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, '   InCatSet := c IN [',FILES_MaxIO, 0, Left);
   cs := CatSet;
   WHILE StillIdents(cs) DO BEGIN
      TakeIdent(c, cs);
      FILES_WriteString(Constr, C, 0, Left);      
      IF StillIdents(cs) THEN FILES_WriteChar(Constr, ',');
      IF FILES_Position(Constr) > 60 THEN BEGIN
         FILES_WriteLine(Constr, Left);
         FILES_WriteStr(Constr, '                     ',FILES_MaxIO, 0, Left);
      END
   END;
FILES_WriteStr(Constr, ']',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'END {InCatSet};',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'FUNCTION LSCONSTRAINTS_Blex(rec: LSDOMAINT_BlexStruct;',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, '                                     VAR log: FILES_Text;',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, '                                     cl : INTEGER): BOOLEAN;',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'VAR status : BOOLEAN;',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'BEGIN',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, '   curline := cl;',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, '   IF InCatSet(rec.cat) THEN BEGIN',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, '      CASE rec.cat OF',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
   cs := CatSet;
   WHILE StillIdents(cs) DO BEGIN
      TakeIdent(c, cs);
      FILES_WriteStr(Constr, '      ',FILES_MaxIO, 0, Left);
      FILES_WriteString(Constr, C, 0, Left);      
      FILES_WriteStr(Constr, ': status := Constr_',FILES_MaxIO, 0, Left);
      FILES_WriteString(Constr, C, 0, Left);      
      FILES_WriteStr(Constr, '(rec.',FILES_MaxIO, 0, Left);
      FILES_WriteString(Constr, C, 0, Left);      
      FILES_WriteStr(Constr, 'rec, log);',FILES_MaxIO, 0, Left);
      FILES_WriteLine(Constr, Left);
   END;
FILES_WriteStr(Constr, '      END',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, '      END',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, '   ELSE BEGIN',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left); 
FILES_WriteStr(Constr, '      status := TRUE',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, '   END;',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, '   LSCONSTRAINTS_Blex := status;',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteStr(Constr, 'END {LSCONSTRAINTS_Blex};',FILES_MaxIO, 0, Left);
FILES_WriteLine(Constr, Left);
FILES_WriteLine(Constr, Left);
END {ModuleEnd};


PROCEDURE Constraints;

BEGIN
   (*----------------------------------------------------------------------*
    * Open the input file with read access
    *----------------------------------------------------------------------*)
   reset(LogNames);
   LogName_Init(LogNames);
   FILES_Open(DictFile, 'source', 6, 0 );

   (*-------------------------------------------------------------------*
    * Open all lexicon files
    *-------------------------------------------------------------------*)
   FILES_Open(Constr, 'constraints', 11, 3);
   ModuleHeading;

   (*----------------------------------------------------------------------*
    * Continue Syntax checking 
    *----------------------------------------------------------------------*)
   SkipSpaces;
   WHILE not ( ch = '@' ) DO BEGIN

      CatSection;
      SkipSpaces;

   END;

   ModuleEnd;

   FILES_Close(Constr);
   FILES_Close(DictFile);

END;

BEGIN

   (*----------------------------------------------------------------------*
    * Initialization part of the global variables
    *----------------------------------------------------------------------*)
   cc := 0; ll := 0; curline := 0; ch := ' ';
   Status := Correct; ErrorCount := 0;
   InitSetOfIdents(CatSet);
   


   (*----------------------------------------------------------------------*
    * The syntax of the inputfile should be according to Dict
    *----------------------------------------------------------------------*)
   Constraints;



99:
   IF Status = InCorrect THEN BEGIN

      (*-------------------------------------------------------------------*
       * The compiler generates a program crash
       * to inform the DCL shell that the input file was not correct
       *-------------------------------------------------------------------*)
      writeln;
      writeln(' Incorrect Syntax, Error Count = ', ErrorCount:3);
      halt;
   END;
END {CONSTRAINTGEN}.
