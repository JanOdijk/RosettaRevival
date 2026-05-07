(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : DOMCOMLANGSPEC 
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export(DOMCOMLANGSPEC);
pragma C_include('tstring.pf');
pragma C_include('domcomlangspec.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

WITH DOMCOMLANGSPEC,
     TSTRING;

PROGRAM DOMCOMLANGSPEC;

VAR 
   word : ARRAY[1..DOMCOMLANGSPEC_NROW] OF TSTRING_String;
   wcat : ARRAY[1..DOMCOMLANGSPEC_NROW] OF DOMCOMLANGSPEC_Category;
   scat : ARRAY[CHAR] OF DOMCOMLANGSPEC_Category;

FUNCTION DOMCOMLANGSPEC_ScanChars:SETOFCHAR;
BEGIN
DOMCOMLANGSPEC_ScanChars:=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x',
'y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','1','2','3',
'4','5','6','7','8','9','0','''','¿'..'ý','_']
END;

PROCEDURE DOMCOMLANGSPEC_Word(i: integer; VAR s: TSTRING_String);
BEGIN
   s := word[i]
END {DOMCOMLANGSPEC_Word};


FUNCTION DOMCOMLANGSPEC_Wcat(i: integer): DOMCOMLANGSPEC_Category;
BEGIN
   DOMCOMLANGSPEC_Wcat := wcat[i]
END {DOMCOMLANGSPEC_Wcat};


FUNCTION DOMCOMLANGSPEC_Scat(c: CHAR): DOMCOMLANGSPEC_Category;
BEGIN
   DOMCOMLANGSPEC_Scat := scat[c]
END {DOMCOMLANGSPEC_Scat};


PROCEDURE DOMCOMLANGSPEC_CreateTerm(s: DOMCOMLANGSPEC_Category;
                                                 w: TSTRING_String;
                                                 VAR f: DOMCOMLANGSPEC_FieldDef);
BEGIN
   new(f.terminal); 
   f.terminal^.str := w
END;

PROCEDURE DOMCOMLANGSPEC_Init;

BEGIN
   TSTRING_Constant(word[ 1],'AFFIXKEYS',9);
   TSTRING_Constant(word[ 2],'BOOLEAN',7);
   TSTRING_Constant(word[ 3],'CATEGORIES',10);
   TSTRING_Constant(word[ 4],'CATSETS',7);
   TSTRING_Constant(word[ 5],'CONTEXT',7);
   TSTRING_Constant(word[ 6],'COPY',4);
   TSTRING_Constant(word[ 7],'DERIVKEYS',9);
   TSTRING_Constant(word[ 8],'DOMAIN_T',8);
   TSTRING_Constant(word[ 9],'DUTCH',5);
   TSTRING_Constant(word[10],'END',3);
   TSTRING_Constant(word[11],'ENGLISH',7);
   TSTRING_Constant(word[12],'FROM',4);
   TSTRING_Constant(word[13],'INDEX',5);
   TSTRING_Constant(word[14],'INTEGER',7);
   TSTRING_Constant(word[15],'KEY',3);
   TSTRING_Constant(word[16],'OF',2);
   TSTRING_Constant(word[17],'PHONETIC',8);
   TSTRING_Constant(word[18],'RECORDS',7);
   TSTRING_Constant(word[19],'RELATIONS',9);
   TSTRING_Constant(word[20],'SET',3);
   TSTRING_Constant(word[21],'SPANISH',7);
   TSTRING_Constant(word[22],'TO',2);
   TSTRING_Constant(word[23],'TYPES',5);

   wcat[ 1] := affixkeyscat;
   wcat[ 2] := booleancat;
   wcat[ 3] := categoriescat;
   wcat[ 4] := catsetscat;
   wcat[ 5] := contextcat;
   wcat[ 6] := copycat;
   wcat[ 7] := derivkeyscat;
   wcat[ 8] := domainTcat;
   wcat[ 9] := dutchcat;
   wcat[10] := endcat;
   wcat[11] := englishcat;
   wcat[12] := fromcat;
   wcat[13] := indexcat;
   wcat[14] := integercat;
   wcat[15] := keycat;
   wcat[16] := ofcat;
   wcat[17] := phoneticcat;
   wcat[18] := recordscat;
   wcat[19] := relationscat;
   wcat[20] := setcat;
   wcat[21] := spanishcat;
   wcat[22] := tocat;
   wcat[23] := typescat;

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
   scat['-'] := minus;

END {DOMCOMLANGSPEC_init};

