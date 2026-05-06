(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : STRING
 *  Creation date   : 29 January 1990
 *  Author          : Harold Leurs
 *
 *  Copyright (c) 1990, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : Any implementation of the abstract data type STRING_String
 *                    has to take care that the Pascal assignment statement is
 *                    harmless!
 *
 *                    When in the future the current implementation is replaced
 *                    by some pointer structure, then special attention must be 
 *                    given to the aliasing problem. The main point in this
 *                    aliasing problem is that, because of an assignment, a
 *                    pointer structure may be part of more then one variable.
 *                    A simple change in this pointer structure might affect
 *                    other variables, and therefore a copy has to be made
 *                    whenever the value of a variable has to change!
 *                    For the very same reason the disposing of no longer
 *                    needed strings is not easyly implemented. Fortunately we
 *                    have decided to use MARK and RELEASE and not DISPOSE in
 *                    Rosetta3, so this problem is partly circumvented. A
 *                    drawback of using MARK/RELEASE instead of DISPOSE is that
 *                    the memory used by strings is returned once, so that the
 *                    memory use of local string variables is badly handled.
 *
 *                    A good pointer structure must be such that it introduces
 *                    hardly any overhead for the majority of its uses.
 *                    A structure like:
 *                       RECORD chars : PACKED ARRAY [1..max] OF CHAR;
 *                              len : 0..max;
 *                              rest : ^'same structure'
 *                       END, with a carefull choosen value for max
 *                    is excellent in many ways.
 *                    If max is the length of most of the strings in use
 *                    then all the actions upon strings will work efficiently
 *                    both in time and in memory with hardly any overhead.
 *                    Also the drawback of the use of MARK/RELEASE instead of
 *                    DISPOSE is less severe, because only for very long local
 *                    string variables not all the used memory is returned at
 *                    the end of the lifetime of the local variable.
 *                    Futhermore the assignment statement works fine, and the
 *                    the other routines only have to make copies for very long
 *                    strings. As most strings are shorter then max, the
 *                    assignment statement itself will take care of the largest
 *                    part of the copying that has to be done.
 *
 *EMP:::===================================================================*)

pragma C_include('strings.pf');
Export(strng);
pragma C_include('string.pf');


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM STRNG;

WITH STRINGS;

   (*----------------------------------------------------------------------*
    * The bodies of the exported routines
    *----------------------------------------------------------------------*)


(*MPC:::===================================================================*
 *
 *  Constant name  : ringel_s
 *  Description    : ASCII-value of a the sign that is equal to 'ss'
 *
 *EMP:::===================================================================*)

CONST
   ringel_s = 223;


(*MPC:::===================================================================*
 *
 *  Constant name  : a_grave
 *  Description    : ASCII-value of a small 'a' with an accent grave
 *
 *EMP:::===================================================================*)

CONST
   a_grave = 224;



(*MPC:::===================================================================*
 *
 *  Constant name  : A_gravee
 *  Description    : ASCII-value of a capital 'A' with an accent grave
 *
 *EMP:::===================================================================*)

   A_gravee = 192;



(*MPC:::===================================================================*
 *
 *  Constant name  : y_umlaut
 *  Description    : ASCII-value of a small 'y' with an umlaut mark
 *
 *EMP:::===================================================================*)

   y_umlaut = 253;



(*MPC:::===================================================================*
 *
 *  Constant name  : Y_umlautt
 *  Description    : ASCII-value of a capital 'Y' with an umlaut mark
 *
 *EMP:::===================================================================*)

   Y_umlautt = 221;



FUNCTION  STRING_Length (str : STRING_String)
          : STRING_Range;

BEGIN
   STRING_Length:= length(str)
END {STRING_Length};




FUNCTION STRING_Compare (str1 : STRING_String;
                         str2 : STRING_String)
         : STRING_CompareResult;

VAR a : STRING_CompareResult;
VAR i, len1, len2 : STRING_Range;
VAR equal: BOOLEAN;

BEGIN
   STRING_Compare:= 0;
   len1:= length(str1);
   len2:= length(str2);
   a:= STRING_CompareBegin(str1,str2);
   IF (a= 1) OR (a= -1) THEN STRING_Compare:= a
   ELSE BEGIN
      IF len1 < len2 THEN BEGIN
         i:= len1;
	 equal:= TRUE;
	 WHILE (i < len2) AND equal DO BEGIN
            i:= i + 1;
            IF str2[i] <> ' ' THEN equal:= FALSE
	 END;
         IF equal= TRUE THEN STRING_Compare:= a
         ELSE STRING_Compare:= 	-1;
         END
      ELSE IF len1 > len2 THEN BEGIN
         i:= len2;
	 equal:= TRUE;
         WHILE (i < len1) AND equal DO BEGIN
   	    i:= i + 1;
	    IF str1[i] <> ' ' THEN equal:= FALSE
	 END;
         IF equal= TRUE THEN STRING_Compare:= a
         ELSE STRING_Compare:= 	1;
         END
   END;
