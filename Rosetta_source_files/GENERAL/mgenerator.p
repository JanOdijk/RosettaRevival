(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : MGenerator
 *  Creation date   : 22-OCT-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *
 *EMP:::===================================================================*)

Export(MGENERATOR);
pragma C_include('debug.pf');
pragma C_include('debugmgenerator.pf');
pragma C_include('error.pf');
pragma C_include('log.pf');
pragma C_include('mem.pf');
pragma C_include('listree.pf');
pragma C_include('hyperdtree.pf');
pragma C_include('ldgetkey.pf');
pragma C_include('interfaces.pf');
pragma C_include('interface6.pf');
pragma C_include('interface5.pf');
pragma C_include('ldmrules.pf');
pragma C_include('limrules.pf');
pragma C_include('ldblex.pf');
pragma C_include('ldgenmrules.pf');
pragma C_include('drawstree.pf');
pragma C_include('ldsubsttovar.pf');
pragma C_include('globsubst.pf');
pragma C_include('mgenerator.pf');


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM MGenerator;
WITH DEBUG, DEBUGMGENERATOR, ERROR, LOG, MEM, LISTREE, HYPERDTREE, LDGETKEY,
     INTERFACES, INTERFACE6, INTERFACE5, LDMRULES, LIMRULES, LDBLEX, 
     LDGENMRULES, DRAWSTREE, LDSUBSTTOVAR, GLOBSUBST;

CONST
   SGtrailer   = -1;
   SGheader    = -1;
   SGRuleNode  = -2;
   HeadArg     = 1;
   MaxSubstRules = 20;

TYPE
   VarIndex        = RECORD
                        index    : INTEGER;
                        hyp      : HyperDtree_pHyperDtree
                     END;
   SetOfVarIndices = ARRAY[1..MaxSubstRules] OF VarIndex;

VAR
   VarIndices   : SetOfVarIndices;
   NrVarIndices : INTEGER;

PROCEDURE InitSetOfVarIndices(VAR v: SetOfVarIndices); 
BEGIN
   NrVarindices := 0;
END {InitSetOfVarIndices};


PROCEDURE AddVarIndex(VAR v : INTEGER; h: HyperDtree_pHyperDtree);
BEGIN
   NrVarindices := NrVarIndices+1;
   WITH VarIndices[NrVarIndices] DO BEGIN
      index := v; 
      hyp   := h; 
   END;
END {AddVarIndex};


PROCEDURE DelVarIndex(VAR v : INTEGER; h: HyperDtree_pHyperDtree);
BEGIN
   NrVarindices := NrVarIndices-1;
END {DelVarIndex};


PROCEDURE MarkVarIndex(VAR v: INTEGER; VAR h: HyperDtree_pHyperDtree);
VAR
   p     : 0..MaxSubstRules;
   found : BOOLEAN;
BEGIN
   p := 0; found := FALSE;
   WHILE ( p < NrVarIndices) AND (NOT found) DO BEGIN
      p := p+1;
      found := (VarIndices[p].index = v);
      IF found THEN BEGIN
         h^.LI^.def := VarIndices[p].hyp
      END;
   END;
END {MarkVarIndex};


PROCEDURE PreProcess(h: HyperDtree_pHyperDtree;
                     VAR v: HyperDtree_VarIndexSet);
VAR
   hnc     : HyperDtree_SetOfHNECluster;
   hns     : HyperDtree_SetOfHyperNodeElt;
   hn      : HyperDtree_pHyperNodeElt;
   hfirst,
   hnext   : HyperDtree_pHyperDtree;
   args    : HyperDtree_TupleOfHyperDtree;
    
   index   : INTEGER;
   vs      : HyperDtree_VarIndexSet;
BEGIN
   v := [];
   hnc := h^.Elts;
   args := h^.args;
   HyperDtree_TakeCluster(hns, hnc);
   HyperDtree_TakeFromNode(hn, hns);
   CASE h^.IsRuleNode OF
   TRUE:
      BEGIN
         IF hn^.parameters.index <> -1 THEN BEGIN
            HyperDtree_TakeFromTuple(hfirst, args);
            HyperDtree_TakeFromTuple(hnext, args);

            h^.RuleNodeKind := HyperDtree_SubstRuleNode;
            h^.substituent := hn^.parameters.subst;
            index := hn^.parameters.index;
            AddVarIndex(index, h);
            hnc := h^.Elts;

            PreProcess(hfirst,vs); v := v+vs;
            PreProcess(hnext,vs); v := v+vs;

            DelVarIndex(index, h);

            END
         ELSE BEGIN
            h^.RuleNodeKind := HyperDtree_RuleNode;
            WHILE NOT HyperDtree_IsEmptyTuple(args) DO BEGIN
               HyperDtree_TakeFromTuple(hnext, args);
               PreProcess(hnext, vs); v := v+vs;
            END;
         END;
      END;
   FALSE:
      BEGIN
         IF h^.BasicNodeKind = HyperDtree_VarNode THEN BEGIN
            MarkVarIndex(hn^.index, h);
            h^.LI^.Varindices := [hn^.index];
            v := [hn^.index]
         END
      END
   END;
   h^.LI^.VarIndices := v
END {PreProcess};


FUNCTION SortStrees(s: LISTREE_SetOfStrees): LISTREE_SetOfStrees;
VAR
   sn : LISTREE_SetOfStrees;
   t  : LISTREE_pStree;
BEGIN
   LISTREE_InitSetOfStrees(sn);
   WHILE LISTREE_StillStrees(s) DO BEGIN
      LISTREE_TakeStree(t, s);
      LISTREE_AppendSortStree(t, sn)
   END;
   SortStrees := sn
END {SortOfStrees};


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


PROCEDURE WriteClusterName(sg: INTEGER);
VAR
   sgname   : STRING(50);
   sglen    : INTEGER;
BEGIN
   LDMRULES_SubGrammarName(sg, sgname, sglen);
   DEBUG_WriteStr(' Rules of  ', DEBUG_MaxIO, 0, TRUE);
   DEBUG_WriteStr(sgname, sglen, 0, TRUE);
   DEBUG_Writeline(TRUE);
END {WriteClusterName};


PROCEDURE WriteRuleName(sg, r: INTEGER);
VAR
   sgname   : STRING(50);
   sglen    : INTEGER;
   rname    : STRING(50);
   rlen     : INTEGER;
