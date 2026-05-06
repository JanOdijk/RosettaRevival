(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : GIDDERIV
 *  Creation date   : 4-AUG-1988
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *
 *EMP:::===================================================================*)

pragma C_include('strings.pf');
Export(GIDDERIV);
pragma C_include('debug.pf');
pragma C_include('error.pf');
pragma C_include('log.pf');
pragma C_include('listree.pf');
pragma C_include('ldgetkey.pf');
pragma C_include('ldblex.pf');
pragma C_include('ldgenmrules.pf');
pragma C_include('ldcatsets.pf');
pragma C_include('ldsubsttovar.pf');
pragma C_include('drawstree.pf');
pragma C_include('debugmgenerator.pf');
pragma C_include('globsubst.pf');
pragma C_include('hyperdtree.pf');
pragma C_include('gidderiv.pf');


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
WITH
         STRINGS,
         DEBUG,
         ERROR,
         LOG,
         LIStree,
         LDGetKey,
         LDBlex,
         LDMrules,
         LDGenMrules,
         LDCatSets,
         LDSubstToVar,
         Drawstree,
         DebugMgenerator,
         GlobSubst,
         HyperDtree;


PROGRAM GIDDERIV;

CONST
   HeadArg   = 1;
   MaxSubstRules = 20;

TYPE
   VarIndex        = RECORD
                        index : INTEGER;
                        found : BOOLEAN;
                        hyp   : HyperDtree_pHyperDtree
                     END;
   SetOfVarIndices = ARRAY[1..MaxSubstRules] OF VarIndex;

VAR
   VarIndices : SetOfVarIndices;


PROCEDURE InitSetOfVarIndices(VAR v: SetOfVarIndices); 
BEGIN
END {InitSetOfVarIndices};


PROCEDURE TakeVarIndex(VAR v : INTEGER; VAR f : BOOLEAN; 
                       VAR h : HyperDtree_pHyperDtree; 
                       nrsubst: INTEGER);
BEGIN
   WITH VarIndices[nrsubst] DO BEGIN
      v := index;
      f := found;
      h := hyp
   END;
END {TakeVarIndex};


PROCEDURE AddVarIndex(v : INTEGER; f : BOOLEAN; h: HyperDtree_pHyperDtree; 
                      nrsubst: INTEGER);
BEGIN
   WITH VarIndices[nrsubst] DO BEGIN
      index := v; 
      found := f; 
      hyp := h; 
   END;
END {AddVarIndex};


PROCEDURE MarkVarIndex(v: INTEGER; VAR h: HyperDtree_pHyperDtree;
                       nrsubst: INTEGER);
VAR
   p     : 0..MaxSubstRules;
   found : BOOLEAN;
BEGIN
   p := 0; found := FALSE;
   WHILE ( p < nrsubst) AND (NOT found) DO BEGIN
      p := p+1;
      found := (VarIndices[p].index = v);
      IF found THEN BEGIN
         VarIndices[p].found := TRUE;
         h^.LI^.def := VarIndices[p].hyp
      END;
   END;
END {MarkVarIndex};


PROCEDURE PreProcess(h: HyperDtree_pHyperDtree;
                     nrsubstrules : INTEGER); 
VAR
   hns     : HyperDtree_SetOfHyperNodeElt;
   hnc     : HyperDtree_SetOfHNECluster;
   hn      : HyperDtree_pHyperNodeElt;
   hfirst,
   hnext   : HyperDtree_pHyperDtree;
   args    : HyperDtree_TupleOfHyperDtree;
   htmp    : HyperDtree_pHyperDtree;
   
   itmp    : INTEGER;
   f       : BOOLEAN;