END {STRING_Compare};




FUNCTION STRING_CompareBegin (str1 : STRING_String;
                              str2 : STRING_String)
         : STRING_CompareResult;

VAR i, len1, len2 : STRING_Range;
VAR str3, str4 : STRING_String;
VAR equal: BOOLEAN;

BEGIN 
   i:= 0;
   equal:= TRUE;
   len1:= length(str1);
   len2:= length(str2);
   STRING_CompareBegin:= 0;
   STRING_UpperCase (str3,str1);
   STRING_UpperCase (str4,str2);
   WHILE (i < len1) AND (i < len2) AND equal DO BEGIN
      i:= i + 1;
      IF str3[i] < str4[i] THEN BEGIN
         STRING_CompareBegin:= -1;
         equal:= FALSE
         END
      ELSE IF str3[i] > str4[i] THEN BEGIN
         STRING_CompareBegin:= 1;
         equal:= FALSE
         END;
   END;
END {STRING_CompareBegin};
      



FUNCTION STRING_CompareEnd (str1 : STRING_String;
                            str2 : STRING_String)
         : STRING_CompareResult;

VAR i, j, k, l : STRING_Range;
VAR str3, str4 : STRING_String;
VAR equal: BOOLEAN;

BEGIN 
   l:= 0;
   equal:= TRUE;
   STRING_CompareEnd:= 0;
   STRING_UpperCase (str3,str1);
   STRING_UpperCase (str4,str2);
   IF (length(str1) < length(str2)) THEN BEGIN
      i:= 0;
      k:= length(str1);
      j:= (length(str2) - length(str1));
      END
   ELSE IF (length(str1) > length(str2)) THEN BEGIN
      j:= 0;
      k:= length(str2);
      i:= (length(str1) - length(str2));
      END
   ELSE BEGIN
      i:= 0;
      j:= 0;
      k:= length(str1)
   END;
   WHILE (l < k) AND equal DO BEGIN
      l:= l + 1;
      i:= i + 1;
      j:= j + 1;
      IF str3[i] < str4[j] THEN BEGIN 
         STRING_CompareEnd:= -1;
	 equal:= FALSE
      END
      ELSE IF str3[i] > str4[j] THEN BEGIN 
         STRING_CompareEnd:= 1;
	 equal:= FALSE
      END;
   END;
END {STRING_CompareEnd};




FUNCTION STRING_CompareChars (str1 : STRING_String;
                        CONST str2 : STRING;
                              len2 : STRING_Range)
         : STRING_CompareResult;

VAR str3 : STRING_String;
VAR i : INTEGER;
VAR equal : BOOLEAN;
    result: STRING_compareResult;
BEGIN 
   i:= 0;
   STRING_CompareChars:= 0;
   equal:= true;
   str3:= str2;
   IF STRING_length(str2)<len2 THEN len2:=STRING_length(str2);
   IF len2<STRING_length(str1) THEN BEGIN
      equal:=FALSE;
      result:=STRING_comparechars(str2,str1,len2);
      IF result=0 THEN BEGIN
         STRING_comparechars:=1;
      END
      ELSE STRING_comparechars:=-result;
   END
   ELSE IF len2>STRING_length(str1) THEN BEGIN
      equal:=FALSE;
      result:=STRING_comparechars(str1,str2,STRING_length(str1));
      IF result=0 THEN BEGIN
         STRING_comparechars:=1;
      END
      ELSE STRING_comparechars:=result;  
   END;
   STRING_UpperCase (str1,str1);
   STRING_UpperCase (str3,str3);
   WHILE (i < len2) AND equal DO BEGIN
      i:= i + 1;
      IF str1[i] < str3[i] THEN BEGIN
         STRING_CompareChars:= -1;
         equal:= FALSE
      END
      ELSE IF str1[i] > str3[i] THEN BEGIN
         STRING_CompareChars:=  1;
         equal:= FALSE
      END;
   END; 
END {STRING_CompareChars};