BEGIN
   LDMRULES_SubGrammarName(sg, sgname, sglen);
   LDMRULES_RuleName(sg, r, rname, rlen);
   DEBUG_WriteStr(' Rule ', DEBUG_MaxIO, 0, TRUE);
   DEBUG_WriteStr(sgname, sglen, 0, TRUE);
   DEBUG_WriteStr(' : ', DEBUG_MaxIO, 0, TRUE);
   DEBUG_WriteStr(rname, rlen, 0, TRUE);
   DEBUG_Writeline(TRUE);
END {WriteRuleName};


PROCEDURE WriteTransformationName(sg, t: INTEGER);
VAR
   sgname   : STRING(50);
   sglen    : INTEGER;
   tname    : STRING(50);
   tlen     : INTEGER;
BEGIN
   LDMRULES_SubGrammarName(sg, sgname, sglen);
   LDMRULES_TransformationName(sg, t, tname, tlen);
   DEBUG_WriteStr(' Transformation ', DEBUG_MaxIO, 0, TRUE);
   DEBUG_WriteStr(sgname, sglen, 0, TRUE);
   DEBUG_WriteStr(' : ', DEBUG_MaxIO, 0, TRUE);
   DEBUG_WriteStr(tname, tlen, 0, TRUE);
   DEBUG_Writeline(TRUE);
END {WriteTransformationName};


FUNCTION FindRule(hns: HyperDtree_SetOfHyperNodeElt; { Contains only rule nodes}
                  R  : INTEGER): HyperDtree_SetOfHyperNodeElt;
VAR
   d : HyperDtree_pHyperNodeElt;
   h : HyperDtree_SetOfHyperNodeElt;
BEGIN
   HyperDtree_EmptyNode(h);
   WHILE NOT HyperDtree_IsEmptyNode(hns) DO BEGIN
      HyperDtree_TakeFromNode(d, hns);
      IF d^.R = R THEN HyperDtree_AddToNode(d, h);
   END;
   FindRule := h;
END {FindRule};

FUNCTION PossibleRule(hn : HyperDtree_pHyperNodeElt;
                      t  : LISTREE_pStree) : BOOLEAN;
VAR
   phns   : HyperDtree_pSetOfHyperNodeElt;
   hns    : HyperDtree_SetOfHyperNodeElt;
   found  : BOOLEAN;
   h      : HyperDtree_pHyperNodeElt;
BEGIN
   IF LoopHoles.Retype(t^.LI^.Dtrees,HyperDtree_pSetOfHyperNodeElt) = NIL THEN BEGIN
      PossibleRule := FALSE;
      END
   ELSE BEGIN
     phns := LoopHoles.Retype(t^.LI^.Dtrees,HyperDtree_pSetOfHyperNodeElt);
     hns := phns^;
     found := FALSE;
     WHILE NOT HyperDtree_IsEmptyNode(hns) AND NOT found DO BEGIN
        HyperDtree_TakeFromNode(h, hns);
        found := hn = h 
     END;
     PossibleRule := found
   END;
END {PossibleRule};


PROCEDURE SaveResult(VAR h: HyperDtree_pHyperDtree; 
                     r : LISTREE_SetOfStrees);
VAR
   f, l: HyperDtree_pLoStree;
BEGIN
   f := LoopHoles.Retype(r.first,HyperDtree_pLoStree);
   l := LoopHoles.Retype(r.last,HyperDtree_pLoStree);
   HyperDtree_SaveOrigin(f, l, h)
END {SaveResult};


PROCEDURE ReturnResult(h: HyperDtree_pHyperDtree; 
                       VAR r : LISTREE_SetOfStrees);
VAR
   f, l: HyperDtree_pLoStree;
BEGIN
   HyperDtree_ReturnOrigin(h, f, l);
   r.first := LoopHoles.Retype(f,LISTREE_pLoStree);
   r.last := LoopHoles.Retype(l,LISTREE_pLoStree);
END {ReturnResult};


PROCEDURE CountBonusOfTuple(tup: LISTREE_TupleOfStrees;
                            VAR synbonus, sembonus: INTEGER);
VAR
   f    : LISTREE_pLoStree;
BEGIN
   synbonus := 0; sembonus := 0;
   f := tup.first;
   WHILE (f <> NIL) DO BEGIN
      synbonus := synbonus+f^.arg^.LI^.synbonus;
      sembonus := sembonus+f^.arg^.LI^.sembonus;
      IF f = tup.last THEN f := NIL
                      ELSE f := f^.next
   END;
END {CountBonusOfTuple};


