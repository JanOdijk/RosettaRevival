(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : DebugMparser
 *  Creation date   :  2-MAR-1988
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(DEBUGMPARSER);
pragma C_include('listree.pf');
pragma C_include('wnd.pf');
pragma C_include('ldmrules.pf');
pragma C_include('globdef.pf');
pragma C_include('error.pf');
pragma C_include('str.pf');
pragma C_include('string.pf');
pragma C_include('drawtreeset.pf');
pragma C_include('drawstree.pf');
pragma C_include('loop.pf');
pragma C_include('debugmparser.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM DebugMparser;
WITH LISTREE, WND, LDMRULES, GLOBDEF, ERROR, STR, STRNG, DRAWTREESET,
DRAWSTREE, LOOP;

CONST
   MaxRule          = 550;
   MaxTrans         = 600;

VAR 
   CurStree           : LISTREE_pStree;
   CurRuleResult      : LISTREE_SetOfTupleOfStrees;
   RuleArray          : ARRAY[1..MaxRule] OF BOOLEAN;
   TransArray         : ARRAY[1..MaxTrans] OF BOOLEAN;
   Trace              : BOOLEAN;
   TransInTree        : BOOLEAN;
   StopParse          : BOOLEAN;
   Step               : BOOLEAN;
   Entered_tree_loop  : BOOLEAN;

PROCEDURE ResetArrays;
VAR
   i : INTEGER;
BEGIN
   FOR i:=1 TO MaxRule DO BEGIN
      RuleArray[i] := FALSE;
   END;
   FOR i:=1 TO MaxTrans DO BEGIN
      TransArray[i] := FALSE;
   END;
END {ResetArrays};  

PROCEDURE InitWindowValues;
BEGIN
   WND_SetBoolean (X_mp_trace_toggle, Trace);
   WND_SetBoolean (X_mp_tree_toggle, TransInTree);
END {InitWindowValues};


PROCEDURE ClearWindow;
BEGIN
   WND_Clear (X_mp_rule_scroll_text);
   WND_Clear (X_mp_trans_scroll_text);
END {ClearWindow};


PROCEDURE HandleBreakpoints (id : WND_Xid);
VAR
   str_array  : array [1..100] OF STRING_String;
   n_strs, i, index : INTEGER;
   len        : STR_Range;
BEGIN
   WND_GetStringList (id, str_array, n_strs);
   FOR i:=1 TO n_strs DO BEGIN
      len := LENGTH(str_array[i]);
      STR_UpperCase(str_array[i], len, str_array[i], len);
      index := -1;
      IF id = X_mp_rule_sel_list THEN BEGIN
         LDMRULES_RuleNumber(index, str_array[i], len);
         RuleArray[index] := TRUE;
      END
      ELSE BEGIN
         LDMRULES_TransformationNumber(index, str_array[i], len);
         TransArray[index] := TRUE;
      END;
   END;

END {HandleBreakpoints};


PROCEDURE DebugMparser_Init;
BEGIN
   If Not GlobDef_GetBatchMode Then Begin
      ResetArrays;
      WND_Clear (X_mp_rule_sel_list);
      WND_Clear (X_mp_trans_sel_list);

      Trace := FALSE;
      InitWindowValues;
      DebugMparser_Default;
   End;

END {DebugMparser_Init};


PROCEDURE DebugMparser_Default;
BEGIN
   StopParse := FALSE;
   Step      := FALSE;
   TransInTree := FALSE;
   LISTREE_InitSetOfTupleOfStrees(CurRuleResult);

END {DebugMparser_Default};


PROCEDURE DebugMparser_StoreStree(t: LISTREE_pStree);
BEGIN
   CurStree := t
END {DebugMparser_StoreStree};


PROCEDURE DebugMparser_StoreRuleResult(t: LISTREE_SetOfTupleOfStrees);
BEGIN
   CurRuleResult := t
END {DebugMparser_StoreRuleResult};


FUNCTION DebugMparser_Trace: BOOLEAN;
BEGIN
   DebugMparser_Trace := Trace;
END {DebugMparser_Trace};


FUNCTION DebugMparser_StopParse: BOOLEAN;
BEGIN
   DebugMparser_StopParse := StopParse;
END {DebugMparser_StopParse};


FUNCTION DebugMparser_PlusTrans
                  : BOOLEAN;
BEGIN {DebugMparser_PlusTrans}
   DebugMparser_PlusTrans:= TransInTree
END {DebugMparser_PlusTrans};


FUNCTION DebugMparser_Step: BOOLEAN;
BEGIN
   DebugMparser_Step := Step;
END {DebugMparser_Step};

FUNCTION DebugMparser_RuleBreakPoint(r: INTEGER): BOOLEAN;
BEGIN
   DebugMparser_RuleBreakPoint := RuleArray[r]
END {DebugMparser_RuleBreakPoint};


FUNCTION DebugMparser_TransBreakPoint(r: INTEGER): BOOLEAN;
BEGIN
   DebugMparser_TransBreakPoint := TransArray[r]
END {DebugMparser_TransBreakPoint};


PROCEDURE DebugMparser_MenuInit;
BEGIN
   ClearWindow;
   WND_Manage (X_mp_window, X_undefined);
END {DebugMparser_MenuInit};

PROCEDURE DebugMparser_MenuExit;
BEGIN
   {IF not Step OR StopParse THEN } WND_Unmanage (X_mp_window);
END {DebugMparser_MenuInit};

PROCEDURE DebugMparser_Menu;
VAR
   stop       : BOOLEAN;
   keys       : array [1..5] of WND_Xid;
   key        : WND_Xid;
BEGIN
   ClearWindow;

   keys[1] := X_mp_start_button;
   keys[2] := X_mp_step_button;
   keys[3] := X_mp_stop_button;
   keys[4] := - X_mp_treein_button;
   keys[5] := - X_mp_treeout_button;
   WND_SetKeys (X_mp_window, keys);
   stop := FALSE;
   Entered_tree_loop := FALSE;
   WHILE NOT stop DO BEGIN
      WND_GetKey (key);
      CASE key OF
      X_mp_start_button,
      X_mp_step_button :
         BEGIN
            Step := (key = X_mp_step_button);
            WND_GetBoolean (X_mp_trace_toggle, Trace);
            WND_GetBoolean (X_mp_tree_toggle, TransInTree);
            IF NOT Step THEN BEGIN
               ResetArrays;
               HandleBreakpoints (X_mp_rule_sel_list);
               HandleBreakpoints (X_mp_trans_sel_list);
            END;
            stop := TRUE;
         END;
      X_mp_stop_button :
         BEGIN
            StopParse := TRUE;
            stop := TRUE;
         END;
      X_mp_treein_button,
      X_mp_treeout_button :
         DebugMParser_HandleKey (key);
      END;
   END;

END {DebugMparser_Menu};

PROCEDURE DebugMParser_HandleKey ( key : WND_Xid );
VAR
   screen_nr  : integer;
   dummy      : LISTREE_SetOfStrees;
BEGIN
   CASE key OF
      X_mp_treein_button :
         BEGIN
            IF Entered_tree_loop THEN BEGIN
               screen_nr := DrawSTree_Manage (CurStree, X_mp_window);
               IF screen_nr <> -1 THEN BEGIN
                  Loop_AddStopButton (WND_CodeKey(X_tree_ok_button,screen_nr),
                                      X_mp_window, - X_mp_treein_button);
               END;
            END
            ELSE BEGIN
               Entered_tree_loop := TRUE;
               Loop_SetStopButtonProperties (X_mp_window, - X_mp_treein_button);
               DrawStree_GenerateTree(CurStree);
               Entered_tree_loop := FALSE;
            END;
         END;
      X_mp_treeout_button :
         BEGIN
            IF Entered_tree_loop THEN BEGIN
               screen_nr := DrawTreeSet_Manage (CurRuleResult, dummy, 1, 1,
                                                TRUE, TRUE, X_mp_window);
               IF screen_nr <> -1 THEN BEGIN
                  Loop_AddStopButton (WND_CodeKey(X_trees_ok_button,screen_nr),
                                      X_mp_window, - X_mp_treeout_button);
               END;
            END
            ELSE BEGIN
               Entered_tree_loop := TRUE;
               Loop_SetStopButtonProperties (X_mp_window, - X_mp_treeout_button);
               DrawTreeSet_Generate (CurRuleResult, dummy, 1, 1,
                                     TRUE, TRUE, X_mp_window);
               Entered_tree_loop := FALSE;
            END;
         END;
   END;
END {DebugMParser_HandleKey};
