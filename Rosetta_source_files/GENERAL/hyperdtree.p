(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : HyperDtree
 *  Creation date   : 14 OCT 1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(HYPERDTREE);
pragma C_Include('mem.pf');
pragma C_Include('ldmrules.pf');
pragma C_Include('lidomaint.pf');
pragma C_Include('hyperdtree.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM HyperDtree;

WITH MEM, LDMRULES, LIDOMAINT;


PROCEDURE HyperDtree_NewHyperDtreeLeave (VAR d : HyperDtree_pHyperDtree);
BEGIN
   Mem_NewDefault(Loopholes.SizeOf(HyperDtree_HyperDtree), Loopholes.Retype(d,Mem_Ptr));
   Mem_NewDefault(Loopholes.SizeOf(HyperDtree_LIRecord), Loopholes.Retype(d^.LI,Mem_Ptr));
   d^.LI^.stree := NIL;
   d^.LI^.done  := FALSE;
   d^.LI^.Varindices := [];
   d^.IsRuleNode := FALSE;
   d^.Elts.first := NIL;
   d^.Elts.last  := NIL;
   d^.Elts.cur   := NIL;
   d^.Elts.NrOfElts := 0;
END {HyperDtree_NewHyperDtreeLeave};



PROCEDURE HyperDtree_NewHyperDtree (VAR d : HyperDtree_pHyperDtree);
BEGIN
   Mem_NewDefault(Loopholes.SizeOf(HyperDtree_HyperDtree), Loopholes.Retype(d,Mem_Ptr));
   Mem_NewDefault(Loopholes.SizeOf(HyperDtree_LIRecord), Loopholes.Retype(d^.LI,Mem_Ptr));
   d^.LI^.stree := NIL;
   d^.LI^.done  := FALSE;
   d^.LI^.Varindices := [];
   d^.IsRuleNode := TRUE;
   d^.nrOfArgs   := 0;
   d^.EndOfSg    := FALSE;
   d^.args.first := NIL; 
   d^.args.last  := NIL; 
   d^.Elts.first := NIL;
   d^.Elts.last  := NIL;
   d^.Elts.cur   := NIL;
   d^.Elts.NrOfElts   := 0;
END {HyperDtree_NewHyperDtree};



PROCEDURE HyperDtree_NewHyperDtreeBxpr (VAR d : HyperDtree_pHyperNodeElt;
                                                  key : INTEGER);
BEGIN
   Mem_NewDefault(Loopholes.SizeOf(HyperDtree_HyperNodeElt), Loopholes.Retype(d,Mem_Ptr));
   d^.nodekind := HyperDtree_BasicNode;
   d^.key:= key;
   d^.bonus := 0;
END {HyperDtree_NewHyperDtreeBxpr};



PROCEDURE HyperDtree_NewHyperDtreeVar (VAR d : HyperDtree_pHyperNodeElt;
                                                index : INTEGER;
                                                kind  : LIDOMAINT_SyntCat);
BEGIN
   Mem_NewDefault(Loopholes.SizeOf(HyperDtree_HyperNodeElt), Loopholes.Retype(d,Mem_Ptr));
   d^.nodekind := HyperDtree_VarNode;
   d^.index  := index;
   d^.kind   := kind;
   d^.bonus  := 0;
END {HyperDtree_NewHyperDtreeVar};



PROCEDURE HyperDtree_NewHyperDtreeRule (VAR d : HyperDtree_pHyperNodeElt;
                                             sg : LDMrules_SubgrammarIndex;
                                             R  : LDMrules_RuleIndex;
                                             params : LDMrules_LIParameters);
BEGIN
   Mem_NewDefault(Loopholes.SizeOf(HyperDtree_HyperNodeElt), Loopholes.Retype(d,Mem_Ptr));
   d^.nodekind := HyperDtree_RuleNode;
   d^.sg:= sg;
   d^.R:= R;
   d^.parameters:= params;
   d^.bonus := 0;
END {HyperDtree_NewHyperDtreeRule};



PROCEDURE HyperDtree_MarkFirstDtree (VAR d : HyperDtree_pHyperDtree);
   VAR son : HyperDtree_pLoHyperDtree;
BEGIN
   IF d<>NIL THEN BEGIN
      d^.Elts.cur := d^.Elts.first;
      d^.Elts.cur^.Elts.cur := d^.Elts.cur^.Elts.first;
      IF d^.IsRuleNode THEN BEGIN
         son := d^.args.first;
         WHILE son <> NIL DO BEGIN
            HyperDtree_MarkFirstDtree(son^.arg);
            son := son^.next
         END
      END
   END;
END {HyperDtree_MarkFirstDtree};



FUNCTION HyperDtree_MarkNextDtree (VAR d : HyperDtree_pHyperDtree)
                    : BOOLEAN;
VAR 
   son  : HyperDtree_pLoHyperDtree;
   done : BOOLEAN;
BEGIN
   done := FALSE;
   IF d<>NIL THEN BEGIN
      IF d^.IsRuleNode THEN BEGIN
         son := d^.args.first;
         WHILE (son <> NIL) AND NOT done DO BEGIN
            IF HyperDtree_MarkNextDtree(son^.arg) THEN BEGIN
               done := TRUE
               END
            ELSE BEGIN
               son := son^.next
            END {IF}
         END {WHILE};
         IF NOT done THEN BEGIN
            IF d^.Elts.cur^.Elts.cur <> d^.Elts.last^.Elts.last THEN BEGIN
               IF d^.Elts.cur^.Elts.cur = d^.Elts.cur^.Elts.last THEN BEGIN
                  d^.Elts.cur^.Elts.cur := d^.Elts.cur^.Elts.cur^.next;
                  END
               ELSE BEGIN
                  d^.Elts.cur := d^.Elts.cur^.next;
                  d^.Elts.cur^.Elts.cur := d^.Elts.cur^.Elts.first;
               END;
               done := TRUE
               END
            ELSE BEGIN
               d^.Elts.cur := d^.Elts.first;
               d^.Elts.cur^.Elts.cur := d^.Elts.cur^.Elts.first;
            END {IF}
         END {IF}
      END {IF}
   END {IF};
   HyperDtree_MarkNextDtree:= done
END {HyperDtree_MarkNextDtree};



PROCEDURE HyperDtree_EmptyNode(VAR ds:HyperDtree_SetOfHyperNodeElt);
BEGIN
   ds.first:= NIL;
   ds.last := NIL;
   ds.NrOfElts := 0;
   ds.cur  := NIL;
   ds.sg   := -1;
END {HyperDtree_EmptyNode};


PROCEDURE HyperDtree_MakeNode(VAR ds:HyperDtree_pSetOfHyperNodeElt);
BEGIN
   Mem_NewDefault(Loopholes.SizeOf(HyperDtree_SetOfHyperNodeElt), Loopholes.Retype(ds,Mem_Ptr));
   HyperDtree_EmptyNode(ds^);
END {HyperDtree_MakeNode};


PROCEDURE HyperDtree_AddToNode(d:HyperDtree_pHyperNodeElt;
                                       VAR ds:HyperDtree_SetOfHyperNodeElt);
   VAR p:HyperDtree_pLoHyperNodeElt;
BEGIN
   IF d=NIL THEN BEGIN
      (*should not occur*)
      END {THEN}
   ELSE BEGIN
      Mem_NewDefault(Loopholes.SizeOf(HyperDtree_LoHyperNodeElt), Loopholes.Retype(p,Mem_Ptr));
      p^.arg:=d;
      p^.next:=NIL;
      IF ds.first=NIL THEN BEGIN
	 ds.first:=p;
	 ds.last :=p;
         ds.cur  :=p;
	 END
      ELSE BEGIN
	 ds.last^.next:=p;
	 ds.last:=p
      END {IF};
      ds.NrOfElts := ds.NrOfElts+1;
   END {IF}
END {HyperDtree_AddToNode};


PROCEDURE HyperDtree_TakeFromNode(VAR d:HyperDtree_pHyperNodeElt;
                                          VAR ds:HyperDtree_SetOfHyperNodeElt);
BEGIN
   IF ds.first=NIL THEN BEGIN
      d:=NIL
      END
   ELSE BEGIN
      d:=ds.first^.arg;
      IF ds.first=ds.last THEN BEGIN
     	 ds.first:= NIL;
         ds.last := NIL;
         ds.cur  := NIL
         END
      ELSE BEGIN
         IF ds.cur = ds.first THEN ds.cur := ds.first^.next;
         ds.first := ds.first^.next
      END;
      ds.NrOfElts := ds.NrOfElts-1;
   END
END {HyperDtree_TakeFromNode};


FUNCTION HyperDtree_IsEmptyNode(ds:HyperDtree_SetOfHyperNodeElt)
                    :BOOLEAN;
BEGIN
   HyperDtree_IsEmptyNode:= ds.first=NIL
END {HyperDtree_IsEmptyNode};


PROCEDURE HyperDtree_EmptyClusterSet(VAR ds:HyperDtree_SetOfHNECluster);
BEGIN
   ds.first:= NIL;
   ds.last := NIL;
   ds.NrOfElts := 0;
   ds.cur  := NIL;
END {HyperDtree_EmptyClusterSet};


PROCEDURE HyperDtree_AddCluster(d:HyperDtree_SetOfHyperNodeElt;
                                       VAR ds:HyperDtree_SetOfHNECluster);
   VAR p:HyperDtree_pLoHNECluster;
BEGIN
      Mem_NewDefault(Loopholes.SizeOf(HyperDtree_LoHNECluster), Loopholes.Retype(p,Mem_Ptr));
      p^.Elts:=d;
      p^.next:=NIL;
      IF ds.first=NIL THEN BEGIN
	 ds.first:=p;
	 ds.last :=p;
         ds.cur  :=p;
	 END
      ELSE BEGIN
	 ds.last^.next:=p;
	 ds.last:=p
      END {IF};
      ds.NrOfElts := ds.NrOfElts+1;
END {HyperDtree_AddCluster};


PROCEDURE HyperDtree_TakeCluster(VAR d:HyperDtree_SetOfHyperNodeElt;
                                          VAR ds:HyperDtree_SetOfHNECluster);
BEGIN
   IF ds.first=NIL THEN BEGIN
      END
   ELSE BEGIN
      d:=ds.first^.Elts;
      IF ds.first=ds.last THEN BEGIN
     	 ds.first:= NIL;
         ds.last := NIL;
         ds.cur  := NIL
         END
      ELSE BEGIN
         IF ds.cur = ds.first THEN ds.cur := ds.first^.next;
         ds.first := ds.first^.next
      END;
      ds.NrOfElts := ds.NrOfElts-1;
   END
END {HyperDtree_TakeCluster};


FUNCTION HyperDtree_IsEmptyClusterSet(ds:HyperDtree_SetOfHNECluster)
                    :BOOLEAN;
BEGIN
   HyperDtree_IsEmptyClusterSet:= ds.first=NIL
END {HyperDtree_IsEmptyClusterSet};

PROCEDURE HyperDtree_EmptyTuple(VAR dn:HyperDtree_TupleOfHyperDtree);
BEGIN
   dn.first:=NIL;
   dn.last:=NIL;
END {HyperDtree_EmptyTuple};


PROCEDURE HyperDtree_AddToTuple(d:HyperDtree_pHyperDtree;
                                         VAR dn:HyperDtree_TupleOfHyperDtree);
   VAR p:HyperDtree_pLoHyperDtree;
BEGIN
   IF d=NIL THEN BEGIN
      (*should not occur*)
      END {THEN}
   ELSE BEGIN
      Mem_NewDefault(Loopholes.SizeOf(HyperDtree_LoHyperDtree), Loopholes.Retype(p,Mem_Ptr));
      p^.arg:=d;
      p^.next:=NIL;
      IF dn.first=NIL THEN BEGIN
	 dn.first:=p;
	 dn.last:=p
	 END
      ELSE BEGIN
	 dn.last^.next:=p;
	 dn.last:=p
      END {IF}
   END {IF}
END {HyperDtree_AddToTuple};


PROCEDURE HyperDtree_TakeFromTuple(VAR d:HyperDtree_pHyperDtree;
                                            VAR dn:HyperDtree_TupleOfHyperDtree);
BEGIN
   IF dn.first=NIL THEN BEGIN
      d:=NIL
      END
   ELSE BEGIN
      d:=dn.first^.arg;
      IF dn.first=dn.last THEN BEGIN
     	 dn.first:=NIL;dn.last:=NIL
         END
      ELSE BEGIN
         dn.first := dn.first^.next
      END
   END
END {HyperDtree_TakeFromTuple};


FUNCTION HyperDtree_IsEmptyTuple(dn:HyperDtree_TupleOfHyperDtree)
                    :BOOLEAN;
BEGIN
   HyperDtree_IsEmptyTuple:= dn.first=NIL
END {HyperDtree_IsEmptyTuple};



PROCEDURE HyperDtree_EmptySet(VAR dn:HyperDtree_SetOfHyperDtree);
BEGIN
   dn.first:=NIL;
   dn.last:=NIL
END {HyperDtree_EmptySet};


PROCEDURE HyperDtree_AddToSet(d:HyperDtree_pHyperDtree;
                                         VAR dn:HyperDtree_SetOfHyperDtree);
   VAR p:HyperDtree_pLoHyperDtree;
BEGIN
   IF d=NIL THEN BEGIN
      (*should not occur*)
      END {THEN}
   ELSE BEGIN
      Mem_NewDefault(Loopholes.SizeOf(HyperDtree_LoHyperDtree), Loopholes.Retype(p,Mem_ptr));
      p^.arg:=d;
      p^.next:=NIL;
      IF dn.first=NIL THEN BEGIN
	 dn.first:=p;
	 dn.last:=p
	 END
      ELSE BEGIN
	 dn.last^.next:=p;
	 dn.last:=p
      END {IF}
   END {IF}
END {HyperDtree_AddToSet};


PROCEDURE HyperDtree_TakeFromSet(VAR d:HyperDtree_pHyperDtree;
                                            VAR dn:HyperDtree_SetOfHyperDtree);
BEGIN
   IF dn.first=NIL THEN BEGIN
      d:=NIL
      END
   ELSE BEGIN
      d:=dn.first^.arg;
      IF dn.first=dn.last THEN BEGIN
     	 dn.first:=NIL;dn.last:=NIL
         END
      ELSE BEGIN
         dn.first := dn.first^.next
      END
   END
END {HyperDtree_TakeFromSet};


FUNCTION HyperDtree_IsEmptySet(dn:HyperDtree_SetOfHyperDtree)
                    :BOOLEAN;
BEGIN
   HyperDtree_IsEmptySet:= dn.first=NIL
END {HyperDtree_IsEmptySet};



PROCEDURE HyperDtree_SaveOrigin (first, last : HyperDtree_pLoStree;
                                          VAR d : HyperDtree_pHyperDtree);
BEGIN
   d^.LI^.first:= first;
   d^.LI^.last := last;
   d^.LI^.Done:= TRUE
END {HyperDtree_SaveOrigin};


FUNCTION HyperDtree_IsOriginSaved (d : HyperDtree_pHyperDtree)
                  : BOOLEAN;
BEGIN
   HyperDtree_IsOriginSaved:= d^.LI^.done
END {HyperDtree_IsOriginSaved};


PROCEDURE HyperDtree_ReturnOrigin (d : HyperDtree_pHyperDtree;
                                          VAR first, last: HyperDtree_pLoStree);
BEGIN
   first := d^.LI^.first;
   last  := d^.LI^.last;
END {HyperDtree_ReturnOrigin};