FUNCTION MGenerator_body(interf: INTERFACES_IfDescr): INTERFACES_IfDescr;


   FUNCTION MGenerator(h: HyperDtree_pHyperDtree;
                       SubstInd: HyperDtree_VarIndexSet): LIStree_SetOfStrees;
   FORWARD;

   FUNCTION MGeneratorplus(h: HyperDtree_pHyperDtree;
                       SubstInd: HyperDtree_VarIndexSet): LIStree_SetOfStrees;
   FORWARD;

   FUNCTION MGeneratorSG(h: HyperDtree_pHyperDtree;
                         SubstInd: HyperDtree_VarIndexSet): LISTREE_SetOfStrees;
   FORWARD;

   FUNCTION MGeneratorSGplus(h: HyperDtree_pHyperDtree;
                             SubstInd: HyperDtree_VarIndexSet): LISTREE_SetOfStrees;
   FORWARD;


   FUNCTION MTransforms(h1: Hyperdtree_pHyperNodeElt;
                        h2: HyperDtree_SetOfHyperNodeElt;
                        t: LISTREE_pStree): LISTREE_SetOfStrees;
   FORWARD;


   FUNCTION GTransforms(kind: LDMRULES_CtrlExprKind;
                        R1, R2: INTEGER;
                        h2 : HyperDtree_SetOfHyperNodeElt;
                        sg: INTEGER; t: LISTREE_pStree):
                        LISTREE_SetOfStrees;
   FORWARD;


   FUNCTION MGenerator;
   VAR
      ts, ts1  : LISTREE_SetOfStrees;
      ts2      : LIStree_SetOfStrees;
      result   : LIStree_SetOfStrees;
      hn       : HyperDtree_pHyperNodeElt;
      hns      : HyperDtree_SetOfHyperNodeElt;
      hnc      : HyperDtree_SetOfHNECluster;
      t        : LISTREE_pStree;
      CurSonElt: HyperDtree_pHyperNodeElt;
      
   BEGIN
      IF DebugMgenerator_Trace THEN BEGIN
         DEBUG_WriteStr('-> MGenerator', DEBUG_MaxIO, 0, TRUE);
         DEBUG_Writeline(TRUE);
      END;

      LISTREE_InitSetOfStrees(result);
      IF NOT DebugMgenerator_StopParse THEN BEGIN
         CASE h^.IsRuleNode OF
         TRUE  : 
            IF h^.EndOfSg THEN BEGIN
               h^.EndOfSg := FALSE;

               (*----------------------------------------------------------*
                * Can only be called via Mgeneratorplus. Therefore we can
                * now directly call MgeneratorSG.
                *----------------------------------------------------------*)

               ts1 := MGeneratorSG(h, SubstInd);
               h^.EndOfSg := TRUE;
               WHILE LISTREE_StillStrees(ts1) AND
                     ( NOT DebugMgenerator_StopParse) DO BEGIN
                  LIStree_TakeStree(t, ts1);
                  CurSonElt := LoopHoles.Retype(t^.LI^.HyperNodeElt,HyperDtree_pHyperNodeElt);
                  LoopHoles.Retype(t^.LI^.HyperNodeElt,HyperDtree_pHyperNodeElt ):= NIL;
                  HyperDtree_EmptyNode(hns);
                  ts2 := MTransforms(CurSonElt, hns, t);
                  LIStree_MergeSetsOfStrees(ts2, result)    
               END
            END;
	 FALSE :
	    CASE h^.BasicNodeKind OF
	    HyperDtree_BasicNode:
	       BEGIN
	       IF DebugMgenerator_Trace THEN BEGIN
		  DEBUG_WriteStr('  Basic Node', DEBUG_MaxIO, 0, TRUE);
		  DEBUG_Writeline(TRUE);
	       END;
               hnc := h^.Elts; HyperDtree_TakeCluster(hns, hnc);
	       WHILE (NOT HyperDtree_IsEmptyNode(hns)) DO BEGIN
		  HyperDtree_TakeFromNode(hn, hns);
		  t := LDBLEX_Read(hn^.key);
		  IF DebugMgenerator_PlusStree THEN DRAWSTREE_GenerateTree(t);
                  t^.LI^.sembonus := hn^.bonus;
		  LoopHoles.Retype(t^.LI^.HyperNodeElt,HyperDtree_pHyperNodeElt ):= NIL{hn};
                  LoopHoles.Retype(t^.LI^.Dtrees,HyperDtree_pSetOfHyperNodeElt) := NIL;
		  LISTREE_AppendStree(t, result)
	       END;
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
	       t := LoopHoles.Retype(h^.LI^.def^.LI^.stree,LISTREE_pStree);
               hnc := h^.Elts; HyperDtree_TakeCluster(hns, hnc);
	       HyperDtree_TakeFromNode(hn, hns);
	       IF DebugMgenerator_Trace THEN BEGIN
		  DEBUG_WriteStr('  Var Node, index', DEBUG_MaxIO, 0, TRUE);
		  DEBUG_WriteInteger(hn^.index, 5, TRUE);
		  DEBUG_Writeline(TRUE);
	       END;
	       LoopHoles.Retype(t^.LI^.HyperNodeElt,HyperDtree_pHyperNodeElt) := NIL{hn};
               LoopHoles.Retype(t^.LI^.Dtrees,HyperDtree_pSetOfHyperNodeElt) := NIL;
	       IF DebugMgenerator_PlusStree THEN DRAWSTREE_GenerateTree(t);
	       LISTREE_AppendStree(t, result);
	       END
	    END
	 END;      
      END;
      MGenerator := result;
      IF DebugMgenerator_Trace THEN BEGIN
         DEBUG_WriteStr('<- MGenerator', DEBUG_MaxIO, 0, TRUE);
         DEBUG_Writeline(TRUE);
      END;
   END {MGenerator};


   FUNCTION MGeneratorSGplus;
   VAR
      result : LISTREE_SetOfStrees;
   BEGIN
      IF (h^.LI^.VarIndices * SubstInd) <> [] THEN BEGIN
         result := MGeneratorSG(h, SubstInd);
         SaveResult(h, result)
         END
      ELSE IF HyperDtree_IsOriginSaved(h) THEN BEGIN
         ReturnResult(h, result)         
         END
      ELSE BEGIN
         result := MGeneratorSG(h, SubstInd);
         SaveResult(h, result)
      END;
      MGeneratorSGplus := result
   END {MGeneratorSGplus};



   FUNCTION MGeneratorplus;
   VAR
      result : LISTREE_SetOfStrees;
   BEGIN
      IF (h^.LI^.VarIndices * SubstInd) <> [] THEN BEGIN
         result := MGenerator(h, SubstInd);
         SaveResult(h, result)
         END
      ELSE IF HyperDtree_IsOriginSaved(h) THEN BEGIN
         ReturnResult(h, result)         
         END
      ELSE BEGIN
         result := MGenerator(h, SubstInd);
         SaveResult(h, result)
      END;
      MGeneratorplus := result
   END {MGeneratorplus};



   FUNCTION MGeneratorSG;
   VAR
      hnc          : HyperDtree_SetOfHNECluster;
      hns1,
      hns          : HyperDtree_SetOfHyperNodeElt;
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
      CurIndex     : INTEGER;
      stackptr     : Mem_StackPtr;
      sonsynbonus  : INTEGER;
      sonsembonus  : INTEGER;
      rulebonus    : INTEGER;

   BEGIN
{
      Mem_MarkDefault(stackptr);
}
      IF DebugMgenerator_Trace THEN BEGIN
         DEBUG_WriteStr('->MGeneratorSG', DEBUG_MaxIO, 0, TRUE);
         DEBUG_Writeline(TRUE);
      END;
      LISTREE_InitSetOfStrees(result);
      hnc := h^.Elts;
      CASE h^.IsRuleNode OF
      TRUE  : 
         IF h^.EndOfSg THEN BEGIN

            (*-------------------------------------------------------------*
             * Can only be called from MGeneratorSGplus. Therfore we can
             * now directly call MGenerator.
             *-------------------------------------------------------------*)

            result := MGenerator(h, SubstInd)
            END
         ELSE
	 CASE h^.RuleNodeKind OF
	 HyperDtree_RuleNode:
	    BEGIN
	    IF DebugMgenerator_Trace THEN BEGIN
               DEBUG_WriteStr('  Rule Node', DEBUG_MaxIO, 0, TRUE);
   	       DEBUG_Writeline(TRUE);
            END;
	    LISTREE_EmptyTofSofStrees(tts);
            args := h^.args;
	    HyperDtree_TakeFromTuple(hfirst, args);
	    nrOfargs := 1; success := TRUE;
	    WHILE (nrOfargs < h^.nrOfargs) AND success AND
                  ( NOT DebugMgenerator_StopParse ) DO BEGIN
	       nrOfargs := nrOfargs+1;
	       HyperDtree_TakeFromTuple(hother, args);
	       tsnext := MGeneratorplus(hother, SubstInd);
	       success := LISTREE_StillStrees(tsnext);
	       LISTREE_AddToTofSofStrees(tsnext, tts);
	    END;

            LISTREE_InitSetOfStrees(ts1);
            IF success THEN ts1 := MGeneratorSGplus(hfirst, SubstInd);

	    success := LISTREE_StillStrees(ts1);

	    WHILE (NOT HyperDtree_IsEmptyClusterSet(hnc)) AND success AND
                  ( NOT DebugMgenerator_StopParse ) DO BEGIN
	       HyperDtree_TakeCluster(hns, hnc);
               IF DebugMgenerator_Trace THEN BEGIN
                  DEBUG_WriteStr('Evaluation of cluster', DEBUG_MaxIO, 0, TRUE);
                  WriteClusterName(hns.sg);
               END;
	       nts1 := ts1;
	       LISTREE_InitSetOfStrees(tsfirst);
	       WHILE LISTREE_StillStrees(nts1) AND
                     ( NOT DebugMgenerator_StopParse ) DO BEGIN
		  LISTREE_TakeStree(t, nts1);
		  CurSonElt := LoopHoles.Retype(t^.LI^.HyperNodeElt,HyperDtree_pHyperNodeElt);
		  ts2 := MTransforms(CurSonElt, hns, t);
		  LISTREE_MergeSetsOfStrees(ts2, tsfirst);
	       END;      

               IF LISTREE_StillStrees(tsfirst) AND
                  ( NOT DebugMgenerator_StopParse ) THEN BEGIN

		  LISTREE_AddBackToTofSofStrees(tsfirst, tts);
		  LISTREE_InitCartProdElts(tts);
		  WHILE LISTREE_StillCartProdElts(tts) AND
                        ( NOT DebugMgenerator_StopParse ) DO BEGIN
		     LISTREE_TakeTuplefromCartProd(tup, tts);
                     hns1 := hns;
                     WHILE NOT HyperDtree_IsEmptyNode(hns1) DO BEGIN
                        HyperDtree_TakeFromNode(hn, hns1);
                        IF PossibleRule(hn, tup.first^.arg) THEN BEGIN
                           WITH hn^ DO BEGIN
                              sg1 := sg;
                              elt := R;
                              params := parameters;
                           END;
			   IF DebugMgenerator_RuleBreakPoint(elt) THEN BEGIN
			      DebugMGenerator_StoreStreeTuple(tup);
			      Debug_WriteStr('Breakpoint at: ', DEBUG_MaxIO, 0, TRUE);
			      WriteRuleName(sg1, elt);
			      DebugMgenerator_Menu;
			   END;
			   IF ( NOT DebugMgenerator_StopParse ) THEN BEGIN
			      IF DebugMgenerator_Trace THEN WriteRuleName(sg1, elt);
			      tns := LDGenMrules_FR(sg1, elt, params, tup);
			      IF DebugMgenerator_Step THEN BEGIN
				 DebugMgenerator_StoreStreeSet(tns);
				 DebugMGenerator_StoreStreeTuple(tup);
				 Debug_WriteStr('Executed: ', DEBUG_MaxIO, 0, TRUE);
				 WriteRuleName(sg1, elt);
				 DebugMgenerator_Menu;
			      END;
			      IF LISTREE_StillStrees(tns) THEN BEGIN
                                 CountBonusOfTuple(tup, sonsynbonus, sonsembonus);
				 WHILE LISTREE_StillStrees(tns) DO BEGIN
				    LISTREE_TakeStreeBonus(t, tns, rulebonus);
                                    t^.LI^.synbonus := rulebonus + sonsynbonus;
                                    t^.LI^.sembonus := hn^.bonus + sonsembonus;
				    IF DebugMgenerator_PlusStree THEN DRAWSTREE_GenerateTree(t);
				    LoopHoles.Retype(t^.LI^.HyperNodeElt,HyperDtree_pHyperNodeElt) := hn;
				    LISTREE_AppendStree(t, result);
				 END
				 END
			      ELSE BEGIN
                                 DebugMGenerator_LastTriedRule(elt); 
				 IF DebugMgenerator_Trace THEN BEGIN
				    DEBUG_WriteStr('No Result', DEBUG_MaxIO, 0, TRUE);
				    DEBUG_WriteLine(TRUE)
				 END
			      END;                  
			   END
                        END
                     END
		  END;
		  LISTREE_TakeFromTofSofStrees(tsfirst, tts);
               END
	    END
	    END;
	 HyperDtree_SubstRuleNode :
	    BEGIN
            IF DebugMgenerator_Trace THEN BEGIN
	       DEBUG_WriteStr('  Subst Rule Node', DEBUG_MaxIO, 0, TRUE);
	       DEBUG_Writeline(TRUE);
            END;
            substituent := h^.substituent;
            substituee  := 3-substituent;
            args := h^.args;
            CurIndex := GetIndex(h);
	    HyperDtree_TakeFromTuple(hsubst[1], args);
	    HyperDtree_TakeFromTuple(hsubst[2], args);
	       
            IF ( substituent = HeadArg ) AND 
               ( NOT DebugMgenerator_StopParse ) THEN BEGIN          

               ts1 := MGeneratorSGplus(hsubst[substituent], SubstInd);

	       success := LISTREE_StillStrees(ts1);

               SubstInd := SubstInd+[CurIndex];
	       WHILE (NOT HyperDtree_IsEmptyClusterSet(hnc)) AND
                     ( NOT DebugMgenerator_StopParse ) AND success DO BEGIN
		  HyperDtree_TakeCluster(hns, hnc);

                  IF DebugMgenerator_Trace THEN BEGIN
                     DEBUG_WriteStr('Evaluation of cluster', DEBUG_MaxIO, 0, TRUE);
                     WriteClusterName(hns.sg);
                  END;
		  nts1 := ts1;
		  LISTREE_InitSetOfStrees(ts[substituent]);
		  WHILE LISTREE_StillStrees(nts1) AND 
                        ( NOT DebugMgenerator_StopParse ) DO BEGIN
		     LISTREE_TakeStree(t, nts1);
                     CurSonElt := LoopHoles.Retype(t^.LI^.HyperNodeElt,HyperDtree_pHyperNodeElt);
		     ts2 := MTransforms(CurSonElt, hns, t);
		     LISTREE_MergeSetsOfStrees(ts2, ts[substituent]);
		  END;      

                  WHILE LISTREE_StillStrees(ts[substituent]) AND
                        ( NOT DebugMgenerator_StopParse ) DO BEGIN
                     LISTREE_EmptyTofSofStrees(tts);
                     LISTREE_TakeStree(tsubst, ts[substituent]);
                     LDSubstToVar_Copy(tsubst, tvar, CurIndex);
                     h^.LI^.stree := LoopHoles.Retype(tvar,HyperDtree_pStree);
                     GlobSubst_Push(CurIndex, tsubst);

                     ts[substituee] := MGeneratorplus(hsubst[substituee], SubstInd);
                     SubstInd := [CurIndex];

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

                           hns1 := hns;
                           WHILE NOT HyperDtree_IsEmptyNode(hns1) DO BEGIN
                              HyperDtree_TakeFromNode(hn, hns1);
                              IF PossibleRule(hn, tup.first^.arg) THEN BEGIN
		                 WITH hn^ DO BEGIN
		                    sg1  := sg;
		                    elt := R;
		                    params := parameters;
		                 END;

				 IF DebugMgenerator_RuleBreakPoint(elt) THEN BEGIN
				    DebugMGenerator_StoreStreeTuple(tup);
				    Debug_WriteStr('Breakpoint at: ', DEBUG_MaxIO, 0, TRUE);
				    WriteRuleName(sg1, elt);
				    DebugMgenerator_Menu;
				 END;
				 IF ( NOT DebugMgenerator_StopParse ) THEN BEGIN
				    IF DebugMgenerator_Trace THEN WriteRuleName(sg1, elt);
				    tns := LDGenMrules_FR(sg1, elt, params, tup);
				    IF DebugMgenerator_Step THEN BEGIN
					DebugMgenerator_StoreStreeSet(tns);
					DebugMGenerator_StoreStreeTuple(tup);
					Debug_WriteStr('Executed: ', DEBUG_MaxIO, 0, TRUE);
					WriteRuleName(sg1, elt);
					DebugMgenerator_Menu;
				    END;
				    IF LISTREE_StillStrees(tns) THEN BEGIN
                                       CountBonusOfTuple(tup, sonsynbonus,
                                                         sonsembonus);
				       WHILE LISTREE_StillStrees(tns) DO BEGIN
					  LISTREE_TakeStreeBonus(t, tns, rulebonus);
                                          t^.LI^.synbonus := rulebonus + sonsynbonus;
                                          t^.LI^.sembonus := hn^.bonus + sonsembonus;
					  IF DebugMgenerator_PlusStree THEN DRAWSTREE_GenerateTree(t);
					  LoopHoles.Retype(t^.LI^.HyperNodeElt,HyperDtree_pHyperNodeElt) := hn;
					  LISTREE_AppendStree(t, result);
				       END
				       END
				    ELSE BEGIN
                                       DebugMGenerator_LastTriedRule(elt); 
				       IF DebugMgenerator_Trace THEN BEGIN
					  DEBUG_WriteStr('No Result', DEBUG_MaxIO, 0, TRUE);
					  DEBUG_WriteLine(TRUE)
				       END
				    END
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

               ts[substituent] := MGeneratorplus(hsubst[substituent], SubstInd);

               SubstInd := SubstInd+[CurIndex];
	       WHILE LISTREE_StillStrees(ts[substituent]) AND
                     ( NOT DebugMgenerator_StopParse ) DO BEGIN
		  LISTREE_TakeStree(tsubst, ts[substituent]);
		  LDSubstToVar_Copy(tsubst, tvar, CurIndex);
		  h^.LI^.stree := LoopHoles.Retype(tvar,HyperDtree_pStree);
                  GlobSubst_Push(CurIndex, tsubst);

		  ts1 := MGeneratorSGplus(hsubst[substituee], SubstInd);
                  SubstInd := [CurIndex];

		  success := LISTREE_StillStrees(ts1);

                  hnc := h^.Elts;
		  WHILE (NOT HyperDtree_IsEmptyClusterSet(hnc)) AND
                        ( NOT DebugMgenerator_StopParse ) AND success DO BEGIN
		     HyperDtree_TakeCluster(hns, hnc);

                     IF DebugMgenerator_Trace THEN BEGIN
                        DEBUG_WriteStr('Evaluation of cluster', DEBUG_MaxIO, 0, TRUE);
                        WriteClusterName(hns.sg);
                     END;
		     nts1 := ts1;
		     LISTREE_InitSetOfStrees(ts[substituee]);
		     WHILE LISTREE_StillStrees(nts1) AND
                           ( NOT DebugMgenerator_StopParse ) DO BEGIN
			LISTREE_TakeStree(t, nts1);
			CurSonElt := LoopHoles.Retype(t^.LI^.HyperNodeElt,HyperDtree_pHyperNodeElt);
                        ts2 := MTransforms(CurSonElt, hns, t);
			LISTREE_MergeSetsOfStrees(ts2, ts[substituee]);
		     END;      

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
                           hns1 := hns;
                           WHILE NOT HyperDtree_IsEmptyNode(hns1) DO BEGIN
                              HyperDtree_TakeFromNode(hn, hns1);
                              IF PossibleRule(hn, tup.first^.arg) THEN BEGIN
  		                 WITH hn^ DO BEGIN
			            sg1 := sg;
			            elt := R;
			            params := parameters;
		                 END;
				 IF DebugMgenerator_RuleBreakPoint(elt) THEN BEGIN
				    DebugMGenerator_StoreStreeTuple(tup);
				    Debug_WriteStr('Breakpoint at: ', DEBUG_MaxIO, 0, TRUE);
				    WriteRuleName(sg1, elt);
				    DebugMgenerator_Menu;
				 END;
				 IF ( NOT DebugMgenerator_StopParse ) THEN BEGIN
				    IF DebugMgenerator_Trace THEN WriteRuleName(sg1, elt);
				    tns := LDGenMrules_FR(sg1, elt, params, tup);
				    IF DebugMgenerator_Step THEN BEGIN
				       DebugMgenerator_StoreStreeSet(tns);
				       DebugMGenerator_StoreStreeTuple(tup);
				       Debug_WriteStr('Executed: ', DEBUG_MaxIO, 0, TRUE);
				       WriteRuleName(sg1, elt);
				       DebugMgenerator_Menu;
				    END;
				    IF LISTREE_StillStrees(tns) THEN BEGIN
                                       CountBonusOfTuple(tup, sonsynbonus,
                                                         sonsembonus);
				       WHILE LISTREE_StillStrees(tns) DO BEGIN
					  LISTREE_TakeStreeBonus(t, tns, rulebonus);
                                          t^.LI^.synbonus := rulebonus + sonsynbonus;
                                          t^.LI^.sembonus := hn^.bonus + sonsembonus;
					  IF DebugMgenerator_PlusStree THEN DRAWSTREE_GenerateTree(t);
					  LoopHoles.Retype(t^.LI^.HyperNodeElt,HyperDtree_pHyperNodeElt) := hn;
					  LISTREE_AppendStree(t, result);
				       END
				       END
				    ELSE BEGIN
                                       DebugMGenerator_LastTriedRule(elt); 
				       IF DebugMgenerator_Trace THEN BEGIN
					  DEBUG_WriteStr('No Result', DEBUG_MaxIO, 0, TRUE);
					  DEBUG_WriteLine(TRUE)
				       END
				    END
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

         (*-------------------------------------------------------------*
          * Can only be called from MGeneratorSGplus. Therfore we can
          * now directly call MGenerator.
          *-------------------------------------------------------------*)

         result := MGenerator(h, SubstInd);
      END;

      IF DebugMgenerator_Trace THEN BEGIN
         DEBUG_WriteStr('<-MGeneratorSG', DEBUG_MaxIO, 0, TRUE);
         DEBUG_Writeline(TRUE);
      END;

      IF DebugMgenerator_StopParse THEN LISTREE_InitSetOfStrees(result);
{
      IF NOT LIStree_StillStrees(result) THEN MEM_ReleaseDefault(stackptr);
}
      MGeneratorSG := result;
   END {MGeneratorSG};

  

   FUNCTION MTransforms{h1: Hyperdtree_HyperNodeElt;
                        h2: HyperDtree_SetOfHyperNodeElt;
                        t: LISTREE_pStree): LISTREE_SetOfStrees};
   VAR
      R1, R2   : INTEGER;
      sg1, sg2 : INTEGER;
      result,
      ts       : LISTREE_SetOfStrees;
      t1       : LISTREE_pStree;

   BEGIN
      IF DebugMgenerator_Trace THEN BEGIN
         DEBUG_WriteStr('->MTransforms from', DEBUG_MaxIO, 0, TRUE);
         DEBUG_Writeline(TRUE);
      END;
      LISTREE_InitSetOfStrees(result);

      IF h1 = NIL THEN BEGIN
         sg1 := -1; R1 := SGHeader; 
         IF DebugMgenerator_Trace THEN BEGIN
            DEBUG_WriteStr(' transformations at beginning of SG', DEBUG_MaxIO, 0, TRUE);
            DEBUG_Writeline(TRUE);
         END;
         END
      ELSE BEGIN
         IF h1^.nodekind = HyperDtree_RuleNode THEN BEGIN
            sg1 := h1^.sg; R1 := h1^.R; 
            IF DebugMgenerator_Trace THEN BEGIN
               WriteRuleName(sg1, R1);
            END;
            END
         ELSE BEGIN
            IF DebugMgenerator_Trace THEN BEGIN
               DEBUG_WriteStr(' h1 has erroneous value ', DEBUG_MaxIO, 0, TRUE);
               DEBUG_Writeline(TRUE);
            END
         END
      END;

      IF HyperDtree_IsEmptyNode(h2) THEN BEGIN 
         IF sg1 = -1 THEN BEGIN
            IF DebugMgenerator_Trace THEN BEGIN
               DEBUG_WriteStr(' empty path trough subgrammar ! ', DEBUG_MaxIO, 0, TRUE);
               DEBUG_Writeline(TRUE);
            END;
            sg2 := -2;
            END
         ELSE BEGIN
            sg2 := sg1; R2 := SGTrailer;
         END
         END
      ELSE BEGIN
         sg2 := h2.sg;
         IF sg1 = -1 THEN sg1 := sg2;
         R2 := SGRuleNode;
      END;

      IF sg1 = sg2 THEN BEGIN
         LoopHoles.Retype(t^.LI^.Dtrees,HyperDtree_pSetOfHyperNodeElt) := NIL;
         result := GTransforms(rule, R1, R2, h2, sg1, t);
      END;

      MTransforms := result;
      IF DebugMgenerator_Trace THEN BEGIN
         DEBUG_WriteStr('<-MTransforms', DEBUG_MaxIO, 0, TRUE);
         DEBUG_Writeline(TRUE);
      END
   END {MTransforms};


   FUNCTION GTransforms{kind: LDMRULES_CtrlExprKind;
                        R1, R2 : INTEGER; h2: HyperDtree_SetOfHyperNodeElt;
                        sg: INTEGER; t: LISTREE_pStree):
                        LISTREE_SetOfStrees};
   VAR
      F        : LIMRULES_CeRuleSet;
      R        : INTEGER;
      k        : LDMRULES_CtrlExprKind;
      t1       : LISTREE_pStree;
      tns      : LISTREE_SetOfStrees;
      result   : LISTREE_SetOfStrees;
      tup      : LISTREE_TupleOfStrees;
      success  : BOOLEAN;
      hn       : HyperDtree_pHyperNodeElt;
      hns      : HyperDtree_SetOfHyperNodeElt;
      phns     : HyperDtree_pSetOfHyperNodeElt;
      StreeAdded : BOOLEAN;
      sonsynbonus: INTEGER;
      sonsembonus: INTEGER;
      rulebonus  : INTEGER;

   FUNCTION IsDerivable(t1, r2: INTEGER; h2: HyperDtree_SetOfHyperNodeElt): BOOLEAN;
   VAR
      found : BOOLEAN;
      h     : HyperDtree_pHyperNodeElt;
   BEGIN
      IF t1 = SGHeader THEN BEGIN
         IsDerivable := TRUE
         END
      ELSE IF r2 = SGTrailer THEN BEGIN
         IsDerivable := LIMRULES_DerivableFrom(t1, r2)
         END
      ELSE BEGIN
         found := FALSE;
         WHILE NOT HyperDtree_IsEmptyNode(h2) AND NOT found DO BEGIN
            HyperDtree_TakeFromNode(h, h2);
            found := LIMRULES_DerivableFrom(t1, h^.R)
         END;
         IsDerivable := found
      END
   END {IsDerivable};

   BEGIN
      IF DebugMgenerator_Trace THEN BEGIN
         DEBUG_WriteStr('->GTransforms', DEBUG_MaxIO, 0, TRUE);
         DEBUG_Writeline(TRUE);
      END;
      LISTREE_InitSetOfStrees(result);
      StreeAdded := FALSE;

      IF (R1 = Sgheader) AND (R2 <> SgTrailer) THEN BEGIN
         F := LIMRULES_SGFirst(sg);
         WHILE LIMRULES_StillRules(F) AND
            ( NOT DebugMgenerator_StopParse ) DO BEGIN
            LIMRULES_TakeRule(R, k, F);
            IF (k = transformation) 
                AND IsDerivable(R, R2, h2)  THEN BEGIN
               LISTREE_EmptyTuple(tup);
               LISTREE_AddToTuple(t, tup);
               IF DebugMgenerator_TransBreakPoint(R) THEN BEGIN
                  DebugMGenerator_StoreStreeTuple(tup);
                  Debug_WriteStr('Breakpoint at: ', DEBUG_MaxIO, 0, TRUE);
                  WriteTransformationName(sg, R);
                  DebugMgenerator_Menu;
               END;
               IF ( NOT DebugMgenerator_StopParse ) THEN BEGIN
                  IF DebugMgenerator_Trace THEN WriteTransformationName(sg, R);
		  tns := LDGenMrules_FT(sg, R, tup);
                  IF DebugMgenerator_Step THEN BEGIN
                     DebugMgenerator_StoreStreeSet(tns);
                     DebugMGenerator_StoreStreeTuple(tup);
                     Debug_WriteStr('Executed: ', DEBUG_MaxIO, 0, TRUE);
                     WriteTransformationName(sg, R);
                     DebugMgenerator_Menu;
                  END;
		  IF LISTREE_StillStrees(tns) THEN BEGIN
                     CountBonusOfTuple(tup, sonsynbonus, sonsembonus);
		     WHILE LISTREE_StillStrees(tns) DO BEGIN
			LISTREE_TakeStreeBonus(t1, tns, rulebonus);
                        t1^.LI^.synbonus := rulebonus + sonsynbonus;
                        t1^.LI^.sembonus := sonsembonus;
                        LoopHoles.Retype(t1^.LI^.HyperNodeElt,HyperDtree_pHyperNodeElt) := NIL;
                        LoopHoles.Retype(t1^.LI^.Dtrees,HyperDtree_pSetOfHyperNodeElt) := NIL;
			IF DebugMgenerator_PlusStree THEN DRAWSTREE_GenerateTree(t1);
			LISTREE_MergeSetsOfStrees(GTransforms(transformation,
							      R, R2, h2, sg, t1), 
						  result);
		     END
		     END
		  ELSE BEGIN
                     DebugMGenerator_LastTriedTrf(R); 
		     IF DebugMgenerator_Trace THEN BEGIN
			DEBUG_WriteStr('No Result', DEBUG_MaxIO, 0, TRUE);
			DEBUG_WriteLine(TRUE)
		     END
		  END               
               END
               END
            ELSE { kind = rule } BEGIN
               IF LoopHoles.Retype(t^.LI^.Dtrees,HyperDtree_pSetOfHyperNodeElt) = NIL THEN BEGIN
                  HyperDtree_MakeNode(phns);
                  LoopHoles.Retype(t^.LI^.Dtrees,HyperDtree_pSetOfHyperNodeElt) := phns;
               END;
               hns := FindRule(h2, R);
               phns := LoopHoles.Retype(t^.LI^.Dtrees,HyperDtree_pSetOfHyperNodeElt);
               WHILE NOT HyperDtree_IsEmptyNode(hns) DO BEGIN
                  HyperDtree_TakeFromNode(hn, hns);
                  HyperDtree_AddToNode(hn, phns^);
                  IF NOT StreeAdded THEN BEGIN
                     LISTREE_AppendStree(t, result);
                     StreeAdded := TRUE
                  END
               END;
            END;
         END
         END
      ELSE IF (R1 <> SGheader) THEN BEGIN
         F := LIMRULES_Successors(R1, kind);
         WHILE LIMRULES_StillRules(F) AND
            ( NOT DebugMgenerator_StopParse ) DO BEGIN
            LIMRULES_TakeRule(R, k, F);
            IF (k = transformation) 
                AND IsDerivable(R, R2, h2)  THEN BEGIN
               LISTREE_EmptyTuple(tup);
               LISTREE_AddToTuple(t, tup);
               IF DebugMgenerator_TransBreakPoint(R) THEN BEGIN
                  DebugMGenerator_StoreStreeTuple(tup);
                  Debug_WriteStr('Breakpoint at: ', DEBUG_MaxIO, 0, TRUE);
                  WriteTransformationName(sg, R);
                  DebugMgenerator_Menu;
               END;
               IF ( NOT DebugMgenerator_StopParse ) THEN BEGIN
                  IF DebugMgenerator_Trace THEN WriteTransformationName(sg, R);
		  tns := LDGenMrules_FT(sg, R, tup);
                  IF DebugMgenerator_Step THEN BEGIN
                     DebugMgenerator_StoreStreeSet(tns);
                     DebugMGenerator_StoreStreeTuple(tup);
                     Debug_WriteStr('Executed: ', DEBUG_MaxIO, 0, TRUE);
                     WriteTransformationName(sg, R);
                     DebugMgenerator_Menu;
                  END;
		  IF LISTREE_StillStrees(tns) THEN BEGIN
                     CountBonusOfTuple(tup, sonsynbonus, sonsembonus);
		     WHILE LISTREE_StillStrees(tns) DO BEGIN
			LISTREE_TakeStreeBonus(t1, tns, rulebonus);
                        t1^.LI^.synbonus := rulebonus + sonsynbonus;
                        t1^.LI^.sembonus := sonsembonus;
                        LoopHoles.Retype(t1^.LI^.HyperNodeElt,HyperDtree_pHyperNodeElt) := NIL;
                        LoopHoles.Retype(t1^.LI^.Dtrees,HyperDtree_pSetOfHyperNodeElt) := NIL;
			IF DebugMgenerator_PlusStree THEN DRAWSTREE_GenerateTree(t1);
			LISTREE_MergeSetsOfStrees(GTransforms(transformation,
							      R, R2, h2, sg, t1), 
						  result);
		     END               
		     END
		  ELSE BEGIN
                     DebugMGenerator_LastTriedTrf(R); 
		     IF DebugMgenerator_Trace THEN BEGIN
			DEBUG_WriteStr('No Result', DEBUG_MaxIO, 0, TRUE);
			DEBUG_WriteLine(TRUE)
		     END
		  END               
               END
               END
            ELSE { kind = rule } BEGIN
               IF (LoopHoles.Retype(t^.LI^.Dtrees,HyperDtree_pSetOfHyperNodeElt) = NIL) AND
                  NOT ( R2 = SGTrailer ) THEN BEGIN
                  HyperDtree_MakeNode(phns);
                  LoopHoles.Retype(t^.LI^.Dtrees,HyperDtree_pSetOfHyperNodeElt) := phns;
               END;

               { if (R2 = SGTrailer) => h2 is empty => hn = NIL }

               hns := FindRule(h2, R);
               phns := LoopHoles.Retype(t^.LI^.Dtrees,HyperDtree_pSetOfHyperNodeElt);
               WHILE NOT HyperDtree_IsEmptyNode(hns) DO BEGIN
                  HyperDtree_TakeFromNode(hn, hns);
                  HyperDtree_AddToNode(hn, phns^);
                  IF NOT StreeAdded THEN BEGIN
                     LISTREE_AppendStree(t, result);
                     StreeAdded := TRUE
                  END
               END;
            END;
         END;
         IF ( R2 = SGtrailer ) AND 
              LIMRULES_IsEndOfSG(R1, kind, sg) THEN BEGIN
            LISTREE_AppendStree(t, result);
         END
      END;

      IF DebugMgenerator_Trace THEN BEGIN
         DEBUG_WriteStr('<-GTransForms', DEBUG_MaxIO, 0, TRUE);
         IF LISTREE_StillStrees(result) THEN BEGIN
            DEBUG_WriteStr('Transformation rule path found', DEBUG_MaxIO, 0, TRUE);
            END
         ELSE BEGIN
            DEBUG_WriteStr(' No Transformation rule path found', DEBUG_MaxIO, 0, TRUE);
         END;
         DEBUG_Writeline(TRUE);
      END;
      IF DebugMgenerator_StopParse THEN BEGIN
         LISTREE_InitSetOfStrees(result);
      END;
      Gtransforms := result
   END {GTransforms};


   FUNCTION RobustMGenerator(d:HyperDtree_pHyperDtree)
            : LISTREE_SetOfStrees;
   VAR
      result : LISTREE_SetOfStrees;
   BEGIN
      LISTREE_InitSetOfStrees(result);
      RobustMGenerator:= result
   END {RobustMGenerator};


   VAR
      res   : LISTREE_SetOfStrees;
      if5   : INTERFACE5_SetOfHyperDtree;
      if6   : INTERFACE6_SetOfStrees;
      ifout : INTERFACES_IfDescr;
      hyp   : HyperDtree_pHyperDtree;
      dummy : HyperDtree_VarIndexSet;
