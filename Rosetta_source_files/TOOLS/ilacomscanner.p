
(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : ilacomSCANNER 
 *  Creation date   : 6-1-87                                              
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export (ilacomscanner);
pragma C_include ('tstring.pf');
pragma C_include ('ilacomlangspec.pf');
pragma C_include ('ilacomdecl.pf');
pragma C_include ('ilacomscanner.pf');

PROGRAM ilacomSCANNER;

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

WITH ilacomLANGSPEC,
     ilacomDECL,
     TSTRING;


CONST
   MAXLENGTH = 31;

FUNCTION ilacomSCANNER_Body(VAR inf: text) : ilacomDECL_pconnectionnode; 

LABEL 99;

CONST TAB = 9;

VAR
   stop: boolean;
   ch  : char;
   endoffile : boolean;
   sym : ilacomLANGSPEC_Category;
   connected : boolean;
   wrd : TSTRING_String;
   cc,
   cl,
   ll  : integer;
   line: ARRAY[1..155] OF CHAR;
   t   : ilacomDECL_pSnode;
   result: ilacomDECL_pconnectionnode;

   PROCEDURE error;

   BEGIN
      result := nil; GOTO 99
   END;


   PROCEDURE getch;

   BEGIN
   IF cc = ll THEN 
         BEGIN
         IF EOF(inf) THEN 
            BEGIN
            {WRITELN('FILE INCOMPLETE'); error;} stop:=true
            END 
         else stop:=false;
         ll := 0; cc := 0; cl := cl+1; endoffile := false;
         WHILE not (EOLN(inf) or stop) DO 
            BEGIN
            ll := ll+1; read(inf, ch); 
            IF ord(ch) = TAB THEN line[ll]:=' ' ELSE line[ll]:=ch
            END;
         ll := ll+1; read(inf, line[ll])
         END;
   IF not stop THEN BEGIN cc := cc+1; 
                             ch := line[cc] 
                    END
   ELSE BEGIN ch:=' '; 
                 endoffile := true 
        END;

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
   WHILE ch = ' ' DO 
         BEGIN
         if endoffile then goto 99;
         connected := false;
         getch;
         END;
   IF ch IN ilacomLANGSPEC_scanchars THEN BEGIN
         k := 0; TSTRING_ConstantEmpty(wrd);
         REPEAT
            IF k < MAXLENGTH THEN 
               BEGIN
               TSTRING_ConstantChar(sch, ch);
               TSTRING_Concat(wrd, wrd, sch);
               k := k+1
               END;
            getch
         UNTIL NOT (ch in ilacomLANGSPEC_scanchars);
  
         lower := 1; upper := ilacomLANGSPEC_Nrow;
         REPEAT
            k := (lower+upper) DIV 2; ilacomLANGSPEC_Word(k, w);
            IF wrd <= w THEN upper := k-1;
            IF wrd >= w THEN lower := k+1;
         UNTIL lower > upper;
         IF lower-1 > upper THEN sym := ilacomLANGSPEC_Wcat(k) ELSE 
                                                        sym := IDENTIFIER;
         END
      ELSE BEGIN
         IF false {..} THEN BEGIN
            REPEAT 
               getch
            UNTIL ch = '}'; 
            sym := COMMENT; getch
            END
         ELSE 
         BEGIN
         IF ch = '&' THEN 
            BEGIN
            REPEAT 
               IF endoffile then 
                  begin
                  writeln('end of file reached, please add ''%%''');
                  goto 99
                  end;
               getch
            UNTIL ch = '%'; 
            sym := COMMENT; getch
            END
         ELSE 
         IF ch = '?' THEN 
            BEGIN
            REPEAT 
               getch
            UNTIL ch = '?'; 
            sym := COMMENT; getch
            END
         ELSE 
            BEGIN
            IF ch = '(' THEN
   		BEGIN
                getch;
                IF ch = '*' THEN
   		    BEGIN
                    WHILE ch<>')' DO
                      BEGIN
                      REPEAT
                      IF endoffile then 
                       begin
                       writeln('end of file reached, please add ''*)''');
                       goto 99
                       end;
                       getch UNTIL ch = '*';
                       getch;
                       END;
                    sym:=COMMENT; getch
   	            END
                ELSE BEGIN
                     sym := ilacomLANGSPEC_SCAT('('); 
                     TSTRING_ConstantChar(wrd,'(')
                     END
   		END
            ELSE IF ch<>'!' THEN BEGIN
                 sym := ilacomLANGSPEC_SCAT(ch); 
                 TSTRING_ConstantChar(wrd, ch);
                 getch
                 END;
            IF ch = '!' THEN
              BEGIN
              getch;
              IF ch='(' THEN
   		BEGIN
                getch;
                IF ch = '*' THEN
   		    BEGIN
                    WHILE ch<>')' DO
                      BEGIN
                      REPEAT
                      IF endoffile then 
                       begin
                       writeln('end of file reached, please add ''*)''');
                       goto 99
                       end;
                       getch UNTIL ch = '*';
                       getch;
                       END;
                    sym:=COMMENT; getch
   	            END
   		END
              END
            END
         END
      END
   END {getsym};


BEGIN
   endoffile:=FALSE;
   cc := 0; cl := 0; ll := 0; ch := ' '; result := nil;
   REPEAT
      getsym;
      IF sym <> COMMENT THEN BEGIN
         t := ilacomDECL_maketerminal(sym, wrd);
         t^.cl := cl;
         t^.connected := connected;
         ilacomDECL_Addconnectionnode(result, t)
      END
   UNTIL endoffile;

99:
   ilacomSCANNER_body := result


END {ilacomSCANNER_body};

