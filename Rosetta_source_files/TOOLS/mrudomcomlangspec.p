(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : MRUDOMCOMLANGSPEC 
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
EXPORT(MRUDOMCOMLANGSPEC);
pragma c_include('mrudomcomlangspec.pf');
pragma c_include('tstring.pf');

PROGRAM MRUDOMCOMLANGSPEC;
WITH tstring;

VAR 
   word : ARRAY[1..MRUDOMCOMLANGSPEC_NROW] OF TSTRING_String;
   wcat : ARRAY[1..MRUDOMCOMLANGSPEC_NROW] OF MRUDOMCOMLANGSPEC_Category;
   scat : ARRAY[CHAR] OF MRUDOMCOMLANGSPEC_Category;


 FUNCTION MRUDOMCOMLANGSPEC_ScanChars:SETOFCHAR;
BEGIN
MRUDOMCOMLANGSPEC_ScanChars:=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x',
'y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','1','2','3',
'4','5','6','7','8','9','0','''','¿'..'ý','_']
END;

 PROCEDURE MRUDOMCOMLANGSPEC_Word(i: integer; VAR s: TSTRING_String);
BEGIN
   s := word[i]
END {MRUDOMCOMLANGSPEC_Word};


 FUNCTION MRUDOMCOMLANGSPEC_Wcat(i: integer): MRUDOMCOMLANGSPEC_Category;
BEGIN
   MRUDOMCOMLANGSPEC_Wcat := wcat[i]
END {MRUDOMCOMLANGSPEC_Wcat};


 FUNCTION MRUDOMCOMLANGSPEC_Scat(c: CHAR): MRUDOMCOMLANGSPEC_Category;
BEGIN
   MRUDOMCOMLANGSPEC_Scat := scat[c]
END {MRUDOMCOMLANGSPEC_Scat};


 PROCEDURE MRUDOMCOMLANGSPEC_CreateTerm(s: MRUDOMCOMLANGSPEC_Category;
                                                 w: TSTRING_String;
                                                 VAR f: MRUDOMCOMLANGSPEC_FieldDef);
BEGIN
   new(f.terminal); 
   f.terminal^.str := w
END;

 PROCEDURE MRUDOMCOMLANGSPEC_Init;

BEGIN
   TSTRING_Constant(word[ 1],'ALPHABET',8);
   TSTRING_Constant(word[ 2],'ATTRIBUTES',10);
   TSTRING_Constant(word[ 3],'BOOLEAN',7);
   TSTRING_Constant(word[ 4],'CATEGORIES',10);
   TSTRING_Constant(word[ 5],'DOMAIN',6);
   TSTRING_Constant(word[ 6],'END',3);
   TSTRING_Constant(word[ 7],'INH',3);
   TSTRING_Constant(word[ 8],'INTEGER',7);
   TSTRING_Constant(word[ 9],'OF',2);
   TSTRING_Constant(word[10],'OUTPUTFILES',11);
   TSTRING_Constant(word[11],'PROC',4);
   TSTRING_Constant(word[12],'SET',3);
   TSTRING_Constant(word[13],'SETS',4);
   TSTRING_Constant(word[14],'SURFACE',7);
   TSTRING_Constant(word[15],'SYMBOLS',7);
   TSTRING_Constant(word[16],'SYN',3);
   TSTRING_Constant(word[17],'TABLES',6);
   TSTRING_Constant(word[18],'TYPES',5);
   TSTRING_Constant(word[19],'WORDS',5);

   wcat[ 1] := alphabetcat;
   wcat[ 2] := attributescat;
   wcat[ 3] := booleancat;
   wcat[ 4] := categoriescat;
   wcat[ 5] := domaincat;
   wcat[ 6] := endcat;
   wcat[ 7] := inhcat;
   wcat[ 8] := integercat;
   wcat[ 9] := ofcat;
   wcat[10] := outputfilescat;
   wcat[11] := proccat;
   wcat[12] := setcat;
   wcat[13] := setscat;
   wcat[14] := surfacecat;
   wcat[15] := symbolscat;
   wcat[16] := syncat;
   wcat[17] := tablescat;
   wcat[18] := typescat;
   wcat[19] := wordscat;

   scat['='] := iscat;
   scat[';'] := dotcomma;
   scat[':'] := dotdot;       
   scat['('] := roundopen;
   scat[')'] := roundclose;
   scat[','] := comma;
   scat['<'] := leftarrow;
   scat['>'] := rightarrow;
   scat['.'] := dot;
   scat['['] := squareopen;
   scat[']'] := squareclose;

END {MRUDOMCOMLANGSPEC_init};

