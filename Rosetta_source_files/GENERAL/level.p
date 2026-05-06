(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    :  LEVEL
 *  Creation date   :  1991-06-21
 *  Author          : 
 *
 *  Copyright (c) 1991, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(LEVEL);

pragma C_include('level.pf');
pragma C_include('wnd.pf');
pragma C_include('interfaces.pf');
pragma C_include('globdef.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM LEVEL;
WITH WND, INTERFACES, GLOBDEF;


Function LEVEL_debug_to_Xid (level : GLOBDEF_LevelType)
	: WND_Xid;
Var id : WND_Xid;
Begin
    Case level Of
         1 : id := X_dbgset_debug1_toggle;
         2 : id := X_dbgset_debug2_toggle;
         3 : id := X_dbgset_debug3_toggle;
         4 : id := X_dbgset_debug4_toggle;
         5 : id := X_dbgset_debug5_toggle;
         6 : id := X_dbgset_debug6_toggle;
         7 : id := X_dbgset_debug7_toggle;
         8 : id := X_dbgset_debug8_toggle;
         Otherwise id := X_undefined;
    End;
    LEVEL_debug_to_Xid := id;
End {LEVEL_debug_to_Xid};


Function LEVEL_printerf_to_Xid (level : INTERFACES_LevelType)
	: WND_Xid;
Var id : WND_Xid;
Begin
    Case level Of
         1 : id := X_dbgset_print1_toggle;
         2 : id := X_dbgset_print2_toggle;
         3 : id := X_dbgset_print3_toggle;
         4 : id := X_dbgset_print4_toggle;
         5 : id := X_dbgset_print5_toggle;
         6 : id := X_dbgset_print6_toggle;
         7 : id := X_dbgset_print7_toggle;
         8 : id := X_dbgset_print8_toggle;
         Otherwise id := X_undefined;
    End;
    LEVEL_printerf_to_Xid := id;
End {LEVEL_printerf_to_Xid};


Function LEVEL_interact_to_Xid (level : INTERFACES_LevelType)
	: WND_Xid;
Var id : WND_Xid;
Begin
    Case level Of
         1 : id := X_dbgset_interact1_toggle;
         2 : id := X_dbgset_interact2_toggle;
         3 : id := X_dbgset_interact3_toggle;
         4 : id := X_dbgset_interact4_toggle;
         5 : id := X_dbgset_interact5_toggle;
         6 : id := X_dbgset_interact6_toggle;
         7 : id := X_dbgset_interact7_toggle;
         8 : id := X_dbgset_interact8_toggle;
         Otherwise id := X_undefined;
    End;
    LEVEL_interact_to_Xid := id;
End {LEVEL_interact_to_Xid};


Function LEVEL_last_active_to_Xid (level : INTERFACES_LevelType)
	: WND_Xid;
Var id : WND_Xid;
Begin
    Case level Of
         1 : id := X_dbgset_last1_toggle;
         2 : id := X_dbgset_last2_toggle;
         3 : id := X_dbgset_last3_toggle;
         4 : id := X_dbgset_last4_toggle;
         5 : id := X_dbgset_last5_toggle;
         6 : id := X_dbgset_last6_toggle;
         7 : id := X_dbgset_last7_toggle;
         8 : id := X_dbgset_last8_toggle;
         Otherwise id := X_undefined;
    End;
    LEVEL_last_active_to_Xid := id;
End {LEVEL_last_active_to_Xid};