FUNCTION STRING_CompareChar (str : STRING_String;
                 	       i : STRING_Range;
			       c : CHAR)
         : STRING_CompareResult;

VAR len : STRING_Range;
VAR str1 : STRING_String;

BEGIN
   set_length(str1,1);
   str1[1]:= c;
   STRING_UpperCaseChar(str1,str1,1);
   STRING_UpperCase (str,str);   
   len:= length(str);
   STRING_CompareChar:= 0;
   IF len < i THEN BEGIN
      IF str1[1] <> ' ' THEN BEGIN
         STRING_CompareChar:= -1
      END;
   END
   ELSE IF str[i] < str1[1] THEN STRING_CompareChar:= -1
   ELSE IF str[i] > str1[1] THEN STRING_CompareChar:= 1
END {STRING_CompareChar};




FUNCTION STRING_FindFirstInSet (str1 : STRING_String;
                                str2 : STRING_String)
         :STRING_Range;

VAR nfound : BOOLEAN;
VAR i, j, len1, len2 : STRING_Range;

BEGIN
   nfound:= TRUE;
   i:= 0;
   len1:= length(str1);
   len2:= length(str2);
   STRING_FindFirstInSet:= 0;
   STRING_UpperCase (str1,str1);
   STRING_UpperCase (str2,str2);
   WHILE (i < len1) AND nfound DO BEGIN
      i:= i + 1;
      j:= 0;
      WHILE (j < len2) AND nfound DO BEGIN
         j:= j + 1;
	 IF str1[i] = str2[j] THEN BEGIN
   	    STRING_FindFirstInSet:= i;
            nfound:= FALSE
         END;
      END;
   END;
END {STRING_FindFirstInSet};




FUNCTION STRING_FindFirstNotInSet (str1 : STRING_String;
                                   str2 : STRING_String)
         :STRING_Range;

VAR found : BOOLEAN;
VAR i, len1, len2: STRING_Range;

BEGIN
   found:= TRUE;
   i:= 0;
   len1:= length(str1);
   len2:= length(str2);
   STRING_UpperCase (str1,str1);
   STRING_UpperCase (str2,str2);
   WHILE (i < len1) AND (i < len2) AND found DO BEGIN
      i:= i + 1;
      IF (str1[i] < str2[i]) OR (str1[i] > str2[i]) THEN BEGIN
         found:= FALSE
      END
   END;
   IF found=TRUE THEN BEGIN
      IF len1 <= len2 THEN STRING_FindFirstNotInSet:= 0
      ELSE STRING_FindFirstNotInSet:= i + 1;
   END
   ELSE STRING_FindFirstNotInSet:= i;
END {STRING_FindFirstNotInSet};




FUNCTION STRING_FindFirstSubString (CONST str1 : STRING_String;
                                    CONST str2 : STRING_String;
                                   start : STRING_Range)
         : STRING_Range;

VAR nfound : BOOLEAN;
VAR i, len1, len2: STRING_Range;
VAR str3,str1n,str2n : STRING_String;

BEGIN
   nfound:= TRUE;
   i:= 0;
   len1:= length(str1);
   len2:= length(str2);
   STRING_UpperCase (str1n,str1);
   STRING_UpperCase (str2n,str2);
   STRING_FindFirstSubString:= 0;
   WHILE (i< len1) AND nfound DO BEGIN
      STRING_Extract( str3, str1n, start + i, len2);
      IF str3 = str2n THEN BEGIN
         STRING_FindFirstSubString:= start + i;
         nfound:= FALSE
      END
      ELSE i:= i + 1;
   END;
   IF len2 = 0 THEN STRING_FindFirstSubString:= 0;
END {STRING_FindFirstSubString};




PROCEDURE STRING_Constant (VAR str1 : STRING_String;
		         CONST str2 : STRING;
   			       len2 : STRING_Range);

VAR str3 : STRING_String;
VAR i : INTEGER;

BEGIN
   str3:= str2;
   IF length(str3) <= len2 THEN str1:= str2
   ELSE BEGIN
      set_length(str1,0);
      FOR i:= 1 TO len2 DO BEGIN
         str1:= str1 || str3[i];
         
      END;
   END;
END {STRING_Constant};




PROCEDURE STRING_ConstantChar (VAR str : STRING_String;
				     c : CHAR);

VAR str1: STRING_String;

BEGIN
   set_length(str1,1);
   str1[1]:= c;
   str:= str1
END {STRING_ConstantChar};




PROCEDURE STRING_ConstantEmpty (VAR str : STRING_String);

