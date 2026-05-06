(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Files
 *  Creation date   :  6-2-1990
 *  Author          : Harold Leurs
 *
 *  Copyright (c) 1990, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : This module takes care that no unnecessary end-of-lines
 *                    are written and that an end-of-page marker is only written
 *                    directly after an end-of-line marker. In order to do this
 *                    correctly the following condition has to hold during the
 *                    write state of an file f :
 *                       f.pos<>0  <-> 'current-line is not closed yet'.
 *
 *  
 *                    In this module all low-level IO functions are implemented
 *                    by means of eof, eoln, get, readln, write(char), writeln,
 *                    page, open, close, reset, rewrite and extend.
 *                    
 *                    Files_Open incorrectly opened read-only files to be
 *                    written to too, thus changing the revision dates of these
 *                    files and disabling the shared reading of them.
 *                    
 *                    The procedure Files_OpenLocal opens local files,
 *                    i.e. files that are only known within the scope of the
 *                    running program.
 *
 *EMP:::===================================================================*)

Export(files);
pragma C_include('string.pf');
pragma C_include('str.pf');
pragma C_include('logname.pf');
pragma C_include('files.pf');


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM Files;

WITH STRNG,
     STR,
     LOGNAME;



VAR f,h : Text;

VAR Done : BOOLEAN;   {local status of last Read/Open/Close/Translate action}



FUNCTION Files_Done : BOOLEAN;
BEGIN 
   Files_Done:= Done
END {Files_Done};


PROCEDURE Files_Open (VAR f : Files_Text;
                 CONST name : STRING;
                        len : Files_NameRange;
                       mode : Files_Mode);

VAR ch : CHAR;   
VAR str_out, str_name : STRING(STRING_Max);
VAR status : BOOLEAN;
    
BEGIN 
   str_name:= name;
   IF len > length(name) THEN len:= length(name)
   ELSE set_length(str_name,len);
   IF LogName_Translate (str_name, str_out) THEN str_name := str_out;

   f.mode:= mode;
   f.Again:= FALSE;
   f.ch:= CHR(0);
   f.pos:= 0;
   CASE mode OF
         0,
         1,
         2  : BEGIN
               str_name :=  LogName_FindFile(str_name);
               reset(f.f,str_name );
              END;
         3,
         5  : rewrite(f.f,str_name);
       { 4,
         6  : extend(f.f,str_name) }
      END;
      Done:= TRUE
END {Files_Open};


PROCEDURE Files_OpenGlobal (VAR f : Files_Text;
                            VAR f2: Text;
                            mode : Files_Mode);

VAR ch : CHAR;   

BEGIN 
   f.f:= f2;
   f.mode:= mode;
   f.Again:= FALSE;
   f.ch:= CHR(0);
   f.pos:= 0;
   CASE mode OF
         0,
         1,
         2  : begin reset(f.f);end;
         3,
         5  : begin rewrite(f.f);end;
       { 4,
         6  : extend(f.f) }
      END;
   Done:= TRUE;
END {Files_OpenGlobal};


PROCEDURE Files_OpenLocal (VAR f : Files_Text;
                            mode : Files_Mode);

VAR ch : CHAR;   

BEGIN 
   IF (mode=1) OR (mode=3) THEN BEGIN
      f.mode:= mode;
      f.Again:= FALSE;
      f.ch:= CHR(0);
      f.pos:= 0;
      CASE mode OF
            1 : reset(f.f);
            3 : rewrite(f.f);
         END ;
         Done:= TRUE
      END
   ELSE BEGIN
      Done:= FALSE
   END 
END {Files_OpenLocal};




PROCEDURE Files_Close (VAR f : Files_Text);

BEGIN 
   close(f.f);
   Done:= TRUE
END {Files_Close};




FUNCTION Files_EndOfFile (VAR f : Files_Text)
              : BOOLEAN;

BEGIN 
   Files_EndOfFile:= EOF(f.f); {(f.ch=chr(Files_EndOfFileSymbol));}
END {Files_EndOfFile};




FUNCTION Files_EndOfSubFile (VAR f : Files_Text)
              : BOOLEAN;

BEGIN 
   Files_EndOfSubFile:= (f.ch='!')                                  
   {chr(Files_EndOfSubFileSymbol)}
