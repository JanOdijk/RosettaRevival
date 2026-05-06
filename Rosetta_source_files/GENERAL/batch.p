(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Batch
 *  Creation date   :  16-DEC-1988
 *  Author          : 
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(BATCH);
pragma C_include('files.pf');
pragma C_include('globbuf.pf');
pragma C_include('alayout.pf');
pragma C_include('batch.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM Batch;
WITH FILES, GLOBBUF, ALAYOUT;

CONST
   AWindowWidth  = ALAYOUT_WindowWidth;
   AWindowLength = ALAYOUT_WindowLength;
   GWindowWidth  = ALAYOUT_WindowWidth;
   GWindowLength = ALAYOUT_WindowLength;
   ESC           = 27;
   CR            = 13;

TYPE
   InputBuffer  = ARRAY[1..AWindowLength] OF ARRAY [1..AWindowWidth] OF CHAR;
   OutputBuffer = ARRAY[1..GWindowLength] OF ARRAY [1..GWindowWidth] OF CHAR;
   pInputBuffer = Loopholes.Address(InputBuffer);
   pOutputBuffer= Loopholes.Address(OutputBuffer);

VAR
   InBuffer     : pInputBuffer;
   OutBuffer    : pOutputBuffer;
   InputFile    : Files_Text;
   OutputFile   : Files_Text;
   InCursor,
   OutCursor    : RECORD
                     X, Y: INTEGER
                  END;
   chIn         : CHAR;
   ccIn         : INTEGER;
   llIn         : FILES_IORange;
   lineIn       : STRING(120);
   EoLnIn       : BOOLEAN;
   EofIn        : BOOLEAN;

   Indicator    : CHAR;

PROCEDURE ResetInCursor;  BEGIN WITH InCursor  DO BEGIN X:=1;Y:=1 END END;
PROCEDURE ResetOutCursor; BEGIN WITH OutCursor DO BEGIN X:=1;Y:=1 END END;


PROCEDURE GetChIn;
BEGIN
   IF ccIn = llIn THEN BEGIN
      IF FILES_EndOfFile(InputFile) THEN BEGIN
         EofIn := TRUE
         END
      ELSE BEGIN
         EoLnIn := TRUE;
         llIn := 119; ccIn := 0;
         Files_ReadToEndOfLine(InputFile, lineIn, llIn);
         FILES_SkipLine(InputFile);
         llIn := llIn+1; lineIn[llIn] := ' ';
      END
      END
   ELSE EoLnIn := FALSE;
   IF NOT EofIn THEN BEGIN
      ccIn := ccIn+1; chIn := lineIn[ccIn]
   END;
END {GetChIn};


PROCEDURE PutInBuffer(ch: CHAR);
BEGIN
   InBuffer^[Incursor.X][InCursor.Y] := ch;
   IF InCursor.Y = AWindowWidth THEN BEGIN
      IF InCursor.X < AWindowLength THEN BEGIN
         InCursor.X := InCursor.X+1;
         InCursor.Y := 1;
	 END
      ELSE BEGIN
         FILES_WriteStr(Outputfile, 'Input Sentence too long', 
                        Files_MaxIO, 0, TRUE);
      END;
      END
   ELSE BEGIN
      InCursor.Y := InCursor.Y+1;
   END;
END {PutInBuffer};


PROCEDURE GetOutBuffer(VAR ch: CHAR);
BEGIN

   (*----------------------------------------------------------------------*
    * Reading from the output buffer is control character driven.
    *----------------------------------------------------------------------*)

   ch := OutBuffer^[OutCursor.X][OutCursor.Y];
   IF ch = CHR(CR) THEN BEGIN
      OutCursor.X := OutCursor.X+1;
      OutCursor.Y := 1;
      END
   ELSE IF ch = CHR(ESC) THEN BEGIN
      END
   ELSE OutCursor.Y := OutCursor.Y+1;
END {GetOutBuffer};


PROCEDURE Batch_PrepareBatchMode(Batch: BOOLEAN);
VAR  
   DumAddr : Loopholes.Address;
BEGIN
   IF Batch THEN BEGIN

      GlobBuf_CreateBuffer('InputWindow', Loopholes.SIZEof(InputBuffer), DumAddr);
      InBuffer := Loopholes.Retype(DumAddr, pInputBuffer);
      GlobBuf_CreateBuffer('OutputWindow', Loopholes.SIZEof(OutputBuffer), DumAddr);
      OutBuffer := Loopholes.Retype(DumAddr, pOutputBuffer);

      FILES_Open(InputFile, 'inputfile', 9, 0);
      FILES_Open(OutPutFile, 'outputfile', 10, 3);

      ResetInCursor;
      ResetOutCursor;
      OutBuffer^[OutCursor.X][OutCursor.Y] := CHR(ESC);

      ccIn := 0; llIn := 0; EolnIn := FALSE; chIn := ' ';
      EofIn := FALSE;
      WHILE NOT ((chIn = '[') OR EofIn) DO BEGIN
         GetChIn;
      END;
   END;
END {Batch_PrepareBatchMode};



PROCEDURE Batch_PrepareInputBuffer(Batch: BOOLEAN);
VAR i,j: INTEGER;
BEGIN {Batch_PrepareInputBuffer}
   IF Batch THEN BEGIN
      (*-------------------------------------------------------------------*
       * Character pointer at square bracket which indicates inputsentence
       *-------------------------------------------------------------------*)

      IF NOT EofIn THEN BEGIN
         Files_WriteChar(OutputFile, chIn);
         GetChIn;
      END;

      WHILE NOT ((chIn = ']') OR EofIn) DO BEGIN
         PutInBuffer(chIn);
         IF EoLnIn THEN BEGIN
            Files_WriteLine(OutputFile, TRUE);
         END;
         Files_WriteChar(OutputFile, chIn);
         GetChIn;
      END;

      IF chIn = ']' THEN Files_WriteChar(OutputFile, chIn);
      Files_WriteLine(OutputFile, TRUE);

      WHILE NOT ((chIn = '[') OR EofIn) DO BEGIN
         GetChIn;
      END;

      PutInBuffer(CHR(ESC));
      ResetInCursor;
{
      FOR i := 1 TO AWindowLength DO BEGIN
         FOR j := 1 TO AWindowWidth DO BEGIN
            write(InBuffer^[i][j]);
         END;
         writeln;
      END;
}
   END;
END {Batch_PrepareInputBuffer};



PROCEDURE Batch_EvalOutputBuffer(Batch: BOOLEAN);
VAR
   chOut: CHAR;
   OutputGenerated : BOOLEAN;
BEGIN {Batch_EvalOutputBuffer}
   IF Batch THEN BEGIN
      GetOutBuffer(chOut);
      OutputGenerated := FALSE;
      WHILE NOT (chOut = CHR(ESC)) DO BEGIN
         OutputGenerated := TRUE;
         IF chOut = CHR(CR) 
         THEN Files_WriteLine(OutputFile, TRUE)
         ELSE Files_WriteChar(OutputFile, chOut);
         GetOutBuffer(chOut)
      END;
      ResetOutCursor;
      OutBuffer^[OutCursor.X][OutCursor.Y] := CHR(ESC);
      IF NOT OutputGenerated THEN
         FILES_WriteStr(OutputFile, 'No generation found!!!!!!!!', FILES_MaxIO, 0, TRUE);
      Files_WriteLine(OutputFile, TRUE)
   END;
END {Batch_EvalOutputBuffer};


FUNCTION Batch_StillInput(Batch: BOOLEAN): BOOLEAN;
BEGIN
   IF Batch THEN BEGIN
      Batch_StillInput := NOT EofIn
      END
   ELSE Batch_StillInput := TRUE;
END {Batch_StillInput};


PROCEDURE Batch_BeginOutput(Batch: BOOLEAN);
BEGIN {Batch_BeginOutput}
   IF Batch THEN BEGIN
      FILES_WriteChar(OutputFile, '{');
      Files_WriteLine(OutputFile, TRUE);
      OutBuffer^[Outcursor.X][OutCursor.Y] := CHR(ESC);
   END;
END {Batch_BeginOutput};


PROCEDURE Batch_EndOutput(Batch: BOOLEAN);
BEGIN {Batch_EndOutput}
   IF Batch THEN BEGIN
      FILES_WriteChar(OutputFile, '}');
      Files_WriteLine(OutputFile, TRUE);
      Files_WriteLine(OutputFile, TRUE);
   END;
END {Batch_EndOutput};


PROCEDURE Batch_IncorrectAnalysis(Batch: BOOLEAN);
BEGIN {Batch_EndOutput}
   IF Batch THEN BEGIN
      FILES_WriteChar(OutputFile, '{');
      FILES_WriteStr(OutputFile, 'No analysis found !!!!!!!!', FILES_MaxIO, 0, TRUE);
      FILES_WriteChar(OutputFile, '}');
      Files_WriteLine(OutputFile, TRUE);
      Files_WriteLine(OutputFile, TRUE);
   END;
END {Batch_IncorrectAnalysis};


PROCEDURE Batch_AnalysisCrash(Batch: BOOLEAN);
BEGIN {Batch_AnalysisCrash}
   IF Batch THEN BEGIN
      Files_WriteLine(OutputFile, TRUE);
      FILES_WriteChar(OutputFile, '{');
      FILES_WriteStr(OutputFile, 'Analysis crashed !!!!!!!!', FILES_MaxIO, 0, TRUE);
      FILES_WriteChar(OutputFile, '}');
      Files_WriteLine(OutputFile, TRUE);
      Files_WriteLine(OutputFile, TRUE);
   END;
END {Batch_AnalysisCrash};


PROCEDURE Batch_GenerationCrash(Batch: BOOLEAN);
BEGIN {Batch_GenerationCrash}
   IF Batch THEN BEGIN
      Files_WriteLine(OutputFile, TRUE);
      FILES_WriteChar(OutputFile, '{');
      FILES_WriteStr(OutputFile, 'Generation crashed !!!!!!!', FILES_MaxIO, 0, TRUE);
      FILES_WriteChar(OutputFile, '}');
      Files_WriteLine(OutputFile, TRUE);
      Files_WriteLine(OutputFile, TRUE);
   END;
END {Batch_GenerationCrash};


PROCEDURE Batch_SetIndicator(ch: CHAR);
BEGIN
   Indicator := ch
END {Batch_SetIndicator};


FUNCTION Batch_GetIndicator: CHAR;
BEGIN
   Batch_GetIndicator := Indicator
END {Batch_GetIndicator};

