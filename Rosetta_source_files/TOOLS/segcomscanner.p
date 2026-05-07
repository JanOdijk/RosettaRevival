(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : SEGCOMSCANNER 
 *  Creation date   :                                               
 *  Author          : Joep Rous
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  12-11-87: Joep Rous: The characters "µ" and "¢" will
 *                                          also be accepted in matchstrings
 *                     on behalf of phonetical dutch.
 *
 *EMP:::===================================================================*)

Export(SEGCOMSCANNER);
pragma C_include('segcomdecl.pf');
pragma C_include('segcomlangspec.pf');
pragma C_include('string.pf');
pragma C_include('segcomscanner.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM  SEGCOMSCANNER;
WITH SEGCOMDECL, SEGCOMLANGSPEC, STRNG;

CONST
   MAXLENGTH = 30;

FUNCTION SEGCOMSCANNER_Body(VAR inf: text) : SEGCOMDECL_pconnectionnode; 

LABEL 99;

CONST TAB = 9;

VAR
   stop,quote:boolean;
   ch  : char;
   endoffile : boolean;
   sym : SEGCOMLANGSPEC_Category;
   connected : boolean;
   wrd : STRING_String;
   cc,
   cl,
   ll  : integer;
   line: ARRAY[1..250] OF CHAR;
   t   : SEGCOMDECL_pSnode;
   result: SEGCOMDECL_pconnectionnode;

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
      sch    : STRING_String;

   BEGIN
      connected := true;
      WHILE ch = ' ' DO BEGIN
         if endoffile then goto 99;
         connected := false;
         getch; 
      END;
      IF ch IN ['a'..'z','A'..'Z','0'..'9','.','''','¿'..'ý', '#', '_', '-',
                '¢', 'µ'] { These characters have been added on behalf of }
                          { phonetic dutch } THEN 
         BEGIN
         {IF ch='''' THEN quote:=true ELSE} quote:=false;
         k := 0; STRING_ConstantEmpty(wrd);
         IF not(quote) THEN
   	   BEGIN
           REPEAT
           IF k < MAXLENGTH THEN 
               BEGIN
               IF ch = '_' THEN STRING_ConstantChar(sch, ' ')
               ELSE STRING_ConstantChar(sch, ch);
               STRING_Concat(wrd, wrd, sch);
               k := k+1
               END;
           getch
           UNTIL NOT (ch in ['a'..'z','A'..'Z','0'..'9','''','¿'..'ý','_','-','#',
                             '¢', 'µ'])
           END
         ELSE
   	   BEGIN
           getch;
           REPEAT
           IF k < MAXLENGTH THEN 
               BEGIN
               STRING_ConstantChar(sch, ch);
               STRING_Concat(wrd, wrd, sch);
               k := k+1
               END;
           getch
           UNTIL (ord(ch)<=32);
           END;
  
         lower := 1; upper := SEGCOMLANGSPEC_Nrow;
         REPEAT
            k := (lower+upper) DIV 2; SEGCOMLANGSPEC_Word(k, w);
            IF wrd <= w THEN upper := k-1;
            IF wrd >= w THEN lower := k+1;
         UNTIL lower > upper;
         IF ((lower-1 > upper) AND NOT(quote)) 
             THEN sym := SEGCOMLANGSPEC_Wcat(k) 
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
            sym := SEGCOMLANGSPEC_SCAT(ch); 
            STRING_ConstantChar(wrd, ch);
            getch
         END
      END
   END {getsym};


BEGIN

   cc := 0; cl := 0; ll := 0; ch := ' '; result := nil;
   REPEAT
      getsym;
      IF sym <> COMMENT THEN BEGIN
         t := SEGCOMDECL_maketerminal(sym, wrd);
         t^.cl := cl;
         t^.connected := connected;
         SEGCOMDECL_Addconnectionnode(result, t)
      END
   UNTIL endoffile;

99:
   SEGCOMSCANNER_body := result


END {SEGCOMSCANNER_body};

