(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : SuperDtree
 *  Creation date   :  27-APR-1987
 *  Author          : Carel Fellinger
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(SUPERDTREE);
pragma C_Include('lidomaint.pf');
pragma C_Include('mem.pf');
pragma C_Include('ldmrules.pf');
pragma C_Include('superdtree.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM SuperDtree;
WITH LIDOMAINT, MEM, LDMRULES;

PROCEDURE InitLIRecord(d: SuperDtree_pSuperDtree);
BEGIN
   WITH d^.LI^ DO BEGIN
      done := FALSE;
      HILDone := FALSE;
      bonus := 0;
      intmark1 := FALSE;
      intmark2 := SuperDtree_White;
      intnode  := NIL;
      BugString:= NIL;
   END
END {InitLIRecord};


PROCEDURE SuperDtree_NewBasicSuperDtree (VAR d : SuperDtree_pSuperDtree;
                                                  key : INTEGER{;
                                                  s : SuperDtree_pStree});
BEGIN
   Mem_NewDefault(Loopholes.SizeOf(SuperDtree_SuperDtree), Loopholes.Retype(d,Mem_Ptr));
   Mem_NewDefault(Loopholes.SizeOf(SuperDtree_LIRecord), Loopholes.Retype(d^.LI,Mem_Ptr));
   InitLIRecord(d);
   {d^.LI^.stree:= s;
   d^.LI^.done:= TRUE;}
   d^.nodeKind:= SuperDtree_basicNode;
   d^.key:= key;
   d^.robustmode := FALSE
END {SuperDtree_NewBasicSuperDtree};



PROCEDURE SuperDtree_NewVarSuperDtree (VAR d : SuperDtree_pSuperDtree;
                                                varType : LIDomaint_SyntCat;
                                                index : INTEGER{;
                                                s : SuperDtree_pStree});
BEGIN
   Mem_NewDefault(Loopholes.SizeOf(SuperDtree_SuperDtree), Loopholes.Retype(d,Mem_Ptr));
   Mem_NewDefault(Loopholes.SizeOf(SuperDtree_LIRecord), Loopholes.Retype(d^.LI,Mem_Ptr));
   InitLIRecord(d);
   {d^.LI^.stree:= s; 
   d^.LI^.done:= TRUE;}
   d^.nodeKind:= SuperDtree_varNode;
   d^.varType:= varType;
   d^.index:= index;
   d^.robustmode := FALSE
END {SuperDtree_NewVarSuperDtree};



PROCEDURE SuperDtree_NewSuperDtree (VAR d : SuperDtree_pSuperDtree;
                                             sg : LDMrules_SubgrammarIndex;
                                             R : LDMrules_RuleIndex;
                                             params : LDMrules_LIParameters{;
                                             s : SuperDtree_pStree});
BEGIN
   Mem_NewDefault(Loopholes.SizeOf(SuperDtree_SuperDtree), Loopholes.Retype(d,Mem_Ptr));
   Mem_NewDefault(Loopholes.SizeOf(SuperDtree_LIRecord), Loopholes.Retype(d^.LI,Mem_Ptr));
   InitLIRecord(d);
   {d^.LI^.stree:= s;
   d^.LI^.done:= TRUE;}
   d^.nodeKind:= SuperDtree_ruleNode;
   d^.sg:= sg;
   d^.R:= R;
   d^.parameters:= params;
   d^.EndOfSg := FALSE;
   {d^.nrOfArgs:= 0;}
   SuperDtree_EmptyTupleOfSuperSon(d^.args);
   d^.robustmode := FALSE
END {SuperDtree_NewSuperDtree};



PROCEDURE SuperDtree_MarkFirstDtree (VAR d : SuperDtree_pSuperDtree);
   VAR losuperson : SuperDtree_pLoSuperSon;
BEGIN
   IF {SuperDtree exists} d<>NIL {CAND}THEN IF
      {d is a node, not a basicexpression} d^.nodeKind=SuperDtree_ruleNode THEN BEGIN
         (* mark the first SuperDtree of each super-son *)
      losuperson:= d^.args.first;
      WHILE losuperson<>NIL DO BEGIN
            (* a superson should have at least one element, but we test for
             * robustness. *)
         IF losuperson^.it.first<>NIL THEN BEGIN
            losuperson^.it.cur:= losuperson^.it.first;
            SuperDtree_MarkFirstDtree(losuperson^.it.cur^.it)
         END {IF};
         losuperson:= losuperson^.next
      END {WHILE}
   END {IF}
END {SuperDtree_MarkFirstDtree};





FUNCTION SuperDtree_MarkNextDtree (VAR d : SuperDtree_pSuperDtree)
                    : BOOLEAN;
   VAR losuperson : SuperDtree_pLoSuperSon;
       done : BOOLEAN;
BEGIN
   done:= FALSE;
   IF {SuperDtree exists} d<>NIL {CAND}THEN IF
      {d is a node, not a basicexpression} d^.nodeKind=SuperDtree_ruleNode THEN BEGIN
         (* mark the next SuperDtree of the first superson in which it is possible *)
      losuperson:= d^.args.first;
      WHILE {there are more supersons} (losuperson<>NIL) AND
            {no new SuperDtree has been marked} NOT done DO BEGIN
            (* if possible mark the next SuperDtree in the currently marked node *)
         IF SuperDtree_MarkNextDtree(losuperson^.it.cur^.it) THEN BEGIN
            done:= TRUE
            END {THEN}
         ELSE BEGIN
               (* otherwise shift mark and mark the first SuperDtree in newly marked
                * node.
                * done = not 'cycled' during mark shifting *)
	    IF losuperson^.it.cur^.next<>NIL THEN BEGIN
	       losuperson^.it.cur:= losuperson^.it.cur^.next;
	       SuperDtree_MarkFirstDtree(losuperson^.it.cur^.it);
                  (* we did not need to 'cycle', so done becomes true *)
               done:= TRUE
               END {THEN}
            ELSE BEGIN
                  (* mark first SuperDtree of this superson *)
               losuperson^.it.cur:= losuperson^.it.first;
               SuperDtree_MarkFirstDtree(losuperson^.it.cur^.it);
                  (* we had to 'cycle', so done remains false *)
            END {IF}
         END {IF};
         losuperson:= losuperson^.next
      END {WHILE}
   END {IF};
   SuperDtree_MarkNextDtree:= done
END {SuperDtree_MarkNextDtree};



PROCEDURE SuperDtree_EmptySet(VAR ds:SuperDtree_SetOfSuperDtree);
BEGIN
   ds.first:=NIL;
   ds.last:=NIL
END {SuperDtree_EmptySet};


PROCEDURE SuperDtree_AddToSet(d:SuperDtree_pSuperDtree;
                                       VAR ds:SuperDtree_SetOfSuperDtree);
   VAR p:SuperDtree_pLoSuperDtree;
BEGIN
   IF d=NIL THEN BEGIN
      (*should not occur*)
      END {THEN}
   ELSE BEGIN
      Mem_NewDefault(Loopholes.SizeOf(SuperDtree_LoSuperDtree), Loopholes.Retype(p,Mem_Ptr));
      p^.it:=d;
      p^.next:=NIL;
      IF ds.first=NIL THEN BEGIN
	 ds.first:=p;
	 ds.last:=p
	 END
      ELSE BEGIN
	 ds.last^.next:=p;
	 ds.last:=p
      END {IF}
   END {IF}
END {SuperDtree_AddToSet};


PROCEDURE SuperDtree_TakeFromSet(VAR d:SuperDtree_pSuperDtree;
                                          VAR ds:SuperDtree_SetOfSuperDtree);
BEGIN
   IF ds.first=NIL THEN BEGIN
      d:=NIL
      END
   ELSE BEGIN
      d:=ds.first^.it;
      IF ds.first=ds.last THEN BEGIN
     	 ds.first:=NIL;ds.last:=NIL
         END
      ELSE BEGIN
         ds.first := ds.first^.next
      END
   END
END {SuperDtree_TakeFromSet};


FUNCTION SuperDtree_IsEmptySet(ds:SuperDtree_SetOfSuperDtree)
                    :BOOLEAN;
BEGIN
   SuperDtree_IsEmptySet:= ds.first=NIL
END {SuperDtree_IsEmptySet};


PROCEDURE SuperDtree_EmptyTuple(VAR dn:SuperDtree_TupleOfSuperDtree);
BEGIN
   dn.first:=NIL;
   dn.last:=NIL
END {SuperDtree_EmptyTuple};


PROCEDURE SuperDtree_AddToTuple(d:SuperDtree_pSuperDtree;
                                         VAR dn:SuperDtree_TupleOfSuperDtree);
   VAR p:SuperDtree_pLoSuperDtree;
BEGIN
   IF d=NIL THEN BEGIN
      (*should not occur*)
      END {THEN}
   ELSE BEGIN
      Mem_NewDefault(Loopholes.SizeOf(SuperDtree_LoSuperDtree), Loopholes.Retype(p,Mem_Ptr));
      p^.it:=d;
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
END {SuperDtree_AddToTuple};


PROCEDURE SuperDtree_TakeFromTuple(VAR d:SuperDtree_pSuperDtree;
                                            VAR dn:SuperDtree_TupleOfSuperDtree);
BEGIN
   IF dn.first=NIL THEN BEGIN
      d:=NIL
      END
   ELSE BEGIN
      d:=dn.first^.it;
      IF dn.first=dn.last THEN BEGIN
     	 dn.first:=NIL;dn.last:=NIL
         END
      ELSE BEGIN
         dn.first := dn.first^.next
      END
   END
END {SuperDtree_TakeFromTuple};


FUNCTION SuperDtree_IsEmptyTuple(dn:SuperDtree_TupleOfSuperDtree)
                    :BOOLEAN;
BEGIN
   SuperDtree_IsEmptyTuple:= dn.first=NIL
END {SuperDtree_IsEmptyTuple};



PROCEDURE SuperDtree_EmptyTupleOfSuperSon(VAR dsn:SuperDtree_TupleOfSuperSon);
BEGIN
   dsn.first:=NIL;
   dsn.last:=NIL
END {SuperDtree_EmptyTupleOfSuperSon};


PROCEDURE SuperDtree_AddToTupleOfSuperSon(ds:SuperDtree_SetOfSuperDtree;
                                             VAR dsn:SuperDtree_TupleOfSuperSon);
   VAR p:SuperDtree_pLoSuperSon;
BEGIN
   Mem_NewDefault(Loopholes.SizeOf(SuperDtree_LoSuperSon), Loopholes.Retype(p,Mem_Ptr));
   p^.it.first:= ds.first;
   p^.it.last:= ds.last;
   p^.next:=NIL;
   IF dsn.first=NIL THEN BEGIN
      dsn.first:=p;
      dsn.last:=p
      END
   ELSE BEGIN
      dsn.last^.next:=p;
      dsn.last:=p
   END {IF}
END {SuperDtree_AddToTupleOfSuperSon};


PROCEDURE SuperDtree_TakeFromTupleOfSSon(VAR ds:SuperDtree_SetOfSuperDtree;
                                                VAR dsn:SuperDtree_TupleOfSuperSon);
BEGIN
   IF dsn.first=NIL THEN BEGIN
      {should not occur}
      SuperDtree_EmptySet(ds)
      END
   ELSE BEGIN
      ds.first:= dsn.first^.it.first;
      ds.last:= dsn.first^.it.last;
      IF dsn.first=dsn.last THEN BEGIN
     	 dsn.first:=NIL;dsn.last:=NIL
         END
      ELSE BEGIN
         dsn.first := dsn.first^.next
      END
   END
END {SuperDtree_TakeFromTupleOfSSon};


FUNCTION SuperDtree_IsEmptyTupleOfSSon(dsn:SuperDtree_TupleOfSuperSon)
                  :BOOLEAN;
BEGIN
   SuperDtree_IsEmptyTupleOfSSon:= dsn.first=NIL
END {SuperDtree_IsEmptyTupleOfSSon};



PROCEDURE SuperDtree_SaveOrigin (t : SuperDtree_pStree;
                                          VAR d : SuperDtree_pSuperDtree);
BEGIN
   d^.LI^.Stree:= t;
   d^.LI^.Done:= TRUE
END {SuperDtree_SaveOrigin};


FUNCTION SuperDtree_IsOriginSaved (d : SuperDtree_pSuperDtree)
                  : BOOLEAN;
BEGIN
   SuperDtree_IsOriginSaved:= d^.LI^.Done
END {SuperDtree_IsOriginSaved};


FUNCTION SuperDtree_ReturnOrigin (d : SuperDtree_pSuperDtree)
                  : SuperDtree_pStree;
BEGIN
   SuperDtree_ReturnOrigin:= d^.LI^.Stree
END {SuperDtree_ReturnOrigin};


PROCEDURE SuperDtree_SaveTrfResult
                              (e : SuperDtree_pSetOfHyperNodeElt;
                               VAR d : SuperDtree_pSuperDtree);
BEGIN
   d^.LI^.hiltree := e;
   d^.LI^.hildone := TRUE;
END {SuperDtree_SaveTrfResult};


FUNCTION SuperDtree_IsTrfResultSaved (d : SuperDtree_pSuperDtree)
                  : BOOLEAN;
BEGIN {SuperDtree_IsTrfResultSaved}
   SuperDtree_IsTrfResultSaved:= d^.LI^.hildone
END {SuperDtree_IsTrfResultSaved};



FUNCTION SuperDtree_ReturnTrfResult(d: SuperDtree_pSuperDtree)
                             : SuperDtree_pSetOfHyperNodeElt;
BEGIN {SuperDtree_ReturnTrfResult}
   SuperDtree_ReturnTrfResult := d^.LI^.hiltree
END {SuperDtree_ReturnTrfResult};


FUNCTION SuperDtree_MakeSetOfSuperDtree: SuperDtree_pSetOfSuperDtree;
VAR
   d : SuperDtree_pSetOfSuperDtree;
BEGIN
   Mem_NewDefault(Loopholes.SizeOf(SuperDtree_SetOfSuperDtree), Loopholes.Retype(d,Mem_ptr));
   SuperDtree_MakeSetOfSuperDtree := d
END {SuperDtree_MakeSetOfSuperDtree};