BEGIN
   set_length(str,0);
END {STRING_ConstantEmpty};




PROCEDURE STRING_Reverse (VAR str1 : STRING_String;
			  CONST str2 : STRING_String);

VAR i, len2 : STRING_Range;
    str2n : String_String;
BEGIN
   str2n := str2;
   str1 := str2; 
   len2:= length(str2);
   FOR i:= 1 TO len2 DO
      str1[len2 + 1 - i]:= str2n[i];
END {STRING_Reverse};




PROCEDURE STRING_Extract (VAR str1 : STRING_String;
		 	      str2 : STRING_String;
                        pos, lngth : STRING_Range);

VAR str3 : STRING_String;
VAR i, j, len2 : STRING_Range;

BEGIN
   j:= 0;
   len2:= length(str2); 
   IF pos < 1  THEN pos:= 1;
   IF (pos > len2) THEN BEGIN 
      set_length(str3,0);
      str1:= str3;
   END
   ELSE IF (len2 < 1) THEN BEGIN 
      set_length(str3,0);
      str1:= str3;
   END
   ELSE BEGIN
      set_length(str1,0);
      FOR i:= pos TO (pos + lngth -1) DO BEGIN
	 j:= j + 1;
	 str1:= str1 || str2[i];
      END;    
   END;
END {STRING_Extrat};




PROCEDURE STRING_ExtractBegin (VAR str1 : STRING_String;
			           str2 : STRING_String;
                                    pos : STRING_Range);

BEGIN
   IF pos < 1 THEN set_length(str1,0)
   ELSE IF pos > length(str2) THEN str1:= str2
   ELSE BEGIN
      Deletestring(str2, pos + 1, length(str2) - pos);
      str1:= str2;
   END;
END {STRING_ExtractBegin};




PROCEDURE STRING_ExtractEnd (VAR str1 : STRING_String;
			     CONST str2 : STRING_String;
                                  pos : STRING_Range);
VAR
   str2n : String_String;
BEGIN
   str2n := str2;
   IF pos < 1 THEN str1:= str2n
   ELSE IF pos > length(str2) THEN set_length(str1,0)
   ELSE BEGIN
      Deletestring(str2n, 1, pos -1);
      str1:= str2n;
   END
END {STRING_ExtractEnd};




PROCEDURE STRING_ExtractChars (VAR str1 : STRING;
                               VAR len1 : STRING_Range;
                                   str2 : STRING_String;
                               pos, len : STRING_Range);

VAR i, a : STRING_Range;
VAR str3: STRING_String;

BEGIN
   IF pos < 1 THEN pos:= 1;
   IF (( pos > length(str2) ) OR ( length(str2) < 1 )  
   OR ( len < 1 )) THEN BEGIN
      STRING_ConstantEmpty(str3);
      str1:= str3; 
      END
   ELSE BEGIN
      a := len;
      IF pos+len-1 > length(str2) THEN a := pos+len-1-length(str2);
      set_length(str1,0);
      FOR i:= pos TO ( pos + a -1 ) DO
      BEGIN 
         str1:= str1 || str2[i];
      END;
   END;
   IF length(str1) < maxlength(str1) THEN len1:= length(str1)
   ELSE len1:= maxlength(str1);
END {STRING_ExtractChars};




PROCEDURE STRING_ExtractChar (VAR c : CHAR;
                                str : STRING_String;
                                  i : STRING_Range);

BEGIN
   IF ( i > 0 ) AND ( i <= length(str)) THEN c:= str[i]
   ELSE c:= ' '
END {STRING_ExtractChar}; 




PROCEDURE STRING_Replace (VAR str1 : STRING_String;
                          CONST str2 : STRING_String;
                       offset, len : STRING_Range;
                          CONST str3 : STRING_String);

VAR ostr, nstr, str4, str5 : STRING_String;

BEGIN
   ostr := str2;
   IF ( len < 1) THEN nstr:= str2
   ELSE BEGIN 
      IF len > length(ostr) THEN len:= length(ostr);
      IF offset < 1 THEN offset:= 1;
      IF offset > length(ostr) THEN  nstr := ostr || str3
      ELSE {IF offset <= len THEN }BEGIN
         STRING_ExtractBegin(str4, ostr, offset -1);
	 STRING_ExtractEnd(str5, ostr,  offset + len);                          
	 nstr := str4 || str3 || str5;
      END;
   END;
   str1 := nstr;
END {STRING_Replace};




