
(*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LSMRUQUO
 *  Creation date   :  1-FEB-1988
 *  Author          : rene leermakers
 *
 *  Copyright (c) 1987, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

EXPORT(lsmruquo);
pragma C_include('lsmruquo.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('lsstree.pf');
pragma C_include('mem.pf');
pragma C_include('copyt.pf');
pragma C_include('maket.pf');
pragma C_include('lsauxdom.pf');
pragma C_include('strtokey.pf');
pragma C_include('liiddict.pf');
pragma C_include('ldcatsets.pf');
pragma C_include('lidomaint.pf');
pragma C_include('str.pf');
pragma C_include('string.pf');
pragma C_include('ldgetkey.pf');
pragma C_include('listree.pf');


PROGRAM LSMRUQUO;
WITH lsdomaint,lsstree,mem,copyt,maket,lsauxdom,strtokey,liiddict,ldcatsets,
lidomaint,str,strng,ldgetkey,listree;


CONST specrel = -1;
      maxstr = 15;

TYPE synrelarray = ARRAY[LSDOMAINT_synrel] OF INTEGER;

VAR
  stackptr : MEM_stackptr; 
  Srelorder: synrelarray;
  VPrelorder: synrelarray;
  ADJPrelorder: synrelarray;

PROCEDURE copylist(L1:LSMRUQUO_Listofstrees;VAR L2:LSMRUQUO_Listofstrees);
VAR p,p1:LSSTREE_prelnode;
BEGIN
IF L1.first=NIL THEN 
  BEGIN
  L2.first:=L1.first;
  L2.last:=L1.last;
  END
ELSE
  BEGIN
  MEM_newdefault(loopholes.sizeof(LSSTREE_relnode),loopholes.retype(p1,MEM_ptr));
  p:=p1;
  p1^:=L1.first^;
  p1^.brother:=NIL;
  L2.first:=p1;
  WHILE L1.first<>L1.last DO
    BEGIN
    L1.first:=L1.first^.brother;
    MEM_newdefault(loopholes.sizeof(LSSTREE_relnode),loopholes.retype(p1,MEM_ptr));
    p^.brother:=p1;
    p:=p1;
    p1^:=L1.first^;
    p1^.brother:=NIL;
    END;
  L2.last:=p
  END;
END;

PROCEDURE appendlists(L1:LSMRUQUO_ListOfStrees;
                         VAR L2:LSMRUQUO_ListOfStrees);
{*if L1 is not empty, its content is appended to the end of L2}

BEGIN
IF (L2.first=NIL) AND (L2.last=NIL) THEN
	BEGIN
	L2.first:=L1.first;L2.last:=L1.last
	END
ELSE
	BEGIN
	IF (L1.first<>NIL) OR (L1.last<>NIL) THEN
                BEGIN
		L2.last^.brother:=L1.first;
		L2.last:=L1.last
		END
	END
END;

PROCEDURE initreltreelist(VAR mu1:LSMRUQUO_listofstrees);
BEGIN
mu1.first:=NIL;mu1.last:=NIL;
END;

FUNCTION stillreltrees(L1:LSMRUQUO_ListOfStrees):BOOLEAN;
BEGIN
IF L1.first<>NIL then stillreltrees:=TRUE
ELSE stillreltrees:=FALSE
END;

PROCEDURE appendrelandtree(rel:LSDOMAINT_synrel;tree:LSSTREE_pstree;VAR L1:LSMRUQUO_Listofstrees);
VAR p:LSSTREE_prelnode;
BEGIN
MEM_newdefault(loopholes.sizeof(LSSTREE_relnode),loopholes.retype(p,MEM_ptr));
p^.relation:=rel;
p^.node:=tree;
p^.brother:=NIL;
IF L1.first=NIL THEN
  BEGIN
  L1.first:=p;
  L1.last:=p
  END
ELSE
  BEGIN
  L1.last^.brother:=p;
  L1.last:=p
  END
END;

PROCEDURE appendreltree(reltree:LSSTREE_prelnode;VAR L1:LSMRUQUO_Listofstrees);
VAR p:LSSTREE_prelnode;
BEGIN
MEM_newdefault(loopholes.sizeof(LSSTREE_relnode),loopholes.retype(p,MEM_ptr));
p^.relation:=reltree^.relation;
p^.node:=reltree^.node;
p^.brother:=NIL;
IF L1.first=NIL THEN
  BEGIN
  L1.first:=p;
  L1.last:=p
  END
ELSE
  BEGIN
  L1.last^.brother:=p;
  L1.last:=p
  END
END;

PROCEDURE takerelandtree(VAR rel:LSDOMAINT_synrel;VAR tree:LSSTREE_pstree;
                                       VAR L1:LSMRUQUO_Listofstrees);
BEGIN
IF L1.first=NIL THEN tree:=NIL
ELSE
  BEGIN
  rel:=L1.first^.relation;
  tree:=L1.first^.node;
  IF L1.first=L1.last THEN
    BEGIN
    L1.first:=nil;L1.last:=nil
    END
  ELSE L1.first:=L1.first^.brother
  END
END;

PROCEDURE takereltree(VAR reltree:LSSTREE_prelnode;
                      VAR L1:LSMRUQUO_Listofstrees);
BEGIN
IF L1.first=NIL THEN reltree:=NIL
ELSE
  BEGIN
  reltree:=L1.first;
  IF L1.first=L1.last THEN
    BEGIN
    L1.first:=nil;L1.last:=nil
    END
  ELSE L1.first:=L1.first^.brother
  END
END;

PROCEDURE PutSonsInMu(sons:LSSTREE_prelnode;VAR mu:LSMRUQUO_ListOfStrees);
BEGIN
mu.first:=sons;
mu.last:=sons;
WHILE sons<>NIL DO
  BEGIN
  mu.last:=sons;
  sons:=sons^.brother;
  END;

END;



FUNCTION LSMRUQUO_bigpronp(T:LSSTREE_pSTREE)
                  :BOOLEAN ;
VAR result      : BOOLEAN;
BEGIN {LSMRUQUO_bigpronp}
   result := (T^.cat = NP);
   IF result THEN result := ((T^.sons^.relation = head) AND
                             (T^.sons^.node^.cat = BIGPRO)
                            );
   LSMRUQUO_bigpronp:= result;
END {LSMRUQUO_bigpronp};



FUNCTION LSMRUQUO_polarityok(t:LSSTREE_pStree):BOOLEAN;
VAR
    deepsentreq,
    error                                : BOOLEAN;
    reqvar, envvar, Vreqvar, defpolval,
    topsentreq
                                         :LSDOMAINT_polarityeffsettype;
    topcat                               :LSDOMAINT_syntcat;


FUNCTION compatible(pol1, pol2:LSDOMAINT_polarityEFFSETtype):BOOLEAN;
BEGIN {compatible}
  compatible := (NOT ((pol1 = [pospol]) AND (pol2 = [negpol]) OR
                      (pol1 = [negpol]) AND (pol2 = [pospol])
                     )
                );
END {compatible};

PROCEDURE adapt(    pol1:LSDOMAINT_polarityEFFSETtype;
                VAR pol2:LSDOMAINT_polarityEFFSETtype
               );

BEGIN
IF      (pol1 = defpolval)  THEN {niets doen}
ELSE IF (pol1 = [pospol])   THEN  IF   pol2 = [negpol] 
                                  THEN error := true
                                  ELSE pol2 := [pospol]
ELSE IF (pol1 = [negpol])   THEN  IF   pol2 = [pospol]
                                  THEN error := true
                                  ELSE pol2 := [negpol];
END {adapt};

PROCEDURE eval(n:LSSTREE_pStree);
BEGIN
CASE n^.cat OF
  VERB:     BEGIN
              adapt(n^.ls^.VERBfield^.req,Vreqvar);
              IF deepsentreq THEN adapt(n^.ls^.VERBfield^.env, envvar);
            END;
  SENTENCE: BEGIN{1}
              IF compatible(Vreqvar, envvar) 
              THEN adapt(Vreqvar, reqvar)
              ELSE error := true;
              IF   (n^.ls^.SENTENCEfield^.mood = yesnointerrogative)
              THEN adapt([negpol], envvar);
              IF    (reqvar = defpolval) THEN  
                             BEGIN {2}
                               envvar := [omegapol];
                             END {2}
              ELSE IF (reqvar = [negpol]) THEN
                              BEGIN {3}
                               IF      (envvar = defpolval) THEN {doe niks}
                               ELSE IF (envvar = [negpol]) THEN
                                           BEGIN {4}
                                             reqvar  := defpolval;
                                             envvar  := defpolval;
                                             Vreqvar := defpolval;
                                           END {4}
                                ELSE IF (envvar=[pospol])  THEN error := true;
                              END {3}
              ELSE IF (reqvar = [pospol]) THEN
                              BEGIN {5}
                               IF      (envvar = defpolval) THEN
                                          BEGIN {6}
                                             reqvar  := defpolval;
                                             envvar  := defpolval;
                                             Vreqvar := defpolval;
                                           END {6}
                                ELSE IF (envvar = [negpol])  THEN error := true
                               ELSE IF (envvar = [pospol])  THEN
                                           BEGIN {6}
                                             reqvar  := defpolval;
                                             envvar  := defpolval;
                                             Vreqvar := defpolval;
                                           END {6};
                              END; {5}
              topsentreq := reqvar;
              deepsentreq := (topsentreq <> defpolval );
            END {1};
  {otherlexcat with req and env}
ADJ: 
            BEGIN
              IF    compatible(n^.ls^.ADJfield^.req, envvar)
              THEN adapt(n^.ls^.ADJfield^.req, reqvar)
              ELSE error := true;
              IF (n^.ls^.ADJfield^.req <> defpolval) THEN envvar := defpolval;
              adapt(n^.ls^.ADJfield^.env, envvar);
              deepsentreq := ( deepsentreq                       AND 
                               (n^.ls^.ADJfield^.req = defpolval)
                             );
            END;
ADV: 
            BEGIN
              IF    compatible(n^.ls^.ADVfield^.req, envvar)
              THEN adapt(n^.ls^.ADVfield^.req, reqvar)
              ELSE error := true;
              IF (n^.ls^.ADVfield^.req <> defpolval) THEN envvar := defpolval;
              adapt(n^.ls^.ADVfield^.env, envvar);
              deepsentreq := ( deepsentreq                       AND 
                               (n^.ls^.ADVfield^.req = defpolval)
                             );
            END;
CONJ: 
            BEGIN
              IF    compatible(n^.ls^.CONJfield^.req, envvar)
              THEN adapt(n^.ls^.CONJfield^.req, reqvar)
              ELSE error := true;
              IF (n^.ls^.CONJfield^.req <> defpolval) THEN envvar := defpolval;
              adapt(n^.ls^.CONJfield^.env, envvar);
              deepsentreq := ( deepsentreq                       AND 
                               (n^.ls^.CONJfield^.req = defpolval)
                             );
            END;
DET:
            BEGIN
              IF    compatible(n^.ls^.DETfield^.req, envvar)
              THEN adapt(n^.ls^.DETfield^.req, reqvar)
              ELSE error := true;
              IF (n^.ls^.DETfield^.req <> defpolval) THEN envvar := defpolval;
              adapt(n^.ls^.DETfield^.env, envvar);
              deepsentreq := ( deepsentreq                       AND 
                               (n^.ls^.DETfield^.req = defpolval)
                             );
            END;
INDEFPRO: 
            BEGIN
              IF    compatible(n^.ls^.INDEFPROfield^.req, envvar)
              THEN adapt(n^.ls^.INDEFPROfield^.req, reqvar)
              ELSE error := true;
              IF (n^.ls^.INDEFPROfield^.req <> defpolval) THEN envvar := defpolval;
              adapt(n^.ls^.INDEFPROfield^.env, envvar);
              deepsentreq := ( deepsentreq                       AND 
                               (n^.ls^.INDEFPROfield^.req = defpolval)
                             );
            END;
NOUN: 
            BEGIN
              IF    compatible(n^.ls^.NOUNfield^.req, envvar)
              THEN adapt(n^.ls^.NOUNfield^.req, reqvar)
              ELSE error := true;
              IF (n^.ls^.NOUNfield^.req <> defpolval) THEN envvar := defpolval;
              adapt(n^.ls^.NOUNfield^.env, envvar);
              deepsentreq := ( deepsentreq                       AND 
                               (n^.ls^.NOUNfield^.req = defpolval)
                             );
            END;
PREP: 
            BEGIN
              IF    compatible(n^.ls^.PREPfield^.req, envvar)
              THEN adapt(n^.ls^.PREPfield^.req, reqvar)
              ELSE error := true;
              IF (n^.ls^.PREPfield^.req <> defpolval) THEN envvar := defpolval;
              adapt(n^.ls^.PREPfield^.env, envvar);
              deepsentreq := ( deepsentreq                       AND 
                               (n^.ls^.PREPfield^.req = defpolval)
                             );
            END;
Q: 
            BEGIN
              IF    compatible(n^.ls^.Qfield^.req, envvar)
              THEN adapt(n^.ls^.Qfield^.req, reqvar)
              ELSE error := true;
              IF (n^.ls^.Qfield^.req <> defpolval) THEN envvar := defpolval;
              adapt(n^.ls^.Qfield^.env, envvar);
              deepsentreq := ( deepsentreq                       AND 
                               (n^.ls^.Qfield^.req = defpolval)
                             );
            END;
NEG: adapt([negpol],envvar);
END
END {eval};


PROCEDURE TraverseStree(t:LSSTREE_pStree);
FORWARD;

PROCEDURE TraverseRelTree(rt:LSSTREE_pRelNode);
FORWARD;

PROCEDURE TraverseStree;
BEGIN
  IF (t^.sons <> nil)                          
  THEN IF
         ( NOT ((LDCATSETS_LEXCAT(loopholes.retype(t^.cat,LIDOMAINT_syntcat)) )  AND
                (NOT LDCATSETS_LEXCAT(loopholes.retype(t^.sons^.node^.cat,LIDOMAINT_syntcat)) )
               )
         )
       THEN TraverseRelTree(t^.sons);
  IF   (t^.cat IN [ADJ, ADV, CONJ, DET, INDEFPRO, NEG, NOUN, PREP, 
                   Q, VERB, SENTENCE]) 
  THEN eval(t);
END {TraverseStree};

PROCEDURE TraverseRelTree;
BEGIN
  IF (rt^.brother <> NIL)    THEN TraverseRelTree(rt^.brother);
  IF (rt^.node    <> NIL)    THEN TraverseStree(rt^.node);
END {TraverseRelTree};

BEGIN {LSMRUQUO_polarityok}
defpolval  := [omegapol, negpol, pospol];
error      := false;
reqvar     := defpolval;
envvar     := defpolval;
Vreqvar    := defpolval;
topsentreq := defpolval;
deepsentreq:= false;
topcat     := t^.cat;
TraverseStree(t);
IF (topcat <> SENTENCE) 
  THEN LSMRUQUO_polarityok := ((NOT error)             AND
                               (topsentreq = defpolval)
                              )
  ELSE LSMRUQUO_polarityok := ((NOT error)          AND
                               (reqvar = defpolval)
                              );
END {LSMRUQUO_polarityok};



FUNCTION LSMRUQUO_ReciproAnt(T:LSSTREE_pSTREE)
                  : BOOLEAN;
VAR result : BOOLEAN;
BEGIN {LSMRUQUO_ReciproAnt}
   result := (T^.CAT IN [NPVAR, CNVAR]);
   IF   result 
   THEN BEGIN
     CASE T^.CAT OF
       NPVAR: result := ((T^.ls^.NPVARfield^.number = plural) OR
                         (T^.ls^.NPVARfield^.NPhead IN 
                              [oneNP, reciproNP]) 
                        );
       CNVAR: result := (plural IN T^.ls^.CNVARfield^.numbers);   
     END;
   END;
   LSMRUQUO_ReciproAnt:= result;
END {LSMRUQUO_ReciproAnt};




FUNCTION LSMRUQUO_CheckAktarts(
                          classes:LSDOMAINT_classSETtype;
                          aktarts: LSDOMAINT_AktionsartEFFSETtype)

                          :BOOLEAN;

VAR hulpaktarts: LSDOMAINT_aktionsartEFFSETtype;

BEGIN
   hulpaktarts := [];
   IF   (stativeclass IN classes) 
   THEN hulpaktarts := hulpaktarts + [stative];
   IF   (movementclass IN classes) 
   THEN hulpaktarts := hulpaktarts + [stative, activity, accomplishment];
   IF   (durativeclass IN classes) 
   THEN hulpaktarts := hulpaktarts + [stative, activity, accomplishment];
   IF   (momentaryclass IN classes) 
   THEN hulpaktarts := hulpaktarts + [stative, achievement];
   IF   (dynstativeclass IN classes) 
   THEN hulpaktarts := hulpaktarts + [stative, dynstative];
   IF   (iterativeclass IN classes) 
   THEN hulpaktarts := hulpaktarts + [stative, activity];

   LSMRUQUO_CheckAktarts := (hulpaktarts * aktarts <> []); 
END;

PROCEDURE LSMRUQUO_AssignAktarts(
                       classes:LSDOMAINT_classSETtype;
                       VAR aktarts:LSDOMAINT_AktionsartEFFSETtype);
                     
BEGIN
   aktarts := [];
   IF   (stativeclass IN classes) 
   THEN aktarts := aktarts + [stative];
   IF   (movementclass IN classes) 
   THEN aktarts := aktarts + [stative, activity, accomplishment];
   IF   (durativeclass IN classes) 
   THEN aktarts := aktarts + [stative, activity, accomplishment];
   IF   (momentaryclass IN classes) 
   THEN aktarts := aktarts + [stative, achievement];
   IF   (dynstativeclass IN classes) 
   THEN aktarts := aktarts + [stative, dynstative];
   IF   (iterativeclass IN classes) 
   THEN aktarts := aktarts + [stative, activity];
END;





FUNCTION LSMRUQUO_Negphrase(T:LSSTREE_pStree)
                  :BOOLEAN ;
VAR result                 : BOOLEAN;
    noBDETkey,
    neverBADVkey,
    nowhereBADVkey,
    nobodyINDEFPROkey,
    nooneINDEFPROkey,
    nothingINDEFPROkey    : STRING_string;
    j                      : INTEGER;

FUNCTION findkey(T:LSSTREE_pStree; k:STRING_STRING; l:INTEGER):BOOLEAN;
VAR result : BOOLEAN;
    rt     : LSSTREE_pRelNode;
    str    : STRING_STRING;
    found  : BOOLEAN;
    i      : INTEGER;
    headfound : BOOLEAN;
BEGIN{findkey}
headfound := false;
str := k;
found := STRTOKEY_GetSkeyHash(str, i);
result := false;
IF (t <> NIL) THEN BEGIN
  IF (t^.sons <> NIL ) THEN BEGIN
    rt := t^.sons;
    IF (rt^.relation = head) THEN BEGIN
       result := findkey(rt^.node,k, l);
       headfound := true
    END
    ELSE rt := rt^.brother;
    WHILE ((rt <> NIL) AND (NOT headfound)) DO BEGIN
       IF (rt^.relation = head) THEN BEGIN
           result := findkey(rt^.node, k, l);
           headfound := true
       END
       ELSE rt := rt^.brother
    END {WHILE}
  END {IF (t^.sons <> NIL )}
  ELSE IF LDCATSETS_BLEXCAT(loopholes.retype(T^.cat,LIDOMAINT_syntcat)) 
       THEN result :=( LDGETKEY_Get(loopholes.retype(t,LISTree_pStree)) = i)
END {IF (t <> NIL)};
findkey := result;
END {findkey};

BEGIN {Negphrase}
   STRING_Constant(nobodyINDEFPROkey, 'nobodyINDEFPROkey', 18);   
   STRING_Constant(nooneINDEFPROkey,  'nooneINDEFPROkey',  17);   
   STRING_Constant(nothingINDEFPROkey,'nothingINDEFPROkey',19);   
   STRING_Constant(noBDETkey ,         'noBDETkey' ,          9);   
   STRING_Constant(neverBADVkey ,      'neverBADVkey',       12);   
   STRING_Constant(nowhereBADVkey ,    'nowhereBADVkey' ,    14);   
   result := false;
   IF T^.CAT IN [NP, ADVP] THEN BEGIN
     CASE T^.cat OF
       NP:  BEGIN
              result := (findkey(T,nobodyINDEFPROkey,18) OR 
                         findkey(T,nooneINDEFPROkey,17) OR
                         findkey(T,nothingINDEFPROkey,19));
              IF (T^.sons <> NIL) THEN
                 result := result OR findkey(T^.sons^.node, noBDETkey,9);
            END;
       ADVP:  result := (findkey(T,neverBADVkey,12) OR
                         findkey(T,nowhereBADVkey, 14)
                        )
     END;
   END;
   LSMRUQUO_Negphrase:= result;
END {Negphrase};



FUNCTION LSMRUQUO_substordercondition1
        (mu1:LSMRUQUO_ListOfStrees; ps:LSDOMAINT_prosubjecttype)
                    :BOOLEAN;

VAR p      : LSSTREE_prelnode;
    result,nps : BOOLEAN;
    varcs  : SET OF LSDOMAINT_syntcat;
    mu10   : LSMRUQUO_ListOfStrees;

BEGIN
varcs := LSAUXDOM_VARCATSET  + LSAUXDOM_CTVARCATS; 
result := TRUE;
WHILE stillreltrees(mu1) AND result DO
  BEGIN
  nps := ps;
  takereltree(p,mu1);
  IF (p^.node^.cat=SENTENCE) THEN nps := p^.node^.ls^.SENTENCEfield^.prosubject;
  IF ((NOT ((p^.relation=subjrel) AND ps)) AND (p^.node^.cat IN varcs) )
  THEN result := FALSE;
   IF result THEN BEGIN
      PutSonsInMu(p^.node^.sons, mu10);
      IF (NOT LSMRUQUO_substordercondition1(mu10,nps)) THEN result := false;
      nps := ps;
   END;
  END;

LSMRUQUO_substordercondition1 := result
END;





FUNCTION LSMRUQUO_substordercondition2
(mu1,mu2:LSMRUQUO_ListOfStrees ; ps:LSDOMAINT_prosubjecttype)
                    :BOOLEAN;

VAR 
    result : BOOLEAN;

BEGIN
result := LSMRUQUO_substordercondition1(mu1,ps);
IF  result THEN result := LSMRUQUO_substordercondition1(mu2,ps);
LSMRUQUO_substordercondition2 := result
END;


FUNCTION LSMRUQUO_substordercondition
     (mu1,mu2, mu3:LSMRUQUO_ListOfStrees; ps:LSDOMAINT_prosubjecttype)
                    :BOOLEAN;

VAR 
    result : BOOLEAN;

BEGIN
result := LSMRUQUO_substordercondition1(mu1,ps);
IF result THEN result := LSMRUQUO_substordercondition1(mu2,ps);
IF result THEN result := LSMRUQUO_substordercondition1(mu3,ps);
LSMRUQUO_substordercondition := result
END;

FUNCTION LSMRUQUO_varsintree(T:LSSTREE_pSTREE):BOOLEAN;
VAR varfound: BOOLEAN;

PROCEDURE TraverseStree(t:LSSTREE_pStree; VAR found:BOOLEAN);
FORWARD;

PROCEDURE TraverseRelTree(rt:LSSTREE_pRelNode; VAR found:BOOLEAN);
FORWARD;

PROCEDURE TraverseStree;
BEGIN

 IF LDCATSETS_VARCATSET(loopholes.retype(t^.cat,LIDOMAINT_syntcat))   THEN found := true
 ELSE IF ((t^.sons <> nil) AND (NOT found)) THEN TraverseRelTree(t^.sons, found)
END {TraverseStree};

PROCEDURE TraverseRelTree;
BEGIN
  IF (rt^.brother <> NIL)    THEN TraverseRelTree(rt^.brother,found);
  IF (rt^.node    <> NIL)    THEN TraverseStree(rt^.node,found);
END {TraverseRelTree};

BEGIN
  varfound := false;
  TraverseStree(t,varfound);
  LSMRUQUO_varsintree := varfound;
END {LSMRUQUO_varsintree};



FUNCTION Quantificational(T:LSSTREE_pStree)
                  :BOOLEAN ;
FORWARD;


FUNCTION Qvarinmu(mu:LSMRUQUO_ListOfStrees)
                  :BOOLEAN;
FORWARD;



FUNCTION Quantificational;
VAR result: BOOLEAN;
VAR mu    : LSMRUQUO_LIstOFStrees;
BEGIN {Quantificational}
   result := T^.CAT IN [NP, NPVAR, NEG, NEGVAR, VARPREPP, PREPP, ADVP, ADVPVAR];
IF result THEN BEGIN
  CASE T^.CAT OF
    NP: result := ((T^.ls^.NPfield^.definite = indef) OR
                   (T^.ls^.NPfield^.syntquant <> omegaquant)
                  );
    NPVAR: result := ((T^.ls^.NPVARfield^.definite = indef) OR
                      (T^.ls^.NPVARfield^.syntquant <> omegaquant)
                     );
    NEG, NEGVAR: result := true;
    ADVP: result := 
           ((sentadv IN T^.ls^.ADVPfield^.actsubcefs)       OR
            ((tempadv IN T^.ls^.ADVPfield^.actsubcefs) AND
             (
               (T^.ls^.ADVPfield^.class = reference) OR
               (T^.ls^.ADVPfield^.class = duration)
             )
            )
           );                    
{            
  add conditions for (!for three days!!)
}
    ADVPVAR: result := 
              ((sentadv IN T^.ls^.ADVPVARfield^.actsubcefs)       OR
               ((tempadv IN T^.ls^.ADVPVARfield^.actsubcefs) AND
                (
               (T^.ls^.ADVPfield^.class <> reference) AND
               (T^.ls^.ADVPfield^.class <> duration)
                )
               )
              );
    PREPP, VARPREPP: BEGIN
                      PutSonsinMu(T^.sons, mu);
                      result := QvarinMu(mu);
                     END;
  END;
END;
   Quantificational:= result;
END {Quantificational};



FUNCTION Qvarinmu;
VAR result : BOOLEAN;
    reltree: LSSTREE_pRelnode;
BEGIN {Qvarinmu}
result := false;
IF StillReltrees(mu) THEN BEGIN
  takereltree(reltree, mu);
  result := reltree^.node^.cat IN LSAUXDOM_VARCATSET;
  IF result THEN result := Quantificational(reltree^.node)
END;
WHILE StillReltrees(mu) AND (NOT result) DO BEGIN
  takereltree(reltree,mu);
  result := reltree^.node^.cat IN LSAUXDOM_VARCATSET;
  IF result THEN result := Quantificational(reltree^.node)
END;
Qvarinmu := result;
END {Qvarinmu};



FUNCTION LSMRUQUO_Gsubstordercondition1
    (mu1:LSMRUQUO_ListOfStrees; T:LSSTREE_pStree; ps:LSDOMAINT_prosubjecttype)
                  : BOOLEAN;
VAR result : BOOLEAN;
BEGIN {Gsubstordercondition1}
result := false;
IF LSMRUQUO_substordercondition1(mu1,ps) THEN result := true;
IF (NOT result) THEN IF (NOT quantificational(T) ) THEN result := true;
IF (NOT result) THEN IF (NOT Qvarinmu(mu1)) THEN result := true;
LSMRUQUO_Gsubstordercondition1:= result;
END {LSMRUQUO_Gsubstordercondition1};



FUNCTION LSMRUQUO_Gsubstordercondition2
   (mu1, mu2:LSMRUQUO_ListOfStrees;T:LSSTREE_pStree; ps:LSDOMAINT_prosubjecttype)
                  :BOOLEAN ;
BEGIN {LSMRUQUO_Gsubstordercondition2}
   LSMRUQUO_Gsubstordercondition2:= 
         (LSMRUQUO_Gsubstordercondition1(mu1,T,ps) AND
          LSMRUQUO_Gsubstordercondition1(mu2,T,ps) 
         );
END {LSMRUQUO_Gsubstordercondition2};




FUNCTION LSMRUQUO_Gsubstordercondition
   (mu1,mu2,mu3:LSMRUQUO_ListOfStrees;T:LSSTREE_pStree; ps:LSDOMAINT_prosubjecttype)
                  :BOOLEAN ;
VAR p:LSSTREE_prelnode;
BEGIN {LSMRUQUO_Gsubstordercondition}
   LSMRUQUO_Gsubstordercondition:= 
         (LSMRUQUO_Gsubstordercondition1(mu1,T,ps) AND
          LSMRUQUO_Gsubstordercondition1(mu2,T,ps) AND
          LSMRUQUO_Gsubstordercondition1(mu3,T,ps) 
         );
END {LSMRUQUO_Gsubstordercondition};





FUNCTION LSMRUQUO_FirstIsApossNietNp(mu:LSMRUQUO_ListOfStrees)
                    : BOOLEAN;
VAR rel  : LSDOMAINT_synrel;
    tree : LSSTREE_pSTREE;

BEGIN
  IF (NOT stillreltrees(mu)) THEN 
    LSMRUQUO_FirstIsApossNietNp:=FALSE
  ELSE
   BEGIN
     takerelandtree(rel, tree, mu);
     LSMRUQUO_FIRSTISApossnietNp := LSMRUQUO_Possnietxp(tree);
   END
END;



FUNCTION PPpossnietxp(T:LSSTREE_pStree):BOOLEAN;

VAR result   : BOOLEAN;
    mu       : LSMRUQUO_ListofStrees;
    reltree  : LSSTREE_pRelnode;

BEGIN
PutSonsInMu(T^.sons, mu);
result:=false;
IF stillreltrees(mu) THEN
  BEGIN
  takereltree(reltree,mu);
  result:= LSMRUQUO_Possnietxp(reltree^.node);
  WHILE stillreltrees(mu) and NOT(result) DO
    BEGIN
    takereltree(reltree,mu);
    result:= LSMRUQUO_Possnietxp(reltree^.node);
    END;
  END;
PPpossnietxp := result;
END {PPpossnietxp};


FUNCTION LSMRUQUO_PossNietXp(T:LSSTREE_pStree)
                    : BOOLEAN;
VAR result:BOOLEAN;
    intkey:INTEGER;

BEGIN

result := (T^.cat IN [NP, ADVP, NPVAR, ADVPVAR, PREPP, VARPREPP]);
  IF result THEN
    BEGIN
    CASE T^.cat OF
       NP     : result := (T^.ls^.NPfield^.possnietnp = true);
       NPVAR  : result := (T^.ls^.NPVARfield^.possnietnp = true);
       ADVP   : result := (T^.ls^.ADVPfield^.possnietnp = true);
       ADVPVAR: result := (T^.ls^.ADVPVARfield^.possnietnp = true);
       PREPP, VARPREPP: result := PPpossnietxp(T);
      END  
    END;
LSMRUQUO_PossNietXp:=result;
END {LSMRUQUO_PossnietXp};



PROCEDURE LSMRUQUO_AssignCase(
                    NPrec1:LSDOMAINT_NPrecord;
                    mu1:LSMRUQUO_ListOfStrees;
                    VAR NPrec2:LSDOMAINT_NPrecord;
                    VAR mu2:LSMRUQUO_ListOfStrees;
                    casevalue:LSDOMAINT_CaseSetType);

FUNCTION TESTPERSPRO(mu1:LSMRUQUO_ListOfStrees;
                    VAR mu2:LSMRUQUO_ListofStrees)
                    : BOOLEAN;
VAR result:BOOLEAN;
    tree:LSSTREE_pstree;
    reltree:LSSTREE_prelnode;
    PERSPROrec1,PERSPROrec2:LSDOMAINT_PERSPROrecord;
    mu3,mu5:LSMRUQUO_ListOfStrees;
BEGIN
MEM_markdefault(stackptr);
result:=false;
IF stillreltrees(mu1) THEN
  BEGIN
  initreltreelist(mu3);
  takereltree(reltree,mu1);
  result:= (reltree^.relation=head) AND (reltree^.node^.cat=PERSPRO);
  IF result THEN PERSPROrec1:=reltree^.node^.ls^.PERSPROfield^
    ELSE appendreltree(reltree,mu3);
  WHILE stillreltrees(mu1) and NOT(result) DO
    BEGIN
    takereltree(reltree,mu1);
    result:= (reltree^.relation=head) AND (reltree^.node^.cat=PERSPRO);
    IF result THEN PERSPROrec1:=reltree^.node^.ls^.PERSPROfield^
      ELSE appendreltree(reltree,mu3);
    END;
  END;
IF result THEN
  BEGIN
  mu5:=mu1;
  mu2:=mu3;
  PERSPROrec2:=PERSPROrec1;
  IF nominative IN casevalue THEN PERSPROrec2.persprocase:= nominative;
  IF accusative IN casevalue THEN PERSPROrec2.persprocase:= accusative;
  IF casevalue = [] THEN PERSPROrec2.persprocase := omegacase;
  tree:=MAKET_stree(PERSPRO);
  tree^.ls^.PERSPROfield^:=PERSPROrec2;
  tree^.sons:=reltree^.node^.sons; {mu4}
  tree^.li^.n:=reltree^.node^.li^.n;
  appendrelandtree(head,tree,mu2);
  appendlists(mu5,mu2);
  END ELSE MEM_releasedefault(stackptr);
TESTPERSPRO:=result
END;


FUNCTION TESTWHPRO(mu1:LSMRUQUO_ListOfStrees;
                    VAR mu2:LSMRUQUO_ListofStrees)
                    : BOOLEAN;
VAR result:BOOLEAN;
    tree:LSSTREE_pstree;
    reltree:LSSTREE_prelnode;
    WHPROrec1,WHPROrec2:LSDOMAINT_WHPROrecord;
    mu3,mu5:LSMRUQUO_ListOfStrees;
BEGIN
MEM_markdefault(stackptr);
result:=false;
IF stillreltrees(mu1) THEN
  BEGIN
  initreltreelist(mu3);
  takereltree(reltree,mu1);
  result:= (reltree^.relation=head) AND (reltree^.node^.cat=WHPRO);
  IF result THEN WHPROrec1:=reltree^.node^.ls^.WHPROfield^
    ELSE appendreltree(reltree,mu3);
  WHILE stillreltrees(mu1) and NOT(result) DO
    BEGIN
    takereltree(reltree,mu1);
    result:= (reltree^.relation=head) AND (reltree^.node^.cat=WHPRO);
    IF result THEN WHPROrec1:=reltree^.node^.ls^.WHPROfield^
      ELSE appendreltree(reltree,mu3);
    END;
  END;
IF result THEN
  BEGIN
  mu5:=mu1;
  mu2:=mu3;
  WHPROrec2:=WHPROrec1;
  IF WHPROrec1.whcase 
    THEN WHPROrec2.cases:= casevalue
    ELSE WHPROrec2.cases := [];
  tree:=MAKET_stree(WHPRO);
  tree^.ls^.WHPROfield^:=WHPROrec2;
  tree^.sons:=reltree^.node^.sons; {mu4}
  tree^.li^.n:=reltree^.node^.li^.n;
  appendrelandtree(head,tree,mu2);
  appendlists(mu5,mu2);
  END ELSE MEM_releasedefault(stackptr);
TESTWHPRO:=result
END;



FUNCTION TESTCOORDNP(mu1:LSMRUQUO_ListOfStrees;
                     VAR mu2:LSMRUQUO_ListofStrees)
                    : BOOLEAN;
VAR result:BOOLEAN;
    tree,T1:LSSTREE_pstree;
    reltree:LSSTREE_prelnode;
    NPrec3,NPrec4, NPrec5, NPrec6:LSDOMAINT_NPrecord;
    mu3,mu5, mu4, mu6:LSMRUQUO_ListOfStrees;
    mu3length, mu4length : INTEGER;

BEGIN
result:=false;
IF stillreltrees(mu1) THEN
  BEGIN
  takereltree(reltree,mu1);
  result:= (reltree^.relation=argrel) AND (reltree^.node^.cat=NP);
  IF result THEN 
    BEGIN 
    NPrec3:=reltree^.node^.ls^.NPfield^;
    PutSonsInMu(reltree^.node^.sons,mu3);
    mu3length := reltree^.node^.li^.n;
    END
  END;

  result := result AND stillreltrees(mu1) ;
  IF result THEN
    BEGIN
    takereltree(reltree,mu1);
    result:= (reltree^.relation=head) ;
    IF result THEN T1 := reltree^.node ;
    END;

  result := result AND stillreltrees(mu1);
  IF result THEN 
    BEGIN
    takereltree(reltree,mu1);
    result:= (reltree^.relation=argrel) AND (reltree^.node^.cat=NP);
    IF result THEN 
      BEGIN
      NPrec4:=reltree^.node^.ls^.NPfield^;
      PutSonsInMu(reltree^.node^.sons,mu4);
      mu4length := reltree^.node^.li^.n;    (* ??? *)
      END
    END;
result := result AND (NOT stillreltrees(mu1));
IF result THEN
  BEGIN
  LSMRUQUO_assigncase(NPrec3,mu3,NPrec5,mu5,casevalue);
  LSMRUQUO_assigncase(NPrec4,mu4,NPrec6,mu6,casevalue);

  initreltreelist(mu2);

  tree:=MAKET_stree(NP);
  tree^.ls^.NPfield^:=NPrec5;
  tree^.sons:=mu5.first;
  tree^.li^.n := mu3length;

  appendrelandtree(argrel,tree,mu2);

  appendrelandtree(head, T1, mu2);

  tree:=MAKET_stree(NP);
  tree^.ls^.NPfield^:=NPrec6;
  tree^.sons:=mu6.first;
  tree^.li^.n := mu4length;
  
  appendrelandtree(argrel,tree,mu2);
  
  END;
TESTCOORDNP:=result
END;



FUNCTION TESTMODNP(mu1:LSMRUQUO_ListOfStrees;
                   VAR mu2:LSMRUQUO_ListofStrees)
                 : BOOLEAN;
VAR result,postmodrelfound,modrelfound:BOOLEAN;
    tree,T1,T2:LSSTREE_pstree;
    reltree:LSSTREE_prelnode;
    NPrec3,NPrec4:LSDOMAINT_NPrecord;
    mu3,mu4:LSMRUQUO_ListOfStrees;
    mu3length: INTEGER;

BEGIN
result:=false;
modrelfound:=FALSE;
postmodrelfound:=FALSE;

IF stillreltrees(mu1) THEN
  BEGIN
  takereltree(reltree,mu1);
  modrelfound:= (reltree^.relation=modrel) ;
  IF modrelfound THEN T1 := reltree^.node ;
  END;

IF stillreltrees(mu1) THEN
  BEGIN
  IF modrelfound THEN takereltree(reltree,mu1);
  result:= (reltree^.relation=head) AND (reltree^.node^.cat=NP);
  IF result THEN 
    BEGIN 
    NPrec3:=reltree^.node^.ls^.NPfield^;
    PutSonsInMu(reltree^.node^.sons,mu3);
    mu3length := reltree^.node^.li^.n;
    END
  END;

IF stillreltrees(mu1) AND NOT (modrelfound) THEN
  BEGIN
  takereltree(reltree,mu1);
  postmodrelfound:= (reltree^.relation=postmodrel) ;
  IF postmodrelfound THEN T2 := reltree^.node ;
  END;

result := result AND (NOT stillreltrees(mu1)) AND 
                     (modrelfound OR postmodrelfound);
IF result THEN
  BEGIN
  LSMRUQUO_assigncase(NPrec3,mu3,NPrec4,mu4,casevalue);
  initreltreelist(mu2);

  IF modrelfound THEN appendrelandtree(modrel, T1, mu2);

  tree:=MAKET_stree(NP);
  tree^.ls^.NPfield^:=NPrec4;
  tree^.sons:=mu4.first;
  tree^.li^.n := mu3length;
  appendrelandtree(head,tree,mu2);

  IF postmodrelfound THEN appendrelandtree(postmodrel, T2, mu2);

  END;
TESTMODNP:=result
END;



FUNCTION TESTCN(mu1:LSMRUQUO_ListOfStrees;
                VAR mu2:LSMRUQUO_ListofStrees)
               : BOOLEAN;
VAR result:BOOLEAN;
    tree:LSSTREE_pstree;
    cn1tree, cn2tree, reltree:LSSTREE_prelnode;
    CNrec1,CNrec2:LSDOMAINT_CNrecord;
    NOUNrec1, NOUNrec2:LSDOMAINT_NOUNrecord;
    mu3,mu4,mu5,mu6,mu7, cnsons, cn2sons:LSMRUQUO_ListOfStrees;
BEGIN {body testcn}
MEM_markdefault(stackptr);
result:=false;
IF stillreltrees(mu1) THEN
  BEGIN {IF stillreltrees(mu1)}
  initreltreelist(mu3);
  takereltree(reltree,mu1);
  result:= (reltree^.relation=head) AND (reltree^.node^.cat=CN);
  IF result THEN CNrec1:=reltree^.node^.ls^.CNfield^
    ELSE appendreltree(reltree,mu3);
  WHILE stillreltrees(mu1) and NOT(result) DO
    BEGIN {while stillreltrees(mu1) AND ..}
    takereltree(reltree,mu1);
    result:= (reltree^.relation=head) AND (reltree^.node^.cat=CN);
    IF result THEN CNrec1:=reltree^.node^.ls^.CNfield^
      ELSE appendreltree(reltree,mu3);
    END {while stillreltrees(mu1) AND ..};
  END {IF stillreltrees(mu1)};
IF result THEN
  BEGIN {IF result 1}
  mu6:=mu1;
  result := false;
  PutsonsInMu(reltree^.node^.sons,cnsons);
  cn1tree := reltree;  

  IF stillreltrees(cnsons) THEN
    BEGIN {IF stillreltrees(cnsons)}
    initreltreelist(mu4);
    takereltree(reltree,cnsons);
    result:= (reltree^.relation=head) AND (reltree^.node^.cat=NOUN);
    IF result THEN NOUNrec1:=reltree^.node^.ls^.NOUNfield^
      ELSE appendreltree(reltree,mu4);
    WHILE stillreltrees(cnsons) and NOT(result) DO
      BEGIN {while cnsons}
      takereltree(reltree,cnsons);
      result:= (reltree^.relation=head) AND (reltree^.node^.cat=NOUN);
      IF result THEN NOUNrec1:=reltree^.node^.ls^.NOUNfield^
	ELSE appendreltree(reltree,mu4);
      END; {end while cnsons}
    END {IF stillreltrees(cnsons)};

    IF result THEN
      BEGIN {final action}
      mu5:=cnsons;
      cn2sons:=mu4;
      NOUNrec2:=NOUNrec1;
      tree:=MAKET_stree(NOUN);
      tree^.ls^.NOUNfield^:=NOUNrec2;
      tree^.sons:=reltree^.node^.sons; {mu7}
      tree^.li^.n := reltree^.node^.li^.n; 
      appendrelandtree(head,tree,cn2sons);
      appendlists(mu5,cn2sons);

      mu2 := mu3;
      CNrec2 := CNrec1;
      CNrec2.cases := casevalue;
      tree := MAKET_stree(CN);
      tree^.ls^.CNfield^:=CNrec2;
      tree^.sons:= cn2sons.first;         
      tree^.li^.n := cn1tree^.node^.li^.n; 
      appendrelandtree(head,tree,mu2);
      appendlists(mu6,mu2);
      END {final action} ELSE MEM_releasedefault(stackptr);
  END {IF result 1};
TESTCN:=result
END {testcn body};



FUNCTION TESTCNEN(mu1:LSMRUQUO_ListOfStrees;
                  VAR mu2:LSMRUQUO_ListofStrees)
                 : BOOLEAN;

{
no head/NOUN under CN
   ELIF  mu1 = [ mu3, 
		 head/CN<CNrec1>
		     [ I1:mu4, 
		     ],
		 mu6
	       ]
with I1: NOT EXIST(mu4, [head/NOUN])
   THEN mu2 := [ mu3, 
		 head/CN<CNrec2>
		     [ I1:mu4, 
		     ],
		 mu6
	       ];
        CNrec2 := CNrec1;
	CNrec2.cases := [c];

}


VAR result:BOOLEAN;
    tree:LSSTREE_pstree;
    cn1tree, cn2tree, reltree:LSSTREE_prelnode;
    CNrec1,CNrec2:LSDOMAINT_CNrecord;
    mu3,mu4,mu6,mu7, cnsons, cn2sons:LSMRUQUO_ListOfStrees;
BEGIN {body testcnen}
MEM_markdefault(stackptr);
result:=false;
IF stillreltrees(mu1) THEN
  BEGIN {IF stillreltrees(mu1)}
  initreltreelist(mu3);
  takereltree(reltree,mu1);
  result:= (reltree^.relation=head) AND (reltree^.node^.cat=CN);
  IF result THEN CNrec1:=reltree^.node^.ls^.CNfield^
    ELSE appendreltree(reltree,mu3);
  WHILE stillreltrees(mu1) and NOT(result) DO
    BEGIN {while stillreltrees(mu1) AND ..}
    takereltree(reltree,mu1);
    result:= (reltree^.relation=head) AND (reltree^.node^.cat=CN);
    IF result THEN CNrec1:=reltree^.node^.ls^.CNfield^
      ELSE appendreltree(reltree,mu3);
    END {while stillreltrees(mu1) AND ..};
  END {IF stillreltrees(mu1)};
IF result THEN
  BEGIN {IF result 1}
  mu6:=mu1;
  result := false;
  PutsonsInMu(reltree^.node^.sons,cnsons);
  cn1tree := reltree;  

  IF stillreltrees(cnsons) THEN
    BEGIN {IF stillreltrees(cnsons)}
    mu4:=cnsons;
    takereltree(reltree,cnsons);
    result:= (reltree^.relation<>head) OR (reltree^.node^.cat<>NOUN);
    WHILE stillreltrees(cnsons) and result DO
      BEGIN {while cnsons}
      takereltree(reltree,cnsons);
      result:= (reltree^.relation<>head) OR (reltree^.node^.cat<>NOUN);
      END; {END while cnsons}
    END {IF stillreltrees(cnsons)};

    IF result THEN
      BEGIN {final action}
      cn2sons:=mu4;

      mu2 := mu3;
      CNrec2 := CNrec1;
      CNrec2.cases := casevalue;
      tree := MAKET_stree(CN);
      tree^.ls^.CNfield^:=CNrec2;
      tree^.sons:= cn2sons.first;          
      tree^.li^.n := cn1tree^.node^.li^.n; 
      appendrelandtree(head,tree,mu2);
      appendlists(mu6,mu2);
      END {final action} ELSE MEM_releasedefault(stackptr);
  END {IF result 1};
TESTCNEN:=result
END {testcnEN body};




BEGIN
    NPrec2 := NPrec1;                       
    NPrec2.cases := casevalue;
    IF NOT TESTPERSPRO(mu1,mu2) THEN
    IF NOT TESTCN(mu1,mu2) THEN
    IF NOT TESTCNEN(mu1,mu2) THEN
    IF NOT TESTCOORDNP(mu1,mu2) THEN
    IF NOT TESTMODNP(mu1,mu2) THEN
    IF NOT TESTWHPRO(mu1,mu2) THEN
    mu2 := mu1;
END {assigncase};




FUNCTION LSMRUQUO_CheckGen(T:LSSTREE_pStree)
                  : BOOLEAN;

VAR result,
    lastfound,
    nomorebrothers   : BOOLEAN;

PROCEDURE GenTraverseStree(t:LSSTREE_pStree);
FORWARD;

PROCEDURE GenTraverseRelTree(rt:LSSTREE_pRelNode);
FORWARD;

PROCEDURE GenTraverseStree;
BEGIN
  IF (t^.sons <> nil)                          
  THEN IF
         ( NOT ((LDCATSETS_LEXCAT(loopholes.retype(t^.cat,LIDOMAINT_syntcat)) )  AND
                (NOT LDCATSETS_LEXCAT(loopholes.retype(t^.sons^.node^.cat,LIDOMAINT_syntcat)) )
               )
         )
       THEN BEGIN
               Nomorebrothers := false;
               GenTraverseRelTree(t^.sons);
            END;
   IF NOT result THEN BEGIN
    IF (NOT lastfound) THEN result := Nomorebrothers;
    IF result THEN result := (t^.cat IN [NOUN, INDEFPRO, PROPERNOUN]); 
    IF result THEN 
               BEGIN
                 lastfound := true;
                 CASE t^.CAT OF 
                 NOUN    : result := (t^.ls^.NOUNfield^.poss = true);
                 INDEFPRO: result := (t^.ls^.INDEFPROfield^.poss = true);
                 PROPERNOUN: result := (t^.ls^.PROPERNOUNfield^.poss = true);
                 END
               END;   
    END;
END {GenTraverseStree};

PROCEDURE GenTraverseRelTree;
BEGIN
  IF (rt^.brother <> NIL)    THEN GenTraverseRelTree(rt^.brother);
  Nomorebrothers := true;
  IF (rt^.node    <> NIL)    THEN GenTraverseStree(rt^.node);
END {GenTraverseRelTree};


BEGIN {LSMRUQUO_CheckGen}
   Nomorebrothers := false;
   lastfound := false;
   result := false;
   GenTraverseStree(T);
   LSMRUQUO_CheckGen := result;
END {LSMRUQUO_CheckGen};



{voor TIJD regels:}

FUNCTION LSMRUQUO_TempRefNotFound(mu:LSMRUQUO_ListOfStrees)
                    : BOOLEAN;

VAR tempadvfound    : BOOLEAN;
    reltree         : LSSTREE_prelnode;
    

BEGIN
{ NOT EXIST(mu,[I1:rel1/T1]
  I1: ((T1.CAT IN [ADVP,PREPP,ADVPVAR, PREPPVAR]) AND
       (T1.REC.class = reference) AND
       (T1.REC.retro = false) AND
       (rel1 = tempadvrel)
      ) 
    OR
      ( (T1.CAT IN [SENTENCE,SENTENCEVAR]) AND
        (T1.REC.conjclass = reference) AND
        (T1.REC.conjretro = false) AND
        (T1.REC.temporal = true) AND
        (rel1 IN [tempadvrel,leftdislocrel])
      )
}

tempadvfound := false;
WHILE stillreltrees(mu) AND (NOT tempadvfound ) DO
  BEGIN
    takereltree(reltree, mu);
    tempadvfound := ( (reltree^.relation = tempadvrel)      AND
                      (reltree^.node^.cat IN [ADVP, PREPP, 
                                             ADVPVAR, PREPPVAR])
                    )                                             OR
                    ( (reltree^.relation IN [tempadvrel, 
                                            leftdislocrel]) AND
                      (reltree^.node^.cat IN [ SENTENCE, SENTENCEVAR])
                    );
  IF tempadvfound THEN
    BEGIN
      CASE reltree^.node^.cat OF
        ADVP: tempadvfound := 
               ((reltree^.node^.ls^.ADVPfield^.class = reference) AND
                (reltree^.node^.ls^.ADVPfield^.retro = false)
               );
        ADVPVAR: tempadvfound := 
               ((reltree^.node^.ls^.ADVPVARfield^.class = reference) AND
                (reltree^.node^.ls^.ADVPVARfield^.retro = false)
               );
        PREPP:tempadvfound := 
               ((reltree^.node^.ls^.PREPPfield^.class = reference) AND
                (reltree^.node^.ls^.PREPPfield^.retro = false)
               );
        PREPPVAR:tempadvfound := 
               ((reltree^.node^.ls^.PREPPVARfield^.class = reference) AND
                (reltree^.node^.ls^.PREPPVARfield^.retro = false)
               );
        SENTENCE:tempadvfound := 
               ((reltree^.node^.ls^.SENTENCEfield^.conjclass = reference) AND
                (reltree^.node^.ls^.SENTENCEfield^.conjretro = false)     AND
                (reltree^.node^.ls^.SENTENCEfield^.temporal = true)
               );
        SENTENCEVAR:tempadvfound := 
               ((reltree^.node^.ls^.SENTENCEVARfield^.conjclass = reference) AND
                (reltree^.node^.ls^.SENTENCEVARfield^.conjretro = false)     AND
                (reltree^.node^.ls^.SENTENCEVARfield^.temporal = true)
               );
      END {case}
    END {if};

  END {while};
LSMRUQUO_temprefnotfound := (NOT tempadvfound);
END {temprefnotfound};




FUNCTION LSMRUQUO_TempRetroNotFound(mu:LSMRUQUO_ListOfStrees)
                    : BOOLEAN;

VAR tempadvfound    : BOOLEAN;
    reltree         : LSSTREE_prelNode;
    
BEGIN
{ NOT EXIST(mu,[I1:rel1/T1]
  I1: ((T1.CAT IN [ADVP,PREPP,ADVPVAR, PREPPVAR]) AND
       (T1.REC.class = reference) AND
       (T1.REC.retro = true) AND
       (rel1 = tempadvrel)
      ) 
    OR
      ( (T1.CAT IN [SENTENCE,SENTENCEVAR]) AND
        (T1.REC.conjclass = reference) AND
        (T1.REC.conjretro = true) AND
        (T1.REC.temporal = true) AND
        (rel1 IN [tempadvrel,leftdislocrel])
      )
}
tempadvfound := false;
WHILE stillreltrees(mu) AND (NOT tempadvfound ) DO
  BEGIN
    takereltree(reltree, mu);
    tempadvfound := ( (reltree^.relation = tempadvrel)      AND
                      (reltree^.node^.cat IN [ADVP, PREPP,
                                        ADVPVAR, PREPPVAR])
                    )                                             OR
                    ( (reltree^.relation IN [tempadvrel, 
                                            leftdislocrel]) AND
                      (reltree^.node^.cat IN [SENTENCE,
                                              SENTENCEVAR])
                    );
  IF tempadvfound THEN
    BEGIN
      CASE reltree^.node^.cat OF
        ADVP: tempadvfound := 
               ((reltree^.node^.ls^.ADVPfield^.class = reference) AND
                (reltree^.node^.ls^.ADVPfield^.retro = true)
               );
        ADVPVAR: tempadvfound := 
               ((reltree^.node^.ls^.ADVPVARfield^.class = reference) AND
                (reltree^.node^.ls^.ADVPVARfield^.retro = true)
               );
        PREPP:tempadvfound := 
               ((reltree^.node^.ls^.PREPPfield^.class = reference) AND
                (reltree^.node^.ls^.PREPPfield^.retro = true)
               );
        PREPPVAR:tempadvfound := 
               ((reltree^.node^.ls^.PREPPVARfield^.class = reference) AND
                (reltree^.node^.ls^.PREPPVARfield^.retro = true)
               );
        SENTENCE:tempadvfound := 
               ((reltree^.node^.ls^.SENTENCEfield^.conjclass = reference) AND
                (reltree^.node^.ls^.SENTENCEfield^.conjretro = true)     AND
                (reltree^.node^.ls^.SENTENCEfield^.temporal = true)
               );
        SENTENCEVAR:tempadvfound := 
               ((reltree^.node^.ls^.SENTENCEVARfield^.conjclass = reference) AND
                (reltree^.node^.ls^.SENTENCEVARfield^.conjretro = true)     AND
                (reltree^.node^.ls^.SENTENCEVARfield^.temporal = true)
               );
      END {case}
    END {if};

  END {while};
LSMRUQUO_tempretronotfound := (NOT tempadvfound);
END {tempretronotfound};



FUNCTION LSMRUQUO_TempDurNotFound(mu:LSMRUQUO_ListOfStrees)
                    : BOOLEAN;

VAR tempadvfound    : BOOLEAN;
    reltree         : LSSTREE_pRelNode;
    
BEGIN
{ NOT EXIST(mu,[I1:rel1/T1]
  I1: ((T1.CAT IN [ADVP,PREPP,ADVPVAR, PREPPVAR]) AND
       (T1.REC.class = duration) AND
       (T1.REC.retro = false)    AND
       rel1 IN [tempadvrel]
      ) 
    OR
      ( (T1.CAT = [SENTENCE, SENTENCEVAR]) AND
        (T1.REC.conjclass = duration) AND
        (T1.REC.conjretro = false)   AND
        (T1.REC.temporal = true ) AND
        rel1 IN [tempadvrel, leftdislocrel]
      )
}

tempadvfound := false;
WHILE stillreltrees(mu) AND (NOT tempadvfound ) DO
  BEGIN
    takereltree(reltree, mu);
    tempadvfound := ( (reltree^.relation = tempadvrel)      AND
                      (reltree^.node^.cat IN [ADVP, PREPP,
                                        ADVPVAR, PREPPVAR])
                    )                                             OR
                    ( (reltree^.relation IN [tempadvrel, 
                                            leftdislocrel]) AND
                      (reltree^.node^.cat IN [SENTENCE,
                                              SENTENCEVAR])
                    );
  IF tempadvfound THEN
    BEGIN
      CASE reltree^.node^.cat OF
        ADVP: tempadvfound := 
               ((reltree^.node^.ls^.ADVPfield^.class = duration) AND
                (reltree^.node^.ls^.ADVPfield^.retro = false)
               );
        ADVPVAR: tempadvfound := 
               ((reltree^.node^.ls^.ADVPVARfield^.class = duration) AND
                (reltree^.node^.ls^.ADVPVARfield^.retro = false)
               );
        PREPP:tempadvfound := 
               ((reltree^.node^.ls^.PREPPfield^.class = duration) AND
                (reltree^.node^.ls^.PREPPfield^.retro = false)
               );
        PREPPVAR:tempadvfound := 
               ((reltree^.node^.ls^.PREPPVARfield^.class = duration) AND
                (reltree^.node^.ls^.PREPPVARfield^.retro = false)
               );
        SENTENCE:tempadvfound := 
               ((reltree^.node^.ls^.SENTENCEfield^.conjclass = duration) AND
                (reltree^.node^.ls^.SENTENCEfield^.conjretro = false)     AND
                (reltree^.node^.ls^.SENTENCEfield^.temporal = true)
               );
        SENTENCEVAR:tempadvfound := 
               ((reltree^.node^.ls^.SENTENCEVARfield^.conjclass = duration) AND
                (reltree^.node^.ls^.SENTENCEVARfield^.conjretro = false)     AND
                (reltree^.node^.ls^.SENTENCEVARfield^.temporal = true)
               );
      END {case}
    END {if};

  END {while};
LSMRUQUO_tempdurnotfound := (NOT tempadvfound);
END {tempdurnotfound};


FUNCTION LSMRUQUO_TempFreqNotFound(mu:LSMRUQUO_ListOfStrees)
                    : BOOLEAN;

VAR tempadvfound    : BOOLEAN;
    reltree         : LSSTREE_pRelNode;
    
BEGIN
{ NOT EXIST(mu,[I1:rel1/T1]
  I1: ((T1.CAT IN [ADVP,PREPP,NP,ADVPVAR, PREPPVAR, NPVAR]) AND
       (T1.REC.class = frequential) AND
       rel1 IN [tempadvrel]
      ) 
    OR
      ( (T1.CAT = [SENTENCE, SENTENCEVAR]) AND
        (T1.REC.conjclass = frequential) AND
        (T1.REC.temporal = true ) AND
        rel1 IN [tempadvrel, leftdislocrel]
      )
}

tempadvfound := false;
WHILE stillreltrees(mu) AND (NOT tempadvfound ) DO
  BEGIN
    takereltree(reltree, mu);
    tempadvfound := ( (reltree^.relation = tempadvrel)      AND
                      (reltree^.node^.cat IN [ADVP, PREPP, NP,
                                        ADVPVAR, PREPPVAR, NPVAR])
                    )                                             OR
                    ( (reltree^.relation IN [tempadvrel, 
                                            leftdislocrel]) AND
                      (reltree^.node^.cat IN [SENTENCE,
                                              SENTENCEVAR])
                    );
  IF tempadvfound THEN
    BEGIN
      CASE reltree^.node^.cat OF
        ADVP: tempadvfound := 
               ((reltree^.node^.ls^.ADVPfield^.class = frequential) 
               );
        ADVPVAR: tempadvfound := 
               ((reltree^.node^.ls^.ADVPVARfield^.class = frequential) 
               );
        PREPP:tempadvfound := 
               ((reltree^.node^.ls^.PREPPfield^.class = frequential) 
               );
        PREPPVAR:tempadvfound := 
               ((reltree^.node^.ls^.PREPPVARfield^.class = frequential) 
               );
        NP:tempadvfound := 
               ((reltree^.node^.ls^.NPfield^.class = frequential) 
               );
        NPVAR:tempadvfound := 
               ((reltree^.node^.ls^.NPVARfield^.class = frequential) 
               );
        SENTENCE:tempadvfound := 
               ((reltree^.node^.ls^.SENTENCEfield^.conjclass = frequential) AND
                (reltree^.node^.ls^.SENTENCEfield^.temporal = true)
               );
        SENTENCEVAR:tempadvfound := 
               ((reltree^.node^.ls^.SENTENCEVARfield^.conjclass = frequential) AND
                (reltree^.node^.ls^.SENTENCEVARfield^.temporal = true)
               );
      END {case}
    END {if};

  END {while};
LSMRUQUO_tempfreqnotfound := (NOT tempadvfound);
END {tempfreqnotfound};




PROCEDURE LSMRUQUO_init;


PROCEDURE initrelorder(VAR relarray: synrelarray);
VAR currel : LSDOMAINT_synrel;
BEGIN
  
  FOR currel := LSrel0 TO LSrel80 DO BEGIN
      relarray[currel] := 0
  END;

END {initrelorder};


PROCEDURE initSrelorder(VAR sarray: synrelarray);
VAR i : INTEGER;
BEGIN
  initrelorder(sarray);
  
  i:= 1;
 
  sarray[leftdislocrel] := i; 
  i:= i+1;
  sarray[shiftrel] := i; 
  i:= i+1;
  sarray[conjrel] := i; 
  i:= i+1;
  sarray[meltnegrel] := i; 
  i:= i+1;
  sarray[subjrel] := i; 
  i:= i+1;
  sarray[auxrel] := i; 
  i:= i+1;
  sarray[negrel] := i; 
  sarray[posrel] := i; 
  i:= i+1;
  sarray[torel] := i; 
  i:= i+1;
  sarray[predrel] := i; 
  i:= i+1;
  sarray[locadvrel] := i; 
  i:= i+1;
  sarray[tempadvrel] := i; 
  i:= i+1;
  sarray[extraposrel] := i; 
  i:= i+1;
  sarray[postsentadvrel] := i; 
  i:= i+1;
 
  sarray[puncrel] := specrel; 
  sarray[gluerel] := specrel; 
END {initsrelorder};

PROCEDURE initVPrelorder(VAR vparray: synrelarray);
VAR i : INTEGER;
BEGIN
  initrelorder(vparray);

  i := 1;
  vparray[auxrel] := i; 
  i:= i+1;
  vparray[progauxrel] := i; 
  i:= i+1;
  vparray[passauxrel] := i; 
  i:= i+1;
  vparray[head] := i; 
  i:= i+1;
  vparray[partrel] := i; 
  i:= i+1;
  vparray[indobjrel] := i; 
  i:= i+1;
  vparray[objrel] := i; 
  i:= i+1;
  vparray[prepobjrel] := i; 
  vparray[predrel] := i;
  vparray[complrel] := i;
  vparray[locargrel] := i;
  vparray[dirargrel] := i;
  i:= i+1;
  vparray[byobjrel] := i; 
  i:= i+1;

  vparray[gluerel] := specrel; 
  vparray[puncrel] := specrel; 
  vparray[meltnegrel] := specrel;
END {initvprelorder};

PROCEDURE initADJPrelorder(VAR adjparray: synrelarray);
BEGIN
  initrelorder(adjparray);

  (* linguistic content *)
  adjparray[puncrel] := specrel; 
  adjparray[gluerel] := specrel; 
END {initadjprelorder};


BEGIN
  initSrelorder(Srelorder);
  initVPrelorder(VPrelorder);
  initADJPrelorder(ADJPrelorder);
END;





FUNCTION LSMRUQUO_Srelprec
                          ( rel1, rel2: LSDOMAINT_synrel
                          ) 
                          :BOOLEAN;

VAR Srel1, Srel2 : INTEGER;

BEGIN
Srel1 := Srelorder[rel1] ;
Srel2 := Srelorder[rel2] ;  
IF      ( Srel1= 0) OR (Srel2=0)
   THEN LSMRUQUO_Srelprec := false
ELSE IF  (Srel1 = specrel) OR 
         (Srel2 =  specrel)
   THEN LSMRUQUO_Srelprec := true
ELSE LSMRUQUO_Srelprec := (Srel1 <= Srel2)
END;



FUNCTION LSMRUQUO_VPrelprec
                          ( rel1, rel2: LSDOMAINT_synrel
                          )
                          :BOOLEAN;

VAR VPrel1, VPrel2 : INTEGER;

BEGIN
VPrel1 := VPrelorder[rel1] ;
VPrel2 := VPrelorder[rel2] ;  
IF      ( VPrel1= 0) OR (VPrel2=0)
   THEN LSMRUQUO_VPrelprec := false
ELSE IF  (VPrel1 = specrel) OR 
         (VPrel2 =  specrel)
   THEN LSMRUQUO_VPrelprec := true
ELSE LSMRUQUO_VPrelprec := (VPrel1 <= VPrel2)
END;



FUNCTION LSMRUQUO_ADJPrelprec
                          ( rel1, rel2: LSDOMAINT_synrel
                          )
                          :BOOLEAN;

VAR AdjPrel1, AdjPrel2 : INTEGER;

BEGIN
AdjPrel1 := ADJPrelorder[rel1] ;
AdjPrel2 := ADJPrelorder[rel2] ;  
IF      ( AdjPrel1= 0) OR (AdjPrel2=0)
   THEN LSMRUQUO_AdjPrelprec := false
ELSE IF  (AdjPrel1 = specrel) OR 
         (AdjPrel2 =  specrel)
   THEN LSMRUQUO_AdjPrelprec := true
ELSE LSMRUQUO_AdjPrelprec := (AdjPrel1 <= AdjPrel2)
END;


FUNCTION LSMRUQUO_Firstrel
                          ( mu1: LSMRUQUO_listofstrees;
                            rel1: LSDOMAINT_synrel
                          )
                          :BOOLEAN;

BEGIN
IF   (NOT stillreltrees(mu1))
THEN LSMRUQUO_firstrel := false
ELSE LSMRUQUO_firstrel := (mu1.first^.relation = rel1);
END;

FUNCTION LSMRUQUO_Firstcat
                          ( mu1: LSMRUQUO_listofstrees;
                            cat1: LSDOMAINT_syntcat
                          )
                          :BOOLEAN;

BEGIN
IF   (NOT stillreltrees(mu1))
THEN LSMRUQUO_firstcat := false
ELSE LSMRUQUO_firstcat := (mu1.first^.node^.cat = cat1);
END;

FUNCTION LSMRUQUO_Lastrel
                          ( mu1: LSMRUQUO_listofstrees;
                            rel1: LSDOMAINT_synrel
                          )
                          :BOOLEAN;

BEGIN
IF   (NOT stillreltrees(mu1))
THEN LSMRUQUO_lastrel := false
ELSE LSMRUQUO_lastrel := (mu1.last^.relation = rel1);
END;

FUNCTION LSMRUQUO_Lastcat
                          ( mu1: LSMRUQUO_listofstrees;
                            cat1: LSDOMAINT_syntcat
                          )
                          :BOOLEAN;
BEGIN
IF   (NOT stillreltrees(mu1))
THEN LSMRUQUO_lastcat := false
ELSE LSMRUQUO_lastcat := (mu1.last^.node^.cat = cat1);
END;


PROCEDURE LSMRUQUO_assdeixismax(d,s: LSDOMAINT_deixistype; 
                          VAR res:LSDOMAINT_deixistype);
BEGIN
  IF   (d <> omegadeixis)
  THEN res := d
  ELSE res := s;
END {assdeixismax};

FUNCTION LSMRUQUO_Deixismax(d, s, ns:LSDOMAINT_deixistype)
                    : BOOLEAN;
VAR res :LSDOMAINT_deixistype;
BEGIN
  IF   (d <> omegadeixis)
  THEN res := d
  ELSE res := s;
  LSMRUQUO_deixismax := (res = ns);
END {Deixismax};


PROCEDURE LSMRUQUO_AssSpecmax(s1, s2:LSDOMAINT_specqtype;
                                       VAR s3:LSDOMAINT_specqtype);
BEGIN
  IF      s1 = yesspec THEN s3 := yesspec
  ELSE IF s2 = yesspec THEN s3 := yesspec
  ELSE   s3 := nospec
END {LSMRUQUO_AssSpecmax};

FUNCTION LSMRUQUO_specmax(s1, s2,s3:LSDOMAINT_specqtype)
                    : BOOLEAN;
BEGIN
  LSMRUQUO_specmax :=(((s1 = yesspec) OR (s2=yesspec)) AND (s3=yesspec)) OR
                     ((s1=nospec) AND (s2=nospec) AND (s3=nospec));
END {LSMRUQUO_specmax};




FUNCTION LSMRUQUO_VARinNP(T:LSSTREE_pStree)
                  :BOOLEAN ;
VAR result        :BOOLEAN;
    mu            :LSMRUQUO_ListOfStrees;
    reltree       :LSSTREE_pRelnode;
BEGIN {LSMRUQUO_VARinNP}
   result := false;
   result := (T^.CAT = NP);
   IF result THEN 
      BEGIN
      PutSonsinMu(T^.sons, mu);
      IF stillreltrees(mu) THEN
         BEGIN
           takereltree(reltree,mu);
           result:= (reltree^.relation=detrel) AND
                     (reltree^.node^.cat IN [NPVAR,CNVAR]);
          WHILE stillreltrees(mu) and NOT(result) DO
            BEGIN
             takereltree(reltree,mu);
             result:= (reltree^.relation=detrel) AND
                     (reltree^.node^.cat IN [NPVAR,CNVAR]);
            END;
         END ELSE result:=FALSE;
      END;
   LSMRUQUO_VARinNP := result;
END {LSMRUQUO_VARinNP};

FUNCTION LSMRUQUO_IsIdiom
                    ( s:   LSSTREE_pstree
                    )
                    :BOOLEAN ;
VAR sons:LSSTREE_prelnode;
BEGIN
IF s^.sons=NIL THEN LSMRUQUO_Isidiom:=LIIDDICT_IsIdKey(s^.ls^.BVERBfield^.key)
ELSE BEGIN
sons:=s^.sons;
WHILE sons^.relation<>head DO
sons:=sons^.brother;
LSMRUQUO_IsIdiom:=LSMRUQUO_IsIdiom(sons^.node)
END;
END;


FUNCTION LSMRUQUO_deepsubst(T1,T3:LSSTREE_pSTREE; 
                     VAR T2:LSSTREE_pSTREE; LEVEL:integer):BOOLEAN;

(*T3: NP<NPrec1>[mu5]
  T1: ...NPVAR...
  T3: ...NP<NPrec2>[mu6]...
*)
VAR 
    NPrec1, NPrec2 :LSDOMAINT_NPrecord;
    mu5,mu6        :LSMRUQUO_LIstOfStrees;
    sons,sons1,p,last:LSSTREE_pRelNode;
    found          :BOOLEAN;
    T4          :LSSTREE_pstree;
BEGIN {LSMRUQUO_deepsubst}
  found := false;
  sons := T1^.sons;
  WHILE (sons <> NIL) AND (NOT found) DO BEGIN
   IF sons^.node^.cat = NPVAR THEN
      IF sons^.node^.ls^.NPVARfield^.index = LEVEL THEN BEGIN 
         found := true;
         NPrec1 := T3^.ls^.NPfield^; 
         WITH sons^.node^.ls^.NPVARfield^ DO BEGIN
          IF
           req = NPrec1.req THEN IF    
           env = NPrec1.env THEN IF            
           superdeixis = NPrec1.superdeixis THEN IF    
           class = NPrec1.class THEN IF          
           deixis = NPrec1.deixis THEN IF         
           aspect = NPrec1.aspect THEN IF         
           retro = NPrec1.retro THEN IF          
           definite = NPrec1.definite THEN IF       
           person = NPrec1.person THEN IF         
           number = NPrec1.number THEN IF         
           genders = NPrec1.genders THEN IF        
           sexes = NPrec1.sexes THEN IF          
           actsubcs = NPrec1.actsubcs THEN IF       
           temporal = NPrec1.temporal THEN IF       
           animate = NPrec1.animate THEN IF        
           human = NPrec1.human THEN IF          
           actcomas = NPrec1.actcomas THEN IF       
           thetanp = NPrec1.thetanp THEN IF        
           nounpatternefs = NPrec1.nounpatternefs THEN IF 
           mood = NPrec1.mood THEN IF           
           generic = NPrec1.generic THEN IF        
           posspred = NPrec1.posspred THEN IF       
           possnietnp = NPrec1.possnietnp THEN IF     
           syntquant = NPrec1.syntquant THEN IF      
           NPhead = NPrec1.NPhead THEN IF         
           specQ = NPrec1.specQ THEN IF          
           poss = NPrec1.poss THEN IF           
           coord = NPrec1.coord THEN BEGIN
             Putsonsinmu(T3^.sons,mu5);
             LSMRUQUO_AssignCase(NPrec1,mu5, NPrec2, mu6, 
                 sons^.node^.ls^.NPVARfield^.cases);
             NPrec2.superdeixis:=omegadeixis;
             NPrec2.generic    :=nogeneric;
             T4:=MAKET_Stree(T3^.cat);
             T4^.ls^.NPfield^:=NPrec2;
             T4^.sons:=mu6.first;
           END;
         END {WITH};
      END;
   IF (NOT found) AND 
      (sons^.node^.cat IN [CLAUSE,VERBP,PREPP,VARPREPP, 
                                   ADJP,NP,SENTENCE]) THEN BEGIN
     found := LSMRUQUO_DeepSubst(sons^.node, T3, T4, LEVEL);
   END;
   IF (NOT found) THEN sons := sons^.brother;
  END;
  IF found THEN BEGIN
    T2:=MAKET_Stree(T1^.cat);
    T2^.ls^:=T1^.ls^;
    T2^.li^:=T1^.li^;
    sons1:=T1^.sons;
    last:=NIL;
    WHILE sons1<>sons DO BEGIN
      MEM_newdefault(loopholes.sizeof(LSSTREE_relnode),loopholes.retype(p,MEM_ptr));
      IF last<>NIL THEN last^.brother:=p ELSE T2^.sons:=p;
      last:=p;
      p^:=sons1^;
      sons1:=sons1^.brother;
      END;
    MEM_newdefault(loopholes.sizeof(LSSTREE_relnode),loopholes.retype(p,MEM_ptr));
    IF last<>NIL THEN last^.brother:=p ELSE T2^.sons:=p;
    p^:=sons1^;
    p^.node:=T4;
  END;
 LSMRUQUO_deepsubst := found;
END {LSMRUQUO_deepsubst};

FUNCTION LSMRUQUO_deepsubstPP(T1,T3:LSSTREE_pSTREE; 
                     VAR T2:LSSTREE_pSTREE; LEVEL:integer):BOOLEAN;

(*T3: PREPP<PREPPrec1>[mu5]
  T1: ...PREPPVAR...
  T2: ...PREPP<PREPPrec2>[mu5]...
*)
VAR 
    PREPPrec1, PREPPrec2 :LSDOMAINT_PREPPrecord;
    mu5        :LSMRUQUO_LIstOfStrees;
    sons,sons1,p,last:LSSTREE_pRelNode;
    found          :BOOLEAN;
    T4          :LSSTREE_pstree;
BEGIN {LSMRUQUO_deepsubstPP}
  found := false;
  sons := T1^.sons;
  WHILE (sons <> NIL) AND (NOT found) DO BEGIN
   IF sons^.node^.cat = PREPPVAR THEN
      IF sons^.node^.ls^.PREPPVARfield^.index = LEVEL THEN BEGIN 
         found := true;
         PREPPrec1 := T3^.ls^.PREPPfield^; 
         WITH sons^.node^.ls^.PREPPVARfield^ DO BEGIN
          IF
           req = PREPPrec1.req THEN IF    
           env = PREPPrec1.env THEN IF            
           mood = PREPPrec1.mood THEN IF           
           actsubcefs = PREPPrec1.actsubcefs THEN IF
           synppefs = PREPPrec1.synppefs THEN IF
           thetapp = PREPPrec1.thetapp THEN IF
           headkey = PREPPrec1.headkey THEN IF
           class = PREPPrec1.class THEN IF          
           deixis = PREPPrec1.deixis THEN IF         
           aspect = PREPPrec1.aspect THEN IF         
           retro = PREPPrec1.retro THEN IF          
           superdeixis = PREPPrec1.superdeixis THEN IF    
           specQ = PREPPrec1.specQ THEN IF          
           stranded = PREPPrec1.stranded THEN IF
           coord = PREPPrec1.coord THEN BEGIN
             Putsonsinmu(T3^.sons,mu5);
             PREPPrec2 := PREPPrec1;
             PREPPrec2.superdeixis:=omegadeixis;
             T4:=MAKET_Stree(T3^.cat);
             T4^.ls^.PREPPfield^:=PREPPrec2;
             T4^.sons:=mu5.first;
           END;
         END {WITH};
      END;
   IF (NOT found) AND 
      (sons^.node^.cat IN [CLAUSE,VERBP,PREPP,VARPREPP, 
                                   ADJP,NP,SENTENCE]) THEN BEGIN
     found := LSMRUQUO_deepsubstPP(sons^.node, T3, T4, LEVEL);
   END;
   IF (NOT found) THEN sons := sons^.brother;
  END;
  IF found THEN BEGIN
    T2:=MAKET_Stree(T1^.cat);
    T2^.ls^:=T1^.ls^;
    T2^.li^:=T1^.li^;
    sons1:=T1^.sons;
    last:=NIL;
    WHILE sons1<>sons DO BEGIN
      MEM_newdefault(loopholes.sizeof(LSSTREE_relnode),loopholes.retype(p,MEM_ptr));
      IF last<>NIL THEN last^.brother:=p ELSE T2^.sons:=p;
      last:=p;
      p^:=sons1^;
      sons1:=sons1^.brother;
      END;
    MEM_newdefault(loopholes.sizeof(LSSTREE_relnode),loopholes.retype(p,MEM_ptr));
    IF last<>NIL THEN last^.brother:=p ELSE T2^.sons:=p;
    p^:=sons1^;
    p^.node:=T4;
  END;
 LSMRUQUO_deepsubstPP := found;
END {LSMRUQUO_deepsubstPP};

FUNCTION LSMRUQUO_deepsubstVARPP(T1,T3:LSSTREE_pSTREE; 
                     VAR T2:LSSTREE_pSTREE; LEVEL:integer):BOOLEAN;


(*T3:VARPREPP<VARPREPPrec1>[mu5]
  T1: ...PREPPVAR...
  T2: ...VARPREPP<VARPREPPrec2>[mu5]...
*)
VAR 
    VARPREPPrec1, VARPREPPrec2 :LSDOMAINT_PREPPrecord;
    mu5        :LSMRUQUO_LIstOfStrees;
    sons,sons1,p,last:LSSTREE_pRelNode;
    found          :BOOLEAN;
    T4          :LSSTREE_pstree;
BEGIN {LSMRUQUO_deepsubstVARPP}
  found := false;
  sons := T1^.sons;
  WHILE (sons <> NIL) AND (NOT found) DO BEGIN
   IF sons^.node^.cat = PREPPVAR THEN
      IF sons^.node^.ls^.PREPPVARfield^.index = LEVEL THEN BEGIN 
         found := true;
         VARPREPPrec1 := T3^.ls^.VARPREPPfield^; 
         WITH sons^.node^.ls^.PREPPVARfield^ DO BEGIN
          IF
           req = VARPREPPrec1.req THEN IF    
           env = VARPREPPrec1.env THEN IF            
           mood = VARPREPPrec1.mood THEN IF           
           actsubcefs = VARPREPPrec1.actsubcefs THEN IF
           synppefs = VARPREPPrec1.synppefs THEN IF
           thetapp = VARPREPPrec1.thetapp THEN IF
           headkey = VARPREPPrec1.headkey THEN IF
           class = VARPREPPrec1.class THEN IF          
           deixis = VARPREPPrec1.deixis THEN IF         
           aspect = VARPREPPrec1.aspect THEN IF         
           retro = VARPREPPrec1.retro THEN IF          
           superdeixis = VARPREPPrec1.superdeixis THEN IF    
           specQ = VARPREPPrec1.specQ THEN IF          
           stranded = VARPREPPrec1.stranded THEN IF
           coord = VARPREPPrec1.coord THEN BEGIN
             Putsonsinmu(T3^.sons,mu5);
             VARPREPPrec2 := VARPREPPrec1;
             VARPREPPrec2.superdeixis:=omegadeixis;
             T4:=MAKET_Stree(T3^.cat);
             T4^.ls^.VARPREPPfield^:=VARPREPPrec2;
             T4^.sons:=mu5.first;
           END;
         END {WITH};
      END;
   IF (NOT found) AND 
      (sons^.node^.cat IN [CLAUSE,VERBP,PREPP,VARPREPP, 
                                   ADJP,NP,SENTENCE]) THEN BEGIN
     found := LSMRUQUO_deepsubstVARPP(sons^.node, T3, T4, LEVEL);
   END;
   IF (NOT found) THEN sons := sons^.brother;
  END;
  IF found THEN BEGIN
    T2:=MAKET_Stree(T1^.cat);
    T2^.ls^:=T1^.ls^;
    T2^.li^:=T1^.li^;
    sons1:=T1^.sons;
    last:=NIL;
    WHILE sons1<>sons DO BEGIN
      MEM_newdefault(loopholes.sizeof(LSSTREE_relnode),loopholes.retype(p,MEM_ptr));
      IF last<>NIL THEN last^.brother:=p ELSE T2^.sons:=p;
      last:=p;
      p^:=sons1^;
      sons1:=sons1^.brother;
      END;
    MEM_newdefault(loopholes.sizeof(LSSTREE_relnode),loopholes.retype(p,MEM_ptr));
    IF last<>NIL THEN last^.brother:=p ELSE T2^.sons:=p;
    p^:=sons1^;
    p^.node:=T4;
  END;
 LSMRUQUO_deepsubstVARPP := found;
END {LSMRUQUO_deepsubstVARPP};

FUNCTION LSMRUQUO_deepsubstADVP(T1,T3:LSSTREE_pSTREE; 
                     VAR T2:LSSTREE_pSTREE; LEVEL:integer):BOOLEAN;

(*T3: ADVP<ADVPrec1>[mu5]
  T1: ...ADVPVAR...
  T2: ...ADVP<ADVPrec2>[mu5]...
*)
VAR 
    ADVPrec1, ADVPrec2 :LSDOMAINT_ADVPrecord;
    mu5        :LSMRUQUO_LIstOfStrees;
    sons,sons1,p,last:LSSTREE_pRelNode;
    found          :BOOLEAN;
    T4          :LSSTREE_pstree;
BEGIN {LSMRUQUO_deepsubstADVP}
  found := false;
  sons := T1^.sons;
  WHILE (sons <> NIL) AND (NOT found) DO BEGIN
   IF sons^.node^.cat = ADVPVAR THEN
      IF sons^.node^.ls^.ADVPVARfield^.index = LEVEL THEN BEGIN 
         found := true;
         ADVPrec1 := T3^.ls^.ADVPfield^; 
         WITH sons^.node^.ls^.ADVPVARfield^ DO BEGIN
          IF
           req = ADVPrec1.req THEN IF    
           env = ADVPrec1.env THEN IF            
           class = ADVPrec1.class THEN IF          
           deixis = ADVPrec1.deixis THEN IF         
           aspect = ADVPrec1.aspect THEN IF         
           retro = ADVPrec1.retro THEN IF          
           mood = ADVPrec1.mood THEN IF           
           thetaadv = ADVPrec1.thetaadv THEN IF
           superdeixis = ADVPrec1.superdeixis THEN IF    
           actsubcefs = ADVPrec1.actsubcefs THEN IF
           advpatternefs = ADVPrec1.advpatternefs THEN IF
           position = ADVPrec1.position THEN IF
           possnietNP = ADVPrec1.possnietnp THEN IF
           thanas = ADVPrec1.thanas THEN IF
           thanascompl = ADVPrec1.thanascompl THEN IF
           temporal = ADVPrec1.temporal THEN IF
           coord = ADVPrec1.coord THEN BEGIN
             Putsonsinmu(T3^.sons,mu5);
             ADVPrec2 := ADVPrec1;
             ADVPrec2.superdeixis:=omegadeixis;
             T4:=MAKET_Stree(T3^.cat);
             T4^.ls^.ADVPfield^:=ADVPrec2;
             T4^.sons:=mu5.first;
           END;
         END {WITH};
      END;
   IF (NOT found) AND 
      (sons^.node^.cat IN [CLAUSE,VERBP,PREPP,VARPREPP, 
                                   ADJP,NP,SENTENCE]) THEN BEGIN
     found := LSMRUQUO_deepsubstADVP(sons^.node, T3, T4, LEVEL);
   END;
   IF (NOT found) THEN sons := sons^.brother;
  END;
  IF found THEN BEGIN
    T2:=MAKET_Stree(T1^.cat);
    T2^.ls^:=T1^.ls^;
    T2^.li^:=T1^.li^;
    sons1:=T1^.sons;
    last:=NIL;
    WHILE sons1<>sons DO BEGIN
      MEM_newdefault(loopholes.sizeof(LSSTREE_relnode),loopholes.retype(p,MEM_ptr));
      IF last<>NIL THEN last^.brother:=p ELSE T2^.sons:=p;
      last:=p;
      p^:=sons1^;
      sons1:=sons1^.brother;
      END;
    MEM_newdefault(loopholes.sizeof(LSSTREE_relnode),loopholes.retype(p,MEM_ptr));
    IF last<>NIL THEN last^.brother:=p ELSE T2^.sons:=p;
    p^:=sons1^;
    p^.node:=T4;
  END;
 LSMRUQUO_deepsubstADVP := found;
END {LSMRUQUO_deepsubstADVP};

FUNCTION LSMRUQUO_acconetheyintree(T:LSSTREE_pSTREE):BOOLEAN;
VAR accfound: BOOLEAN;

PROCEDURE TraverseStree(t:LSSTREE_pStree; VAR found:BOOLEAN);
FORWARD;

PROCEDURE TraverseRelTree(rt:LSSTREE_pRelNode; VAR found:BOOLEAN);
FORWARD;

PROCEDURE TraverseStree;
BEGIN

 IF (t^.cat=NP) THEN 
    BEGIN
      IF (t^.ls^.NPfield^.NPhead IN [oneNP,theyNP]) AND
         (t^.ls^.NPfield^.cases * [accusative] <>[])
      THEN found := true
      ELSE IF   ((t^.sons <> nil) AND (NOT found)) 
           THEN TraverseRelTree(t^.sons, found)
    END
 ELSE IF ((t^.sons <> nil) AND (NOT found)) THEN TraverseRelTree(t^.sons, found)
END {TraverseStree};

PROCEDURE TraverseRelTree;
BEGIN
  IF (rt^.brother <> NIL)    THEN TraverseRelTree(rt^.brother,found);
  IF (rt^.node    <> NIL)    THEN TraverseStree(rt^.node,found);
END {TraverseRelTree};

BEGIN
  accfound := false;
  TraverseStree(t,accfound);
  LSMRUQUO_acconetheyintree := accfound;
END {LSMRUQUO_acconetheyintree};



