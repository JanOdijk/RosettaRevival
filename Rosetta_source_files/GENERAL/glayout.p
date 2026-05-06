(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : GLAYOUT
 *  Creation date   : 
 *  Author          : J. Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

pragma C_include('strings.pf');
Export(GLAYOUT);
pragma C_include('globdef.pf');
pragma C_include('globbuf.pf');
pragma C_include('string.pf');
pragma C_include('str.pf');
pragma C_include('wnd.pf');
pragma C_include('interface8.pf');
pragma C_include('interface1.pf');
pragma C_include('interfaces.pf');
pragma C_include('debug.pf');
pragma C_include('alayout.pf');
pragma C_include('glayout.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM GLAYOUT;
WITH GLOBDEF, GLOBBUF, STRNG, STR, WND, INTERFACE8, INTERFACE1, INTERFACES,
     DEBUG, STRINGS, ALAYOUT;

CONST
   WindowWidth  = ALAYOUT_WindowWidth;
   WindowLength = ALAYOUT_WindowLength;
   CR           = 13;
   ESC          = 27;
TYPE
   OutputBuffer  = ARRAY[1..WindowLength] OF ARRAY [1..WindowWidth] OF CHAR;
   pOutputBuffer = Loopholes.Address(OutputBuffer);
VAR
   OutBuffer     : pOutputBuffer;
   BatchCursor   : RECORD
                      X, Y: INTEGER
                   END;
   Indicator     : INTEGER;

PROCEDURE GLAYOUT_BatchInit;
VAR  
   DumAddr : Loopholes.Address;
BEGIN
   GlobBuf_CreateBuffer('OutputWindow',LoopHoles.SIZEof(OutputBuffer), DumAddr);
   OutBuffer := LoopHoles.Retype(DumAddr,pOutputBuffer);
   BatchCursor.X := 1;
   BatchCursor.Y := 1;
END {GLAYOUT_BatchInit};


PROCEDURE BatchWriteChar(ch: CHAR);
BEGIN
   IF GlobDef_GetBatchMode THEN BEGIN
      OutBuffer^[BatchCursor.X][BatchCursor.Y] := ch;
      BatchCursor.Y := BatchCursor.Y+1;
   END
END {BatchWriteChar};


PROCEDURE BatchWriteString(str: String_String);
VAR
   j : INTEGER;
   ch: CHAR;
BEGIN
   IF GlobDef_GetBatchMode THEN BEGIN
      FOR j:= 1 TO String_Length(str) DO BEGIN
         String_ExtractChar(ch, str, j);
         BatchWriteChar(ch) 
      END;
   END
END {BatchWriteString};


PROCEDURE BatchWriteStr(CONST str: STRING);
VAR
   j : INTEGER;
BEGIN
   IF GlobDef_GetBatchMode THEN BEGIN
      FOR j:= 1 TO length(str) DO BEGIN
         BatchWriteChar(str[j]) 
      END;
   END
END {BatchWriteStr};


PROCEDURE BatchWriteLine;
BEGIN
   IF GlobDef_GetBatchMode THEN BEGIN
      OutBuffer^[BatchCursor.X][BatchCursor.Y] := chr(CR);
      BatchCursor.X := BatchCursor.X+1;
      BatchCursor.Y := 1;
   END
END {BatchWriteLine};


PROCEDURE BatchInitCursor;
BEGIN
   IF GlobDef_GetBatchMode THEN BEGIN
      BatchCursor.X := 1;
      BatchCursor.Y := 1;
   END
END {BatchInitCursor};


PROCEDURE GLAYOUT_init;
BEGIN
   Indicator := 1;
   IF NOT GlobDef_GetBatchMode THEN BEGIN
      WND_Clear(X_mw_output_area);
   END
END;


PROCEDURE GLAYOUT_exit;
BEGIN
   BatchCursor.X := 1;
   BatchCursor.Y := 1;
   IF NOT GlobDef_GetBatchMode THEN BEGIN
      WND_Clear(X_mw_output_area);
   END
END;


PROCEDURE GLAYOUT_SetIndicator(i: INTEGER);
BEGIN
   Indicator := i
END {GLAYOUT_SetIndicator};


PROCEDURE PreInitMark(w, trailer: INTERFACE8_pSeqWords);
VAR
   nw : INTERFACE8_pSeqWords;
BEGIN
   nw := w; 
   REPEAT
      nw^.marker := TRUE; nw := nw^.nxt
   UNTIL nw = trailer;
END {PreInitMark};


PROCEDURE InitMark(s: INTERFACE1_SetOfWordAmbidType;
                   w, trailer: INTERFACE8_pSeqWords; VAR marked: BOOLEAN);
VAR
   nw       : INTERFACE8_pSeqWords;
   EofChain : BOOLEAN;
BEGIN
   DEBUG_WriteStr('->InitMark',Debug_MaxIO,0,TRUE);
   IF 1 in s THEN  DEBUG_WriteStr(' 1 ',Debug_MaxIO,0,TRUE);
   IF 2 in s THEN  DEBUG_WriteStr(' 2 ',Debug_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
   IF w <> trailer THEN BEGIN
      nw := w; EofChain := FALSE;
      nw^.marker := FALSE;
      WHILE ( NOT EofChain ) AND ( NOT marked ) DO BEGIN
         DEBUG_WriteInteger(nw^.ambid, 5, TRUE);
         Debug_WriteLine(TRUE);
         IF NOT ( nw^.ambid in s ) THEN BEGIN
            InitMark(nw^.nonsucc, nw^.rn, trailer, marked);
            END
         ELSE BEGIN
            DEBUG_WriteStr('is not allowed as a successor',Debug_MaxIO,0,TRUE);
            Debug_WriteLine(TRUE);
         END;
         IF marked THEN nw^.marker := TRUE;
         IF nw^.nxtamb = NIL THEN EofChain := TRUE ELSE nw := nw^.nxtamb
      END
      END
   ELSE BEGIN
      marked := TRUE
   END;
   DEBUG_WriteStr('<-InitMark',Debug_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
END {InitMark};


FUNCTION CheckMarkCC(s: INTERFACE1_SetOfWordAmbidType;
                     w, trailer: INTERFACE8_pSeqWords): BOOLEAN;
VAR
   nw : INTERFACE8_pSeqWords;
BEGIN
   IF w <> trailer THEN BEGIN
      nw := w;
      WHILE ( NOT nw^.marker ) DO BEGIN
         nw := nw^.nxtamb
      END;   
      CheckMarkCC := NOT (nw^.ambid in s)
      END
   ELSE CheckMarkCC := TRUE
END {CheckMarkCC};


PROCEDURE Mark(s: INTERFACE1_SetOfWordAmbidType;
               w, trailer: INTERFACE8_pSeqWords; VAR marked: BOOLEAN);
VAR
   onw, nw: INTERFACE8_pSeqWords;
BEGIN
   DEBUG_WriteStr('->Mark',Debug_MaxIO,0,TRUE);
   IF 1 in s THEN  DEBUG_WriteStr(' 1 ',Debug_MaxIO,0,TRUE);
   IF 2 in s THEN  DEBUG_WriteStr(' 2 ',Debug_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   IF w <> trailer THEN BEGIN
      nw := w;
      WHILE ( NOT nw^.marker ) DO BEGIN
         nw := nw^.nxtamb
      END;   
   
      DEBUG_WriteStr('current Mark: ',Debug_MaxIO,0,TRUE);
      DEBUG_WriteInteger(nw^.ambid, 5, TRUE);
      Debug_WriteLine(TRUE);

      Mark(nw^.nonsucc, nw^.rn, trailer, marked);

      (*-------------------------------------------------------------------*
       * If no mark has been set, try to find next node in the chain that
       * is suited for marking.
       *-------------------------------------------------------------------*)

      onw := nw;
      IF ( NOT marked ) and ( nw^.nxtamb <> NIL ) THEN BEGIN
         DEBUG_WriteStr('Looking for next possible mark: ',Debug_MaxIO,0,TRUE);
         Debug_WriteLine(TRUE);

         REPEAT
            nw := nw^.nxtamb;
         UNTIL ( nw^.nxtamb = NIL ) OR  
               ( NOT ( nw^.ambid in s ) AND
                 CheckMarkCC(nw^.nonsucc, nw^.rn, trailer)) ;

         DEBUG_WriteStr('found possible Mark at: ',Debug_MaxIO,0,TRUE);
         DEBUG_WriteInteger(nw^.ambid, 5, TRUE);
         Debug_WriteLine(TRUE);


         IF NOT ( nw^.ambid in s ) AND
            CheckMarkCC(nw^.nonsucc, nw^.rn, trailer) THEN BEGIN
            onw^.marker := FALSE;
            nw^.marker := TRUE;
            marked := TRUE;
         END
      END;

      (*-------------------------------------------------------------------*
       * If still no mark set, set the mark on the first node in the chain.
       * Variable "marked" is not set to TRUE !!!
       *-------------------------------------------------------------------*)

      IF ( NOT marked ) THEN BEGIN
         nw := w;
         WHILE ( nw^.nxtamb <> NIL ) AND (( nw^.ambid in s ) 
            OR NOT CheckMarkCC(nw^.nonsucc, nw^.rn, trailer)) DO BEGIN
            nw := nw^.nxtamb;
         END;
         IF NOT ( nw^.ambid in s ) AND
            CheckMarkCC(nw^.nonsucc, nw^.rn, trailer) THEN BEGIN
            onw^.marker := FALSE;
            nw^.marker := TRUE;
         END
      END;
   END;
   DEBUG_WriteStr('<-Mark',Debug_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
END {Mark};


PROCEDURE WriteText(sline: STRING_String);
VAR 
   len: INTEGER;
   k, ok, nk: CHAR;
   c : INTEGER;
   line : String_String;
BEGIN
   len := String_Length(sline); String_Constantempty(line);
   c := 0; k := ' ';
   WHILE c <> len DO BEGIN
      c := c+1;
      ok := k;
      k := sline[c];
      IF c = len THEN nk := ' ' ELSE nk := sline[c+1];
      IF (k = ' ') AND (nk in ['.','?','!','¿','¡']) THEN BEGIN
         END
      ELSE IF (k=' ') AND (nk='/') THEN BEGIN
         END
      ELSE IF (k=' ') AND (ok='/') THEN BEGIN
         END
      ELSE String_AppendChar(line, line, k)
   END;
   WND_WriteString(X_mw_output_area, line, 0, TRUE)
END {WriteText};


PROCEDURE WriteToScreen(w, trailer: INTERFACE8_pSeqWords;
                        line: STRING_String;
                        col: INTEGER);
VAR
   nw            : INTERFACE8_pSeqWords;
BEGIN
   IF w <> trailer THEN BEGIN
      nw := w;
      WHILE NOT nw^.marker DO BEGIN
         nw := nw^.nxtamb
      END;
      IF (col + String_Length(nw^.word) + 1) > WindowWidth THEN BEGIN
         IF NOT GlobDef_GetBatchMode THEN BEGIN
            WriteText(line);
            String_ConstantEmpty(line);
            WND_WriteLine(X_mw_output_area, TRUE);
            WND_WriteString(X_mw_output_area, '    ', 4, TRUE);
         END;
         col := 5;
         BatchWriteLine;
         BatchWriteChar(' ');
         BatchWriteChar(' ');
         BatchWriteChar(' ');
         BatchWriteChar(' ');
      END;

      IF NOT GlobDef_GetBatchMode THEN BEGIN
{
         WND_WriteString(X_mw_output_area, nw^.word, 0, TRUE);
         WND_WriteChar(X_mw_output_area, ' ');
}
         String_Append(line, nw^.word);
         String_AppendChar(line, line, ' ');
      END;
      BatchWriteString(nw^.word);
      BatchWriteChar(' ');

      WriteToScreen(w^.rn, trailer, line, (col + String_Length(nw^.word) + 1) );
      END
   ELSE BEGIN
      IF NOT GlobDef_GetBatchMode THEN BEGIN
         WriteText(line);
         WND_WriteLine(X_mw_output_area, TRUE);
      END
   END
END;


PROCEDURE GLAYOUT_NoTranslationFound;
BEGIN
   BatchInitCursor;
   IF NOT GlobDef_GetBatchMode THEN BEGIN
      CASE Indicator OF
      1 : BEGIN
	       WND_WriteString(X_mw_output_area, '~  ', 3, TRUE);
	    END;
      2 : BEGIN
	       WND_WriteString(X_mw_output_area, ' ~ ', 3, TRUE);
	    END;
      3 : BEGIN
	       WND_WriteString(X_mw_output_area, '  ~', 3, TRUE);
	    END
      END;
      WND_WriteChar(X_mw_output_area, ' ');
      WND_WriteString(X_mw_output_area, '!!!!!!No generation found:',
                      26, TRUE);
      WND_WriteLine(X_mw_output_area, TRUE);
   END;
   CASE Indicator OF
   1 : BEGIN
	    BatchWriteChar('~');
	    BatchWriteChar(' ');
	    BatchWriteChar(' ');
	 END;
   2 : BEGIN
	    BatchWriteChar(' ');
	    BatchWriteChar('~');
	    BatchWriteChar(' ');
	 END;
   3 : BEGIN
	    BatchWriteChar(' ');
	    BatchWriteChar(' ');
	    BatchWriteChar('~');
	 END
   END;
   BatchWriteChar(' ');
   BatchWriteStr('!!!!!!No generation found');
   BatchWriteChar(chr(ESC))
END;



PROCEDURE GLAYOUT(ifin: INTERFACES_IfDescr);
VAR
   w            : INTERFACE8_pSeqWords;
   Marked       : BOOLEAN;
   line         : STRING_String;
BEGIN


   w := ifin.if8;
   marked := FALSE;

   IF w <> NIL THEN BEGIN
      PreInitMark(w, w^.prv);
      InitMark([], w, w^.prv, marked);

      BatchInitCursor;

      IF NOT GlobDef_GetBatchMode THEN BEGIN
         IF Not marked THEN BEGIN
   	    WND_WriteString (X_mw_message_text,
                'No Translations for the above input sentence', 46, TRUE);
         END;
      END;

      WHILE marked DO BEGIN
         IF NOT GlobDef_GetBatchMode THEN BEGIN
            CASE Indicator OF
            1 : BEGIN
                     WND_WriteString(X_mw_output_area, '~  ', 3, TRUE);
                  END;
            2 : BEGIN
                     WND_WriteString(X_mw_output_area, ' ~ ', 3, TRUE);
                  END;
            3 : BEGIN
                     WND_WriteString(X_mw_output_area, '  ~', 3, TRUE);
                  END
            END;
            WND_WriteChar(X_mw_output_area, ' ');
         END;
         CASE Indicator OF
         1 : BEGIN
                  BatchWriteChar('~');
                  BatchWriteChar(' ');
                  BatchWriteChar(' ');
               END;
         2 : BEGIN
                  BatchWriteChar(' ');
                  BatchWriteChar('~');
                  BatchWriteChar(' ');
               END;
         3 : BEGIN
                  BatchWriteChar(' ');
                  BatchWriteChar(' ');
                  BatchWriteChar('~');
               END
         END;
         BatchWriteChar(' ');

         String_ConstantEmpty(line);
	 WriteToScreen(w, w^.prv, line, 5);
	 marked := FALSE;
	 Mark([], w, w^.prv, marked);
         IF marked THEN BEGIN
            GLAYOUT_SetIndicator(3);
            BatchWriteLine;
         END
      END;
      BatchWriteChar(chr(ESC))

      END
   ELSE BEGIN
      DEBUG_WriteStr('No input for GLAYOUT',Debug_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
   END;
END {GLAYOUT};

