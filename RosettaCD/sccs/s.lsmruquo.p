h37508
s 00053/00007/02990
d D 1.2 92/02/21 15:41:45 rous 2 1
c 
e
s 02997/00000/00000
d D 1.1 91/05/23 13:13:48 leermake 1 0
c date and time created 91/05/23 13:13:48 by leermake
e
u
U
f e 0
t
T
I 1
 
(*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LSMRUQUO
 *  Creation date   :  14-SEP-1987
 *  Author          : rene leermakers,jan odijk
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


FUNCTION toset(r:LSDOMAINT_KINDSTYPE):LSDOMAINT_KINDSEFFSETTYPE;
BEGIN
  CASE r OF
    Xk  : toset := [Xk];
    Lk  : toset := [Lk];
    Qk  : toset := [Qk];
    Pk  : toset := [Pk];
    XLk : toset := [Xk, Lk];
    XQk : toset := [Xk, Qk];
    XPk : toset := [Xk,Pk];
    LQk : toset := [Qk, Lk];
    QPk : toset := [Pk, Qk];
    XLQk: toset := [Xk, Qk, Lk];
    XPQk: toset := [Xk, Pk, Qk];
  END
END;

FUNCTION tobase(s:LSDOMAINT_KINDSEFFSETTYPE):LSDOMAINT_KINDSTYPE;
BEGIN

  IF         s = [Xk]         THEN tobase := Xk
    ELSE IF  s = [Lk]         THEN tobase := Lk
    ELSE IF  s = [Qk]         THEN tobase := Qk
    ELSE IF  s = [Pk]         THEN tobase := Pk
    ELSE IF  s = [Xk, Lk]     THEN tobase := XLk
    ELSE IF  s = [Xk, Qk]     THEN tobase := XQk
    ELSE IF  s = [Xk, Pk]     THEN tobase := XPk
    ELSE IF  s = [Lk, Qk]     THEN tobase := LQk
    ELSE IF  s = [Qk, Pk]     THEN tobase := QPk
    ELSE IF  s = [Xk, Lk, Qk] THEN tobase := XLQk
    ELSE IF  s = [Xk, Pk, Qk] THEN tobase := XPQk
    ELSE                           tobase := Xk
END;

 PROCEDURE LSMRUQUO_copytreeifvar(
                     T1:LSSTREE_pstree;VAR T2:LSSTREE_pstree);
BEGIN
IF LDCATSETS_varcatset(loopholes.retype(T1^.cat,LIDOMAINT_syntcat)) THEN T2:=T1 ELSE T2:=NIL;
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

 FUNCTION LSMRUQUO_varinradv(T:LSSTREE_pSTREE):BOOLEAN;
VAR result :BOOLEAN; 
BEGIN
 result := false;
 result:= ( T^.cat = RADVP);
 IF result THEN result := (T^.sons <> NIL);
 IF result THEN result := (T^.sons^.node^.cat IN LSAUXDOM_VARCATSET);
 LSMRUQUO_varinradv := result;
END {LSMRUQUO_varinradv};


 FUNCTION LSMRUQUO_normalergative(vrec:LSDOMAINT_VERBrecord):BOOLEAN;
BEGIN
  LSMRUQUO_normalergative := 
            (vrec.thetavp IN [vp010,vp012])     AND
            ( (vrec.caseassigner = false)    OR
              (vrec.reflexivity = reflexive)
            );
END {LSMRUQUO_normalergative};

 FUNCTION LSMRUQUO_checkindices(T1,T2:LSSTREE_pSTREE):BOOLEAN;
VAR result : BOOLEAN; 
BEGIN
 result := false;
 IF (T1^.cat IN [NPVAR]) AND (T2^.cat IN [NPVAR]) THEN
   result:= (T1^.ls^.npvarfield^.index = T2^.ls^.npvarfield^.index)
 ELSE IF (T1^.cat IN [CNVAR]) AND (T2^.cat IN [CNVAR]) THEN
       result:= (T1^.ls^.cnvarfield^.index = T2^.ls^.cnvarfield^.index);
 LSMRUQUO_checkindices := result;
END {LSMRUQUO_checkindices};

 FUNCTION LSMRUQUO_Deixismax(d, s, ns:LSDOMAINT_deixistype)
                    : BOOLEAN;
VAR res :LSDOMAINT_deixistype;
BEGIN
  IF   (d <> omegadeixis)
  THEN res := d
  ELSE res := s;
  LSMRUQUO_deixismax := (res = ns);
END {Deixismax};

 PROCEDURE LSMRUQUO_assdeixismax(d,s: LSDOMAINT_deixistype; 
                          VAR res:LSDOMAINT_deixistype);
BEGIN
  IF   (d <> omegadeixis)
  THEN res := d
  ELSE res := s;
END {assdeixismax};


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


 FUNCTION LSMRUQUO_Contains2sgsubj(mu:LSMRUQUO_ListOfStrees)
                  :BOOLEAN ;
VAR result : BOOLEAN;
    rel    : LSDOMAINT_synrel;
    tree   : LSSTREE_pSTREE;
BEGIN {LSMRUQUO_Contains2sgsubj}
  result := false;
  
  WHILE stillreltrees(mu) AND (NOT result) DO
  BEGIN
    takerelandtree(rel, tree, mu);
    result := ((rel = subjrel) AND (tree^.cat = NP));
    IF result THEN result := ((tree^.ls^.NPfield^.person =2) AND 
                              (tree^.ls^.NPfield^.number =singular)); 
  END;
  LSMRUQUO_Contains2sgsubj:= result;
END {LSMRUQUO_Contains2sgsubj};


 FUNCTION LSMRUQUO_ElkaarAnt(T:LSSTREE_pSTREE)
                  : BOOLEAN;
VAR result : BOOLEAN;
BEGIN {LSMRUQUO_ElkaarAnt}
   result := (T^.CAT IN [NPVAR, CNVAR]);
   IF   result 
   THEN BEGIN
     CASE T^.CAT OF
       NPVAR: result := ((T^.ls^.NPVARfield^.number = plural) OR
                         (T^.ls^.NPVARfield^.NPhead IN 
                              [jeGenNP, menNP]) {elkaarNP weggehaald,rene 3-juni-'88}
                        );
       CNVAR: result := (plural IN T^.ls^.CNVARfield^.numbers);   
     END;
   END;
   LSMRUQUO_ElkaarAnt:= result;
END {LSMRUQUO_ElkaarAnt};



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
D 2
             (T^.ls^.ADVPfield^.class IN [reference, duration])
E 2
I 2
             NOT (T^.ls^.ADVPfield^.class IN [reference, duration]) {J.R. conv}
E 2
            )
           );                    
{            
  add conditions for (!for three days!!)
}
    ADVPVAR: result := 
              ((sentadv IN T^.ls^.ADVPVARfield^.actsubcefs)       OR
               ((tempadv IN T^.ls^.ADVPVARfield^.actsubcefs) AND
D 2
                (T^.ls^.ADVPfield^.class NOT IN [reference, duration])
E 2
I 2
                NOT (T^.ls^.ADVPfield^.class IN [reference, duration]) {J.R. conv}
E 2
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
  result := Quantificational(reltree^.node)
END;
WHILE StillReltrees(mu) AND (NOT result) DO BEGIN
  takereltree(reltree,mu);
  result := reltree^.node^.cat IN LSAUXDOM_VARCATSET;
  IF result THEN result := Quantificational(reltree^.node)
END;
Qvarinmu := result;
END {Qvarinmu};





 FUNCTION LSMRUQUO_Gsubstordercondition1
           (mu1:LSMRUQUO_ListOfStrees; T:LSSTREE_pStree)
                  : BOOLEAN;
VAR result : BOOLEAN;
BEGIN {Gsubstordercondition1}
result := false;
IF LSMRUQUO_substordercondition1(mu1) THEN result := true;
IF (NOT result) THEN IF (NOT quantificational(T) ) THEN result := true;
IF (NOT result) THEN IF (NOT Qvarinmu(mu1)) THEN result := true;
LSMRUQUO_Gsubstordercondition1:= result;
END {LSMRUQUO_Gsubstordercondition1};









 FUNCTION LSMRUQUO_Gsubstordercondition2
           (mu1, mu2:LSMRUQUO_ListOfStrees;T:LSSTREE_pStree)
                  :BOOLEAN ;
BEGIN {LSMRUQUO_Gsubstordercondition2}
   LSMRUQUO_Gsubstordercondition2:= 
         (LSMRUQUO_Gsubstordercondition1(mu1,T) AND
          LSMRUQUO_Gsubstordercondition1(mu2,T) 
         );
END {LSMRUQUO_Gsubstordercondition2};

 FUNCTION LSMRUQUO_Gsubstordercondition
                         (mu1,mu2,mu3:LSMRUQUO_ListOfStrees;T:LSSTREE_pStree)
                  :BOOLEAN ;
BEGIN {LSMRUQUO_Gsubstordercondition}
   LSMRUQUO_Gsubstordercondition:= 
         (LSMRUQUO_Gsubstordercondition1(mu1,T) AND
          LSMRUQUO_Gsubstordercondition1(mu2,T) AND
          LSMRUQUO_Gsubstordercondition1(mu3,T) 
         );
END {LSMRUQUO_Gsubstordercondition};




 FUNCTION LSMRUQUO_errelinpp(T:LSSTREE_pStree)
                  :BOOLEAN ;
VAR result        :BOOLEAN;
    mu            :LSMRUQUO_ListOfStrees;
    reltree       :LSSTREE_pRelnode;
BEGIN {LSMRUQUO_errelinpp}
   result := false;
   result := (T^.CAT IN [PREPP, VARPREPP]);
   IF result THEN 
      BEGIN
      PutSonsinMu(T^.sons, mu);
      IF stillreltrees(mu) THEN
         BEGIN
           takereltree(reltree,mu);
           result:= (reltree^.relation=errel);
          WHILE stillreltrees(mu) and NOT(result) DO
            BEGIN
             takereltree(reltree,mu);
             result:= (reltree^.relation=errel);
            END;
         END ELSE result:=FALSE;
      END; 
   LSMRUQUO_errelinpp := result;
END {LSMRUQUO_errelinpp};

I 2
FUNCTION LSMRUQUO_hetetcinpp(T:LSSTREE_pStree)
                  :BOOLEAN ;
VAR result        :BOOLEAN;
    mu            :LSMRUQUO_ListOfStrees;
    reltree       :LSSTREE_pRelnode;
BEGIN {LSMRUQUO_hetetcinpp}
   result := false;
   result := (T^.CAT IN [PREPP, VARPREPP]);
   IF result THEN 
      BEGIN
      PutSonsinMu(T^.sons, mu);
      IF stillreltrees(mu) THEN
         BEGIN
           takereltree(reltree,mu);
           result:= (reltree^.node^.cat IN [NP, NPVAR]);
           IF result THEN BEGIN
              CASE reltree^.node^.cat OF
               NP: result := reltree^.node^.ls^.NPfield^.possRform;
               NPVAR: result := reltree^.node^.ls^.NPVARfield^.possRform;
              END
           END;
          WHILE stillreltrees(mu) and NOT(result) DO
            BEGIN
             takereltree(reltree,mu);
             result:= (reltree^.node^.cat IN [NP, NPVAR]);
             IF result THEN BEGIN
                CASE reltree^.node^.cat OF
                 NP: result := reltree^.node^.ls^.NPfield^.possRform;
                 NPVAR: result := reltree^.node^.ls^.NPVARfield^.possRform;
                END
             END;
            END;
         END ELSE result:=FALSE;
      END; 
   LSMRUQUO_hetetcinpp := result;
END {LSMRUQUO_hetetcinpp};
E 2

I 2



E 2
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


 FUNCTION LSMRUQUO_Negphrase(T:LSSTREE_pStree)
                  :BOOLEAN ;
VAR result : BOOLEAN;
    niemandBINDEFPROkey,
    nooitBADVkey,
    geenBDETkey,
    nergensRADVkey,
    nietsBINDEFPROkey : STRING_string;
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
   STRING_Constant(niemandBINDEFPROkey, 'niemandBINDEFPROkey',19);   
   STRING_Constant(nietsBINDEFPROkey,   'nietsBINDEFPROkey', 17);   
   STRING_COnstant(nooitBADVkey ,       'nooitBADVkey' ,12);   
   STRING_Constant(geenBDETkey ,        'geenBDETkey' ,11);   
   STRING_Constant(nergensRADVkey ,     'nergensRADVkey' ,14);   
   result := false;
   IF T^.CAT IN [NP, ADVP, RADVP] THEN BEGIN
     CASE T^.cat OF
       NP:    BEGIN 
                result := (findkey(T,niemandBINDEFPROkey,19) OR 
                           findkey(T,nietsBINDEFPROkey,17));
                IF (T^.sons <> NIL) THEN 
                   result := (result OR
                              findkey(T^.sons^.node, geenBDETkey,11)
                             );
              END;
       ADVP:  result := findkey(T,nooitBADVkey,12);
       RADVP: result := findkey(T,nergensRADVkey, 14)
     END;
   END;
   LSMRUQUO_Negphrase:= result;
END {Negphrase};













 FUNCTION LSMRUQUO_substordercondition1(mu1:LSMRUQUO_ListOfStrees)
                    :BOOLEAN;

VAR p      : LSSTREE_prelnode;
    result : BOOLEAN;
    varcs  : SET OF LSDOMAINT_syntcat;
    mu10   : LSMRUQUO_ListOfStrees;

BEGIN
varcs := LSAUXDOM_VARCATSET  + LSAUXDOM_CTVARCATS; 
result := TRUE;
WHILE stillreltrees(mu1) AND result DO
  BEGIN
  takereltree(p,mu1);
  IF p^.node^.cat IN varcs THEN result := FALSE;
   IF result THEN BEGIN
      PutSonsInMu(p^.node^.sons, mu10);
      IF (NOT LSMRUQUO_substordercondition1(mu10)) THEN result := false;
   END;
  END;

LSMRUQUO_substordercondition1 := result
END;





 FUNCTION LSMRUQUO_substordercondition2(mu1,mu2:LSMRUQUO_ListOfStrees)
                    :BOOLEAN;

VAR p      : LSSTREE_prelnode;
    result : BOOLEAN;
    varcs  : SET OF LSDOMAINT_syntcat;
    mu10   : LSMRUQUO_ListOfStrees;

BEGIN
varcs := LSAUXDOM_VARCATSET  + LSAUXDOM_CTVARCATS; 
result := TRUE;
WHILE stillreltrees(mu1) AND result DO
  BEGIN
  takereltree(p,mu1);
  IF p^.node^.cat IN varcs THEN result := FALSE;
   IF result THEN BEGIN
      PutSonsInMu(p^.node^.sons, mu10);
      IF ( NOT LSMRUQUO_substordercondition1(mu10)) THEN result := false;
   END;
  END;

IF result THEN
  BEGIN
  WHILE stillreltrees(mu2) AND result DO
    BEGIN
    takereltree(p,mu2);
    IF p^.node^.cat IN varcs THEN result := FALSE;
   IF result THEN BEGIN
      PutSonsInMu(p^.node^.sons, mu10);
      IF (NOT LSMRUQUO_substordercondition1(mu10)) THEN result := false;
   END;
    END
  END;

LSMRUQUO_substordercondition2 := result

END;


 FUNCTION LSMRUQUO_substordercondition(mu1,mu2, mu3:LSMRUQUO_ListOfStrees)
                    :BOOLEAN;

VAR p      : LSSTREE_prelnode;
    result : BOOLEAN;
    varcs  : SET OF LSDOMAINT_syntcat;
    mu10   : LSMRUQUO_ListOfStrees;

BEGIN
varcs := LSAUXDOM_VARCATSET +  LSAUXDOM_CTVARCATS; 
result := TRUE;
WHILE stillreltrees(mu1) AND result DO
  BEGIN
  takereltree(p,mu1);
  IF p^.node^.cat IN varcs THEN result := FALSE;
   IF result THEN BEGIN
      PutSonsInMu(p^.node^.sons, mu10);
      IF (NOT LSMRUQUO_substordercondition1(mu10)) THEN result := false;
   END;
  END;

IF result THEN
  BEGIN
  WHILE stillreltrees(mu2) AND result DO
    BEGIN
    takereltree(p,mu2);
    IF p^.node^.cat IN varcs THEN result := FALSE;
   IF result THEN BEGIN
      PutSonsInMu(p^.node^.sons, mu10);
      IF (NOT LSMRUQUO_substordercondition1(mu10)) THEN result := false;
   END;
    END
  END;

IF result THEN
  BEGIN
  WHILE stillreltrees(mu3) AND result DO
    BEGIN
    takereltree(p,mu3);
    IF p^.node^.cat IN varcs THEN result := FALSE;
   IF result THEN BEGIN
      PutSonsInMu(p^.node^.sons, mu10);
      IF (NOT LSMRUQUO_substordercondition1(mu10)) THEN result := false;
   END;
    END
  END;

LSMRUQUO_substordercondition := result

END;

 FUNCTION LSMRUQUO_FirstIsADefNp(mu:LSMRUQUO_ListOfStrees)
                    : BOOLEAN;
VAR rel  : LSDOMAINT_synrel;
    tree : LSSTREE_pSTREE;
BEGIN
  IF (NOT stillreltrees(mu)) THEN 
    LSMRUQUO_FirstIsADefNp:=FALSE
  ELSE
   BEGIN
     takerelandtree(rel, tree, mu);
D 2
     IF tree^.cat NOT IN [NP,NPVAR]
E 2
I 2
     IF NOT (tree^.cat IN [NP,NPVAR])
E 2
        THEN LSMRUQUO_FirstIsADefNp := false
        ELSE BEGIN
          CASE tree^.cat OF
           NP   : LSMRUQUO_FirstIsADefNp 
                      := (tree^.ls^.NPfield^.definite=def);
           NPVAR: LSMRUQUO_FirstIsADefNp 
                      := (tree^.ls^.NPVARfield^.definite=def);
          END;
        END;
   END
END;


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


result := (T^.cat IN [NP, ADVP, RADVP, NPVAR, ADVPVAR, PREPP, VARPREPP]);
  IF result THEN
    BEGIN
    CASE T^.cat OF
       NP     : result := (T^.ls^.NPfield^.possnietnp = true);
       NPVAR  : result := (T^.ls^.NPVARfield^.possnietnp = true);
       ADVP   : result := (T^.ls^.ADVPfield^.possnietnp = true);
       ADVPVAR: result := (T^.ls^.ADVPVARfield^.possnietnp = true);
       PREPP, VARPREPP: result := PPpossnietxp(T);
       RADVP  : BEGIN
                  CASE T^.sons^.node^.cat OF
                     RADV: BEGIN
                           STRTOKEY_getskeyHash('ergensRADVkey',intkey);
                           result := (T^.ls^.RADVPfield^.radvkey = intkey);
                           END;
                     ADVPVAR, NPVAR: result := 
                               LSMRUQUO_possnietxp(T^.sons^.node);
                  END
                END;
      END  
    END;
LSMRUQUO_PossNietXp:=result;
END;




 FUNCTION LSMRUQUO_CpSpecq
      (s:LSDOMAINT_specqtype; mu:LSMRUQUO_ListOfStrees)
                  :BOOLEAN ;
VAR result : BOOLEAN;
    reltree: LSSTREE_pRelnode;
BEGIN {LSMRUQUO_CpSpecq}
   result:= stillreltrees(mu);
   IF result THEN BEGIN
       takereltree(reltree, mu);
       result := reltree^.node^.cat IN [NP, NPVAR, CNVAR];
       IF result THEN BEGIN
         CASE reltree^.node^.cat OF
           NP   : result := (reltree^.node^.ls^.NPfield^.specq = s);
           NPVAR: result := (reltree^.node^.ls^.NPVARfield^.specq = s);
           CNVAR: result := (s = yesspec);
         END;
       END
   END;
   LSMRUQUO_CpSpecq:= result;
END {LSMRUQUO_CpSpecq};



 PROCEDURE LSMRUQUO_assSpecq
      (VAR s:LSDOMAINT_specqtype; mu:LSMRUQUO_ListOfStrees);
VAR result : BOOLEAN;
    reltree: LSSTREE_pRelnode;
BEGIN {LSMRUQUO_assspecq}
   s := nospec;
   result:= stillreltrees(mu);
   IF result THEN BEGIN
       takereltree(reltree, mu);
       result := reltree^.node^.cat IN [NP, NPVAR, CNVAR];
       IF result THEN BEGIN
         CASE reltree^.node^.cat OF
           NP   : s := reltree^.node^.ls^.NPfield^.specq ;
           NPVAR: s := reltree^.node^.ls^.NPVARfield^.specq ;
           CNVAR: s := yesspec;
         END;
       END
   END;
END {LSMRUQUO_assspecq};





 FUNCTION LSMRUQUO_UpToAmbiguity(T1,T2:LSSTREE_pSTREE)
                  :BOOLEAN ;
VAR result: BOOLEAN;
FUNCTION ujullieORhet(T:LSSTREE_pSTREE):BOOLEAN;
BEGIN
D 2
  IF T^.CAT NOT IN [NP,NPVAR] THEN ujullieORhet := false
E 2
I 2
  IF NOT (T^.CAT IN [NP,NPVAR]) THEN ujullieORhet := false
E 2
  ELSE BEGIN
    CASE T^.CAT OF
      NP: ujullieORhet := 
            (T^.ls^.NPfield^.person = 4)         OR
            (T^.ls^.NPfield^.NPhead = hetNP)     OR
            ((T^.ls^.NPfield^.person = 2)  AND
             (T^.ls^.NPfield^.number = plural)
            );                                    
      NPVAR: ujullieORhet := 
            (T^.ls^.NPVARfield^.person = 4)         OR
            (T^.ls^.NPVARfield^.NPhead = hetNP)     OR
            ((T^.ls^.NPVARfield^.person = 2)  AND
             (T^.ls^.NPVARfield^.number = plural)
            );                                    
    END {CASE};
  END
END{ujullieORhet};

BEGIN {LSMRUQUO_UpToAmbiguity}
D 2
   IF T1^.CAT NOT IN [NP,NPVAR] THEN LSMRUQUO_UpToAmbiguity:= true
E 2
I 2
   IF NOT (T1^.CAT IN [NP,NPVAR]) THEN LSMRUQUO_UpToAmbiguity:= true
E 2
   ELSE BEGIN
     result := T1^.CAT IN [NP,NPVAR];
     result := result AND (T2^.CAT =NPVAR);
     IF result THEN BEGIN
       CASE T1^.CAT OF
         NP: result := 
           (T1^.ls^.NPfield^.number <> T2^.ls^.NPVARfield^.number)        OR
           (T1^.ls^.NPfield^.NPhead = reducedpersproNP)                      OR
           ((T1^.ls^.NPfield^.cases * T2^.ls^.NPVARfield^.cases =[]) AND
            (NOT (ujullieORhet(T1) AND ujullieORhet(T2)))
           )                                                                  OR
           (((T1^.ls^.NPfield^.cases = [Nominative])        OR
             (T1^.ls^.NPfield^.cases = [Accusative])                    
            )                                                          AND
            ((NOT ujullieORhet(T1))                          AND
             (NOT ujullieORhet(T2)) 
            )
           );
         NPVAR: result := 
           (T1^.ls^.NPVARfield^.number <> T2^.ls^.NPVARfield^.number)        OR
           (T1^.ls^.NPVARfield^.NPhead = reducedpersproNP)                      OR
           ((T1^.ls^.NPVARfield^.cases * T2^.ls^.NPVARfield^.cases =[]) AND
            (NOT (ujullieORhet(T1) AND ujullieORhet(T2)))
           )                                                                  OR
           (((T1^.ls^.NPVARfield^.cases = [Nominative])        OR
             (T1^.ls^.NPVARfield^.cases = [Accusative])                    
            )                                                          AND
            ((NOT ujullieORhet(T1))                           AND
             (NOT ujullieORhet(T2)) 
            )
           );
       END {CASE};        
     END;  
   END;
   LSMRUQUO_UpToAmbiguity:= result;
END {LSMRUQUO_UpToAmbiguity};




 PROCEDURE LSMRUQUO_AssignCase(
                    NPrec1:LSDOMAINT_NPrecord;
                    mu1:LSMRUQUO_ListOfStrees;
                    VAR NPrec2:LSDOMAINT_NPrecord;
                    VAR mu2:LSMRUQUO_ListOfStrees;
                    casevalue:LSDOMAINT_CaseSetType);



FUNCTION TESTPERSPRO(mu1:LSMRUQUO_ListOfStrees;
                    VAR mu2:LSMRUQUO_ListofStrees)
                    : BOOLEAN;
{
perspro 
   IF    mu1 =  [ mu3, head/PERSPRO<PERSPROrec1>[mu4], mu5 ]
   THEN  mu2:= [ mu3, head/PERSPRO<PERSPROrec2>[mu4], mu5 ];
         PERSPROrec2 := PERSPROrec1;
	 PERSPROrec2.persprocases := c

}

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
  PERSPROrec2.persprocases:=casevalue;
  tree:=MAKET_stree(PERSPRO);
  tree^.ls^.PERSPROfield^:=PERSPROrec2;
  tree^.sons:=reltree^.node^.sons; {mu4}
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



FUNCTION TESTINDEFPRO(mu1:LSMRUQUO_ListOfStrees;
                      VAR mu2:LSMRUQUO_ListofStrees)
                      : BOOLEAN;

{
 INDEFPRO, genitive 
   THEN IF   mu1 = [ mu3, head/INDEFPRO<INDEFPROrec1>[mu4], mu5 ]
	THEN mu2 := [ mu3, head/INDEFPRO<INDEFPROrec2>[mu4], mu5 ];
             INDEFPROrec2 := INDEFPROrec1;
	     INDEFPROrec2.geni := true
}


VAR result:BOOLEAN;
    tree:LSSTREE_pstree;
    reltree:LSSTREE_prelnode;
    INDEFPROrec1,INDEFPROrec2:LSDOMAINT_INDEFPROrecord;
    mu3,mu5:LSMRUQUO_ListOfStrees;
BEGIN
MEM_markdefault(stackptr);
result:=false;
IF stillreltrees(mu1) THEN
  BEGIN
  initreltreelist(mu3);
  takereltree(reltree,mu1);
  result:= (reltree^.relation=head) AND (reltree^.node^.cat=INDEFPRO);
  IF result THEN INDEFPROrec1:=reltree^.node^.ls^.INDEFPROfield^
    ELSE appendreltree(reltree,mu3);
  WHILE stillreltrees(mu1) and NOT(result) DO
    BEGIN
    takereltree(reltree,mu1);
    result:= (reltree^.relation=head) AND (reltree^.node^.cat=INDEFPRO);
    IF result THEN INDEFPROrec1:=reltree^.node^.ls^.INDEFPROfield^
      ELSE appendreltree(reltree,mu3);
    END;
  END;
IF result THEN
  BEGIN
  mu5:=mu1;
  mu2:=mu3;
  INDEFPROrec2:=INDEFPROrec1;
  INDEFPROrec2.geni:= true;
  tree:=MAKET_stree(INDEFPRO);
  tree^.ls^.INDEFPROfield^:=INDEFPROrec2;
  tree^.sons:=reltree^.node^.sons; {mu4}
  tree^.li^.n := reltree^.node^.li^.n; 
  appendrelandtree(head,tree,mu2);
  appendlists(mu5,mu2);
  END ELSE MEM_releasedefault(stackptr);
TESTINDEFPRO:=result
END;

FUNCTION TESTPROPERNOUN(mu1:LSMRUQUO_ListOfStrees;
                        VAR mu2:LSMRUQUO_ListofStrees)
                       : BOOLEAN;
{
PROPERNOUN, genitive
	ELIF mu1 = [ mu3, head/PROPERNOUN<PROPERNOUNrec1>[mu4], mu5 ]
	THEN mu2 := [ mu3, head/PROPERNOUN<PROPERNOUNrec2>[mu4], mu5 ]
             PROPERNOUNrec2 := PROPERNOUNrec1;
	     PROPERNOUNrec2.geni := true

}


VAR result:BOOLEAN;
    tree:LSSTREE_pstree;
    reltree:LSSTREE_prelnode;
    PROPERNOUNrec1,PROPERNOUNrec2:LSDOMAINT_PROPERNOUNrecord;
    mu3,mu5:LSMRUQUO_ListOfStrees;
BEGIN
MEM_markdefault(stackptr);
result:=false;
IF stillreltrees(mu1) THEN
  BEGIN
  initreltreelist(mu3);
  takereltree(reltree,mu1);
  result:= (reltree^.relation=head) AND (reltree^.node^.cat=PROPERNOUN);
  IF result THEN PROPERNOUNrec1:=reltree^.node^.ls^.PROPERNOUNfield^
    ELSE appendreltree(reltree,mu3);
  WHILE stillreltrees(mu1) and NOT(result) DO
    BEGIN
    takereltree(reltree,mu1);
    result:= (reltree^.relation=head) AND (reltree^.node^.cat=PROPERNOUN);
    IF result THEN PROPERNOUNrec1:=reltree^.node^.ls^.PROPERNOUNfield^
      ELSE appendreltree(reltree,mu3);
    END;
  END;
IF result THEN
  BEGIN
  mu5:=mu1;
  mu2:=mu3;
  PROPERNOUNrec2:=PROPERNOUNrec1;
  PROPERNOUNrec2.geni:= true;
  tree:=MAKET_stree(PROPERNOUN);
  tree^.ls^.PROPERNOUNfield^:=PROPERNOUNrec2;
  tree^.sons:=reltree^.node^.sons; {mu4}
  tree^.li^.n := reltree^.node^.li^.n; 
  appendrelandtree(head,tree,mu2);
  appendlists(mu5,mu2);
  END ELSE MEM_releasedefault(stackptr);
TESTPROPERNOUN:=result
END;

FUNCTION TESTRECIPRO(mu1:LSMRUQUO_ListOfStrees;
                        VAR mu2:LSMRUQUO_ListofStrees)
                       : BOOLEAN;

{
RECIPRO, genitive 
	ELIF mu1 = [ mu3, head/RECIPRO<RECIPROrec1>, mu4 ]
	THEN mu2 := [ mu3, head/RECIPRO<RECIPROrec2>, mu4 ];
             RECIPROrec2 := RECIPROrec1;
	     RECIPROrec2.geni := true
}


VAR result:BOOLEAN;
    tree:LSSTREE_pstree;
    reltree:LSSTREE_prelnode;
    RECIPROrec1,RECIPROrec2:LSDOMAINT_RECIPROrecord;
    mu3,mu5:LSMRUQUO_ListOfStrees;
BEGIN
MEM_markdefault(stackptr);
result:=false;
IF stillreltrees(mu1) THEN
  BEGIN
  initreltreelist(mu3);
  takereltree(reltree,mu1);
  result:= (reltree^.relation=head) AND (reltree^.node^.cat=RECIPRO);
  IF result THEN RECIPROrec1:=reltree^.node^.ls^.RECIPROfield^
    ELSE appendreltree(reltree,mu3);
  WHILE stillreltrees(mu1) and NOT(result) DO
    BEGIN
    takereltree(reltree,mu1);
    result:= (reltree^.relation=head) AND (reltree^.node^.cat=RECIPRO);
    IF result THEN RECIPROrec1:=reltree^.node^.ls^.RECIPROfield^
      ELSE appendreltree(reltree,mu3);
    END;
  END;
IF result THEN
  BEGIN
  mu5:=mu1;
  mu2:=mu3;
  RECIPROrec2:=RECIPROrec1;
  RECIPROrec2.geni:= true;
  tree:=MAKET_stree(RECIPRO);
  tree^.ls^.RECIPROfield^:=RECIPROrec2;
  tree^.sons:=reltree^.node^.sons; {mu4}
  tree^.li^.n := reltree^.node^.li^.n; 
  appendrelandtree(head,tree,mu2);
  appendlists(mu5,mu2);
  END ELSE MEM_releasedefault(stackptr);
TESTRECIPRO:=result
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
		 head/CN<CNrec1>
		     [ mu4, 
		       head/NOUN<NOUNrec1>[mu7],
		       mu5
		     ],
		 mu6
	       ]
   THEN mu2 := [ mu3, 
		 head/CN<CNrec2>
		     [ mu4, 
		       head/NOUN<NOUNrec2>[mu7],
		       mu5
		     ],
		 mu6
	       ];
        CNrec2 := CNrec1;
	CNrec2.cases := [c];
	NOUNrec2 := NOUNrec1;
	NOUNrec2.geni := ( c = genitive )

}


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
      END; {END while cnsons}
    END {IF stillreltrees(cnsons)};

    IF result THEN
      BEGIN {final action}
      mu5:=cnsons;
      cn2sons:=mu4;
      NOUNrec2:=NOUNrec1;
      NOUNrec2.geni := (casevalue= [genitive]);
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
    IF NOT TESTMODNP(mu1, mu2) THEN
    IF NOT TESTCOORDNP(mu1,mu2) THEN
    IF (casevalue = [genitive]) THEN BEGIN
        IF NOT TESTINDEFPRO(mu1,mu2) THEN
        IF NOT TESTPROPERNOUN(mu1,mu2) THEN
        IF NOT TESTRECIPRO(mu1,mu2) THEN
      BEGIN
      mu2:=mu1;  (* This implies an error *)
      END
    END
    ELSE mu2 := mu1;
