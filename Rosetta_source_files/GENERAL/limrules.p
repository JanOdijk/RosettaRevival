(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LIMRULES
 *  Creation date   :  23-OCT-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(LIMRULES);
pragma C_Include('mem.pf');
pragma C_Include('ldmrules.pf');
pragma C_Include('limrules.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM LIMRULES;
WITH MEM, LDMRULES;

CONST
   MaxRule = 600;
   MaxSG = 50;
   MaxTransformation = 600;
TYPE
   EffCeRuleSet = RECORD
                     EndOfSG : BOOLEAN;
                     set1 : SET OF 1..255;
                     set2 : SET OF 1..255;
                     set3 : SET OF 1..255
                  END;
VAR
   CeRuleRepresentation : ARRAY[1..MaxRule] OF
                            RECORD
                               scc,
                               prd      : LIMRULES_CeRuleSet;
                               sg       : INTEGER;
                               BeginOfSG,
                               EndOfSG  : BOOLEAN
                            END;
   CeTransfRepresentation : ARRAY[1..MaxTransformation] OF
                            RECORD
                               scc,
                               prd      : LIMRULES_CeRuleSet;
                               sg       : INTEGER;
                               BeginOfSG,
                               EndOfSG  : BOOLEAN
                            END;

   CeFirstLast      : ARRAY[1..MaxSG] OF
                         RECORD
                            first,
                            last      : LIMRULES_CeRuleSet
                         END;

   DerivableFrom    : ARRAY[1..MaxTransformation] OF
                         RECORD
                            done,
                            busy : BOOLEAN;
                            EndOfSG : BOOLEAN;
                            elts    : EffCeRuleSet
                         END;

PROCEDURE EffEmpty(VAR R: EffCeRuleSet);
BEGIN
   WITH R DO BEGIN
      set1      := [];
      set2      := [];
      set3      := [];
      EndOfSG   := FALSE;
   END
END {LIMRULES_Empty};


PROCEDURE EffUnion(CONST r1, r2: EffCeRuleSet; VAR r3: EffCeRuleSet);
BEGIN
   r3.EndOfSG := (r1.EndOfSG OR r2.EndOfSG);
   r3.set1    := r1.set1+r2.set1;
   r3.set2    := r1.set2+r2.set2;
   r3.set3    := r1.set3+r2.set3;
END {EffUnion};


PROCEDURE EffAddRule(r: INTEGER; VAR s: EffCeRuleSet);
BEGIN
   IF r > 510 THEN BEGIN
      r := r-510;
      s.set3 := s.set3+[r]
      END
   ELSE IF r > 255 THEN BEGIN
      r := r-255;
      s.set2 := s.set2+[r]
      END
   ELSE BEGIN
      s.set1 := s.set1+[r]
   END;
END {EffAddRule};


PROCEDURE LIMRULES_Empty(VAR R: LIMRULES_CeRuleSet);
BEGIN
   WITH R DO BEGIN
      first     := NIL; 
      last      := NIL;
      BeginOfSG := FALSE;
      EndOfSG   := FALSE;
      Eps       := FALSE;
   END
END {LIMRULES_Empty};


FUNCTION LIMRULES_STILLRules(CONST rules:LIMRULES_CeRuleSet): BOOLEAN;
BEGIN
   LIMRULES_STILLrules := NOT((rules.first=NIL ) AND (rules.last=NIL));
END; {LIMRULES_STILLrules}


PROCEDURE LIMRULES_AddRule(CONST r: INTEGER;
                           CONST k: LDMRULES_CtrlExprKind;
                           VAR rules:LIMRULES_CeRuleSet);
VAR n: LIMRULES_pLoCeRule;
BEGIN
   Mem_NewDefault(LoopHoles.SizeOf(LIMRULES_LoCeRule), LoopHoles.Retype(n,Mem_Ptr));
   WITH n^ DO BEGIN
      elt := r; kind := k; nxt := NIL
   END;
   IF rules.first = NIL THEN BEGIN
      rules.first := n; rules.last := rules.first;
      END
   ELSE BEGIN
      rules.last^.nxt := n; rules.last := n;
   END
END; {LIMRULES_AddRule}


PROCEDURE LIMRULES_TAKERule(VAR r : INTEGER;
                                     VAR k : LDMRULES_CtrlExprKind; 
                                     VAR rules:LIMRULES_CeRuleSet);
BEGIN
   WITH rules.first^ DO BEGIN
      r := elt; k := kind
   END;
   IF rules.last = rules.first THEN BEGIN
      rules.first := NIL; rules.last := rules.first;
      END
   ELSE BEGIN
      rules.first := rules.first^.nxt;
   END;
END; {LIMRULES_TAKERule}


PROCEDURE LIMRULES_Union(rules1, rules2: LIMRULES_CeRuleSet;
                         VAR rules3 : LIMRULES_CeRuleSet);
VAR 
    a1: INTEGER;
    a2: LDMRULES_CtrlExprKind;
BEGIN
   LIMRULES_Empty(rules3);
   WHILE LIMRULES_STILLrules(rules1) DO BEGIN
      LIMRULES_TAKErule(a1, a2, rules1);
      LIMRULES_AddRule(a1, a2, rules3)
   END;
   IF rules1.BeginOfSG THEN rules3.BeginOfSG := TRUE;
   IF rules1.EndOfSG   THEN rules3.EndOfSG := TRUE;
   WHILE LIMRULES_STILLrules(rules2) DO BEGIN
      LIMRULES_TAKErule(a1, a2, rules2);
      LIMRULES_AddRule(a1, a2, rules3)
   END;
   IF rules2.BeginOfSG THEN rules3.BeginOfSG := TRUE;
   IF rules2.EndOfSG   THEN rules3.EndOfSG := TRUE
END; {LIMRULES_Union}


FUNCTION LIMRULES_Merge(CONST rules1, rules2: LIMRULES_CeRuleSet): LIMRULES_CeRuleSet;
VAR 
   rules3 : LIMRULES_CeRuleSet;
BEGIN
   LIMRULES_Union(rules1, rules2, rules3);
{
   IF rules1.Eps THEN BEGIN
      LIMRULES_Union(rules1, rules2, rules3)
      END
   ELSE BEGIN
      rules3 := rules1
   END;
}
   LIMRULES_Merge := rules3
END {LIMRULES_Merge};


FUNCTION LIMRULES_Last(CONST ce: LDMRULES_CtrlExpr): LIMRULES_CeRuleSet;
VAR
   Lnew,
   L    : LIMRULES_CeRuleSet;
   cew  : LDMRULES_pCtrlExprLst;
   eps  : BOOLEAN;
BEGIN
   LIMRULES_Empty(Lnew);
   CASE ce.kind OF
      concatenation:
         BEGIN
            cew := ce.right; eps := TRUE; 
            WHILE (cew <> NIL) AND eps DO BEGIN
               L := LIMRULES_Last(cew^.ce);
               eps := L.eps;
               LIMRULES_Union(Lnew, L, Lnew);
               cew := cew^.left
            END;
            Lnew.eps := eps
         END;
      alternative:
         BEGIN
            cew := ce.left; eps := FALSE;
            WHILE cew <> NIL DO BEGIN
               L := LIMRULES_Last(cew^.ce);
               IF L.eps THEN eps := TRUE;
               LIMRULES_Union(L, Lnew, Lnew);
               cew := cew^.right
            END;
            Lnew.eps := eps
         END;
      option, iteration:
         BEGIN
            Lnew := LIMRULES_Last(ce.ce^); Lnew.eps := TRUE
         END;
      rule:      
         BEGIN
            LIMRULES_AddRule(ce.R, rule, Lnew);
         END;
      transformation:
         BEGIN
            LIMRULES_AddRule(ce.R, transformation, Lnew);
         END;
   END {CASE};
   LIMRULES_Last := Lnew;
END {LIMRULES_Last};


FUNCTION LIMRULES_First(CONST ce: LDMRULES_CtrlExpr): LIMRULES_CeRuleSet;
VAR
   Lnew,
   L    : LIMRULES_CeRuleSet;
   cew  : LDMRULES_pCtrlExprLst;
   eps  : BOOLEAN;
BEGIN
   LIMRULES_Empty(Lnew);
   CASE ce.kind OF
      concatenation:
         BEGIN
            cew := ce.left; eps := TRUE; 
            WHILE (cew <> NIL) AND eps DO BEGIN
               L := LIMRULES_First(cew^.ce);
               eps := L.eps;
               LIMRULES_Union(Lnew, L, Lnew);
               cew := cew^.right
            END;
            Lnew.eps := eps
         END;
      alternative:
         BEGIN
            cew := ce.left; eps := FALSE;
            WHILE cew <> NIL DO BEGIN
               L := LIMRULES_First(cew^.ce);
               IF L.eps THEN eps := TRUE;
               LIMRULES_Union(L, Lnew, Lnew);
               cew := cew^.right
            END;
            Lnew.eps := eps
         END;
      option, iteration:
         BEGIN
            Lnew := LIMRULES_First(ce.ce^); Lnew.eps := TRUE
         END;
      rule:      
         BEGIN
            LIMRULES_AddRule(ce.R, rule, Lnew);
         END;
      transformation:
         BEGIN
            LIMRULES_AddRule(ce.R, transformation, Lnew);
         END;
   END {CASE};
   LIMRULES_First := Lnew;
END {LIMRULES_First};


FUNCTION LIMRULES_Pred(CONST ce: LDMRULES_CtrlExpr; 
                       CONST R: LIMRULES_CeRuleSet;
                       sgin: INTEGER): LIMRULES_CeRuleSet;
VAR
   Rnew : LIMRULES_CeRuleSet;
   cew  : LDMRULES_pCtrlExprLst;
BEGIN
   LIMRULES_Empty(Rnew);
   CASE ce.kind OF
      concatenation:
         BEGIN
            cew := ce.left; Rnew := R;
            WHILE cew <> NIL DO BEGIN
               Rnew := LIMRULES_Pred(cew^.ce, Rnew, sgin);
               cew := cew^.right
            END
         END;
      alternative:
         BEGIN
            cew := ce.left;
            WHILE cew <> NIL DO BEGIN
               LIMRULES_Union(LIMRULES_Pred(cew^.ce, R, sgin), Rnew, Rnew);
               cew := cew^.right
            END;
         END;
      option:
         BEGIN
            Rnew := LIMRULES_Pred(ce.ce^, R, sgin); 
            LIMRULES_Union(R, Rnew, Rnew);
         END;
      iteration:
         BEGIN
            Rnew := LIMRULES_Pred(ce.ce^, 
                                  LIMRULES_Merge(LIMRULES_Last(ce.ce^), R), sgin);
            LIMRULES_Union(R, Rnew, Rnew)
         END;
      rule:      
         BEGIN
            WITH CeRuleRepresentation[ce.R] DO BEGIN      
               prd := R;
               BeginOfSg := R.BeginOfSG;
               sg := sgin
            END;
            LIMRULES_AddRule(ce.R, rule, Rnew);
         END;
      transformation:
         BEGIN
            WITH CeTransfRepresentation[ce.T] DO BEGIN      
               prd := R;
               BeginOfSg := R.BeginOfSG;
               sg := sgin
            END;
            LIMRULES_AddRule(ce.T, transformation, Rnew);
         END;
   END {CASE};
   LIMRULES_Pred := Rnew;
END {LIMRULES_Pred};


FUNCTION LIMRULES_Succ(CONST ce: LDMRULES_CtrlExpr; 
                       CONST R: LIMRULES_CeRuleSet;
                       sgin: INTEGER): LIMRULES_CeRuleSet;
VAR
   Rnew : LIMRULES_CeRuleSet;
   cew  : LDMRULES_pCtrlExprLst;
BEGIN
   LIMRULES_Empty(Rnew);
   CASE ce.kind OF
      concatenation:
         BEGIN
            cew := ce.right; Rnew := R;
            WHILE cew <> NIL DO BEGIN
               Rnew := LIMRULES_Succ(cew^.ce, Rnew, sgin);
               cew := cew^.left
            END
         END;
      alternative:
         BEGIN
            cew := ce.right;
            WHILE cew <> NIL DO BEGIN
               LIMRULES_Union(LIMRULES_Succ(cew^.ce, R, sgin), Rnew, Rnew);
               cew := cew^.left
            END;
         END;
      option:
         BEGIN
            Rnew := LIMRULES_Succ(ce.ce^, R, sgin); 
            LIMRULES_Union(R, Rnew, Rnew);
         END;
      iteration:
         BEGIN
            Rnew := LIMRULES_Succ(ce.ce^, 
                                  LIMRULES_Merge(LIMRULES_First(ce.ce^), R), sgin);
            LIMRULES_Union(R, Rnew, Rnew)
         END;
      rule:      
         BEGIN
            WITH CeRuleRepresentation[ce.R] DO BEGIN      
               scc := R;
               EndOfSg := R.EndOfSG;
               sg := sgin
            END;
            LIMRULES_AddRule(ce.R, rule, Rnew);
         END;
      transformation:
         BEGIN
            WITH CeTransfRepresentation[ce.T] DO BEGIN      
               scc := R;
               EndOfSg := R.EndOfSG;
               sg := sgin
            END;
            LIMRULES_AddRule(ce.T, transformation, Rnew);
         END;
   END {CASE};
   LIMRULES_Succ := Rnew;
END {LIMRULES_Succ};


FUNCTION LIMRULES_Derive(t: INTEGER): EffCeRuleSet;
VAR
   p      : LIMRULES_CeRuleSet;
   result : EffCeRuleSet;
   r   : INTEGER;
   k   : LDMRULES_CtrlExprKind;
BEGIN
   EffEmpty(result);
   IF (NOT Derivablefrom[t].busy) AND (NOT Derivablefrom[t].done) THEN BEGIN
      p := CeTransfRepresentation[t].scc;
      DerivableFrom[t].busy := TRUE;
      WHILE LIMRULES_StillRules(p) DO BEGIN
         LIMRULES_TakeRule(r, k, p);
         IF k = transformation THEN BEGIN
            EffUnion(result, LIMRULES_Derive(r), result)
            END
         ELSE BEGIN
            EffAddRule(r, result)
         END
      END;      
      DerivableFrom[t].busy := FALSE;
      DerivableFrom[t].done := TRUE;
      IF CeTransfRepresentation[t].EndOfSG THEN result.EndOfSG := TRUE;
      IF result.EndOfSG THEN Derivablefrom[t].EndOfSG := TRUE;
      Derivablefrom[t].elts    := result;
      END
   ELSE IF Derivablefrom[t].done THEN BEGIN
      result := Derivablefrom[t].elts
   END;
   LIMRULES_Derive := result
END {LIMRULES_Derive};


FUNCTION LIMRULES_BeginOfSubGrammar(CONST rules: LIMRULES_CeRuleSet): BOOLEAN;
BEGIN
   LIMRULES_BeginOfSubGrammar := rules.BeginOfSG
END {LIMRULES_BeginOfSubGrammar};


FUNCTION LIMRULES_Predecessors(CONST r : INTEGER;
                               CONST k : LDMRULES_CtrlExprKind)
                  :LIMRULES_CeRuleSet;
BEGIN
   CASE k OF
      rule          : LIMRULES_Predecessors := CeRuleRepresentation[r].prd;
      transformation: LIMRULES_Predecessors := CeTransfRepresentation[r].prd
   END
END {LIMRULES_Predecessors};


FUNCTION LIMRULES_Successors(CONST r : INTEGER;
                             CONST k : LDMRULES_CtrlExprKind)
                  :LIMRULES_CeRuleSet;
BEGIN
   CASE k OF
      rule          : LIMRULES_Successors := CeRuleRepresentation[r].scc;
      transformation: LIMRULES_Successors := CeTransfRepresentation[r].scc
   END
END {LIMRULES_Successors};


FUNCTION LIMRULES_DerivableFrom(t1, r1: INTEGER): BOOLEAN;
BEGIN
   LIMRULES_DerivableFrom := FALSE;
   IF r1 < 0 THEN BEGIN

      (*-------------------------------------------------------------------*
       * r1 < 0 means that it is the end of a subgrammar
       *-------------------------------------------------------------------*)

      LIMRULES_Derivablefrom := Derivablefrom[t1].EndOfSG
      END
   ELSE BEGIN
      IF r1 > 510 THEN BEGIN
         r1 := r1-510;
         LIMRULES_Derivablefrom := (r1 IN Derivablefrom[t1].elts.set3)
         END
      ELSE IF r1 > 255 THEN BEGIN
         r1 := r1-255;
         LIMRULES_Derivablefrom := (r1 IN Derivablefrom[t1].elts.set2)
         END
      ELSE BEGIN
         LIMRULES_Derivablefrom := (r1 IN Derivablefrom[t1].elts.set1)
      END
   END;
END {LIMRULES_DerivableFrom};


FUNCTION LIMRULES_SGLast(sg: INTEGER): LIMRULES_CeRuleSet;
BEGIN
   LIMRULES_SGLast := CeFirstLast[sg].last 
END {LIMRULES_SGLast};


FUNCTION LIMRULES_SGFirst(sg: INTEGER): LIMRULES_CeRuleSet;
BEGIN
   LIMRULES_SGFirst := CeFirstLast[sg].first 
END {LIMRULES_SGFirst};


FUNCTION LIMRULES_IsBeginOfSG(CONST r: INTEGER;
                              CONST k: LDMRULES_CtrlExprKind;
                              CONST sgin: INTEGER)
                  : BOOLEAN;
BEGIN {LIMRULES_IsBeginOfSG}
   IF k = transformation THEN BEGIN
      WITH CeTransfRepresentation[r] DO BEGIN
      LIMRULES_IsBeginOfSG:= (BeginOfSG AND (sg = sgin))
      END
      END
   ELSE BEGIN
      WITH CeRuleRepresentation[r] DO BEGIN
      LIMRULES_IsBeginOfSG:= (BeginOfSG AND (sg = sgin))
      END
   END
END {LIMRULES_IsBeginOfSG};



FUNCTION LIMRULES_IsEndOfSG(CONST r: INTEGER;
                            CONST k: LDMRULES_CtrlExprKind;
                            CONST sgin: INTEGER)
                  : BOOLEAN;
BEGIN {LIMRULES_IsEndOfSG}
   IF k = transformation THEN BEGIN
      WITH CeTransfRepresentation[r] DO BEGIN
      LIMRULES_IsEndOfSG:= (EndOfSG AND (sg = sgin))
      END
      END
   ELSE BEGIN
      WITH CeRuleRepresentation[r] DO BEGIN
      LIMRULES_IsEndOfSG:= (EndOfSG AND (sg = sgin))
      END
   END
END {LIMRULES_IsEndOfSG};


FUNCTION LIMRULES_IsSuccOf(r1, r2: INTEGER)
                  : BOOLEAN;
VAR
   found : BOOLEAN;
   k     : LDMRULES_CtrlExprKind;
   s     : LIMRULES_CeRuleSet;
   r     : INTEGER;
BEGIN {LIMRULES_IsSuccOf}
   s := CeRuleRepresentation[r1].scc; found := FALSE;
   WHILE LIMRULES_StillRules(s) and ( NOT found) DO BEGIN
      LIMRULES_TakeRule(r, k, s);
      found := ((k = rule) AND ( r = r2 ))
   END;
   LIMRULES_IsSuccOf:=found
END {LIMRULES_IsSuccOf};




PROCEDURE LIMRULES_Init;
VAR
   Rlast,
   Rfirst : LIMRULES_CeRuleSet;
   ce     : LDMRULES_CtrlExpr;
   t, r,
   sg     : INTEGER;
   DummySet : EffCeRuleSet;
BEGIN
   LIMRULES_Empty(Rfirst);
   Rfirst.BeginOfSG := TRUE;
   LIMRULES_Empty(Rlast);
   Rlast.EndOfSG := TRUE;
   FOR sg := LDMrules_MinSubGrammarIndex TO LDMrules_MaxSubGrammarIndex DO BEGIN
      LDMRULES_TheCtrlExpr(sg, ce);
      CeFirstLast[sg].last := LIMRULES_Pred(ce, Rfirst, sg);
      CeFirstLast[sg].first:= LIMRULES_Succ(ce, Rlast, sg)      
   END;

   FOR t:=1 TO MaxTransformation DO BEGIN
      WITH Derivablefrom[t] DO BEGIN
         busy := FALSE;
         done := FALSE;
         EndOfSG := FALSE;
      END;
      EffEmpty(Derivablefrom[t].elts);
      DummySet := LIMRULES_Derive(t);
   END;

END {LIMRULES_Init};

