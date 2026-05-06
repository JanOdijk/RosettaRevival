(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title     : Windows
 *  Creation date    : 29-OCT-1986
 *  Modification date: 01-DEC-1986
 *  Author           : Jeroen Medema
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : Implementation of 'env' file. Read and write routines
 *                    are based on the file implementations of these I/O
 *                    routines.
 *
 *                    16-FEB-1987 Windows_IntegerStatus added for test
 *                    purposes.
 *                    Changed the sequence of the parameters in all the
 *                    draw routines to get a uniform interface.
 *                    Changed the statement    IF i> w.Rows THEN
 *                                     into    IF i> w.Columns THEN
 *                    in the WINDOWS_Column function.
 *                                                   J. Stevens
 *
 *                    16-MAR-1987 WINDOWS_OpenViewPort changed :
 *                    I have exchanged x and y as parameters in the
 *                    procedure-call VMSSMG_PasteVirtualDisplay and in
 *                    WINDOWS_OpenViewPort itself. (Implemenation was
 *                    changed to fit description in windows.env)
 *                                                    J. Stevens
 * 
 *EMP:::===================================================================*)

Export(WINDOWS);

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
pragma C_Include('string.pf');
pragma C_Include('str.pf');
pragma C_Include('windows.pf');


PROGRAM Windows;