END {Files_EndOfSubFile};




FUNCTION Files_EndOfLine (VAR f : Files_Text)
              : BOOLEAN;

BEGIN 
   Files_EndOfLine:= EOLn(f.f) {(f.ch=chr(Files_EndOfLineSymbol))}
END {Files_EndOfLine};



FUNCTION Files_EndOfPage (VAR f : Files_Text)
              : BOOLEAN;

BEGIN 
   Files_EndOfPage:= (f.ch=chr(Files_EndOfPageSymbol))
END {Files_EndOfPage};




FUNCTION Files_Position (VAR f : Files_TEXT)
              : Files_IORange;

BEGIN 
   Files_Position:= f.pos
END {Files_Position};




PROCEDURE Files_ReadIdentifier (VAR f : Files_Text;
                              VAR str : STRING;
                              VAR len : Files_IORange);
VAR ch : CHAR;
VAR len1 : STRING_Range;

BEGIN 
   len:= 0;
   len1:= maxlength(str);
   set_Length(str,0);
   REPEAT
      Files_ReadChar(f,ch);
      IF (ch IN ['0'..'9', 'A'..'Z', 'a'..'z', '_',
                 CHR(A_gravee)..CHR(Y_umlautt), CHR(ringel_s), CHR(a_grave)..CHR(y_umlaut)]) AND
         ( len<len1 ) THEN BEGIN
         len:= len + 1;
         str:= str || ch;
         WRITELN('str=  ',str);
      END
   UNTIL (NOT(ch IN ['0'..'9', 'A'..'Z', 'a'..'z', '_',
                 CHR(A_gravee)..CHR(Y_umlautt), CHR(ringel_s), CHR(a_grave)..CHR(y_umlaut)])) OR
         NOT Done;
   Files_ReadAgain(f);
   len:= length(str)
END {Files_ReadIdentifier};




PROCEDURE Files_ReadStr (VAR f : Files_Text;
                       VAR str : STRING;
                       VAR len : Files_IORange);

VAR ch : CHAR;  
VAR len1 : Files_IORange;

BEGIN 
   set_length(str,0);
   len:= 0;
   len1:= maxlength(str);
   REPEAT
      Files_ReadChar(f,ch);
      IF (ch>' ') AND (len<len1) THEN BEGIN
         len:= len + 1;
         str:= str || ch;
      END;
   UNTIL (ch<=' ') OR (ch=chr(Str_FS)) OR (ch=chr(Str_FF)) OR NOT Done;
   Files_ReadAgain(f);
   len:= length(str)
END {Files_ReadStr};





PROCEDURE Files_ReadString (VAR f : Files_Text;
                          VAR str : STRING_String);

VAR s : STRING(132);
VAR i : Files_IORange;

BEGIN 
   Files_ReadStr(f,s,i);
   STRING_Constant(str,s,i);
END {Files_ReadString};




PROCEDURE Files_ReadToEndOfLine (VAR f : Files_Text;
                               VAR str : STRING;
                               VAR len : Files_IORange);

VAR ch : CHAR;  
VAR len1 : Files_IORange;

BEGIN 
   set_length(str,0);
   len:= 0;
   len1:= maxlength(str);
   REPEAT
      Files_ReadChar(f,ch);
      IF (ch<>chr(Files_EndOfLineSymbol)) AND
         (ch<>chr(Files_EndOfPageSymbol)) AND
         (ch<>chr(Files_EndOfSubFileSymbol)) AND
         (ch<>chr(Files_EndOfFileSymbol)) AND
         (len<len1) THEN BEGIN
         len:= len + 1;
         str:= str || ch;
      END;
   UNTIL (ch=chr(Files_EndOfLineSymbol)) OR
         (ch=chr(Files_EndOfPageSymbol)) OR
         (ch=chr(Files_EndOfSubFileSymbol)) OR
         (ch=chr(Files_EndOfFileSymbol)) OR NOT Done;
   Files_ReadAgain(f);
   len:= length(str)
END {Files_ReadToEndOfLine};




PROCEDURE Files_ReadChar (VAR f : Files_Text;
                          VAR c : CHAR);

