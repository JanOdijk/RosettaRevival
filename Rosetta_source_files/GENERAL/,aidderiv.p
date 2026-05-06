(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : AIDDERIV
 *  Creation date   : 4-AUG-1988
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *
 *EMP:::===================================================================*)

pragma C_Include('strings.pf');
Export(AIDDERIV);
pragma C_include('debug.pf');
pragma C_include('error.pf');
pragma C_include('log.pf');
pragma C_include('listree.pf');
pragma C_include('ldgetkey.pf');
pragma C_include('ldblex.pf');
pragma C_include('ldmrules.pf');
pragma C_include('ldanmrules.pf');
pragma C_include('ldcatsets.pf');
pragma C_include('ldsubsttovar.pf');
pragma C_include('drawstree.pf');
pragma C_include('debugmparser.pf');
pragma C_include('globsubst.pf');
pragma C_include('hyperdtree.pf');
pragma C_include('aidderiv.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM AIDDERIV;
WITH     STRINGS,
         DEBUG,
         ERROR,
         LOG,
         LIStree,
         LDGetKey,
         LDBlex,
         LDMrules,
         LDAnMrules,
         LDCatSets,
         LDSubstToVar,
         Drawstree,
         DebugMparser,
         GlobSubst,
         HyperDtree;



  FUNCTION AIdDeriv_Analyse(VAR d: HyperDtree_pHyperDtree;
                                     t:  LIStree_pStree): BOOLEAN;

   VAR
      stop,
      sonsOkee : BOOLEAN;
      params   : LDMrules_LIParameters;
      tns      : LISTREE_SetOfTupleOfStrees;
      ttmp,
      tn       : LISTREE_TupleOfStrees;
      tsubst,
      t1, ti   : LISTREE_pStree;
      d1       : HyperDtree_pHyperDtree;
      args     : HyperDtree_TupleOfHyperDtree;
      sg,
      elt      : INTEGER;
      rulename : STRING(50);
      rulelen  : INTEGER;
      trfname  : STRING(50);
      trflen   : INTEGER;
      RuleNode : HyperDtree_pHyperNodeElt;
      ClusterSet : HyperDtree_SetOfHNECluster;
      RuleSet  : HyperDtree_SetOfHyperNodeElt;
      substituent    : INTEGER;
      dumbonus : INTEGER;

   BEGIN
      IF DebugMparser_PlusStree THEN DRAWSTREE_GenerateTree(t);

      ClusterSet := d^.Elts;
      HyperDtree_TakeCluster(RuleSet, ClusterSet);
      d^.LI^.stree := NIL;
      stop := FALSE;

      WHILE NOT HyperDtree_IsEmptyNode(RuleSet) AND NOT stop DO BEGIN

	 HyperDtree_TakeFromNode(RuleNode, RuleSet);
         
         (*----------------------------------------------------------------*
          * Inspect basic expressions
          *----------------------------------------------------------------*)
	 IF (RuleNode^.nodekind = HyperDtree_BasicNode ) AND
            (RuleNode^.key > 0 ) THEN BEGIN
            
            IF LDCatSets_BlexCat(t^.cat) THEN BEGIN
               stop := LDGETKEY_Get(t) = RuleNode^.key
            END;
         END;            

         (*----------------------------------------------------------------*
          * Instantiate basic expression, variable or complex expression
          *----------------------------------------------------------------*)
	 IF (RuleNode^.nodekind = HyperDtree_BasicNode ) AND
            (RuleNode^.key = 0 ) THEN BEGIN
            stop := TRUE;
            d^.LI^.stree := Loopholes.Retype(t,HyperDtree_pStree)
         END;            

         (*----------------------------------------------------------------*
          * Inspect variables
          *----------------------------------------------------------------*)
	 IF (RuleNode^.nodekind = HyperDtree_VarNode ) AND
            (RuleNode^.index = 0 ) THEN BEGIN
            
            IF LDCatSets_VarCatSet(t^.cat) THEN BEGIN
               stop := TRUE;
               d^.LI^.stree := Loopholes.Retype(t,HyperDtree_pStree)
            END;
         END;            

         (*----------------------------------------------------------------*
          * Try to apply rules 
          *----------------------------------------------------------------*)
	 IF (RuleNode^.nodekind = HyperDtree_RuleNode ) AND
            (RuleNode^.R > 0 ) AND (NOT DebugMparser_StopParse) THEN BEGIN
            elt := RuleNode^.R; sg := -1;
	    LDMRULES_RuleName(sg, elt, rulename, rulelen);
            IF DebugMparser_RuleBreakPoint(elt) THEN BEGIN
               DebugMparser_StoreStree(t);
	       DEBUG_WriteStr('IDIOM BreakPoint at Rule: ', DEBUG_MaxIO, 0, TRUE);
	       DEBUG_WriteStr(rulename, rulelen, 0, TRUE);
	       DEBUG_WriteLine(TRUE);
               DebugMparser_Menu;
            END;
            IF NOT DebugMparser_StopParse THEN BEGIN
	       IF DebugMparser_Trace THEN BEGIN
		  DEBUG_WriteStr('   IDIOM Rule: ', DEBUG_MaxIO, 0, TRUE);
		  DEBUG_WriteStr(rulename, rulelen, 0, TRUE);
		  DEBUG_WriteLine(TRUE);
	       END;
	       tns := LDAnMrules_FRaccent(sg, elt, params, t);
               IF DebugMparser_Step THEN BEGIN
                  DebugMparser_StoreStree(t);
                  DebugMparser_StoreRuleResult(tns);
	          DEBUG_WriteStr('IDIOM Executed Rule: ', DEBUG_MaxIO, 0, TRUE);
	          DEBUG_WriteStr(rulename, rulelen, 0, TRUE);
	          DEBUG_WriteLine(TRUE);
                  DebugMparser_Menu;
               END;
	       WHILE LISTREE_StillTupleOfStrees(tns) AND NOT stop DO BEGIN
		  LISTREE_TakeTupleOfStreesbonus(tn, tns, dumbonus);

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

    	          sonsOkee := TRUE;
                  args := d^.args;
		  WHILE LISTREE_StillElements(tn) AND sonsOkee DO BEGIN
                     LISTREE_ExtractFromTuple(ti, tn);
                     HyperDtree_TakeFromTuple(d1, args);
		     sonsOkee := AIdDeriv_Analyse(d1, ti);
		  END;
		  IF sonsOkee THEN BEGIN
                     stop := TRUE;
                     RuleNode^.parameters := params
                  END;
                  IF params.index <> -1 THEN GlobSubst_Pop;
	       END;
            END
	 END;

      (*----------------------------------------------------------------*
       * Finally, try to apply transformations 
       *----------------------------------------------------------------*)
	 IF (RuleNode^.nodekind = HyperDtree_RuleNode ) AND
            (RuleNode^.R < 0 ) AND (NOT DebugMparser_StopParse) THEN BEGIN
            elt := -RuleNode^.R; sg := -1;
	    LDMRULES_TransformationName(sg, elt, trfname, trflen);
            IF DebugMparser_TransBreakPoint(elt) THEN BEGIN
               DebugMparser_StoreStree(t);
	       DEBUG_WriteStr('IDIOM BreakPoint at Transformation: ', DEBUG_MaxIO, 0, TRUE);
	       DEBUG_WriteStr(trfname, trflen, 0, TRUE);
	       DEBUG_WriteLine(TRUE);
               DebugMparser_Menu;
            END;
            IF NOT DebugMparser_StopParse THEN BEGIN
	       IF DebugMparser_Trace THEN BEGIN
		  DEBUG_WriteStr('   IDIOM Transformation: ', DEBUG_MaxIO, 0, TRUE);
		  DEBUG_WriteStr(trfname, trflen, 0, TRUE);
		  DEBUG_WriteLine(TRUE);
	       END;
	       tns := LDAnMrules_FTaccent(sg, elt, t);
               IF DebugMparser_Step THEN BEGIN
                  DebugMparser_StoreRuleResult(tns);
                  DebugMparser_StoreStree(t);
	          DEBUG_WriteStr('IDIOM Executed Transformation: ', DEBUG_MaxIO, 0, TRUE);
	          DEBUG_WriteStr(trfname, trflen, 0, TRUE);
	          DEBUG_WriteLine(TRUE);
                  DebugMparser_Menu;
               END;
	       WHILE LISTREE_StillTupleOfStrees(tns) AND (NOT stop) DO BEGIN
		  LISTREE_TakeTupleOfStreesBonus(tn, tns, dumbonus);

		  IF LISTREE_StillElements(tn) THEN BEGIN
		     LISTREE_ExtractFromTuple(t1, tn);
                     args := d^.args;
                     HyperDtree_TakeFromTuple(d1, args);
		     stop := AIdDeriv_Analyse(d1, t1);
		  END;
	       END;
            END;
	 END;
      END;

      IF DebugMparser_StopParse THEN stop := FALSE;
      AIdDeriv_Analyse := stop;

   END {AIdDeriv_Analyse};


