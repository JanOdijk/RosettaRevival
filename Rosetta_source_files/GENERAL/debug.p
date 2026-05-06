(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : DEBUG
 *  Creation date   :  14-NOV-1986
 *  Author          : J. Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(DEBUG);
pragma C_include('wnd.pf');
pragma C_include('globdef.pf');
pragma C_include('string.pf');
pragma C_include('debug.pf');
pragma C_include('level.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM DEBUG;
WITH GLOBDEF, STRNG, WND, LEVEL;

VAR
   DebugInfo : ARRAY[GLOBDEF_leveltype] OF BOOLEAN;
   CurrentLevel : GLOBDEF_leveltype;




PROCEDURE DEBUG_Init;
VAR
   i: GLOBDEF_LevelType;
BEGIN
   FOR i:=-1 TO 8 DO DebugInfo[i] := FALSE;
   CurrentLevel := -1
END;


PROCEDURE DEBUG_Set(level: GLOBDEF_LevelType;
                             valeu: BOOLEAN);
BEGIN
   DebugInfo[level] := valeu
END;


PROCEDURE DEBUG_Open(level: GLOBDEF_leveltype);
BEGIN
   CurrentLevel := level;
   IF (level > 0) And (Not GlobDef_GetBatchMode) THEN BEGIN
      WND_GetBoolean(LEVEL_debug_to_Xid (level), DebugInfo[level]);
      IF DebugInfo[level] THEN BEGIN
         WND_Clear(X_dbg_area);
         WND_Manage(X_dbg_window, X_undefined)
      END;
   END;
END;


PROCEDURE DEBUG_Close(level: GLOBDEF_leveltype);
VAR keys     : array [1..1] of WND_Xid;
    key      : WND_Xid;
BEGIN
   IF DebugInfo[level] THEN BEGIN
      keys[1] := X_dbg_ok_button;
      WND_SetKeys (X_dbg_window, keys);
      WND_GetKey (key);
      WND_Unmanage(X_dbg_window)
   END
END;


PROCEDURE DEBUG_WriteStr(CONST s: STRING;
                                  l: WND_IORange;
                                  w: WND_IORange;
                                  j: WND_LeftJustify);
BEGIN
   IF DebugInfo[CurrentLevel] THEN BEGIN
      WND_WriteString(X_dbg_area, s, w, j)
   END
END;


PROCEDURE DEBUG_WriteString(s: STRING_String;
                                     w: WND_IORange;
                                     j: WND_LeftJustify);
BEGIN
   IF DebugInfo[CurrentLevel] THEN BEGIN
      WND_WriteString(X_dbg_area, s, w, j)
   END
END;


PROCEDURE DEBUG_WriteInteger(i: INTEGER;
                                      w: WND_IORange;
                                      l: WND_LeftJustify);
BEGIN
   IF DebugInfo[CurrentLevel] THEN BEGIN
      WND_WriteInteger(X_dbg_area, i, w, l);
   END
END;


PROCEDURE DEBUG_WriteLine(b: BOOLEAN);
BEGIN
   IF DebugInfo[CurrentLevel] THEN BEGIN
      WND_WriteLine(X_dbg_area, b);
   END
END;


FUNCTION DEBUG_Mode: BOOLEAN;
BEGIN
   DEBUG_Mode := DebugInfo[CurrentLevel]
END;


