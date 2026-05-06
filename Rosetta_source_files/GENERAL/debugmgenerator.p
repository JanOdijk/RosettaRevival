(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : DebugMgenerator
 *  Creation date   :  2-MAR-1988
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(DEBUGMGENERATOR);
pragma C_include('listree.pf');
pragma C_include('wnd.pf');
pragma C_include('ldmrules.pf');
pragma C_include('globdef.pf');
pragma C_include('error.pf');
pragma C_include('str.pf');
pragma C_include('string.pf');
pragma C_include('debugmgenerator.pf');
pragma C_include('loop.pf');
pragma C_include('drawtreeset.pf');


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM DebugMgenerator;
WITH LISTREE, WND, LDMRULES, GLOBDEF, ERROR, STR, STRNG, DRAWTREESET, LOOP;

CONST
   MaxRule          = 550;
   MaxTrans         = 600;

VAR 
   CurStreeSet   : LISTREE_SetOfStrees;
   CurStreeTuple : LISTREE_SetOfTupleOfStrees;
   RuleArray     : ARRAY[1..MaxRule] OF BOOLEAN;
   TransArray    : ARRAY[1..MaxTrans] OF BOOLEAN;
   Trace         : BOOLEAN;
   PlusStree     : BOOLEAN;
   StopParse     : BOOLEAN;
   StopAllParse  : BOOLEAN;
   Step          : BOOLEAN;
   LastTriedRule : INTEGER;
   LastTriedTrf  : INTEGER;
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
   WND_SetBoolean (X_mg_trace_toggle, Trace);
   WND_SetBoolean (X_mg_tree_toggle, PlusStree);
END {InitWindowValues};


PROCEDURE ClearWindow;
BEGIN
   WND_Clear (X_mg_rule_scroll_text);
   WND_Clear (X_mg_trans_scroll_text);
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
      IF id = X_mg_rule_sel_list THEN BEGIN
         LDMRULES_RuleNumber(index, str_array[i], len);
         RuleArray[index] := TRUE;
      END
      ELSE BEGIN
         LDMRULES_TransformationNumber(index, str_array[i], len);
         TransArray[index] := TRUE;
      END;
   END;

END {HandleBreakpoints};


PROCEDURE DebugMgenerator_Init;
BEGIN
   If Not GlobDef_GetBatchMode Then Begin
      ResetArrays;
      WND_Clear (X_mg_rule_sel_list);
      WND_Clear (X_mg_trans_sel_list);

      Trace        := FALSE;
      PlusStree    := FALSE;
      StopAllParse := FALSE;
      InitWindowValues;
      DebugMgenerator_Default;
   End;

END {DebugMgenerator_Init};


PROCEDURE DebugMgenerator_Default;
BEGIN
   StopParse     := FALSE;
   Step          := FALSE;
   LastTriedRule := -1;
   LastTriedTrf  := -1;
   LISTREE_InitSetOfTupleOfStrees(CurStreeTuple);
   LISTREE_InitSetOfStrees(CurStreeSet);

END {DebugMgenerator_Default};


PROCEDURE DebugMgenerator_Reset;
BEGIN
   StopAllParse := FALSE
END {DebugMgenerator_Reset};


PROCEDURE DebugMgenerator_StoreStreeSet(s: LISTREE_SetOfStrees);
BEGIN
   CurStreeSet := s
END {DebugMgenerator_StoreStree};


PROCEDURE DebugMgenerator_StoreStreeTuple(t: LISTREE_TupleOfStrees);
BEGIN
   LISTREE_InitSetOfTupleOfStrees(CurStreeTuple);
   LISTREE_AppendTupleOfStrees(t, CurStreeTuple);
END {DebugMgenerator_StoreStreeTuple};


FUNCTION DebugMgenerator_Trace: BOOLEAN;
BEGIN
   DebugMgenerator_Trace := Trace;
END {DebugMgenerator_Trace};


FUNCTION DebugMgenerator_StopParse: BOOLEAN;
BEGIN
   DebugMgenerator_StopParse := StopParse;
END {DebugMgenerator_StopParse};


FUNCTION DebugMgenerator_StopAllParse: BOOLEAN;
BEGIN
   DebugMgenerator_StopAllParse := StopAllParse;
END {DebugMgenerator_StopAllParse};


FUNCTION DebugMgenerator_PlusStree
                  : BOOLEAN;
BEGIN {DebugMgenerator_PlusStree}
   DebugMgenerator_PlusStree:= PlusStree
END {DebugMgenerator_PlusStree};


FUNCTION DebugMgenerator_Step: BOOLEAN;
BEGIN
   DebugMgenerator_Step := Step;
END {
DebugMgenerator_Step};


FUNCTION DebugMgenerator_RuleBreakPoint(r: INTEGER): BOOLEAN;
BEGIN
   DebugMgenerator_RuleBreakPoint := RuleArray[r]
END {DebugMgenerator_RuleBreakPoint};


FUNCTION DebugMgenerator_TransBreakPoint(r: INTEGER): BOOLEAN;
BEGIN
   DebugMgenerator_TransBreakPoint := TransArray[r]
END {DebugMgenerator_TransBreakPoint};


PROCEDURE DebugMgenerator_LastTriedTrf(r: INTEGER);
BEGIN
   LastTriedTrf := r
END {DebugMgenerator_LastTriedTrf};


PROCEDURE DebugMgenerator_LastTriedRule(r: INTEGER);
BEGIN
   LastTriedRule := r
END {DebugMgenerator_LastTriedRule};


PROCEDURE DebugMgenerator_Menu;
VAR
   stop       : BOOLEAN;
   keys       : array [1..6] of WND_Xid;
   key        : WND_Xid;
   RuleName,
   TransName  : STRING(40);
   lenint     : INTEGER;
BEGIN
   ClearWindow;
   WND_Manage (X_mg_window, X_undefined);

   keys[1] := X_mg_start_button;
   keys[2] := X_mg_step_button;
   keys[3] := X_mg_stop_button;
   keys[4] := - X_mg_treein_button;
   keys[5] := - X_mg_treeout_button;
   keys[6] := X_mg_stopall_button;
   WND_SetKeys (X_mg_window, keys);
   
   keys[1] := X_mg_rule_last_button;
   keys[2] := X_mg_trans_last_button;
   keys[3] := X_undefined;
   stop := FALSE;
   WHILE NOT stop DO BEGIN
      WND_SetKeys (X_mg_window, keys);
      WND_GetKey (key);
      WND_UnsetKeys (keys);
      CASE key OF
      X_mg_start_button,
      X_mg_step_button :
         BEGIN
            Step := (key = X_mg_step_button);
            WND_GetBoolean (X_mg_trace_toggle, Trace);
            WND_GetBoolean (X_mg_tree_toggle, PlusStree);
            IF NOT Step THEN BEGIN
               ResetArrays;
               HandleBreakpoints (X_mg_rule_sel_list);
               HandleBreakpoints (X_mg_trans_sel_list);
            END;
            stop := TRUE;
         END;
      X_mg_stop_button :
         BEGIN
            StopParse := TRUE;
            stop := TRUE;
         END;
      X_mg_treein_button,
      X_mg_treeout_button :
         DebugMgenerator_HandleKey (key);
      X_mg_stopall_button :
         BEGIN
            StopParse := TRUE;
            StopAllParse := TRUE;
            stop := TRUE;
         END;
      X_mg_rule_last_button :
         BEGIN
            IF LastTriedRule = -1 THEN BEGIN
               Error_Write (ERROR_NoLastRule);
            END
            ELSE BEGIN
               LDMRULES_RuleName(1, LastTriedRule, RuleName, lenint);
               WND_SetString (X_mg_rule_scroll_text, RuleName);
            END;
         END;
      X_mg_trans_last_button :
         BEGIN
            IF LastTriedTrf = -1 THEN BEGIN
               Error_Write (ERROR_NoLastRule);
            END
            ELSE BEGIN
               LDMRULES_TransformationName(1, LastTriedTrf, TransName, lenint);
               WND_SetString (X_mg_trans_scroll_text, TransName);
            END;
         END;
      END;
   END;
   IF not Step OR StopParse OR StopAllParse THEN WND_Unmanage (X_mg_window);

END {DebugMgenerator_Menu};

PROCEDURE DebugMgenerator_HandleKey ( key : WND_Xid );
VAR
   screen_nr  : integer;
BEGIN
   CASE key OF
      X_mg_treein_button :
         BEGIN
            IF Entered_tree_loop THEN BEGIN
               screen_nr := DrawTreeSet_Manage (CurStreeTuple, CurStreeSet {= dummy},
                                                1, 1, FALSE, TRUE, X_mg_window);
               IF screen_nr <> -1 THEN BEGIN
                  Loop_AddStopButton (WND_CodeKey(X_trees_ok_button,screen_nr),
                                      X_mg_window, - X_mg_treein_button);
               END;
            END
            ELSE BEGIN
               Entered_tree_loop := TRUE;
               Loop_SetStopButtonProperties (X_mg_window, - X_mg_treein_button);
               DrawTreeSet_Generate (CurStreeTuple, CurStreeSet {= dummy},
                                     1, 1, FALSE, TRUE, X_mg_window);
               Entered_tree_loop := FALSE;
            END;
         END;
      X_mg_treeout_button :
         BEGIN
            IF Entered_tree_loop THEN BEGIN
               screen_nr := DrawTreeSet_Manage (CurStreeTuple {= dummy}, CurStreeSet,
                                  1, 1, TRUE, FALSE, X_mg_window);
               IF screen_nr <> -1 THEN BEGIN
                  Loop_AddStopButton (WND_CodeKey(X_trees_ok_button,screen_nr),
                                      X_mg_window, - X_mg_treeout_button);
               END;
            END
            ELSE BEGIN
               Entered_tree_loop := TRUE;
               Loop_SetStopButtonProperties (X_mg_window, - X_mg_treeout_button);
               DrawTreeSet_Generate (CurStreeTuple {= dummy}, CurStreeSet,
                                     1, 1, TRUE, FALSE, X_mg_window);
               Entered_tree_loop := FALSE;
            END;
         END;
   END;
END {DebugMgenerator_HandleKey};