CONST DoNotPreserveScreen =   0; {This is OK}
      DoPreserveScreen    =   1;
      ClearScreen         =   0; {This is a guess}
      NoErase             =   0; {idem}
      NormalStatus        =   1; {This is not a guess; it's OK!}
      CharRange           = 255; {idem}
      ApplicationOn       =   1; {idem}
      Forever             =  -1; {idem}

TYPE CharSet = SET OF Char;

VAR Done                        : Boolean;
    InternalKeyboard            : Integer;
    Status                      : Integer;
    PrintableChars, SpecialChars: CharSet;
    HelpWindow                  : Windows_Window;
    View                        : Windows_Viewport;


FUNCTION Windows_Done : BOOLEAN;
BEGIN {Done}
   Windows_Done := Done;
(*   writeln ('Windows_Done'); *)
END {Done};




PROCEDURE Windows_Initialize;
BEGIN {Windows_Initialize}
(*   writeln ('Windows_Initialize'); *)
   Done := TRUE;
   SpecialChars := [chr(Windows_EndOfPageSymbol), chr(Windows_EndOfLineSymbol)];
   PrintableChars := [' '..'~', 'à'..'ý', '¡'..'£', '¥', '§'..'«', '°'..'³', 
                      'µ'..'·', '¹'..'½', '¿'..'Ï', 'Ñ'..'Ý', 'ß'..'ï', 
                      'ñ'..'ý'] + SpecialChars
END {Windows_Initialize};




PROCEDURE Windows_OpenWindow (VAR w  : Windows_Window;
                              CONST name   : STRING;
                              len    : Windows_WindowNameRange;
                              Rows   : Windows_RowRange;
                              Columns: Windows_ColumnRange);
BEGIN {Windows_OpenWindow}
(*   writeln ('Windows_OpenWindow'); *)
END {Windows_OpenWindow};




PROCEDURE Windows_ClearWindow (VAR w : Windows_Window);
BEGIN {Windows_ClearWindow}
(*   writeln ('Windows_ClearWindow'); *)
   Windows_NewRowColumn (w, 1, 1);
   IF Done THEN Windows_Erase (w, 1, w.Rows, 1, w.Columns)
END {Windows_ClearWindow};




PROCEDURE Windows_CloseWindow (VAR w : Windows_Window);
BEGIN {Windows_CloseWindow}
(*   writeln ('Windows_CloseWindow'); *)
{
   Status := VMSSMG_DeleteVirtualDisplay (w.wid);
}
   Done := Status = NormalStatus
END {Windows_CloseWindow};




PROCEDURE Windows_NewHelpWindow (VAR w  : Windows_Window;
                                 VAR n  : Windows_Window;
                                     dv : Windows_Device;
                                     x  : Integer;
                                     y  : Integer);
BEGIN {Windows_NewHelpWindow}
(*   writeln ('Windows_NewHelpWindow'); *)
END {Windows_NewHelpWindow};




PROCEDURE Windows_OldHelpWindow (VAR w: Windows_Window);
BEGIN {Windows_OldHelpWindow}
(*   writeln ('Windows_OldHelpWindow'); *)
END {Windows_OldHelpWindow};



PROCEDURE Windows_CreateViewport (w : Windows_Window;
                                  VAR v : Windows_Viewport;
                                  d : Windows_Device;
                                  Row : Windows_RowRange;
                                  Column : Windows_ColumnRange;
                                  Rows : Windows_RowRange;
                                  Columns : Windows_ColumnRange);
BEGIN
   v.wid := w.wid;
   v.did := d.did;
   {v.vid := ?;}
{
   Status := VMSSMG_CreateViewport(v.wid, Row, Column, Rows, Columns);
}
(*   writeln ('Windows_CreateViewport'); *)
   Done := Status = NormalStatus
END {Windows_CreateViewport};



PROCEDURE Windows_ChangeViewport (
                                  VAR v : Windows_Viewport;
                                  Row : Windows_RowRange;
                                  Column : Windows_ColumnRange;
                                  Rows : Windows_RowRange;
                                  Columns : Windows_ColumnRange);
BEGIN
{
   Status := VMSSMG_ChangeViewport(v.wid, Row, Column, Rows, Columns);
}
(*   writeln ('Windows_ChangeViewport'); *)
   Done := Status = NormalStatus
END {Windows_ChangeViewport};



PROCEDURE Windows_OpenViewport (VAR v : Windows_Viewport;
                                    d : Windows_Device;
                                    w : Windows_Window;
                                    y : Integer;
                                    x : Integer);
BEGIN {Windows_OpenViewport}
   v.wid := w.wid;
   v.did := d.did;
   {v.vid := ?;}
{
   Status := VMSSMG_PasteVirtualDisplay (v.wid, v.did, y, x);
}
(*   writeln ('Windows_OpenViewport'); *)
   Done := Status = NormalStatus
END {Windows_OpenViewport};




PROCEDURE Windows_ResetViewport (VAR v : Windows_Viewport;
                                    d : Windows_Device;
                                    w : Windows_Window;
                                    y : Integer;
                                    x : Integer);
BEGIN {Windows_ResetViewport}
   v.wid := w.wid;
   v.did := d.did;
   {v.vid := ?;}
{
   Status := VMSSMG_RePasteVirtualDisplay (v.wid, v.did, y, x);
}
(*   writeln ('Windows_ResetViewport'); *)
   Done := Status = NormalStatus
END {Windows_ResetViewport};




PROCEDURE Windows_MoveViewport (VAR v : Windows_Viewport;
                                    x : Integer;
                                    y : Integer);
BEGIN {Windows_MoveViewport}
{
   Status := VMSSMG_MoveVirtualDisplay (v.wid, v.did, x, y);
}
(*   writeln ('Windows_MoveViewport'); *)
   Done := Status = NormalStatus
END {Windows_MoveViewport};




PROCEDURE Windows_ScrollViewport(VAR v : Windows_Viewport;
                                 direction: WINDOWS_Direction;
                                 count : Integer);
VAR d : INTEGER;
BEGIN {Windows_ScrollViewport}
{
   CASE direction OF
   WINDOWS_Up   : d := SMG$M_Up;
   WINDOWS_Down : d := SMG$M_Down;
   WINDOWS_Left : d := SMG$M_Left;
   WINDOWS_Right: d := SMG$M_Right
   END;

   Status := VMSSMG_ScrollViewport(v.wid, d ,count);
}
(*   writeln ('Windows_ScrollViewport'); *)
   Done := Status = NormalStatus
END {Windows_ScrollViewport};




PROCEDURE Windows_CloseViewport (VAR v : Windows_Viewport);
BEGIN {Windows_CloseViewport}
{
   Status := VMSSMG_UnpasteVirtualDisplay (v.wid, v.did);
}
(*   writeln ('Windows_CloseViewport'); *)
   Done := Status = NormalStatus
END {Windows_CloseViewport};




PROCEDURE Windows_OpenDevice (VAR d  : Windows_Device;
                              CONST name   : STRING;
                              len    : Windows_DeviceNameRange;
                              shared : BOOLEAN);
CONST PressSpaceBar    = 'press spacebar to continue';
      LenPressSpaceBar = 26;
VAR HStr: String_String;
BEGIN {Windows_OpenDevice}
(*   writeln ('Windows_OpenDevice'); *)
   IF shared THEN BEGIN
{
      Status := VMSSMG_CreatePasteboard (d.did, 
                                         name, 
                                         d.Rows, 
                                         d.Columns, 
                                         DoPreserveScreen);
}
      END
   ELSE BEGIN
{
      Status := VMSSMG_CreatePasteboard (d.did, 
                                         name, 
                                         d.Rows, 
                                         d.Columns, 
                                         DoNotPreserveScreen);
}
   END;
   IF Status <> NormalStatus THEN 
      Done := FALSE
   ELSE BEGIN
{
      Status := VMSSMG_CreateVirtualKeyboard (InternalKeyboard, 'TT', '', HStr);
}
      IF Status <> NormalStatus THEN 
         Done := FALSE
      ELSE BEGIN
{
         Status := VMSSMG_SetKeypadMode (InternalKeyBoard, ApplicationOn);
}
         Done := Status = NormalStatus;
         IF Done THEN BEGIN
{
            Windows_OpenWindow (HelpWindow, 'Help', 0, 2, 40);
            Windows_WriteStr (HelpWindow, PressSpaceBar, LenPressSpaceBar,
                              LenPressSpaceBar, TRUE)
}
         END {IF}
      END {IF}
   END {IF}
END {Windows_OpenDevice};




PROCEDURE Windows_CloseDevice (VAR d : Windows_Device);
BEGIN {Windows_CloseDevice}
(*   writeln ('Windows_CloseDevice'); *)
{
   Status := VMSSMG_DeleteVirtualKeyboard (InternalKeyboard);
}
   IF Status <> NormalStatus THEN
      Done := FALSE
   ELSE BEGIN
{
      Status := VMSSMG_DeletePasteBoard (d.did, ClearScreen);
}
      Done := Status = NormalStatus
   END {IF}
END {Windows_CloseDevice};




FUNCTION Windows_EndOfPage (VAR w : Windows_Window)
                    : BOOLEAN;
BEGIN {Windows_EndOfWindow}
(*   writeln ('Windows_EndOfPage'); *)
   Windows_EndOfPage := w.i = Windows_EndOfPageSymbol
END {Windows_EndOfWindow};




FUNCTION Windows_EndOfLine (VAR w : Windows_Window)
                    : BOOLEAN;
BEGIN {Windows_EndOfLine}
(*   writeln ('Windows_EndOfLine'); *)
   Windows_EndOfLine := w.i = Windows_EndOfLineSymbol
END {Windows_EndOfLine};





FUNCTION Windows_Column (VAR w : Windows_Window)
                    : Windows_ColumnRange;
VAR i: Windows_ColumnRange;
BEGIN {Windows_Column}
(*   writeln ('Windows_Column'); *)
{
   i := VMSSMG_CursorColumn (w.wid);
}
   IF i > w.Columns THEN 
      Done := FALSE
   ELSE BEGIN
      Windows_Column := i;
      Done := TRUE
   END {IF}
END {Windows_Column};




FUNCTION Windows_Row (VAR w : Windows_Window)
                    : Windows_RowRange;
VAR i: Windows_RowRange;
BEGIN {Windows_Row}
(*   writeln ('Windows_Row'); *)
{
   i := VMSSMG_CursorRow (w.wid);
}
   IF i > w.Rows THEN
      Done := FALSE
   ELSE BEGIN
      Windows_Row := i;
      Done := TRUE
   END {IF}
END {Windows_Row};




PROCEDURE Windows_NewRowColumn (VAR w  : Windows_Window;
                                Row    : Windows_RowRange;
                                Column : Windows_ColumnRange);
BEGIN {Windows_NewRowColumn}
(*   writeln ('Windows_NewRowColumn'); *)
{
   Status := VMSSMG_SetCursorAbs (w.wid, Row, Column);
}
   IF status <> Normalstatus THEN BEGIN
   END;
   Done := Status = NormalStatus
END {Windows_NewRowColumn};




PROCEDURE Windows_ReadChars (VAR w  : Windows_Window;
                             VAR Str: STRING;
                             VAR len: Windows_IORange;
                                 s  : CharSet);
VAR ch           : Char; 
    i            : Integer;
    Row          : Windows_RowRange;
    Column       : Windows_ColumnRange;
    TerminateKey : Boolean;
BEGIN {Windows_ReadChars}
(*   writeln ('Windows_ReadChars'); *)
END {Windows_ReadChars};



PROCEDURE Windows_ReadIdentifier (VAR w   : Windows_Window;
                                  VAR Str : STRING;
                                  VAR len : Windows_IORange);
VAR IdentifierSet: CharSet;
BEGIN {Windows_ReadIdentifier}
(*   writeln ('Windows_ReadIdentifier'); *)
END {Windows_ReadIdentifier};




PROCEDURE Windows_ReadStr (VAR w   : Windows_Window;
                           VAR Str : STRING;
                           VAR len : Windows_IORange);
VAR StrSet : CharSet;
    ch     : Char;
BEGIN {Windows_ReadStr}
(*   writeln ('Windows_ReadStr'); *)
   StrSet := PrintableChars - (SpecialChars + [' ']);
{
   Windows_ReadChars (w, Str, Len, StrSet)
}
END {Windows_ReadStr};




PROCEDURE Windows_ReadString (VAR w   : Windows_Window;
                              VAR Str : String_String);
VAR s : STRING(Windows_MaxIO);
    i : STRING_Range;
BEGIN {Windows_ReadString}
(*   writeln ('Windows_ReadString'); *)
{
   Windows_ReadStr (w, s, i);
}
   STRING_Constant (str, s, i)
END {Windows_ReadString};




PROCEDURE Windows_ReadToEndOfLine (VAR w   : Windows_Window;
                                   VAR Str : STRING;
                                   VAR len : Windows_IORange);
VAR EndOfLineSet: CharSet;
BEGIN {Windows_ReadToEndOfLine}
(*   writeln ('Windows_ReadToEndOfLine'); *)
   EndOfLineSet := [chr(0)..chr(CharRange)] - 
                   [chr(Windows_EndOfLineSymbol), 
                    chr(Windows_EndOfPageSymbol)];
{
   Windows_ReadChars (w, Str, Len, EndOfLineSet)
}
END {Windows_ReadToEndOfLine};




PROCEDURE Windows_ReadKey (VAR w : Windows_Window;
                           VAR k : Integer);
BEGIN
(*   writeln ('Windows_ReadKey'); *)
END {Windows_ReadKey};




PROCEDURE Windows_ReadChar (VAR w : Windows_Window; 
                            VAR c : Char);
BEGIN
(*   writeln ('Windows_ReadChar'); *)
END {Windows_ReadChar};




PROCEDURE Windows_ReadInteger (VAR w : Windows_Window;
                               VAR i : Integer);
BEGIN
(*   writeln ('Windows_ReadInteger'); *)
END {Windows_ReadInteger};




PROCEDURE Windows_ReadBoolean (VAR w : Windows_Window;
                               VAR b : Boolean);
BEGIN
(*   writeln ('Windows_ReadBoolean'); *)
END {Windows_ReadBoolean};




PROCEDURE Windows_SkipSpace (VAR w : Windows_Window;
                                 b : Boolean);
BEGIN
(*   writeln ('Windows_SkipSpace'); *)
END {Windows_SkipSpace};




PROCEDURE Windows_SkipLine (VAR w : Windows_Window);
VAR ch : Char;
BEGIN {Windows_SkipLine}
(*   writeln ('Windows_SkipLine'); *)
END {Windows_SkipLine};




PROCEDURE Windows_ReadAgain (VAR w : Windows_Window);
BEGIN {Windows_ReadAgain}
(*   writeln ('Windows_ReadAgain'); *)
END {Windows_ReadAgain};




PROCEDURE Windows_WriteStr (VAR w       : Windows_Window;
                            CONST Str         : STRING;
                            len         : Windows_IORange;
                            width       : Windows_IORange;
                            LeftJustify : Windows_LeftJustify);
VAR i : Windows_IORange; 
BEGIN {Windows_WriteStr}
(*   writeln ('Windows_WriteStr'); *)
END {Windows_WriteStr};




PROCEDURE Windows_WriteString (VAR w       : Windows_Window;
                               Str         : String_String;
                               width       : Windows_IORange;
                               LeftJustify : Windows_LeftJustify);
VAR str2 : STRING(10);
    len2 : STRING_Range;
BEGIN {Windows_WriteString}
(*   writeln ('Windows_WriteString'); *)
END {Windows_WriteString};




PROCEDURE Windows_WriteChar (VAR w : Windows_Window;
                                 c : Char);
VAR cstr: String_String;
BEGIN {Windows_WriteChar}
(*   writeln ('Windows_WriteChar'); *)
END {Windows_WriteChar};


PROCEDURE Windows_WriteInteger (VAR w       : Windows_Window;
                                i           : Integer;
                                width       : Windows_IORange;
                                LeftJustify : Windows_LeftJustify);
VAR str : Windows_IOBuffer;
    len : Windows_IORange;
BEGIN {Windows_WriteInteger}
(*   writeln ('Windows_WriteInteger'); *)
END {Windows_WriteInteger};




PROCEDURE Windows_WriteBoolean (VAR w       : Windows_Window;
                                b           : Boolean;
                                width       : Windows_IORange;
                                LeftJustify : Windows_LeftJustify);
VAR str : Windows_IOBuffer;
    len : Windows_IORange;
BEGIN {Windows_WriteBoolean}
(*   writeln ('Windows_WriteBoolean'); *)
END {Windows_WriteBoolean};




PROCEDURE Windows_WriteSpace (VAR w : Windows_Window;
                              width : Windows_IORange);
VAR Row    : Windows_RowRange;
    Column : Windows_ColumnRange;
BEGIN {Windows_WriteSpace}
(*   writeln ('Windows_WriteSpace'); *)
END {Windows_WriteSpace};




PROCEDURE Windows_WriteLine (VAR w : Windows_Window;
                                 b : Boolean);
BEGIN {Windows_WriteLine}
(*   writeln ('Windows_WriteLine'); *)
END {Windows_WriteLine};



PROCEDURE ComputeAttributes (VAR result : Integer;
                                 Attribs: Windows_VideoAttributeSet);
VAR i: Integer;
BEGIN {ComputeAttributes}
(*   writeln ('ComputeAttributes'); *)
END {ComputeAttributes};




PROCEDURE Windows_SetVideoAttrExist (VAR w         : Windows_Window;
                                     Row           : Windows_RowRange;
                                     Rows          : Windows_RowRange;
                                     Column        : Windows_ColumnRange;
                                     Columns       : Windows_ColumnRange;
                                     VideoAttribs  : Windows_VideoAttributeSet;
                                     ReverseAttribs: Windows_VideoAttributeSet);
VAR VideoRenditionSet, ReverseVideoRenditionSet: Integer;
BEGIN {Windows_SetVideoAttrConsist}
(*   writeln ('Windows_SetVideoAttrExist'); *)
END {Windows_SetVideoAttrConsist};




PROCEDURE Windows_SetDefaultVideoAttr 
   (VAR w             : Windows_Window;
        VideoAttribs  : Windows_VideoAttributeSet;
        ReverseAttribs: Windows_VideoAttributeSet);
VAR VideoRendition, ReverseRendition: Integer;
BEGIN {Windows_SetDefaultVideoAttr}
(*   writeln ('Windows_SetDefaultVideoAttr'); *)
END {Windows_SetDefaultVideoAttr};




PROCEDURE Windows_Erase (VAR w        : Windows_Window;
                         Row          : Windows_RowRange;
                         Rows         : Windows_RowRange;
                         Column       : Windows_ColumnRange;
                         Columns      : Windows_ColumnRange);
BEGIN {Windows_Erase}
(*   writeln ('Windows_Erase'); *)
END {Windows_Erase};




PROCEDURE Windows_DeleteLines (VAR w    : Windows_Window;
                               StartRow : Windows_RowRange;
                               NrLines  : Integer);
BEGIN {Windows_DeleteLines}
(*   writeln ('Windows_DeleteLines'); *)
END {Windows_DeleteLines};




PROCEDURE Windows_DeleteInLine (VAR w   : Windows_Window;
                                Row     : Windows_RowRange;
                                Column  : Windows_ColumnRange;
                                NrChars : Integer);
BEGIN {Windows_DeleteInLine}
(*   writeln ('Windows_DeleteInLine'); *)

END {Windows_DeleteInLine};




PROCEDURE Windows_InsertLines (VAR w    : Windows_Window;
                               StartRow : Windows_RowRange;
                               NrLines  : Integer);
VAR i: Integer;
BEGIN {Windows_InsertLines}
(*   writeln ('Windows_InsertLines'); *)
END {Windows_InsertLines};




PROCEDURE Windows_InsertLine  (VAR w    : Windows_Window;
                               StartRow : Windows_RowRange;
                               line     : String_String);
BEGIN {Windows_InsertLine}
(*   writeln ('Windows_InsertLine'); *)
END {Windows_InsertLine};




PROCEDURE Windows_EraseLine   (VAR w    : Windows_Window;
                               StartRow : Windows_RowRange;
                               StartColumn : Windows_ColumnRange);
BEGIN {Windows_EraseLine}
(*   writeln ('Windows_EraseLine'); *)
END {Windows_EraseLine};




PROCEDURE Windows_InsertInLine (VAR w   : Windows_Window;
                                Row     : Windows_RowRange;
                                Column  : Windows_ColumnRange;
                                NrChars : Integer);
VAR i: Integer;
    rs,  rc: INTEGER;
BEGIN {Windows_InsertInLine}
(*   writeln ('Windows_InsertInLine'); *)
END {Windows_InsertInLine};




PROCEDURE Windows_InsertChar (VAR w   : Windows_Window;
                              Row     : Windows_RowRange;
                              Column  : Windows_ColumnRange;
                              ch      : CHAR;
                              rc, 
                              rs      : Windows_VideoAttributeSet);
VAR chstr  : STRING(1);
    VideoRendition, ReverseRendition: Integer;
BEGIN {Windows_InsertChar}
(*   writeln ('Windows_InsertChar'); *)
END {Windows_InsertChar};




PROCEDURE Windows_DrawHorizontalLine (VAR w       : Windows_Window;
                                          Row     : Windows_RowRange;
                                          Column  : Windows_ColumnRange;
                                          Columns : Windows_ColumnRange);
BEGIN {Windows_DrawHorizontalLine}
(*   writeln ('Windows_DrawHorizontalLine'); *)
END {Windows_DrawHorizontalLine};





PROCEDURE Windows_DrawVerticalLine (VAR w      : Windows_Window;
                                        Row    : Windows_RowRange;
                                        Column : Windows_ColumnRange;
                                        Rows   : Windows_RowRange);
BEGIN {Windows_DrawVerticalLine}
(*   writeln ('Windows_DrawVerticalLine'); *)
END {Windows_VerticalLine};





PROCEDURE Windows_DrawRectangle (VAR w       : Windows_Window;
                                     Row     : Windows_RowRange;
                                     Column  : Windows_ColumnRange;
                                     Rows    : Windows_RowRange;
                                     Columns : Windows_ColumnRange);
BEGIN {Windows_DrawLine}
(*   writeln ('Windows_DrawRectangle'); *)
END {Windows_DrawLine};





FUNCTION Windows_IsPrintableChar (i: Integer) : Boolean;
BEGIN {Windows_IsPrintableChar}
(*   writeln ('Windows_IsPrintableChar'); *)
END {Windows_IsPrintableChar};


FUNCTION Windows_IntegerStatus
                  : INTEGER;
BEGIN {Windows_IntegerStatus}
(*   writeln ('Windows_IntegerStatus'); *)
   Windows_IntegerStatus:=Status
END {Windows_IntegerStatus};


PROCEDURE Windows_ReadLineFromDisplay(
                           VAR w: Windows_Window;
                           VAR l: STRING;
                               r: Windows_RowRange);
VAR
   str: STRING_String;
BEGIN {Windows_ReadLineFromDisplay}
(*   writeln ('Windows_ReadLineFromDisplay'); *)
END {Windows_ReadLineFromDisplay};


PROCEDURE Windows_RingBell(
                           VAR w: Windows_Window;
                           count: INTEGER);
BEGIN {Windows_RingBell}
(*   writeln ('Windows_RingBell'); *)
END {Windows_RingBell};


PROCEDURE Windows_CursorVisible(
                           VAR d: Windows_Device;
                           b: BOOLEAN);
VAR
   i: INTEGER;
BEGIN {Windows_CursorVisible}
(*   writeln ('Windows_CursorVisible'); *)
END {Windows_CursorVisible};


PROCEDURE Windows_PutStatusLine(
                           VAR d: Windows_Device;
                           CONST l: STRING);
BEGIN {Windows_PutStatusLine}
(*   writeln ('Windows_PutStatusLine'); *)
END {Windows_PutStatusLine};


