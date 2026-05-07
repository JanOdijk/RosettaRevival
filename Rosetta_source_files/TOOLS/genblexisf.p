(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : GENBLEXISF
 *  Creation date   : 26-JUL-1988
 *  Author          : F. UITTENBOGAARD
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Program parameters:
 *                    The following logical names should have a correct value
 *                    before this program is started:
 *
 *                    The input file :  dict
 *                    The  lexicons : blex
 *                    The key definition files : askeyfile
 *                    The compiler-mode parameter : mode
 *                    
 *
 *EMP:::===================================================================*)

pragma C_Include('logname.pf');
pragma C_Include('cisam.pf');
pragma C_Include('strings.pf');
pragma C_Include('string.pf');
pragma C_Include('str.pf');
pragma C_Include('strtokey.pf');
pragma C_Include('globdef.pf');
pragma C_Include('files.pf');
pragma C_Include('ldidpatterns.pf');
pragma C_Include('ldblex.pf');
pragma C_Include('lisdict.pf');
pragma C_Include('lsconstraints.pf');
pragma C_Include('lsdomaint.pf');
pragma C_Include('lsconvattr.pf');
pragma C_Include('ldconvrec.pf');
pragma C_Include('ldstrtotype.pf');
pragma C_Include('interface1.pf');
pragma C_Include('mem.pf');


PROGRAM GENBLEXISF(Lognames);
WITH     STRINGS,
         STRNG,
         STR,
         LOGNAME,
         CISAM,
         STRTOKEY,
         GLOBDEF,
         FILES,
         LDIDPATTERNS,
         LDBLEX,
         LISDICT,
         LSCONSTRAINTS,
         LSDOMAINT,
         LSCONVATTR,
         LDCONVREC,
         LDSTRTOTYPE,
         INTERFACE1,
         MEM;


LABEL 99;

CONST

   (*----------------------------------------------------------------------*
    * ErrorLimit    : Maximum number of "back-on-the-rails" actions
    *----------------------------------------------------------------------*)
   ErrorLimit    = 30;

TYPE
   StatusType = ( Correct, InCorrect );

VAR

   Lognames : Text;
   (*----------------------------------------------------------------------*
    * Global variable section
    *----------------------------------------------------------------------*)

   (*----------------------------------------------------------------------*
    * DictFile  : File variable for the input source file
    * LogFile   : File variable for the log file
    *----------------------------------------------------------------------*)
   DictFile   : FILES_Text;
   LogFile    : FILES_Text;

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
    * curcat  : Syntactical category of the last read lemma .
    * attrbs  : Attribute datastructure of the last read lemma .
    *----------------------------------------------------------------------*)
   curcat     : STRING_String;
   attrbs     : LDCONVREC_pAttrStruct;

   (*----------------------------------------------------------------------*
    * Variables which are used to store all idpatterns in verbpattern 
    * attribute ( if present )
    *----------------------------------------------------------------------*)
   OldIdP,
   FirstIdP    : LDCONVREC_pSetValueType;

   (*----------------------------------------------------------------------*
    * Buffer variables for storing BLex data of the current lemma
    *----------------------------------------------------------------------*)
   BlexRecord             : LSDOMAINT_BlexStruct;
   pBlexRecord            : ^LSDOMAINT_BlexStruct;

   (*----------------------------------------------------------------------*
    * Buffer variables for storing Sict data of the current lemma
    *----------------------------------------------------------------------*)
   SDictBuffer            : LISDICT_RecordDef;

   (*----------------------------------------------------------------------*
    * StartCPU           : CPU time at beginning of compilation
    * StopCPU            : CPU time at the end of compilation
    * NrEntries          : Number of lemma's
    * NrBlexEntries      : Number of written BLEX records
    *----------------------------------------------------------------------*)
   StartCPU,
   StopCPU,
   NrEntries,
   NrBlexEntries: INTEGER;

   (*----------------------------------------------------------------------*
    * Marked : TRUE  : Call to MEM_Mark has been done
    *          FALSE : No .....
    * Code   : TRUE  : Code is being generated 
    *          FALSE : No ......
    * OwnStack    : StackId of the stack which is to be used.
    * OwnStackPtr : Stack Ptr in the stack which is to be used.
    *----------------------------------------------------------------------*)
   Marked      : BOOLEAN;
   Code        : BOOLEAN;
   OwnStack    : Mem_Stack;
   OwnStackPtr : Mem_StackPtr;

