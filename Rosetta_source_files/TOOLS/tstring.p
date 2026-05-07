(*MPD:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : STRING 
 *  Creation date   : 1 juli 1986                               
 *  Author          : Carel Fellinger, Rene Leermakers
 *                                                                  
 *  Copyright (c) 1988, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         : copied from general:string.env
 *
 *EMP:::===================================================================*)

pragma C_include('strings.pf');
Export(TSTRING);
pragma C_include('string.pf');
pragma C_include('tstring.pf');

PROGRAM TSTRING;

WITH STRNG,
     STRINGS;

FUNCTION  TSTRING_FindFirstNotInSet ( str1 : TSTRING_String;
                                                str2 : TSTRING_String)
                     : TSTRING_Range;
VAR str3,str4:STRING_string;
BEGIN
TSTRING_converttostring(str1,str3);
TSTRING_converttostring(str2,str4);
TSTRING_FindFirstNotInSet:=STRING_FindFirstNotInSet(str3,str4)
END;

PROCEDURE TSTRING_PrefixChar (VAR str1 : TSTRING_String;
                                        str2 : TSTRING_String;
                                        c : CHAR);
VAR str3,str4:STRING_string;
BEGIN
TSTRING_converttostring(str2,str4);
STRING_prefixchar(str3,str4,c);
TSTRING_converttotstring(str3,str1);
END;
   

PROCEDURE TSTRING_converttostring(str1:TSTRING_string;
                                           VAR str2:STRING_string);
BEGIN
str2:=str1;
END;

PROCEDURE TSTRING_converttotstring(str1:STRING_string;
                                           VAR str2:TSTRING_string);
BEGIN
str2:=str1;
END;

FUNCTION TSTRING_Length (str : TSTRING_String) : TSTRING_Range;
VAR str1:STRING_string;
BEGIN
TSTRING_converttostring(str,str1);
TSTRING_length:=STRING_length(str1);
END;

FUNCTION  TSTRING_Compare (str1 : TSTRING_String; str2 : TSTRING_String)
                     : TSTRING_CompareResult;
VAR str3,str4:STRING_string;
BEGIN
TSTRING_converttostring(str1,str3);
TSTRING_converttostring(str2,str4);
TSTRING_compare:=STRING_compare(str3,str4);
END;


FUNCTION  TSTRING_CompareBegin (str1 : TSTRING_String; str2 : TSTRING_String)
                     : TSTRING_CompareResult;
VAR str3,str4:STRING_string;
BEGIN
TSTRING_converttostring(str1,str3);
TSTRING_converttostring(str2,str4);
TSTRING_comparebegin:=STRING_comparebegin(str3,str4);
END;

   
FUNCTION  TSTRING_CompareEnd (str1 : TSTRING_String; str2 : TSTRING_String)
                     : TSTRING_CompareResult;
VAR str3,str4:STRING_string;
BEGIN
TSTRING_converttostring(str1,str3);
TSTRING_converttostring(str2,str4);
TSTRING_compareend:=STRING_compareend(str3,str4);
END;

   
FUNCTION  TSTRING_CompareChars (str1 : TSTRING_String;
                                   CONST       str2 : STRING;
                                          len2 : TSTRING_Range)
                     : TSTRING_CompareResult;
VAR str3:STRING_string;
BEGIN
TSTRING_converttostring(str1,str3);
TSTRING_comparechars:=STRING_comparechars(str3,str2,len2);
END;

   
FUNCTION  TSTRING_CompareChar (str : TSTRING_String;
                                         i : TSTRING_Range;
                                         c : CHAR)
                     : TSTRING_CompareResult;
VAR str1:STRING_string;
BEGIN
TSTRING_converttostring(str,str1);
TSTRING_comparechar:=STRING_comparechar(str1,i,c);
END;

   
PROCEDURE TSTRING_Constant (VAR str1 : TSTRING_String;
                              CONST        str2 :STRING;
                                      len2 : TSTRING_Range);
VAR str3:STRING_string;
BEGIN
STRING_constant(str3,str2,len2);
TSTRING_converttotstring(str3,str1);
END;

   
PROCEDURE TSTRING_ConstantChar (VAR str : TSTRING_String;
                                          c : CHAR);
VAR str3:STRING_string;
BEGIN
STRING_constantchar(str3,c);
TSTRING_converttotstring(str3,str);
END;

   
PROCEDURE TSTRING_ConstantEmpty (VAR str : TSTRING_String);
VAR str3:STRING_string;
BEGIN
STRING_constantempty(str3);
TSTRING_converttotstring(str3,str);
END;

   
PROCEDURE TSTRING_Extract (VAR str1 : TSTRING_String;
                                     str2 : TSTRING_String;
                                     pos, len : TSTRING_Range);
