(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : MPARSER
 *  Creation date   : 22-OCT-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *
 *EMP:::===================================================================*)

Export(MPARSER);
pragma C_include('debug.pf');
pragma C_include('globdef.pf');
pragma C_include('error.pf');
pragma C_include('log.pf');
pragma C_include('mem.pf');
pragma C_include('listree.pf');
pragma C_include('superdtree.pf');
pragma C_include('ldgetkey.pf');
pragma C_include('interfaces.pf');
pragma C_include('interface2.pf');
pragma C_include('interface3.pf');
pragma C_include('ldmrules.pf');
pragma C_include('limrules.pf');
pragma C_include('ldanmrules.pf');
pragma C_include('ldcatsets.pf');
pragma C_include('drawstree.pf');
pragma C_include('awhere.pf');
pragma C_include('wnd.pf');
pragma C_include('debugmparser.pf');
pragma C_include('mpstatistics.pf');
pragma C_include('globsubst.pf');
pragma C_include('mparser.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM MPARSER;
WITH DEBUG, GLOBDEF, ERROR, LOG, MEM, LISTREE, SUPERDTREE, LDGETKEY, 
INTERFACES, INTERFACE2, INTERFACE3, LDMRULES, LIMRULES, LDANMRULES,
LDCATSETS, DRAWSTREE, AWHERE, WND, DEBUGMPARSER, MPSTATISTICS, GLOBSUBST;

FUNCTION MPARSER_body(interf: INTERFACES_IfDescr): INTERFACES_IfDescr;

VAR
   TriedRules   : INTEGER;
   AppliedRules : INTEGER;
   TreeRules    : INTEGER;
   TriedFilters   : INTEGER;
   AppliedFilters : INTEGER;
   TreeFilters    : INTEGER;


   FUNCTION MParser(t:LIStree_pStree; lev: INTEGER)
            : SuperDtree_SetOfSuperDtree;
   FORWARD;

   FUNCTION MParserSG(sg:LDMrules_SubGrammarIndex; t:LIStree_pStree;
                      predecessors: LIMrules_CeRuleSet;
                      lev: INTEGER)
            : SuperDtree_SetOfSuperDtree;
   FORWARD;


   FUNCTION MParser{t:LIStree_pStree; lev: INTEGER)
            : SuperDtree_SetOfSuperDtree};
   VAR
      sg : INTEGER;
      ds : SuperDtree_SetOfSuperDtree;
      d  : SuperDtree_pSuperDtree;
      result   : SuperDtree_SetOfSuperDtree;
      presult  : SuperDtree_pSetOfSuperDtree;
   BEGIN
      IF DebugMparser_Trace THEN BEGIN
         DEBUG_WriteStr('->Mparser: ', DEBUG_MaxIO, 0, TRUE);
         DEBUG_WriteLine(TRUE);
      END;
      SuperDtree_EmptySet(result);
      IF FALSE {LISTREE_IsParseResultSaved(t)} AND
         NOT DebugMparser_StopParse THEN BEGIN
         IF DebugMparser_Trace THEN BEGIN
            DEBUG_WriteStr('Used old parser result ', DEBUG_MaxIO, 0, TRUE);
            DEBUG_WriteLine(TRUE);
         END;
         presult := LoopHoles.Retype(LISTREE_ReturnParseResult(t),
                                     SuperDtree_pSetOfSuperDtree);
         result := presult^
         END
      ELSE BEGIN
	 FOR sg := LDMrules_MinSubGrammarIndex TO LDMrules_MaxSubGrammarIndex DO BEGIN
	    IF LDAnMrules_InExportedCats(sg, t^.cat) AND 
               NOT DebugMparser_StopParse THEN BEGIN
	       ds := MParserSG(sg, t, LIMrules_SGLast(sg), lev);
	       WHILE NOT SuperDtree_IsEmptySet(ds) DO BEGIN
		  SuperDtree_TakeFromSet(d, ds);
                  d^.EndOfSg := TRUE;
		  SuperDtree_AddToSet(d, result)
	       END
	    END
	 END;

      (*-------------------------------------------------------------------*
       * check if the current S-tree is a basic expression.
       *-------------------------------------------------------------------*)
	 IF LDCatSets_BlexCat(t^.cat) AND
            NOT DebugMparser_StopParse THEN BEGIN
            IF DebugMparser_Trace THEN BEGIN
	       DEBUG_WriteStr('Basic Expression', DEBUG_MaxIO, 0, TRUE);
	       DEBUG_WriteLine(TRUE);
            END;
            IF LISTREE_IsParseResultSaved(t) THEN BEGIN
               IF DebugMparser_Trace THEN BEGIN
                  DEBUG_WriteStr('Used old parser result ', DEBUG_MaxIO, 0, TRUE);
                  DEBUG_WriteLine(TRUE);
               END;
               presult := LoopHoles.Retype(LISTREE_ReturnParseResult(t),
                                     SuperDtree_pSetOfSuperDtree);
               result := presult^
               END
            ELSE BEGIN
               Mem_BottomDefault;
	       SuperDtree_NewBasicSuperDtree(d, LDGetKey_Get(t));
	       SuperDtree_AddToSet(d, result);

   	       SuperDtree_SaveOrigin(LoopHoles.Retype(t,SuperDtree_pStree), d);

               presult := SuperDtree_MakeSetOfSuperDtree; presult^ := result;
               Mem_TopDefault;
               LISTREE_SaveParseResult(LoopHoles.Retype(presult,
                               LISTREE_pSetOfSuperDtree), t);
           END
	 END;       

      (*-------------------------------------------------------------------*
       * check if the current S-tree is a variable.
       *-------------------------------------------------------------------*)
	 IF LDCatSets_VarCatSet(t^.cat) AND
            NOT DebugMparser_StopParse THEN BEGIN
            IF DebugMparser_Trace THEN BEGIN
	       DEBUG_WriteStr('Variable', DEBUG_MaxIO, 0, TRUE);
	       DEBUG_WriteLine(TRUE);
            END;
	    SuperDtree_NewVarSuperDtree(d, t^.cat, LDGetKey_Get(t));
	    SuperDtree_AddToSet(d, result);
	 END;

      END;

      IF DebugMparser_StopParse THEN SuperDtree_EmptySet(result);
      Mparser := result;

      IF DebugMparser_Trace THEN BEGIN
         DEBUG_WriteStr('<-Mparser: ', DEBUG_MaxIO, 0, TRUE);
         DEBUG_WriteLine(TRUE);
      END;
   END {MParser};


   FUNCTION MParserSG{sg:LDMrules_SubGrammarIndex; t:LIStree_pStree;
                      predecessors: LIMrules_CeSuccType;
                      lev: INTEGER)
            : SuperDtree_SetOfSuperDtree};
   VAR
      rulebonus: INTEGER;
      sonsOkee : BOOLEAN;
      params   : LDMrules_LIParameters;
      tns      : LISTREE_SetOfTupleOfStrees;
      ttmp,
      tn       : LISTREE_TupleOfStrees;
      tsubst,
      t1, ti   : LISTREE_pStree;
      d1, ds   : SuperDtree_SetOfSuperDtree;
      d        : SuperDtree_pSuperDtree;
      result   : SuperDtree_SetOfSuperDtree;
      args     : SUPERDTREE_TupleOfSuperSon;
      nrOfargs : INTEGER;
      elt      : INTEGER;
      k        : LDMRULES_CtrlExprKind;
      sgname   : STRING(50);
      sglen    : INTEGER;
      rulename : STRING(50);
      rulelen  : INTEGER;
      trfname  : STRING(50);
      trflen   : INTEGER;
      CorrectPath    : BOOLEAN;
      SaveTreeRules  : INTEGER;
      SaveTreeFilters: INTEGER;
      substituent    : INTEGER;
      stackptr       : Mem_StackPtr;

   BEGIN

      Mem_MarkDefault(stackptr);

      IF DebugMparser_Trace THEN BEGIN
         LDMRULES_SubgrammarName(sg, sgname, sglen);
         DEBUG_WriteStr('->MparserSG: ', DEBUG_MaxIO, 0, TRUE);
         DEBUG_WriteStr(sgname, sglen, 0, TRUE);
         DEBUG_WriteLine(TRUE);
      END;
      SuperDtree_EmptySet(result);

      (*-------------------------------------------------------------------*
       * If this is the beginning of subgrammar sg, continue with the next
       * subgrammar.
       *-------------------------------------------------------------------*)
      IF LIMrules_BeginOfSubGrammar(predecessors) AND 
         NOT DebugMparser_StopParse THEN BEGIN
         IF DebugMparser_Trace THEN BEGIN
	    DEBUG_WriteStr('End of subgrammar, trying new one', DEBUG_MaxIO, 0, TRUE);
	    DEBUG_WriteLine(TRUE);
         END;
	 ds := MParser(t, lev);
	 WHILE  NOT SuperDtree_IsEmptySet(ds) DO BEGIN
	    SuperDtree_TakeFromSet(d, ds);
	    SuperDtree_AddToSet(d, result);
{
	    SuperDtree_SaveOrigin(t::SuperDtree_pStree, d)
}
	 END
      END;

      WHILE LIMrules_StillRules(predecessors) AND
            NOT DebugMparser_StopParse DO BEGIN

	 LIMrules_TakeRule(elt, k, predecessors);

         (*----------------------------------------------------------------*
          * Try to apply all rules in the predecessor set 
          *----------------------------------------------------------------*)
	 IF (k = rule) AND (NOT DebugMparser_StopParse) THEN BEGIN
            IF DebugMparser_RuleBreakPoint(elt) THEN BEGIN
	       LDMRULES_RuleName(sg, elt, rulename, rulelen);
               DebugMparser_StoreStree(t);
	       DEBUG_WriteStr('BreakPoint at Rule: ', DEBUG_MaxIO, 0, TRUE);
	       DEBUG_WriteStr(rulename, rulelen, 0, TRUE);
	       DEBUG_WriteLine(TRUE);
               DebugMparser_Menu;
            END;
            IF NOT DebugMparser_StopParse THEN BEGIN
	       IF DebugMparser_Trace THEN BEGIN
  	          LDMRULES_RuleName(sg, elt, rulename, rulelen);
		  DEBUG_WriteStr('   Rule: ', DEBUG_MaxIO, 0, TRUE);
		  DEBUG_WriteStr(rulename, rulelen, 0, TRUE);
		  DEBUG_WriteLine(TRUE);
	       END;
               params.index := lev;
	       tns := LDAnMrules_FRaccent(sg, elt, params, t);
               IF DebugMparser_Step THEN BEGIN
                  DebugMparser_StoreStree(t);
                  DebugMparser_StoreRuleResult(tns);
	          DEBUG_WriteStr('Executed Rule: ', DEBUG_MaxIO, 0, TRUE);
  	          LDMRULES_RuleName(sg, elt, rulename, rulelen);
	          DEBUG_WriteStr(rulename, rulelen, 0, TRUE);
	          DEBUG_WriteLine(TRUE);
                  DebugMparser_Menu;
               END;
               TriedRules := TriedRules+1;
               CorrectPath := FALSE;
               IF { LISTREE_StillTupleOfStrees(tns)} tns.first <> NIL THEN BEGIN
                  AppliedRules := AppliedRules+1;
               END;
{@@}	       WHILE {LISTREE_StillTupleOfStrees(tns)} tns.first <> NIL DO BEGIN
		  LISTREE_TakeTupleOfStreesBonus(tn, tns, rulebonus);

                  (*----------------------------------------------------------*
                   * If the current rule is a substitution rule, the substituent
                   * is stored and becomes globally available.
                   *----------------------------------------------------------*)
                  tsubst := NIL;
                  IF params.index <> -1 THEN BEGIN
                     ttmp := tn; substituent := 0; 
                     WHILE substituent <> params.subst DO BEGIN
                        substituent := substituent+1;
                        LISTREE_ExtractFromTuple(tsubst, ttmp);
                     END;
                     GlobSubst_Push(params.index, tsubst)
                  END;

		  IF LISTREE_StillElements(tn) THEN BEGIN
                     SaveTreeRules := TreeRules;
		     LISTREE_ExtractFromTuple(t1, tn);
		     d1 := MParserSG(sg, t1, LIMrules_Predecessors(elt, rule),
                                     lev+1);
		     IF Not SuperDtree_IsEmptySet(d1) THEN BEGIN
		     sonsOkee := TRUE; nrOfArgs := 1;
		     SuperDtree_EmptyTupleOfSuperSon(args);
		     SuperDtree_AddToTupleOfSuperSon(d1, args);
		     WHILE LISTREE_StillElements(tn) AND sonsOkee DO BEGIN
			LISTREE_ExtractFromTuple(ti, tn);
			ds := MParser(ti, lev+1);
			sonsOkee := NOT SuperDtree_IsEmptySet(ds);
			nrOfargs := nrOfArgs + 1;
			SuperDtree_AddToTupleOfSuperSon(ds, args);
		     END;
		     IF sonsOkee THEN BEGIN
			SuperDtree_NewSuperDtree(d, sg, elt, params);
			d^.args := args;
			d^.nrOfArgs := nrOfArgs;
                        d^.LI^.bonus := rulebonus;
			SuperDtree_AddToSet(d, result); 
{
			SuperDtree_SaveOrigin(t::SuperDtree_pStree, d);
}
                        CorrectPath := TRUE
		        END
                     ELSE TreeRules := SaveTreeRules
		     END
		  END;
                  IF params.index <> -1 THEN GlobSubst_Pop;
	       END;
               IF CorrectPath THEN TreeRules := TreeRules+1
            END
	 END;

      (*----------------------------------------------------------------*
       * Finally, try to apply all transformations in the predecessor set 
       *----------------------------------------------------------------*)
	 IF (k = transformation) AND (NOT DebugMparser_StopParse) THEN BEGIN
            IF DebugMparser_TransBreakPoint(elt) THEN BEGIN
	       LDMRULES_TransformationName(sg, elt, trfname, trflen);
               DebugMparser_StoreStree(t);
	       DEBUG_WriteStr('BreakPoint at Transformation: ', DEBUG_MaxIO, 0, TRUE);
	       DEBUG_WriteStr(trfname, trflen, 0, TRUE);
	       DEBUG_WriteLine(TRUE);
               DebugMparser_Menu;
            END;
            IF NOT DebugMparser_StopParse THEN BEGIN
	       IF DebugMparser_Trace THEN BEGIN
	          LDMRULES_TransformationName(sg, elt, trfname, trflen);
		  DEBUG_WriteStr('   Transformation: ', DEBUG_MaxIO, 0, TRUE);
		  DEBUG_WriteStr(trfname, trflen, 0, TRUE);
		  DEBUG_WriteLine(TRUE);
	       END;
	       tns := LDAnMrules_FTaccent(sg, elt, t);
               IF DebugMparser_Step THEN BEGIN
                  DebugMparser_StoreRuleResult(tns);
                  DebugMparser_StoreStree(t);
	          DEBUG_WriteStr('Executed Transformation: ', DEBUG_MaxIO, 0, TRUE);
	          LDMRULES_TransformationName(sg, elt, trfname, trflen);
	          DEBUG_WriteStr(trfname, trflen, 0, TRUE);
	          DEBUG_WriteLine(TRUE);
                  DebugMparser_Menu;
               END;
               IF LDMRULES_IsFilter(elt) THEN BEGIN
                  TriedFilters := TriedFilters+1
                  END
               ELSE BEGIN
                  TriedRules := TriedRules+1
               END;
               CorrectPath := FALSE;
{@@}           IF {LISTREE_StillTupleOfStrees(tns)} (tns.first <> NIL) AND 
                  (NOT LDMRULES_IsFilter(elt)) THEN BEGIN
                  AppliedRules := AppliedRules+1;
               END;
{@@}           IF ({NOT LISTREE_StillTupleOfStrees(tns)} tns.first = NIL) AND 
                  LDMRULES_IsFilter(elt) THEN BEGIN
                  AppliedFilters := AppliedFilters+1;
               END;
{@@}	       WHILE (tns.first <> NIL) {LISTREE_StillTupleOfStrees(tns)} DO BEGIN
		  LISTREE_TakeTupleOfStreesBonus(tn, tns, rulebonus);
		  IF LISTREE_StillElements(tn) THEN BEGIN
                     SaveTreeRules := TreeRules;
                     SaveTreeFilters := TreeFilters;
		     LISTREE_ExtractFromTuple(t1, tn);
		     d1 := MParserSG(sg, t1, LIMrules_Predecessors(elt, 
                                     transformation), lev);
                     IF SuperDtree_IsEmptySet(d1) THEN BEGIN
                        TreeRules := SaveTreeRules;
                        TreeFilters := SaveTreeFilters;
                     END;
                     IF DebugMparser_PlusTrans AND
                        NOT SuperDtree_IsEmptySet(d1) THEN BEGIN
		        SuperDtree_EmptyTupleOfSuperSon(args);
		        SuperDtree_AddToTupleOfSuperSon(d1, args);
                        params.rulenr := -elt;
                        MEM_newdefault(LoopHoles.SizeOf(INTEGER),
                               LoopHoles.Retype(params.ls,MEM_ptr));
	                SuperDtree_NewSuperDtree(d, sg, -elt, params);
			d^.args := args;
			d^.nrOfArgs := 1;
                        d^.LI^.bonus := rulebonus;
			SuperDtree_AddToSet(d, result); 
                        CorrectPath := TRUE
                        END
                     ELSE BEGIN
     	                WHILE Not SuperDtree_IsEmptySet(d1) DO BEGIN
			   SuperDtree_TakeFromSet(d, d1);
			   SuperDtree_AddToSet(d, result); 
{
			   SuperDtree_SaveOrigin(t::SuperDtree_pStree, d);
}
                           CorrectPath := TRUE
		        END
                     END
		  END
	       END;
               IF CorrectPath THEN BEGIN
                  IF LDMRULES_IsFilter(elt) THEN
                     TreeFilters := TreeFilters+1
                  ELSE
                     TreeRules := TreeRules+1
               END
            END
	 END;
      END;

      IF DebugMparser_StopParse THEN SuperDtree_EmptySet(result);
      MParserSG := result;

      IF SuperDtree_IsEmptySet(result) THEN Mem_ReleaseDefault(stackptr);

      IF DebugMparser_Trace THEN BEGIN
         DEBUG_WriteStr('<-MparserSG: ', DEBUG_MaxIO, 0, TRUE);
         DEBUG_WriteStr(sgname, sglen, 0, TRUE);
         IF SuperDtree_IsEmptySet(result) THEN DEBUG_WriteStr(' empty', 
                                                        DEBUG_MaxIO, 0, TRUE);
         DEBUG_WriteLine(TRUE);
      END;

   END {MParserSG};

  
   FUNCTION RobustMParser(t:LIStree_pStree)
            : SuperDtree_SetOfSuperDtree;
   VAR
      result : SuperDtree_SetOfSuperDtree;
   BEGIN
      SuperDtree_EmptySet(result);
      RobustMParser:= result
   END {RobustMParser};


   FUNCTION ExtractStree(r: LISTREE_pRelNode): BOOLEAN;
   VAR done   : BOOLEAN;
   BEGIN
      done := FALSE;
      WHILE (r <> NIL) AND NOT done DO BEGIN
         done := ExtractStree(r^.node^.sons);
         IF NOT done THEN BEGIN
            r^.node := r^.node^.twin;
            done := NOT r^.node^.LI^.first
         END;
         r := r^.brother
      END;
      ExtractStree := done;
   END {ExtractStree};


   VAR
      if2         : INTERFACE2_SetOfStrees;
      if3         : INTERFACE3_SetOfSuperDtree;
      ifout       : INTERFACES_IfDescr;
      t           : LIStree_pStree;
      ds          : SuperDtree_SetOfSuperDtree;
      d           : SuperDtree_pSuperDtree;
      stillstrees : BOOLEAN;
      Root        : LISTREE_pRelNode;