PROCEDURE STRING_ReplaceChars (VAR str1 : STRING_String;
                                   str2 : STRING_String;
                            offset, len : STRING_Range;
                             CONST str3 : STRING;
                                   len3 : STRING_Range);
VAR i : STRING_Range;
VAR str4, str5 : STRING_String;

BEGIN
   IF len= 0 THEN str1:= str2
   ELSE BEGIN
      IF len > length(str2) THEN len:= length(str2);
      IF offset > length(str2) THEN BEGIN
         FOR i:= 1 TO len3 DO
         STRING_AppendChar( str1, str1, str3[i]);
      END
      ELSE IF offset <= len THEN BEGIN
         STRING_ExtractBegin(str4, str2, offset -1);
	 STRING_ExtractEnd(str5, str2, len + 1);
         FOR i:= 1 TO len3 DO BEGIN
            STRING_AppendChar( str4, str4, str3[i]);
	 END;
	 str1:= str4 || str5;
      END;
   END;
END {STRING_ReplaceChars};




PROCEDURE STRING_ReplaceChar (VAR str1 : STRING_String;
                                  str2 : STRING_String;
                                     i : STRING_Range;
                                     c : CHAR);

BEGIN
   IF ( i > 0 ) AND ( i <= length(str2)) THEN str2[i]:= c;
   str1:= str2
END {STRING_ReplaceChar};




PROCEDURE STRING_Concat (VAR str1 : STRING_String;
                         CONST str2 : STRING_String;
                         CONST str3 : STRING_String);
VAR str2n, str3n: STRING_String;
BEGIN 
   str2n := str2;
   str3n := str3;
   str1:= str2n || str3n
END {STRING_Concat};




PROCEDURE STRING_Prefix (VAR str1 : STRING_String;
                             str2 : STRING_String);

BEGIN 
   str1:= str2 || str1
END {STRING_Prefix};




PROCEDURE STRING_Append (VAR str1 : STRING_String;
                             str2 : STRING_String);

BEGIN 
   Append(str1, str2)
END {STRING_Append};




PROCEDURE STRING_AppendChars (VAR str1 : STRING_String;
                                  str2 : STRING_String;
                            CONST str3 : STRING;
                                  len3 : STRING_Range);

VAR i : STRING_Range;

BEGIN
   str1:= str2;
   if STRING_length(str3) < len3 THEN len3:=STRING_length(str3);
   FOR i:= 1 TO len3 DO BEGIN
      STRING_AppendChar( str1,str1,str3[i]);
   END;
END {STRING_AppendChars};




PROCEDURE STRING_PrefixChars (VAR str1 : STRING_String;
                                  str2 : STRING_String;
                            CONST str3 : STRING;
                                  len3 : STRING_Range);

BEGIN
   str1:= str3 || str2;
END {STRING_PrefixChars};




PROCEDURE STRING_AppendChar (VAR str1 : STRING_String;
                                 str2 : STRING_String;
                                    c : CHAR);

BEGIN
   str1:= str2;
   str1:= str2 || c   
END {STRING_AppendChar};




PROCEDURE STRING_PrefixChar (VAR str1 : STRING_String;
                                 str2 : STRING_String;
                                    c : CHAR);

VAR str3 : STRING_String;

BEGIN
   set_length(str3,1);
   str3[1]:= c;
   str1:= str3 || str2;
END {STRING_PrefixChar};




PROCEDURE STRING_Trim (VAR str1 : STRING_String;
                           str2 : STRING_String);

VAR i : STRING_Range;
VAR stop : BOOLEAN;

BEGIN 
   i:= length(str2);
   WHILE (i > 0) AND ((str2[i]=' ') OR (str2[i] = CHR(ORD(9)))) DO BEGIN
      i:= i - 1;
   END;
   str1:=str2;
   set_length(str1,i);
END {STRING_Trim};
      



PROCEDURE STRING_UpperCase (VAR str1 : STRING_String;
                                str2 : STRING_String);

VAR i : STRING_Range;

BEGIN
   str1:= str2;
   FOR i:= 1 TO length(str2) DO BEGIN
   IF str2[i] IN ['a'..'z'] THEN 
      str1[i]:= CHR(ORD(str2[i]) - ORD('a') + ORD('A'))
   ELSE IF str2[i] IN [CHR(a_grave)..CHR(y_umlaut)] THEN
      str1[i]:= CHR(ORD(str2[i]) - ORD(CHR(a_grave)) + ORD(CHR(A_gravee)))
      ELSE str1[i]:= str2[i];
   END;
END {STRING_UpperCase};