BEGIN
   hnc := h^.Elts;
   HyperDtree_TakeCluster(hns, hnc);
   args := h^.args;
   HyperDtree_TakeFromNode(hn, hns);
   CASE h^.IsRuleNode OF
   TRUE:
      BEGIN
         IF hn^.parameters.index <> -1 THEN BEGIN
            HyperDtree_TakeFromTuple(hfirst, args);
            HyperDtree_TakeFromTuple(hnext, args);

            h^.RuleNodeKind := HyperDtree_SubstRuleNode;
            h^.substituent := hn^.parameters.subst;
            nrsubstrules := nrsubstrules+1;
            AddVarIndex(hn^.parameters.index, FALSE, h, nrsubstrules);
            PreProcess(hfirst, nrsubstrules);
            PreProcess(hnext, nrsubstrules)
            END
         ELSE BEGIN
            h^.RuleNodeKind := HyperDtree_RuleNode;
            WHILE NOT HyperDtree_IsEmptyTuple(args) DO BEGIN
               HyperDtree_TakeFromTuple(hnext, args);
               PreProcess(hnext, nrsubstrules)
            END;
         END;
      END;
   FALSE:
      BEGIN
         IF h^.BasicNodeKind = HyperDtree_VarNode THEN BEGIN
            MarkVarIndex(LDGetKey_Get(Loopholes.Retype(h^.LI^.stree,LISTREE_pStree)), 
                         h, nrsubstrules)
         END
      END
   END;
END {PreProcess};


FUNCTION GetIndex(h: HyperDtree_pHyperDtree): INTEGER;
VAR
   hn  : HyperDtree_pHyperNodeElt;
   hns : HyperDtree_SetOfHyperNodeElt;
   hnc : HyperDtree_SetOfHNECluster;
BEGIN
   hnc := h^.Elts;
   HyperDtree_TakeCluster(hns, hnc);
   HyperDtree_TakeFromNode(hn, hns);
   GetIndex := hn^.parameters.index
END {GetIndex};


PROCEDURE WriteRuleName(sg, r: INTEGER);
VAR
   rname    : STRING(50);
   rlen     : INTEGER;
BEGIN
   LDMRULES_RuleName(sg, r, rname, rlen);
   DEBUG_WriteStr(' IDIOM Rule ', DEBUG_MaxIO, 0, TRUE);
   DEBUG_WriteStr(rname, rlen, 0, TRUE);
   DEBUG_Writeline(TRUE);
END {WriteRuleName};


PROCEDURE WriteTransformationName(sg, t: INTEGER);
VAR
   tname    : STRING(50);
   tlen     : INTEGER;
BEGIN
   LDMRULES_TransformationName(sg, t, tname, tlen);
   DEBUG_WriteStr(' IDIOM Transformation ', DEBUG_MaxIO, 0, TRUE);
   DEBUG_WriteStr(tname, tlen, 0, TRUE);
   DEBUG_Writeline(TRUE);
END {WriteTransformationName};