PROCEDURE GetCH; FORWARD;
PROCEDURE SkipSpaces; FORWARD;
PROCEDURE Entry; FORWARD;


PROCEDURE InitStatistics;
BEGIN
   NrEntries         := 0;
   NrBlexEntries     := 0;
END {InitStatistics};


PROCEDURE Statistics;
BEGIN
   IF Code THEN BEGIN
      writeln('Lexicon compiler executed in Code Generation Mode.');
      writeln;
      writeln('Number of entries processed        : ',NrEntries);
      writeln('Number of BLEX entries created     : ',NrBlexEntries);
      writeln('CPU time                           : ', (StopCPU-StartCPU));
      FILES_WriteLine(LogFile, Left);
      FILES_WriteStr(LogFile, 'Lexicon compiler executed in Code Generation Mode.',FILES_MaxIO, 0, Left);
      FILES_WriteLine(LogFile, Left);
      FILES_WriteLine(LogFile, Left);
      FILES_WriteStr(LogFile, 'Number of entries processed        : ',FILES_MaxIO, 0, Left);
      FILES_WriteInteger(LogFile,NrEntries, 0, Left);
      FILES_WriteLine(LogFile, Left);
      FILES_WriteStr(LogFile, 'Number of BLEX entries created     : ',FILES_MaxIO, 0, Left);
      FILES_WriteInteger(LogFile,NrBlexEntries, 0, Left);
      FILES_WriteLine(LogFile, Left);
      FILES_WriteStr(LogFile, 'CPU time                           : ',FILES_MaxIO, 0, Left);
      FILES_WriteInteger(LogFile, (StopCPU-StartCPU), 0, Left);
      FILES_WriteLine(LogFile, Left);
      END
   ELSE BEGIN
      writeln('Lexicon compiler executed in Syntax Check Mode.');
      writeln;
      writeln('Number of entries processed        : ',NrEntries);
      writeln('CPU time                           : ', (StopCPU-StartCPU));
      FILES_WriteLine(LogFile, Left);
      FILES_WriteStr(LogFile, 'Lexicon compiler executed in Syntax Check Mode.',FILES_MaxIO, 0, Left);
      FILES_WriteLine(LogFile, Left);
      FILES_WriteLine(LogFile, Left);
      FILES_WriteStr(LogFile, 'Number of entries processed        : ',FILES_MaxIO, 0, Left);
      FILES_WriteInteger(LogFile,NrEntries, 0, Left);
      FILES_WriteLine(LogFile, Left);
      FILES_WriteStr(LogFile, 'CPU time                           : ',FILES_MaxIO, 0, Left);
      FILES_WriteInteger(LogFile, (StopCPU-StartCPU), 0, Left);
      FILES_WriteLine(LogFile, Left);
   END;
END {Statistics};


PROCEDURE YesOrNoCode;
BEGIN
   CODE := TRUE;
END {YesOrNoCode};


PROCEDURE Mark;
BEGIN
   IF Marked THEN writeln('WARNING: nested Mark');
   Mem_Mark(OwnStack, OwnStackPtr);
   Marked := TRUE
END {Mark};


PROCEDURE Release;
BEGIN
   IF NOT Marked THEN writeln('WARNING: Release without Mark');
   Marked := FALSE;
   Mem_Release(OwnStack, OwnStackPtr);
END {Release};


PROCEDURE error(CONST s: STRING; i: integer);
VAR
   stackptr: Mem_StackPtr;
BEGIN
   writeln('ERROR : ', s, ' ', i);
   FILES_WriteStr(LogFile, 'ERROR : ' ,FILES_MaxIO, 0, Left);
   FILES_WriteStr(LogFile, s, FILES_MaxIO, 0, Left);
   FILES_WriteStr(LogFile, '  ' ,FILES_MaxIO, 0, Left);
   FILES_WriteInteger(LogFile,NrEntries, 0, Left);
   FILES_WriteLine(LogFile, Left);
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
 
         Mem_BottomDefault;
         Mem_MarkDefault(stackptr);
         Entry;
         Mem_BottomDefault;
         Mem_ReleaseDefault(stackptr);

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
   cc := cc+1; ch := line[cc]