BEGIN {MPARSER_body}
   DEBUG_WriteStr('->Mparser Body: ', DEBUG_MaxIO, 0, TRUE);
   DEBUG_WriteLine(TRUE);
   if2:= interf.if2;
   SuperDtree_EmptySet(if3);
   Mem_NewDefault(LoopHoles.SizeOf(LISTREE_RelNode), 
                  LoopHoles.Retype(Root,MEM_Ptr));
   Root^.brother := NIL;
   WHILE LIStree_StillStrees(if2) DO BEGIN
      DebugMparser_Default;
      LIStree_TakeStree(t,if2);
      Root^.node := t;
      REPEAT 
         AWhere_NrTreesGet;
         IF DEBUG_Mode THEN BEGIN
            DebugMparser_StoreStree(t);
            DebugMparser_MenuInit;
            DebugMparser_Menu;
            END
         ELSE BEGIN
            DebugMparser_Init
         END;
         GlobSubst_Init;
         AppliedRules := 0;
         TreeRules    := 0;
         TriedRules   := 0;
         AppliedFilters := 0;
         TreeFilters    := 0;
         TriedFilters   := 0;
         MPStatistics_StartCPUClock;
         ds:= MParser(t, 1);
         MPStatistics_StopCPUClock;
         MPStatistics_StoreAppliedRules(AppliedRules);
         MPStatistics_StoreTriedRules(TriedRules);
         MPStatistics_StoreTreeRules(TreeRules);
         MPStatistics_StoreAppliedFilter(AppliedFilters);
         MPStatistics_StoreTriedFilter(TriedFilters);
         MPStatistics_StoreTreeFilter(TreeFilters);
         IF (NOT GlobDef_GetBatchMode) AND (GlobDef_GetInteractionMode) THEN BEGIN
            MPStatistics_Menu;
         END;
         WHILE NOT SuperDtree_IsEmptySet(ds) DO BEGIN
            SuperDtree_TakeFromSet(d,ds);
            SuperDtree_AddToSet(d,if3);
         END {WHILE};
         stillstrees := ExtractStree(Root);
         IF stillstrees THEN t:=Root^.node;
         IF DEBUG_Mode THEN BEGIN
            DebugMparser_MenuExit;
         END;
         DebugMparser_Default;
      UNTIL NOT stillstrees;
   END {WHILE};
   IF (NOT GlobDef_GetBatchMode) AND DEBUG_Mode THEN
      WND_Unmanage (X_mp_window);
   AWhere_NrTreesGet;

   IF SuperDtree_IsEmptySet(if3) THEN BEGIN
         (* Apply robustness methods *)
      if2:= interf.if2;
      SuperDtree_EmptySet(if3);
      WHILE LIStree_StillStrees(if2) DO BEGIN
	 LIStree_TakeStree(t,if2);
	 ds:= RobustMParser(t);
	 WHILE NOT SuperDtree_IsEmptySet(ds) DO BEGIN
	    SuperDtree_TakeFromSet(d,ds);
	    SuperDtree_AddToSet(d,if3)
	 END {WHILE}
      END {WHILE}
   END {IF};

   ifout.level  := 3;
   ifout.if3    := if3;
   MPARSER_body := ifout;
   DEBUG_WriteStr('<-Mparser Body: ', DEBUG_MaxIO, 0, TRUE);
   DEBUG_WriteLine(TRUE);
END {MPARSER_body};