BEGIN
   IF f.Again THEN BEGIN
      f.Again:= FALSE
      END 
   ELSE BEGIN
      IF f.ch=chr(Files_EndOfFileSymbol) THEN BEGIN
         Done:= FALSE
         END 
      ELSE IF eof(f.f) THEN BEGIN
         f.ch:= chr(Files_EndOfFileSymbol);
         Done:= TRUE
         END 
      ELSE IF eoln(f.f) THEN BEGIN
         f.ch:= chr(Files_EndOfLineSymbol);
         f.pos:= 0;
         get(f.f);
         Done:= TRUE
         END 
      ELSE BEGIN
        f.ch:= f.f^;
         IF (f.ch=chr(Files_EndOfPageSymbol)) OR
            (f.ch=chr(Files_EndOfSubFileSymbol)) THEN BEGIN
            f.pos:= 0
            END 
         ELSE BEGIN
            f.pos:= f.pos+1
         END;
         get(f.f);
         Done:= TRUE
      END;
   END;
   c:= f.ch;
END {Files_ReadChar};




PROCEDURE Files_ReadInteger (VAR f : Files_Text;
                             VAR i : INTEGER);

VAR str  : Files_IOBuffer;
VAR len  : Files_IORange;
VAR ch   : CHAR;
VAR str2 : String(Files_MaxIO);

BEGIN 
   Files_SkipSpace(f,FALSE);
   len:= 0;
   Files_ReadChar(f,ch); 
   str2[len+1] := ch;
   IF (str2[len+1]='-') OR (str2[len+1]='+') THEN BEGIN
      len:= len + 1;
      Files_SkipSpace(f,FALSE);
      END 
   ELSE BEGIN
      Files_ReadAgain(f)
   END;
   Files_ReadChar(f,ch);
   str2[len+1]:=ch;
   WHILE (str2[len+1] IN ['0'..'9']) AND Done DO BEGIN
      len:= len + 1;
      Files_ReadChar(f,ch);
      str2[len+1] := ch
   END ;
   Files_ReadAgain(f);
   set_length(str2,len);
   str:= str2;
   IF Done THEN Done:= Str_StrToInteger(str,len,i)
END {Files_ReadInteger};



PROCEDURE Files_ReadBoolean (VAR f : Files_Text;
                             VAR b : BOOLEAN);

VAR str : STRING(5);
VAR len : Files_IORange;

BEGIN 
   Files_SkipSpace(f,FALSE);
   Files_ReadIdentifier(f,str,len);
   IF Done THEN Done:= Str_StrToBoolean(str,len,b)
END {Files_ReadBoolean};



PROCEDURE Files_SkipSpace (VAR f : Files_Text;
                               b : BOOLEAN);

VAR ch : CHAR;   

BEGIN 
   REPEAT
      Files_ReadChar(f,ch);
   UNTIL  (((NOT b) AND (ch<>' ') AND (ch<>chr(Files_TabSymbol)))
          OR
          ( b AND (ch<>' ') AND (ch<>chr(Files_TabSymbol))
           AND (ch<> chr(Files_EndOfLineSymbol)) AND
          (ch<>chr(Files_EndOfPageSymbol))))
   	  OR NOT Done;
   Files_ReadAgain(f)
END {Files_SkipSpace};



PROCEDURE Files_SkipLine (VAR f : Files_Text);

VAR ch : CHAR; 

BEGIN 
   REPEAT
      Files_ReadChar(f,ch)
   UNTIL (ch = chr(Files_EndOfLineSymbol)) {EOLn(f.f)} OR NOT Done
END {Files_SkipLine};



PROCEDURE Files_SkipPage (VAR f : Files_Text);

VAR ch : CHAR;

BEGIN 
   REPEAT
      Files_ReadChar(f,ch);
      WRITELN(ch);
   UNTIL (ch=chr(Files_EndOfPageSymbol)) OR NOT Done
END {Files_SkipPage};



PROCEDURE Files_SkipSubFile (VAR f : Files_Text);

VAR ch : CHAR;  

BEGIN 
   REPEAT
      Files_ReadChar(f,ch);
   UNTIL (ch=chr(Files_EndOfSubFileSymbol)) OR NOT Done
END {Files_SkipSubFile};



PROCEDURE Files_ReadAgain (VAR f : Files_Text);
BEGIN 
   f.Again:= TRUE;