END {GetChar};

PROCEDURE GetCh;
BEGIN
   GetChar;
   IF ch = '{' THEN BEGIN
      WHILE ch <> '}' DO GetChar;
      GetChar;
   END;
   IF ord(ch) < ord(' ') THEN ch := ' '
END {GetCh};


PROCEDURE SkipSpaces;
BEGIN
   WHILE ch = ' ' DO GetCh;
END {SkipSpaces};


PROCEDURE ConVertToInteger(s: STRING_String; VAR i : INTEGER);
VAR
   astr : STR_String;
   len1 : STRING_Range;
BEGIN
   STRING_ExtractChars(astr, len1, s, 1, STRING_Length(s));
   STR_StrToInteger(astr, len1, i);
END {ConVertToInteger};


PROCEDURE ConVertToString(i : INTEGER; VAR s: STRING_String);
VAR
   astr : STRING(20);
   len1 : STR_Range;
BEGIN
   STR_IntegerToStr(i, astr, len1);
   STRING_Constant(s, astr, len1);
END {ConVertToString};


PROCEDURE CheckCatSwitch(cat: STRING_String;
                         VAR attr: LDCONVREC_pAttrStruct);
VAR
   nxt, prv : LDCONVREC_pAttrstruct;
BEGIN
   Mem_TopDefault;
   IF STRING_Compare(cat, curcat) <> 0 THEN BEGIN
      Release;
      Mark;
      attr := LDCONVREC_CatAttrbs(cat);
      nxt := NIL;
      Mem_NewDefault(Loopholes.SIZEof(LDCONVREC_AttrStruct), 
                     Loopholes.Retype(prv,Mem_Ptr));
      prv^.fieldname.str := 'KEY';
      prv^.fieldname.len := 3;
      prv^.nextattr := nxt;
      WHILE attr <> NIL DO BEGIN
	 nxt := attr^.NextAttr;
	 attr^.nextattr := prv;
	 prv := attr;
	 attr := nxt
      END;
      attr := prv;
   END;
   Mem_BottomDefault;
END {CheckCatSwitch};


PROCEDURE S_Key(VAR a: STRING_String);
VAR
   b     : STRING_String;
   i     : INTEGER;
   c     : STRING(50);
   len   : Str_Range;
   found : BOOLEAN;