VAR str3,str4:STRING_string;
BEGIN
TSTRING_converttostring(str2,str4);
STRING_extract(str3,str4,pos,len);
TSTRING_converttotstring(str3,str1);
END;

   
PROCEDURE TSTRING_ExtractBegin (VAR str1 : TSTRING_String;
                                          str2 : TSTRING_String;
                                          pos : TSTRING_Range);
VAR str3,str4:STRING_string;
BEGIN
TSTRING_converttostring(str2,str4);
STRING_extractbegin(str3,str4,pos);
TSTRING_converttotstring(str3,str1);
END;

   
PROCEDURE TSTRING_ExtractEnd (VAR str1 : TSTRING_String;
                                        str2 : TSTRING_String;
                                        pos : TSTRING_Range);
VAR str3,str4:STRING_string;
BEGIN
TSTRING_converttostring(str2,str4);
STRING_extractend(str3,str4,pos);
TSTRING_converttotstring(str3,str1);
END;

   
PROCEDURE TSTRING_ExtractChars (VAR str1 : STRING;
                                          VAR len1 : STRING_Range;
                                          str2 : TSTRING_String;
                                          pos, len : TSTRING_Range);
VAR str3,str4:STRING_string;
BEGIN
TSTRING_converttostring(str2,str4);
STRING_extractchars(str1,len1,str4,pos,len);
END;

   
PROCEDURE TSTRING_ExtractChar (VAR c : CHAR;
                                         str : TSTRING_String;
                                         i : TSTRING_Range);
VAR str4:STRING_string;
BEGIN
TSTRING_converttostring(str,str4);
STRING_extractchar(c,str4,i);
END;

   
PROCEDURE TSTRING_Concat (VAR str1 : TSTRING_String;
                                    str2 : TSTRING_String;
                                    str3 : TSTRING_String);
VAR str4,str5,str6:STRING_string;
BEGIN
TSTRING_converttostring(str2,str4);
TSTRING_converttostring(str3,str6);
STRING_concat(str5,str4,str6);
TSTRING_converttotstring(str5,str1);
END;


PROCEDURE TSTRING_Prefix (VAR str1 : TSTRING_String;
                                    str2 : TSTRING_String);
VAR str3,str4:STRING_string;
BEGIN
TSTRING_converttostring(str1,str3);
TSTRING_converttostring(str2,str4);
STRING_prefix(str3,str4);
TSTRING_converttotstring(str3,str1);
END;


PROCEDURE TSTRING_Append (VAR str1 : TSTRING_String;
                                    str2 : TSTRING_String);
VAR str3,str4:STRING_string;
BEGIN
TSTRING_converttostring(str1,str3);
TSTRING_converttostring(str2,str4);
STRING_append(str3,str4);
TSTRING_converttotstring(str3,str1);
END;


PROCEDURE TSTRING_AppendChars (VAR str1 : TSTRING_String;
                                         str2 : TSTRING_String;
                                   CONST str3 : STRING;
                                         len3 : TSTRING_Range);
VAR str4,str5:STRING_string;
BEGIN
TSTRING_converttostring(str2,str4);
STRING_appendchars(str5,str4,str3,len3);
TSTRING_converttotstring(str5,str1);
END;


PROCEDURE TSTRING_PrefixChars (VAR str1 : TSTRING_String;
                                         str2 : TSTRING_String;
                                  CONST  str3 : STRING;
                                         len3 : TSTRING_Range);
VAR str4,str5:STRING_string;
BEGIN
TSTRING_converttostring(str2,str4);
STRING_prefixchars(str5,str4,str3,len3);
TSTRING_converttotstring(str5,str1);
END;

   
PROCEDURE TSTRING_AppendChar (VAR str1 : TSTRING_String;
                                        str2 : TSTRING_String;
                                        c : CHAR);
VAR str3,str4:STRING_string;
BEGIN
TSTRING_converttostring(str2,str4);
STRING_appendchar(str3,str4,c);
TSTRING_converttotstring(str3,str1);
END;



PROCEDURE TSTRING_UpperCase (VAR str1 : TSTRING_String;
                                       str2 : TSTRING_String);
VAR str3,str4:STRING_string;
BEGIN
TSTRING_converttostring(str2,str4);
STRING_uppercase(str3,str4);
TSTRING_converttotstring(str3,str1);
END;