FUNCTION GIdDeriv_Generate(h: HyperDtree_pHyperDtree): LISTREE_SetOfStrees;


   FUNCTION GIdDeriv_Generator(h: HyperDtree_pHyperDtree): LISTREE_SetOfStrees;
   VAR
      hns          : HyperDtree_SetOfHyperNodeElt;
      hnc          : HyperDtree_SetOfHNECluster;
      hn           : HyperDtree_pHyperNodeElt;
      CurSonElt    : HyperDtree_pHyperNodeElt;
      hfirst       : HyperDtree_pHyperDtree;
      hother       : HyperDtree_pHyperDtree;
      hsubst       : ARRAY[1..2] OF HyperDtree_pHyperDtree;
      args         : HyperDtree_TupleOfHyperDtree;
      
      ts1, ts2,
      nts1, tns, 
      tsfirst,
      tsnext       : LISTREE_SetOfStrees;
      ts           : ARRAY[1..2] OF LISTREE_SetOfStrees;
      tup          : LISTREE_TupleOfStrees;
      tts          : LISTREE_TupleofSetofStrees;
      result       : LISTREE_SetOfStrees;
      t            : LISTREE_pStree;
      tsubst       : LISTREE_pStree;
      tvar         : LISTREE_pStree;

      sg1, 
      elt          : INTEGER;
      params       : LDMRULES_LIparameters;
      success      : BOOLEAN;         
      nrOfargs     : INTEGER;
      substituent  : INTEGER;
      substituee   : INTEGER;
   BEGIN
      LISTREE_InitSetOfStrees(result);
      hnc := h^.Elts;
      HyperDtree_TakeCluster(hns, hnc);
      CASE h^.IsRuleNode OF
      TRUE  : 
	 CASE h^.RuleNodeKind OF
	 HyperDtree_RuleNode:
	    BEGIN
	    IF DebugMgenerator_Trace THEN BEGIN
               DEBUG_WriteStr('  IDIOM Rule Node', DEBUG_MaxIO, 0, TRUE);
   	       DEBUG_Writeline(TRUE);
            END;
	    LISTREE_EmptyTofSofStrees(tts);
            args := h^.args;
	    nrOfargs := 0; success := TRUE;
	    WHILE (nrOfargs < h^.nrOfargs) AND success AND
                  ( NOT DebugMgenerator_StopParse ) DO BEGIN
	       nrOfargs := nrOfargs+1;
	       HyperDtree_TakeFromTuple(hother, args);
	       tsnext := GIdDeriv_Generator(hother);
	       success := LISTREE_StillStrees(tsnext);
	       LISTREE_AddToTofSofStrees(tsnext, tts);
	    END;


	    WHILE (NOT HyperDtree_IsEmptyNode(hns)) AND success AND
                  ( NOT DebugMgenerator_StopParse ) DO BEGIN
	       HyperDtree_TakeFromNode(hn, hns);
	       WITH hn^ DO BEGIN
		  sg1  := sg;
		  elt := R;
		  params := parameters;
	       END;

	       LISTREE_InitCartProdElts(tts);
	       WHILE LISTREE_StillCartProdElts(tts) AND
		     ( NOT DebugMgenerator_StopParse ) DO BEGIN
		  LISTREE_TakeTuplefromCartProd(tup, tts);

                  IF elt > 0 THEN BEGIN
                  (*----------------------------------------------------------*
                   * elt > 0  ==> Meaningful rule
                   *----------------------------------------------------------*)

		     IF DebugMgenerator_RuleBreakPoint(elt) THEN BEGIN
			DebugMGenerator_StoreStreeTuple(tup);
			Debug_WriteStr('IDIOM Breakpoint at: ', DEBUG_MaxIO, 0, TRUE);
			WriteRuleName(sg1, elt);
			DebugMgenerator_Menu;
		     END;
		     IF ( NOT DebugMgenerator_StopParse ) THEN BEGIN
			IF DebugMgenerator_Trace THEN WriteRuleName(sg1, elt);
			tns := LDGenMrules_FR(sg1, elt, params, tup);
			IF DebugMgenerator_Step THEN BEGIN
			   DebugMgenerator_StoreStreeSet(tns);
			   DebugMGenerator_StoreStreeTuple(tup);
			   Debug_WriteStr('IDIOM Executed: ', DEBUG_MaxIO, 0, TRUE);
			   WriteRuleName(sg1, elt);
			   DebugMgenerator_Menu;
			END;
			IF LISTREE_StillStrees(tns) THEN BEGIN
			   WHILE LISTREE_StillStrees(tns) DO BEGIN
			      LISTREE_TakeStree(t, tns);
			      IF DebugMgenerator_PlusStree THEN DRAWSTREE_GenerateTree(t);
			      Loopholes.Retype(t^.LI^.HyperNodeElt,HyperDtree_pHyperNodeElt) := hn;
			      LISTREE_AppendStree(t, result);
			   END
			   END
			ELSE BEGIN
			   IF DebugMgenerator_Trace THEN BEGIN
			      DEBUG_WriteStr('IDIOM No Result', DEBUG_MaxIO, 0, TRUE);
			      DEBUG_WriteLine(TRUE)
			   END
			END;                  
		     END
                     END
                  ELSE IF elt < 0 THEN BEGIN
                     (*----------------------------------------------------------*
                      * elt < 0  ==> Transformation
                      *----------------------------------------------------------*)
		     IF DebugMgenerator_TransBreakPoint(-elt) THEN BEGIN
			DebugMGenerator_StoreStreeTuple(tup);
			Debug_WriteStr('IDIOM Breakpoint at: ', DEBUG_MaxIO, 0, TRUE);
			WriteTransformationName(sg1, -elt);
			DebugMgenerator_Menu;
		     END;
		     IF ( NOT DebugMgenerator_StopParse ) THEN BEGIN
			IF DebugMgenerator_Trace THEN WriteTransformationName(sg1, -elt);
			tns := LDGenMrules_FT(sg1, -elt, tup);
			IF DebugMgenerator_Step THEN BEGIN
			   DebugMgenerator_StoreStreeSet(tns);
			   DebugMGenerator_StoreStreeTuple(tup);
			   Debug_WriteStr('IDIOM Executed: ', DEBUG_MaxIO, 0, TRUE);
			   WriteTransformationName(sg1, -elt);
			   DebugMgenerator_Menu;
			END;
			IF LISTREE_StillStrees(tns) THEN BEGIN
			   WHILE LISTREE_StillStrees(tns) DO BEGIN
			      LISTREE_TakeStree(t, tns);
			      IF DebugMgenerator_PlusStree THEN DRAWSTREE_GenerateTree(t);
			      Loopholes.Retype(t^.LI^.HyperNodeElt,HyperDtree_pHyperNodeElt) := hn;
			      LISTREE_AppendStree(t, result);
			   END
			   END
			ELSE BEGIN
			   IF DebugMgenerator_Trace THEN BEGIN
			      DEBUG_WriteStr('IDIOM No Result', DEBUG_MaxIO, 0, TRUE);
			      DEBUG_WriteLine(TRUE)
			   END
			END;                  
		     END
                     END
                  ELSE IF elt = 0 THEN BEGIN
                     t := Loopholes.Retype(h^.LI^.stree,LISTREE_pStree);
                     LISTREE_AppendStree(t, result)
                  END
               END
	    END
	    END;
	 HyperDtree_SubstRuleNode :
	    BEGIN
            IF DebugMgenerator_Trace THEN BEGIN
	       DEBUG_WriteStr('  IDIOM Subst Rule Node', DEBUG_MaxIO, 0, TRUE);
	       DEBUG_Writeline(TRUE);
            END;
            substituent := h^.substituent;
            substituee  := 3-substituent;
            args := h^.args;
	    HyperDtree_TakeFromTuple(hsubst[1], args);
	    HyperDtree_TakeFromTuple(hsubst[2], args);
	       
            IF ( substituent = HeadArg ) AND 
               ( NOT DebugMgenerator_StopParse ) THEN BEGIN          

               ts1 := GIdDeriv_Generator(hsubst[substituent]);

	       WHILE (NOT HyperDtree_IsEmptyNode(hns)) AND
                     ( NOT DebugMgenerator_StopParse ) DO BEGIN
		  HyperDtree_TakeFromNode(hn, hns);
		  WITH hn^ DO BEGIN
		     sg1  := sg;
		     elt := R;
		     params := parameters;
		  END;

                  ts[substituent] := ts1;

                  WHILE LISTREE_StillStrees(ts[substituent]) AND
                        ( NOT DebugMgenerator_StopParse ) DO BEGIN
                     LISTREE_EmptyTofSofStrees(tts);
                     LISTREE_TakeStree(tsubst, ts[substituent]);
                     LDSubstToVar_Copy(tsubst, tvar, GetIndex(h));
                     h^.LI^.stree := Loopholes.Retype(tvar,HyperDtree_pStree);
                     GlobSubst_Push(GetIndex(h), tsubst);

                     ts[substituee] := GIdDeriv_Generator(hsubst[substituee]);

                     IF LISTREE_StillStrees(ts[substituee]) AND
                        ( NOT DebugMgenerator_StopParse ) THEN BEGIN

			LISTREE_InitSetOfStrees(tsfirst);
			LISTREE_AppendStree(tsubst, tsfirst);
			LISTREE_AddToTofSofStrees(tsfirst, tts);
			LISTREE_AddToTofSofStrees(ts[substituee], tts);

			LISTREE_InitCartProdElts(tts);
			WHILE LISTREE_StillCartProdElts(tts) AND
                              ( NOT DebugMgenerator_StopParse ) DO BEGIN
			   LISTREE_TakeTuplefromCartProd(tup, tts);
                           IF DebugMgenerator_RuleBreakPoint(elt) THEN BEGIN
                              DebugMGenerator_StoreStreeTuple(tup);
                              Debug_WriteStr('IDIOM Breakpoint at: ', DEBUG_MaxIO, 0, TRUE);
                              WriteRuleName(sg1, elt);
                              DebugMgenerator_Menu;
                           END;
                           IF ( NOT DebugMgenerator_StopParse ) THEN BEGIN
                              IF DebugMgenerator_Trace THEN WriteRuleName(sg1, elt);
			      tns := LDGenMrules_FR(sg1, elt, params, tup);
                              IF DebugMgenerator_Step THEN BEGIN
                                  DebugMgenerator_StoreStreeSet(tns);
                                  DebugMGenerator_StoreStreeTuple(tup);
                                  Debug_WriteStr('IDIOM Executed: ', DEBUG_MaxIO, 0, TRUE);
                                  WriteRuleName(sg1, elt);
                                  DebugMgenerator_Menu;
                              END;
			      IF LISTREE_StillStrees(tns) THEN BEGIN
				 WHILE LISTREE_StillStrees(tns) DO BEGIN
				    LISTREE_TakeStree(t, tns);
				    IF DebugMgenerator_PlusStree THEN DRAWSTREE_GenerateTree(t);
				    Loopholes.Retype(t^.LI^.HyperNodeElt,HyperDtree_pHyperNodeElt) := hn;
				    LISTREE_AppendStree(t, result);
				 END
				 END
			      ELSE BEGIN
				 IF DebugMgenerator_Trace THEN BEGIN
				    DEBUG_WriteStr('IDIOM No Result', DEBUG_MaxIO, 0, TRUE);
				    DEBUG_WriteLine(TRUE)
				 END
			      END
                           END
			END;                  
                     END;
                     GlobSubst_Pop;
		  END;
               END
               END
            ELSE IF (substituee = HeadArg) AND
                 ( NOT DebugMgenerator_StopParse ) THEN BEGIN

               ts[substituent] := GIdDeriv_Generator(hsubst[substituent]);

	       WHILE LISTREE_StillStrees(ts[substituent]) AND
                     ( NOT DebugMgenerator_StopParse ) DO BEGIN
		  LISTREE_TakeStree(tsubst, ts[substituent]);
		  LDSubstToVar_Copy(tsubst, tvar, GetIndex(h));
		  h^.LI^.stree := Loopholes.Retype(tvar,HyperDtree_pStree);
                  GlobSubst_Push(GetIndex(h), tsubst);

		  ts1 := GIdDeriv_Generator(hsubst[substituee]);

                  hnc := h^.Elts;
                  HyperDtree_TakeCluster(hns, hnc);
		  WHILE (NOT HyperDtree_IsEmptyNode(hns)) AND
                        ( NOT DebugMgenerator_StopParse ) DO BEGIN
		     HyperDtree_TakeFromNode(hn, hns);
		     WITH hn^ DO BEGIN
			sg1  := sg;
			elt := R;
			params := parameters;
		     END;

                     ts[substituee] := ts1;

                     IF LISTREE_StillStrees(ts[substituee]) AND
                        ( NOT DebugMgenerator_StopParse ) THEN BEGIN

			LISTREE_EmptyTofSofStrees(tts);
			LISTREE_InitSetOfStrees(tsnext);
			LISTREE_AppendStree(tsubst, tsnext);
			LISTREE_AddToTofSofStrees(ts[substituee], tts);
			LISTREE_AddToTofSofStrees(tsnext, tts);

			LISTREE_InitCartProdElts(tts);
			WHILE LISTREE_StillCartProdElts(tts) AND
                              ( NOT DebugMgenerator_StopParse ) DO BEGIN
			   LISTREE_TakeTuplefromCartProd(tup, tts);
                           IF DebugMgenerator_RuleBreakPoint(elt) THEN BEGIN
                              DebugMGenerator_StoreStreeTuple(tup);
                              Debug_WriteStr('IDIOM Breakpoint at: ', DEBUG_MaxIO, 0, TRUE);
                              WriteRuleName(sg1, elt);
                              DebugMgenerator_Menu;
                           END;
                           IF ( NOT DebugMgenerator_StopParse ) THEN BEGIN
                              IF DebugMgenerator_Trace THEN WriteRuleName(sg1, elt);
			      tns := LDGenMrules_FR(sg1, elt, params, tup);
                              IF DebugMgenerator_Step THEN BEGIN
                                 DebugMgenerator_StoreStreeSet(tns);
                                 DebugMGenerator_StoreStreeTuple(tup);
                                 Debug_WriteStr('IDIOM Executed: ', DEBUG_MaxIO, 0, TRUE);
                                 WriteRuleName(sg1, elt);
                                 DebugMgenerator_Menu;
                              END;
			      IF LISTREE_StillStrees(tns) THEN BEGIN
				 WHILE LISTREE_StillStrees(tns) DO BEGIN
				    LISTREE_TakeStree(t, tns);
				    IF DebugMgenerator_PlusStree THEN DRAWSTREE_GenerateTree(t);
				    Loopholes.Retype(t^.LI^.HyperNodeElt,HyperDtree_pHyperNodeElt) := hn;
				    LISTREE_AppendStree(t, result);
				 END
				 END
			      ELSE BEGIN
				 IF DebugMgenerator_Trace THEN BEGIN
				    DEBUG_WriteStr('IDIOM No Result', DEBUG_MaxIO, 0, TRUE);
				    DEBUG_WriteLine(TRUE)
				 END
			      END
                           END
			END;                  
                     END
		  END;
                  GlobSubst_Pop;
               END
            END;
            END
	 END;
      FALSE :
         CASE h^.BasicNodeKind OF
         HyperDtree_BasicNode:
            BEGIN
            IF DebugMgenerator_Trace THEN BEGIN
               DEBUG_WriteStr('  IDIOM Basic Node', DEBUG_MaxIO, 0, TRUE);
               DEBUG_Writeline(TRUE);
            END;
	    WHILE (NOT HyperDtree_IsEmptyNode(hns)) DO BEGIN
	       HyperDtree_TakeFromNode(hn, hns);
               IF hn^.key > 0 THEN BEGIN
                  t := LDBLEX_Read(hn^.key);
                  IF DebugMgenerator_PlusStree THEN DRAWSTREE_GenerateTree(t);
                  Loopholes.Retype(t^.LI^.HyperNodeElt,HyperDtree_pHyperNodeElt):= hn;
                  LISTREE_AppendStree(t, result)
                  END
               ELSE IF hn^.key = 0 THEN BEGIN
                  t := Loopholes.Retype(h^.LI^.stree,LISTREE_pStree);
                  LISTREE_AppendStree(t, result)
               END;
            END
	    END;
	 HyperDtree_VarNode:
	    BEGIN
	    (*----------------------------------------------------------*
	     * Here the Pre-action "technique" is being applied. 
	     * It is assumed that the field h^.LI^.stree was assigned a 
	     *   value previously. Furthermore it is
	     * assumed that a `Var_node' leave of a hyper-dtree 
	     * contains just one single hypernode element.
	     *----------------------------------------------------------*)
            t := Loopholes.Retype(h^.LI^.def^.LI^.stree,LISTREE_pStree);
	    HyperDtree_TakeFromNode(hn, hns);
            IF DebugMgenerator_Trace THEN BEGIN
               DEBUG_WriteStr('  IDIOM Var Node, index', DEBUG_MaxIO, 0, TRUE);
               DEBUG_WriteInteger(hn^.index, 5, TRUE);
               DEBUG_Writeline(TRUE);
            END;
	    Loopholes.Retype(t^.LI^.HyperNodeElt,HyperDtree_pHyperNodeElt) := hn;
            IF DebugMgenerator_PlusStree THEN DRAWSTREE_GenerateTree(t);
	    LISTREE_AppendStree(t, result);
	    END
         END
      END;

      IF DebugMgenerator_StopParse THEN LISTREE_InitSetOfStrees(result);

      GIdDeriv_Generator := result;
   END {GIdDeriv_Generator};

VAR
   tos : LISTREE_SetOfStrees;
  
BEGIN {GIdDeriv_Generate}
   LISTREE_InitSetOfStrees(tos);
   InitSetOfVarIndices(VarIndices);
   PreProcess(h, 0);

   GIdDeriv_Generate := GIdDeriv_Generator(h)

END {GIdDeriv_Generate};

