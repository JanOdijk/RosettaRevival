(*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LSMRUQUO
 *  Creation date   :  09-FEB-1988
 *  Author          : rene leermakers
 *
 *  Copyright (c) 1988, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : Contains language dependent procedures and functions
 *                    for use in Mrules.
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
  MEM_newdefault(loopholes.SIZEof(LSSTREE_relnode),loopholes.retype(p1,MEM_ptr));
  p:=p1;
  p1^:=L1.first^;
  p1^.brother:=NIL;
  L2.first:=p1;
  WHILE L1.first<>L1.last DO
    BEGIN
    L1.first:=L1.first^.brother;
    MEM_newdefault(loopholes.SIZEof(LSSTREE_relnode),loopholes.retype(p1,MEM_ptr));
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
MEM_newdefault(loopholes.SIZEof(LSSTREE_relnode),loopholes.retype(p,MEM_ptr));
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
MEM_newdefault(loopholes.SIZEof(LSSTREE_relnode),loopholes.retype(p,MEM_ptr));
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
  sarray[subjrel] := i; 
  i:= i+1;
  sarray[negrel] := i; 
  sarray[posrel] := i; 
  i := i+1;
  sarray[cliticrel] := i; 

  i:=i+1;
  sarray[head] := i;
  i:= i+1;
 
  sarray[predrel] := i; 

  i:= i+1;
  sarray[agvpadvrel ] := i; 
  sarray[causadvrel] := i; 
  sarray[subjvpadvrel] := i; 
  sarray[tempadvrel] := i; 
  sarray[sentadvrel] := i; 
  sarray[locadvrel] := i; 

  i:= i+1;
  sarray[complrel]    := i;
  sarray[extraposrel] := i; 
  i:= i+1;
  sarray[relsentrel] := i; 
  i:= i+1;
  sarray[postsentadvrel] := i;
  i:= i+1;
  sarray[resultrel] := i; 
  i:= i+1;

 
  sarray[puncrel] := specrel; 
  sarray[gluerel] := specrel; 
  sarray[meltnegrel] := specrel;
END {initsrelorder};

PROCEDURE initVPrelorder(VAR vparray: synrelarray);
VAR i : INTEGER;
BEGIN
  initrelorder(vparray);


  i := 1;

  vparray[auxrel] :=i;
  i:= i +1;
  vparray[head  ] := i;
  
  i := i+1;
  vparray[cliticrel] := i; 

  i := i +1;
  vparray[objrel] := i; 

  i:= i+1;
  vparray[complrel] := i; 

  i := i +1;
  vparray[indobjrel] := i; 
  vparray[paraobjrel] := i; 


  i := i +1;
  vparray[dirargrel] := i; 
  vparray[locargrel] := i; 
  vparray[predrel] := i; 
  vparray[prepobjrel] := i; 





  i := i +1;
  vparray[vpadvrel ] := i; 
  vparray[subjvpadvrel] := i; 
  vparray[instradvrel  ] := i; 
  vparray[agvpadvrel] := i; 
  vparray[porobjrel] := i; 
 

  vparray[gluerel] := specrel; 
  vparray[puncrel] := specrel; 
END {initvprelorder};

PROCEDURE initADJPrelorder(VAR adjparray: synrelarray);
VAR i :integer;
BEGIN
  initrelorder(adjparray);
  (* filled provisionally by JO, used in adjrefvar etc.  13-OCT-1989 10:34:45 *)
  i := 1;
  adjparray[modrel] := i;
  i:= i + 1;
  adjparray[head] := i;
  i:= i + 1;
  adjparray[indobjrel] := i;
  adjparray[prepobjrel] := i;
  i:= i + 1;
  adjparray[complrel] := i;
  i:= i + 1;
  adjparray[locadvrel] := i;
  i:= i + 1;
  adjparray[tempadvrel] := i;
  i:= i +1;
  adjparray[sentadvrel] := i;
  
  adjparray[puncrel] := specrel; 
  adjparray[gluerel] := specrel; 
END {initadjprelorder};


BEGIN
  initSrelorder(Srelorder);
  initVPrelorder(VPrelorder);
  initADJPrelorder(ADJPrelorder);
END{LSMRUQUO_init};


FUNCTION LSMRUQUO_polarityok(t:LSSTREE_pStree):BOOLEAN;
VAR
    deepsentreq,
    error                                : BOOLEAN;
    reqvar, envvar, Vreqvar, defpolval,
    topsentreq
                                         :LSDOMAINT_polarityeffsettype;
    topcat                               :LSDOMAINT_syntcat;
    negpos                               :LSDOMAINT_negpostype;
    cmr                                  :LSDOMAINT_synrel;

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

PROCEDURE eval(n:LSSTREE_pStree; cmr:LSDOMAINT_synrel);
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
              IF  (cmr IN [shiftrel])       AND
                  (negpos = shiftneg)
              THEN adapt([negpol], envvar);

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
              IF  (cmr IN [shiftrel])       AND
                  (negpos = shiftneg)
              THEN adapt([negpol], envvar);

              IF  (cmr IN [subjrel])        AND
                 (negpos = subjneg)
              THEN adapt([negpol], envvar);

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
              IF  (cmr IN [shiftrel])       AND
                  (negpos = shiftneg)
              THEN adapt([negpol], envvar);

              IF  (cmr IN [subjrel])       AND
                  (negpos = subjneg)
              THEN adapt([negpol], envvar);

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


PROCEDURE TraverseStree(t:LSSTREE_pStree;VAR cmr:LSDOMAINT_synrel);
FORWARD;

PROCEDURE TraverseRelTree(rt:LSSTREE_pRelNode;VAR cmr:LSDOMAINT_synrel);
FORWARD;

PROCEDURE TraverseStree;
BEGIN
  IF (t^.cat = SENTENCE) THEN BEGIN 
     negpos := t^.ls^.SENTENCEfield^.negpos
  END; 
  IF (t^.sons <> nil)                          
  THEN IF
         ( NOT ((LDCATSETS_LEXCAT(loopholes.retype(t^.cat,LIDOMAINT_syntcat)) )  AND
                (NOT LDCATSETS_LEXCAT(loopholes.retype(t^.sons^.node^.cat,LIDOMAINT_syntcat)) )
               )
         )
       THEN TraverseRelTree(t^.sons,cmr);
  IF   (t^.cat IN [ADJ, ADV, CONJ, DET, INDEFPRO, NEG, NOUN, PREP, 
                   Q, VERB, SENTENCE]) 
  THEN eval(t,cmr);
END {TraverseStree};

PROCEDURE TraverseRelTree;
BEGIN
  IF (rt^.brother <> NIL)    THEN TraverseRelTree(rt^.brother,cmr);
  IF (rt^.node^.cat IN [NP, PREPP, ADJP, ADVP]) THEN cmr := rt^.relation;
  IF (rt^.node    <> NIL)    THEN TraverseStree(rt^.node,cmr);
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
negpos     := noneg;
cmr        := head;
TraverseStree(t,cmr);
IF (topcat <> SENTENCE) 
  THEN LSMRUQUO_polarityok := ((NOT error)             AND
                               (topsentreq = defpolval)
                              )
  ELSE LSMRUQUO_polarityok := ((NOT error)          AND
                               (reqvar = defpolval)
                              );
END {LSMRUQUO_polarityok};




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
  CASE PERSPROrec1.forma OF
   Nomfuerte,prepfuerte:
      IF      casevalue = [Nominative]  THEN PERSPROrec2.forma := Nomfuerte
      ELSE IF casevalue = [prepositive] THEN PERSPROrec2.forma := Prepfuerte
      ELSE IF casevalue = []            THEN PERSPROrec2.forma := Nomfuerte
      ELSE IF casevalue = [Accusative]  THEN PERSPROrec2.forma := Prepfuerte;
   Nomdebil, Acuscl, acuslecl, datcl:
      IF      casevalue = [Nominative]  THEN PERSPROrec2.forma := Nomdebil
      ELSE IF casevalue = [Accusative]  THEN PERSPROrec2.forma := Acuscl
      ELSE IF casevalue = [dative]      THEN PERSPROrec2.forma := datcl 
      ELSE IF casevalue = []            THEN PERSPROrec2.forma := Nomfuerte;
  END {CASE};
  tree:=MAKET_stree(PERSPRO);
  tree^.ls^.PERSPROfield^:=PERSPROrec2;
  tree^.sons:=reltree^.node^.sons; 
  tree^.li^.n:=reltree^.node^.li^.n;
  appendrelandtree(head,tree,mu2);
  appendlists(mu5,mu2);
  END ELSE MEM_releasedefault(stackptr);
TESTPERSPRO:=result
END;


FUNCTION TESTCOORDNP(mu1:LSMRUQUO_ListOfStrees;
                     VAR mu2:LSMRUQUO_ListofStrees)
                    : BOOLEAN;

{
coordinated NP 
   ELIF mu1 = [ argrel/NP<NPrec3>[mu3], head/.., argrel/NP<NPrec4>[mu4] ]
   THEN mu2 := [ argrel/NP<NPrec5>[mu5], head/.., argrel/NP<NPrec6>[mu6] ];
        assigncase ( NP<NPrec3>, mu3, NP<NPrec5>, mu5, c );
	assigncase ( NP<NPrec4>, mu4, NP<NPrec6>, mu6, c )

}
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

{
normal noun
   ELIF  mu1 = [ mu3, 
		 head/CN<CNrec1>[mu4],
		 mu6
	       ]
   THEN mu2 := [ mu3, 
		 head/CN<CNrec2>
		     [ mu4],
		 mu6
	       ];
        CNrec2 := CNrec1;
	CNrec2.cases := [c];

}


VAR result:BOOLEAN;
    tree:LSSTREE_pstree;
    reltree:LSSTREE_prelnode;
    CNrec1,CNrec2:LSDOMAINT_CNrecord;
    mu3,mu4,mu6:LSMRUQUO_ListOfStrees;
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
  BEGIN {IF result }
  mu6:=mu1;
  mu2 := mu3;
  CNrec2 := CNrec1;
  CNrec2.cases := casevalue;
  tree := MAKET_stree(CN);
  tree^.ls^.CNfield^:=CNrec2;
  tree^.sons:=reltree^.node^.sons; 
  appendrelandtree(head,tree,mu2);
  appendlists(mu6,mu2);
  END {IF result } ELSE MEM_releasedefault(stackptr);
TESTCN:=result
END {testcn body};



BEGIN
    NPrec2 := NPrec1;                       
    NPrec2.cases := casevalue;
    IF NOT TESTPERSPRO(mu1,mu2) THEN
    IF NOT TESTCN(mu1,mu2) THEN
    IF NOT TESTMODNP(mu1,mu2) THEN
    IF NOT TESTCOORDNP(mu1,mu2) THEN
      BEGIN
      mu2:=mu1;
      END
    ELSE  mu2 := mu1;
END {assigncase};


FUNCTION LSMRUQUO_Tiempomax(d, s, ns:LSDOMAINT_tiempotype)
                    : BOOLEAN;
VAR res :LSDOMAINT_tiempotype;
BEGIN
  IF   (d <> omegatiempo)
  THEN res := d
  ELSE res := s;
  LSMRUQUO_tiempomax := (res = ns);
END {Tiempomax};

PROCEDURE LSMRUQUO_asstiempomax(d,s: LSDOMAINT_tiempotype; 
                          VAR res:LSDOMAINT_tiempotype);
BEGIN
  IF   (d <> omegatiempo)
  THEN res := d
  ELSE res := s;
END {asstiempomax};


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
           supertiempo = NPrec1.supertiempo THEN IF    
           class = NPrec1.class THEN IF          
           tiempo = NPrec1.tiempo THEN IF         
           aspecto = NPrec1.aspecto THEN IF         
           retro = NPrec1.retro THEN IF          
           definite = NPrec1.definite THEN IF       
           persona = NPrec1.persona THEN IF         
           numero = NPrec1.numero THEN IF         
           genero = NPrec1.genero THEN IF        
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
          {coord = NPrec1.coord THEN IF}
           DefSpec = NPrec1.DefSpec THEN BEGIN
             Putsonsinmu(T3^.sons,mu5);
             LSMRUQUO_AssignCase(NPrec1,mu5, NPrec2, mu6, 
                 sons^.node^.ls^.NPVARfield^.cases);
             NPrec2.supertiempo :=omegatiempo;
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
      MEM_newdefault(loopholes.SIZEof(LSSTREE_relnode),loopholes.retype(p,MEM_ptr));
      IF last<>NIL THEN last^.brother:=p ELSE T2^.sons:=p;
      last:=p;
      p^:=sons1^;
      sons1:=sons1^.brother;
      END;
    MEM_newdefault(loopholes.SIZEof(LSSTREE_relnode),loopholes.retype(p,MEM_ptr));
    IF last<>NIL THEN last^.brother:=p ELSE T2^.sons:=p;
    p^:=sons1^;
    p^.node:=T4;
  END;
 LSMRUQUO_deepsubst := found;
END {LSMRUQUO_deepsubst};



FUNCTION LSMRUQUO_Negphrase(T:LSSTREE_pStree)
                  :BOOLEAN ;
VAR result : BOOLEAN;
    nadieINDEFPROkey,
    nuncaBADVkey,
    ningunBDETkey,
    nadaINDEFPROkey : STRING_string;
    j                :INTEGER;

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
   STRING_Constant(nadieINDEFPROkey, 'nadieINDEFPROkey',16);   
   STRING_Constant(nadaINDEFPROkey, 'nadaINDEFPROkey', 15);   
   STRING_COnstant(nuncaBADVkey , 'nuncaBADVkey' ,12);   
   STRING_Constant(ningunBDETkey , 'ningunBDETkey' ,13);   
   result := false;
   IF T^.CAT IN [NP, ADVP] THEN BEGIN
     CASE T^.cat OF
       NP:   BEGIN
                result := (findkey(T,nadieINDEFPROkey,16) OR 
                           findkey(T,nadaINDEFPROkey,15));
                IF (T^.sons <> NIL ) THEN
                  result := result OR findkey(T^.sons^.node, ningunBDETkey,13);
             END;
       ADVP:  result := findkey(T,nuncaBADVkey,12);
     END;
   END;
   LSMRUQUO_Negphrase:= result;
END {Negphrase};




FUNCTION LSMRUQUO_Gsubstordercondition1(mu:LSMRUQUO_ListOfStrees)
                    :BOOLEAN;
BEGIN
  LSMRUQUO_Gsubstordercondition1 := true;
END {LSMRUQUO_Gsubstordercondition1};

FUNCTION LSMRUQUO_Gsubstordercondition2(mu1,mu2:LSMRUQUO_ListOfStrees)
                    :BOOLEAN;
BEGIN
  LSMRUQUO_Gsubstordercondition2 := true;
END {LSMRUQUO_Gsubstordercondition2};

FUNCTION LSMRUQUO_Gsubstordercondition
                     (mu1,mu2, mu3:LSMRUQUO_ListOfStrees)
                    :BOOLEAN;
BEGIN
  LSMRUQUO_Gsubstordercondition := true;
END {LSMRUQUO_Gsubstordercondition};



FUNCTION LSMRUQUO_substordercondition1(mu1:LSMRUQUO_ListOfStrees)
                    :BOOLEAN;

VAR p      : LSSTREE_prelnode;
    result : BOOLEAN;
    varcs  : SET OF LSDOMAINT_syntcat;

BEGIN
varcs := LSAUXDOM_VARCATSET;
result := TRUE;
WHILE stillreltrees(mu1) AND result DO
  BEGIN
  takereltree(p,mu1);
  IF p^.node^.cat IN varcs THEN result := FALSE;
  END;

LSMRUQUO_substordercondition1 := result
END;


FUNCTION LSMRUQUO_substordercondition2(mu1,mu2:LSMRUQUO_ListOfStrees)
                    :BOOLEAN;

VAR p      : LSSTREE_prelnode;
    result : BOOLEAN;
    varcs  : SET OF LSDOMAINT_syntcat;

BEGIN
varcs := LSAUXDOM_VARCATSET  ; 
result := TRUE;
WHILE stillreltrees(mu1) AND result DO
  BEGIN
  takereltree(p,mu1);
  IF p^.node^.cat IN varcs THEN result := FALSE;
  END;

IF result THEN
  BEGIN
  WHILE stillreltrees(mu2) AND result DO
    BEGIN
    takereltree(p,mu2);
    IF p^.node^.cat IN varcs THEN result := FALSE;
    END
  END;

LSMRUQUO_substordercondition2 := result

END;



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



FUNCTION LSMRUQUO_substordercondition(mu1,mu2, mu3:LSMRUQUO_ListOfStrees)
                    :BOOLEAN;

VAR p      : LSSTREE_prelnode;
    result : BOOLEAN;
    varcs  : SET OF LSDOMAINT_syntcat;

BEGIN
varcs := LSAUXDOM_VARCATSET; 
result := TRUE;
WHILE stillreltrees(mu1) AND result DO
  BEGIN
  takereltree(p,mu1);
  IF p^.node^.cat IN varcs THEN result := FALSE;
  END;

IF result THEN
  BEGIN
  WHILE stillreltrees(mu2) AND result DO
    BEGIN
    takereltree(p,mu2);
    IF p^.node^.cat IN varcs THEN result := FALSE;
    END
  END;

IF result THEN
  BEGIN
  WHILE stillreltrees(mu3) AND result DO
    BEGIN
    takereltree(p,mu3);
    IF p^.node^.cat IN varcs THEN result := FALSE;
    END
  END;

LSMRUQUO_substordercondition := result

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