BEGIN
   STRING_ConstantEmpty(a);
   IF ch = '$' THEN BEGIN
      GetCh;
      STRING_ConstantEmpty(b);
      WHILE ch in ['a'..'z', 'A'..'Z', '¿'..'ý', '0'..'9', '_',
                   '.', '-', '''', '°'] DO BEGIN
	 STRING_AppendChar(b, b, ch);
	 GetCh
      END;

      found := StrToKey_GetSkey(b, i);

      IF NOT found THEN BEGIN
         error('unknown skey on line ', curline);
      END;
      STR_IntegerToStr(i, c, len);
      STRING_Constant(a, c, len);

      END
   ELSE BEGIN
      WHILE ch in ['0'..'9'] DO BEGIN
	 STRING_AppendChar(a, a, ch);
	 GetCh
      END
   END;
END {S_Key};


PROCEDURE IntKey(VAR b: INTEGER);
VAR a : STRING_String;
    astr : STR_String;
    len1 : String_Range;
BEGIN
   STRING_ConstantEmpty(a); b := 0;
   IF ch = '-' THEN BEGIN
      STRING_AppendChar(a, a, ch);
      GetCh
   END;
   WHILE ch in ['0'..'9'] DO BEGIN
      STRING_AppendChar(a, a, ch);
      GetCh
   END;
   IF STRING_Length(a) > 0 THEN BEGIN
      STRING_ExtractChars(astr, len1, a, 1, STRING_Length(a));
      STR_StrToInteger(astr, len1, b);
      END
   ELSE error('Incorrect number on line', curline);
END {IntKey};


PROCEDURE Category(VAR c: STRING_String);
BEGIN
   STRING_ConstantEmpty(c);
   WHILE ch in ['A'..'Z'] DO BEGIN
      STRING_AppendChar(c, c, ch);
      GetCh
   END;
END {Category};


PROCEDURE AttributeValue(VAR at: LDCONVREC_pAttrStruct);

(*-------------------------------------------------------------------------*
 * Procedure has the side effect that at will point to the next node
 * in the list.
 *-------------------------------------------------------------------------*)

VAR
   a            : LDCONVREC_Str;
   len          : String_Range;
   atsetelt     : LDCONVREC_pSetValueType;
   oldatsetelt  : LDCONVREC_pSetValueType;
   keyvalue     : STRING_String;
BEGIN

   IF at = NIL THEN error('Too many attributes in record on line ', curline);

   at^.LineNumber := curline;
   at^.SetValue := NIL;

   IF ch = '[' THEN BEGIN
      atsetelt := NIL; oldatsetelt := NIL;
      IF FirstIdP <> NIL THEN BEGIN
{
         IF LDIDPATTERNS_IsXPattern(at^.fieldname.str, at^.fieldname.len) THEN BEGIN
            at^.setvalue := FirstIdP;
            oldatsetelt  := OldIdP
         END
}
      END;
      GetCh; SkipSpaces;
      WHILE (ch <> ']') DO BEGIN
         a:='';
         len := 0;
         WHILE ch in ['_', 'a'..'z', 'A'..'Z', '0'..'9'] DO BEGIN
	    len := len+1; 
            IF len > LDCONVREC_MaxStrLength THEN
               error('Attribute value too long on line ', curline);
            a:= a || ch;
	    GetCh
	 END;
	 SkipSpaces;

         IF ch = ',' THEN BEGIN
            GetCh; SkipSpaces;
            IF ch = ']' THEN error('Missing set element on line ', curline);
            END
         ELSE IF ch <> ']' THEN BEGIN
            error('Expected symbols , or ] on line', curline);
         END;

         Mem_NewDefault(Loopholes.SIZEof(LDCONVREC_SetValueType), 
                        LoopHoles.Retype(atsetelt,Mem_Ptr));
	 IF oldatsetelt = NIL THEN
	    at^.SetValue := atsetelt
	 ELSE
	    oldatsetelt^.NextValue := atsetelt;
	 oldatsetelt := atsetelt;
	 atsetelt^.eltvalue.str := a;
	 atsetelt^.eltvalue.len := len;
	 atsetelt^.nextvalue := NIL;

      END;
      GetCh; SkipSpaces
      END
   ELSE BEGIN

      (*-------------------------------------------------------------------*
       * No set attribute !!!
       *-------------------------------------------------------------------*)
 
      IF (ch = '$') OR (ch = '/') THEN BEGIN
         ch := '$';
         S_Key(Keyvalue);
         STRING_ExtractChars(a, len, keyvalue, 1, STRING_Length(keyvalue));
         END
      ELSE BEGIN
         len := 0;
         WHILE ch in ['_', 'a'..'z', 'A'..'Z', '0'..'9'] DO BEGIN
            len := len+1; 
            IF len > LDCONVREC_MaxStrLength THEN
               error('Attribute value too long on line ', curline);
            a[len] := ch;
            GetCh
         END         
      END;
      at^.fieldvalue.str := a;
      at^.fieldvalue.len := len;
      SkipSpaces
   END;
   at^.Error      := FALSE;
   at := at^.NextAttr

END {AttributeValue};


PROCEDURE Entry;

(*-------------------------------------------------------------------------*
 * The procedure Entry is the central part of the program. It checks the
 * syntax of a lexicon lemma and generates the code for all the output files
 *-------------------------------------------------------------------------*)

VAR 
   integerstatus           : INTEGER;
   boolstatus              : BOOLEAN;
   KeyAttr,
   phonrec                 : LDCONVREC_pAttrStruct;
   catstr                  : STRING(35);
   catlen                  : String_Range;
   s,
   idiom,
   skey,
   cat,
   attrstr,
   conststr               : STRING_String;
   nrargs,
   nrargconds,
   attrnr,
   j, k,
   intattrkey,
   intskey                : INTEGER;
   GenerateBLex           : BOOLEAN;

   PROCEDURE InitEntry;
   BEGIN
      FirstIdP               := NIL;
      OldIdP                 := NIL;
   END;


   PROCEDURE SDictPart;
   VAR
      tempkey : STRING_String;
   BEGIN
      S_Key(skey); 
      ConvertToInteger(skey, intskey); 

      SDictBuffer.skey := intskey;
      Skipspaces;

   END {SDictPart};


   PROCEDURE BLexPart;

   VAR
      localattr  : LDCONVREC_pAttrStruct;
      status     : BOOLEAN;
      BaseSkey   : String_String;
      hlp        : String_Range;
   BEGIN
      IF ch <> ';' THEN BEGIN
      
	 Category(cat); CheckCatSwitch(cat, attrbs);

         localattr := attrbs;
         STRING_ExtractChars(catstr, catlen, cat, 1, STRING_Length(cat));

	 SkipSpaces;

         IF ch = '$' THEN BEGIN

	    S_key(BaseSkey);

	    SkipSpaces;

	    WHILE localattr^.nextattr <> NIL DO localattr := localattr^.nextattr;

	    (*----------------------------------------------------------------*
	     * Now, fill Key field
	     *----------------------------------------------------------------*)
	    KeyAttr := localattr;
	    STRING_ExtractChars(localattr^.fieldvalue.str,
				hlp,
				BaseSkey, 1, STRING_Length(BaseSkey));
	    localattr^.fieldvalue.len := hlp;
	    localattr := localattr^.NextAttr;         
	    status := LSCONVATTR_AttrToBlexRec(catstr, catlen, attrbs, BlexRecord);
	    IF NOT status 
	    THEN error('Internal compiler error in lemma ending on line ', curline);

	    BlexRecord.KEY := intskey;
	    BlexRecord.IsBxpr := FALSE;

	    curcat := cat;

            END
	 ELSE BEGIN 
	    IF ch <> '(' THEN error('No open bracket on line ', curline);

	    GetCh; SkipSpaces;

	    IF ch <> ')' THEN BEGIN
	       AttributeValue(localattr); SkipSpaces;
	       WHILE ch = ',' DO BEGIN
		  GetCh; SkipSpaces;
		  AttributeValue(localattr);
		  SkipSpaces; 
	       END;
	    END;

	    IF localattr = NIL THEN error('Too many attributes on line ', curline);

	    (*----------------------------------------------------------------*
	     * Now, fill Key field
	     *----------------------------------------------------------------*)
	    KeyAttr := localattr;
	    STRING_ExtractChars(localattr^.fieldvalue.str,
				hlp,
				skey, 1, STRING_Length(skey));
	    localattr^.fieldvalue.len := hlp;
            localattr := localattr^.NextAttr;         

	    IF localattr <> NIL THEN error('Missing attributes on line ', curline);
	    IF ( ch <> ')' ) THEN error('No closing bracket on line ', curline);
	    GetCh; SkipSpaces;
	    status := LSCONVATTR_AttrToBlexRec(catstr, catlen, attrbs, BlexRecord);

	    IF NOT status 
	    THEN BEGIN
	       localattr := attrbs;

	       (*-------------------------------------------------------------*
		* Inspect all attribute elements except the last one, the KEY
		* attribute with respect to the value of ERROR
		*-------------------------------------------------------------*)

	       WHILE localattr^.NextAttr <> NIL DO BEGIN
		  IF localattr^.ERROR THEN BEGIN
		     writeln('Incorrect attribute value on line ', 
			      localattr^.LineNumber);
		  END;
		  localattr := localattr^.NextAttr
	       END;
	       error('Incorrect attribute values in lemma ending on line ', curline);
	    END;

	    (*----------------------------------------------------------------*
	     * Check Constraints
	     *----------------------------------------------------------------*)
{
	    status := LSCONSTRAINTS_Blex(BlexRecord, LogFile, curline);
}
	    BlexRecord.KEY := intskey;
	    BlexRecord.IsBxpr := TRUE;

	    curcat := cat;

	 END
         END
      ELSE BEGIN
	 STRING_ConstantEmpty(Cat)
      END;

   END {BLexPart};


BEGIN {Entry}
   InitEntry;

   SDictPart;

   SkipSpaces; 

   BLexPart;

   (*----------------------------------------------------------------------*
    * Evaluate conditions for code generation
    *----------------------------------------------------------------------*)

    GenerateBLex := ((STRING_Length(Cat) > 0) {AND (Status = Correct)} AND Code);
    
   (*----------------------------------------------------------------------*
    * Code Generation for the current entry.
    *----------------------------------------------------------------------*)

   (*----------------------------------------------------------------------*
    * BLEX code generation
    *----------------------------------------------------------------------*)

   IF GenerateBLex THEN BEGIN
      NrBlexEntries := NrBlexEntries+1;
      pBlexRecord^ := BlexRecord;
      integerstatus := LDBLEX_WriteSequential(LoopHoles.Retype(pBlexRecord,LDBLEX_pBLEXStruct));
      IF integerstatus <> 0 {RMS$_DUP} THEN BEGIN
         writeln('WARNING: ',integerstatus:10, ' line: ',curline:10);
         FILES_WriteStr(LogFile, 'WARNING: Duplicate skey in lemma ending on line ',FILES_MaxIO, 0, Left);
         FILES_WriteInteger(LogFile,curline, 0, Left);
         FILES_WriteLine(LogFile, Left);
      END
   END;

   (*----------------------------------------------------------------------*
    * Finally read the semi-colon that terminates the entry
    *----------------------------------------------------------------------*)

   IF ( ch <> ';' ) THEN error('No semi-colon on line ', curline);
   GetCh; 

END {Entry};


PROCEDURE Dict;
VAR
   stackptr: Mem_StackPtr;
BEGIN
   GLOBDEF_SetAnGenMode(AnMode);

   (*----------------------------------------------------------------------*
    * Open the input file with read access
    *----------------------------------------------------------------------*)

   IF Code THEN BEGIN

      (*-------------------------------------------------------------------*
       * Open all lexicon files
       *-------------------------------------------------------------------*)
      LDBLEX_OpenBlexWrite;

   END;


   (*----------------------------------------------------------------------*
    * Open the files that contain the fkey, skey and mkey definitions
    *----------------------------------------------------------------------*)
   StrToKey_OpenSkeyRead;

   FILES_Open(DictFile, 'dict', 4, 0 );

   (*----------------------------------------------------------------------*
    * Continue Syntax checking 
    *----------------------------------------------------------------------*)
   SkipSpaces;
   WHILE not ( ch = '@' ) DO BEGIN

      NrEntries := NrEntries+1;

      Mem_BottomDefault;
      Mem_MarkDefault(stackptr);
      Entry;
      Mem_ReleaseDefault(stackptr);

      SkipSpaces;

   END;

   IF Code THEN BEGIN

      FILES_Close(DictFile);

      LDBLEX_CloseBlex;
   END;

   StrToKey_CloseSkey;

END;

BEGIN
   reset(LogNames);
   Logname_Init(LogNames);

   (*----------------------------------------------------------------------*
    * Initialization part of the global variables
    *----------------------------------------------------------------------*)
   cc := 0; ll := 0; curline := 0; ch := ' ';
   STRING_ConstantEmpty(curcat);
   Status := Correct; ErrorCount := 0;
   Mem_Init;
   Mem_CreateStack(ownstack, 1000000);
   Mem_SetDefault(ownstack);
   Mem_NewDefault(Loopholes.SIZEof(LSDOMAINT_BLEXStruct),
                  Loopholes.Retype(pBlexRecord,Mem_Ptr));
Mem_TopDefault;
   Mark;
   YesOrNoCode;
   InitStatistics;
   StartCPU := 0{CLOCK};


   (*----------------------------------------------------------------------*
    * Open the logfile
    *----------------------------------------------------------------------*)
   FILES_Open(LogFile, 'logfile', 7, 3);


   (*----------------------------------------------------------------------*
    * The syntax of the inputfile should be according to Dict
    *----------------------------------------------------------------------*)
   Dict;

   StopCPU := 0{CLOCK};

99:
   IF Status = InCorrect THEN BEGIN

      (*-------------------------------------------------------------------*
       * The compiler generates a program crash
       * to inform the DCL shell that the input file was not correct
       *-------------------------------------------------------------------*)
      writeln;
      Statistics;

      writeln(' Incorrect Syntax, Error Count = ', ErrorCount:3);
      FILES_WriteStr(LogFile, ' Incorrect Syntax, Error Count = ',FILES_MaxIO, 0, Left);
      FILES_WriteInteger(LogFile,ErrorCount, 0, Left);
      FILES_WriteLine(LogFile, Left);

      FILES_Close(LogFile);
      END
   ELSE BEGIN
      Statistics;
      FILES_Close(LogFile);
   END;
END {NEWDICTGEN}.