BEGIN {MGenerator_body}
   if5:= interf.if5;
   LISTREE_InitSetOfStrees(if6);
   InitSetOfVarIndices(VarIndices);
   DebugMgenerator_Default;

   (*----------------------------------------------------------------------*
    * It is assumed that in the normal mode the input set of hyperdtrees always
    * has cardinality 1. In shortcircuit mode, however, the set may contain
    * more elements.
    *----------------------------------------------------------------------*)

   IF NOT HyperDtree_IsEmptySet(if5) AND
      NOT DebugMgenerator_StopAllParse THEN BEGIN   
      HyperDtree_TakeFromSet(hyp, if5);
      dummy := [];
      PreProcess(hyp, dummy);
      Debug_WriteStr('New HyperDtree for MGenerator', Debug_MaxIO, 0, TRUE);
      Debug_Writeline(TRUE);
      IF DEBUG_Mode THEN BEGIN
         DebugMgenerator_Menu;
         END
      ELSE BEGIN
         DebugMgenerator_Init
      END;
      GlobSubst_Init;
      res := MGenerator(hyp, []);
      if6 := SortStrees(res);
      IF DEBUG_Mode AND NOT LISTREE_StillStrees(if6) THEN DebugMgenerator_Menu;
   END;

   IF NOT LISTREE_StillStrees(if6) THEN BEGIN
         (* Apply robustness methods *)
      if5:= interf.if5;
      LISTREE_InitSetOfStrees(if6);
      IF NOT HyperDtree_IsEmptySet(if5) THEN BEGIN   
         HyperDtree_TakeFromSet(hyp, if5);
         if6 := RobustMGenerator(hyp);
      END
   END {IF};

   ifout.level  := 6;
   ifout.if6    := if6;
   MGenerator_body := ifout
END {MGenerator_body};

