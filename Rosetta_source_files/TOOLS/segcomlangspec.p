(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : SEGCOMLANGSPEC 
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export(SEGCOMLANGSPEC);
pragma C_include('string.pf');
pragma C_include('segcomlangspec.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
WITH SEGCOMLANGSPEC,STRNG;



PROGRAM SEGCOMLANGSPEC;
VAR 
   word : ARRAY[1..SEGCOMLANGSPEC_NROW] OF STRING_String;
   wcat : ARRAY[1..SEGCOMLANGSPEC_NROW] OF SEGCOMLANGSPEC_Category;
   scat : ARRAY[CHAR] OF SEGCOMLANGSPEC_Category;


PROCEDURE SEGCOMLANGSPEC_Word(i: integer; VAR s: STRING_String);
BEGIN
   s := word[i]
END {SEGCOMLANGSPEC_Word};


FUNCTION SEGCOMLANGSPEC_Wcat(i: integer): SEGCOMLANGSPEC_Category;
BEGIN
   SEGCOMLANGSPEC_Wcat := wcat[i]
END {SEGCOMLANGSPEC_Wcat};


FUNCTION SEGCOMLANGSPEC_Scat(c: CHAR): SEGCOMLANGSPEC_Category;
BEGIN
   SEGCOMLANGSPEC_Scat := scat[c]
END {SEGCOMLANGSPEC_Scat};


PROCEDURE SEGCOMLANGSPEC_CreateTerminal(s: SEGCOMLANGSPEC_Category;
                                                 w: STRING_String;
                                                 VAR f: SEGCOMLANGSPEC_FieldDef);
BEGIN
   new(f.terminal); 
   f.terminal^.str := w
END;

PROCEDURE SEGCOMLANGSPEC_Init;

BEGIN
   STRING_Constant(word[ 1],'/A',2);
   STRING_Constant(word[ 2],'/G',2);
   STRING_Constant(word[ 3],'ALIAS',5);
   STRING_Constant(word[ 4],'CC',2);
   STRING_Constant(word[ 5],'END',3);
   STRING_Constant(word[ 6],'FON',3);
   STRING_Constant(word[ 7],'FREEFIX',7);
   STRING_Constant(word[ 8],'LGLUE2',6);
   STRING_Constant(word[ 9],'LGLUE3',6);
   STRING_Constant(word[10],'LGLUE4',6);
   STRING_Constant(word[11],'MGLUE2',6);
   STRING_Constant(word[12],'PFK',3);
   STRING_Constant(word[13],'PREFIX',6);
   STRING_Constant(word[14],'RGLUE2',6);
   STRING_Constant(word[15],'RGLUE3',6);
   STRING_Constant(word[16],'RGLUE4',6);
   STRING_Constant(word[17],'RPREFIX',7);
   STRING_Constant(word[18],'RSUFFIX',7);
   STRING_Constant(word[19],'SFK',3);
   STRING_Constant(word[20],'SUFFIX',6);
   STRING_Constant(word[21],'TABLE',5);
   STRING_Constant(word[22],'TYPE',4);
   STRING_Constant(word[23],'VAR',3);

   wcat[ 1] := ACAT;
   wcat[ 2] := GCAT;
   wcat[ 3] := ALIASCAT;
   wcat[ 4] := CCCAT;
   wcat[ 5] := ENDCAT;
   wcat[ 6] := FONCAT;
   wcat[ 7] := FREEFIXCAT;
   wcat[ 8] := LGLUE2CAT;
   wcat[ 9] := LGLUE3CAT;
   wcat[10] := LGLUE4CAT;
   wcat[11] := MGLUE2CAT;
   wcat[12] := PFKCAT;
   wcat[13] := PREFIXCAT;
   wcat[14] := RGLUE2CAT;
   wcat[15] := RGLUE3CAT;
   wcat[16] := RGLUE4CAT;
   wcat[17] := RPREFIXCAT;
   wcat[18] := RSUFFIXCAT;
   wcat[19] := SFKCAT;
   wcat[20] := SUFFIXCAT;
   wcat[21] := TABLECAT;
   wcat[22] := TYPECAT;
   wcat[23] := VARCAT;

   scat['*'] := MULT;
   scat[';'] := SEMCOLON;
   scat[':'] := COLON;       
   scat['['] := LBRACK;
   scat[']'] := RBRACK;
   scat['+'] := PLUS;
   scat['('] := LPAREN;
   scat[')'] := RPAREN;
   scat[','] := COMMA;
   scat['.'] := PERIOD;
   scat['='] := EQL;
   scat['/'] := SLASH;
   scat['<'] := LESS;
   scat['>'] := GREATER;

END {SEGCOMLANGSPEC_init};

