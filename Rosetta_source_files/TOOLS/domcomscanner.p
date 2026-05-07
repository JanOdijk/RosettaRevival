(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : DOMCOMSCANNER 
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export(DOMCOMSCANNER);
pragma C_include('domcomdecl.pf');
pragma C_include('domcomlangspec.pf');
pragma C_include('string.pf');
pragma C_include('domcomscanner.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

WITH DOMCOMLANGSPEC,
     DOMCOMDECL,
     STRNG;

PROGRAM DOMCOMSCANNER;

CONST
   MAXLENGTH = 30;

FUNCTION DOMCOMSCANNER_Body(VAR inf: text) : DOMCOMDECL_pconnectionnode; 

LABEL 99;

CONST TAB = 9;

VAR
   stop,quote:boolean;
   ch  : char;
   endoffile : boolean;
   sym : DOMCOMLANGSPEC_Category;
   connected : boolean;
   wrd : TSTRING_String;
   cc,
   cl,
   ll  : integer;
   line: ARRAY[1..155] OF CHAR;
   t   : DOMCOMDECL_pSnode;
   result: DOMCOMDECL_pconnectionnode;

   PROCEDURE error;

   BEGIN
      result := nil; GOTO 99
   END;


   PROCEDURE getch;

   BEGIN
      IF cc = ll THEN BEGIN
         IF EOF(inf) THEN BEGIN
            {WRITELN('FILE INCOMPLETE; FILE MAY NOT END WITH EMPTY LINE'); 
             error;}
         stop:=true 
         END else stop:=false;
         ll := 0; cc := 0; cl := cl+1; endoffile := false;
         WHILE not (EOLN(inf) or stop) DO BEGIN
            ll := ll+1; read(inf, ch); 
            IF ord(ch) = TAB THEN line[ll]:=' ' ELSE line[ll]:=ch
         END;
         ll := ll+1; read(inf, line[ll])
      END;
      IF not stop THEN BEGIN cc := cc+1; ch := line[cc] END
      ELSE BEGIN ch:=' '; endoffile:=true  END;

      IF ( cc = ll ) and EOF(inf) THEN endoffile := true;
   END {getch};
      
 
   PROCEDURE getsym;
   VAR
      k,
      lower,
      upper  : integer;
      w,
      sch    : TSTRING_String;

   BEGIN
      connected := true;
      WHILE ch = ' ' DO BEGIN
         if endoffile then goto 99;
         connected := false;
         getch; 
      END;
      IF ch IN ['a'..'z','A'..'Z','0'..'9','''','¿'..'ý'] THEN 
         BEGIN
         IF ch='''' THEN quote:=true ELSE quote:=false;
         k := 0; TSTRING_ConstantEmpty(wrd);
         IF not(quote) THEN
   	   BEGIN
           REPEAT
           IF k < MAXLENGTH THEN 
               BEGIN
               TSTRING_ConstantChar(sch, ch);
               TSTRING_Concat(wrd, wrd, sch);
               k := k+1
               END;
           getch
           UNTIL NOT (ch in ['a'..'z','A'..'Z','0'..'9','''','¿'..'ý','_']);
           END
         ELSE
   	   BEGIN
           getch;
           REPEAT
           IF k < MAXLENGTH THEN 
               BEGIN
               TSTRING_ConstantChar(sch, ch);
               TSTRING_Concat(wrd, wrd, sch);
               k := k+1
               END;
           getch
           UNTIL (ord(ch)<=32);
           END;
  
         lower := 1; upper := DOMCOMLANGSPEC_Nrow;
         REPEAT
            k := (lower+upper) DIV 2; DOMCOMLANGSPEC_Word(k, w);
            IF wrd <= w THEN upper := k-1;
            IF wrd >= w THEN lower := k+1;
         UNTIL lower > upper;
         IF ((lower-1 > upper) AND NOT(quote)) 
             THEN sym := DOMCOMLANGSPEC_Wcat(k) 
             ELSE sym := IDENTIFIER;
         END
      ELSE BEGIN
         IF ch = '{' THEN BEGIN
            REPEAT 
               getch
            UNTIL ch = '}'; 
            sym := COMMENT; getch
            END
         ELSE BEGIN
            sym := DOMCOMLANGSPEC_SCAT(ch); 
            TSTRING_ConstantChar(wrd, ch);
            getch
         END
      END
   END {getsym};


BEGIN
   endoffile:=FALSE;
   cc := 0; cl := 0; ll := 0; ch := ' '; result := nil;
   REPEAT
      getsym;
      IF sym <> COMMENT THEN BEGIN
         t := DOMCOMDECL_maketerminal(sym, wrd);
         t^.cl := cl;
         t^.connected := connected;
         DOMCOMDECL_Addconnectionnode(result, t)
      END
   UNTIL endoffile;

99:
   DOMCOMSCANNER_body := result


END {DOMCOMSCANNER_body};

