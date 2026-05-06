(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : ALAYOUT
 *  Creation date   :  11-NOV-1986
 *  Author          : 
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

pragma C_include('strings.pf');
Export(ALAYOUT);
pragma C_include('globbuf.pf');
pragma C_include('globdef.pf');
pragma C_include('string.pf');
pragma C_include('str.pf');
pragma C_include('wnd.pf');
pragma C_include('interface0.pf');
pragma C_include('interfaces.pf');
pragma C_include('debug.pf');
pragma C_include('alayout.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM ALAYOUT;
WITH GLOBBUF, GLOBDEF, STRNG, STR, WND, INTERFACE0, INTERFACES,
     DEBUG, STRINGS;

CONST
   WindowWidth  = ALAYOUT_WindowWidth;
   WindowLength = ALAYOUT_WindowLength;
   ESC          = 27;
   SEP          = 168;
   inpwind      = X_mw_input_area;

TYPE
   CursorType   = RECORD
                     X : INTEGER;
                     Y : INTEGER;
                  END;
   InputBuffer  = ARRAY[1..WindowLength] OF ARRAY [1..WindowWidth] OF CHAR;
   pInputBuffer = Loopholes.Address(InputBuffer);

VAR 
   ReadCursor  : CursorType;
   CurrentChar : CHAR;
   EndOfInputWindow: BOOLEAN;
   rownr           : INTEGER;
   originalcc,
   cc              : INTEGER;
   line            : String_String;
   InBuffer        : pInputBuffer;


PROCEDURE ALAYOUT_BatchInit;
VAR  
   DumAddr : Loopholes.Address;
BEGIN
   GlobBuf_CreateBuffer('InputWindow', LoopHoles.SIZEof(InputBuffer), DumAddr);

   InBuffer := Loopholes.Retype(DumAddr, pInputBuffer);
END {ALAYOUT_BatchInit};


PROCEDURE ALAYOUT_init;
BEGIN

END;


PROCEDURE ALAYOUT_exit;
BEGIN
   IF NOT GlobDef_GetBatchMode THEN BEGIN
      WND_Clear(inpwind);
   END
END;


PROCEDURE InitInputWindow;
BEGIN
   EndOfInputWindow := FALSE;
   originalcc := WindowWidth+1;
   cc := WindowWidth+1;
   CurrentChar := ' ';
   rownr := 0
END;


PROCEDURE ReadLine(VAR line: String_String;
                   rownr   : INTEGER);
VAR
   lc,c : INTEGER;
   sline: String_String;
   k,ok,nk: CHAR;
   len:INTEGER;
   seps : SET OF CHAR;
BEGIN
   IF GlobDef_GetBatchMode THEN BEGIN
      String_ConstantEmpty(sline);
      FOR c := 1 TO WindowWidth DO String_AppendChar(sline, sline, 
                                                     InBuffer^[rownr][c])
      END
   ELSE BEGIN
      WND_ReadString (X_mw_input_area, sline, rownr);
      If Not WND_Done Then Begin
         EndOfInputWindow := True;
	 sline := '';
      End;
   END;
   seps := [' ','.',',',';','?','¿','!','¡',':'];
   String_ConstantEmpty(line);
   len := String_Length(sline); c := 0; k := ' '; lc := 1;
   WHILE c <> len DO BEGIN
      c := c+1;
      ok := k;      
      k := sline[c];
      IF c = len THEN nk := ' ' ELSE nk := sline[c+1];
      IF (k IN ['-', '"', '(', '{']) AND (ok IN seps) AND (nk<>' ') THEN BEGIN
         String_AppendChar(line, line, sline[c]);
         String_AppendChar(line, line, chr(SEP));
         END
      ELSE IF (k IN ['-', '"', ')', '}']) AND (ok <> ' ') AND (nk IN seps) THEN BEGIN
         String_AppendChar(line, line, chr(SEP));
         String_AppendChar(line, line, sline[c]);
         END
      ELSE IF (k IN ['/','(',')']) AND (ok <> ' ') AND (nk<>' ') THEN BEGIN
         String_AppendChar(line, line, chr(SEP));
         String_AppendChar(line, line, sline[c]);
         String_AppendChar(line, line, chr(SEP));
         END
      ELSE BEGIN
         String_AppendChar(line, line, sline[c]);
      END
   END;
END {ReadLine};


PROCEDURE GetChar;
BEGIN
   IF originalcc > WindowWidth THEN BEGIN
      IF rownr < WindowLength THEN BEGIN
         rownr := rownr+1; cc := 0; originalcc := 0;
         ReadLine(line, rownr);
         cc := cc+1; originalcc := originalcc+1;
         String_ExtractChar(CurrentChar, line, cc);
         END
      ELSE BEGIN
         CurrentChar := ' ';
         EndOfInputWindow := TRUE
      END;
      END
   ELSE BEGIN
      IF CurrentChar<>chr(SEP) THEN originalcc := originalcc+1;
      cc := cc+1; 
      String_ExtractChar(CurrentChar, line, cc);
   END;

   IF CurrentChar = CHR(ESC) THEN BEGIN
      CurrentChar := ' ';
      EndOfInputWindow := TRUE
   END;

   ReadCursor.Y := rownr;
   ReadCursor.X := originalcc
END {GetChar};


PROCEDURE SkipSpaces;
BEGIN
   WHILE  ( CurrentChar in [' ',chr(SEP)] ) and not EndOfInputWindow DO GetChar;
END {SkipSpaces};


PROCEDURE ReadStr(VAR str: STRING;
                  VAR XPos, YPos: INTEGER;
                  VAR len: INTEGER);
BEGIN
   XPos := ReadCursor.X;
   YPos := ReadCursor.Y;
   len  := 0;
   REPEAT
      len      := len + 1;
      str      := str || CurrentChar;
      GetChar;
   UNTIL ( CurrentChar in [' ',chr(SEP)] ) OR EndOfInputWindow;
   SkipSpaces
END {ReadStr};


FUNCTION ALAYOUT : INTERFACES_IfDescr;
VAR
   trailer,
   w,
   nw      : INTERFACE0_pSeqWords;
   str     : STRING_String;
   wrd     : STRING_String;
   len     : integer;
   wrdid   : integer;
   ifout   : INTERFACES_IfDescr;
   XPos,
   YPos    : INTEGER;
   NrWords : INTEGER;

BEGIN
   STRING_ConstantEmpty(wrd);
   trailer := INTERFACE0_MakeSeqWords(wrd, nil);
   trailer^.kind := InputWord;
   trailer^.nxt  := trailer;
   trailer^.prv  := trailer;
   w := trailer;
   wrdid:= 0;

   DEBUG_Open(-1);
   NrWords := 0;
   InitInputWindow;
   REPEAT
      SkipSpaces; str := '';
      ReadStr(str, XPos, YPos, len);
      NrWords := NrWords+1;
      DEBUG_WriteStr(str,0,Debug_MaxIO,TRUE);
      DEBUG_WriteStr('...',0,Debug_MaxIO,TRUE);
      DEBUG_WriteInteger(len, 5, TRUE);
      Debug_WriteLine(TRUE);
      IF ((len = 0) AND (NrWords = 1)) OR
          (len > 0) THEN BEGIN
         STRING_Constant(wrd, str, len);
         nw := INTERFACE0_MakeSeqWords(wrd, nil);
         wrdid        := wrdid + 1;

         nw^.nxt      := trailer;
         nw^.prv      := w;
         nw^.wordid   := wrdid;
         nw^.kind     := InputWord;
         nw^.X        := XPos;
         nw^.Y        := YPos;
         nw^.len      := len;

         w^.nxt       := nw;
         w^.rn        := nw;
         trailer^.prv := nw;
         w := nw;
      END;
   UNTIL EndOfInputWindow;

   w^.rn       := trailer;
   ifout.level := 0;
   ifout.if0   := trailer^.nxt;
   ALAYOUT     := ifout;
   DEBUG_Close(-1);

END {ALAYOUT};


PROCEDURE SetVideoAttr (X, Y, len: INTEGER; attr : WND_VideoAttributes);
VAR
   c, r, rest : INTEGER;
BEGIN
   c := X;
   r := Y;
   rest := len - ( WindowWidth - c + 1);
   WHILE rest > 0 DO BEGIN
      WND_SetVideoAttr (inpwind, r, 1, c, (WindowWidth-c+1), attr);
      r := r+1; c := 1;
      rest := rest - ( WindowWidth - c + 1)
   END;
   IF rest < 0 THEN BEGIN
      WND_SetVideoAttr (inpwind, r, 1, c, (rest + (WindowWidth-c+1)), attr);
   END;
END {SetVideoAttr};



PROCEDURE HighLight(X, Y, len: INTEGER);
BEGIN
   SetVideoAttr (X, Y, len, WND_Reverse)
END {HighLight};



PROCEDURE NormalIntensity(X, Y, len: INTEGER);
BEGIN
   SetVideoAttr (X, Y, len, WND_Normal)
END {NormalIntensity};



PROCEDURE Blink(X, Y, len: INTEGER);
BEGIN
   SetVideoAttr (X, Y, len, WND_Blink)
END {Blink};



PROCEDURE UnBlink(X, Y, len: INTEGER);
BEGIN
   SetVideoAttr (X, Y, len, WND_Normal)
END {UnBlink};



PROCEDURE ALAYOUT_MarkWrongos(w: INTERFACES_IfDescr);
VAR
   nw : INTERFACE0_pSeqWords;
BEGIN
   nw := w.if0;
   WHILE nw <> w.if0^.prv DO BEGIN
      IF ( nw^.error = TRUE ) AND ( nw^.kind = InputWord) THEN BEGIN
         WITH nw^ DO BEGIN
            HighLight(X, Y, len);
         END
      END;
      nw := nw^.nxt
   END;
END {ALAYOUT_MarkWrongos};


PROCEDURE ALAYOUT_MarkRegion(X, Y, len: INTEGER);
BEGIN
   if not Globdef_GetBatchMode then
      HighLight(X, Y, len);
END {ALAYOUT_MarkRegion};


PROCEDURE ALAYOUT_UnMarkRegion(X, Y, len: INTEGER);
BEGIN
   if not Globdef_GetBatchMode then
      NormalIntensity(X, Y, len);
END {ALAYOUT_UnMarkRegion};


PROCEDURE ALAYOUT_BlinkRegion(X, Y, len: INTEGER);
BEGIN
   Blink(X, Y, len);
END {ALAYOUT_BlinkRegion};


PROCEDURE ALAYOUT_UnBlinkRegion(X, Y, len: INTEGER);
BEGIN
   UnBlink(X, Y, len);
END {ALAYOUT_UnBlinkRegion};


PROCEDURE ALAYOUT_GetWord(X   : INTEGER;
                          Y   : INTEGER;
                          len : INTEGER;
                          VAR s   : STRING;
                          VAR l   : INTEGER);
VAR
   i, c, r, rest : INTEGER;
   line       : STRING_String;
   SpaceToggle: BOOLEAN;
   buf        : STRING(WindowWidth+1);
   buflen     : String_Range;
BEGIN
   l := 0;
   c := X;
   r := Y;
   rest := len - ( WindowWidth - c + 1);
   SpaceToggle := FALSE;
   WHILE rest > 0 DO BEGIN
      ReadLine(line, r);      
      STRING_ExtractChars(buf, buflen, line, 1, String_Length(line));
      i := c;
      WHILE (i <= (WindowWidth-c+1)) DO BEGIN
         IF (buf[i] <> ' ') THEN BEGIN
            l := l+1;
            s[l] := buf[i];
            SpaceToggle := FALSE
            END
         ELSE BEGIN
            IF NOT SpaceToggle THEN BEGIN
               l := l+1;
               s[l] := ' ';
               SpaceToggle := TRUE;
            END
         END;
         i := i+1;
      END;
      r := r+1; c := 1;
      rest := rest - ( WindowWidth - c + 1)
   END;

   IF rest < 0 THEN BEGIN
      ReadLine(line, r);      
      STRING_ExtractChars(buf, buflen, line, 1, String_Length(line));
      i := c;
      WHILE (i <= (rest+(WindowWidth-c+1))) DO BEGIN
         IF (buf[i] <> ' ') THEN BEGIN
            l := l+1;
            s[l] := buf[i];
            SpaceToggle := FALSE
            END
         ELSE BEGIN
            IF NOT SpaceToggle THEN BEGIN
               l := l+1;
               s[l] := ' ';
               SpaceToggle := TRUE;
            END
         END;
         i := i+1;
      END;
   END;
END {ALAYOUT_GetWord};
