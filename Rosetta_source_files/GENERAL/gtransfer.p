(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : GTransfer
 *  Creation date   :  21-JAN-1988
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(GTRANSFER);
pragma C_include('drawhyperdtree.pf');
pragma C_include('hyperdtree.pf');
pragma C_include('debug.pf');
pragma C_include('log.pf');
pragma C_include('hiltree.pf');
pragma C_include('liildict.pf');
pragma C_include('interfaces.pf');
pragma C_include('ldgenilrules.pf');
pragma C_include('lidomaint.pf');
pragma C_include('ldmrules.pf');
pragma C_include('liilrules.pf');
pragma C_include('gtransfer.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM GTransfer;
WITH DRAWHYPERDTREE, HYPERDTREE, DEBUG, LOG, HILTREE, LIILDICT,
     INTERFACES, LDGENILRULES, LIDOMAINT, LDMRULES, LIILRULES;

FUNCTION GTransfer_Body(interf: INTERFACES_IfDescr)
                                : INTERFACES_IfDescr;

VAR
   hyperilset : HILtree_SetOfHyperILtree;
   hyperil    : HILtree_pHyperILtree;
   hyper      : HyperDtree_pHyperDtree;
   hyperset   : HyperDtree_SetOfHyperDtree;
   ifout      : INTERFACES_IfDescr;

   PROCEDURE GTransfer(hyperil: HILtree_pHyperILtree;
                       VAR hyper: HyperDtree_pHyperDtree);
   VAR
      hyperilson   : HILtree_pLoHyperILtree;
      hyperilsonr  : HILtree_LoHyperILtree;
      hyperson     : HyperDtree_pHyperDtree;
      hypernodeelt : HyperDtree_pHyperNodeElt;
      hnc          : HyperDtree_SetOfHyperNodeElt;
      status       : BOOLEAN;
      rec          : LIILDict_RecordDef;
      HyperILNode  : HILtree_HyperILtree;
      HyperILLoElt : HILtree_LoHyperNodeElt;
      HyperILElt   : HILtree_HyperNodeElt;
      prms         : LDMrules_LIparameters;
      rulestr      : STRING(35);
      rulelen      : INTEGER;
      ErrorInTranslation : BOOLEAN;
   BEGIN
      DEBUG_WriteStr('-> GTransfer', DEBUG_MaxIO, 0, TRUE);
      DEBUG_WriteLine(TRUE);

      HILtree_LoadHyperILtree(hyperil, HyperILNode);
      HILtree_LoadLoHyperNodeElt(HyperILNode.Elts.cur, HyperILLoElt);
      HILtree_LoadHyperNodeElt(HyperILLoElt.arg, HyperILElt);

      CASE HyperILElt.nodekind OF

         HILtree_BasicNode :
            BEGIN
      DEBUG_WriteStr('-> basicnode', DEBUG_MaxIO, 0, TRUE);
      DEBUG_WriteLine(TRUE);

               HyperDtree_NewHyperDtreeLeave(hyper);
               hyper^.BasicNodeKind := HyperDtree_BasicNode;
               HyperDtree_EmptyClusterSet(hyper^.Elts);
               HyperDtree_EmptyNode(hnc);
               status := LIILDict_GetGIlDict(HyperILElt.key, rec);
               REPEAT               
                  IF status THEN BEGIN
                     IF NOT ( rec.ag = LIILDICT_Analysis) THEN BEGIN
                        HyperDtree_NewHyperDtreeBxpr(hyperNodeElt, rec.skey);
                        hyperNodeElt^.bonus := -rec.mpref; 
                        HyperDtree_AddToNode(hyperNodeElt, hnc);
                     END;
                     status := LIILDict_GetNextGILDict(HyperILElt.key, rec);
                  END
               UNTIL NOT status;
               HyperDtree_AddCluster(hnc, hyper^.Elts);

               IF HyperDtree_IsEmptyNode(hnc) THEN BEGIN
                  LOG_Write('No corresponding skey for mkey', 31, HyperILElt.key);
                  DEBUG_WriteStr('No corresponding skey for mkey ', DEBUG_MaxIO, 0, TRUE);
                  DEBUG_WriteInteger(HyperILElt.key, 5, TRUE);
                  DEBUG_WriteLine(TRUE);
                  hyper := NIL;
               END;
      DEBUG_WriteStr('<- basicnode', DEBUG_MaxIO, 0, TRUE);
      DEBUG_WriteLine(TRUE);

            END;            

         HILtree_VarNode  :
            BEGIN
      DEBUG_WriteStr('-> varnode', DEBUG_MaxIO, 0, TRUE);
      DEBUG_WriteLine(TRUE);

               HyperDtree_NewHyperDtreeLeave(hyper);
               hyper^.BasicNodeKind := HyperDtree_VarNode;
               HyperDtree_NewHyperDtreeVar(hyperNodeElt, HyperILElt.index,
                                            LICAT0);
               HyperDtree_EmptyClusterSet(hyper^.Elts);
               HyperDtree_EmptyNode(hnc);
               HyperDtree_AddToNode(HyperNodeElt, hnc);
               HyperDtree_AddCluster(hnc, hyper^.Elts);
      DEBUG_WriteStr('<- varnode', DEBUG_MaxIO, 0, TRUE);
      DEBUG_WriteLine(TRUE);

            END;

         HILtree_RuleNode   :
            BEGIN
      DEBUG_WriteStr('-> rulenode', DEBUG_MaxIO, 0, TRUE);
      DEBUG_WriteLine(TRUE);

               HyperDtree_NewHyperDtree(hyper);
               hyper^.RuleNodeKind := HyperDtree_RuleNode;
               hyper^.EndOfSg := HyperILNode.EndOfSg;
               hyper^.Elts := LDGenILRules_RuleTransfer(HyperILElt.R,
                                                        HyperILElt.parameters);

               IF NOT HyperDtree_IsEmptyClusterSet(hyper^.Elts) THEN BEGIN
		  hyperilson := HyperILNode.args.first;
		  HyperDtree_EmptyTuple(hyper^.args);
		  hyper^.nrOfargs := 0; ErrorInTranslation := FALSE;
		  WHILE (hyperilson <> HNIL) AND NOT ErrorInTranslation DO BEGIN
		     hyper^.nrOfargs := hyper^.nrOfargs+1;
                     HILtree_LoadLoHyperILtree(hyperilson, hyperilsonr);
		     GTransfer(hyperilsonr.arg, hyperson);
                     ErrorInTranslation := hyperson = NIL;
		     HyperDtree_AddToTuple(hyperson, hyper^.args);
		     hyperilson := hyperilsonr.next
		  END;
                  IF HyperDtree_IsEmptyTuple(hyper^.args) OR
                     ErrorInTranslation THEN BEGIN
      DEBUG_WriteStr('hyper has been set to NIL', DEBUG_MaxIO, 0, TRUE);
      DEBUG_WriteLine(TRUE);
                     hyper := NIL;
                  END
                  END
               ELSE BEGIN
                  LOG_Write('No corresponding M-rule for IL-rule ', 36, HyperILElt.R);
                  DEBUG_WriteStr('No corresponding M-rule for IL-rule ', DEBUG_MaxIO, 0, TRUE);
                  LIILRULES_rulename(HyperILElt.R,rulestr,rulelen);
                  DEBUG_writestr(rulestr,rulelen,rulelen,TRUE);
                  DEBUG_WriteLine(TRUE);
                  hyper := NIL;
                  ErrorInTranslation:=TRUE;
               END;
      DEBUG_WriteStr('<- rulenode', DEBUG_MaxIO, 0, TRUE);
      DEBUG_WriteLine(TRUE);
            END
      END;            


      DEBUG_WriteStr('<- GTransfer', DEBUG_MaxIO, 0, TRUE);
      DEBUG_WriteLine(TRUE);

{
      IF Debug_Mode THEN IF NOT ErrorInTranslation THEN DrawHyperDtree_GenerateTree(hyper);
}

   END {GTransfer};  
 

BEGIN

   hyperilset := interf.if4;
   HyperDtree_EmptySet(hyperset);

   WHILE NOT HILtree_IsEmptySet(hyperilset) DO BEGIN
      HILtree_TakeFromSet(hyperil, hyperilset);
      GTransfer(hyperil, hyper);
      IF hyper <> NIL THEN BEGIN
         HyperDtree_AddToSet(hyper, hyperset);
      END;
   END;

   ifout.level := 5;
   ifout.if5   := hyperset;
   GTransfer_Body := ifout;

END {GTransfer_Body};