END {Files_ReadAgain};



PROCEDURE Files_WriteStr (VAR f : Files_Text;
                      CONST str : STRING;
                     len, width : Files_IORange;
                    LeftJustify : Files_LeftJustify);

VAR i : Files_IORange;   
VAR len1 : STRING_Range;

BEGIN 
   len1:= length(str);
   IF len > len1 THEN len:= len1;
   IF width < len THEN width:= len;
   IF NOT LeftJustify THEN
      Files_WriteSpace(f,width-len);
   IF (f.pos+len)>Files_MaxIO THEN
      Files_WriteLine(f,TRUE);
   FOR i:=1 TO len DO BEGIN
      Files_WriteChar(f, str[i]);
   END;

   IF LeftJustify THEN Files_WriteSpace(f,width-len)
END {Files_WriteStr};



PROCEDURE Files_WriteString (VAR f : Files_Text;
                               str : STRING_String;
                             width : Files_IORange;
                       LeftJustify : Files_LeftJustify);

VAR str2 : STRING(132);
VAR len2 : STRING_Range;

BEGIN 
   STRING_ExtractChars(str2,len2,str,1,STRING_Length(str));
   Files_WriteStr(f,str2,len2,width,LeftJustify)
END {Files_WriteString};




PROCEDURE Files_WriteChar (VAR f : Files_Text;
                               c : CHAR);

BEGIN 
   IF c=chr(Files_EndOflineSymbol) THEN BEGIN
      Files_WriteLine(f,TRUE);
      END 
    ELSE IF c=chr(Files_EndOfPageSymbol) THEN BEGIN
      Files_WritePage(f);
      END 
   ELSE IF c=chr(Files_EndOfSubFileSymbol) THEN BEGIN
      Files_WriteSubFile(f);
      END 
   ELSE IF c=chr(Files_EndOfFileSymbol) THEN BEGIN
      Files_CLose(f);
      END 
   ELSE BEGIN
      IF f.pos=Files_MaxIO THEN Files_WriteLine(f,TRUE);
      write(f.f, c);
      Done:= TRUE;
      f.pos:= f.pos+1
   END
END {Files_WriteChar};



PROCEDURE Files_WriteInteger (VAR f : Files_Text;
                                  i : INTEGER;
                              width : Files_IORange;
                        LeftJustify : Files_LeftJustify);

VAR str : STRING(132);
VAR len : Str_Range;

BEGIN 
   Done:= Str_IntegerToStr(i, str, len);
   IF Done THEN
      Files_WriteStr(f,str,len,width,LeftJustify)
END {Files_WriteInteger};




PROCEDURE Files_WriteBoolean (VAR f : Files_Text;
                                  b : BOOLEAN;
                              width : Files_IORange;
                        LeftJustify : Files_LeftJustify);

VAR str : STRING(132);
VAR len : STR_Range;

BEGIN 
   Done:= Str_BooleanToStr(b,str,len);
   IF Done THEN 
      Files_WriteStr(f,str,len,width,LeftJustify)
END {Files_WriteBoolean};




PROCEDURE Files_WriteSpace (VAR f : Files_Text;
                            width : Files_IORange);

VAR i : Files_IORange;   

BEGIN 
   FOR i:=1 TO width DO BEGIN
      Files_WriteChar(f, ' ');
   END
END {Files_WriteSpace};




PROCEDURE Files_WriteLine (VAR f : Files_Text;
                               b : BOOLEAN);

BEGIN 
   IF b OR (f.pos<>0) THEN BEGIN
      writeln(f.f);
      Done:= TRUE;
      f.pos:= 0;
      END 
   ELSE BEGIN
      Done:= TRUE
   END
END {Files_WriteLine};



PROCEDURE Files_WritePage (VAR f : Files_Text);

BEGIN 
   Files_WriteLine(f,FALSE);
   write(f.f, chr(Files_EndOfPageSymbol));
   Done:= TRUE;
   f.pos:= 0
END {Files_WritePage};



PROCEDURE Files_WriteSubFile (VAR f : Files_Text);

BEGIN 
   Files_WriteLine(f,FALSE);
   write(f.f, chr(Files_EndOfSubFileSymbol));
   Done:= TRUE;
   f.pos:= 0
END {Files_WriteSubFile};