END {assigncase};





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
  I1: ((T1.CAT IN [ADVP,PREPP, NP, ADVPVAR, PREPPVAR, NPVAR]) AND
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
                      (reltree^.node^.cat IN [ADVP, PREPP,NP,
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
        NP: tempadvfound := 
               ((reltree^.node^.ls^.NPfield^.class = frequential) 
               );
        NPVAR: tempadvfound := 
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


 FUNCTION LSMRUQUO_hebbenorzijnfound(mu:LSMRUQUO_listofStrees)
                  :BOOLEAN;

{
    I1: (EXIST (mu, [I12: rel1/VERB<VERBrec2>[I13: mu5]])) OR
        (EXIST (mu, [auxrel/I11:: VERB<VERBrec1>[mu4]]))    

   I12: (rel1 IN [head, auxrel, progauxrel]) AND 
            (VERBrec2.status = AuxV) 
       I13: (EXIST (mu5, [auxrel/I14::VERB<VERBrec3>[mu6]]))
       I14: (VERBrec3.subc IN [hebbenaux, zijnaux])
    
       I11: (VERBrec1.status = bareV) AND
            (VERBrec1.subc IN [hebbenaux, zijnaux]) 

}



FUNCTION I11(v:LSDOMAINT_verbrecord):BOOLEAN;
BEGIN
 I11:= ( (v.status = bareV) AND
         (v.subc IN [hebbenaux, zijnaux]) 
       );
END {I11};



FUNCTION I12(rel:LSDOMAINT_synrel; v:LSDOMAINT_verbrecord):BOOLEAN;
BEGIN
  I12 := ((rel IN [head, auxrel, progauxrel]) AND 
          (v.status = AuxV) )
END {I12};

FUNCTION I14(v:LSDOMAINT_verbrecord):BOOLEAN;
BEGIN
 I14:= (v.subc IN [hebbenaux, zijnaux]);
END {I14};


FUNCTION I13(mu:LSMRUQUO_listofStrees):BOOLEAN;
VAR result:BOOLEAN;
    reltree:LSSTREE_prelnode;
    verbrec1:LSDOMAINT_verbrecord;
BEGIN {I13}
{ I13:= (EXIST (mu, [auxrel/I14::VERB<VERBrec3>[mu6]]))}

result:=false;
IF stillreltrees(mu) THEN
  BEGIN {still}
  takereltree(reltree,mu);
  result:= (reltree^.relation=auxrel) AND (reltree^.node^.cat=VERB);
  IF result THEN 
    BEGIN {result}
      verbrec1:=reltree^.node^.ls^.VERBfield^;
      result := I14(verbrec1);
    END {result};
  WHILE stillreltrees(mu) and NOT(result) DO
    BEGIN {while}
    takereltree(reltree,mu);
    result:= (reltree^.relation=auxrel) AND (reltree^.node^.cat=VERB);
    IF result THEN 
      BEGIN {while - result}
      verbrec1:=reltree^.node^.ls^.VERBfield^;
      result := I14(verbrec1);
      END {while - result};
    END; {while}
  END; {still}
I13 := result;
END {I13};

VAR mu5        :LSMRUQUO_listofStrees;
    result     :BOOLEAN;
    reltree    :LSSTREE_prelnode;
    rel1       :LSDOMAINT_synrel;
    verbrec1   :LSDOMAINT_verbrecord;

BEGIN{hebbenorzijnfound}
{
    I1: (EXIST (mu, [I12: rel1/VERB<VERBrec1>[I13: mu5]])) OR
        (EXIST (mu, [auxrel/I11:: VERB<VERBrec1>[mu4]]))    
}

result:=false;
IF stillreltrees(mu) THEN
  BEGIN {still}
  takereltree(reltree,mu);
  result:=  (reltree^.node^.cat=VERB);
  IF result THEN 
    BEGIN {result}
      rel1 := reltree^.relation;
      verbrec1:=reltree^.node^.ls^.VERBfield^;
      putsonsinmu(reltree^.node^.sons,mu5);
      result := ( I12(rel1,verbrec1) AND I13(mu5)     ) OR
                ( (rel1 = auxrel)    AND I11(verbrec1));
    END {result};
  WHILE stillreltrees(mu) and NOT(result) DO
    BEGIN {while}
    takereltree(reltree,mu);
    result:=  (reltree^.node^.cat=VERB);
    IF result THEN 
      BEGIN {while-result}
        rel1 := reltree^.relation;
        verbrec1:=reltree^.node^.ls^.VERBfield^;
        putsonsinmu(reltree^.node^.sons,mu5);
        result := ( I12(rel1,verbrec1) AND I13(mu5)     ) OR
                  ( (rel1 = auxrel)    AND I11(verbrec1));
      END {while -result};
    END; {while}
  END; {still}
LSMRUQUO_hebbenorzijnfound := result;
END{hebbenorzijnfound};





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






 FUNCTION LSMRUQUO_CheckAktarts(
                     classes:LSDOMAINT_classSETtype;
                     aktarts:LSDOMAINT_AktionsartEFFSETtype)
                     
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
   IF   (iterativeclass IN classes) 
   THEN aktarts := aktarts + [stative, activity];
END;




 PROCEDURE LSMRUQUO_AssignEform(
                    ADJPrec1:LSDOMAINT_ADJPrecord;
                    mu1:LSMRUQUO_ListOfStrees;
                    VAR ADJPrec2:LSDOMAINT_ADJPrecord;
                    VAR mu2:LSMRUQUO_ListOfStrees;
                    form:LSDOMAINT_eORenFormtype);
BEGIN
ADJPrec2 := ADJprec1;
ADJPrec2.eorenform := form;
mu2 := mu1;

{to be specified further}
END;


 PROCEDURE LSMRUQUO_init;


PROCEDURE initrelorder(VAR relarray: synrelarray);
VAR currel : LSDOMAINT_synrel;
BEGIN
  
  FOR currel := LSrel0 TO LSrel80 DO BEGIN
      relarray[currel] := 0
  END;

END {initsrelorder};


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
  sarray[hetclrel] := i; 
  i:= i+1;
  sarray[firstclrel ] := i; 
  i:= i+1;
  sarray[secondclrel ] := i; 
  i:= i+1;
 
  sarray[reflrel] := i; 
  sarray[erposrel] := i; 
  sarray[erqrel] := i; 
  sarray[agvpadvrel ] := i; 
  sarray[causadvrel] := i; 
  sarray[defRadvrel ] := i; 
  sarray[meltnegrel ] := i; 
  sarray[negrel] := i; 
  sarray[posrel] := i; 
  sarray[postsubjrel] := i; 
  sarray[subjvpadvrel] := i; 
  sarray[tempadvrel] := i; 
  sarray[sentadvrel] := i; 
  sarray[preadvrel] := i; 
 
  sarray[locadvrel] := i; 

  i:= i+1;
 
  sarray[predrel] := i; 

  i:= i+1;
  sarray[spostverbrel  ] := i; 
  i:= i+1;
D 2
  sarray[thanascomplrel] := i; 
  i:= i+1;
E 2
  sarray[extraposrel] := i; 
  i:= i+1;
I 2
  sarray[thanascomplrel] := i; 
  i:= i+1;
E 2
  sarray[relsentrel    ] := i; 
  i:= i+1;
  sarray[resultrel] := i; 
  i:= i+1;
  sarray[postsentadvrel ] := i; 
  sarray[posttemprel ] := i; 

 
  sarray[puncrel] := specrel; 
  sarray[gluerel] := specrel; 
END {initsrelorder};

PROCEDURE initVPrelorder(VAR vparray: synrelarray);
VAR i : INTEGER;
BEGIN
  initrelorder(vparray);

  i := 1;
  vparray[vpadvrel ] := i; 
  vparray[subjvpadvrel] := i; 
  vparray[instradvrel  ] := i; 
  vparray[agvpadvrel] := i; 
  vparray[byobjrel] := i; 
 

  i := i +1;
  vparray[argrel] := i; 

  i := i +1;
  vparray[indobjrel] := i; 
  vparray[aanobjrel] := i; 
  vparray[voorobjrel] := i; 

  i := i +1;
  vparray[objrel] := i; 

  i := i +1;
  vparray[complrel] := i; 
  vparray[dirargrel] := i; 
  vparray[locargrel] := i; 
  vparray[predrel] := i; 
  vparray[prepobjrel] := i; 

  i := i +1;
  vparray[strandedrel] := i; 

  i := i +1;
  vparray[partrel] := i; 

  i := i +1;
  vparray[head  ] := i; 

  i := i +1;
  vparray[progauxrel ] := i; 

  i := i +1;
  vparray[auxrel] := i; 

  i := i +1;
  vparray[postvporel ] := i; 

  i := i +1;
  vparray[postverbrel] := i; 

  vparray[gluerel] := specrel; 
  vparray[puncrel] := specrel; 
END {initvprelorder};

PROCEDURE initADJPrelorder(VAR adjparray: synrelarray);
VAR i : INTEGER;
BEGIN
  initrelorder(adjparray);

  (* linguistic content, specified by JO  18-FEB-1989 *)
  (* extension/revision by FJ; 20-JUL-1990 *)


  adjparray[puncrel] := specrel; 
  adjparray[gluerel] := specrel;

i:= 1;
adjparray[erposrel] := i; 

i := i+1;
adjparray[indobjrel] := i; 
adjparray[aanobjrel] := i; 

i := i+1;
adjparray[objrel] := i; 

i := i+1;
adjparray[tempadvrel] := i; 
adjparray[locadvrel] := i; 
adjparray[causadvrel] := i; 

i := i+1;
adjparray[negrel] := i; 


i := i+1;
adjparray[degreemodrel] := i; 


i := i+1;
adjparray[prepobjrel] := i; 
adjparray[locargrel] := i; 

i := i+1;
adjparray[complrel] := i; 

i := i+1;
adjparray[head] := i; 


i := i+1;
adjparray[hoprel] := i; 

i := i+1;
adjparray[voorobjrel] := i; 

i := i+1;
adjparray[paprepobjrel] := i; 

i := i+1;
adjparray[postadjrel] := i; 


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





 FUNCTION LSMRUQUO_Checkreduce
                    ( s:   LSDOMAINT_KINDSEFFSETTYPE;
                      r:   LSDOMAINT_KINDSTYPE
                    )
                    :BOOLEAN ;

VAR kr : LSDOMAINT_KINDSTYPE;
    res: LSDOMAINT_kindseffsettype;
BEGIN
res := [];
FOR kr := Xk TO  XPQk DO 
  BEGIN
  IF (r IN [Xk, Qk, Pk, Lk]) THEN
    BEGIN
    IF (kr IN s) THEN
      BEGIN
      IF ((kr <> r) AND
          (r IN toset(kr))
         )               THEN 
        BEGIN
        res := res + [tobase(toset(kr)-[r])]
        END
      END
    END
  END;
LSMRUQUO_Checkreduce := (res <> []);
END;


 FUNCTION LSMRUQUO_checkextend
                    ( s:   LSDOMAINT_KINDSEFFSETTYPE;
                      r:   LSDOMAINT_KINDSTYPE
                    )
                    :BOOLEAN ;

VAR kr : LSDOMAINT_KINDSTYPE;
    res: LSDOMAINT_kindseffsettype;
BEGIN
res := [];
FOR kr := Xk TO  XPQk DO 
  BEGIN
  IF (r IN [Xk, Qk, Pk, Lk]) THEN
    BEGIN
    IF (kr IN s) THEN
      BEGIN
      IF (kr <> r) THEN 
        BEGIN
        res := res + [tobase(toset(kr)+[r])]
        END
      END
    END
  END;
LSMRUQUO_checkextend := (res <> []);
END;




 PROCEDURE LSMRUQUO_extend
                    ( s:       LSDOMAINT_KINDSEFFSETTYPE;
                      VAR res: LSDOMAINT_KINDSEFFSETTYPE;
                      r:       LSDOMAINT_KINDSTYPE
                    );
VAR kr : LSDOMAINT_KINDSTYPE;
BEGIN
res := [];
FOR kr := Xk TO  XPQk DO 
  BEGIN
  IF (r IN [Xk, Qk, Pk, Lk]) THEN
    BEGIN
    IF (kr IN s) THEN
      BEGIN
      IF (kr <> r) THEN 
        BEGIN
        res := res + [tobase(toset(kr)+[r])]
        END
      END
    END
  END;

END;






 PROCEDURE LSMRUQUO_reduce
                    ( s:       LSDOMAINT_KINDSEFFSETTYPE;
                      VAR res: LSDOMAINT_KINDSEFFSETTYPE;
                      r:       LSDOMAINT_KINDSTYPE
                    );
VAR kr : LSDOMAINT_KINDSTYPE;
BEGIN
res := [];
FOR kr := Xk TO  XPQk DO 
  BEGIN
  IF (r IN [Xk, Qk, Pk, Lk]) THEN
    BEGIN
    IF (kr IN s) THEN
      BEGIN
      IF ((kr <> r) AND
          (r IN toset(kr))
         )                 THEN 
        BEGIN
        res := res + [tobase(toset(kr)-[r])]
        END
      END
    END
  END;

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


 FUNCTION LSMRUQUO_accmenzeintree(T:LSSTREE_pSTREE):BOOLEAN;
VAR accfound: BOOLEAN;

PROCEDURE TraverseStree(t:LSSTREE_pStree; VAR found:BOOLEAN);
FORWARD;

PROCEDURE TraverseRelTree(rt:LSSTREE_pRelNode; VAR found:BOOLEAN);
FORWARD;

PROCEDURE TraverseStree;
BEGIN

 IF (t^.cat=NP) THEN 
    BEGIN
      IF (t^.ls^.NPfield^.NPhead IN [menNP,zegenNP]) AND
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
  LSMRUQUO_accmenzeintree := accfound;
END {LSMRUQUO_acconetheyintree};



PROCEDURE LSMRUQUO_compNPattributes(COORD:LSDOMAINT_COORDrecord;
                           NP1,NP2: LSDOMAINT_NPrecord;
                           VAR NP3:LSDOMAINT_NPrecord);
BEGIN

  NP3.req := [pospol,negpol,omegapol];
  NP3.env := [pospol,negpol,omegapol];

  NP3.temporal := NP1.temporal AND NP2.temporal;
  IF   NP1.class = NP2.class
  THEN NP3.class := NP1.class
  ELSE NP3.class := omegatimeadvclass;

  IF   NP1.deixis = NP2.deixis
  THEN NP3.deixis := NP1.deixis
  ELSE NP3.deixis := omegadeixis;

  IF   NP1.aspect = NP2.aspect
  THEN NP3.aspect := NP1.aspect
  ELSE NP3.aspect := omegaaspect;

  NP3.retro := NP1.retro AND NP2.retro;

  IF   (NP1.definite=def)  OR (NP2.definite=def) 
  THEN NP3.definite:=def
  ELSE IF (NP1.definite=adef) OR (NP2.definite=adef) 
  THEN NP3.definite := adef
  ELSE NP3.definite := NP1.definite;
  
  IF   (NP1.person = 1) OR (NP2.person=1)
  THEN NP3.person :=1
  ELSE IF (NP1.person IN [2,4,5]) OR (NP2.person IN [2,4,5])
  THEN NP3.person := 2
  ELSE NP3.person := 3;

  IF (NP1.number = plural) OR (NP2.number=plural)  THEN NP3.number := plural
(*ELSE IF Negated                                  THEN NP3.number := singular *)
  ELSE IF (NP1.NPhead IN [ditNP, datNP]) AND
          (NP1.NPhead IN [ditNP, datNP])           THEN NP3.number := singular
  ELSE IF (mass IN NP1.actcomas) AND
          (mass In NP2.actcomas) AND 
          (NP1.definite = indef) AND
          (NP2.definite = indef)                   THEN NP3.number := singular
  ELSE IF ((count IN NP1.actcomas) OR
           (count IN NP2.actcomas)         
          )                                AND  
          (NP1.definite = indef)           AND
          (NP2.definite = indef)                   THEN NP3.number := plural{+}
(*ELSE IF iederenzo(b)                             THEN NP3.number := singular*)
  ELSE IF ((count IN NP1.actcomas) OR
           (count IN NP2.actcomas)         
          )                                AND
          (NP1.definite = def)             AND
          (plural IN COORD.inducednumbers)         THEN NP3.number := plural
  ELSE IF ((count IN NP1.actcomas) OR
           (count IN NP2.actcomas)         
          )                                AND
          (NP1.definite = def)             AND
          (singular IN COORD.inducednumbers)       THEN NP3.number := singular
  ELSE IF ((mass IN NP1.actcomas) OR
           (mass IN NP2.actcomas)          
          )                                AND
          (NP1.definite = def)             AND
          (singular IN COORD.inducednumbers)       THEN NP3.number := singular
  ELSE IF ((mass IN NP1.actcomas) OR
           (mass IN NP2.actcomas)          
          )                                AND
          (NP1.definite = def)             AND
          (plural IN COORD.inducednumbers)         THEN NP3.number := plural

(*  ELSE IF **indefpro                               *)
  ELSE IF COORD.inducednumbers=[singular]          THEN NP3.number := singular
  ELSE IF true                                     THEN NP3.number := plural;


  NP3.genders := [];

  NP3.sexes := [];
  NP3.actsubcs := [];

  NP3.possgeni := NP1.possgeni AND NP2.possgeni;

  IF   (NP1.animate = NP2.animate)
  THEN NP3.animate := NP1.animate
  ELSE NP3.animate := noanimate;

  IF   (NP1.human = NP2.human)
  THEN NP3.human := NP1.human
  ELSE NP3.human := nohuman;

  IF    NP1.actcomas * NP2.actcomas <> []
  THEN  NP3.actcomas :=  NP1.actcomas * NP2.actcomas
  ELSE  NP3.actcomas := [];

  NP3.thetanp := omegathetanp;
  NP3.nounpatternefs := [];

  NP3.posspred := NP1.posspred AND NP2.posspred;
  NP3.possnietnp := NP1.possnietnp AND NP2.possnietnp;
  IF NP1.mood=NP2.mood
  THEN NP3.mood := NP1.mood
  ELSE NP3.mood := declxpmood;

  NP3.possRform := false;
  NP3.syntquant := omegaquant;

  NP3.NPhead := otherNP;
  
  IF   NP1.specq=NP2.specq
  THEN NP3.specq := NP1.specq
  ELSE NP3.specq := nospec;


END {CompNPattributes};



FUNCTION LSMRUQUO_cfNpattributes(COORD:LSDOMAINT_COORDrecord;
                         NP1,NP2,NP3:LSDOMAINT_NPrecord):BOOLEAN;
VAR ok,numberok:BOOLEAN;
BEGIN
  ok := true;
  ok := NP3.req=[pospol,negpol,omegapol];
  ok := NP3.env=[pospol,negpol,omegapol];
  ok := NP3.temporal=(NP1.temporal AND NP2.temporal);
  ok := ((NP1.class = NP2.class) AND (NP3.class=NP1.class)) OR
        ((NP1.class <> NP2.class) AND (NP3.class=omegatimeadvclass));
  IF ok THEN ok:= 
        ((NP1.deixis = NP2.deixis) AND (NP3.deixis=NP1.deixis)) OR
        ((NP1.deixis <> NP2.deixis) AND (NP3.deixis=omegadeixis));
  IF ok THEN ok :=
        ((NP1.aspect = NP2.aspect) AND (NP3.aspect=NP1.aspect)) OR
        ((NP1.aspect <> NP2.aspect) AND (NP3.aspect=omegaaspect));
  IF ok THEN ok := (NP3.retro=(Np1.retro AND NP2.retro));
  IF ok THEN ok :=
     (((NP1.definite=def ) OR (NP2.definite=def )) AND (NP3.definite=def )) OR
     (((NP1.definite=adef) OR (NP2.definite=adef)) AND (NP3.definite=adef)) OR
     ((NP3.definite=NP1.definite) AND (NP1.definite=NP2.definite) AND 
      (NP3.definite=indef)
     );
  IF ok THEN ok :=
     ((NP3.person=1) AND ((NP1.person=1) OR (NP2.person=1))            ) OR
     ((NP3.person=2) AND (NP1.person<>1) AND (NP2.person<>1) AND
      ((NP1.person IN [2,4,5]) OR (NP2.person IN [2,4,5]))
     )                                                                   OR
     ((NP3.person=3) AND (NP1.person=3) AND (NP2.person=3) );
 
{BEGIN NUMBER}
  IF (NP1.number = plural) OR (NP2.number=plural)  
       THEN numberok:=(NP3.number = plural)
(*ELSE IF Negated                                  
       THEN numberok:=(NP3.number = singular) *)
  ELSE IF (NP1.NPhead IN [ditNP, datNP]) AND
          (NP1.NPhead IN [ditNP, datNP])           
       THEN numberok := (NP3.number = singular)
  ELSE IF (mass IN NP1.actcomas) AND
          (mass In NP2.actcomas) AND 
          (NP1.definite = indef) AND
          (NP2.definite = indef)                   
       THEN numberok:=(NP3.number = singular)
  ELSE IF ((count IN NP1.actcomas) OR
           (count IN NP2.actcomas)         
          )                                AND  
          (NP1.definite = indef)           AND
          (NP2.definite = indef)
       THEN numberok := (NP3.number = plural){+}
(*ELSE IF iederenzo(b)              
       THEN numberok := (NP3.number := singular)*)
  ELSE IF ((count IN NP1.actcomas) OR
           (count IN NP2.actcomas)         
          )                                AND
          (NP1.definite = def)             AND
          (plural IN COORD.inducednumbers)         
       THEN numberok := (NP3.number = plural)
  ELSE IF ((count IN NP1.actcomas) OR
           (count IN NP2.actcomas)         
          )                                AND
          (NP1.definite = def)             AND
          (singular IN COORD.inducednumbers)       
       THEN numberok := (NP3.number = singular)
  ELSE IF ((mass IN NP1.actcomas) OR
           (mass IN NP2.actcomas)          
          )                                AND
          (NP1.definite = def)             AND
          (singular IN COORD.inducednumbers)       
       THEN numberok := (NP3.number = singular)
  ELSE IF ((mass IN NP1.actcomas) OR
           (mass IN NP2.actcomas)          
          )                                AND
          (NP1.definite = def)             AND
          (plural IN COORD.inducednumbers)         
       THEN numberok:=(NP3.number = plural)

(*  ELSE IF **indefpro                               *)
  ELSE IF COORD.inducednumbers=[singular]          
       THEN numberok := (NP3.number = singular)
  ELSE IF true
       THEN numberok := (NP3.number = plural);

{END NUMBER}
  IF ok THEN ok := ok AND numberok;

  IF ok THEN ok := (NP3.genders=[]);
  IF ok THEN ok := (NP3.sexes = []) AND (NP3.actsubcs=[]);
  IF ok THEN ok := (NP3.possgeni=NP1.possgeni AND NP2.possgeni);


  IF ok THEN ok :=
     ((NP3.animate=NP1.animate) AND (NP1.animate=NP2.animate)) OR         
     (NP3.animate=noanimate);

  IF ok THEN ok :=
     ((NP3.human=NP1.human) AND (NP1.human=NP2.human)) OR         
     (NP3.human=nohuman);
  
  IF ok THEN ok :=
     ((NP3.actcomas <= NP1.actcomas * NP2.actcomas) AND
      (NP1.actcomas * NP2.actcomas <>[])
     )                                                     OR
     ((NP3.actcomas=[]) AND
      (NP1.actcomas * NP2.actcomas = [])
     );

  IF ok THEN ok := (NP3.thetanp=omegathetanp) AND (NP3.nounpatternefs=[]);

  IF ok THEN ok := (NP3.posspred = (NP1.posspred AND NP2.posspred));
  IF ok THEN ok := (NP3.possnietnp = (NP1.possnietnp AND NP2.possnietnp));
  
  IF ok THEN ok :=
     ((NP3.mood=NP1.mood  ) AND (NP1.mood=NP2.mood )) OR
     ((NP3.mood=declxpmood) AND (NP1.mood<>NP2.mood));

  IF ok THEN ok := (NP3.possRform=false) AND (NP3.syntquant=omegaquant) AND
                   (NP3.NPhead=otherNP);

  IF ok THEN ok :=
     ((NP3.specq=NP1.specq  ) AND (NP1.specq=NP2.specq )) OR
     ((NP3.specq=nospec) AND (NP1.specq<>NP2.specq));


  LSMRUQUO_cfNPattributes:=ok;  
END {cfNPattributes};


FUNCTION LSMRUQUO_coordpatternsok(cp: LSDOMAINT_coordpatternsettype;
                                            srec: LSDOMAINT_SENTENCErecord)
                                           :BOOLEAN;
VAR cpvar:LSDOMAINT_coordpatternsettype;
BEGIN
  cpvar := cp;
  IF   srec.senttype = mainclause 
  THEN cpvar := cpvar * [Smdc,Smync,Smwhc, Simpc, Slaten ];
  IF   srec.senttype = subordinateclause 
  THEN cpvar := cpvar * [Ssdc,Ssync,Sswhc,
                         Simpc, Srelfinc, Somtec, Sotec, Sctec,Sprpc, Spapc,
                         Scond];
  IF srec.mood = declarative 
  THEN cpvar := cpvar * [Smdc,Ssdc, Somtec, Sotec, Sctec,Sprpc, Spapc ];
  IF   srec.mood = yesnointerrogative 
  THEN cpvar := cpvar * [Smync,Ssync];
  IF   srec.mood = whinterrogative 
  THEN cpvar := cpvar * [Smwhc,Sswhc];
  IF   srec.mood = conditional 
  THEN cpvar := cpvar * [Scond];
  IF   srec.mood = latenmood 
  THEN cpvar := cpvar * [Slaten];
  IF   srec.mood = relative 
  THEN cpvar := cpvar * [Srelfinc];
  IF   srec.modus = prespart 
  THEN cpvar := cpvar * [Sprpc];
  IF   srec.modus = pastpart 
  THEN cpvar := cpvar * [Spapc];
  IF   srec.infsort IN [teinf,omteinf] 
  THEN cpvar := cpvar * [Somtec,Sotec,Sctec];
  IF   srec.infsort IN [omteinf] 
  THEN cpvar := cpvar * [Somtec];
  IF   srec.prosubject = TRUE 
  THEN cpvar := cpvar * [Somtec,Sotec, Sprpc,Spapc];
  IF   srec.prosubject = FALSE 
  THEN cpvar := cpvar * [Smdc,Smync,Smwhc, Ssdc,Ssync,Sswhc,
                         Simpc, Srelfinc, Sctec,Sprpc, Spapc, Scond, Slaten ];
  LSMRUQUO_coordpatternsok:= (cpvar <> []);
END {LSMRUQUO_coordpatternsok};


I 2
PROCEDURE LSMRUQUO_adaptvps(th: LSDOMAINT_thetavptype;
                           var vps:LSDOMAINT_synpatterneffsettype);
E 2

I 2
BEGIN
   IF (NOT (th IN [vp010, vp012])) OR
      (vps - LSAUXDOM_Raisingvps <> [])
   THEN vps := vps-LSAUXDOM_Raisingvps
END {LSMRUQUO_adaptvps};
E 2


E 1
