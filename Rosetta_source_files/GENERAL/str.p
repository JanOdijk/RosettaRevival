 
(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Str
 *  Creation date   : 12-2-1990
 *  Author          : Harold Leurs
 *
 *  Copyright (c) 1990 by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

pragma C_include('strings.pf');
Export(str);
pragma C_include('str.pf');


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM Str;

WITH STRINGS;

(*-------------------------------------------------------------------------*
 *  The bodies of the exported routines
 *-------------------------------------------------------------------------*)



FUNCTION Str_Length ( CONST str1 : STRING;
                            len1 : Str_Range)
            : Str_Range;

VAR str2,str3 : Str_String;
VAR len2 : Str_Range;
BEGIN
   IF len1 < length(str1) THEN Str_Length:= len1
   ELSE BEGIN
      str3:= str1;
      Str_Trim(str2,len2,str3,len1);
      Str_Length:= length(str2);
   END;
END {Str_Length};







FUNCTION Str_BooleanToStr (b : BOOLEAN;
                    VAR str2 : STRING;
                    VAR len2 : Str_Range)
            : BOOLEAN;

VAR len22 : Str_Range;
BEGIN 
   len22:= maxlength(str2);
   len2:= 0;
   set_length(str2,0);
   IF b THEN BEGIN
      IF len2<len22 THEN BEGIN len2:= len2+1; Str2 := str2 || 'T' END;
      IF len2<len22 THEN BEGIN len2:= len2+1; Str2 := str2 || 'R' END;
      IF len2<len22 THEN BEGIN len2:= len2+1; Str2 := str2 || 'U' END;
      IF len2<len22 THEN BEGIN len2:= len2+1; Str2 := str2 || 'E' END;
      Str_BooleanToStr:= (len2=1) OR (len2=4)
      END {THEN}
   ELSE BEGIN
      IF len2<len22 THEN BEGIN len2:= len2+1; Str2 := str2 || 'F' END;
      IF len2<len22 THEN BEGIN len2:= len2+1; Str2 := str2 || 'A' END;
      IF len2<len22 THEN BEGIN len2:= len2+1; Str2 := str2 || 'L' END;
      IF len2<len22 THEN BEGIN len2:= len2+1; Str2 := str2 || 'S' END;
      IF len2<len22 THEN BEGIN len2:= len2+1; Str2 := str2 || 'E' END;
      Str_BooleanToStr:= (len2=1) OR (len2=5)
   END
END {Str_BooleanToStr};




FUNCTION Str_StrToBoolean (CONST str1 : STRING;
                                 len1 : Str_Range;
                                VAR b : BOOLEAN)
            : BOOLEAN;

BEGIN 
   IF (Str_CompareBegin(str1,len1, 'FALSE',5) = 0) AND
      ((length(str1) <= 5) OR (len1 <= 5)) THEN BEGIN
      b:= FALSE;
      Str_StrToBoolean:= TRUE
      END 
   ELSE IF (Str_CompareBegin(str1,len1, 'TRUE',4) = 0) AND
           ((length(str1) <= 4) OR (len1 <= 4)) THEN BEGIN
      b:= TRUE;
      Str_StrToBoolean:= TRUE
      END 
   ELSE BEGIN
      Str_StrToBoolean:= FALSE
   END 
END {Str_StrToBoolean};



FUNCTION Str_IntegerToStr (i : INTEGER;
                    VAR str2 : STRING;
                    VAR len2 : Str_Range)
            : BOOLEAN;

CONST max = 15;   { maximal length of an integer representation + 1 }

VAR str : STRING(max);
      k : 0..max;
      neg : BOOLEAN;

BEGIN 
      { determine sign and make i unsigned }
   neg:= i<0;
   IF neg THEN i:= -i;

      { convert unsigned i to string, using reverse representation }
   len2:= 0;
   REPEAT
      len2:= len2+1;
      str[max-len2+1]:= chr((i MOD 10) + ord('0'));
      i:= i DIV 10;
   UNTIL i=0;

      { add sign if needed }
   IF neg THEN BEGIN
      len2:=len2+1;
      str[max-len2+1]:= '-'
   END ;
   IF len2<=maxlength(str2) THEN BEGIN
        { shift representation to the left }
      set_length(str2,0);
      FOR k:=1 TO len2 DO BEGIN
         str2 := str2 || str[max-len2+k]
      END ;
      Str_IntegerToStr:= TRUE
      END 
   ELSE BEGIN
      Str_IntegerToStr:= FALSE
   END 
END {Str_IntegerToStr};



FUNCTION Str_StrToInteger (CONST str1 : STRING;
                                 len1 : Str_Range;
                                VAR i : INTEGER)
         : BOOLEAN;

VAR len, len11, cur : Str_Range;
VAR okee, neg : BOOLEAN;

BEGIN 
   len11:= length(str1);
   IF (len11 < len1) THEN BEGIN
      len:= len11; 
      END
   ELSE BEGIN
      len:= len1;
      END;
   IF len=0 THEN BEGIN
      Str_StrToInteger:= FALSE
      END 
   ELSE BEGIN
      neg:= (str1[1]='-');
      IF str1[1] IN ['-','+'] THEN begin
         cur:=1 ;
         end
      ELSE cur:=0;
      i:=0;
      okee:= cur<len;
      WHILE (cur<len) AND okee DO BEGIN
         cur:= cur+1;
         okee:= str1[cur] IN ['0'..'9'];
         IF okee THEN i:= (10*i) + (ord(str1[cur]) - ord('0'))
      END;
      IF neg THEN i:= -i;
      Str_StrToInteger:= okee
   END 
END {Str_StrToInteger};






FUNCTION  Str_Compare (CONST str1 : STRING;
                             len1 : Str_Range;
                       CONST str2 : STRING;
                             len2 : Str_Range)
             : Str_CompareResult;

VAR a : Str_CompareResult;
VAR len11, len22, i : Str_Range;
VAR equal : BOOLEAN;

BEGIN
   Str_Compare:= 0;
   len11:= length(str1);
   len22:= length(str2);
   IF len11 < len1 THEN len1:= len11;
   IF len22 < len2 THEN len2:= len22;
   a:= Str_CompareBegin(str1, len1, str2, len2);
   IF (a= 1) OR (a= -1) THEN Str_Compare:= a
   ELSE BEGIN
      IF len1 < len2 THEN BEGIN
         i:= len1;
         equal:= TRUE;
         WHILE (i < len2) AND equal DO BEGIN
            i:= i + 1;
            IF str2[i] <> ' ' THEN equal:= FALSE
         END;
         IF equal= TRUE THEN Str_Compare:= a
         ELSE Str_Compare:=  -1;
         END
      ELSE IF len1 > len2 THEN BEGIN
         i:= len2;
         equal:= TRUE;
         WHILE (i < len1) AND equal DO BEGIN
            i:= i + 1;
            IF str1[i] <> ' ' THEN equal:= FALSE
         END;
         IF equal= TRUE THEN Str_Compare:= a
         ELSE Str_Compare:=  1;
         END
   END;
END {Str_Compare};

         



FUNCTION  Str_CompareBegin (CONST str1 : STRING;
                                  len1 : Str_Range;
                            CONST str2 : STRING;
                                  len2 : Str_Range)
             : Str_CompareResult;

VAR i, len3, len4,  len11, len22 : Str_Range;
VAR str3, str4 : Str_String;
VAR equal: BOOLEAN;

BEGIN 
   i:= 0;
   equal:= TRUE;
   Str_UpperCase (str3, len3, str1, len1);
   Str_UpperCase (str4, len4, str2, len2);
   len11:= length(str1);
   len22:= length(str2);
   IF len11 < len1 THEN len1:= len11;
   IF len22 < len2 THEN len2:= len22;
   Str_CompareBegin:= 0;
   WHILE (i < len1) AND (i < len2) AND equal DO BEGIN
      i:= i + 1;
      IF str3[i] < str4[i] THEN BEGIN
         Str_CompareBegin:= -1;
         equal:= FALSE
         END
      ELSE IF str3[i] > str4[i] THEN BEGIN
         Str_CompareBegin:= 1;
         equal:= FALSE
         END;
   END;   
END {Str_CompareBegin};
   



FUNCTION  Str_CompareEnd (CONST str1 : STRING;
                                len1 : Str_Range;
                          CONST str2 : STRING;
                                len2 : Str_Range)
             : Str_CompareResult;

VAR i, j, k, l : Str_Range;
VAR len3, len4, len11, len22 : Str_Range;
VAR str3, str4 : Str_String;
VAR equal: BOOLEAN;

BEGIN 
   l:= 0;
   equal:= TRUE;
   Str_CompareEnd:= 0;
   Str_UpperCase (str3, len3, str1, len1);
   Str_UpperCase (str4, len4, str2, len2);
   len11:= length(str1);
   len22:= length(str2);
   IF len11 < len1 THEN len1:= len11;
   IF len22 < len2 THEN len2:= len22;
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
         Str_CompareEnd:= -1;
         equal:= FALSE
      END
      ELSE IF str3[i] > str4[j] THEN BEGIN 
         Str_CompareEnd:= 1;
         equal:= FALSE
      END;
   END;
END {Str_CompareEnd};
   



FUNCTION  Str_FindFirstInSet (CONST str1 : STRING;
                                    len1 : Str_Range;
                              CONST str2 : STRING;
                                    len2 : Str_Range)
             : Str_Range;

VAR nfound : BOOLEAN;
VAR i, j : Str_Range;
VAR len3, len4, len11, len22 : Str_Range;
VAR str3, str4: Str_String;

BEGIN
   nfound:= TRUE;
   i:= 0;
   Str_FindFirstInSet:= 0;
   Str_UpperCase (str3, len3, str1, len1);
   Str_UpperCase (str4, len4, str2, len2);
   len11:= length(str1);
   len22:= length(str2);
   IF len11 < len1 THEN len1:= len11;
   IF len22 < len2 THEN len2:= len22;
   WHILE (i < len1) AND nfound DO BEGIN
      i:= i + 1;
      j:= 0;
      WHILE (j < len2) AND nfound DO BEGIN
         j:= j + 1;
         IF str1[i] = str2[j] THEN BEGIN
            Str_FindFirstInSet:= i;
            nfound:= FALSE
         END;
      END;
   END;
  
END {Str_FindFirstInSet};
   



FUNCTION  Str_FindFirstNotInSet (CONST str1 : STRING;
                                       len1 : Str_Range;
                                 CONST str2 : STRING;
                                       len2 : Str_Range)
             : Str_Range;


VAR found : BOOLEAN;
VAR i, len3, len4, len11, len22 : Str_Range;
VAR str3, str4 : Str_String;

BEGIN
   found:= TRUE;
   i:= 0;
   Str_UpperCase (str3, len3, str1,len1);
   Str_UpperCase (str4, len4, str2,len2);
   len11:= length(str1);
   len22:= length(str2);
   IF len11 < len1 THEN len1:= len11;
   IF len22 < len2 THEN len2:= len22;
   WHILE (i < len1) AND (i < len2) AND found DO BEGIN
      i:= i + 1;
      IF (str3[i] < str4[i]) OR (str3[i] > str4[i]) THEN BEGIN
         found:= FALSE
      END
   END;
   IF found=TRUE THEN BEGIN
      IF len1 <= len2 THEN Str_FindFirstNotInSet:= 0    
      ELSE Str_FindFirstNotInSet:= i + 1;
   END
   ELSE Str_FindFirstNotInSet:= i;      
END {Str_FindFirstNotInSet};
   



FUNCTION  Str_FindFirstSubString (CONST str1 : STRING;
                                        len1 : Str_Range;
                                  CONST str2 : STRING;
                                        len2 : Str_Range;
                                       start : Str_Range)
             : Str_Range;

VAR nfound : BOOLEAN;
VAR i, len3, len4 : Str_Range;
VAR str3, str4 : Str_String;

BEGIN
   nfound:= TRUE;
   i:= 0;
   len1:= length(str1);
   len2:= length(str2);
   Str_UpperCase (str3, len3, str1, len1);
   Str_UpperCase (str4, len4, str2,len2);
   Str_FindFirstSubString:= 0;
   WHILE (i< len1) AND nfound DO BEGIN
      Str_Extract( str3, len3, str1, len1, start + i, len2);
      IF str3 = str2 THEN BEGIN
         Str_FindFirstSubString:= start + i;
         nfound:= FALSE
      END
      ELSE i:= i + 1;
   END;
   IF len2 = 0 THEN Str_FindFirstSubString:= 0;   
END {Str_FindFirstSubString};





PROCEDURE Str_Reverse (VAR str1 : STRING;
                       VAR len1 : Str_Range;
                     CONST str2 : STRING;
                           len2 : Str_Range);

VAR i : Str_Range;

BEGIN
   IF len2 > length(str2) THEN len2:= length(str2);
   IF len2 > maxlength(str1) THEN len1:= maxlength(str1) ELSE len1:= len2;
   set_length(str1,0);
   FOR i:=1 TO len1 DO str1 := str1 || str2[len2+1-i]
END {Str_Reverse};
   



PROCEDURE Str_Extract (VAR str1 : STRING;
                       VAR len1 : Str_Range;
                     CONST str2 : STRING;
                           len2 : Str_Range;
                       pos, len : Str_Range);

VAR str3 : Str_String;
VAR i, j, k : Str_Range;

BEGIN
   j:= 0;
   set_length(str3,0);
   IF len2 > length(str2) THEN len2:= length(str2);
   IF pos < 1  THEN pos:= 1;
   IF (pos > len2) THEN BEGIN 
      str1:= str3;
      len1:= 0;
      END
   ELSE IF (len2 < 1) THEN BEGIN 
      str1:= str3;
      len1:= 0;
      END
   ELSE BEGIN  
      set_length(str1,0);
      FOR i:= pos TO (pos + len -1) DO BEGIN
         IF length(str1) < maxlength(str1) THEN str1:= str1 || str2[i];
      END; 
      len1 := length(str1);
   END;  
END {Str_Extract};
   



PROCEDURE Str_ExtractBegin (VAR str1 : STRING;
                            VAR len1 : Str_Range;
                            CONST str2 : STRING;
                            len2 : Str_Range;
                            pos : Str_Range);
VAR str3 : Str_String;
VAR a : Str_Range;

BEGIN
   str3:= str2;
   IF len2 > length(str2) THEN len2:= length(str2);
   IF (pos < 1) THEN set_length(str3,0)
   ELSE IF pos > length(str2) THEN str1:= str2
   ELSE BEGIN
      IF len1 < pos THEN a:= len1
      ELSE a:= pos;
      Deletestring(str3, a + 1, length(str2) - pos);
   END;
   IF length(str3) < maxlength(str1) THEN len1:= length(str3)
   ELSE len1:= maxlength(str1);
   set_length(str3,len1);
   str1:= str3;
END {Str_ExtractBegin};
   



PROCEDURE Str_ExtractEnd (VAR str1 : STRING;
                          VAR len1 : Str_Range;
                        CONST str2 : STRING;
                              len2 : Str_Range;
                               pos : Str_Range);

VAR str3 : Str_String;
VAR a : Str_Range;

BEGIN
   str3:= str2;
   IF len2 > length(str2) THEN len2:= length(str2);
   IF pos < 1 THEN str1:= str2
   ELSE IF pos > length(str2) THEN set_length(str1,0)
   ELSE BEGIN
      IF len1 < pos THEN a:= len1
      ELSE a:= pos;
      Deletestring(str3, 1, a -1);
   END;
   IF length(str3) < maxlength(str1) THEN len1:= length(str3)
   ELSE len1:= maxlength(str1);
   set_length(str3,len1);
   str1:= str3;
END {Str_ExtractEnd};
   



PROCEDURE Str_Replace (VAR str1 : STRING;
                       VAR len1 : Str_Range;
                       CONST str2 : STRING;
                       len2 : Str_Range;
                       offset, len : Str_Range;
                       CONST str3 : STRING;
                       len3 : Str_Range);

VAR i, len4, len5, len6 : Str_Range;
VAR str4, str5, str6 : Str_String;

BEGIN
   set_length(str6,0);
   IF len2 > length(str2) THEN len2:= length(str2);
   IF len3 > length(str3) THEN len3:= length(str3);
   IF len= 0 THEN str1:= str2
   ELSE BEGIN
      IF len > length(str2) THEN len:= length(str2);
      IF offset > length(str2) THEN BEGIN
         FOR i:= 1 TO len3 DO
         Str_AppendChar( str6, len6, str6, len6, str3[i]);
      END
      ELSE IF offset <= len THEN BEGIN
         Str_ExtractBegin(str4, len4, str2, len2, offset -1);
         Str_ExtractEnd(str5, len5, str2, len2, len + 1);
         FOR i:= 1 TO len3 DO BEGIN
            Str_AppendChar( str4, len4, str4, len4, str3[i]);
         END;
         str6:= str4 || str5;
      END;
   END;
   IF length(str6) < maxlength(str1) THEN len1:= length(str6)
   ELSE len1:= maxlength(str1);
   set_length(str6,len1);
   str1:= str6;
END {Str_Replace};
   



PROCEDURE Str_Concat (VAR str1 : STRING;
                      VAR len1 : Str_Range;
                    CONST str2 : STRING;
                          len2 : Str_Range;
                    CONST str3 : STRING;
                          len3 : Str_Range);
VAR str4, str5, str6 : Str_String;

BEGIN
   set_length(str6,0);
   str4:= str2;
   str5:= str3;
   IF len2< length(str2) THEN set_length(str4,len2);
   IF len3< length(str3) THEN set_length(str5,len3);
   str6:= str4 || str5;
   IF length(str6) < maxlength(str1) THEN len1:= length(str6)
   ELSE len1:= maxlength(str1);
   set_length(str6,len1);
   str1:= str6;
END {Str_Concat};




PROCEDURE Str_PrefixChar (VAR str1 : STRING;
                          VAR len1 : Str_Range;
                        CONST str2 : STRING;
                              len2 : Str_Range;
                                ch : CHAR);

VAR str3, str4, str6 : Str_String;

BEGIN
   set_length(str6,0);
   str4:= str2;
   IF len2< length(str2) THEN set_length(str4,len2);
   set_length(str3,1);
   str3[1]:= ch;
   str6:= str3 || str4;
   IF length(str6) < maxlength(str1) THEN len1:= length(str6)
   ELSE len1:= maxlength(str1);
   set_length(str6,len1);
   str1:= str6; 
END {Str_PrefixChar};




PROCEDURE Str_AppendChar (VAR str1 : STRING;
                          VAR len1 : Str_Range;
                        CONST str2 : STRING;
                              len2 : Str_Range;
                                ch : CHAR);
VAR  str4, str6 : Str_String;

BEGIN
   set_length(str6,0);
   str4:= str2;
   IF len2< length(str2) THEN set_length(str4,len2);
   str6:= str4;
   str6:= str4 || ch;
   IF length(str6) < maxlength(str1) THEN len1:= length(str6)
   ELSE len1:= maxlength(str1);
   set_length(str6,len1);
   str1:= str6;
END {Str_AppendChar};




PROCEDURE Str_Trim (VAR str1 : STRING;
                    VAR len1 : Str_Range;
                  CONST str2 : STRING;
                        len2 : Str_Range);

VAR i : Str_Range;
VAR stop : BOOLEAN;
VAR str3 : Str_String;

BEGIN 
   IF len2 > length(str2) THEN len2:= length(str2);
   i:= len2;
   WHILE (i > 0) AND ((str2[i]=' ') OR (str2[i] = CHR(ORD(9)))) DO BEGIN
      i:= i - 1;
   END;
   str3:=str2;
   set_length(str3,i);
   IF length(str3) < maxlength(str1) THEN len1:= length(str3)
   ELSE len1:= maxlength(str1);
   set_length(str3,len1);
   str1:= str3;
END {Str_Trim};
   



PROCEDURE Str_UpperCase (VAR str1 : STRING;
                         VAR len1 : Str_Range;
                         CONST str2 : STRING;
                         len2 : Str_Range);

VAR i : Str_Range;
VAR str3 : Str_String;

BEGIN
   IF len2 > length(str2) THEN len2:= length(str2);
   set_length(str3,len2);
   str3:= str2;
   FOR i:= 1 TO len2 DO BEGIN
      IF str2[i] IN ['a'..'z'] THEN 
         str3[i]:= CHR(ORD(str2[i]) - ORD('a') + ORD('A'))   
      ELSE IF str2[i] IN [CHR(a_grave)..CHR(y_umlaut)] THEN
         str3[i]:= CHR(ORD(str2[i]) - ORD(CHR(a_grave)) + ORD(CHR(A_gravee)))
      ELSE str3[i]:= str2[i];
   END;
   IF length(str3) < maxlength(str1) THEN len1:= length(str3)
   ELSE len1:= maxlength(str1);
   set_length(str3,len1);
   str1:= str3;
END {Str_UpperCase};



PROCEDURE Str_UpperCaseChar (VAR str1 : STRING;
                             VAR len1 : Str_Range;
                           CONST str2 : STRING;
                                 len2 : Str_Range;
                                    i : Str_Range);
VAR str3 : Str_String;

BEGIN
   IF len2>length(str2) THEN len2:= length(str2);
   set_length(str3,len2);
   str3:= str2;
   IF (i > 0) AND (i <= length(str2)) THEN BEGIN
      IF str2[i] IN ['a'..'z'] THEN
         str3[i]:= CHR(ORD(str2[i]) - ORD('a') + ORD('A'))
      ELSE IF str2[i] IN [CHR(a_grave)..CHR(y_umlaut)] THEN
         str3[i]:= CHR(ORD(str2[i]) - ORD(CHR(a_grave)) + ORD(CHR(A_gravee)))
         ELSE str3[i]:= str2[i];
      END;
   IF length(str3) < maxlength(str1) THEN len1:= length(str3)
   ELSE len1:= maxlength(str1);
   set_length(str3,len1);
   str1:= str3;
END {Str_UpperCaseChar};



PROCEDURE Str_LowerCase (VAR str1 : STRING;
                         VAR len1 : Str_Range;
                       CONST str2 : STRING;
                             len2 : Str_Range);

VAR i : Str_Range;
VAR str3 : Str_String;

BEGIN
   IF len2>length(str2) THEN len2:= length(str2);
   set_length(str3,len2);
   str3:= str2;
   FOR i:= 1 TO len2 DO BEGIN
   IF str2[i] IN ['A'..'Z'] THEN 
      str3[i]:= CHR(ORD(str2[i]) - ORD('A') + ORD('a'))   ELSE IF str2[i] IN [CHR(A_gravee)..CHR(Y_umlautt)] THEN
      str3[i]:= CHR(ORD(str2[i]) - ORD(CHR(A_gravee)) + ORD(CHR(a_grave)))
      ELSE str3[i]:= str2[i];
   END;
   IF length(str3) < maxlength(str1) THEN len1:= length(str3)
   ELSE len1:= maxlength(str1);
   set_length(str3,len1);
   str1:= str3;
END {Str_LowerCase};



PROCEDURE Str_LowerCaseChar (VAR str1 : STRING;
                             VAR len1 : Str_Range;
                             CONST str2 : STRING;
                             len2 : Str_Range;
                             i : Str_Range);

VAR str3 : Str_String;

BEGIN
   IF len2>length(str2) THEN len2:= length(str2);
   set_length(str3,len2);
   str3:= str2;
   IF (i > 0) AND (i <= length(str2)) THEN BEGIN
      IF str2[i] IN ['A'..'Z'] THEN 
         str3[i]:= CHR(ORD(str2[i]) - ORD('A') + ORD('a'))
      ELSE IF str2[i] IN [CHR(A_gravee)..CHR(Y_umlautt)] THEN
         str3[i]:= CHR(ORD(str2[i]) - ORD(CHR(A_gravee)) + ORD(CHR(a_grave)))
         ELSE str3[i]:= str2[i];
   END;
   IF length(str3) < maxlength(str1) THEN len1:= length(str3)
   ELSE len1:= maxlength(str1);
   set_length(str3,len1);
   str1:= str3;
END {Str_LowerCaseChar};



PROCEDURE Str_ChangeCase (VAR str1 : STRING;
                          VAR len1 : Str_Range;
                          CONST str2 : STRING;
                          len2 : Str_Range);

VAR i : Str_Range;
VAR str3 : Str_String;

BEGIN
   IF len2>length(str2) THEN len2:= length(str2);
   set_length(str3,len2);
   str3:= str2;
   FOR i:= 1 TO len2 DO BEGIN
      IF str2[i] IN ['a'..'z'] THEN 
         str3[i]:= CHR(ORD(str2[i]) - ORD('a') + ORD('A'))
      ELSE IF str2[i] IN [CHR(a_grave)..CHR(y_umlaut)] THEN
         str3[i]:= CHR(ORD(str2[i])- ORD(CHR(a_grave)) + ORD(CHR(A_gravee)))
         ELSE IF str2[i] IN ['A'..'Z'] THEN 
            str3[i]:= CHR(ORD(str2[i]) - ORD('A') + ORD('a'))
         ELSE IF str2[i] IN [CHR(A_gravee)..CHR(Y_umlautt)] THEN
            str3[i]:= CHR(ORD(str2[i]) - ORD(CHR(A_gravee)) + ORD(CHR(a_grave)))
   END;
   IF length(str3) < maxlength(str1) THEN len1:= length(str3)
   ELSE len1:= maxlength(str1);
   set_length(str3,len1);
   str1:= str3;
END {Str_ChangeCase};



PROCEDURE Str_ChangeCaseChar (VAR str1 : STRING;
                              VAR len1 : Str_Range;
                              CONST str2 : STRING;
                              len2 : Str_Range;
                              i : Str_Range);

VAR str3 : Str_String;

BEGIN
   IF len2>length(str2) THEN len2:= length(str2);
   set_length(str3,len2);
   str3:= str2;
   IF (i > 0) AND (i <= length(str2)) THEN BEGIN
      IF str2[i] IN ['a'..'z'] THEN
         str3[i]:= CHR(ORD(str2[i]) - ORD('a') + ORD('A'))
      ELSE IF str2[i] IN [CHR(a_grave)..CHR(y_umlaut)] THEN
         str3[i]:= CHR(ORD(str2[i]) - ORD(CHR(a_grave)) + ORD(CHR(A_gravee)))
         ELSE IF str2[i] IN ['A'..'Z'] THEN 
            str3[i]:= CHR(ORD(str2[i]) - ORD('A') + ORD('a'))
         ELSE IF str2[i] IN [CHR(A_gravee)..CHR(Y_umlautt)] THEN
            str3[i]:= CHR(ORD(str2[i]) - ORD(CHR(A_gravee)) + ORD(CHR(a_grave)))
   END;
   IF length(str3) < maxlength(str1) THEN len1:= length(str3)
   ELSE len1:= maxlength(str1);
   set_length(str3,len1);
   str1:= str3;
END {Str_ChangeCaseChar};




