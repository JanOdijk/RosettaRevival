EXPORT(commrules);
pragma C_include('globsubst.pf');
pragma C_include('listree.pf');
pragma C_include('limatches.pf');
pragma C_include('lsmatches.pf');
pragma C_include('lidomaint.pf');
pragma C_include('liiddict.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('maket.pf');
pragma C_include('lsstree.pf');
pragma C_include('copyt.pf');
pragma C_include('string.pf');
pragma C_include('mem.pf');
pragma C_include('gidderiv.pf');
pragma C_include('hyperdtree.pf');
pragma C_include('strtokey.pf');
pragma C_include('lsmruquo.pf');
pragma C_include('lsauxdom.pf');
pragma C_include('ldblex.pf');
PACKAGE comMrules;
WITH listree,lsdomaint;
pragma C_include('commrules109.pf');
END;
PROGRAM comMrules109;
WITH globsubst,listree,limatches,lsmatches,
lidomaint,liiddict,lsdomaint,maket,lsstree,
copyt,mem,
gidderiv,hyperdtree,strtokey,lsmruquo,
lsauxdom,ldblex;
TYPE synrelset=SET OF LSDOMAINT_synrel;
VAR hulpstree:LISTREE_pstree;
 VPID:LSDOMAINT_synpatternsettype;
hulplsstree:LSSTREE_pstree;
 PROCEDURE commrules109_init;
BEGIN
END;
{rule:}
{:RCNMODADVP1}
 FUNCTION COMRCNMODADVP1(LEVEL:INTEGER;
Is1:LISTREE_pStree;Is2:LISTREE_pStree
):LISTREE_SetOfStrees;
VAR result:LISTREE_SetOfStrees;
 wbonus,sbonus:INTEGER;
 m:LSSTREE_pstree;
 Is:LISTREE_pstree;
 setofstrees:LISTREE_setofstrees;
 first:BOOLEAN;
 match:BOOLEAN;
 idargs:LIIDDICT_idargs;
dtree:HYPERDTREE_phyperdtree;
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
LinitM1_1,LrestM1_1,LfirstM1_1,LlastM1_1:LSSTREE_prelnode;
iM1_1:INTEGER;
nomoretreesM1_1,lastmatchM1_1:BOOLEAN;
LinitM1_2,LrestM1_2,LfirstM1_2,LlastM1_2:LSSTREE_prelnode;
iM1_2:INTEGER;
nomoretreesM1_2,lastmatchM1_2:BOOLEAN;
LinitM1_2_1,LrestM1_2_1,LfirstM1_2_1,LlastM1_2_1:LSSTREE_prelnode;
iM1_2_1:INTEGER;
nomoretreesM1_2_1,lastmatchM1_2_1:BOOLEAN;
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
LinitM2_1,LrestM2_1,LfirstM2_1,LlastM2_1:LSSTREE_prelnode;
iM2_1:INTEGER;
nomoretreesM2_1,lastmatchM2_1:BOOLEAN;
LinitM2_2,LrestM2_2,LfirstM2_2,LlastM2_2:LSSTREE_prelnode;
iM2_2:INTEGER;
nomoretreesM2_2,lastmatchM2_2:BOOLEAN;
LinitM2_2_1,LrestM2_2_1,LfirstM2_2_1,LlastM2_2_1:LSSTREE_prelnode;
iM2_2_1:INTEGER;
nomoretreesM2_2_1,lastmatchM2_2_1:BOOLEAN;
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
N1:LSDOMAINT_lsrecord;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU9:LSMRUQUO_ListOfStrees;
SENTENCEREC1:LSDOMAINT_SENTENCErecord;
ADVPREC1:LSDOMAINT_ADVPrecord;
CNVARREC1:LSDOMAINT_CNVARrecord;
OPENADVPPROPREC1:LSDOMAINT_ADVPPROPrecord;
CNREC1:LSDOMAINT_CNrecord;
CNREC2:LSDOMAINT_CNrecord;
FUNCTION matchcondI3:BOOLEAN;
FUNCTION EXIST1(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
Linit_1,Lrest_1,Lfirst_1,Llast_1:LSSTREE_prelnode;
i_1:INTEGER;
nomoretrees_1,lastmatch_1:BOOLEAN;
Linit_1_1,Lrest_1_1,Lfirst_1_1,Llast_1_1:LSSTREE_prelnode;
i_1_1:INTEGER;
nomoretrees_1_1,lastmatch_1_1:BOOLEAN;
      Lfinal:LSSTREE_prelnode;
match:Boolean;
PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR
  itemmatch,listmatch:Boolean;
  PROCEDURE Match_POSTMODREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>SENTENCE THEN
        match:=FALSE;
      IF match THEN
        SENTENCEREC1:=s^.ls^.SENTENCEfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      PROCEDURE Match_MU9(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU9.first:=Lfirst;
          MU9.last:=Llast;
          match:=TRUE;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU9(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU9(NIL,NIL,TRUE,match) ELSE BEGIN
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU9(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
      LSMATCHES_matchtree0rels(Lfirst,Llast,first,POSTMODREL
,match,matchnode,matchlist1items,lastmatch_1) END;
                                                      BEGIN {MatchList1Items}
  match:=FALSE;
  IF first THEN
    BEGIN 
  nomoretrees_1:=False;
    Lfirst_1:=NIL;
    SelectLfirstAndLlast(Lfirst_1,Llast_1,Lrest_1
,nomoretrees_1,L);
    IF Llast_1=Lfinal THEN Lrest_1:=NIL;
    IF NOT nomoretrees_1 THEN
      BEGIN
      Match_POSTMODREL(Lfirst_1,Llast_1,TRUE,itemmatch);
      match:=itemmatch;
END
    END
  ELSE
  BEGIN
IF Llast_1=Lfinal THEN Lrest_1:=NIL;
    Match_POSTMODREL(Lfirst_1,Llast_1,FALSE,match);
    END;
END;{MatchList1Items}
                                                        BEGIN{Exist1}
    next:=mu.first;match:=False;Lfinal:=mu.last;
    IF next =NIL THEN
      EXIST1:=False
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND NOT(match) DO
      BEGIN
        matchlist1items(next,TRUE,match);
        next:=next^.brother;
      END;
      IF match = False THEN
        matchlist1items(next,TRUE,match);
      EXIST1:=match;
    END;
  END;{Exist}
                                                      BEGIN
matchcondI3:=FALSE;
  IF
((NOT Exist1(MU3)                                       )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
((((ADVPREC1.ACTSUBCEFS *[VPADV,
LOCADV,
DIRADV,
CAUSADV,
OTHERADV]                                             <>[]                                                    )
                                                      )
                                                      )
                                                      )
THEN IF
          ((ADVPREC1.MOOD =DECLXPMOOD                             )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
((N1.CAT IN [NOUN,
EN]                                                   )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

END;{matchcondI1}
                                                      PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>CN THEN
      match:=FALSE;
    IF match THEN
      CNREC1:=s^.ls^.CNfield^;
  END{MatchNode};
                                                      PROCEDURE MatchList3Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    PROCEDURE Match_MU1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU1.first:=Lfirst;
        MU1.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU1(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        N1:= s^.ls^;match:=TRUE;
            END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        PROCEDURE Match_MU2(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU2.first:=Lfirst;
            MU2.last:=Llast;
            match:=TRUE;
          END
          ELSE match:=FALSE
        END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU2(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU2(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM1_2_1:=L;WHILE LlastM1_2_1^.brother<>NIL DO
LlastM1_2_1:=LlastM1_2_1^.brother;
match_MU2(L,LlastM1_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeCon0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM1_2,matchcondI1) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_MU3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU3.first:=Lfirst;
        MU3.last:=Llast;
        match:= matchcondI3;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU3(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,HEAD,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) ELSE match_HEAD(LfirstM1_2,LfirstM1_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  lirel2:LIDOMAINT_synrel;
  lsrel2:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>OPENADVPPROP THEN
      match:=FALSE;
    IF match THEN
      OPENADVPPROPREC1:=s^.ls^.OPENADVPPROPfield^;
  END{MatchNode};
                                                        PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR
    itemmatch,listmatch:Boolean;
    PROCEDURE Match_SUBJREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>CNVAR THEN
          match:=FALSE;
        IF match THEN
          CNVARREC1:=s^.ls^.CNVARfield^;
      END{MatchNode};
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,SUBJREL
,match,matchnode,matchlist0items,lastmatchM2_1) END;
                                                          PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
    PROCEDURE Match_PREDREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>ADVP THEN
          match:=FALSE;
        IF match THEN
          ADVPREC1:=s^.ls^.ADVPfield^;
        IF match THEN
          match:= matchcondI2;
      END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        PROCEDURE Match_MU4(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU4.first:=Lfirst;
            MU4.last:=Llast;
            match:=TRUE;
          END
          ELSE match:=FALSE
        END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU4(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU4(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM2_2_1:=L;WHILE LlastM2_2_1^.brother<>NIL DO
LlastM2_2_1:=LlastM2_2_1^.brother;
match_MU4(L,LlastM2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM2_2) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist0items,
LlastM2_2,LfirstM2_2,LrestM2_2,nomoretreesM2_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_SUBJREL,matchlist1items,
LlastM2_1,LfirstM2_1,LrestM2_1,nomoretreesM2_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=2) AND (s^.li^.n <=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,SUBJREL,PREDREL,match,matchnode,matchlist2items,lastmatch) END;
                                                      PROCEDURE createM;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CN;
    N^.ls^.CNfield^ := CNREC2;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU1(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU1}
    copylist(MU1,list);
    END{MU1};
                                                        BEGIN{createitem11}
  createMU1(list);
  END;
  PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^:=N1;
      END;{CreateNode}
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      VAR list:LSMRUQUO_ListOfStrees;
      PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU2}
        copylist(MU2,list);
        END{MU2};
                                                            BEGIN{createitem11}
      createMU2(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem11);
      END{createlist1};
                                                          BEGIN{HEAD}
    LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
    list.first:=relnode;
    list.last:=relnode;
    relnode^.relation:=HEAD;
    s:=MAKET_stree(N1.cat);
    createnode(s);
    createlist1(list1);
    IF (list1.first<>NIL) THEN list1.last^.brother:=NIL;
    s^.li^.n:=numberofelements(list1);
    s^.sons:=list1.first;
    relnode^.node:=s;
    END{HEAD};
                                                        BEGIN{createitem12}
  createHEAD(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU3(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU3}
    copylist(MU3,list);
    END{MU3};
                                                        BEGIN{createitem13}
  createMU3(list);
  END;
  PROCEDURE createitem14(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createPOSTMODREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := ADVP;
        N^.ls^.ADVPfield^ := ADVPREC1;
      END{CreateNode};
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      VAR list:LSMRUQUO_ListOfStrees;
      PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU4(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU4}
        copylist(MU4,list);
        END{MU4};
                                                            BEGIN{createitem11}
      createMU4(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem11);
      END{createlist1};
                                                          BEGIN{POSTMODREL}
LSMATCHES_createitem(list,POSTMODREL,ADVP,createnode,createlist1);
    END{POSTMODREL};
                                                        BEGIN{createitem14}
  createPOSTMODREL(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist4items0101(wholelist,createitem11,createitem12,createitem13,createitem14);
  END{createlist1};
                                                      BEGIN{createM}
m:=MAKET_stree(CN);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION3;
BEGIN
CNREC2:=CNREC1;                                       ;
CNREC2.POSSGENI:=FALSE
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
ADVPREC1loc:LSDOMAINT_ADVPPROPrecord;
BEGIN
ADVPREC1loc:=COPYT_ADVPTOPROP(ADVPREC1);
result:=TRUE
AND
(OPENADVPPROPREC1.req=ADVPREC1loc.req)AND
(OPENADVPPROPREC1.env=ADVPREC1loc.env)AND
(OPENADVPPROPREC1.class=ADVPREC1loc.class)AND
(OPENADVPPROPREC1.deixis=ADVPREC1loc.deixis)AND
(OPENADVPPROPREC1.aspect=ADVPREC1loc.aspect)AND
(OPENADVPPROPREC1.retro=ADVPREC1loc.retro)AND
(OPENADVPPROPREC1.actsubcefs=ADVPREC1loc.actsubcefs)AND
(OPENADVPPROPREC1.Qstatus=ADVPREC1loc.Qstatus)AND
(OPENADVPPROPREC1.thetaadv=ADVPREC1loc.thetaadv)AND
(OPENADVPPROPREC1.advpatternefs=ADVPREC1loc.advpatternefs)AND
(OPENADVPPROPREC1.mood=ADVPREC1loc.mood)AND
(OPENADVPPROPREC1.temporal=ADVPREC1loc.temporal)AND
(OPENADVPPROPREC1.Radvb=ADVPREC1loc.Radvb)AND
(OPENADVPPROPREC1.thanascompl=ADVPREC1loc.thanascompl)
;except1:=result
END;
                                                      FUNCTION except2:BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result:=COPYX_CNTOVAR(
CNVARREC1,CNREC1);

;except2:=result
END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
m2:=loopholes.retype(Is2,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
  BEGIN
    MatchModel2(m2,TRUE,match);
    If match Then
    BEGIN
 END;
IF match THEN
  BEGIN
  IF ((((except1                                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((OPENADVPPROPREC1.ACTSUBCEFS =ADVPREC1.ACTSUBCEFS      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((OPENADVPPROPREC1.PROSUBJECT =TRUE                     )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((OPENADVPPROPREC1.AKTIONSARTS =[STATIVE]                                             )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((OPENADVPPROPREC1.SUPERDEIXIS =CNREC1.SUPERDEIXIS      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((except2                                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((CNVARREC1.INDEX =level                                )
                                                      )
                                                      )
                                                      )
                                                       THEN
    BEGIN
    MAKET_CNrec(CNREC2);
    action3;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                          END;
COMRCNMODADVP1:=result
END;
{:RCNMODADVP1}
{rule:}
{:RCNMODADVP2}
 FUNCTION COMRCNMODADVP2(Is1:LISTREE_pStree;Is2:LISTREE_pStree
):LISTREE_SetOfStrees;
VAR result:LISTREE_SetOfStrees;
 wbonus,sbonus:INTEGER;
 m:LSSTREE_pstree;
 Is:LISTREE_pstree;
 setofstrees:LISTREE_setofstrees;
 first:BOOLEAN;
 match:BOOLEAN;
 idargs:LIIDDICT_idargs;
dtree:HYPERDTREE_phyperdtree;
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
LinitM1_1,LrestM1_1,LfirstM1_1,LlastM1_1:LSSTREE_prelnode;
iM1_1:INTEGER;
nomoretreesM1_1,lastmatchM1_1:BOOLEAN;
LinitM1_2,LrestM1_2,LfirstM1_2,LlastM1_2:LSSTREE_prelnode;
iM1_2:INTEGER;
nomoretreesM1_2,lastmatchM1_2:BOOLEAN;
LinitM1_2_1,LrestM1_2_1,LfirstM1_2_1,LlastM1_2_1:LSSTREE_prelnode;
iM1_2_1:INTEGER;
nomoretreesM1_2_1,lastmatchM1_2_1:BOOLEAN;
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
LinitM2_1,LrestM2_1,LfirstM2_1,LlastM2_1:LSSTREE_prelnode;
iM2_1:INTEGER;
nomoretreesM2_1,lastmatchM2_1:BOOLEAN;
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
N1:LSDOMAINT_lsrecord;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU9:LSMRUQUO_ListOfStrees;
SENTENCEREC1:LSDOMAINT_SENTENCErecord;
ADVPREC1:LSDOMAINT_ADVPrecord;
CNREC1:LSDOMAINT_CNrecord;
CNREC2:LSDOMAINT_CNrecord;
FUNCTION matchcondI3:BOOLEAN;
FUNCTION EXIST1(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
Linit_1,Lrest_1,Lfirst_1,Llast_1:LSSTREE_prelnode;
i_1:INTEGER;
nomoretrees_1,lastmatch_1:BOOLEAN;
Linit_1_1,Lrest_1_1,Lfirst_1_1,Llast_1_1:LSSTREE_prelnode;
i_1_1:INTEGER;
nomoretrees_1_1,lastmatch_1_1:BOOLEAN;
      Lfinal:LSSTREE_prelnode;
match:Boolean;
PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR
  itemmatch,listmatch:Boolean;
  PROCEDURE Match_POSTMODREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>SENTENCE THEN
        match:=FALSE;
      IF match THEN
        SENTENCEREC1:=s^.ls^.SENTENCEfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      PROCEDURE Match_MU9(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU9.first:=Lfirst;
          MU9.last:=Llast;
          match:=TRUE;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU9(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU9(NIL,NIL,TRUE,match) ELSE BEGIN
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU9(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
      LSMATCHES_matchtree0rels(Lfirst,Llast,first,POSTMODREL
,match,matchnode,matchlist1items,lastmatch_1) END;
                                                      BEGIN {MatchList1Items}
  match:=FALSE;
  IF first THEN
    BEGIN 
  nomoretrees_1:=False;
    Lfirst_1:=NIL;
    SelectLfirstAndLlast(Lfirst_1,Llast_1,Lrest_1
,nomoretrees_1,L);
    IF Llast_1=Lfinal THEN Lrest_1:=NIL;
    IF NOT nomoretrees_1 THEN
      BEGIN
      Match_POSTMODREL(Lfirst_1,Llast_1,TRUE,itemmatch);
      match:=itemmatch;
END
    END
  ELSE
  BEGIN
IF Llast_1=Lfinal THEN Lrest_1:=NIL;
    Match_POSTMODREL(Lfirst_1,Llast_1,FALSE,match);
    END;
END;{MatchList1Items}
                                                        BEGIN{Exist1}
    next:=mu.first;match:=False;Lfinal:=mu.last;
    IF next =NIL THEN
      EXIST1:=False
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND NOT(match) DO
      BEGIN
        matchlist1items(next,TRUE,match);
        next:=next^.brother;
      END;
      IF match = False THEN
        matchlist1items(next,TRUE,match);
      EXIST1:=match;
    END;
  END;{Exist}
                                                      BEGIN
matchcondI3:=FALSE;
  IF
((NOT Exist1(MU3)                                       )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
((TEMPADV IN ADVPREC1.ACTSUBCEFS                        )
                                                      )
THEN IF
          ((ADVPREC1.MOOD =DECLXPMOOD                             )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
((N1.CAT IN [NOUN,
EN]                                                   )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

END;{matchcondI1}
                                                      PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>CN THEN
      match:=FALSE;
    IF match THEN
      CNREC1:=s^.ls^.CNfield^;
  END{MatchNode};
                                                      PROCEDURE MatchList3Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    PROCEDURE Match_MU1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU1.first:=Lfirst;
        MU1.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU1(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        N1:= s^.ls^;match:=TRUE;
            END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        PROCEDURE Match_MU2(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU2.first:=Lfirst;
            MU2.last:=Llast;
            match:=TRUE;
          END
          ELSE match:=FALSE
        END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU2(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU2(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM1_2_1:=L;WHILE LlastM1_2_1^.brother<>NIL DO
LlastM1_2_1:=LlastM1_2_1^.brother;
match_MU2(L,LlastM1_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeCon0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM1_2,matchcondI1) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_MU3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU3.first:=Lfirst;
        MU3.last:=Llast;
        match:= matchcondI3;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU3(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,HEAD,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) ELSE match_HEAD(LfirstM1_2,LfirstM1_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>ADVP THEN
      match:=FALSE;
    IF match THEN
      ADVPREC1:=s^.ls^.ADVPfield^;
    IF match THEN
      match:= matchcondI2;
  END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    PROCEDURE Match_MU4(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU4.first:=Lfirst;
        MU4.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU4(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU4(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM2_1:=L;WHILE LlastM2_1^.brother<>NIL DO
LlastM2_1:=LlastM2_1^.brother;
match_MU4(L,LlastM2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist1items,lastmatch) END;
                                                      PROCEDURE createM;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CN;
    N^.ls^.CNfield^ := CNREC2;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU1(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU1}
    copylist(MU1,list);
    END{MU1};
                                                        BEGIN{createitem11}
  createMU1(list);
  END;
  PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^:=N1;
      END;{CreateNode}
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      VAR list:LSMRUQUO_ListOfStrees;
      PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU2}
        copylist(MU2,list);
        END{MU2};
                                                            BEGIN{createitem11}
      createMU2(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem11);
      END{createlist1};
                                                          BEGIN{HEAD}
    LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
    list.first:=relnode;
    list.last:=relnode;
    relnode^.relation:=HEAD;
    s:=MAKET_stree(N1.cat);
    createnode(s);
    createlist1(list1);
    IF (list1.first<>NIL) THEN list1.last^.brother:=NIL;
    s^.li^.n:=numberofelements(list1);
    s^.sons:=list1.first;
    relnode^.node:=s;
    END{HEAD};
                                                        BEGIN{createitem12}
  createHEAD(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU3(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU3}
    copylist(MU3,list);
    END{MU3};
                                                        BEGIN{createitem13}
  createMU3(list);
  END;
  PROCEDURE createitem14(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createPOSTMODREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := ADVP;
        N^.ls^.ADVPfield^ := ADVPREC1;
      END{CreateNode};
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      VAR list:LSMRUQUO_ListOfStrees;
      PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU4(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU4}
        copylist(MU4,list);
        END{MU4};
                                                            BEGIN{createitem11}
      createMU4(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem11);
      END{createlist1};
                                                          BEGIN{POSTMODREL}
LSMATCHES_createitem(list,POSTMODREL,ADVP,createnode,createlist1);
    END{POSTMODREL};
                                                        BEGIN{createitem14}
  createPOSTMODREL(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist4items0101(wholelist,createitem11,createitem12,createitem13,createitem14);
  END{createlist1};
                                                      BEGIN{createM}
m:=MAKET_stree(CN);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION3;
BEGIN
CNREC2:=CNREC1;                                       ;
CNREC2.POSSGENI:=FALSE
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
m2:=loopholes.retype(Is2,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
  BEGIN
    MatchModel2(m2,TRUE,match);
    If match Then
    BEGIN
 END;
IF match THEN
  BEGIN
  IF ((ADVPREC1.SUPERDEIXIS =CNREC1.SUPERDEIXIS              )
                                                      )
                                                       THEN
    BEGIN
    MAKET_CNrec(CNREC2);
    action3;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                          END;
COMRCNMODADVP2:=result
END;
{:RCNMODADVP2}
{rule:}
{:RCNMODPOSTPARTICPLE}
 FUNCTION COMRCNMODPOSTPARTICPLE(LEVEL:INTEGER;
Is1:LISTREE_pStree;Is2:LISTREE_pStree
):LISTREE_SetOfStrees;
VAR result:LISTREE_SetOfStrees;
 wbonus,sbonus:INTEGER;
 m:LSSTREE_pstree;
 Is:LISTREE_pstree;
 setofstrees:LISTREE_setofstrees;
 first:BOOLEAN;
 match:BOOLEAN;
 idargs:LIIDDICT_idargs;
dtree:HYPERDTREE_phyperdtree;
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
LinitM1_1,LrestM1_1,LfirstM1_1,LlastM1_1:LSSTREE_prelnode;
iM1_1:INTEGER;
nomoretreesM1_1,lastmatchM1_1:BOOLEAN;
LinitM1_2,LrestM1_2,LfirstM1_2,LlastM1_2:LSSTREE_prelnode;
iM1_2:INTEGER;
nomoretreesM1_2,lastmatchM1_2:BOOLEAN;
LinitM1_2_1,LrestM1_2_1,LfirstM1_2_1,LlastM1_2_1:LSSTREE_prelnode;
iM1_2_1:INTEGER;
nomoretreesM1_2_1,lastmatchM1_2_1:BOOLEAN;
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
LinitM2_1,LrestM2_1,LfirstM2_1,LlastM2_1:LSSTREE_prelnode;
iM2_1:INTEGER;
nomoretreesM2_1,lastmatchM2_1:BOOLEAN;
LinitM2_2,LrestM2_2,LfirstM2_2,LlastM2_2:LSSTREE_prelnode;
iM2_2:INTEGER;
nomoretreesM2_2,lastmatchM2_2:BOOLEAN;
LinitM2_3,LrestM2_3,LfirstM2_3,LlastM2_3:LSSTREE_prelnode;
iM2_3:INTEGER;
nomoretreesM2_3,lastmatchM2_3:BOOLEAN;
LinitM2_3_1,LrestM2_3_1,LfirstM2_3_1,LlastM2_3_1:LSSTREE_prelnode;
iM2_3_1:INTEGER;
nomoretreesM2_3_1,lastmatchM2_3_1:BOOLEAN;
LinitM2_3_2,LrestM2_3_2,LfirstM2_3_2,LlastM2_3_2:LSSTREE_prelnode;
iM2_3_2:INTEGER;
nomoretreesM2_3_2,lastmatchM2_3_2:BOOLEAN;
LinitM2_3_2_1,LrestM2_3_2_1,LfirstM2_3_2_1,LlastM2_3_2_1:LSSTREE_prelnode;
iM2_3_2_1:INTEGER;
nomoretreesM2_3_2_1,lastmatchM2_3_2_1:BOOLEAN;
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
REL1:LSDOMAINT_synrel;
N1:LSDOMAINT_lsrecord;
T1:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
VERBREC1:LSDOMAINT_VERBrecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
CNVARREC1:LSDOMAINT_CNVARrecord;
SENTENCEREC1:LSDOMAINT_SENTENCErecord;
CNREC1:LSDOMAINT_CNrecord;
CNREC2:LSDOMAINT_CNrecord;
SENTENCEREC2:LSDOMAINT_SENTENCErecord;
FUNCTION matchcondI15:BOOLEAN;
                                                      BEGIN
matchcondI15:=FALSE;
  IF
((T1^.CAT IN [SENTENCE]                                            )
                                                      )
                                                      THEN 
matchcondI15:=TRUE;

END;{matchcondI15}
FUNCTION matchcondI5:BOOLEAN;
FUNCTION EXIST1(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
Linit_1,Lrest_1,Lfirst_1,Llast_1:LSSTREE_prelnode;
i_1:INTEGER;
nomoretrees_1,lastmatch_1:BOOLEAN;
      Lfinal:LSSTREE_prelnode;
match:Boolean;
PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR
  itemmatch,listmatch:Boolean;
  PROCEDURE Match_REL1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
      LSMATCHES_matchtreeVarConVar(Lfirst,Llast,first,REL1,T1,match,matchcondI15,lastmatch_1);
END;
                                                      BEGIN {MatchList1Items}
  match:=FALSE;
  IF first THEN
    BEGIN 
  nomoretrees_1:=False;
    Lfirst_1:=NIL;
    SelectLfirstAndLlast(Lfirst_1,Llast_1,Lrest_1
,nomoretrees_1,L);
    IF Llast_1=Lfinal THEN Lrest_1:=NIL;
    IF NOT nomoretrees_1 THEN
      BEGIN
      Match_REL1(Lfirst_1,Llast_1,TRUE,itemmatch);
      match:=itemmatch;
END
    END
  ELSE
  BEGIN
IF Llast_1=Lfinal THEN Lrest_1:=NIL;
    Match_REL1(Lfirst_1,Llast_1,FALSE,match);
    END;
END;{MatchList1Items}
                                                        BEGIN{Exist1}
    next:=mu.first;match:=False;Lfinal:=mu.last;
    IF next =NIL THEN
      EXIST1:=False
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND NOT(match) DO
      BEGIN
        matchlist1items(next,TRUE,match);
        next:=next^.brother;
      END;
      IF match = False THEN
        matchlist1items(next,TRUE,match);
      EXIST1:=match;
    END;
  END;{Exist}
                                                      BEGIN
matchcondI5:=FALSE;
  IF
((NOT Exist1(MU3)                                       )
                                                      )
                                                      THEN 
matchcondI5:=TRUE;

END;{matchcondI5}
FUNCTION matchcondI3:BOOLEAN;
                                                      BEGIN
matchcondI3:=FALSE;
  IF
((((((VERBREC1.STATUS =BAREV                                )
                                                      )
                                                      )
OR
          (((VERBREC1.STATUS =PARTV                                )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((VERBREC1.EORENFORM =NOFORM                            )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI4:BOOLEAN;
                                                      BEGIN
matchcondI4:=FALSE;
  IF
(((SENTENCEREC1.MOOD=ANTERELATIVE) AND 
          (SENTENCEREC1.PROSUBJECT=TRUE) AND 
          TRUE
                                                      )
                                                      )
THEN IF
          ((SENTENCEREC1.MODUS IN [PRESPART,
PASTPART]                                             )
                                                      )
                                                      THEN 
matchcondI4:=TRUE;

END;{matchcondI4}
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
(((SENTENCEREC2.MOOD=ANTERELATIVE) AND 
          (SENTENCEREC2.PROSUBJECT=TRUE) AND 
          TRUE
                                                      )
                                                      )
THEN IF
          ((SENTENCEREC2.MODUS IN [PRESPART,
PASTPART]                                             )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
                                                      PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>CN THEN
      match:=FALSE;
    IF match THEN
      CNREC1:=s^.ls^.CNfield^;
  END{MatchNode};
                                                      PROCEDURE MatchList3Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    PROCEDURE Match_MU1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU1.first:=Lfirst;
        MU1.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU1(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        N1:= s^.ls^;match:=TRUE;
            END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        PROCEDURE Match_MU2(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU2.first:=Lfirst;
            MU2.last:=Llast;
            match:=TRUE;
          END
          ELSE match:=FALSE
        END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU2(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU2(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM1_2_1:=L;WHILE LlastM1_2_1^.brother<>NIL DO
LlastM1_2_1:=LlastM1_2_1^.brother;
match_MU2(L,LlastM1_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM1_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_MU3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU3.first:=Lfirst;
        MU3.last:=Llast;
        match:= matchcondI5;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU3(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,HEAD,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) ELSE match_HEAD(LfirstM1_2,LfirstM1_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  lirel2:LIDOMAINT_synrel;
  lsrel2:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>SENTENCE THEN
      match:=FALSE;
    IF match THEN
      SENTENCEREC1:=s^.ls^.SENTENCEfield^;
    IF match THEN
      match:= matchcondI4;
  END{MatchNode};
                                                        PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR
    itemmatch,listmatch:Boolean;
    PROCEDURE Match_SUBJREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>CNVAR THEN
          match:=FALSE;
        IF match THEN
          CNVARREC1:=s^.ls^.CNVARfield^;
      END{MatchNode};
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,SUBJREL
,match,matchnode,matchlist0items,lastmatchM2_1) END;
                                                          PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
    PROCEDURE Match_MU4(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU4.first:=Lfirst;
        MU4.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                            PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
    PROCEDURE Match_PREDREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>VERBP THEN
          match:=FALSE;
        IF match THEN
          VERBPREC1:=s^.ls^.VERBPfield^;
      END{MatchNode};
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        PROCEDURE Match_MU5(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU5.first:=Lfirst;
            MU5.last:=Llast;
            match:=TRUE;
          END
          ELSE match:=FALSE
        END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU5(Lfirst,Llast,TRUE,match);
END;
        PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR matchcond:BOOLEAN;
          Stree:LSSTREE_pStree;
          lisons:LISTREE_pRelnode;
          PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
          BEGIN{MatchNode}
            IF s^.ls^.cat<>VERB THEN
              match:=FALSE;
            IF match THEN
              VERBREC1:=s^.ls^.VERBfield^;
            IF match THEN
              match:= matchcondI3;
          END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            PROCEDURE Match_MU6(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            BEGIN{match}
              IF first THEN BEGIN
                MU6.first:=Lfirst;
                MU6.last:=Llast;
                match:=TRUE;
              END
              ELSE match:=FALSE
            END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU6(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU6(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM2_3_2_1:=L;WHILE LlastM2_3_2_1^.brother<>NIL DO
LlastM2_3_2_1:=LlastM2_3_2_1^.brother;
match_MU6(L,LlastM2_3_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
            LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM2_3_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM2_3_1,LlastM2_3_1
,item2,LfirstM2_3_2,LlastM2_3_2
) ELSE match_HEAD(LfirstM2_3_2,LfirstM2_3_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,PREDREL
,HEAD,match,matchnode,matchlist2items,lastmatchM2_3) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist0items,
LlastM2_3,LfirstM2_3,LrestM2_3,nomoretreesM2_3) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU4,matchlist1items,
LlastM2_2,LfirstM2_2,LrestM2_2,nomoretreesM2_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_SUBJREL,matchlist2items,
LlastM2_1,LfirstM2_1,LrestM2_1,nomoretreesM2_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,SUBJREL,PREDREL,match,matchnode,matchlist3items,lastmatch) END;
                                                      PROCEDURE createM;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CN;
    N^.ls^.CNfield^ := CNREC2;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU1(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU1}
    copylist(MU1,list);
    END{MU1};
                                                        BEGIN{createitem11}
  createMU1(list);
  END;
  PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^:=N1;
      END;{CreateNode}
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      VAR list:LSMRUQUO_ListOfStrees;
      PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU2}
        copylist(MU2,list);
        END{MU2};
                                                            BEGIN{createitem11}
      createMU2(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem11);
      END{createlist1};
                                                          BEGIN{HEAD}
    LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
    list.first:=relnode;
    list.last:=relnode;
    relnode^.relation:=HEAD;
    s:=MAKET_stree(N1.cat);
    createnode(s);
    createlist1(list1);
    IF (list1.first<>NIL) THEN list1.last^.brother:=NIL;
    s^.li^.n:=numberofelements(list1);
    s^.sons:=list1.first;
    relnode^.node:=s;
    END{HEAD};
                                                        BEGIN{createitem12}
  createHEAD(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU3(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU3}
    copylist(MU3,list);
    END{MU3};
                                                        BEGIN{createitem13}
  createMU3(list);
  END;
  PROCEDURE createitem14(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createPOSTMODREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := SENTENCE;
        N^.ls^.SENTENCEfield^ := SENTENCEREC2;
      END{CreateNode};
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      VAR list:LSMRUQUO_ListOfStrees;
      PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU4(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU4}
        copylist(MU4,list);
        END{MU4};
                                                            BEGIN{createitem11}
      createMU4(list);
      END;
      PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createPREDREL(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := VERBP;
            N^.ls^.VERBPfield^ := VERBPREC1;
          END{CreateNode};
                                                                PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          VAR list:LSMRUQUO_ListOfStrees;
          PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createMU5(VAR list:LSMRUQUO_ListOfStrees);
            BEGIN{MU5}
            copylist(MU5,list);
            END{MU5};
                                                                BEGIN{createitem21}
          createMU5(list);
          END;
          PROCEDURE createitem22(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
            VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
             list1:LSMRUQUO_ListOfStrees;
              PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
              BEGIN{CreateNode}
                N^.ls^.cat := VERB;
                N^.ls^.VERBfield^ := VERBREC1;
              END{CreateNode};
                                                                    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
              VAR list:LSMRUQUO_ListOfStrees;
              PROCEDURE createitem31(VAR list:LSMRUQUO_ListOfStrees);
                PROCEDURE createMU6(VAR list:LSMRUQUO_ListOfStrees);
                BEGIN{MU6}
                copylist(MU6,list);
                END{MU6};
                                                                    BEGIN{createitem31}
              createMU6(list);
              END;
              BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem31);
              END{createlist1};
                                                                  BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,VERB,createnode,createlist1);
            END{HEAD};
                                                                BEGIN{createitem22}
          createHEAD(list);
          END;
          BEGIN{createlist1}
LSMATCHES_createlist2items01(wholelist,createitem21,createitem22);
          END{createlist1};
                                                              BEGIN{PREDREL}
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
        END{PREDREL};
                                                            BEGIN{createitem12}
      createPREDREL(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist2items01(wholelist,createitem11,createitem12);
      END{createlist1};
                                                          BEGIN{POSTMODREL}
LSMATCHES_createitem(list,POSTMODREL,SENTENCE,createnode,createlist1);
    END{POSTMODREL};
                                                        BEGIN{createitem14}
  createPOSTMODREL(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist4items0101(wholelist,createitem11,createitem12,createitem13,createitem14);
  END{createlist1};
                                                      BEGIN{createM}
m:=MAKET_stree(CN);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION1;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION5;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
SENTENCEREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION9;
BEGIN
CNREC2:=CNREC1;                                       ;
CNREC2.POSSGENI:=FALSE
                                                      ;
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
CNREC1loc:LSDOMAINT_CNVARrecord;
BEGIN
CNREC1loc:=COPYT_CNTOVAR(CNREC1);
result:=TRUE
AND
(CNVARREC1.req=CNREC1loc.req)AND
(CNVARREC1.env=CNREC1loc.env)AND
(CNVARREC1.superdeixis=CNREC1loc.superdeixis)AND
(CNVARREC1.class=CNREC1loc.class)AND
(CNVARREC1.deixis=CNREC1loc.deixis)AND
(CNVARREC1.aspect=CNREC1loc.aspect)AND
(CNVARREC1.retro=CNREC1loc.retro)AND
(CNVARREC1.definite=CNREC1loc.definite)AND
(CNVARREC1.numbers=CNREC1loc.numbers)AND
(CNVARREC1.genders=CNREC1loc.genders)AND
(CNVARREC1.sexes=CNREC1loc.sexes)AND
(CNVARREC1.actsubcs=CNREC1loc.actsubcs)AND
(CNVARREC1.temporal=CNREC1loc.temporal)AND
(CNVARREC1.possgeni=CNREC1loc.possgeni)AND
(CNVARREC1.animate=CNREC1loc.animate)AND
(CNVARREC1.human=CNREC1loc.human)AND
(CNVARREC1.posscomas=CNREC1loc.posscomas)AND
(CNVARREC1.thetanp=CNREC1loc.thetanp)AND
(CNVARREC1.nounpatternefs=CNREC1loc.nounpatternefs)
;except1:=result
END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
m2:=loopholes.retype(Is2,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
  BEGIN
    MatchModel2(m2,TRUE,match);
    If match Then
    BEGIN
 END;
IF match THEN
  BEGIN
  IF ((((CNVARREC1.INDEX =level                                )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((except1                                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((CNVARREC1.CASES =[NOMINATIVE]                                          )
                                                      )
                                                      )
                                                      )
                                                       THEN
    BEGIN
    IF ((SENTENCEREC1.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
THEN IF
          ((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC2);
      MAKET_SENTENCErec(SENTENCEREC2);
      action1;
      action9;
      createM;
      Is:=loopholes.retype(m,LISTREE_pstree);
      LISTREE_appendstreebonus(Is,result,wbonus);
      END;
    IF ((((CNREC1.SUPERDEIXIS =SENTENCEREC1.SUPERDEIXIS          )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC1.DEIXIS =OMEGADEIXIS                      )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC2);
      MAKET_SENTENCErec(SENTENCEREC2);
      action5;
      action9;
      createM;
      Is:=loopholes.retype(m,LISTREE_pstree);
      LISTREE_appendstreebonus(Is,result,wbonus);
      END;
                                                          END;
                                                        END;
                                                          END;
COMRCNMODPOSTPARTICPLE:=result
END;
{:RCNMODPOSTPARTICPLE}
{rule:}
{:RCNMODRELSENT1}
 FUNCTION COMRCNMODRELSENT1(LEVEL:INTEGER;
Is1:LISTREE_pStree;Is2:LISTREE_pStree
):LISTREE_SetOfStrees;
VAR result:LISTREE_SetOfStrees;
 wbonus,sbonus:INTEGER;
 m:LSSTREE_pstree;
 Is:LISTREE_pstree;
 setofstrees:LISTREE_setofstrees;
 first:BOOLEAN;
 match:BOOLEAN;
 idargs:LIIDDICT_idargs;
dtree:HYPERDTREE_phyperdtree;
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
LinitM1_1,LrestM1_1,LfirstM1_1,LlastM1_1:LSSTREE_prelnode;
iM1_1:INTEGER;
nomoretreesM1_1,lastmatchM1_1:BOOLEAN;
LinitM2_1,LrestM2_1,LfirstM2_1,LlastM2_1:LSSTREE_prelnode;
iM2_1:INTEGER;
nomoretreesM2_1,lastmatchM2_1:BOOLEAN;
LinitM2_2,LrestM2_2,LfirstM2_2,LlastM2_2:LSSTREE_prelnode;
iM2_2:INTEGER;
nomoretreesM2_2,lastmatchM2_2:BOOLEAN;
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
T1:LSSTREE_pStree;
PREPREC1tree:LSSTREE_pStree;
ENREC1tree:LSSTREE_pStree;
PUNCREC2tree:LSSTREE_pStree;
T2:LSSTREE_pStree;
PUNCREC1tree:LSSTREE_pStree;
RELPROREC1tree:LSSTREE_pStree;
RADVREC1tree:LSSTREE_pStree;
BWHPROREC1tree:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
SIG1:LSMRUQUO_ListOfStrees;
PUNCREC2:LSDOMAINT_PUNCrecord;
ENREC1:LSDOMAINT_ENrecord;
PREPREC1:LSDOMAINT_PREPrecord;
RADVPREC1:LSDOMAINT_RADVPrecord;
VARPREPPREC1:LSDOMAINT_PREPPrecord;
CNVARREC1:LSDOMAINT_CNVARrecord;
SENTENCEREC1:LSDOMAINT_SENTENCErecord;
CNREC1:LSDOMAINT_CNrecord;
CNREC2:LSDOMAINT_CNrecord;
SENTENCEREC2:LSDOMAINT_SENTENCErecord;
PUNCREC1:LSDOMAINT_PUNCrecord;
RELPROREC1:LSDOMAINT_RELPROrecord;
PREPPREC1:LSDOMAINT_PREPPrecord;
RADVPREC2:LSDOMAINT_RADVPrecord;
RADVREC1:LSDOMAINT_RADVrecord;
NPREC1:LSDOMAINT_NPrecord;
WHPROREC1:LSDOMAINT_WHPROrecord;
BWHPROREC1:LSDOMAINT_BWHPROrecord;
FUNCTION matchcondI4:BOOLEAN;
                                                      BEGIN
matchcondI4:=FALSE;
  IF
(((SENTENCEREC2.MOOD=RELATIVE) AND 
          (SENTENCEREC2.SENTTYPE=SUBORDINATECLAUSE) AND 
          (SENTENCEREC2.FINITENESS=FINITE) AND 
          TRUE
                                                      )
                                                      )
                                                      THEN 
matchcondI4:=TRUE;

END;{matchcondI4}
FUNCTION matchcondI3:BOOLEAN;
FUNCTION ALL1(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
lastmatch:BOOLEAN;
      match:Boolean;
PROCEDURE Match_PUNCREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR matchcond:BOOLEAN;
  Stree:LSSTREE_pStree;
  lisons:LISTREE_pRelnode;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>PUNC THEN
      match:=FALSE;
    IF match THEN
      PUNCREC2:=s^.ls^.PUNCfield^;
    IF match THEN match:=(s^.ls^.PUNCfield^.key=auxkey('KOMMAPUNCKEY'));
  END{MatchNode};
                                                      BEGIN{MatchTree}
        PUNCREC2tree:=Lfirst^.node;
      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PUNCREL
,match,matchnode,matchlist0items,lastmatch) END;
                                                        BEGIN{All1}
    next:=mu.first;match:=TRUE;
    IF next =NIL THEN
      ALL1:=TRUE
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND (match) DO
      BEGIN
        match_PUNCREL(next,next,TRUE,match);
        next:=next^.brother;
      END;
      IF match THEN
      BEGIN
        match_PUNCREL(next,mu.last,TRUE,match);
        ALL1:=match;
      END
      ELSE
        ALL1:=FALSE;
    END;
  END;{All}
                                                      BEGIN
matchcondI3:=FALSE;
  IF
((ALL1(SIG1)                                            )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
(((SENTENCEREC1.MOOD=RELATIVE) AND 
          (SENTENCEREC1.SENTTYPE=SUBORDINATECLAUSE) AND 
          (SENTENCEREC1.FINITENESS=FINITE) AND 
          TRUE
                                                      )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI1:BOOLEAN;
FUNCTION EXIST1(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
Linit_1,Lrest_1,Lfirst_1,Llast_1:LSSTREE_prelnode;
i_1:INTEGER;
nomoretrees_1,lastmatch_1:BOOLEAN;
      Lfinal:LSSTREE_prelnode;
match:Boolean;
PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR
  itemmatch,listmatch:Boolean;
  PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>EN THEN
        match:=FALSE;
      IF match THEN
        ENREC1:=s^.ls^.ENfield^;
    END{MatchNode};
                                                      BEGIN{MatchTree}
            ENREC1tree:=Lfirst^.node;
        IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatch_1) END;
                                                      BEGIN {MatchList1Items}
  match:=FALSE;
  IF first THEN
    BEGIN 
  nomoretrees_1:=False;
    Lfirst_1:=NIL;
    SelectLfirstAndLlast(Lfirst_1,Llast_1,Lrest_1
,nomoretrees_1,L);
    IF Llast_1=Lfinal THEN Lrest_1:=NIL;
    IF NOT nomoretrees_1 THEN
      BEGIN
      Match_HEAD(Lfirst_1,Llast_1,TRUE,itemmatch);
      match:=itemmatch;
END
    END
  ELSE
  BEGIN
IF Llast_1=Lfinal THEN Lrest_1:=NIL;
    Match_HEAD(Lfirst_1,Llast_1,FALSE,match);
    END;
END;{MatchList1Items}
                                                        BEGIN{Exist1}
    next:=mu.first;match:=False;Lfinal:=mu.last;
    IF next =NIL THEN
      EXIST1:=False
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND NOT(match) DO
      BEGIN
        matchlist1items(next,TRUE,match);
        next:=next^.brother;
      END;
      IF match = False THEN
        matchlist1items(next,TRUE,match);
      EXIST1:=match;
    END;
  END;{Exist}
                                                      BEGIN
matchcondI1:=FALSE;
  IF
((NOT Exist1(MU1)                                       )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

END;{matchcondI1}
                                                      PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>CN THEN
      match:=FALSE;
    IF match THEN
      CNREC1:=s^.ls^.CNfield^;
  END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    PROCEDURE Match_MU1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU1.first:=Lfirst;
        MU1.last:=Llast;
        match:= matchcondI1;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU1(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU1(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM1_1:=L;WHILE LlastM1_1^.brother<>NIL DO
LlastM1_1:=LlastM1_1^.brother;
match_MU1(L,LlastM1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist1items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>SENTENCE THEN
      match:=FALSE;
    IF match THEN
      SENTENCEREC1:=s^.ls^.SENTENCEfield^;
    IF match THEN
      match:= matchcondI2;
  END{MatchNode};
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    PROCEDURE Match_SHIFTREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeVar(Lfirst,Llast,first,SHIFTREL,T1,match,lastmatchM2_1);
END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_SHIFTREL(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_MU2(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU2.first:=Lfirst;
        MU2.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU2(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_RMfirst(L,match,item1,LfirstM2_1,LlastM2_1
,item2,LfirstM2_2,LlastM2_2
) ELSE match_SHIFTREL(LfirstM2_1,LfirstM2_1,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,SHIFTREL,match,matchnode,matchlist2items,lastmatch) END;
                                                      PROCEDURE createM;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CN;
    N^.ls^.CNfield^ := CNREC2;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU1(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU1}
    copylist(MU1,list);
    END{MU1};
                                                        BEGIN{createitem11}
  createMU1(list);
  END;
  PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createPOSTMODREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := SENTENCE;
        N^.ls^.SENTENCEfield^ := SENTENCEREC2;
      END{CreateNode};
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      VAR list:LSMRUQUO_ListOfStrees;
      PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createSHIFTREL(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          BEGIN
          wholelist.first:=NIL;wholelist.last:=NIL;
          END;
                                                              BEGIN{SHIFTREL}
LSMATCHES_createitemVar(list,SHIFTREL,T2);
        END{SHIFTREL};
                                                            BEGIN{createitem11}
      createSHIFTREL(list);
      END;
      PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU2}
        copylist(MU2,list);
        END{MU2};
                                                            BEGIN{createitem12}
      createMU2(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist2items10(wholelist,createitem11,createitem12);
      END{createlist1};
                                                          BEGIN{POSTMODREL}
LSMATCHES_createitem(list,POSTMODREL,SENTENCE,createnode,createlist1);
    END{POSTMODREL};
                                                        BEGIN{createitem12}
  createPOSTMODREL(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createSIG1(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{SIG1}
    copylist(SIG1,list);
    END{SIG1};
                                                        BEGIN{createitem13}
  createSIG1(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m:=MAKET_stree(CN);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                       FUNCTION subrule0X2 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
  PROCEDURE createT2;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := RELPRO;
      N^.ls^.RELPROfield^ := RELPROREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T2}
s:=RELPROREC1tree;
  T2:=s;
  END{T2};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>CNVAR THEN
        match:=FALSE;
      IF match THEN
        CNVARREC1:=s^.ls^.CNVARfield^;
    END{MatchNode};
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION19;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION25;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
SENTENCEREC2.DEIXIS:=CNREC1.SUPERDEIXIS
                                                      ;
SENTENCEREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION29;
BEGIN
CNREC2:=CNREC1;                                       ;
CNREC2.POSSGENI:=FALSE
                                                      ;
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
CNREC1loc:LSDOMAINT_CNVARrecord;
BEGIN
CNREC1loc:=COPYT_CNTOVAR(CNREC1);
result:=TRUE
AND
(CNVARREC1.req=CNREC1loc.req)AND
(CNVARREC1.env=CNREC1loc.env)AND
(CNVARREC1.superdeixis=CNREC1loc.superdeixis)AND
(CNVARREC1.class=CNREC1loc.class)AND
(CNVARREC1.deixis=CNREC1loc.deixis)AND
(CNVARREC1.aspect=CNREC1loc.aspect)AND
(CNVARREC1.retro=CNREC1loc.retro)AND
(CNVARREC1.definite=CNREC1loc.definite)AND
(CNVARREC1.numbers=CNREC1loc.numbers)AND
(CNVARREC1.genders=CNREC1loc.genders)AND
(CNVARREC1.sexes=CNREC1loc.sexes)AND
(CNVARREC1.actsubcs=CNREC1loc.actsubcs)AND
(CNVARREC1.temporal=CNREC1loc.temporal)AND
(CNVARREC1.possgeni=CNREC1loc.possgeni)AND
(CNVARREC1.animate=CNREC1loc.animate)AND
(CNVARREC1.human=CNREC1loc.human)AND
(CNVARREC1.posscomas=CNREC1loc.posscomas)AND
(CNVARREC1.thetanp=CNREC1loc.thetanp)AND
(CNVARREC1.nounpatternefs=CNREC1loc.nounpatternefs)
;except1:=result
END;
                                                       BEGIN{02}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF ((((CNVARREC1.INDEX =level                                )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((except1                                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((NEUTGENDER IN CNREC1.GENDERS                          )
                                                      )
                                                      )
                                                      )
AND
          ((((SINGULAR IN CNREC1.NUMBERS                            )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((CNVARREC1.CASES *[NOMINATIVE,
DATIVE,
ACCUSATIVE]                                           <>[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      IF ((((SENTENCEREC1.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC1.DEIXIS =PRESENTDEIXIS                    )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((CNREC1.SUPERDEIXIS<>PRESENTDEIXIS                     )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((((SENTENCEREC1.DEIXIS =PASTDEIXIS                       )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((CNREC1.SUPERDEIXIS<>PASTDEIXIS                        )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_CNrec(CNREC2);
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVPrec(RADVPREC2);
        MAKET_RADVrec(RADVREC1);
        MAKET_NPrec(NPREC1);
        MAKET_WHPROrec(WHPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        hulpstree:=LDBLEX_read(auxkey('DATRELPROKEY'));
        RELPROREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        RELPROREC1:=RELPROREC1tree^.ls^.RELPROfield^;
        action19;
        action29;
        createSIG1;
        createT2;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((((SENTENCEREC1.DEIXIS =OMEGADEIXIS                      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC1.SUPERDEIXIS =CNREC1.SUPERDEIXIS          )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_CNrec(CNREC2);
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVPrec(RADVPREC2);
        MAKET_RADVrec(RADVREC1);
        MAKET_NPrec(NPREC1);
        MAKET_WHPROrec(WHPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        hulpstree:=LDBLEX_read(auxkey('DATRELPROKEY'));
        RELPROREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        RELPROREC1:=RELPROREC1tree^.ls^.RELPROfield^;
        action25;
        action29;
        createSIG1;
        createT2;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                       subrule0X2:=result
 END;
 FUNCTION subrule0X3 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createPUNCREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := PUNC;
          N^.ls^.PUNCfield^ := PUNCREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{PUNCREL}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=PUNCREL;
s:=PUNCREC1tree;
      relnode^.node:=s;
      END{PUNCREL};
                                                          BEGIN{createitem11}
    createPUNCREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
  PROCEDURE createT2;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := RELPRO;
      N^.ls^.RELPROfield^ := RELPROREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T2}
s:=RELPROREC1tree;
  T2:=s;
  END{T2};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>CNVAR THEN
        match:=FALSE;
      IF match THEN
        CNVARREC1:=s^.ls^.CNVARfield^;
    END{MatchNode};
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                       BEGIN{03}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
                                                       subrule0X3:=result
 END;
 FUNCTION subrule0X4 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
  PROCEDURE createT2;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := RELPRO;
      N^.ls^.RELPROfield^ := RELPROREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T2}
s:=RELPROREC1tree;
  T2:=s;
  END{T2};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>CNVAR THEN
        match:=FALSE;
      IF match THEN
        CNVARREC1:=s^.ls^.CNVARfield^;
    END{MatchNode};
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION67;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION73;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
SENTENCEREC2.DEIXIS:=CNREC1.SUPERDEIXIS
                                                      ;
SENTENCEREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION77;
BEGIN
CNREC2:=CNREC1;                                       ;
CNREC2.POSSGENI:=FALSE
                                                      ;
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
CNREC1loc:LSDOMAINT_CNVARrecord;
BEGIN
CNREC1loc:=COPYT_CNTOVAR(CNREC1);
result:=TRUE
AND
(CNVARREC1.req=CNREC1loc.req)AND
(CNVARREC1.env=CNREC1loc.env)AND
(CNVARREC1.superdeixis=CNREC1loc.superdeixis)AND
(CNVARREC1.class=CNREC1loc.class)AND
(CNVARREC1.deixis=CNREC1loc.deixis)AND
(CNVARREC1.aspect=CNREC1loc.aspect)AND
(CNVARREC1.retro=CNREC1loc.retro)AND
(CNVARREC1.definite=CNREC1loc.definite)AND
(CNVARREC1.numbers=CNREC1loc.numbers)AND
(CNVARREC1.genders=CNREC1loc.genders)AND
(CNVARREC1.sexes=CNREC1loc.sexes)AND
(CNVARREC1.actsubcs=CNREC1loc.actsubcs)AND
(CNVARREC1.temporal=CNREC1loc.temporal)AND
(CNVARREC1.possgeni=CNREC1loc.possgeni)AND
(CNVARREC1.animate=CNREC1loc.animate)AND
(CNVARREC1.human=CNREC1loc.human)AND
(CNVARREC1.posscomas=CNREC1loc.posscomas)AND
(CNVARREC1.thetanp=CNREC1loc.thetanp)AND
(CNVARREC1.nounpatternefs=CNREC1loc.nounpatternefs)
;except1:=result
END;
                                                       BEGIN{04}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF ((((CNVARREC1.INDEX =level                                )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((except1                                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((CNREC1.GENDERS *[MASCGENDER,
FEMGENDER]                                            <>[]                                                    )
                                                      )
                                                      )
OR
          (((PLURAL IN CNREC1.NUMBERS                              )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((CNVARREC1.CASES *[NOMINATIVE,
DATIVE,
ACCUSATIVE]                                           <>[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      IF ((((SENTENCEREC1.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC1.DEIXIS =PRESENTDEIXIS                    )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((CNREC1.SUPERDEIXIS<>PRESENTDEIXIS                     )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((((SENTENCEREC1.DEIXIS =PASTDEIXIS                       )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((CNREC1.SUPERDEIXIS<>PASTDEIXIS                        )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_CNrec(CNREC2);
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVPrec(RADVPREC2);
        MAKET_RADVrec(RADVREC1);
        MAKET_NPrec(NPREC1);
        MAKET_WHPROrec(WHPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        hulpstree:=LDBLEX_read(auxkey('DIERELPROKEY'));
        RELPROREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        RELPROREC1:=RELPROREC1tree^.ls^.RELPROfield^;
        action67;
        action77;
        createSIG1;
        createT2;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((((SENTENCEREC1.DEIXIS =OMEGADEIXIS                      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC1.SUPERDEIXIS =CNREC1.SUPERDEIXIS          )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_CNrec(CNREC2);
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVPrec(RADVPREC2);
        MAKET_RADVrec(RADVREC1);
        MAKET_NPrec(NPREC1);
        MAKET_WHPROrec(WHPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        hulpstree:=LDBLEX_read(auxkey('DIERELPROKEY'));
        RELPROREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        RELPROREC1:=RELPROREC1tree^.ls^.RELPROfield^;
        action73;
        action77;
        createSIG1;
        createT2;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                       subrule0X4:=result
 END;
 FUNCTION subrule0X5 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT1_1,LrestT1_1,LfirstT1_1,LlastT1_1:LSSTREE_prelnode;
iT1_1:INTEGER;
nomoretreesT1_1,lastmatchT1_1:BOOLEAN;
LinitT1_1_1,LrestT1_1_1,LfirstT1_1_1,LlastT1_1_1:LSSTREE_prelnode;
iT1_1_1:INTEGER;
nomoretreesT1_1_1,lastmatchT1_1_1:BOOLEAN;
LinitT1_2,LrestT1_2,LfirstT1_2,LlastT1_2:LSSTREE_prelnode;
iT1_2:INTEGER;
nomoretreesT1_2,lastmatchT1_2:BOOLEAN;
LinitT1_3,LrestT1_3,LfirstT1_3,LlastT1_3:LSSTREE_prelnode;
iT1_3:INTEGER;
nomoretreesT1_3,lastmatchT1_3:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createPUNCREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := PUNC;
          N^.ls^.PUNCfield^ := PUNCREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{PUNCREL}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=PUNCREL;
s:=PUNCREC1tree;
      relnode^.node:=s;
      END{PUNCREL};
                                                          BEGIN{createitem11}
    createPUNCREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
  PROCEDURE createT2;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := PREPP;
      N^.ls^.PREPPfield^ := PREPPREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createERREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := RADVP;
          N^.ls^.RADVPfield^ := RADVPREC2;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        VAR list:LSMRUQUO_ListOfStrees;
        PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
          PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
          VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
           list1:LSMRUQUO_ListOfStrees;
            PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
            BEGIN{CreateNode}
              N^.ls^.cat := RADV;
              N^.ls^.RADVfield^ := RADVREC1;
            END{CreateNode};
                                                                  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
            BEGIN
            wholelist.first:=NIL;wholelist.last:=NIL;
            END;
                                                                BEGIN{HEAD}
          LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
          list.first:=relnode;
          list.last:=relnode;
          relnode^.relation:=HEAD;
s:=RADVREC1tree;
          relnode^.node:=s;
          END{HEAD};
                                                              BEGIN{createitem21}
        createHEAD(list);
        END;
        BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem21);
        END{createlist1};
                                                            BEGIN{ERREL}
LSMATCHES_createitem(list,ERREL,RADVP,createnode,createlist1);
      END{ERREL};
                                                          BEGIN{createitem11}
    createERREL(list);
    END;
    PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createGLUEREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := GLUE;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{GLUEREL}
LSMATCHES_createitem(list,GLUEREL,GLUE,createnode,createlist1);
      END{GLUEREL};
                                                          BEGIN{createitem12}
    createGLUEREL(list);
    END;
    PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := PREP;
          N^.ls^.PREPfield^ := PREPREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{HEAD}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=HEAD;
s:=PREPREC1tree;
      relnode^.node:=s;
      END{HEAD};
                                                          BEGIN{createitem13}
    createHEAD(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist3items111(wholelist,createitem11,createitem12,createitem13);
    END{createlist1};
                                                        BEGIN{T2}
  s:=MAKET_stree(PREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T2:=s;
  END{T2};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      lirel2:LIDOMAINT_synrel;
      lsrel2:LSDOMAINT_synrel;
      lirel3:LIDOMAINT_synrel;
      lsrel3:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>VARPREPP THEN
        match:=FALSE;
      IF match THEN
        VARPREPPREC1:=s^.ls^.VARPREPPfield^;
    END{MatchNode};
                                                          PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_ERREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        lirel1:LIDOMAINT_synrel;
        lsrel1:LSDOMAINT_synrel;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>RADVP THEN
            match:=FALSE;
          IF match THEN
            RADVPREC1:=s^.ls^.RADVPfield^;
        END{MatchNode};
                                                              PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
          PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          VAR matchcond:BOOLEAN;
            Stree:LSSTREE_pStree;
            lisons:LISTREE_pRelnode;
            PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
            BEGIN{MatchNode}
              IF s^.ls^.cat<>CNVAR THEN
                match:=FALSE;
              IF match THEN
                CNVARREC1:=s^.ls^.CNVARfield^;
            END{MatchNode};
                                                      BEGIN{MatchTree}
                              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT1_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT1_1_1,LfirstT1_1_1,LrestT1_1_1,nomoretreesT1_1_1) END;
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,ERREL
,HEAD,match,matchnode,matchlist1items,lastmatchT1_1) END;
                                                            PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
      PROCEDURE Match_GLUEREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>GLUE THEN
            match:=FALSE;
          IF match THEN
            ;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,GLUEREL
,match,matchnode,matchlist0items,lastmatchT1_2) END;
                                                              PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
      PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PREP THEN
            match:=FALSE;
          IF match THEN
            PREPREC1:=s^.ls^.PREPfield^;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PREPREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT1_3) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT1_3,LfirstT1_3,LrestT1_3,nomoretreesT1_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_GLUEREL,matchlist1items,
LlastT1_2,LfirstT1_2,LrestT1_2,nomoretreesT1_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_ERREL,matchlist2items,
LlastT1_1,LfirstT1_1,LrestT1_1,nomoretreesT1_1) END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n >=3) AND (s^.li^.n <=3);
        IF match THEN
          BEGIN
          lsrel1:=ERREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lsrel2:=GLUEREL;
          lirel2:= loopholes.retype(lsrel2,LIDOMAINT_synrel);
          lsrel3:=HEAD;
          lirel3:= loopholes.retype(lsrel3,LIDOMAINT_synrel);
          lisons:=loopholes.retype(s^.sons,LISTREE_pRelnode);
          match:= LIMATCHES_TEST3rels(lirel1,lirel2,lirel3,lisons,FALSE);
          END;
IF match THEN matchlist3items(s^.sons,first,match);
    END;
                                                       BEGIN{05}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
                                                       subrule0X5:=result
 END;
 FUNCTION subrule0X6 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT1_1,LrestT1_1,LfirstT1_1,LlastT1_1:LSSTREE_prelnode;
iT1_1:INTEGER;
nomoretreesT1_1,lastmatchT1_1:BOOLEAN;
LinitT1_1_1,LrestT1_1_1,LfirstT1_1_1,LlastT1_1_1:LSSTREE_prelnode;
iT1_1_1:INTEGER;
nomoretreesT1_1_1,lastmatchT1_1_1:BOOLEAN;
LinitT1_2,LrestT1_2,LfirstT1_2,LlastT1_2:LSSTREE_prelnode;
iT1_2:INTEGER;
nomoretreesT1_2,lastmatchT1_2:BOOLEAN;
LinitT1_3,LrestT1_3,LfirstT1_3,LlastT1_3:LSSTREE_prelnode;
iT1_3:INTEGER;
nomoretreesT1_3,lastmatchT1_3:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
  PROCEDURE createT2;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := PREPP;
      N^.ls^.PREPPfield^ := PREPPREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createERREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := RADVP;
          N^.ls^.RADVPfield^ := RADVPREC2;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        VAR list:LSMRUQUO_ListOfStrees;
        PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
          PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
          VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
           list1:LSMRUQUO_ListOfStrees;
            PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
            BEGIN{CreateNode}
              N^.ls^.cat := RADV;
              N^.ls^.RADVfield^ := RADVREC1;
            END{CreateNode};
                                                                  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
            BEGIN
            wholelist.first:=NIL;wholelist.last:=NIL;
            END;
                                                                BEGIN{HEAD}
          LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
          list.first:=relnode;
          list.last:=relnode;
          relnode^.relation:=HEAD;
s:=RADVREC1tree;
          relnode^.node:=s;
          END{HEAD};
                                                              BEGIN{createitem21}
        createHEAD(list);
        END;
        BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem21);
        END{createlist1};
                                                            BEGIN{ERREL}
LSMATCHES_createitem(list,ERREL,RADVP,createnode,createlist1);
      END{ERREL};
                                                          BEGIN{createitem11}
    createERREL(list);
    END;
    PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createGLUEREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := GLUE;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{GLUEREL}
LSMATCHES_createitem(list,GLUEREL,GLUE,createnode,createlist1);
      END{GLUEREL};
                                                          BEGIN{createitem12}
    createGLUEREL(list);
    END;
    PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := PREP;
          N^.ls^.PREPfield^ := PREPREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{HEAD}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=HEAD;
s:=PREPREC1tree;
      relnode^.node:=s;
      END{HEAD};
                                                          BEGIN{createitem13}
    createHEAD(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist3items111(wholelist,createitem11,createitem12,createitem13);
    END{createlist1};
                                                        BEGIN{T2}
  s:=MAKET_stree(PREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T2:=s;
  END{T2};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      lirel2:LIDOMAINT_synrel;
      lsrel2:LSDOMAINT_synrel;
      lirel3:LIDOMAINT_synrel;
      lsrel3:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>VARPREPP THEN
        match:=FALSE;
      IF match THEN
        VARPREPPREC1:=s^.ls^.VARPREPPfield^;
    END{MatchNode};
                                                          PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_ERREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        lirel1:LIDOMAINT_synrel;
        lsrel1:LSDOMAINT_synrel;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>RADVP THEN
            match:=FALSE;
          IF match THEN
            RADVPREC1:=s^.ls^.RADVPfield^;
        END{MatchNode};
                                                              PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
          PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          VAR matchcond:BOOLEAN;
            Stree:LSSTREE_pStree;
            lisons:LISTREE_pRelnode;
            PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
            BEGIN{MatchNode}
              IF s^.ls^.cat<>CNVAR THEN
                match:=FALSE;
              IF match THEN
                CNVARREC1:=s^.ls^.CNVARfield^;
            END{MatchNode};
                                                      BEGIN{MatchTree}
                              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT1_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT1_1_1,LfirstT1_1_1,LrestT1_1_1,nomoretreesT1_1_1) END;
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,ERREL
,HEAD,match,matchnode,matchlist1items,lastmatchT1_1) END;
                                                            PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
      PROCEDURE Match_GLUEREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>GLUE THEN
            match:=FALSE;
          IF match THEN
            ;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,GLUEREL
,match,matchnode,matchlist0items,lastmatchT1_2) END;
                                                              PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
      PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PREP THEN
            match:=FALSE;
          IF match THEN
            PREPREC1:=s^.ls^.PREPfield^;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PREPREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT1_3) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT1_3,LfirstT1_3,LrestT1_3,nomoretreesT1_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_GLUEREL,matchlist1items,
LlastT1_2,LfirstT1_2,LrestT1_2,nomoretreesT1_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_ERREL,matchlist2items,
LlastT1_1,LfirstT1_1,LrestT1_1,nomoretreesT1_1) END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n >=3) AND (s^.li^.n <=3);
        IF match THEN
          BEGIN
          lsrel1:=ERREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lsrel2:=GLUEREL;
          lirel2:= loopholes.retype(lsrel2,LIDOMAINT_synrel);
          lsrel3:=HEAD;
          lirel3:= loopholes.retype(lsrel3,LIDOMAINT_synrel);
          lisons:=loopholes.retype(s^.sons,LISTREE_pRelnode);
          match:= LIMATCHES_TEST3rels(lirel1,lirel2,lirel3,lisons,FALSE);
          END;
IF match THEN matchlist3items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION121;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION127;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
SENTENCEREC2.DEIXIS:=CNREC1.SUPERDEIXIS
                                                      ;
SENTENCEREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION139;
BEGIN
PREPPREC1:=VARPREPPREC1;                              ;
PREPPREC1.MOOD:=WH
                                                      ;
PREPPREC1.RADVKEY:=auxkey('WAARRADVKEY')                                 ;
RADVPREC2.MOOD:=WH;
RADVPREC2.RADVKEY:=
auxkey('WAARRADVKEY')                                 ;RADVPREC2.KINDEFS:=
[PK]                                                  ;                                                     ;
CNREC2:=CNREC1;                                       ;
CNREC2.POSSGENI:=FALSE
                                                      ;
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
CNREC1loc:LSDOMAINT_CNVARrecord;
BEGIN
CNREC1loc:=COPYT_CNTOVAR(CNREC1);
result:=TRUE
AND
(CNVARREC1.req=CNREC1loc.req)AND
(CNVARREC1.env=CNREC1loc.env)AND
(CNVARREC1.superdeixis=CNREC1loc.superdeixis)AND
(CNVARREC1.class=CNREC1loc.class)AND
(CNVARREC1.deixis=CNREC1loc.deixis)AND
(CNVARREC1.aspect=CNREC1loc.aspect)AND
(CNVARREC1.retro=CNREC1loc.retro)AND
(CNVARREC1.definite=CNREC1loc.definite)AND
(CNVARREC1.numbers=CNREC1loc.numbers)AND
(CNVARREC1.genders=CNREC1loc.genders)AND
(CNVARREC1.sexes=CNREC1loc.sexes)AND
(CNVARREC1.actsubcs=CNREC1loc.actsubcs)AND
(CNVARREC1.temporal=CNREC1loc.temporal)AND
(CNVARREC1.possgeni=CNREC1loc.possgeni)AND
(CNVARREC1.animate=CNREC1loc.animate)AND
(CNVARREC1.human=CNREC1loc.human)AND
(CNVARREC1.posscomas=CNREC1loc.posscomas)AND
(CNVARREC1.thetanp=CNREC1loc.thetanp)AND
(CNVARREC1.nounpatternefs=CNREC1loc.nounpatternefs)
;except1:=result
END;
                                                       BEGIN{06}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF ((PK IN RADVPREC1.KINDEFS                               )
                                                      )
THEN IF
          ((VARPREPPREC1.RADVKEY =0                               )
                                                      )
THEN IF
          ((VARPREPPREC1.MOOD =RELATIVEXPMOOD                     )
                                                      )
THEN IF
          ((RADVPREC1.RADVKEY =0                                  )
                                                      )
THEN IF
          ((((CNVARREC1.INDEX =level                                )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((except1                                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((CNVARREC1.HUMAN<>YESHUMAN                             )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((CNVARREC1.CASES *[RCASE]                                               <>
[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      IF ((((SENTENCEREC1.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC1.DEIXIS =PRESENTDEIXIS                    )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((CNREC1.SUPERDEIXIS<>PRESENTDEIXIS                     )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((((SENTENCEREC1.DEIXIS =PASTDEIXIS                       )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((CNREC1.SUPERDEIXIS<>PASTDEIXIS                        )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_CNrec(CNREC2);
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVPrec(RADVPREC2);
        MAKET_RADVrec(RADVREC1);
        MAKET_NPrec(NPREC1);
        MAKET_WHPROrec(WHPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        hulpstree:=LDBLEX_read(auxkey('WAARRADVKEY'));
        RADVREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        RADVREC1:=RADVREC1tree^.ls^.RADVfield^;
        action121;
        action139;
        createSIG1;
        createT2;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((((SENTENCEREC1.DEIXIS =OMEGADEIXIS                      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC1.SUPERDEIXIS =CNREC1.SUPERDEIXIS          )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_CNrec(CNREC2);
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVPrec(RADVPREC2);
        MAKET_RADVrec(RADVREC1);
        MAKET_NPrec(NPREC1);
        MAKET_WHPROrec(WHPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        hulpstree:=LDBLEX_read(auxkey('WAARRADVKEY'));
        RADVREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        RADVREC1:=RADVREC1tree^.ls^.RADVfield^;
        action127;
        action139;
        createSIG1;
        createT2;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                       subrule0X6:=result
 END;
 FUNCTION subrule0X7 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT1_1,LrestT1_1,LfirstT1_1,LlastT1_1:LSSTREE_prelnode;
iT1_1:INTEGER;
nomoretreesT1_1,lastmatchT1_1:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createPUNCREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := PUNC;
          N^.ls^.PUNCfield^ := PUNCREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{PUNCREL}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=PUNCREL;
s:=PUNCREC1tree;
      relnode^.node:=s;
      END{PUNCREL};
                                                          BEGIN{createitem11}
    createPUNCREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
  PROCEDURE createT2;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := RADVP;
      N^.ls^.RADVPfield^ := RADVPREC2;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := RADV;
          N^.ls^.RADVfield^ := RADVREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{HEAD}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=HEAD;
s:=RADVREC1tree;
      relnode^.node:=s;
      END{HEAD};
                                                          BEGIN{createitem11}
    createHEAD(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{T2}
  s:=MAKET_stree(RADVP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T2:=s;
  END{T2};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>RADVP THEN
        match:=FALSE;
      IF match THEN
        RADVPREC1:=s^.ls^.RADVPfield^;
    END{MatchNode};
                                                          PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>CNVAR THEN
            match:=FALSE;
          IF match THEN
            CNVARREC1:=s^.ls^.CNVARfield^;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT1_1,LfirstT1_1,LrestT1_1,nomoretreesT1_1) END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n >=1) AND (s^.li^.n <=1);
        IF match THEN
          BEGIN
          lsrel1:=HEAD;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(s^.sons,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
          END;
IF match THEN matchlist1items(s^.sons,first,match);
    END;
                                                       BEGIN{07}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
                                                       subrule0X7:=result
 END;
 FUNCTION subrule0X8 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT1_1,LrestT1_1,LfirstT1_1,LlastT1_1:LSSTREE_prelnode;
iT1_1:INTEGER;
nomoretreesT1_1,lastmatchT1_1:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
  PROCEDURE createT2;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := RADVP;
      N^.ls^.RADVPfield^ := RADVPREC2;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := RADV;
          N^.ls^.RADVfield^ := RADVREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{HEAD}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=HEAD;
s:=RADVREC1tree;
      relnode^.node:=s;
      END{HEAD};
                                                          BEGIN{createitem11}
    createHEAD(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{T2}
  s:=MAKET_stree(RADVP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T2:=s;
  END{T2};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>RADVP THEN
        match:=FALSE;
      IF match THEN
        RADVPREC1:=s^.ls^.RADVPfield^;
    END{MatchNode};
                                                          PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>CNVAR THEN
            match:=FALSE;
          IF match THEN
            CNVARREC1:=s^.ls^.CNVARfield^;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT1_1,LfirstT1_1,LrestT1_1,nomoretreesT1_1) END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n >=1) AND (s^.li^.n <=1);
        IF match THEN
          BEGIN
          lsrel1:=HEAD;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(s^.sons,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
          END;
IF match THEN matchlist1items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION185;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION191;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
SENTENCEREC2.DEIXIS:=CNREC1.SUPERDEIXIS
                                                      ;
SENTENCEREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION197;
BEGIN
RADVPREC2.MOOD:=WH;
RADVPREC2.KINDEFS:=
[PK]                                                  ;RADVPREC2.RADVKEY:=
auxkey('WAARRADVKEY')                                 ;                                                     ;
CNREC2:=CNREC1;                                       ;
CNREC2.POSSGENI:=FALSE
                                                      ;
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
CNREC1loc:LSDOMAINT_CNVARrecord;
BEGIN
CNREC1loc:=COPYT_CNTOVAR(CNREC1);
result:=TRUE
AND
(CNVARREC1.req=CNREC1loc.req)AND
(CNVARREC1.env=CNREC1loc.env)AND
(CNVARREC1.superdeixis=CNREC1loc.superdeixis)AND
(CNVARREC1.class=CNREC1loc.class)AND
(CNVARREC1.deixis=CNREC1loc.deixis)AND
(CNVARREC1.aspect=CNREC1loc.aspect)AND
(CNVARREC1.retro=CNREC1loc.retro)AND
(CNVARREC1.definite=CNREC1loc.definite)AND
(CNVARREC1.numbers=CNREC1loc.numbers)AND
(CNVARREC1.genders=CNREC1loc.genders)AND
(CNVARREC1.sexes=CNREC1loc.sexes)AND
(CNVARREC1.actsubcs=CNREC1loc.actsubcs)AND
(CNVARREC1.temporal=CNREC1loc.temporal)AND
(CNVARREC1.possgeni=CNREC1loc.possgeni)AND
(CNVARREC1.animate=CNREC1loc.animate)AND
(CNVARREC1.human=CNREC1loc.human)AND
(CNVARREC1.posscomas=CNREC1loc.posscomas)AND
(CNVARREC1.thetanp=CNREC1loc.thetanp)AND
(CNVARREC1.nounpatternefs=CNREC1loc.nounpatternefs)
;except1:=result
END;
                                                       BEGIN{08}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF ((PK IN RADVPREC1.KINDEFS                               )
                                                      )
THEN IF
          ((RADVPREC1.RADVKEY =0                                  )
                                                      )
THEN IF
          ((RADVPREC1.MOOD =DECLXPMOOD                            )
                                                      )
THEN IF
          ((((CNVARREC1.INDEX =level                                )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((except1                                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((CNVARREC1.HUMAN<>YESHUMAN                             )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((CNVARREC1.CASES *[RCASE]                                               <>
[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      IF ((((SENTENCEREC1.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC1.DEIXIS =PRESENTDEIXIS                    )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((CNREC1.SUPERDEIXIS<>PRESENTDEIXIS                     )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((((SENTENCEREC1.DEIXIS =PASTDEIXIS                       )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((CNREC1.SUPERDEIXIS<>PASTDEIXIS                        )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_CNrec(CNREC2);
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVPrec(RADVPREC2);
        MAKET_RADVrec(RADVREC1);
        MAKET_NPrec(NPREC1);
        MAKET_WHPROrec(WHPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        hulpstree:=LDBLEX_read(auxkey('WAARRADVKEY'));
        RADVREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        RADVREC1:=RADVREC1tree^.ls^.RADVfield^;
        action185;
        action197;
        createSIG1;
        createT2;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((((SENTENCEREC1.DEIXIS =OMEGADEIXIS                      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC1.SUPERDEIXIS =CNREC1.SUPERDEIXIS          )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_CNrec(CNREC2);
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVPrec(RADVPREC2);
        MAKET_RADVrec(RADVREC1);
        MAKET_NPrec(NPREC1);
        MAKET_WHPROrec(WHPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        hulpstree:=LDBLEX_read(auxkey('WAARRADVKEY'));
        RADVREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        RADVREC1:=RADVREC1tree^.ls^.RADVfield^;
        action191;
        action197;
        createSIG1;
        createT2;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                       subrule0X8:=result
 END;
 FUNCTION subrule0X9 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT1_1,LrestT1_1,LfirstT1_1,LlastT1_1:LSSTREE_prelnode;
iT1_1:INTEGER;
nomoretreesT1_1,lastmatchT1_1:BOOLEAN;
LinitT1_2,LrestT1_2,LfirstT1_2,LlastT1_2:LSSTREE_prelnode;
iT1_2:INTEGER;
nomoretreesT1_2,lastmatchT1_2:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createPUNCREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := PUNC;
          N^.ls^.PUNCfield^ := PUNCREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{PUNCREL}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=PUNCREL;
s:=PUNCREC1tree;
      relnode^.node:=s;
      END{PUNCREL};
                                                          BEGIN{createitem11}
    createPUNCREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
  PROCEDURE createT2;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := RADVP;
      N^.ls^.RADVPfield^ := RADVPREC2;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := RADV;
          N^.ls^.RADVfield^ := RADVREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{HEAD}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=HEAD;
s:=RADVREC1tree;
      relnode^.node:=s;
      END{HEAD};
                                                          BEGIN{createitem11}
    createHEAD(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{T2}
  s:=MAKET_stree(RADVP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T2:=s;
  END{T2};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      lirel2:LIDOMAINT_synrel;
      lsrel2:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>VARPREPP THEN
        match:=FALSE;
      IF match THEN
        VARPREPPREC1:=s^.ls^.VARPREPPfield^;
    END{MatchNode};
                                                          PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PREP THEN
            match:=FALSE;
          IF match THEN
            PREPREC1:=s^.ls^.PREPfield^;
          IF match THEN match:=(s^.ls^.PREPfield^.key=auxkey('INPREPKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PREPREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT1_1) END;
                                                            PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
      PROCEDURE Match_OBJREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>CNVAR THEN
            match:=FALSE;
          IF match THEN
            CNVARREC1:=s^.ls^.CNVARfield^;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,OBJREL
,match,matchnode,matchlist0items,lastmatchT1_2) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_OBJREL,matchlist0items,
LlastT1_2,LfirstT1_2,LrestT1_2,nomoretreesT1_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastT1_1,LfirstT1_1,LrestT1_1,nomoretreesT1_1) END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n >=2) AND (s^.li^.n <=2);
        IF match THEN
          BEGIN
          lsrel1:=HEAD;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lsrel2:=OBJREL;
          lirel2:= loopholes.retype(lsrel2,LIDOMAINT_synrel);
          lisons:=loopholes.retype(s^.sons,LISTREE_pRelnode);
          match:= LIMATCHES_TEST2rels(lirel1,lirel2,lisons,FALSE);
          END;
IF match THEN matchlist2items(s^.sons,first,match);
    END;
                                                       BEGIN{09}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
                                                       subrule0X9:=result
 END;
 FUNCTION subrule0X10 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT1_1,LrestT1_1,LfirstT1_1,LlastT1_1:LSSTREE_prelnode;
iT1_1:INTEGER;
nomoretreesT1_1,lastmatchT1_1:BOOLEAN;
LinitT1_2,LrestT1_2,LfirstT1_2,LlastT1_2:LSSTREE_prelnode;
iT1_2:INTEGER;
nomoretreesT1_2,lastmatchT1_2:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
  PROCEDURE createT2;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := RADVP;
      N^.ls^.RADVPfield^ := RADVPREC2;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := RADV;
          N^.ls^.RADVfield^ := RADVREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{HEAD}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=HEAD;
s:=RADVREC1tree;
      relnode^.node:=s;
      END{HEAD};
                                                          BEGIN{createitem11}
    createHEAD(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{T2}
  s:=MAKET_stree(RADVP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T2:=s;
  END{T2};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      lirel2:LIDOMAINT_synrel;
      lsrel2:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>VARPREPP THEN
        match:=FALSE;
      IF match THEN
        VARPREPPREC1:=s^.ls^.VARPREPPfield^;
    END{MatchNode};
                                                          PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PREP THEN
            match:=FALSE;
          IF match THEN
            PREPREC1:=s^.ls^.PREPfield^;
          IF match THEN match:=(s^.ls^.PREPfield^.key=auxkey('INPREPKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PREPREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT1_1) END;
                                                            PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
      PROCEDURE Match_OBJREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>CNVAR THEN
            match:=FALSE;
          IF match THEN
            CNVARREC1:=s^.ls^.CNVARfield^;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,OBJREL
,match,matchnode,matchlist0items,lastmatchT1_2) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_OBJREL,matchlist0items,
LlastT1_2,LfirstT1_2,LrestT1_2,nomoretreesT1_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastT1_1,LfirstT1_1,LrestT1_1,nomoretreesT1_1) END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n >=2) AND (s^.li^.n <=2);
        IF match THEN
          BEGIN
          lsrel1:=HEAD;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lsrel2:=OBJREL;
          lirel2:= loopholes.retype(lsrel2,LIDOMAINT_synrel);
          lisons:=loopholes.retype(s^.sons,LISTREE_pRelnode);
          match:= LIMATCHES_TEST2rels(lirel1,lirel2,lisons,FALSE);
          END;
IF match THEN matchlist2items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION237;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION243;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
SENTENCEREC2.DEIXIS:=CNREC1.SUPERDEIXIS
                                                      ;
SENTENCEREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION253;
BEGIN
RADVPREC2.KINDEFS:=[LK]                                                  ;
RADVPREC2.MOOD:=WH
                                                      ;
RADVPREC2.RADVKEY:=auxkey('WAARRADVKEY')                                 ;
CNREC2:=CNREC1;                                       ;
CNREC2.POSSGENI:=FALSE
                                                      ;
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
CNREC1loc:LSDOMAINT_CNVARrecord;
BEGIN
CNREC1loc:=COPYT_CNTOVAR(CNREC1);
result:=TRUE
AND
(CNVARREC1.req=CNREC1loc.req)AND
(CNVARREC1.env=CNREC1loc.env)AND
(CNVARREC1.superdeixis=CNREC1loc.superdeixis)AND
(CNVARREC1.class=CNREC1loc.class)AND
(CNVARREC1.deixis=CNREC1loc.deixis)AND
(CNVARREC1.aspect=CNREC1loc.aspect)AND
(CNVARREC1.retro=CNREC1loc.retro)AND
(CNVARREC1.definite=CNREC1loc.definite)AND
(CNVARREC1.numbers=CNREC1loc.numbers)AND
(CNVARREC1.genders=CNREC1loc.genders)AND
(CNVARREC1.sexes=CNREC1loc.sexes)AND
(CNVARREC1.actsubcs=CNREC1loc.actsubcs)AND
(CNVARREC1.temporal=CNREC1loc.temporal)AND
(CNVARREC1.possgeni=CNREC1loc.possgeni)AND
(CNVARREC1.animate=CNREC1loc.animate)AND
(CNVARREC1.human=CNREC1loc.human)AND
(CNVARREC1.posscomas=CNREC1loc.posscomas)AND
(CNVARREC1.thetanp=CNREC1loc.thetanp)AND
(CNVARREC1.nounpatternefs=CNREC1loc.nounpatternefs)
;except1:=result
END;
                                                       BEGIN{010}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF (((VARPREPPREC1.MOOD=RELATIVEXPMOOD) AND 
          (VARPREPPREC1.ACTSUBCEFS=PREPREC1.SUBCS) AND 
                    (VARPREPPREC1.THETAPP=PREPREC1.THETAPP) AND 
                    (VARPREPPREC1.HEADKEY=PREPREC1.KEY) AND 
                    (VARPREPPREC1.CLASS=PREPREC1.CLASS) AND 
                    (VARPREPPREC1.DEIXIS=PREPREC1.DEIXIS) AND 
                    (VARPREPPREC1.ASPECT=PREPREC1.ASPECT) AND 
                    (VARPREPPREC1.RETRO=PREPREC1.RETRO) AND 
                    (VARPREPPREC1.RADVKEY=0) AND 
          (VARPREPPREC1.SPECQ=YESSPEC) AND 
          TRUE
                                                      )
                                                      )
THEN IF
          ((VARPREPPREC1.SYNPPEFS *PREPREC1.SYNPPS<>[]                                                    )
                                                      )
THEN IF
          ((((CNVARREC1.INDEX =level                                )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((except1                                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((CNVARREC1.HUMAN<>YESHUMAN                             )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((CNVARREC1.CASES *[ACCUSATIVE]                                          <>
[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      IF ((((SENTENCEREC1.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC1.DEIXIS =PRESENTDEIXIS                    )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((CNREC1.SUPERDEIXIS<>PRESENTDEIXIS                     )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((((SENTENCEREC1.DEIXIS =PASTDEIXIS                       )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((CNREC1.SUPERDEIXIS<>PASTDEIXIS                        )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_CNrec(CNREC2);
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVPrec(RADVPREC2);
        MAKET_RADVrec(RADVREC1);
        MAKET_NPrec(NPREC1);
        MAKET_WHPROrec(WHPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        hulpstree:=LDBLEX_read(auxkey('WAARRADVKEY'));
        RADVREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        RADVREC1:=RADVREC1tree^.ls^.RADVfield^;
        action237;
        action253;
        createSIG1;
        createT2;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((((SENTENCEREC1.DEIXIS =OMEGADEIXIS                      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC1.SUPERDEIXIS =CNREC1.SUPERDEIXIS          )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_CNrec(CNREC2);
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVPrec(RADVPREC2);
        MAKET_RADVrec(RADVREC1);
        MAKET_NPrec(NPREC1);
        MAKET_WHPROrec(WHPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        hulpstree:=LDBLEX_read(auxkey('WAARRADVKEY'));
        RADVREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        RADVREC1:=RADVREC1tree^.ls^.RADVfield^;
        action243;
        action253;
        createSIG1;
        createT2;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                       subrule0X10:=result
 END;
 FUNCTION subrule0X11 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT1_1,LrestT1_1,LfirstT1_1,LlastT1_1:LSSTREE_prelnode;
iT1_1:INTEGER;
nomoretreesT1_1,lastmatchT1_1:BOOLEAN;
LinitT1_2,LrestT1_2,LfirstT1_2,LlastT1_2:LSSTREE_prelnode;
iT1_2:INTEGER;
nomoretreesT1_2,lastmatchT1_2:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createPUNCREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := PUNC;
          N^.ls^.PUNCfield^ := PUNCREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{PUNCREL}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=PUNCREL;
s:=PUNCREC1tree;
      relnode^.node:=s;
      END{PUNCREL};
                                                          BEGIN{createitem11}
    createPUNCREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
  PROCEDURE createT2;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := PREPP;
      N^.ls^.PREPPfield^ := PREPPREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := PREP;
          N^.ls^.PREPfield^ := PREPREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{HEAD}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=HEAD;
s:=PREPREC1tree;
      relnode^.node:=s;
      END{HEAD};
                                                          BEGIN{createitem11}
    createHEAD(list);
    END;
    PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createOBJREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := NP;
          N^.ls^.NPfield^ := NPREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        VAR list:LSMRUQUO_ListOfStrees;
        PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
          PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
          VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
           list1:LSMRUQUO_ListOfStrees;
            PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
            BEGIN{CreateNode}
              N^.ls^.cat := WHPRO;
              N^.ls^.WHPROfield^ := WHPROREC1;
            END{CreateNode};
                                                                  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
            VAR list:LSMRUQUO_ListOfStrees;
            PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
              PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
              VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
               list1:LSMRUQUO_ListOfStrees;
                PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
                BEGIN{CreateNode}
                  N^.ls^.cat := BWHPRO;
                  N^.ls^.BWHPROfield^ := BWHPROREC1;
                END{CreateNode};
                                                                      PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
                BEGIN
                wholelist.first:=NIL;wholelist.last:=NIL;
                END;
                                                                    BEGIN{HEAD}
              LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
              list.first:=relnode;
              list.last:=relnode;
              relnode^.relation:=HEAD;
s:=BWHPROREC1tree;
              relnode^.node:=s;
              END{HEAD};
                                                                  BEGIN{createitem21}
            createHEAD(list);
            END;
            BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem21);
            END{createlist1};
                                                                BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,WHPRO,createnode,createlist1);
          END{HEAD};
                                                              BEGIN{createitem21}
        createHEAD(list);
        END;
        BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem21);
        END{createlist1};
                                                            BEGIN{OBJREL}
LSMATCHES_createitem(list,OBJREL,NP,createnode,createlist1);
      END{OBJREL};
                                                          BEGIN{createitem12}
    createOBJREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist2items11(wholelist,createitem11,createitem12);
    END{createlist1};
                                                        BEGIN{T2}
  s:=MAKET_stree(PREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T2:=s;
  END{T2};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      lirel2:LIDOMAINT_synrel;
      lsrel2:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>VARPREPP THEN
        match:=FALSE;
      IF match THEN
        VARPREPPREC1:=s^.ls^.VARPREPPfield^;
    END{MatchNode};
                                                          PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PREP THEN
            match:=FALSE;
          IF match THEN
            PREPREC1:=s^.ls^.PREPfield^;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PREPREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT1_1) END;
                                                            PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
      PROCEDURE Match_OBJREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>CNVAR THEN
            match:=FALSE;
          IF match THEN
            CNVARREC1:=s^.ls^.CNVARfield^;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,OBJREL
,match,matchnode,matchlist0items,lastmatchT1_2) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_OBJREL,matchlist0items,
LlastT1_2,LfirstT1_2,LrestT1_2,nomoretreesT1_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastT1_1,LfirstT1_1,LrestT1_1,nomoretreesT1_1) END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n >=2) AND (s^.li^.n <=2);
        IF match THEN
          BEGIN
          lsrel1:=HEAD;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lsrel2:=OBJREL;
          lirel2:= loopholes.retype(lsrel2,LIDOMAINT_synrel);
          lisons:=loopholes.retype(s^.sons,LISTREE_pRelnode);
          match:= LIMATCHES_TEST2rels(lirel1,lirel2,lisons,FALSE);
          END;
IF match THEN matchlist2items(s^.sons,first,match);
    END;
                                                       BEGIN{011}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
                                                       subrule0X11:=result
 END;
 FUNCTION subrule0X12 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT1_1,LrestT1_1,LfirstT1_1,LlastT1_1:LSSTREE_prelnode;
iT1_1:INTEGER;
nomoretreesT1_1,lastmatchT1_1:BOOLEAN;
LinitT1_2,LrestT1_2,LfirstT1_2,LlastT1_2:LSSTREE_prelnode;
iT1_2:INTEGER;
nomoretreesT1_2,lastmatchT1_2:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
  PROCEDURE createT2;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := PREPP;
      N^.ls^.PREPPfield^ := PREPPREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := PREP;
          N^.ls^.PREPfield^ := PREPREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{HEAD}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=HEAD;
s:=PREPREC1tree;
      relnode^.node:=s;
      END{HEAD};
                                                          BEGIN{createitem11}
    createHEAD(list);
    END;
    PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createOBJREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := NP;
          N^.ls^.NPfield^ := NPREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        VAR list:LSMRUQUO_ListOfStrees;
        PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
          PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
          VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
           list1:LSMRUQUO_ListOfStrees;
            PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
            BEGIN{CreateNode}
              N^.ls^.cat := WHPRO;
              N^.ls^.WHPROfield^ := WHPROREC1;
            END{CreateNode};
                                                                  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
            VAR list:LSMRUQUO_ListOfStrees;
            PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
              PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
              VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
               list1:LSMRUQUO_ListOfStrees;
                PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
                BEGIN{CreateNode}
                  N^.ls^.cat := BWHPRO;
                  N^.ls^.BWHPROfield^ := BWHPROREC1;
                END{CreateNode};
                                                                      PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
                BEGIN
                wholelist.first:=NIL;wholelist.last:=NIL;
                END;
                                                                    BEGIN{HEAD}
              LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
              list.first:=relnode;
              list.last:=relnode;
              relnode^.relation:=HEAD;
s:=BWHPROREC1tree;
              relnode^.node:=s;
              END{HEAD};
                                                                  BEGIN{createitem21}
            createHEAD(list);
            END;
            BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem21);
            END{createlist1};
                                                                BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,WHPRO,createnode,createlist1);
          END{HEAD};
                                                              BEGIN{createitem21}
        createHEAD(list);
        END;
        BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem21);
        END{createlist1};
                                                            BEGIN{OBJREL}
LSMATCHES_createitem(list,OBJREL,NP,createnode,createlist1);
      END{OBJREL};
                                                          BEGIN{createitem12}
    createOBJREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist2items11(wholelist,createitem11,createitem12);
    END{createlist1};
                                                        BEGIN{T2}
  s:=MAKET_stree(PREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T2:=s;
  END{T2};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      lirel2:LIDOMAINT_synrel;
      lsrel2:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>VARPREPP THEN
        match:=FALSE;
      IF match THEN
        VARPREPPREC1:=s^.ls^.VARPREPPfield^;
    END{MatchNode};
                                                          PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PREP THEN
            match:=FALSE;
          IF match THEN
            PREPREC1:=s^.ls^.PREPfield^;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PREPREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT1_1) END;
                                                            PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
      PROCEDURE Match_OBJREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>CNVAR THEN
            match:=FALSE;
          IF match THEN
            CNVARREC1:=s^.ls^.CNVARfield^;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,OBJREL
,match,matchnode,matchlist0items,lastmatchT1_2) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_OBJREL,matchlist0items,
LlastT1_2,LfirstT1_2,LrestT1_2,nomoretreesT1_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastT1_1,LfirstT1_1,LrestT1_1,nomoretreesT1_1) END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n >=2) AND (s^.li^.n <=2);
        IF match THEN
          BEGIN
          lsrel1:=HEAD;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lsrel2:=OBJREL;
          lirel2:= loopholes.retype(lsrel2,LIDOMAINT_synrel);
          lisons:=loopholes.retype(s^.sons,LISTREE_pRelnode);
          match:= LIMATCHES_TEST2rels(lirel1,lirel2,lisons,FALSE);
          END;
IF match THEN matchlist2items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION297;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION303;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
SENTENCEREC2.DEIXIS:=CNREC1.SUPERDEIXIS
                                                      ;
SENTENCEREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION315;
BEGIN
PREPPREC1:=VARPREPPREC1;                              ;
PREPPREC1.MOOD:=WH
                                                      ;
WHPROREC1:=COPYT_BWHPROTOWHPRO(BWHPROREC1);           ;
NPREC1.DEFINITE:=INDEF;
NPREC1.NUMBER:=WHPROREC1.NUMBER;
NPREC1.CASES:=
[ACCUSATIVE]                                          ;NPREC1.SEXES:=WHPROREC1.SEXES;
NPREC1.ANIMATE:=WHPROREC1.ANIMATE;
NPREC1.HUMAN:=YESHUMAN;
NPREC1.MOOD:=WH;
NPREC1.GENERIC:=OMEGAGENERIC;
NPREC1.POSSRFORM:=WHPROREC1.POSSRFORM;
NPREC1.SYNTQUANT:=OMEGAQUANT;
NPREC1.SPECQ:=YESSPEC;
NPREC1.POSSPRED:=TRUE;
                                                      ;
CNREC2:=CNREC1;                                       ;
CNREC2.POSSGENI:=FALSE
                                                      ;
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
CNREC1loc:LSDOMAINT_CNVARrecord;
BEGIN
CNREC1loc:=COPYT_CNTOVAR(CNREC1);
result:=TRUE
AND
(CNVARREC1.req=CNREC1loc.req)AND
(CNVARREC1.env=CNREC1loc.env)AND
(CNVARREC1.superdeixis=CNREC1loc.superdeixis)AND
(CNVARREC1.class=CNREC1loc.class)AND
(CNVARREC1.deixis=CNREC1loc.deixis)AND
(CNVARREC1.aspect=CNREC1loc.aspect)AND
(CNVARREC1.retro=CNREC1loc.retro)AND
(CNVARREC1.definite=CNREC1loc.definite)AND
(CNVARREC1.numbers=CNREC1loc.numbers)AND
(CNVARREC1.genders=CNREC1loc.genders)AND
(CNVARREC1.sexes=CNREC1loc.sexes)AND
(CNVARREC1.actsubcs=CNREC1loc.actsubcs)AND
(CNVARREC1.temporal=CNREC1loc.temporal)AND
(CNVARREC1.possgeni=CNREC1loc.possgeni)AND
(CNVARREC1.animate=CNREC1loc.animate)AND
(CNVARREC1.human=CNREC1loc.human)AND
(CNVARREC1.posscomas=CNREC1loc.posscomas)AND
(CNVARREC1.thetanp=CNREC1loc.thetanp)AND
(CNVARREC1.nounpatternefs=CNREC1loc.nounpatternefs)
;except1:=result
END;
                                                       BEGIN{012}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF ((((CNVARREC1.INDEX =level                                )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((except1                                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((CNVARREC1.HUMAN =YESHUMAN                             )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((CNVARREC1.CASES *[RCASE]                                                =
[]                                                    )
                                                      )
                                                      )
                                                      )
THEN IF
          ((VARPREPPREC1.MOOD =RELATIVEXPMOOD                     )
                                                      )
                                                       THEN
      BEGIN
      IF ((((SENTENCEREC1.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC1.DEIXIS =PRESENTDEIXIS                    )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((CNREC1.SUPERDEIXIS<>PRESENTDEIXIS                     )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((((SENTENCEREC1.DEIXIS =PASTDEIXIS                       )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((CNREC1.SUPERDEIXIS<>PASTDEIXIS                        )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_CNrec(CNREC2);
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVPrec(RADVPREC2);
        MAKET_RADVrec(RADVREC1);
        MAKET_NPrec(NPREC1);
        MAKET_WHPROrec(WHPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        hulpstree:=LDBLEX_read(auxkey('WIEMSGWHPROKEY'));
        BWHPROREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        BWHPROREC1:=BWHPROREC1tree^.ls^.BWHPROfield^;
        action297;
        action315;
        createSIG1;
        createT2;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((((SENTENCEREC1.DEIXIS =OMEGADEIXIS                      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC1.SUPERDEIXIS =CNREC1.SUPERDEIXIS          )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_CNrec(CNREC2);
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVPrec(RADVPREC2);
        MAKET_RADVrec(RADVREC1);
        MAKET_NPrec(NPREC1);
        MAKET_WHPROrec(WHPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        hulpstree:=LDBLEX_read(auxkey('WIEMSGWHPROKEY'));
        BWHPROREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        BWHPROREC1:=BWHPROREC1tree^.ls^.BWHPROfield^;
        action303;
        action315;
        createSIG1;
        createT2;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                       subrule0X12:=result
 END;
 FUNCTION subrule0X13 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT1_1,LrestT1_1,LfirstT1_1,LlastT1_1:LSSTREE_prelnode;
iT1_1:INTEGER;
nomoretreesT1_1,lastmatchT1_1:BOOLEAN;
LinitT1_2,LrestT1_2,LfirstT1_2,LlastT1_2:LSSTREE_prelnode;
iT1_2:INTEGER;
nomoretreesT1_2,lastmatchT1_2:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
  PROCEDURE createT2;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := RELPRO;
      N^.ls^.RELPROfield^ := RELPROREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T2}
s:=RELPROREC1tree;
  T2:=s;
  END{T2};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      lirel2:LIDOMAINT_synrel;
      lsrel2:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>VARPREPP THEN
        match:=FALSE;
      IF match THEN
        VARPREPPREC1:=s^.ls^.VARPREPPfield^;
    END{MatchNode};
                                                          PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PREP THEN
            match:=FALSE;
          IF match THEN
            PREPREC1:=s^.ls^.PREPfield^;
          IF match THEN match:=(s^.ls^.PREPfield^.key=auxkey('S_PREP1243607'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PREPREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT1_1) END;
                                                            PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
      PROCEDURE Match_OBJREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>CNVAR THEN
            match:=FALSE;
          IF match THEN
            CNVARREC1:=s^.ls^.CNVARfield^;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,OBJREL
,match,matchnode,matchlist0items,lastmatchT1_2) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_OBJREL,matchlist0items,
LlastT1_2,LfirstT1_2,LrestT1_2,nomoretreesT1_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastT1_1,LfirstT1_1,LrestT1_1,nomoretreesT1_1) END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n >=2) AND (s^.li^.n <=2);
        IF match THEN
          BEGIN
          lsrel1:=HEAD;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lsrel2:=OBJREL;
          lirel2:= loopholes.retype(lsrel2,LIDOMAINT_synrel);
          lisons:=loopholes.retype(s^.sons,LISTREE_pRelnode);
          match:= LIMATCHES_TEST2rels(lirel1,lirel2,lisons,FALSE);
          END;
IF match THEN matchlist2items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION340;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION344;
BEGIN
CNREC2:=CNREC1;                                       ;
CNREC2.POSSGENI:=FALSE
                                                      ;
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
CNREC1loc:LSDOMAINT_CNVARrecord;
BEGIN
CNREC1loc:=COPYT_CNTOVAR(CNREC1);
result:=TRUE
AND
(CNVARREC1.req=CNREC1loc.req)AND
(CNVARREC1.env=CNREC1loc.env)AND
(CNVARREC1.superdeixis=CNREC1loc.superdeixis)AND
(CNVARREC1.class=CNREC1loc.class)AND
(CNVARREC1.deixis=CNREC1loc.deixis)AND
(CNVARREC1.aspect=CNREC1loc.aspect)AND
(CNVARREC1.retro=CNREC1loc.retro)AND
(CNVARREC1.definite=CNREC1loc.definite)AND
(CNVARREC1.numbers=CNREC1loc.numbers)AND
(CNVARREC1.genders=CNREC1loc.genders)AND
(CNVARREC1.sexes=CNREC1loc.sexes)AND
(CNVARREC1.actsubcs=CNREC1loc.actsubcs)AND
(CNVARREC1.temporal=CNREC1loc.temporal)AND
(CNVARREC1.possgeni=CNREC1loc.possgeni)AND
(CNVARREC1.animate=CNREC1loc.animate)AND
(CNVARREC1.human=CNREC1loc.human)AND
(CNVARREC1.posscomas=CNREC1loc.posscomas)AND
(CNVARREC1.thetanp=CNREC1loc.thetanp)AND
(CNVARREC1.nounpatternefs=CNREC1loc.nounpatternefs)
;except1:=result
END;
                                                       BEGIN{013}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF (((VARPREPPREC1.MOOD=RELATIVEXPMOOD) AND 
          (VARPREPPREC1.ACTSUBCEFS=PREPREC1.SUBCS) AND 
                    (VARPREPPREC1.THETAPP=PREPREC1.THETAPP) AND 
                    (VARPREPPREC1.HEADKEY=PREPREC1.KEY) AND 
                    (VARPREPPREC1.CLASS=PREPREC1.CLASS) AND 
                    (VARPREPPREC1.DEIXIS=PREPREC1.DEIXIS) AND 
                    (VARPREPPREC1.ASPECT=PREPREC1.ASPECT) AND 
                    (VARPREPPREC1.RETRO=PREPREC1.RETRO) AND 
                    (VARPREPPREC1.RADVKEY=0) AND 
          (VARPREPPREC1.SPECQ=YESSPEC) AND 
          TRUE
                                                      )
                                                      )
THEN IF
          ((VARPREPPREC1.SYNPPEFS *PREPREC1.SYNPPS<>[]                                                    )
                                                      )
THEN IF
          ((((CNVARREC1.INDEX =level                                )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((except1                                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((CNREC1.TEMPORAL =TRUE                                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((CNVARREC1.CASES *[ACCUSATIVE]                                          <>
[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      IF ((((SENTENCEREC1.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC1.DEIXIS<>OMEGADEIXIS                      )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_CNrec(CNREC2);
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVPrec(RADVPREC2);
        MAKET_RADVrec(RADVREC1);
        MAKET_NPrec(NPREC1);
        MAKET_WHPROrec(WHPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        hulpstree:=LDBLEX_read(auxkey('DATRELPROKEY'));
        RELPROREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        RELPROREC1:=RELPROREC1tree^.ls^.RELPROfield^;
        action340;
        action344;
        createSIG1;
        createT2;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                       subrule0X13:=result
 END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
m2:=loopholes.retype(Is2,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
  BEGIN
    MatchModel2(m2,TRUE,match);
    If match Then
    BEGIN
    LISTREE_mergesetsofstrees(subrule0X2,result);
    LISTREE_mergesetsofstrees(subrule0X3,result);
    LISTREE_mergesetsofstrees(subrule0X4,result);
    LISTREE_mergesetsofstrees(subrule0X5,result);
    LISTREE_mergesetsofstrees(subrule0X6,result);
    LISTREE_mergesetsofstrees(subrule0X7,result);
    LISTREE_mergesetsofstrees(subrule0X8,result);
    LISTREE_mergesetsofstrees(subrule0X9,result);
    LISTREE_mergesetsofstrees(subrule0X10,result);
    LISTREE_mergesetsofstrees(subrule0X11,result);
    LISTREE_mergesetsofstrees(subrule0X12,result);
    LISTREE_mergesetsofstrees(subrule0X13,result);
 END;
    END;
COMRCNMODRELSENT1:=result
END;
{:RCNMODRELSENT1}
{rule:}
{:RNONCNMODRELSENT1}
 FUNCTION COMRNONCNMODRELSENT1(LEVEL:INTEGER;
Is1:LISTREE_pStree;Is2:LISTREE_pStree
):LISTREE_SetOfStrees;
VAR result:LISTREE_SetOfStrees;
 wbonus,sbonus:INTEGER;
 m:LSSTREE_pstree;
 Is:LISTREE_pstree;
 setofstrees:LISTREE_setofstrees;
 first:BOOLEAN;
 match:BOOLEAN;
 idargs:LIIDDICT_idargs;
dtree:HYPERDTREE_phyperdtree;
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
LinitM1_1,LrestM1_1,LfirstM1_1,LlastM1_1:LSSTREE_prelnode;
iM1_1:INTEGER;
nomoretreesM1_1,lastmatchM1_1:BOOLEAN;
LinitM2_1,LrestM2_1,LfirstM2_1,LlastM2_1:LSSTREE_prelnode;
iM2_1:INTEGER;
nomoretreesM2_1,lastmatchM2_1:BOOLEAN;
LinitM2_2,LrestM2_2,LfirstM2_2,LlastM2_2:LSSTREE_prelnode;
iM2_2:INTEGER;
nomoretreesM2_2,lastmatchM2_2:BOOLEAN;
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
T2:LSSTREE_pStree;
T4:LSSTREE_pStree;
T3:LSSTREE_pStree;
PREPREC1tree:LSSTREE_pStree;
PUNCREC3tree:LSSTREE_pStree;
PUNCREC4tree:LSSTREE_pStree;
T1:LSSTREE_pStree;
PUNCREC1tree:LSSTREE_pStree;
PUNCREC2tree:LSSTREE_pStree;
RELPROREC1tree:LSSTREE_pStree;
BWHPROREC1tree:LSSTREE_pStree;
RADVREC1tree:LSSTREE_pStree;
MU2:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
SIG1:LSMRUQUO_ListOfStrees;
SIG2:LSMRUQUO_ListOfStrees;
PUNCREC4:LSDOMAINT_PUNCrecord;
PUNCREC3:LSDOMAINT_PUNCrecord;
PREPREC1:LSDOMAINT_PREPrecord;
RADVPREC1:LSDOMAINT_RADVPrecord;
VARPREPPREC1:LSDOMAINT_PREPPrecord;
INDEFPROREC1:LSDOMAINT_INDEFPROrecord;
NPVARREC1:LSDOMAINT_NPVARrecord;
PROPERNOUNREC1:LSDOMAINT_PROPERNOUNrecord;
SENTENCEREC1:LSDOMAINT_SENTENCErecord;
NPREC1:LSDOMAINT_NPrecord;
SENTENCEREC2:LSDOMAINT_SENTENCErecord;
PUNCREC1:LSDOMAINT_PUNCrecord;
PUNCREC2:LSDOMAINT_PUNCrecord;
RELPROREC1:LSDOMAINT_RELPROrecord;
BWHPROREC1:LSDOMAINT_BWHPROrecord;
PREPPREC1:LSDOMAINT_PREPPrecord;
RADVREC1:LSDOMAINT_RADVrecord;
FUNCTION matchcondI5:BOOLEAN;
                                                      BEGIN
matchcondI5:=FALSE;
  IF
(((SENTENCEREC2.MOOD=RELATIVE) AND 
          (SENTENCEREC2.SENTTYPE=SUBORDINATECLAUSE) AND 
          (SENTENCEREC2.FINITENESS=FINITE) AND 
          TRUE
                                                      )
                                                      )
                                                      THEN 
matchcondI5:=TRUE;

END;{matchcondI5}
FUNCTION matchcondI4:BOOLEAN;
FUNCTION ALL1(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
lastmatch:BOOLEAN;
      match:Boolean;
PROCEDURE Match_PUNCREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR matchcond:BOOLEAN;
  Stree:LSSTREE_pStree;
  lisons:LISTREE_pRelnode;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>PUNC THEN
      match:=FALSE;
    IF match THEN
      PUNCREC4:=s^.ls^.PUNCfield^;
    IF match THEN match:=(s^.ls^.PUNCfield^.key=auxkey('KOMMAPUNCKEY'));
  END{MatchNode};
                                                      BEGIN{MatchTree}
        PUNCREC4tree:=Lfirst^.node;
      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PUNCREL
,match,matchnode,matchlist0items,lastmatch) END;
                                                        BEGIN{All1}
    next:=mu.first;match:=TRUE;
    IF next =NIL THEN
      ALL1:=TRUE
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND (match) DO
      BEGIN
        match_PUNCREL(next,next,TRUE,match);
        next:=next^.brother;
      END;
      IF match THEN
      BEGIN
        match_PUNCREL(next,mu.last,TRUE,match);
        ALL1:=match;
      END
      ELSE
        ALL1:=FALSE;
    END;
  END;{All}
                                                      BEGIN
matchcondI4:=FALSE;
  IF
((ALL1(SIG2)                                            )
                                                      )
                                                      THEN 
matchcondI4:=TRUE;

END;{matchcondI4}
FUNCTION matchcondI3:BOOLEAN;
FUNCTION ALL1(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
lastmatch:BOOLEAN;
      match:Boolean;
PROCEDURE Match_PUNCREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR matchcond:BOOLEAN;
  Stree:LSSTREE_pStree;
  lisons:LISTREE_pRelnode;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>PUNC THEN
      match:=FALSE;
    IF match THEN
      PUNCREC3:=s^.ls^.PUNCfield^;
    IF match THEN match:=(s^.ls^.PUNCfield^.key=auxkey('KOMMAPUNCKEY'));
  END{MatchNode};
                                                      BEGIN{MatchTree}
        PUNCREC3tree:=Lfirst^.node;
      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PUNCREL
,match,matchnode,matchlist0items,lastmatch) END;
                                                        BEGIN{All1}
    next:=mu.first;match:=TRUE;
    IF next =NIL THEN
      ALL1:=TRUE
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND (match) DO
      BEGIN
        match_PUNCREL(next,next,TRUE,match);
        next:=next^.brother;
      END;
      IF match THEN
      BEGIN
        match_PUNCREL(next,mu.last,TRUE,match);
        ALL1:=match;
      END
      ELSE
        ALL1:=FALSE;
    END;
  END;{All}
                                                      BEGIN
matchcondI3:=FALSE;
  IF
((ALL1(SIG1)                                            )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
(((SENTENCEREC1.MOOD=RELATIVE) AND 
          (SENTENCEREC1.SENTTYPE=SUBORDINATECLAUSE) AND 
          (SENTENCEREC1.FINITENESS=FINITE) AND 
          TRUE
                                                      )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
((T2^.CAT IN [PROPERNOUN,
INDEFPRO,
PERSPRO]                                              )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

END;{matchcondI1}
                                                      PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>NP THEN
      match:=FALSE;
    IF match THEN
      NPREC1:=s^.ls^.NPfield^;
  END{MatchNode};
                                                        PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR
    itemmatch,listmatch:Boolean;
    PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeConVar(Lfirst,Llast,first,HEAD,T2,match,matchcondI1,lastmatchM1_1);
END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM1_1,LfirstM1_1,LrestM1_1,nomoretreesM1_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1) AND (s^.li^.n <=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist1items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>SENTENCE THEN
      match:=FALSE;
    IF match THEN
      SENTENCEREC1:=s^.ls^.SENTENCEfield^;
    IF match THEN
      match:= matchcondI2;
  END{MatchNode};
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    PROCEDURE Match_SHIFTREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeVar(Lfirst,Llast,first,SHIFTREL,T4,match,lastmatchM2_1);
END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_SHIFTREL(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_MU2(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU2.first:=Lfirst;
        MU2.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU2(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_RMfirst(L,match,item1,LfirstM2_1,LlastM2_1
,item2,LfirstM2_2,LlastM2_2
) ELSE match_SHIFTREL(LfirstM2_1,LfirstM2_1,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,SHIFTREL,match,matchnode,matchlist2items,lastmatch) END;
                                                      PROCEDURE createM;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := NP;
    N^.ls^.NPfield^ := NPREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      BEGIN
      wholelist.first:=NIL;wholelist.last:=NIL;
      END;
                                                          BEGIN{HEAD}
LSMATCHES_createitemVar(list,HEAD,T2);
    END{HEAD};
                                                        BEGIN{createitem11}
  createHEAD(list);
  END;
  PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createSIG1(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{SIG1}
    copylist(SIG1,list);
    END{SIG1};
                                                        BEGIN{createitem12}
  createSIG1(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createPOSTMODREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := SENTENCE;
        N^.ls^.SENTENCEfield^ := SENTENCEREC2;
      END{CreateNode};
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      VAR list:LSMRUQUO_ListOfStrees;
      PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createSHIFTREL(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          BEGIN
          wholelist.first:=NIL;wholelist.last:=NIL;
          END;
                                                              BEGIN{SHIFTREL}
LSMATCHES_createitemVar(list,SHIFTREL,T1);
        END{SHIFTREL};
                                                            BEGIN{createitem11}
      createSHIFTREL(list);
      END;
      PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU2}
        copylist(MU2,list);
        END{MU2};
                                                            BEGIN{createitem12}
      createMU2(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist2items10(wholelist,createitem11,createitem12);
      END{createlist1};
                                                          BEGIN{POSTMODREL}
LSMATCHES_createitem(list,POSTMODREL,SENTENCE,createnode,createlist1);
    END{POSTMODREL};
                                                        BEGIN{createitem13}
  createPOSTMODREL(list);
  END;
  PROCEDURE createitem14(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createSIG2(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{SIG2}
    copylist(SIG2,list);
    END{SIG2};
                                                        BEGIN{createitem14}
  createSIG2(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist4items1010(wholelist,createitem11,createitem12,createitem13,createitem14);
  END{createlist1};
                                                      BEGIN{createM}
m:=MAKET_stree(NP);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                       FUNCTION subrule0X1 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
FUNCTION MATCHCONDT4:BOOLEAN;
BEGIN MATCHCONDT4:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createPUNCREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := PUNC;
          N^.ls^.PUNCfield^ := PUNCREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{PUNCREL}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=PUNCREL;
s:=PUNCREC1tree;
      relnode^.node:=s;
      END{PUNCREL};
                                                          BEGIN{createitem11}
    createPUNCREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
  PROCEDURE createSIG2;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createPUNCREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := PUNC;
          N^.ls^.PUNCfield^ := PUNCREC2;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{PUNCREL}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=PUNCREL;
s:=PUNCREC2tree;
      relnode^.node:=s;
      END{PUNCREL};
                                                          BEGIN{createitem11}
    createPUNCREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{SIG2}
  createlist1(SIG2);
  END{SIG2};
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := RELPRO;
      N^.ls^.RELPROfield^ := RELPROREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T1}
s:=RELPROREC1tree;
  T1:=s;
  END{T1};
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>PROPERNOUN THEN
        match:=FALSE;
      IF match THEN
        PROPERNOUNREC1:=s^.ls^.PROPERNOUNfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      PROCEDURE Match_MU6(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU6.first:=Lfirst;
          MU6.last:=Llast;
          match:=TRUE;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU6(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU6(NIL,NIL,TRUE,match) ELSE BEGIN
LlastT2_1:=L;WHILE LlastT2_1^.brother<>NIL DO
LlastT2_1:=LlastT2_1^.brother;
match_MU6(L,LlastT2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T2;
    matchnode(s,match);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist1items(s^.sons,first,match);
    END;
                                                          PROCEDURE matchtreeT4(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>NPVAR THEN
        match:=FALSE;
      IF match THEN
        NPVARREC1:=s^.ls^.NPVARfield^;
    END{MatchNode};
                                                          BEGIN
    s:= T4;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION2;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION8;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
SENTENCEREC2.DEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
SENTENCEREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION9;
BEGIN

END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
NPREC1loc:LSDOMAINT_NPVARrecord;
BEGIN
NPREC1loc:=COPYT_NPTOVAR(NPREC1);
result:=TRUE
AND
(NPVARREC1.req=NPREC1loc.req)AND
(NPVARREC1.env=NPREC1loc.env)AND
(NPVARREC1.superdeixis=NPREC1loc.superdeixis)AND
(NPVARREC1.class=NPREC1loc.class)AND
(NPVARREC1.deixis=NPREC1loc.deixis)AND
(NPVARREC1.aspect=NPREC1loc.aspect)AND
(NPVARREC1.retro=NPREC1loc.retro)AND
(NPVARREC1.definite=NPREC1loc.definite)AND
(NPVARREC1.person=NPREC1loc.person)AND
(NPVARREC1.number=NPREC1loc.number)AND
(NPVARREC1.genders=NPREC1loc.genders)AND
(NPVARREC1.sexes=NPREC1loc.sexes)AND
(NPVARREC1.actsubcs=NPREC1loc.actsubcs)AND
(NPVARREC1.temporal=NPREC1loc.temporal)AND
(NPVARREC1.possgeni=NPREC1loc.possgeni)AND
(NPVARREC1.animate=NPREC1loc.animate)AND
(NPVARREC1.human=NPREC1loc.human)AND
(NPVARREC1.actcomas=NPREC1loc.actcomas)AND
(NPVARREC1.thetanp=NPREC1loc.thetanp)AND
(NPVARREC1.nounpatternefs=NPREC1loc.nounpatternefs)AND
(NPVARREC1.posspred=NPREC1loc.posspred)AND
(NPVARREC1.possnietnp=NPREC1loc.possnietnp)AND
(NPVARREC1.mood=NPREC1loc.mood)AND
(NPVARREC1.generic=NPREC1loc.generic)AND
(NPVARREC1.possRform=NPREC1loc.possRform)AND
(NPVARREC1.syntquant=NPREC1loc.syntquant)AND
(NPVARREC1.NPhead=NPREC1loc.NPhead)AND
(NPVARREC1.specQ=NPREC1loc.specQ)AND
(NPVARREC1.coord=NPREC1loc.coord)
;except1:=result
END;
                                                       BEGIN{01}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT4(match,TRUE);
If match Then
WHILE match AND NOT matchcondT4 DO
BEGIN
MatchtreeT4(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF ((((NPREC1.GENDERS *[MASCGENDER,
FEMGENDER]                                            <>[]                                                    )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((NPVARREC1.INDEX =level                                )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((except1                                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((NPVARREC1.CASES *[NOMINATIVE,
DATIVE,
ACCUSATIVE]                                           <>[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      IF ((((SENTENCEREC1.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC1.DEIXIS =PRESENTDEIXIS                    )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((NPREC1.SUPERDEIXIS<>PRESENTDEIXIS                     )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((((SENTENCEREC1.DEIXIS =PASTDEIXIS                       )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((NPREC1.SUPERDEIXIS<>PASTDEIXIS                        )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_PUNCrec(PUNCREC2);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVrec(RADVREC1);
        hulpstree:=LDBLEX_read(auxkey('KOMMAPUNCKEY'));
        PUNCREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        PUNCREC1:=PUNCREC1tree^.ls^.PUNCfield^;
        hulpstree:=LDBLEX_read(auxkey('KOMMAPUNCKEY'));
        PUNCREC2tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        PUNCREC2:=PUNCREC2tree^.ls^.PUNCfield^;
        hulpstree:=LDBLEX_read(auxkey('DIERELPROKEY'));
        RELPROREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        RELPROREC1:=RELPROREC1tree^.ls^.RELPROfield^;
        action2;
        action9;
        createSIG1;
        createSIG2;
        createT2;
        createT1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((((SENTENCEREC1.DEIXIS =OMEGADEIXIS                      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC1.SUPERDEIXIS =NPREC1.SUPERDEIXIS          )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_PUNCrec(PUNCREC2);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVrec(RADVREC1);
        hulpstree:=LDBLEX_read(auxkey('KOMMAPUNCKEY'));
        PUNCREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        PUNCREC1:=PUNCREC1tree^.ls^.PUNCfield^;
        hulpstree:=LDBLEX_read(auxkey('KOMMAPUNCKEY'));
        PUNCREC2tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        PUNCREC2:=PUNCREC2tree^.ls^.PUNCfield^;
        hulpstree:=LDBLEX_read(auxkey('DIERELPROKEY'));
        RELPROREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        RELPROREC1:=RELPROREC1tree^.ls^.RELPROfield^;
        action8;
        action9;
        createSIG1;
        createSIG2;
        createT2;
        createT1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                       subrule0X1:=result
 END;
 FUNCTION subrule0X2 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDT4:BOOLEAN;
BEGIN MATCHCONDT4:=TRUE END;
  FUNCTION matchcondT2:BOOLEAN;
                                                      BEGIN
matchcondT2:=FALSE;
    IF
((T3^.CAT IN [PERSPRO,
INDEFPRO]                                             )
                                                      )
                                                      THEN 
matchcondT2:=TRUE;

  END;{matchcondT2}
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
  PROCEDURE createSIG2;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createPUNCREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := PUNC;
          N^.ls^.PUNCfield^ := PUNCREC2;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{PUNCREL}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=PUNCREL;
s:=PUNCREC2tree;
      relnode^.node:=s;
      END{PUNCREL};
                                                          BEGIN{createitem11}
    createPUNCREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{SIG2}
  createlist1(SIG2);
  END{SIG2};
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := RELPRO;
      N^.ls^.RELPROfield^ := RELPROREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T1}
s:=RELPROREC1tree;
  T1:=s;
  END{T1};
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                          BEGIN
    s:= T2;
    match:=first;
    T3:=s;
    END;
                                                          PROCEDURE matchtreeT4(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>NPVAR THEN
        match:=FALSE;
      IF match THEN
        NPVARREC1:=s^.ls^.NPVARfield^;
    END{MatchNode};
                                                          BEGIN
    s:= T4;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION26;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION32;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
SENTENCEREC2.DEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
SENTENCEREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION33;
BEGIN

END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
NPREC1loc:LSDOMAINT_NPVARrecord;
BEGIN
NPREC1loc:=COPYT_NPTOVAR(NPREC1);
result:=TRUE
AND
(NPVARREC1.req=NPREC1loc.req)AND
(NPVARREC1.env=NPREC1loc.env)AND
(NPVARREC1.superdeixis=NPREC1loc.superdeixis)AND
(NPVARREC1.class=NPREC1loc.class)AND
(NPVARREC1.deixis=NPREC1loc.deixis)AND
(NPVARREC1.aspect=NPREC1loc.aspect)AND
(NPVARREC1.retro=NPREC1loc.retro)AND
(NPVARREC1.definite=NPREC1loc.definite)AND
(NPVARREC1.person=NPREC1loc.person)AND
(NPVARREC1.number=NPREC1loc.number)AND
(NPVARREC1.genders=NPREC1loc.genders)AND
(NPVARREC1.sexes=NPREC1loc.sexes)AND
(NPVARREC1.actsubcs=NPREC1loc.actsubcs)AND
(NPVARREC1.temporal=NPREC1loc.temporal)AND
(NPVARREC1.possgeni=NPREC1loc.possgeni)AND
(NPVARREC1.animate=NPREC1loc.animate)AND
(NPVARREC1.human=NPREC1loc.human)AND
(NPVARREC1.actcomas=NPREC1loc.actcomas)AND
(NPVARREC1.thetanp=NPREC1loc.thetanp)AND
(NPVARREC1.nounpatternefs=NPREC1loc.nounpatternefs)AND
(NPVARREC1.posspred=NPREC1loc.posspred)AND
(NPVARREC1.possnietnp=NPREC1loc.possnietnp)AND
(NPVARREC1.mood=NPREC1loc.mood)AND
(NPVARREC1.generic=NPREC1loc.generic)AND
(NPVARREC1.possRform=NPREC1loc.possRform)AND
(NPVARREC1.syntquant=NPREC1loc.syntquant)AND
(NPVARREC1.NPhead=NPREC1loc.NPhead)AND
(NPVARREC1.specQ=NPREC1loc.specQ)AND
(NPVARREC1.coord=NPREC1loc.coord)
;except1:=result
END;
                                                       BEGIN{02}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT4(match,TRUE);
If match Then
WHILE match AND NOT matchcondT4 DO
BEGIN
MatchtreeT4(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF ((((NPREC1.GENDERS *[MASCGENDER,
FEMGENDER]                                            <>[]                                                    )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((NPVARREC1.INDEX =level                                )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((except1                                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((NPVARREC1.CASES *[NOMINATIVE,
DATIVE,
ACCUSATIVE]                                           <>[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      IF ((((SENTENCEREC1.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC1.DEIXIS =PRESENTDEIXIS                    )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((NPREC1.SUPERDEIXIS<>PRESENTDEIXIS                     )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((((SENTENCEREC1.DEIXIS =PASTDEIXIS                       )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((NPREC1.SUPERDEIXIS<>PASTDEIXIS                        )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_PUNCrec(PUNCREC2);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVrec(RADVREC1);
        hulpstree:=LDBLEX_read(auxkey('KOMMAPUNCKEY'));
        PUNCREC2tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        PUNCREC2:=PUNCREC2tree^.ls^.PUNCfield^;
        hulpstree:=LDBLEX_read(auxkey('DIERELPROKEY'));
        RELPROREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        RELPROREC1:=RELPROREC1tree^.ls^.RELPROfield^;
        action26;
        action33;
        createSIG1;
        createSIG2;
        createT2;
        createT1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((((SENTENCEREC1.DEIXIS =OMEGADEIXIS                      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC1.SUPERDEIXIS =NPREC1.SUPERDEIXIS          )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_PUNCrec(PUNCREC2);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVrec(RADVREC1);
        hulpstree:=LDBLEX_read(auxkey('KOMMAPUNCKEY'));
        PUNCREC2tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        PUNCREC2:=PUNCREC2tree^.ls^.PUNCfield^;
        hulpstree:=LDBLEX_read(auxkey('DIERELPROKEY'));
        RELPROREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        RELPROREC1:=RELPROREC1tree^.ls^.RELPROfield^;
        action32;
        action33;
        createSIG1;
        createSIG2;
        createT2;
        createT1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                       subrule0X2:=result
 END;
 FUNCTION subrule0X3 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDT4:BOOLEAN;
BEGIN MATCHCONDT4:=TRUE END;
  FUNCTION matchcondT2:BOOLEAN;
                                                      BEGIN
matchcondT2:=FALSE;
    IF
((T3^.CAT IN [PERSPRO,
INDEFPRO]                                             )
                                                      )
                                                      THEN 
matchcondT2:=TRUE;

  END;{matchcondT2}
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
  PROCEDURE createSIG2;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG2}
  createlist1(SIG2);
  END{SIG2};
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := RELPRO;
      N^.ls^.RELPROfield^ := RELPROREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T1}
s:=RELPROREC1tree;
  T1:=s;
  END{T1};
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                          BEGIN
    s:= T2;
    match:=first;
    T3:=s;
    END;
                                                          PROCEDURE matchtreeT4(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>NPVAR THEN
        match:=FALSE;
      IF match THEN
        NPVARREC1:=s^.ls^.NPVARfield^;
    END{MatchNode};
                                                          BEGIN
    s:= T4;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                       BEGIN{03}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT4(match,TRUE);
If match Then
WHILE match AND NOT matchcondT4 DO
BEGIN
MatchtreeT4(match,FALSE);
END;
                                                       subrule0X3:=result
 END;
 FUNCTION subrule0X4 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
FUNCTION MATCHCONDT4:BOOLEAN;
BEGIN MATCHCONDT4:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
  PROCEDURE createSIG2;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createPUNCREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := PUNC;
          N^.ls^.PUNCfield^ := PUNCREC2;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{PUNCREL}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=PUNCREL;
s:=PUNCREC2tree;
      relnode^.node:=s;
      END{PUNCREL};
                                                          BEGIN{createitem11}
    createPUNCREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{SIG2}
  createlist1(SIG2);
  END{SIG2};
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := RELPRO;
      N^.ls^.RELPROfield^ := RELPROREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T1}
s:=RELPROREC1tree;
  T1:=s;
  END{T1};
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>INDEFPRO THEN
        match:=FALSE;
      IF match THEN
        INDEFPROREC1:=s^.ls^.INDEFPROfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      PROCEDURE Match_MU6(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU6.first:=Lfirst;
          MU6.last:=Llast;
          match:=TRUE;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU6(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU6(NIL,NIL,TRUE,match) ELSE BEGIN
LlastT2_1:=L;WHILE LlastT2_1^.brother<>NIL DO
LlastT2_1:=LlastT2_1^.brother;
match_MU6(L,LlastT2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T2;
    matchnode(s,match);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist1items(s^.sons,first,match);
    END;
                                                          PROCEDURE matchtreeT4(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>NPVAR THEN
        match:=FALSE;
      IF match THEN
        NPVARREC1:=s^.ls^.NPVARfield^;
    END{MatchNode};
                                                          BEGIN
    s:= T4;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION65;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION71;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
SENTENCEREC2.DEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
SENTENCEREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION72;
BEGIN

END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
NPREC1loc:LSDOMAINT_NPVARrecord;
BEGIN
NPREC1loc:=COPYT_NPTOVAR(NPREC1);
result:=TRUE
AND
(NPVARREC1.req=NPREC1loc.req)AND
(NPVARREC1.env=NPREC1loc.env)AND
(NPVARREC1.superdeixis=NPREC1loc.superdeixis)AND
(NPVARREC1.class=NPREC1loc.class)AND
(NPVARREC1.deixis=NPREC1loc.deixis)AND
(NPVARREC1.aspect=NPREC1loc.aspect)AND
(NPVARREC1.retro=NPREC1loc.retro)AND
(NPVARREC1.definite=NPREC1loc.definite)AND
(NPVARREC1.person=NPREC1loc.person)AND
(NPVARREC1.number=NPREC1loc.number)AND
(NPVARREC1.genders=NPREC1loc.genders)AND
(NPVARREC1.sexes=NPREC1loc.sexes)AND
(NPVARREC1.actsubcs=NPREC1loc.actsubcs)AND
(NPVARREC1.temporal=NPREC1loc.temporal)AND
(NPVARREC1.possgeni=NPREC1loc.possgeni)AND
(NPVARREC1.animate=NPREC1loc.animate)AND
(NPVARREC1.human=NPREC1loc.human)AND
(NPVARREC1.actcomas=NPREC1loc.actcomas)AND
(NPVARREC1.thetanp=NPREC1loc.thetanp)AND
(NPVARREC1.nounpatternefs=NPREC1loc.nounpatternefs)AND
(NPVARREC1.posspred=NPREC1loc.posspred)AND
(NPVARREC1.possnietnp=NPREC1loc.possnietnp)AND
(NPVARREC1.mood=NPREC1loc.mood)AND
(NPVARREC1.generic=NPREC1loc.generic)AND
(NPVARREC1.possRform=NPREC1loc.possRform)AND
(NPVARREC1.syntquant=NPREC1loc.syntquant)AND
(NPVARREC1.NPhead=NPREC1loc.NPhead)AND
(NPVARREC1.specQ=NPREC1loc.specQ)AND
(NPVARREC1.coord=NPREC1loc.coord)
;except1:=result
END;
                                                       BEGIN{04}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT4(match,TRUE);
If match Then
WHILE match AND NOT matchcondT4 DO
BEGIN
MatchtreeT4(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF ((((NPREC1.GENDERS =[NEUTGENDER]                                          )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((NPREC1.ANIMATE =NOANIMATE                             )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((NPVARREC1.INDEX =level                                )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((except1                                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((NPVARREC1.CASES *[NOMINATIVE,
DATIVE,
ACCUSATIVE]                                           <>[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      IF ((((SENTENCEREC1.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC1.DEIXIS =PRESENTDEIXIS                    )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((NPREC1.SUPERDEIXIS<>PRESENTDEIXIS                     )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((((SENTENCEREC1.DEIXIS =PASTDEIXIS                       )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((NPREC1.SUPERDEIXIS<>PASTDEIXIS                        )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_PUNCrec(PUNCREC2);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVrec(RADVREC1);
        hulpstree:=LDBLEX_read(auxkey('KOMMAPUNCKEY'));
        PUNCREC2tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        PUNCREC2:=PUNCREC2tree^.ls^.PUNCfield^;
        hulpstree:=LDBLEX_read(auxkey('DATRELPROKEY'));
        RELPROREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        RELPROREC1:=RELPROREC1tree^.ls^.RELPROfield^;
        action65;
        action72;
        createSIG1;
        createSIG2;
        createT2;
        createT1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((((SENTENCEREC1.DEIXIS =OMEGADEIXIS                      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC1.SUPERDEIXIS =NPREC1.SUPERDEIXIS          )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_PUNCrec(PUNCREC2);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVrec(RADVREC1);
        hulpstree:=LDBLEX_read(auxkey('KOMMAPUNCKEY'));
        PUNCREC2tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        PUNCREC2:=PUNCREC2tree^.ls^.PUNCfield^;
        hulpstree:=LDBLEX_read(auxkey('DATRELPROKEY'));
        RELPROREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        RELPROREC1:=RELPROREC1tree^.ls^.RELPROfield^;
        action71;
        action72;
        createSIG1;
        createSIG2;
        createT2;
        createT1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                       subrule0X4:=result
 END;
 FUNCTION subrule0X5 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
FUNCTION MATCHCONDT4:BOOLEAN;
BEGIN MATCHCONDT4:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
  PROCEDURE createSIG2;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createPUNCREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := PUNC;
          N^.ls^.PUNCfield^ := PUNCREC2;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{PUNCREL}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=PUNCREL;
s:=PUNCREC2tree;
      relnode^.node:=s;
      END{PUNCREL};
                                                          BEGIN{createitem11}
    createPUNCREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{SIG2}
  createlist1(SIG2);
  END{SIG2};
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := BWHPRO;
      N^.ls^.BWHPROfield^ := BWHPROREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T1}
s:=BWHPROREC1tree;
  T1:=s;
  END{T1};
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>INDEFPRO THEN
        match:=FALSE;
      IF match THEN
        INDEFPROREC1:=s^.ls^.INDEFPROfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      PROCEDURE Match_MU6(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU6.first:=Lfirst;
          MU6.last:=Llast;
          match:=TRUE;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU6(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU6(NIL,NIL,TRUE,match) ELSE BEGIN
LlastT2_1:=L;WHILE LlastT2_1^.brother<>NIL DO
LlastT2_1:=LlastT2_1^.brother;
match_MU6(L,LlastT2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T2;
    matchnode(s,match);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist1items(s^.sons,first,match);
    END;
                                                          PROCEDURE matchtreeT4(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>NPVAR THEN
        match:=FALSE;
      IF match THEN
        NPVARREC1:=s^.ls^.NPVARfield^;
    END{MatchNode};
                                                          BEGIN
    s:= T4;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION89;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION95;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
SENTENCEREC2.DEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
SENTENCEREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION96;
BEGIN

END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
NPREC1loc:LSDOMAINT_NPVARrecord;
BEGIN
NPREC1loc:=COPYT_NPTOVAR(NPREC1);
result:=TRUE
AND
(NPVARREC1.req=NPREC1loc.req)AND
(NPVARREC1.env=NPREC1loc.env)AND
(NPVARREC1.superdeixis=NPREC1loc.superdeixis)AND
(NPVARREC1.class=NPREC1loc.class)AND
(NPVARREC1.deixis=NPREC1loc.deixis)AND
(NPVARREC1.aspect=NPREC1loc.aspect)AND
(NPVARREC1.retro=NPREC1loc.retro)AND
(NPVARREC1.definite=NPREC1loc.definite)AND
(NPVARREC1.person=NPREC1loc.person)AND
(NPVARREC1.number=NPREC1loc.number)AND
(NPVARREC1.genders=NPREC1loc.genders)AND
(NPVARREC1.sexes=NPREC1loc.sexes)AND
(NPVARREC1.actsubcs=NPREC1loc.actsubcs)AND
(NPVARREC1.temporal=NPREC1loc.temporal)AND
(NPVARREC1.possgeni=NPREC1loc.possgeni)AND
(NPVARREC1.animate=NPREC1loc.animate)AND
(NPVARREC1.human=NPREC1loc.human)AND
(NPVARREC1.actcomas=NPREC1loc.actcomas)AND
(NPVARREC1.thetanp=NPREC1loc.thetanp)AND
(NPVARREC1.nounpatternefs=NPREC1loc.nounpatternefs)AND
(NPVARREC1.posspred=NPREC1loc.posspred)AND
(NPVARREC1.possnietnp=NPREC1loc.possnietnp)AND
(NPVARREC1.mood=NPREC1loc.mood)AND
(NPVARREC1.generic=NPREC1loc.generic)AND
(NPVARREC1.possRform=NPREC1loc.possRform)AND
(NPVARREC1.syntquant=NPREC1loc.syntquant)AND
(NPVARREC1.NPhead=NPREC1loc.NPhead)AND
(NPVARREC1.specQ=NPREC1loc.specQ)AND
(NPVARREC1.coord=NPREC1loc.coord)
;except1:=result
END;
                                                       BEGIN{05}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT4(match,TRUE);
If match Then
WHILE match AND NOT matchcondT4 DO
BEGIN
MatchtreeT4(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF ((((NPREC1.GENDERS =[NEUTGENDER]                                          )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((NPREC1.ANIMATE =NOANIMATE                             )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((NPVARREC1.INDEX =level                                )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((except1                                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((NPVARREC1.CASES *[NOMINATIVE,
DATIVE,
ACCUSATIVE]                                           <>[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      IF ((((SENTENCEREC1.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC1.DEIXIS =PRESENTDEIXIS                    )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((NPREC1.SUPERDEIXIS<>PRESENTDEIXIS                     )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((((SENTENCEREC1.DEIXIS =PASTDEIXIS                       )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((NPREC1.SUPERDEIXIS<>PASTDEIXIS                        )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_PUNCrec(PUNCREC2);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVrec(RADVREC1);
        hulpstree:=LDBLEX_read(auxkey('KOMMAPUNCKEY'));
        PUNCREC2tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        PUNCREC2:=PUNCREC2tree^.ls^.PUNCfield^;
        hulpstree:=LDBLEX_read(auxkey('WATWHPROKEY'));
        BWHPROREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        BWHPROREC1:=BWHPROREC1tree^.ls^.BWHPROfield^;
        action89;
        action96;
        createSIG1;
        createSIG2;
        createT2;
        createT1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((((SENTENCEREC1.DEIXIS =OMEGADEIXIS                      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC1.SUPERDEIXIS =NPREC1.SUPERDEIXIS          )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_PUNCrec(PUNCREC2);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVrec(RADVREC1);
        hulpstree:=LDBLEX_read(auxkey('KOMMAPUNCKEY'));
        PUNCREC2tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        PUNCREC2:=PUNCREC2tree^.ls^.PUNCfield^;
        hulpstree:=LDBLEX_read(auxkey('WATWHPROKEY'));
        BWHPROREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        BWHPROREC1:=BWHPROREC1tree^.ls^.BWHPROfield^;
        action95;
        action96;
        createSIG1;
        createSIG2;
        createT2;
        createT1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                       subrule0X5:=result
 END;
 FUNCTION subrule0X6 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
FUNCTION MATCHCONDT4:BOOLEAN;
BEGIN MATCHCONDT4:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
  PROCEDURE createSIG2;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG2}
  createlist1(SIG2);
  END{SIG2};
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := RELPRO;
      N^.ls^.RELPROfield^ := RELPROREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T1}
s:=RELPROREC1tree;
  T1:=s;
  END{T1};
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>INDEFPRO THEN
        match:=FALSE;
      IF match THEN
        INDEFPROREC1:=s^.ls^.INDEFPROfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      PROCEDURE Match_MU6(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU6.first:=Lfirst;
          MU6.last:=Llast;
          match:=TRUE;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU6(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU6(NIL,NIL,TRUE,match) ELSE BEGIN
LlastT2_1:=L;WHILE LlastT2_1^.brother<>NIL DO
LlastT2_1:=LlastT2_1^.brother;
match_MU6(L,LlastT2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T2;
    matchnode(s,match);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist1items(s^.sons,first,match);
    END;
                                                          PROCEDURE matchtreeT4(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>NPVAR THEN
        match:=FALSE;
      IF match THEN
        NPVARREC1:=s^.ls^.NPVARfield^;
    END{MatchNode};
                                                          BEGIN
    s:= T4;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                       BEGIN{06}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT4(match,TRUE);
If match Then
WHILE match AND NOT matchcondT4 DO
BEGIN
MatchtreeT4(match,FALSE);
END;
                                                       subrule0X6:=result
 END;
 FUNCTION subrule0X7 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
FUNCTION MATCHCONDT4:BOOLEAN;
BEGIN MATCHCONDT4:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
  PROCEDURE createSIG2;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG2}
  createlist1(SIG2);
  END{SIG2};
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := BWHPRO;
      N^.ls^.BWHPROfield^ := BWHPROREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T1}
s:=BWHPROREC1tree;
  T1:=s;
  END{T1};
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>INDEFPRO THEN
        match:=FALSE;
      IF match THEN
        INDEFPROREC1:=s^.ls^.INDEFPROfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      PROCEDURE Match_MU6(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU6.first:=Lfirst;
          MU6.last:=Llast;
          match:=TRUE;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU6(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU6(NIL,NIL,TRUE,match) ELSE BEGIN
LlastT2_1:=L;WHILE LlastT2_1^.brother<>NIL DO
LlastT2_1:=LlastT2_1^.brother;
match_MU6(L,LlastT2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T2;
    matchnode(s,match);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist1items(s^.sons,first,match);
    END;
                                                          PROCEDURE matchtreeT4(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>NPVAR THEN
        match:=FALSE;
      IF match THEN
        NPVARREC1:=s^.ls^.NPVARfield^;
    END{MatchNode};
                                                          BEGIN
    s:= T4;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                       BEGIN{07}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT4(match,TRUE);
If match Then
WHILE match AND NOT matchcondT4 DO
BEGIN
MatchtreeT4(match,FALSE);
END;
                                                       subrule0X7:=result
 END;
 FUNCTION subrule0X8 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
LinitT4_1,LrestT4_1,LfirstT4_1,LlastT4_1:LSSTREE_prelnode;
iT4_1:INTEGER;
nomoretreesT4_1,lastmatchT4_1:BOOLEAN;
LinitT4_1_1,LrestT4_1_1,LfirstT4_1_1,LlastT4_1_1:LSSTREE_prelnode;
iT4_1_1:INTEGER;
nomoretreesT4_1_1,lastmatchT4_1_1:BOOLEAN;
LinitT4_2,LrestT4_2,LfirstT4_2,LlastT4_2:LSSTREE_prelnode;
iT4_2:INTEGER;
nomoretreesT4_2,lastmatchT4_2:BOOLEAN;
LinitT4_3,LrestT4_3,LfirstT4_3,LlastT4_3:LSSTREE_prelnode;
iT4_3:INTEGER;
nomoretreesT4_3,lastmatchT4_3:BOOLEAN;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
FUNCTION MATCHCONDT4:BOOLEAN;
BEGIN MATCHCONDT4:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createPUNCREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := PUNC;
          N^.ls^.PUNCfield^ := PUNCREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{PUNCREL}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=PUNCREL;
s:=PUNCREC1tree;
      relnode^.node:=s;
      END{PUNCREL};
                                                          BEGIN{createitem11}
    createPUNCREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
  PROCEDURE createSIG2;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createPUNCREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := PUNC;
          N^.ls^.PUNCfield^ := PUNCREC2;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{PUNCREL}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=PUNCREL;
s:=PUNCREC2tree;
      relnode^.node:=s;
      END{PUNCREL};
                                                          BEGIN{createitem11}
    createPUNCREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{SIG2}
  createlist1(SIG2);
  END{SIG2};
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := PREPP;
      N^.ls^.PREPPfield^ := PREPPREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createERREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := RADV;
          N^.ls^.RADVfield^ := RADVREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{ERREL}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=ERREL;
s:=RADVREC1tree;
      relnode^.node:=s;
      END{ERREL};
                                                          BEGIN{createitem11}
    createERREL(list);
    END;
    PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createGLUEREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := GLUE;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{GLUEREL}
LSMATCHES_createitem(list,GLUEREL,GLUE,createnode,createlist1);
      END{GLUEREL};
                                                          BEGIN{createitem12}
    createGLUEREL(list);
    END;
    PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := PREP;
          N^.ls^.PREPfield^ := PREPREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{HEAD}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=HEAD;
s:=PREPREC1tree;
      relnode^.node:=s;
      END{HEAD};
                                                          BEGIN{createitem13}
    createHEAD(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist3items111(wholelist,createitem11,createitem12,createitem13);
    END{createlist1};
                                                        BEGIN{T1}
  s:=MAKET_stree(PREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>PROPERNOUN THEN
        match:=FALSE;
      IF match THEN
        PROPERNOUNREC1:=s^.ls^.PROPERNOUNfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      PROCEDURE Match_MU6(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU6.first:=Lfirst;
          MU6.last:=Llast;
          match:=TRUE;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU6(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU6(NIL,NIL,TRUE,match) ELSE BEGIN
LlastT2_1:=L;WHILE LlastT2_1^.brother<>NIL DO
LlastT2_1:=LlastT2_1^.brother;
match_MU6(L,LlastT2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T2;
    matchnode(s,match);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist1items(s^.sons,first,match);
    END;
                                                          PROCEDURE matchtreeT4(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      lirel2:LIDOMAINT_synrel;
      lsrel2:LSDOMAINT_synrel;
      lirel3:LIDOMAINT_synrel;
      lsrel3:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>VARPREPP THEN
        match:=FALSE;
      IF match THEN
        VARPREPPREC1:=s^.ls^.VARPREPPfield^;
    END{MatchNode};
                                                          PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_ERREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        lirel1:LIDOMAINT_synrel;
        lsrel1:LSDOMAINT_synrel;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>RADVP THEN
            match:=FALSE;
          IF match THEN
            RADVPREC1:=s^.ls^.RADVPfield^;
        END{MatchNode};
                                                              PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
          PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          VAR matchcond:BOOLEAN;
            Stree:LSSTREE_pStree;
            lisons:LISTREE_pRelnode;
            PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
            BEGIN{MatchNode}
              IF s^.ls^.cat<>NPVAR THEN
                match:=FALSE;
              IF match THEN
                NPVARREC1:=s^.ls^.NPVARfield^;
            END{MatchNode};
                                                      BEGIN{MatchTree}
                              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT4_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT4_1_1,LfirstT4_1_1,LrestT4_1_1,nomoretreesT4_1_1) END;
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,ERREL
,HEAD,match,matchnode,matchlist1items,lastmatchT4_1) END;
                                                            PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
      PROCEDURE Match_GLUEREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>GLUE THEN
            match:=FALSE;
          IF match THEN
            ;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,GLUEREL
,match,matchnode,matchlist0items,lastmatchT4_2) END;
                                                              PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
      PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PREP THEN
            match:=FALSE;
          IF match THEN
            PREPREC1:=s^.ls^.PREPfield^;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PREPREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT4_3) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT4_3,LfirstT4_3,LrestT4_3,nomoretreesT4_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_GLUEREL,matchlist1items,
LlastT4_2,LfirstT4_2,LrestT4_2,nomoretreesT4_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_ERREL,matchlist2items,
LlastT4_1,LfirstT4_1,LrestT4_1,nomoretreesT4_1) END;
                                                          BEGIN
    s:= T4;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n >=3) AND (s^.li^.n <=3);
        IF match THEN
          BEGIN
          lsrel1:=ERREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lsrel2:=GLUEREL;
          lirel2:= loopholes.retype(lsrel2,LIDOMAINT_synrel);
          lsrel3:=HEAD;
          lirel3:= loopholes.retype(lsrel3,LIDOMAINT_synrel);
          lisons:=loopholes.retype(s^.sons,LISTREE_pRelnode);
          match:= LIMATCHES_TEST3rels(lirel1,lirel2,lirel3,lisons,FALSE);
          END;
IF match THEN matchlist3items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION143;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION149;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
SENTENCEREC2.DEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
SENTENCEREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION153;
BEGIN
PREPPREC1:=VARPREPPREC1;                              ;
PREPPREC1.MOOD:=WH
                                                      ;
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
NPREC1loc:LSDOMAINT_NPVARrecord;
BEGIN
NPREC1loc:=COPYT_NPTOVAR(NPREC1);
result:=TRUE
AND
(NPVARREC1.req=NPREC1loc.req)AND
(NPVARREC1.env=NPREC1loc.env)AND
(NPVARREC1.superdeixis=NPREC1loc.superdeixis)AND
(NPVARREC1.class=NPREC1loc.class)AND
(NPVARREC1.deixis=NPREC1loc.deixis)AND
(NPVARREC1.aspect=NPREC1loc.aspect)AND
(NPVARREC1.retro=NPREC1loc.retro)AND
(NPVARREC1.definite=NPREC1loc.definite)AND
(NPVARREC1.person=NPREC1loc.person)AND
(NPVARREC1.number=NPREC1loc.number)AND
(NPVARREC1.genders=NPREC1loc.genders)AND
(NPVARREC1.sexes=NPREC1loc.sexes)AND
(NPVARREC1.actsubcs=NPREC1loc.actsubcs)AND
(NPVARREC1.temporal=NPREC1loc.temporal)AND
(NPVARREC1.possgeni=NPREC1loc.possgeni)AND
(NPVARREC1.animate=NPREC1loc.animate)AND
(NPVARREC1.human=NPREC1loc.human)AND
(NPVARREC1.actcomas=NPREC1loc.actcomas)AND
(NPVARREC1.thetanp=NPREC1loc.thetanp)AND
(NPVARREC1.nounpatternefs=NPREC1loc.nounpatternefs)AND
(NPVARREC1.posspred=NPREC1loc.posspred)AND
(NPVARREC1.possnietnp=NPREC1loc.possnietnp)AND
(NPVARREC1.mood=NPREC1loc.mood)AND
(NPVARREC1.generic=NPREC1loc.generic)AND
(NPVARREC1.possRform=NPREC1loc.possRform)AND
(NPVARREC1.syntquant=NPREC1loc.syntquant)AND
(NPVARREC1.NPhead=NPREC1loc.NPhead)AND
(NPVARREC1.specQ=NPREC1loc.specQ)AND
(NPVARREC1.coord=NPREC1loc.coord)
;except1:=result
END;
                                                       BEGIN{08}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT4(match,TRUE);
If match Then
WHILE match AND NOT matchcondT4 DO
BEGIN
MatchtreeT4(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF ((LK IN RADVPREC1.KINDEFS                               )
                                                      )
THEN IF
          ((RADVPREC1.RADVKEY =auxkey('WAARRADVKEY')                                 )
                                                      )
THEN IF
          ((((NPREC1.GENDERS *[MASCGENDER,
FEMGENDER]                                            <>[]                                                    )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((NPREC1.HUMAN =NOHUMAN                                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((NPVARREC1.INDEX =level                                )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((except1                                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((NPVARREC1.CASES *[RCASE]                                               <>
[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      IF ((((SENTENCEREC1.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC1.DEIXIS =PRESENTDEIXIS                    )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((NPREC1.SUPERDEIXIS<>PRESENTDEIXIS                     )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((((SENTENCEREC1.DEIXIS =PASTDEIXIS                       )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((NPREC1.SUPERDEIXIS<>PASTDEIXIS                        )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_PUNCrec(PUNCREC2);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVrec(RADVREC1);
        hulpstree:=LDBLEX_read(auxkey('KOMMAPUNCKEY'));
        PUNCREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        PUNCREC1:=PUNCREC1tree^.ls^.PUNCfield^;
        hulpstree:=LDBLEX_read(auxkey('KOMMAPUNCKEY'));
        PUNCREC2tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        PUNCREC2:=PUNCREC2tree^.ls^.PUNCfield^;
        hulpstree:=LDBLEX_read(auxkey('WAARRADVKEY'));
        RADVREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        RADVREC1:=RADVREC1tree^.ls^.RADVfield^;
        action143;
        action153;
        createSIG1;
        createSIG2;
        createT2;
        createT1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((((SENTENCEREC1.DEIXIS =OMEGADEIXIS                      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC1.SUPERDEIXIS =NPREC1.SUPERDEIXIS          )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_PUNCrec(PUNCREC2);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVrec(RADVREC1);
        hulpstree:=LDBLEX_read(auxkey('KOMMAPUNCKEY'));
        PUNCREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        PUNCREC1:=PUNCREC1tree^.ls^.PUNCfield^;
        hulpstree:=LDBLEX_read(auxkey('KOMMAPUNCKEY'));
        PUNCREC2tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        PUNCREC2:=PUNCREC2tree^.ls^.PUNCfield^;
        hulpstree:=LDBLEX_read(auxkey('WAARRADVKEY'));
        RADVREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        RADVREC1:=RADVREC1tree^.ls^.RADVfield^;
        action149;
        action153;
        createSIG1;
        createSIG2;
        createT2;
        createT1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                       subrule0X8:=result
 END;
 FUNCTION subrule0X9 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT4_1,LrestT4_1,LfirstT4_1,LlastT4_1:LSSTREE_prelnode;
iT4_1:INTEGER;
nomoretreesT4_1,lastmatchT4_1:BOOLEAN;
LinitT4_1_1,LrestT4_1_1,LfirstT4_1_1,LlastT4_1_1:LSSTREE_prelnode;
iT4_1_1:INTEGER;
nomoretreesT4_1_1,lastmatchT4_1_1:BOOLEAN;
LinitT4_2,LrestT4_2,LfirstT4_2,LlastT4_2:LSSTREE_prelnode;
iT4_2:INTEGER;
nomoretreesT4_2,lastmatchT4_2:BOOLEAN;
LinitT4_3,LrestT4_3,LfirstT4_3,LlastT4_3:LSSTREE_prelnode;
iT4_3:INTEGER;
nomoretreesT4_3,lastmatchT4_3:BOOLEAN;
FUNCTION MATCHCONDT4:BOOLEAN;
BEGIN MATCHCONDT4:=TRUE END;
  FUNCTION matchcondT2:BOOLEAN;
                                                      BEGIN
matchcondT2:=FALSE;
    IF
((T3^.CAT IN [DEMPRO,
INDEFPRO]                                             )
                                                      )
                                                      THEN 
matchcondT2:=TRUE;

  END;{matchcondT2}
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
  PROCEDURE createSIG2;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createPUNCREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := PUNC;
          N^.ls^.PUNCfield^ := PUNCREC2;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{PUNCREL}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=PUNCREL;
s:=PUNCREC2tree;
      relnode^.node:=s;
      END{PUNCREL};
                                                          BEGIN{createitem11}
    createPUNCREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{SIG2}
  createlist1(SIG2);
  END{SIG2};
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := PREPP;
      N^.ls^.PREPPfield^ := PREPPREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createERREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := RADV;
          N^.ls^.RADVfield^ := RADVREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{ERREL}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=ERREL;
s:=RADVREC1tree;
      relnode^.node:=s;
      END{ERREL};
                                                          BEGIN{createitem11}
    createERREL(list);
    END;
    PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createGLUEREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := GLUE;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{GLUEREL}
LSMATCHES_createitem(list,GLUEREL,GLUE,createnode,createlist1);
      END{GLUEREL};
                                                          BEGIN{createitem12}
    createGLUEREL(list);
    END;
    PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := PREP;
          N^.ls^.PREPfield^ := PREPREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{HEAD}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=HEAD;
s:=PREPREC1tree;
      relnode^.node:=s;
      END{HEAD};
                                                          BEGIN{createitem13}
    createHEAD(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist3items111(wholelist,createitem11,createitem12,createitem13);
    END{createlist1};
                                                        BEGIN{T1}
  s:=MAKET_stree(PREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                          BEGIN
    s:= T2;
    match:=first;
    T3:=s;
    END;
                                                          PROCEDURE matchtreeT4(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      lirel2:LIDOMAINT_synrel;
      lsrel2:LSDOMAINT_synrel;
      lirel3:LIDOMAINT_synrel;
      lsrel3:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>VARPREPP THEN
        match:=FALSE;
      IF match THEN
        VARPREPPREC1:=s^.ls^.VARPREPPfield^;
    END{MatchNode};
                                                          PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_ERREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        lirel1:LIDOMAINT_synrel;
        lsrel1:LSDOMAINT_synrel;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>RADVP THEN
            match:=FALSE;
          IF match THEN
            RADVPREC1:=s^.ls^.RADVPfield^;
        END{MatchNode};
                                                              PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
          PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          VAR matchcond:BOOLEAN;
            Stree:LSSTREE_pStree;
            lisons:LISTREE_pRelnode;
            PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
            BEGIN{MatchNode}
              IF s^.ls^.cat<>NPVAR THEN
                match:=FALSE;
              IF match THEN
                NPVARREC1:=s^.ls^.NPVARfield^;
            END{MatchNode};
                                                      BEGIN{MatchTree}
                              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT4_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT4_1_1,LfirstT4_1_1,LrestT4_1_1,nomoretreesT4_1_1) END;
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,ERREL
,HEAD,match,matchnode,matchlist1items,lastmatchT4_1) END;
                                                            PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
      PROCEDURE Match_GLUEREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>GLUE THEN
            match:=FALSE;
          IF match THEN
            ;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,GLUEREL
,match,matchnode,matchlist0items,lastmatchT4_2) END;
                                                              PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
      PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PREP THEN
            match:=FALSE;
          IF match THEN
            PREPREC1:=s^.ls^.PREPfield^;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PREPREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT4_3) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT4_3,LfirstT4_3,LrestT4_3,nomoretreesT4_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_GLUEREL,matchlist1items,
LlastT4_2,LfirstT4_2,LrestT4_2,nomoretreesT4_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_ERREL,matchlist2items,
LlastT4_1,LfirstT4_1,LrestT4_1,nomoretreesT4_1) END;
                                                          BEGIN
    s:= T4;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n >=3) AND (s^.li^.n <=3);
        IF match THEN
          BEGIN
          lsrel1:=ERREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lsrel2:=GLUEREL;
          lirel2:= loopholes.retype(lsrel2,LIDOMAINT_synrel);
          lsrel3:=HEAD;
          lirel3:= loopholes.retype(lsrel3,LIDOMAINT_synrel);
          lisons:=loopholes.retype(s^.sons,LISTREE_pRelnode);
          match:= LIMATCHES_TEST3rels(lirel1,lirel2,lirel3,lisons,FALSE);
          END;
IF match THEN matchlist3items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION176;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION182;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
SENTENCEREC2.DEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
SENTENCEREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION186;
BEGIN
PREPPREC1:=VARPREPPREC1;                              ;
PREPPREC1.MOOD:=WH
                                                      ;
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
NPREC1loc:LSDOMAINT_NPVARrecord;
BEGIN
NPREC1loc:=COPYT_NPTOVAR(NPREC1);
result:=TRUE
AND
(NPVARREC1.req=NPREC1loc.req)AND
(NPVARREC1.env=NPREC1loc.env)AND
(NPVARREC1.superdeixis=NPREC1loc.superdeixis)AND
(NPVARREC1.class=NPREC1loc.class)AND
(NPVARREC1.deixis=NPREC1loc.deixis)AND
(NPVARREC1.aspect=NPREC1loc.aspect)AND
(NPVARREC1.retro=NPREC1loc.retro)AND
(NPVARREC1.definite=NPREC1loc.definite)AND
(NPVARREC1.person=NPREC1loc.person)AND
(NPVARREC1.number=NPREC1loc.number)AND
(NPVARREC1.genders=NPREC1loc.genders)AND
(NPVARREC1.sexes=NPREC1loc.sexes)AND
(NPVARREC1.actsubcs=NPREC1loc.actsubcs)AND
(NPVARREC1.temporal=NPREC1loc.temporal)AND
(NPVARREC1.possgeni=NPREC1loc.possgeni)AND
(NPVARREC1.animate=NPREC1loc.animate)AND
(NPVARREC1.human=NPREC1loc.human)AND
(NPVARREC1.actcomas=NPREC1loc.actcomas)AND
(NPVARREC1.thetanp=NPREC1loc.thetanp)AND
(NPVARREC1.nounpatternefs=NPREC1loc.nounpatternefs)AND
(NPVARREC1.posspred=NPREC1loc.posspred)AND
(NPVARREC1.possnietnp=NPREC1loc.possnietnp)AND
(NPVARREC1.mood=NPREC1loc.mood)AND
(NPVARREC1.generic=NPREC1loc.generic)AND
(NPVARREC1.possRform=NPREC1loc.possRform)AND
(NPVARREC1.syntquant=NPREC1loc.syntquant)AND
(NPVARREC1.NPhead=NPREC1loc.NPhead)AND
(NPVARREC1.specQ=NPREC1loc.specQ)AND
(NPVARREC1.coord=NPREC1loc.coord)
;except1:=result
END;
                                                       BEGIN{09}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT4(match,TRUE);
If match Then
WHILE match AND NOT matchcondT4 DO
BEGIN
MatchtreeT4(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF ((LK IN RADVPREC1.KINDEFS                               )
                                                      )
THEN IF
          ((RADVPREC1.RADVKEY =auxkey('WAARRADVKEY')                                 )
                                                      )
THEN IF
          ((((NPREC1.HUMAN =NOHUMAN                                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((NPVARREC1.INDEX =level                                )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((except1                                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((NPVARREC1.CASES *[RCASE]                                               <>
[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      IF ((((SENTENCEREC1.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC1.DEIXIS =PRESENTDEIXIS                    )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((NPREC1.SUPERDEIXIS<>PRESENTDEIXIS                     )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((((SENTENCEREC1.DEIXIS =PASTDEIXIS                       )
                                                      )
                                                      )
                                                      )
AND
          ((((((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
AND
          ((((NPREC1.SUPERDEIXIS<>PASTDEIXIS                        )
                                                      )
                                                      )
                                                      )
                                                      )
OR
          (((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_PUNCrec(PUNCREC2);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVrec(RADVREC1);
        hulpstree:=LDBLEX_read(auxkey('KOMMAPUNCKEY'));
        PUNCREC2tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        PUNCREC2:=PUNCREC2tree^.ls^.PUNCfield^;
        hulpstree:=LDBLEX_read(auxkey('WAARRADVKEY'));
        RADVREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        RADVREC1:=RADVREC1tree^.ls^.RADVfield^;
        action176;
        action186;
        createSIG1;
        createSIG2;
        createT2;
        createT1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((((SENTENCEREC1.DEIXIS =OMEGADEIXIS                      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC1.SUPERDEIXIS =NPREC1.SUPERDEIXIS          )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        MAKET_PUNCrec(PUNCREC2);
        MAKET_RELPROrec(RELPROREC1);
        MAKET_BWHPROrec(BWHPROREC1);
        MAKET_PREPPrec(PREPPREC1);
        MAKET_RADVrec(RADVREC1);
        hulpstree:=LDBLEX_read(auxkey('KOMMAPUNCKEY'));
        PUNCREC2tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        PUNCREC2:=PUNCREC2tree^.ls^.PUNCfield^;
        hulpstree:=LDBLEX_read(auxkey('WAARRADVKEY'));
        RADVREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
        RADVREC1:=RADVREC1tree^.ls^.RADVfield^;
        action182;
        action186;
        createSIG1;
        createSIG2;
        createT2;
        createT1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                       subrule0X9:=result
 END;
 FUNCTION subrule0X10 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT4_1,LrestT4_1,LfirstT4_1,LlastT4_1:LSSTREE_prelnode;
iT4_1:INTEGER;
nomoretreesT4_1,lastmatchT4_1:BOOLEAN;
LinitT4_1_1,LrestT4_1_1,LfirstT4_1_1,LlastT4_1_1:LSSTREE_prelnode;
iT4_1_1:INTEGER;
nomoretreesT4_1_1,lastmatchT4_1_1:BOOLEAN;
LinitT4_2,LrestT4_2,LfirstT4_2,LlastT4_2:LSSTREE_prelnode;
iT4_2:INTEGER;
nomoretreesT4_2,lastmatchT4_2:BOOLEAN;
LinitT4_3,LrestT4_3,LfirstT4_3,LlastT4_3:LSSTREE_prelnode;
iT4_3:INTEGER;
nomoretreesT4_3,lastmatchT4_3:BOOLEAN;
FUNCTION MATCHCONDT4:BOOLEAN;
BEGIN MATCHCONDT4:=TRUE END;
  FUNCTION matchcondT2:BOOLEAN;
                                                      BEGIN
matchcondT2:=FALSE;
    IF
((T3^.CAT IN [DEMPRO,
INDEFPRO]                                             )
                                                      )
                                                      THEN 
matchcondT2:=TRUE;

  END;{matchcondT2}
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
  PROCEDURE createSIG2;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG2}
  createlist1(SIG2);
  END{SIG2};
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := PREPP;
      N^.ls^.PREPPfield^ := PREPPREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createERREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := RADV;
          N^.ls^.RADVfield^ := RADVREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{ERREL}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=ERREL;
s:=RADVREC1tree;
      relnode^.node:=s;
      END{ERREL};
                                                          BEGIN{createitem11}
    createERREL(list);
    END;
    PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createGLUEREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := GLUE;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{GLUEREL}
LSMATCHES_createitem(list,GLUEREL,GLUE,createnode,createlist1);
      END{GLUEREL};
                                                          BEGIN{createitem12}
    createGLUEREL(list);
    END;
    PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := PREP;
          N^.ls^.PREPfield^ := PREPREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{HEAD}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=HEAD;
s:=PREPREC1tree;
      relnode^.node:=s;
      END{HEAD};
                                                          BEGIN{createitem13}
    createHEAD(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist3items111(wholelist,createitem11,createitem12,createitem13);
    END{createlist1};
                                                        BEGIN{T1}
  s:=MAKET_stree(PREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                          BEGIN
    s:= T2;
    match:=first;
    T3:=s;
    END;
                                                          PROCEDURE matchtreeT4(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      lirel2:LIDOMAINT_synrel;
      lsrel2:LSDOMAINT_synrel;
      lirel3:LIDOMAINT_synrel;
      lsrel3:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>VARPREPP THEN
        match:=FALSE;
      IF match THEN
        VARPREPPREC1:=s^.ls^.VARPREPPfield^;
    END{MatchNode};
                                                          PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_ERREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        lirel1:LIDOMAINT_synrel;
        lsrel1:LSDOMAINT_synrel;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>RADVP THEN
            match:=FALSE;
          IF match THEN
            RADVPREC1:=s^.ls^.RADVPfield^;
        END{MatchNode};
                                                              PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
          PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          VAR matchcond:BOOLEAN;
            Stree:LSSTREE_pStree;
            lisons:LISTREE_pRelnode;
            PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
            BEGIN{MatchNode}
              IF s^.ls^.cat<>NPVAR THEN
                match:=FALSE;
              IF match THEN
                NPVARREC1:=s^.ls^.NPVARfield^;
            END{MatchNode};
                                                      BEGIN{MatchTree}
                              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT4_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT4_1_1,LfirstT4_1_1,LrestT4_1_1,nomoretreesT4_1_1) END;
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,ERREL
,HEAD,match,matchnode,matchlist1items,lastmatchT4_1) END;
                                                            PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
      PROCEDURE Match_GLUEREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>GLUE THEN
            match:=FALSE;
          IF match THEN
            ;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,GLUEREL
,match,matchnode,matchlist0items,lastmatchT4_2) END;
                                                              PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
      PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PREP THEN
            match:=FALSE;
          IF match THEN
            PREPREC1:=s^.ls^.PREPfield^;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PREPREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT4_3) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT4_3,LfirstT4_3,LrestT4_3,nomoretreesT4_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_GLUEREL,matchlist1items,
LlastT4_2,LfirstT4_2,LrestT4_2,nomoretreesT4_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_ERREL,matchlist2items,
LlastT4_1,LfirstT4_1,LrestT4_1,nomoretreesT4_1) END;
                                                          BEGIN
    s:= T4;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n >=3) AND (s^.li^.n <=3);
        IF match THEN
          BEGIN
          lsrel1:=ERREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lsrel2:=GLUEREL;
          lirel2:= loopholes.retype(lsrel2,LIDOMAINT_synrel);
          lsrel3:=HEAD;
          lirel3:= loopholes.retype(lsrel3,LIDOMAINT_synrel);
          lisons:=loopholes.retype(s^.sons,LISTREE_pRelnode);
          match:= LIMATCHES_TEST3rels(lirel1,lirel2,lirel3,lisons,FALSE);
          END;
IF match THEN matchlist3items(s^.sons,first,match);
    END;
                                                       BEGIN{010}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT4(match,TRUE);
If match Then
WHILE match AND NOT matchcondT4 DO
BEGIN
MatchtreeT4(match,FALSE);
END;
                                                       subrule0X10:=result
 END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
m2:=loopholes.retype(Is2,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
  BEGIN
    MatchModel2(m2,TRUE,match);
    If match Then
    BEGIN
    LISTREE_mergesetsofstrees(subrule0X1,result);
    LISTREE_mergesetsofstrees(subrule0X2,result);
    LISTREE_mergesetsofstrees(subrule0X3,result);
    LISTREE_mergesetsofstrees(subrule0X4,result);
    LISTREE_mergesetsofstrees(subrule0X5,result);
    LISTREE_mergesetsofstrees(subrule0X6,result);
    LISTREE_mergesetsofstrees(subrule0X7,result);
    LISTREE_mergesetsofstrees(subrule0X8,result);
    LISTREE_mergesetsofstrees(subrule0X9,result);
    LISTREE_mergesetsofstrees(subrule0X10,result);
 END;
    END;
COMRNONCNMODRELSENT1:=result
END;
{:RNONCNMODRELSENT1}
{rule:}
{:RCNMODINFREL}
 FUNCTION COMRCNMODINFREL(LEVEL:INTEGER;
Is1:LISTREE_pStree;Is2:LISTREE_pStree
):LISTREE_SetOfStrees;
VAR result:LISTREE_SetOfStrees;
 wbonus,sbonus:INTEGER;
 m:LSSTREE_pstree;
 Is:LISTREE_pstree;
 setofstrees:LISTREE_setofstrees;
 first:BOOLEAN;
 match:BOOLEAN;
 idargs:LIIDDICT_idargs;
dtree:HYPERDTREE_phyperdtree;
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
LinitM1_1,LrestM1_1,LfirstM1_1,LlastM1_1:LSSTREE_prelnode;
iM1_1:INTEGER;
nomoretreesM1_1,lastmatchM1_1:BOOLEAN;
LinitM2_1,LrestM2_1,LfirstM2_1,LlastM2_1:LSSTREE_prelnode;
iM2_1:INTEGER;
nomoretreesM2_1,lastmatchM2_1:BOOLEAN;
LinitM2_2,LrestM2_2,LfirstM2_2,LlastM2_2:LSSTREE_prelnode;
iM2_2:INTEGER;
nomoretreesM2_2,lastmatchM2_2:BOOLEAN;
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
T1:LSSTREE_pStree;
PREPREC1tree:LSSTREE_pStree;
ENREC1tree:LSSTREE_pStree;
PUNCREC2tree:LSSTREE_pStree;
PUNCREC1tree:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
SIG1:LSMRUQUO_ListOfStrees;
PUNCREC2:LSDOMAINT_PUNCrecord;
ENREC1:LSDOMAINT_ENrecord;
PREPREC1:LSDOMAINT_PREPrecord;
VARPREPPREC1:LSDOMAINT_PREPPrecord;
RADVPREC1:LSDOMAINT_RADVPrecord;
CNVARREC1:LSDOMAINT_CNVARrecord;
SENTENCEREC1:LSDOMAINT_SENTENCErecord;
CNREC1:LSDOMAINT_CNrecord;
CNREC2:LSDOMAINT_CNrecord;
SENTENCEREC2:LSDOMAINT_SENTENCErecord;
PUNCREC1:LSDOMAINT_PUNCrecord;
FUNCTION matchcondI5:BOOLEAN;
FUNCTION EXIST1(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
Linit_1,Lrest_1,Lfirst_1,Llast_1:LSSTREE_prelnode;
i_1:INTEGER;
nomoretrees_1,lastmatch_1:BOOLEAN;
      Lfinal:LSSTREE_prelnode;
match:Boolean;
PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR
  itemmatch,listmatch:Boolean;
  PROCEDURE Match_SHIFTREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
      LSMATCHES_matchtreeEmp(Lfirst,Llast,first,SHIFTREL,match,lastmatch_1);
END;
                                                      BEGIN {MatchList1Items}
  match:=FALSE;
  IF first THEN
    BEGIN 
  nomoretrees_1:=False;
    Lfirst_1:=NIL;
    SelectLfirstAndLlast(Lfirst_1,Llast_1,Lrest_1
,nomoretrees_1,L);
    IF Llast_1=Lfinal THEN Lrest_1:=NIL;
    IF NOT nomoretrees_1 THEN
      BEGIN
      Match_SHIFTREL(Lfirst_1,Llast_1,TRUE,itemmatch);
      match:=itemmatch;
END
    END
  ELSE
  BEGIN
IF Llast_1=Lfinal THEN Lrest_1:=NIL;
    Match_SHIFTREL(Lfirst_1,Llast_1,FALSE,match);
    END;
END;{MatchList1Items}
                                                        BEGIN{Exist1}
    next:=mu.first;match:=False;Lfinal:=mu.last;
    IF next =NIL THEN
      EXIST1:=False
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND NOT(match) DO
      BEGIN
        matchlist1items(next,TRUE,match);
        next:=next^.brother;
      END;
      IF match = False THEN
        matchlist1items(next,TRUE,match);
      EXIST1:=match;
    END;
  END;{Exist}
                                                      BEGIN
matchcondI5:=FALSE;
  IF
((NOT Exist1(MU2)                                       )
                                                      )
                                                      THEN 
matchcondI5:=TRUE;

END;{matchcondI5}
FUNCTION matchcondI4:BOOLEAN;
                                                      BEGIN
matchcondI4:=FALSE;
  IF
(((SENTENCEREC2.MOOD=RELATIVE) AND 
          (SENTENCEREC2.SENTTYPE=SUBORDINATECLAUSE) AND 
          (SENTENCEREC2.FINITENESS=INFINITE) AND 
          TRUE
                                                      )
                                                      )
                                                      THEN 
matchcondI4:=TRUE;

END;{matchcondI4}
FUNCTION matchcondI3:BOOLEAN;
FUNCTION ALL1(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
lastmatch:BOOLEAN;
      match:Boolean;
PROCEDURE Match_PUNCREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR matchcond:BOOLEAN;
  Stree:LSSTREE_pStree;
  lisons:LISTREE_pRelnode;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>PUNC THEN
      match:=FALSE;
    IF match THEN
      PUNCREC2:=s^.ls^.PUNCfield^;
    IF match THEN match:=(s^.ls^.PUNCfield^.key=auxkey('KOMMAPUNCKEY'));
  END{MatchNode};
                                                      BEGIN{MatchTree}
        PUNCREC2tree:=Lfirst^.node;
      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PUNCREL
,match,matchnode,matchlist0items,lastmatch) END;
                                                        BEGIN{All1}
    next:=mu.first;match:=TRUE;
    IF next =NIL THEN
      ALL1:=TRUE
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND (match) DO
      BEGIN
        match_PUNCREL(next,next,TRUE,match);
        next:=next^.brother;
      END;
      IF match THEN
      BEGIN
        match_PUNCREL(next,mu.last,TRUE,match);
        ALL1:=match;
      END
      ELSE
        ALL1:=FALSE;
    END;
  END;{All}
                                                      BEGIN
matchcondI3:=FALSE;
  IF
((ALL1(SIG1)                                            )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
(((SENTENCEREC1.MOOD=RELATIVE) AND 
          (SENTENCEREC1.SENTTYPE=SUBORDINATECLAUSE) AND 
          (SENTENCEREC1.FINITENESS=INFINITE) AND 
          TRUE
                                                      )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI1:BOOLEAN;
FUNCTION EXIST1(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
Linit_1,Lrest_1,Lfirst_1,Llast_1:LSSTREE_prelnode;
i_1:INTEGER;
nomoretrees_1,lastmatch_1:BOOLEAN;
      Lfinal:LSSTREE_prelnode;
match:Boolean;
PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR
  itemmatch,listmatch:Boolean;
  PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>EN THEN
        match:=FALSE;
      IF match THEN
        ENREC1:=s^.ls^.ENfield^;
    END{MatchNode};
                                                      BEGIN{MatchTree}
            ENREC1tree:=Lfirst^.node;
        IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatch_1) END;
                                                      BEGIN {MatchList1Items}
  match:=FALSE;
  IF first THEN
    BEGIN 
  nomoretrees_1:=False;
    Lfirst_1:=NIL;
    SelectLfirstAndLlast(Lfirst_1,Llast_1,Lrest_1
,nomoretrees_1,L);
    IF Llast_1=Lfinal THEN Lrest_1:=NIL;
    IF NOT nomoretrees_1 THEN
      BEGIN
      Match_HEAD(Lfirst_1,Llast_1,TRUE,itemmatch);
      match:=itemmatch;
END
    END
  ELSE
  BEGIN
IF Llast_1=Lfinal THEN Lrest_1:=NIL;
    Match_HEAD(Lfirst_1,Llast_1,FALSE,match);
    END;
END;{MatchList1Items}
                                                        BEGIN{Exist1}
    next:=mu.first;match:=False;Lfinal:=mu.last;
    IF next =NIL THEN
      EXIST1:=False
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND NOT(match) DO
      BEGIN
        matchlist1items(next,TRUE,match);
        next:=next^.brother;
      END;
      IF match = False THEN
        matchlist1items(next,TRUE,match);
      EXIST1:=match;
    END;
  END;{Exist}
                                                      BEGIN
matchcondI1:=FALSE;
  IF
((NOT Exist1(MU1)                                       )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

END;{matchcondI1}
                                                      PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>CN THEN
      match:=FALSE;
    IF match THEN
      CNREC1:=s^.ls^.CNfield^;
  END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    PROCEDURE Match_MU1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU1.first:=Lfirst;
        MU1.last:=Llast;
        match:= matchcondI1;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU1(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU1(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM1_1:=L;WHILE LlastM1_1^.brother<>NIL DO
LlastM1_1:=LlastM1_1^.brother;
match_MU1(L,LlastM1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist1items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>SENTENCE THEN
      match:=FALSE;
    IF match THEN
      SENTENCEREC1:=s^.ls^.SENTENCEfield^;
    IF match THEN
      match:= matchcondI2;
  END{MatchNode};
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    PROCEDURE Match_SHIFTREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeVar(Lfirst,Llast,first,SHIFTREL,T1,match,lastmatchM2_1);
END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_SHIFTREL(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_MU2(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU2.first:=Lfirst;
        MU2.last:=Llast;
        match:= matchcondI5;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU2(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_RMfirst(L,match,item1,LfirstM2_1,LlastM2_1
,item2,LfirstM2_2,LlastM2_2
) ELSE match_SHIFTREL(LfirstM2_1,LfirstM2_1,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,SHIFTREL,match,matchnode,matchlist2items,lastmatch) END;
                                                      PROCEDURE createM;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CN;
    N^.ls^.CNfield^ := CNREC2;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU1(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU1}
    copylist(MU1,list);
    END{MU1};
                                                        BEGIN{createitem11}
  createMU1(list);
  END;
  PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createPOSTMODREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := SENTENCE;
        N^.ls^.SENTENCEfield^ := SENTENCEREC2;
      END{CreateNode};
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      VAR list:LSMRUQUO_ListOfStrees;
      PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU2}
        copylist(MU2,list);
        END{MU2};
                                                            BEGIN{createitem11}
      createMU2(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem11);
      END{createlist1};
                                                          BEGIN{POSTMODREL}
LSMATCHES_createitem(list,POSTMODREL,SENTENCE,createnode,createlist1);
    END{POSTMODREL};
                                                        BEGIN{createitem12}
  createPOSTMODREL(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createSIG1(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{SIG1}
    copylist(SIG1,list);
    END{SIG1};
                                                        BEGIN{createitem13}
  createSIG1(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m:=MAKET_stree(CN);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                       FUNCTION subrule0X2 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>CNVAR THEN
        match:=FALSE;
      IF match THEN
        CNVARREC1:=s^.ls^.CNVARfield^;
    END{MatchNode};
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION17;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION21;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
SENTENCEREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION25;
BEGIN
CNREC2:=CNREC1;                                       ;
CNREC2.POSSGENI:=FALSE
                                                      ;
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
CNREC1loc:LSDOMAINT_CNVARrecord;
BEGIN
CNREC1loc:=COPYT_CNTOVAR(CNREC1);
result:=TRUE
AND
(CNVARREC1.req=CNREC1loc.req)AND
(CNVARREC1.env=CNREC1loc.env)AND
(CNVARREC1.superdeixis=CNREC1loc.superdeixis)AND
(CNVARREC1.class=CNREC1loc.class)AND
(CNVARREC1.deixis=CNREC1loc.deixis)AND
(CNVARREC1.aspect=CNREC1loc.aspect)AND
(CNVARREC1.retro=CNREC1loc.retro)AND
(CNVARREC1.definite=CNREC1loc.definite)AND
(CNVARREC1.numbers=CNREC1loc.numbers)AND
(CNVARREC1.genders=CNREC1loc.genders)AND
(CNVARREC1.sexes=CNREC1loc.sexes)AND
(CNVARREC1.actsubcs=CNREC1loc.actsubcs)AND
(CNVARREC1.temporal=CNREC1loc.temporal)AND
(CNVARREC1.possgeni=CNREC1loc.possgeni)AND
(CNVARREC1.animate=CNREC1loc.animate)AND
(CNVARREC1.human=CNREC1loc.human)AND
(CNVARREC1.posscomas=CNREC1loc.posscomas)AND
(CNVARREC1.thetanp=CNREC1loc.thetanp)AND
(CNVARREC1.nounpatternefs=CNREC1loc.nounpatternefs)
;except1:=result
END;
                                                       BEGIN{02}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF ((CNVARREC1.INDEX =level                                )
                                                      )
THEN IF
          ((except1                                               )
                                                      )
THEN IF
          ((CNVARREC1.CASES *[NOMINATIVE,
DATIVE,
ACCUSATIVE]                                           <>[]                                                    )
                                                      )
                                                       THEN
      BEGIN
      IF ((SENTENCEREC1.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
THEN IF
          ((SENTENCEREC1.DEIXIS =OMEGADEIXIS                      )
                                                      )
THEN IF
          ((((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_CNrec(CNREC2);
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        action17;
        action25;
        createSIG1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((SENTENCEREC1.DEIXIS =OMEGADEIXIS                      )
                                                      )
THEN IF
          ((SENTENCEREC1.SUPERDEIXIS =CNREC1.SUPERDEIXIS          )
                                                      )
THEN IF
          ((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_CNrec(CNREC2);
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        action21;
        action25;
        createSIG1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                       subrule0X2:=result
 END;
 FUNCTION subrule0X3 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT1_1,LrestT1_1,LfirstT1_1,LlastT1_1:LSSTREE_prelnode;
iT1_1:INTEGER;
nomoretreesT1_1,lastmatchT1_1:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createPUNCREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := PUNC;
          N^.ls^.PUNCfield^ := PUNCREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{PUNCREL}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=PUNCREL;
s:=PUNCREC1tree;
      relnode^.node:=s;
      END{PUNCREL};
                                                          BEGIN{createitem11}
    createPUNCREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>RADVP THEN
        match:=FALSE;
      IF match THEN
        RADVPREC1:=s^.ls^.RADVPfield^;
    END{MatchNode};
                                                          PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>CNVAR THEN
            match:=FALSE;
          IF match THEN
            CNVARREC1:=s^.ls^.CNVARfield^;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT1_1,LfirstT1_1,LrestT1_1,nomoretreesT1_1) END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n >=1) AND (s^.li^.n <=1);
        IF match THEN
          BEGIN
          lsrel1:=HEAD;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(s^.sons,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
          END;
IF match THEN matchlist1items(s^.sons,first,match);
    END;
                                                       BEGIN{03}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
                                                       subrule0X3:=result
 END;
 FUNCTION subrule0X4 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT1_1,LrestT1_1,LfirstT1_1,LlastT1_1:LSSTREE_prelnode;
iT1_1:INTEGER;
nomoretreesT1_1,lastmatchT1_1:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>RADVP THEN
        match:=FALSE;
      IF match THEN
        RADVPREC1:=s^.ls^.RADVPfield^;
    END{MatchNode};
                                                          PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>CNVAR THEN
            match:=FALSE;
          IF match THEN
            CNVARREC1:=s^.ls^.CNVARfield^;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT1_1,LfirstT1_1,LrestT1_1,nomoretreesT1_1) END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n >=1) AND (s^.li^.n <=1);
        IF match THEN
          BEGIN
          lsrel1:=HEAD;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(s^.sons,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
          END;
IF match THEN matchlist1items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION59;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION63;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
SENTENCEREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION67;
BEGIN
CNREC2:=CNREC1;                                       ;
CNREC2.POSSGENI:=FALSE
                                                      ;
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
CNREC1loc:LSDOMAINT_CNVARrecord;
BEGIN
CNREC1loc:=COPYT_CNTOVAR(CNREC1);
result:=TRUE
AND
(CNVARREC1.req=CNREC1loc.req)AND
(CNVARREC1.env=CNREC1loc.env)AND
(CNVARREC1.superdeixis=CNREC1loc.superdeixis)AND
(CNVARREC1.class=CNREC1loc.class)AND
(CNVARREC1.deixis=CNREC1loc.deixis)AND
(CNVARREC1.aspect=CNREC1loc.aspect)AND
(CNVARREC1.retro=CNREC1loc.retro)AND
(CNVARREC1.definite=CNREC1loc.definite)AND
(CNVARREC1.numbers=CNREC1loc.numbers)AND
(CNVARREC1.genders=CNREC1loc.genders)AND
(CNVARREC1.sexes=CNREC1loc.sexes)AND
(CNVARREC1.actsubcs=CNREC1loc.actsubcs)AND
(CNVARREC1.temporal=CNREC1loc.temporal)AND
(CNVARREC1.possgeni=CNREC1loc.possgeni)AND
(CNVARREC1.animate=CNREC1loc.animate)AND
(CNVARREC1.human=CNREC1loc.human)AND
(CNVARREC1.posscomas=CNREC1loc.posscomas)AND
(CNVARREC1.thetanp=CNREC1loc.thetanp)AND
(CNVARREC1.nounpatternefs=CNREC1loc.nounpatternefs)
;except1:=result
END;
                                                       BEGIN{04}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF ((PK IN RADVPREC1.KINDEFS                               )
                                                      )
THEN IF
          ((RADVPREC1.RADVKEY =0                                  )
                                                      )
THEN IF
          ((RADVPREC1.MOOD =DECLXPMOOD                            )
                                                      )
THEN IF
          ((((CNVARREC1.INDEX =level                                )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((except1                                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((CNVARREC1.CASES *[RCASE]                                               <>
[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      IF ((SENTENCEREC1.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
THEN IF
          ((SENTENCEREC1.DEIXIS =OMEGADEIXIS                      )
                                                      )
THEN IF
          ((((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_CNrec(CNREC2);
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        action59;
        action67;
        createSIG1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((SENTENCEREC1.DEIXIS =OMEGADEIXIS                      )
                                                      )
THEN IF
          ((SENTENCEREC1.SUPERDEIXIS =CNREC1.SUPERDEIXIS          )
                                                      )
THEN IF
          ((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_CNrec(CNREC2);
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        action63;
        action67;
        createSIG1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                       subrule0X4:=result
 END;
 FUNCTION subrule0X5 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT1_1,LrestT1_1,LfirstT1_1,LlastT1_1:LSSTREE_prelnode;
iT1_1:INTEGER;
nomoretreesT1_1,lastmatchT1_1:BOOLEAN;
LinitT1_2,LrestT1_2,LfirstT1_2,LlastT1_2:LSSTREE_prelnode;
iT1_2:INTEGER;
nomoretreesT1_2,lastmatchT1_2:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createPUNCREL(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := PUNC;
          N^.ls^.PUNCfield^ := PUNCREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{PUNCREL}
      LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
      list.first:=relnode;
      list.last:=relnode;
      relnode^.relation:=PUNCREL;
s:=PUNCREC1tree;
      relnode^.node:=s;
      END{PUNCREL};
                                                          BEGIN{createitem11}
    createPUNCREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      lirel2:LIDOMAINT_synrel;
      lsrel2:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>VARPREPP THEN
        match:=FALSE;
      IF match THEN
        VARPREPPREC1:=s^.ls^.VARPREPPfield^;
    END{MatchNode};
                                                          PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PREP THEN
            match:=FALSE;
          IF match THEN
            PREPREC1:=s^.ls^.PREPfield^;
          IF match THEN match:=(s^.ls^.PREPfield^.key=auxkey('INPREPKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PREPREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT1_1) END;
                                                            PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
      PROCEDURE Match_OBJREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>CNVAR THEN
            match:=FALSE;
          IF match THEN
            CNVARREC1:=s^.ls^.CNVARfield^;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,OBJREL
,match,matchnode,matchlist0items,lastmatchT1_2) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_OBJREL,matchlist0items,
LlastT1_2,LfirstT1_2,LrestT1_2,nomoretreesT1_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastT1_1,LfirstT1_1,LrestT1_1,nomoretreesT1_1) END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n >=2) AND (s^.li^.n <=2);
        IF match THEN
          BEGIN
          lsrel1:=HEAD;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lsrel2:=OBJREL;
          lirel2:= loopholes.retype(lsrel2,LIDOMAINT_synrel);
          lisons:=loopholes.retype(s^.sons,LISTREE_pRelnode);
          match:= LIMATCHES_TEST2rels(lirel1,lirel2,lisons,FALSE);
          END;
IF match THEN matchlist2items(s^.sons,first,match);
    END;
                                                       BEGIN{05}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
                                                       subrule0X5:=result
 END;
 FUNCTION subrule0X6 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT1_1,LrestT1_1,LfirstT1_1,LlastT1_1:LSSTREE_prelnode;
iT1_1:INTEGER;
nomoretreesT1_1,lastmatchT1_1:BOOLEAN;
LinitT1_2,LrestT1_2,LfirstT1_2,LlastT1_2:LSSTREE_prelnode;
iT1_2:INTEGER;
nomoretreesT1_2,lastmatchT1_2:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      lirel2:LIDOMAINT_synrel;
      lsrel2:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>VARPREPP THEN
        match:=FALSE;
      IF match THEN
        VARPREPPREC1:=s^.ls^.VARPREPPfield^;
    END{MatchNode};
                                                          PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PREP THEN
            match:=FALSE;
          IF match THEN
            PREPREC1:=s^.ls^.PREPfield^;
          IF match THEN match:=(s^.ls^.PREPfield^.key=auxkey('INPREPKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PREPREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT1_1) END;
                                                            PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
      PROCEDURE Match_OBJREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>CNVAR THEN
            match:=FALSE;
          IF match THEN
            CNVARREC1:=s^.ls^.CNVARfield^;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,OBJREL
,match,matchnode,matchlist0items,lastmatchT1_2) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_OBJREL,matchlist0items,
LlastT1_2,LfirstT1_2,LrestT1_2,nomoretreesT1_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastT1_1,LfirstT1_1,LrestT1_1,nomoretreesT1_1) END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n >=2) AND (s^.li^.n <=2);
        IF match THEN
          BEGIN
          lsrel1:=HEAD;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lsrel2:=OBJREL;
          lirel2:= loopholes.retype(lsrel2,LIDOMAINT_synrel);
          lisons:=loopholes.retype(s^.sons,LISTREE_pRelnode);
          match:= LIMATCHES_TEST2rels(lirel1,lirel2,lisons,FALSE);
          END;
IF match THEN matchlist2items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION103;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION107;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
SENTENCEREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION111;
BEGIN
CNREC2:=CNREC1;                                       ;
CNREC2.POSSGENI:=FALSE
                                                      ;
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
CNREC1loc:LSDOMAINT_CNVARrecord;
BEGIN
CNREC1loc:=COPYT_CNTOVAR(CNREC1);
result:=TRUE
AND
(CNVARREC1.req=CNREC1loc.req)AND
(CNVARREC1.env=CNREC1loc.env)AND
(CNVARREC1.superdeixis=CNREC1loc.superdeixis)AND
(CNVARREC1.class=CNREC1loc.class)AND
(CNVARREC1.deixis=CNREC1loc.deixis)AND
(CNVARREC1.aspect=CNREC1loc.aspect)AND
(CNVARREC1.retro=CNREC1loc.retro)AND
(CNVARREC1.definite=CNREC1loc.definite)AND
(CNVARREC1.numbers=CNREC1loc.numbers)AND
(CNVARREC1.genders=CNREC1loc.genders)AND
(CNVARREC1.sexes=CNREC1loc.sexes)AND
(CNVARREC1.actsubcs=CNREC1loc.actsubcs)AND
(CNVARREC1.temporal=CNREC1loc.temporal)AND
(CNVARREC1.possgeni=CNREC1loc.possgeni)AND
(CNVARREC1.animate=CNREC1loc.animate)AND
(CNVARREC1.human=CNREC1loc.human)AND
(CNVARREC1.posscomas=CNREC1loc.posscomas)AND
(CNVARREC1.thetanp=CNREC1loc.thetanp)AND
(CNVARREC1.nounpatternefs=CNREC1loc.nounpatternefs)
;except1:=result
END;
                                                       BEGIN{06}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF (((VARPREPPREC1.MOOD=RELATIVEXPMOOD) AND 
          (VARPREPPREC1.ACTSUBCEFS=PREPREC1.SUBCS) AND 
                    (VARPREPPREC1.THETAPP=PREPREC1.THETAPP) AND 
                    (VARPREPPREC1.HEADKEY=PREPREC1.KEY) AND 
                    (VARPREPPREC1.CLASS=PREPREC1.CLASS) AND 
                    (VARPREPPREC1.DEIXIS=PREPREC1.DEIXIS) AND 
                    (VARPREPPREC1.ASPECT=PREPREC1.ASPECT) AND 
                    (VARPREPPREC1.RETRO=PREPREC1.RETRO) AND 
                    (VARPREPPREC1.RADVKEY=0) AND 
          (VARPREPPREC1.SPECQ=YESSPEC) AND 
          TRUE
                                                      )
                                                      )
THEN IF
          ((VARPREPPREC1.SYNPPEFS *PREPREC1.SYNPPS<>[]                                                    )
                                                      )
THEN IF
          ((((CNVARREC1.INDEX =level                                )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((except1                                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((CNVARREC1.HUMAN<>YESHUMAN                             )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((CNVARREC1.CASES *[ACCUSATIVE]                                          <>
[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      IF ((SENTENCEREC1.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
THEN IF
          ((SENTENCEREC1.DEIXIS =OMEGADEIXIS                      )
                                                      )
THEN IF
          ((((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_CNrec(CNREC2);
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        action103;
        action111;
        createSIG1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((SENTENCEREC1.DEIXIS =OMEGADEIXIS                      )
                                                      )
THEN IF
          ((SENTENCEREC1.SUPERDEIXIS =CNREC1.SUPERDEIXIS          )
                                                      )
THEN IF
          ((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_CNrec(CNREC2);
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        action107;
        action111;
        createSIG1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                       subrule0X6:=result
 END;
 FUNCTION subrule0X7 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT1_1,LrestT1_1,LfirstT1_1,LlastT1_1:LSSTREE_prelnode;
iT1_1:INTEGER;
nomoretreesT1_1,lastmatchT1_1:BOOLEAN;
LinitT1_2,LrestT1_2,LfirstT1_2,LlastT1_2:LSSTREE_prelnode;
iT1_2:INTEGER;
nomoretreesT1_2,lastmatchT1_2:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createSIG1;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    BEGIN{createlist1}
    wholelist.first:=NIL;
    wholelist.last:=NIL;
    END{createlist1};
                                                        BEGIN{SIG1}
  createlist1(SIG1);
  END{SIG1};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      lirel2:LIDOMAINT_synrel;
      lsrel2:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>VARPREPP THEN
        match:=FALSE;
      IF match THEN
        VARPREPPREC1:=s^.ls^.VARPREPPfield^;
    END{MatchNode};
                                                          PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PREP THEN
            match:=FALSE;
          IF match THEN
            PREPREC1:=s^.ls^.PREPfield^;
          IF match THEN match:=(s^.ls^.PREPfield^.key=auxkey('S_PREP1243607'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PREPREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT1_1) END;
                                                            PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
      PROCEDURE Match_OBJREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>CNVAR THEN
            match:=FALSE;
          IF match THEN
            CNVARREC1:=s^.ls^.CNVARfield^;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,OBJREL
,match,matchnode,matchlist0items,lastmatchT1_2) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_OBJREL,matchlist0items,
LlastT1_2,LfirstT1_2,LrestT1_2,nomoretreesT1_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastT1_1,LfirstT1_1,LrestT1_1,nomoretreesT1_1) END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n >=2) AND (s^.li^.n <=2);
        IF match THEN
          BEGIN
          lsrel1:=HEAD;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lsrel2:=OBJREL;
          lirel2:= loopholes.retype(lsrel2,LIDOMAINT_synrel);
          lisons:=loopholes.retype(s^.sons,LISTREE_pRelnode);
          match:= LIMATCHES_TEST2rels(lirel1,lirel2,lisons,FALSE);
          END;
IF match THEN matchlist2items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION130;
BEGIN
SENTENCEREC2:=SENTENCEREC1;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION134;
BEGIN
CNREC2:=CNREC1;                                       ;
CNREC2.POSSGENI:=FALSE
                                                      ;
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
CNREC1loc:LSDOMAINT_CNVARrecord;
BEGIN
CNREC1loc:=COPYT_CNTOVAR(CNREC1);
result:=TRUE
AND
(CNVARREC1.req=CNREC1loc.req)AND
(CNVARREC1.env=CNREC1loc.env)AND
(CNVARREC1.superdeixis=CNREC1loc.superdeixis)AND
(CNVARREC1.class=CNREC1loc.class)AND
(CNVARREC1.deixis=CNREC1loc.deixis)AND
(CNVARREC1.aspect=CNREC1loc.aspect)AND
(CNVARREC1.retro=CNREC1loc.retro)AND
(CNVARREC1.definite=CNREC1loc.definite)AND
(CNVARREC1.numbers=CNREC1loc.numbers)AND
(CNVARREC1.genders=CNREC1loc.genders)AND
(CNVARREC1.sexes=CNREC1loc.sexes)AND
(CNVARREC1.actsubcs=CNREC1loc.actsubcs)AND
(CNVARREC1.temporal=CNREC1loc.temporal)AND
(CNVARREC1.possgeni=CNREC1loc.possgeni)AND
(CNVARREC1.animate=CNREC1loc.animate)AND
(CNVARREC1.human=CNREC1loc.human)AND
(CNVARREC1.posscomas=CNREC1loc.posscomas)AND
(CNVARREC1.thetanp=CNREC1loc.thetanp)AND
(CNVARREC1.nounpatternefs=CNREC1loc.nounpatternefs)
;except1:=result
END;
                                                       BEGIN{07}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF (((VARPREPPREC1.MOOD=RELATIVEXPMOOD) AND 
          (VARPREPPREC1.ACTSUBCEFS=PREPREC1.SUBCS) AND 
                    (VARPREPPREC1.THETAPP=PREPREC1.THETAPP) AND 
                    (VARPREPPREC1.HEADKEY=PREPREC1.KEY) AND 
                    (VARPREPPREC1.CLASS=PREPREC1.CLASS) AND 
                    (VARPREPPREC1.DEIXIS=PREPREC1.DEIXIS) AND 
                    (VARPREPPREC1.ASPECT=PREPREC1.ASPECT) AND 
                    (VARPREPPREC1.RETRO=PREPREC1.RETRO) AND 
                    (VARPREPPREC1.RADVKEY=0) AND 
          (VARPREPPREC1.SPECQ=YESSPEC) AND 
          TRUE
                                                      )
                                                      )
THEN IF
          ((VARPREPPREC1.SYNPPEFS *PREPREC1.SYNPPS<>[]                                                    )
                                                      )
THEN IF
          ((((CNVARREC1.INDEX =level                                )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((except1                                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((CNREC1.TEMPORAL =TRUE                                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((CNVARREC1.CASES *[ACCUSATIVE]                                          <>
[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      IF ((SENTENCEREC1.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
THEN IF
          ((SENTENCEREC1.DEIXIS =OMEGADEIXIS                      )
                                                      )
                                                       THEN
        BEGIN
        MAKET_CNrec(CNREC2);
        MAKET_SENTENCErec(SENTENCEREC2);
        MAKET_PUNCrec(PUNCREC1);
        action130;
        action134;
        createSIG1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                       subrule0X7:=result
 END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
m2:=loopholes.retype(Is2,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
  BEGIN
    MatchModel2(m2,TRUE,match);
    If match Then
    BEGIN
    LISTREE_mergesetsofstrees(subrule0X2,result);
    LISTREE_mergesetsofstrees(subrule0X3,result);
    LISTREE_mergesetsofstrees(subrule0X4,result);
    LISTREE_mergesetsofstrees(subrule0X5,result);
    LISTREE_mergesetsofstrees(subrule0X6,result);
    LISTREE_mergesetsofstrees(subrule0X7,result);
 END;
    END;
COMRCNMODINFREL:=result
END;
{:RCNMODINFREL}
