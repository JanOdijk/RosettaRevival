(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LASTACTIVE
 *  Creation date   : 28-JUN-1991
 *  Author          : 
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(LASTACTIVE);
pragma C_include('interfaces.pf');
pragma C_include('level.pf');
pragma C_include('wnd.pf');
pragma C_include('globdef.pf');
pragma C_include('lastactive.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM LASTACTIVE;
WITH INTERFACES, LEVEL, WND, GLOBDEF;

Function LASTACTIVE_GetLastActive ( level : INTERFACES_LevelType ):
INTERFACES_LevelType;
Var is_set    : Boolean;
    new_level : INTERFACES_LevelType;
Begin
    If GLOBDEF_GetBatchMode Then 
        LASTACTIVE_GetLastActive := level
    Else Begin
        new_level := LASTACTIVE_GenerationMaxLevel;
        is_set := False;
        While (Not is_set) and (new_level > 0) Do Begin
            WND_GetBoolean ( LEVEL_last_active_to_Xid ( new_level ), is_set);
	    If Not is_set Then new_level := new_level - 1;
        End;
        If new_level = 0 Then
            LASTACTIVE_GetLastActive := LASTACTIVE_GenerationMaxLevel
	Else
            LASTACTIVE_GetLastActive := new_level;
    End
End;