PROCEDURE STRING_UpperCaseChar (VAR str1 : STRING_String;
                                    str2 : STRING_String;
                                       i : STRING_Range);

BEGIN
   str1:= str2;
   IF (i > 0) AND (i <= length(str2)) THEN BEGIN
      IF str2[i] IN ['a'..'z'] THEN
         str1[i]:= CHR(ORD(str2[i]) - ORD('a') + ORD('A'))
      ELSE IF str2[i] IN [CHR(a_grave)..CHR(y_umlaut)] THEN
         str1[i]:= CHR(ORD(str2[i]) - ORD(CHR(a_grave)) + ORD(CHR(A_gravee)))
         ELSE str1[i]:= str2[i];
      END;
END {STRING_UpperCaseChar};




PROCEDURE STRING_LowerCase (VAR str1 : STRING_String;
                                str2 : STRING_String);

VAR i : STRING_Range;

BEGIN
   str1:= str2;
   FOR i:= 1 TO length(str2) DO BEGIN
   IF str2[i] IN ['A'..'Z'] THEN 
      str1[i]:= CHR(ORD(str2[i]) - ORD('A') + ORD('a'))
   ELSE IF str2[i] IN [CHR(A_gravee)..CHR(Y_umlautt)] THEN
      str1[i]:= CHR(ORD(str2[i]) - ORD(CHR(A_gravee)) + ORD(CHR(a_grave)))
      ELSE str1[i]:= str2[i];
   END;
END {STRING_LowerCase};




PROCEDURE STRING_LowerCaseChar (VAR str1 : STRING_String;
                                    str2 : STRING_String;
                                       i : STRING_Range);

BEGIN
   str1:= str2;
   IF (i > 0) AND (i <= length(str2)) THEN BEGIN
      IF str2[i] IN ['A'..'Z'] THEN 
         str1[i]:= CHR(ORD(str2[i]) - ORD('A') + ORD('a'))
      ELSE IF str2[i] IN [CHR(A_gravee)..CHR(Y_umlautt)] THEN
         str1[i]:= CHR(ORD(str2[i]) - ORD(CHR(A_gravee)) + ORD(CHR(a_grave)))
         ELSE str1[i]:= str2[i];
   END;
END {STRING_LowerCaseChar};




PROCEDURE STRING_ChangeCase (VAR str1 : STRING_String;
                                 str2 : STRING_String);

VAR i : STRING_Range;

BEGIN
   str1:= str2;
   FOR i:= 1 TO length(str2) DO BEGIN
      IF str2[i] IN ['a'..'z'] THEN 
         str1[i]:= CHR(ORD(str2[i]) - ORD('a') + ORD('A'))
      ELSE IF str2[i] IN [CHR(a_grave)..CHR(y_umlaut)] THEN
         str1[i]:= CHR(ORD(str2[i])- ORD(CHR(a_grave)) + ORD(CHR(A_gravee)))
         ELSE IF str2[i] IN ['A'..'Z'] THEN 
            str1[i]:= CHR(ORD(str2[i]) - ORD('A') + ORD('a'))
         ELSE IF str2[i] IN [CHR(A_gravee)..CHR(Y_umlautt)] THEN
            str1[i]:= CHR(ORD(str2[i]) - ORD(CHR(A_gravee)) + ORD(CHR(a_grave)))
   END;
END {STRING_ChangeCase};
 




PROCEDURE STRING_ChangeCaseChar (VAR str1 : STRING_String;
                                     str2 : STRING_String;
                                        i : STRING_Range);

BEGIN
   str1:= str2;
   IF (i > 0) AND (i <= length(str2)) THEN BEGIN
      IF str2[i] IN ['a'..'z'] THEN
         str1[i]:= CHR(ORD(str2[i]) - ORD('a') + ORD('A'))
      ELSE IF str2[i] IN [CHR(a_grave)..CHR(y_umlaut)] THEN
         str1[i]:= CHR(ORD(str2[i]) - ORD(CHR(a_grave)) + ORD(CHR(A_gravee)))
         ELSE IF str2[i] IN ['A'..'Z'] THEN 
            str1[i]:= CHR(ORD(str2[i]) - ORD('A') + ORD('a'))
         ELSE IF str2[i] IN [CHR(A_gravee)..CHR(Y_umlautt)] THEN
            str1[i]:= CHR(ORD(str2[i]) - ORD(CHR(A_gravee)) + ORD(CHR(a_grave)))
   END;


END {STRING_ChangeCaseChar};




