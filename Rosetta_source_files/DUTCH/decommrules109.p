EXPORT(decommrules);
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
pragma C_include('aidderiv.pf');
pragma C_include('hyperdtree.pf');
pragma C_include('strtokey.pf');
pragma C_include('lsmruquo.pf');
pragma C_include('lsauxdom.pf');
pragma C_include('ldblex.pf');
PACKAGE decommrules;
WITH listree,lsdomaint;
pragma C_include('decommrules109.pf');
END;
PROGRAM decomMrules109;
WITH globsubst,listree,limatches,lsmatches,
lidomaint,liiddict,lsdomaint,maket,lsstree,
copyt,mem,
aidderiv,hyperdtree,strtokey,lsmruquo,
lsauxdom,ldblex;
TYPE synrelset=SET OF LSDOMAINT_synrel;
VAR hulpstree:LISTREE_pstree;
 VPID:LSDOMAINT_synpatternsettype;
hulplsstree:LSSTREE_pstree;
 PROCEDURE decommrules109_init;
BEGIN
END;
{rule:}
{:RCNMODADVP1}
 FUNCTION DECRCNMODADVP1(VAR LEVEL,subst:INTEGER;
Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
VAR result:LISTREE_SetOfTupleOfStrees;
 wbonus,sbonus:INTEGER;
 m:LSSTREE_pstree;
 tuple:LISTREE_TupleOfStrees;
 first:BOOLEAN;
 match:BOOLEAN;
 idargs:LIIDDICT_idargs;
dtree:HYPERDTREE_phyperdtree;
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
LinitM_1,LrestM_1,LfirstM_1,LlastM_1:LSSTREE_prelnode;
iM_1:INTEGER;
nomoretreesM_1,lastmatchM_1:BOOLEAN;
LinitM_2,LrestM_2,LfirstM_2,LlastM_2:LSSTREE_prelnode;
iM_2:INTEGER;
nomoretreesM_2,lastmatchM_2:BOOLEAN;
LinitM_2_1,LrestM_2_1,LfirstM_2_1,LlastM_2_1:LSSTREE_prelnode;
iM_2_1:INTEGER;
nomoretreesM_2_1,lastmatchM_2_1:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
LinitM_4,LrestM_4,LfirstM_4,LlastM_4:LSSTREE_prelnode;
iM_4:INTEGER;
nomoretreesM_4,lastmatchM_4:BOOLEAN;
LinitM_4_1,LrestM_4_1,LfirstM_4_1,LlastM_4_1:LSSTREE_prelnode;
iM_4_1:INTEGER;
nomoretreesM_4_1,lastmatchM_4_1:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
N1:LSDOMAINT_lsrecord;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU9:LSMRUQUO_ListOfStrees;
SENTENCEREC1:LSDOMAINT_SENTENCErecord;
CNVARREC1:LSDOMAINT_CNVARrecord;
OPENADVPPROPREC1:LSDOMAINT_ADVPPROPrecord;
CNREC1:LSDOMAINT_CNrecord;
ADVPREC1:LSDOMAINT_ADVPrecord;
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
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CN;
    N^.ls^.CNfield^ := CNREC1;
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
  BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(CN);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
PROCEDURE createM2;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := OPENADVPPROP;
    N^.ls^.OPENADVPPROPfield^ := OPENADVPPROPREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createSUBJREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := CNVAR;
        N^.ls^.CNVARfield^ := CNVARREC1;
      END{CreateNode};
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      BEGIN
      wholelist.first:=NIL;wholelist.last:=NIL;
      END;
                                                          BEGIN{SUBJREL}
LSMATCHES_createitem(list,SUBJREL,CNVAR,createnode,createlist1);
    END{SUBJREL};
                                                        BEGIN{createitem11}
  createSUBJREL(list);
  END;
  PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createPREDREL(VAR list:LSMRUQUO_ListOfStrees);
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
                                                          BEGIN{PREDREL}
LSMATCHES_createitem(list,PREDREL,ADVP,createnode,createlist1);
    END{PREDREL};
                                                        BEGIN{createitem12}
  createPREDREL(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist2items11(wholelist,createitem11,createitem12);
  END{createlist1};
                                                      BEGIN{createM}
m2:=MAKET_stree(OPENADVPPROP);
createnode(m2);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m2^.li^.n:=numberofelements(list);
m2^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  lirel2:LIDOMAINT_synrel;
  lsrel2:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>CN THEN
      match:=FALSE;
    IF match THEN
      CNREC2:=s^.ls^.CNfield^;
  END{MatchNode};
                                                      PROCEDURE MatchList4Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
LlastM_2_1:=L;WHILE LlastM_2_1^.brother<>NIL DO
LlastM_2_1:=LlastM_2_1^.brother;
match_MU2(L,LlastM_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeCon0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_2,matchcondI1) END;
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
    PROCEDURE Match_POSTMODREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
LlastM_4_1:=L;WHILE LlastM_4_1^.brother<>NIL DO
LlastM_4_1:=LlastM_4_1^.brother;
match_MU4(L,LlastM_4_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,POSTMODREL
,match,matchnode,matchlist1items,lastmatchM_4) END;
                                                      PROCEDURE item4(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_POSTMODREL(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMRfirst(L,match,item1,LfirstM_1,LlastM_1
,HEAD,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
,item4,LfirstM_4,LlastM_4
) ELSE BEGIN match_HEAD(LfirstM_2,LfirstM_2,FALSE,match);
IF NOT match THEN match_POSTMODREL(LfirstM_4,LfirstM_4,FALSE,match) END END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,HEAD,POSTMODREL,match,matchnode,matchlist4items,lastmatch) END;
                                                      PROCEDURE ACTION16;
BEGIN
CNREC1:=CNREC2;                                       ;
OPENADVPPROPREC1:=COPYT_ADVPTOPROP(ADVPREC1);         ;
OPENADVPPROPREC1.PROSUBJECT:=TRUE
                                                      ;
OPENADVPPROPREC1.AKTIONSARTS:=[STATIVE]                                             ;
OPENADVPPROPREC1.SUPERDEIXIS:=CNREC1.SUPERDEIXIS
                                                      ;
CNVARREC1:=COPYT_CNTOVAR(CNREC2);                     ;
CNVARREC1.INDEX:=level
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      BEGIN
m:=loopholes.retype(Is,LSSTREE_pstree);
LISTREE_InitSetOfTupleOfStrees(result);
match:=TRUE;
first:=TRUE;
matchmodel(m,first,match);
first:=FALSE;
IF match THEN
 BEGIN
 level:=LIMATCHES_newlevel;
 subst:=1;
 END;
IF match THEN
  BEGIN
IF ((TRUE                                                  )
                                                      )
                                                       THEN
  BEGIN
  MAKET_CNrec(CNREC1);
  MAKET_OPENADVPPROPrec(OPENADVPPROPREC1);
  MAKET_CNVARrec(CNVARREC1);
  action16;
  createM1;
  createM2;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  Is2:=loopholes.retype(m2,LISTREE_pstree);
  LISTREE_addtotuple(Is2,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
                                                        END;
                                                      DECRCNMODADVP1:=result
END;
{:RCNMODADVP1}
{rule:}
{:RCNMODADVP2}
 FUNCTION DECRCNMODADVP2(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
VAR result:LISTREE_SetOfTupleOfStrees;
 wbonus,sbonus:INTEGER;
 m:LSSTREE_pstree;
 tuple:LISTREE_TupleOfStrees;
 first:BOOLEAN;
 match:BOOLEAN;
 idargs:LIIDDICT_idargs;
dtree:HYPERDTREE_phyperdtree;
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
LinitM_1,LrestM_1,LfirstM_1,LlastM_1:LSSTREE_prelnode;
iM_1:INTEGER;
nomoretreesM_1,lastmatchM_1:BOOLEAN;
LinitM_2,LrestM_2,LfirstM_2,LlastM_2:LSSTREE_prelnode;
iM_2:INTEGER;
nomoretreesM_2,lastmatchM_2:BOOLEAN;
LinitM_2_1,LrestM_2_1,LfirstM_2_1,LlastM_2_1:LSSTREE_prelnode;
iM_2_1:INTEGER;
nomoretreesM_2_1,lastmatchM_2_1:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
LinitM_4,LrestM_4,LfirstM_4,LlastM_4:LSSTREE_prelnode;
iM_4:INTEGER;
nomoretreesM_4,lastmatchM_4:BOOLEAN;
LinitM_4_1,LrestM_4_1,LfirstM_4_1,LlastM_4_1:LSSTREE_prelnode;
iM_4_1:INTEGER;
nomoretreesM_4_1,lastmatchM_4_1:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
N1:LSDOMAINT_lsrecord;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU9:LSMRUQUO_ListOfStrees;
SENTENCEREC1:LSDOMAINT_SENTENCErecord;
CNREC1:LSDOMAINT_CNrecord;
ADVPREC1:LSDOMAINT_ADVPrecord;
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
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CN;
    N^.ls^.CNfield^ := CNREC1;
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
  BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(CN);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
PROCEDURE createM2;
VAR list:LSMRUQUO_ListOfStrees;
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
                                                      BEGIN{createM}
m2:=MAKET_stree(ADVP);
createnode(m2);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m2^.li^.n:=numberofelements(list);
m2^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  lirel2:LIDOMAINT_synrel;
  lsrel2:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>CN THEN
      match:=FALSE;
    IF match THEN
      CNREC2:=s^.ls^.CNfield^;
  END{MatchNode};
                                                      PROCEDURE MatchList4Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
LlastM_2_1:=L;WHILE LlastM_2_1^.brother<>NIL DO
LlastM_2_1:=LlastM_2_1^.brother;
match_MU2(L,LlastM_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeCon0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_2,matchcondI1) END;
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
    PROCEDURE Match_POSTMODREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
LlastM_4_1:=L;WHILE LlastM_4_1^.brother<>NIL DO
LlastM_4_1:=LlastM_4_1^.brother;
match_MU4(L,LlastM_4_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,POSTMODREL
,match,matchnode,matchlist1items,lastmatchM_4) END;
                                                      PROCEDURE item4(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_POSTMODREL(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMRfirst(L,match,item1,LfirstM_1,LlastM_1
,HEAD,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
,item4,LfirstM_4,LlastM_4
) ELSE BEGIN match_HEAD(LfirstM_2,LfirstM_2,FALSE,match);
IF NOT match THEN match_POSTMODREL(LfirstM_4,LfirstM_4,FALSE,match) END END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,HEAD,POSTMODREL,match,matchnode,matchlist4items,lastmatch) END;
                                                      PROCEDURE ACTION7;
BEGIN
ADVPREC1.SUPERDEIXIS:=CNREC2.SUPERDEIXIS
                                                      ;
CNREC1:=CNREC2;                                       ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      BEGIN
m:=loopholes.retype(Is,LSSTREE_pstree);
LISTREE_InitSetOfTupleOfStrees(result);
match:=TRUE;
first:=TRUE;
matchmodel(m,first,match);
first:=FALSE;
IF match THEN
 BEGIN
 END;
IF match THEN
  BEGIN
IF ((TRUE                                                  )
                                                      )
                                                       THEN
  BEGIN
  MAKET_CNrec(CNREC1);
  action7;
  createM1;
  createM2;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  Is2:=loopholes.retype(m2,LISTREE_pstree);
  LISTREE_addtotuple(Is2,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
                                                        END;
                                                      DECRCNMODADVP2:=result
END;
{:RCNMODADVP2}
{rule:}
{:RCNMODPOSTPARTICPLE}
 FUNCTION DECRCNMODPOSTPARTICPLE(VAR LEVEL,subst:INTEGER;
Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
VAR result:LISTREE_SetOfTupleOfStrees;
 wbonus,sbonus:INTEGER;
 m:LSSTREE_pstree;
 tuple:LISTREE_TupleOfStrees;
 first:BOOLEAN;
 match:BOOLEAN;
 idargs:LIIDDICT_idargs;
dtree:HYPERDTREE_phyperdtree;
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
LinitM_1,LrestM_1,LfirstM_1,LlastM_1:LSSTREE_prelnode;
iM_1:INTEGER;
nomoretreesM_1,lastmatchM_1:BOOLEAN;
LinitM_2,LrestM_2,LfirstM_2,LlastM_2:LSSTREE_prelnode;
iM_2:INTEGER;
nomoretreesM_2,lastmatchM_2:BOOLEAN;
LinitM_2_1,LrestM_2_1,LfirstM_2_1,LlastM_2_1:LSSTREE_prelnode;
iM_2_1:INTEGER;
nomoretreesM_2_1,lastmatchM_2_1:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
LinitM_4,LrestM_4,LfirstM_4,LlastM_4:LSSTREE_prelnode;
iM_4:INTEGER;
nomoretreesM_4,lastmatchM_4:BOOLEAN;
LinitM_4_1,LrestM_4_1,LfirstM_4_1,LlastM_4_1:LSSTREE_prelnode;
iM_4_1:INTEGER;
nomoretreesM_4_1,lastmatchM_4_1:BOOLEAN;
LinitM_4_2,LrestM_4_2,LfirstM_4_2,LlastM_4_2:LSSTREE_prelnode;
iM_4_2:INTEGER;
nomoretreesM_4_2,lastmatchM_4_2:BOOLEAN;
LinitM_4_2_1,LrestM_4_2_1,LfirstM_4_2_1,LlastM_4_2_1:LSSTREE_prelnode;
iM_4_2_1:INTEGER;
nomoretreesM_4_2_1,lastmatchM_4_2_1:BOOLEAN;
LinitM_4_2_2,LrestM_4_2_2,LfirstM_4_2_2,LlastM_4_2_2:LSSTREE_prelnode;
iM_4_2_2:INTEGER;
nomoretreesM_4_2_2,lastmatchM_4_2_2:BOOLEAN;
LinitM_4_2_2_1,LrestM_4_2_2_1,LfirstM_4_2_2_1,LlastM_4_2_2_1:LSSTREE_prelnode;
iM_4_2_2_1:INTEGER;
nomoretreesM_4_2_2_1,lastmatchM_4_2_2_1:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
REL1:LSDOMAINT_synrel;
N1:LSDOMAINT_lsrecord;
T1:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
CNVARREC1:LSDOMAINT_CNVARrecord;
SENTENCEREC1:LSDOMAINT_SENTENCErecord;
CNREC1:LSDOMAINT_CNrecord;
VERBREC1:LSDOMAINT_VERBrecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
SENTENCEREC2:LSDOMAINT_SENTENCErecord;
CNREC2:LSDOMAINT_CNrecord;
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
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CN;
    N^.ls^.CNfield^ := CNREC1;
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
  BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(CN);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
PROCEDURE createM2;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := SENTENCE;
    N^.ls^.SENTENCEfield^ := SENTENCEREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createSUBJREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := CNVAR;
        N^.ls^.CNVARfield^ := CNVARREC1;
      END{CreateNode};
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      BEGIN
      wholelist.first:=NIL;wholelist.last:=NIL;
      END;
                                                          BEGIN{SUBJREL}
LSMATCHES_createitem(list,SUBJREL,CNVAR,createnode,createlist1);
    END{SUBJREL};
                                                        BEGIN{createitem11}
  createSUBJREL(list);
  END;
  PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU4(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU4}
    copylist(MU4,list);
    END{MU4};
                                                        BEGIN{createitem12}
  createMU4(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
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
      PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU5(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU5}
        copylist(MU5,list);
        END{MU5};
                                                            BEGIN{createitem11}
      createMU5(list);
      END;
      PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
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
          PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createMU6(VAR list:LSMRUQUO_ListOfStrees);
            BEGIN{MU6}
            copylist(MU6,list);
            END{MU6};
                                                                BEGIN{createitem21}
          createMU6(list);
          END;
          BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem21);
          END{createlist1};
                                                              BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,VERB,createnode,createlist1);
        END{HEAD};
                                                            BEGIN{createitem12}
      createHEAD(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist2items01(wholelist,createitem11,createitem12);
      END{createlist1};
                                                          BEGIN{PREDREL}
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
    END{PREDREL};
                                                        BEGIN{createitem13}
  createPREDREL(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist3items101(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m2:=MAKET_stree(SENTENCE);
createnode(m2);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m2^.li^.n:=numberofelements(list);
m2^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  lirel2:LIDOMAINT_synrel;
  lsrel2:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>CN THEN
      match:=FALSE;
    IF match THEN
      CNREC2:=s^.ls^.CNfield^;
  END{MatchNode};
                                                      PROCEDURE MatchList4Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
LlastM_2_1:=L;WHILE LlastM_2_1^.brother<>NIL DO
LlastM_2_1:=LlastM_2_1^.brother;
match_MU2(L,LlastM_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_2) END;
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
    PROCEDURE Match_POSTMODREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>SENTENCE THEN
          match:=FALSE;
        IF match THEN
          SENTENCEREC2:=s^.ls^.SENTENCEfield^;
        IF match THEN
          match:= matchcondI2;
      END{MatchNode};
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
LlastM_4_2_2_1:=L;WHILE LlastM_4_2_2_1^.brother<>NIL DO
LlastM_4_2_2_1:=LlastM_4_2_2_1^.brother;
match_MU6(L,LlastM_4_2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
                LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_4_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM_4_2_1,LlastM_4_2_1
,item2,LfirstM_4_2_2,LlastM_4_2_2
) ELSE match_HEAD(LfirstM_4_2_2,LfirstM_4_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,PREDREL
,HEAD,match,matchnode,matchlist2items,lastmatchM_4_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_PREDREL(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM_4_1,LlastM_4_1
,item2,LfirstM_4_2,LlastM_4_2
) ELSE match_PREDREL(LfirstM_4_2,LfirstM_4_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,POSTMODREL
,PREDREL,match,matchnode,matchlist2items,lastmatchM_4) END;
                                                      PROCEDURE item4(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_POSTMODREL(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMRfirst(L,match,item1,LfirstM_1,LlastM_1
,HEAD,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
,item4,LfirstM_4,LlastM_4
) ELSE BEGIN match_HEAD(LfirstM_2,LfirstM_2,FALSE,match);
IF NOT match THEN match_POSTMODREL(LfirstM_4,LfirstM_4,FALSE,match) END END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,HEAD,POSTMODREL,match,matchnode,matchlist4items,lastmatch) END;
                                                      PROCEDURE ACTION11;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION15;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=CNREC2.SUPERDEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION23;
BEGIN
CNREC1:=CNREC2;                                       ;
CNVARREC1:=COPYT_CNTOVAR(CNREC2);                     ;
CNVARREC1.INDEX:=level
                                                      ;
CNVARREC1.CASES:=[NOMINATIVE]                                          ;
                                                      
END;
                                                      BEGIN
m:=loopholes.retype(Is,LSSTREE_pstree);
LISTREE_InitSetOfTupleOfStrees(result);
match:=TRUE;
first:=TRUE;
matchmodel(m,first,match);
first:=FALSE;
IF match THEN
 BEGIN
 level:=LIMATCHES_newlevel;
 subst:=1;
 END;
IF match THEN
  BEGIN
IF ((TRUE                                                  )
                                                      )
                                                       THEN
  BEGIN
  IF ((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
THEN IF
          ((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                       THEN
    BEGIN
    MAKET_CNrec(CNREC1);
    MAKET_SENTENCErec(SENTENCEREC1);
    MAKET_CNVARrec(CNVARREC1);
    action11;
    action23;
    createM1;
    createM2;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(m2,LISTREE_pstree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
    END;
  IF ((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
THEN IF
          ((SENTENCEREC2.DEIXIS =OMEGADEIXIS                      )
                                                      )
                                                       THEN
    BEGIN
    MAKET_CNrec(CNREC1);
    MAKET_SENTENCErec(SENTENCEREC1);
    MAKET_CNVARrec(CNVARREC1);
    action15;
    action23;
    createM1;
    createM2;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(m2,LISTREE_pstree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
    END;
                                                        END;
                                                        END;
                                                      DECRCNMODPOSTPARTICPLE:=result
END;
{:RCNMODPOSTPARTICPLE}
{rule:}
{:RCNMODRELSENT1}
 FUNCTION DECRCNMODRELSENT1(VAR LEVEL,subst:INTEGER;
Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
VAR result:LISTREE_SetOfTupleOfStrees;
 wbonus,sbonus:INTEGER;
 m:LSSTREE_pstree;
 tuple:LISTREE_TupleOfStrees;
 first:BOOLEAN;
 match:BOOLEAN;
 idargs:LIIDDICT_idargs;
dtree:HYPERDTREE_phyperdtree;
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
LinitM_1,LrestM_1,LfirstM_1,LlastM_1:LSSTREE_prelnode;
iM_1:INTEGER;
nomoretreesM_1,lastmatchM_1:BOOLEAN;
LinitM_2,LrestM_2,LfirstM_2,LlastM_2:LSSTREE_prelnode;
iM_2:INTEGER;
nomoretreesM_2,lastmatchM_2:BOOLEAN;
LinitM_2_1,LrestM_2_1,LfirstM_2_1,LlastM_2_1:LSSTREE_prelnode;
iM_2_1:INTEGER;
nomoretreesM_2_1,lastmatchM_2_1:BOOLEAN;
LinitM_2_2,LrestM_2_2,LfirstM_2_2,LlastM_2_2:LSSTREE_prelnode;
iM_2_2:INTEGER;
nomoretreesM_2_2,lastmatchM_2_2:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
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
RADVPREC1:LSDOMAINT_RADVPrecord;
VARPREPPREC1:LSDOMAINT_PREPPrecord;
CNVARREC1:LSDOMAINT_CNVARrecord;
SENTENCEREC1:LSDOMAINT_SENTENCErecord;
CNREC1:LSDOMAINT_CNrecord;
BWHPROREC1:LSDOMAINT_BWHPROrecord;
WHPROREC1:LSDOMAINT_WHPROrecord;
NPREC1:LSDOMAINT_NPrecord;
PREPREC1:LSDOMAINT_PREPrecord;
RADVREC1:LSDOMAINT_RADVrecord;
RADVPREC2:LSDOMAINT_RADVPrecord;
PREPPREC1:LSDOMAINT_PREPPrecord;
RELPROREC1:LSDOMAINT_RELPROrecord;
PUNCREC1:LSDOMAINT_PUNCrecord;
SENTENCEREC2:LSDOMAINT_SENTENCErecord;
CNREC2:LSDOMAINT_CNrecord;
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
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CN;
    N^.ls^.CNfield^ := CNREC1;
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
  BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem11);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(CN);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
PROCEDURE createM2;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := SENTENCE;
    N^.ls^.SENTENCEfield^ := SENTENCEREC1;
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
                                                      BEGIN{createM}
m2:=MAKET_stree(SENTENCE);
createnode(m2);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m2^.li^.n:=numberofelements(list);
m2^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>CN THEN
      match:=FALSE;
    IF match THEN
      CNREC2:=s^.ls^.CNfield^;
  END{MatchNode};
                                                        PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR
    itemmatch,listmatch:Boolean;
    PROCEDURE Match_MU1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU1.first:=Lfirst;
        MU1.last:=Llast;
        match:= matchcondI1;
      END
      ELSE match:=FALSE
    END;
                                                          PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
    PROCEDURE Match_POSTMODREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>SENTENCE THEN
          match:=FALSE;
        IF match THEN
          SENTENCEREC2:=s^.ls^.SENTENCEfield^;
        IF match THEN
          match:= matchcondI4;
      END{MatchNode};
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        PROCEDURE Match_SHIFTREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR matchcond:BOOLEAN;
          Stree:LSSTREE_pStree;
          lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
            LSMATCHES_matchtreeVar(Lfirst,Llast,first,SHIFTREL,T2,match,lastmatchM_2_1);
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
BEGIN IF first THEN LSMATCHES_RMfirst(L,match,item1,LfirstM_2_1,LlastM_2_1
,item2,LfirstM_2_2,LlastM_2_2
) ELSE match_SHIFTREL(LfirstM_2_1,LfirstM_2_1,FALSE,match) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,POSTMODREL
,SHIFTREL,match,matchnode,matchlist2items,lastmatchM_2) END;
                                                            PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
    PROCEDURE Match_SIG1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        SIG1.first:=Lfirst;
        SIG1.last:=Llast;
        match:= matchcondI3;
      END
      ELSE match:=FALSE
    END;
                                                      BEGIN LSMATCHES_matchlistsigma
(L,first,match,match_SIG1,matchlist0items,
LlastM_3,LfirstM_3,LrestM_3,nomoretreesM_3,iM_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_POSTMODREL,matchlist1items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist2items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,POSTMODREL,match,matchnode,matchlist3items,lastmatch) END;
                                                       FUNCTION subrule0X1 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitSIG1_1,LrestSIG1_1,LfirstSIG1_1,LlastSIG1_1:LSSTREE_prelnode;
iSIG1_1:INTEGER;
nomoretreesSIG1_1,lastmatchSIG1_1:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_PUNCREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PUNC THEN
            match:=FALSE;
          IF match THEN
            PUNCREC1:=s^.ls^.PUNCfield^;
          IF match THEN match:=(s^.ls^.PUNCfield^.key=auxkey('KOMMAPUNCKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PUNCREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PUNCREL
,match,matchnode,matchlist0items,lastmatchSIG1_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesSIG1_1:=False;
        LfirstSIG1_1:=NIL;
        SelectLfirstAndLlast(LfirstSIG1_1,LlastSIG1_1,LrestSIG1_1
,nomoretreesSIG1_1,L);
        IF LlastSIG1_1=Lfinal THEN LrestSIG1_1:=NIL;
        IF NOT nomoretreesSIG1_1 THEN
          BEGIN
          Match_PUNCREL(LfirstSIG1_1,LlastSIG1_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestSIG1_1=NIL) AND ((LfirstSIG1_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastSIG1_1=Lfinal THEN LrestSIG1_1:=NIL;
        Match_PUNCREL(LfirstSIG1_1,LlastSIG1_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestSIG1_1,FALSE,match);
      END;
    IF (LfirstSIG1_1<>NIL) THEN match:=match AND (LlastSIG1_1=Lfinal);
      IF match THEN IF NOT MatchcondSIG1 THEN
        MatchList1Items(LrestSIG1_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=PUNCREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(SIG1.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>RELPRO THEN
        match:=FALSE;
      IF match THEN
        RELPROREC1:=s^.ls^.RELPROfield^;
      IF match THEN match:=(s^.ls^.RELPROfield^.key=auxkey('DATRELPROKEY'));
    END{MatchNode};
                                                          BEGIN
    s:= T2;
        RELPROREC1tree:=s;
matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := CNVAR;
      N^.ls^.CNVARfield^ := CNVARREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T1}
  s:=MAKET_stree(CNVAR);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION2;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION8;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=CNREC2.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION16;
BEGIN
CNVARREC1:=COPYT_CNTOVAR(CNREC2);                     ;
CNVARREC1.INDEX:=level
                                                      ;
CNVARREC1.CASES:=[NOMINATIVE,
ACCUSATIVE,
DATIVE]                                               ;
CNREC1:=CNREC2;                                       ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((((NEUTGENDER IN CNREC2.GENDERS                          )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SINGULAR IN CNREC2.NUMBERS                            )
                                                      )
                                                      )
                                                      )
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          ((((CNREC2.SUPERDEIXIS<>PRESENTDEIXIS                     )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
          ((((CNREC2.SUPERDEIXIS<>PASTDEIXIS                        )
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
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action2;
      action16;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =CNREC2.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action8;
      action16;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X1:=result
 END;
 FUNCTION subrule0X2 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>RELPRO THEN
        match:=FALSE;
      IF match THEN
        RELPROREC1:=s^.ls^.RELPROfield^;
      IF match THEN match:=(s^.ls^.RELPROfield^.key=auxkey('DATRELPROKEY'));
    END{MatchNode};
                                                          BEGIN
    s:= T2;
        RELPROREC1tree:=s;
matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := CNVAR;
      N^.ls^.CNVARfield^ := CNVARREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T1}
  s:=MAKET_stree(CNVAR);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION31;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION37;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=CNREC2.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION47;
BEGIN
CNVARREC1:=COPYT_CNTOVAR(CNREC2);                     ;
CNVARREC1.INDEX:=level
                                                      ;
CNVARREC1.CASES:=[NOMINATIVE,
ACCUSATIVE,
DATIVE]                                               ;
CNREC2:=CNREC1;                                       ;
CNREC2.POSSGENI:=FALSE
                                                      ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((((NEUTGENDER IN CNREC2.GENDERS                          )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SINGULAR IN CNREC2.NUMBERS                            )
                                                      )
                                                      )
                                                      )
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          ((((CNREC2.SUPERDEIXIS<>PRESENTDEIXIS                     )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
          ((((CNREC2.SUPERDEIXIS<>PASTDEIXIS                        )
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
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action31;
      action47;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =CNREC2.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action37;
      action47;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X2:=result
 END;
 FUNCTION subrule0X3 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitSIG1_1,LrestSIG1_1,LfirstSIG1_1,LlastSIG1_1:LSSTREE_prelnode;
iSIG1_1:INTEGER;
nomoretreesSIG1_1,lastmatchSIG1_1:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_PUNCREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PUNC THEN
            match:=FALSE;
          IF match THEN
            PUNCREC1:=s^.ls^.PUNCfield^;
          IF match THEN match:=(s^.ls^.PUNCfield^.key=auxkey('KOMMAPUNCKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PUNCREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PUNCREL
,match,matchnode,matchlist0items,lastmatchSIG1_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesSIG1_1:=False;
        LfirstSIG1_1:=NIL;
        SelectLfirstAndLlast(LfirstSIG1_1,LlastSIG1_1,LrestSIG1_1
,nomoretreesSIG1_1,L);
        IF LlastSIG1_1=Lfinal THEN LrestSIG1_1:=NIL;
        IF NOT nomoretreesSIG1_1 THEN
          BEGIN
          Match_PUNCREL(LfirstSIG1_1,LlastSIG1_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestSIG1_1=NIL) AND ((LfirstSIG1_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastSIG1_1=Lfinal THEN LrestSIG1_1:=NIL;
        Match_PUNCREL(LfirstSIG1_1,LlastSIG1_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestSIG1_1,FALSE,match);
      END;
    IF (LfirstSIG1_1<>NIL) THEN match:=match AND (LlastSIG1_1=Lfinal);
      IF match THEN IF NOT MatchcondSIG1 THEN
        MatchList1Items(LrestSIG1_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=PUNCREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(SIG1.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>RELPRO THEN
        match:=FALSE;
      IF match THEN
        RELPROREC1:=s^.ls^.RELPROfield^;
      IF match THEN match:=(s^.ls^.RELPROfield^.key=auxkey('DIERELPROKEY'));
    END{MatchNode};
                                                          BEGIN
    s:= T2;
        RELPROREC1tree:=s;
matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := CNVAR;
      N^.ls^.CNVARfield^ := CNVARREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T1}
  s:=MAKET_stree(CNVAR);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION50;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION56;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=CNREC2.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION64;
BEGIN
CNVARREC1:=COPYT_CNTOVAR(CNREC2);                     ;
CNVARREC1.INDEX:=level
                                                      ;
CNVARREC1.CASES:=[NOMINATIVE,
ACCUSATIVE,
DATIVE]                                               ;
CNREC2:=CNREC1;                                       ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((((CNREC2.GENDERS *[MASCGENDER,
FEMGENDER]                                            <>[]                                                    )
                                                      )
                                                      )
OR
          (((PLURAL IN CNREC2.NUMBERS                              )
                                                      )
                                                      )
                                                      )
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          ((((CNREC2.SUPERDEIXIS<>PRESENTDEIXIS                     )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
          ((((CNREC2.SUPERDEIXIS<>PASTDEIXIS                        )
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
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action50;
      action64;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =CNREC2.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action56;
      action64;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X3:=result
 END;
 FUNCTION subrule0X4 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>RELPRO THEN
        match:=FALSE;
      IF match THEN
        RELPROREC1:=s^.ls^.RELPROfield^;
      IF match THEN match:=(s^.ls^.RELPROfield^.key=auxkey('DIERELPROKEY'));
    END{MatchNode};
                                                          BEGIN
    s:= T2;
        RELPROREC1tree:=s;
matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := CNVAR;
      N^.ls^.CNVARfield^ := CNVARREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T1}
  s:=MAKET_stree(CNVAR);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION79;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION85;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=CNREC2.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION93;
BEGIN
CNVARREC1:=COPYT_CNTOVAR(CNREC2);                     ;
CNVARREC1.INDEX:=level
                                                      ;
CNVARREC1.CASES:=[NOMINATIVE,
ACCUSATIVE,
DATIVE]                                               ;
CNREC1:=CNREC2;                                       ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((((CNREC2.GENDERS *[MASCGENDER,
FEMGENDER]                                            <>[]                                                    )
                                                      )
                                                      )
OR
          (((PLURAL IN CNREC2.NUMBERS                              )
                                                      )
                                                      )
                                                      )
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          ((((CNREC2.SUPERDEIXIS<>PRESENTDEIXIS                     )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
          ((((CNREC2.SUPERDEIXIS<>PASTDEIXIS                        )
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
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action79;
      action93;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =CNREC2.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action85;
      action93;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X4:=result
 END;
 FUNCTION subrule0X5 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitSIG1_1,LrestSIG1_1,LfirstSIG1_1,LlastSIG1_1:LSSTREE_prelnode;
iSIG1_1:INTEGER;
nomoretreesSIG1_1,lastmatchSIG1_1:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
LinitT2_1_1,LrestT2_1_1,LfirstT2_1_1,LlastT2_1_1:LSSTREE_prelnode;
iT2_1_1:INTEGER;
nomoretreesT2_1_1,lastmatchT2_1_1:BOOLEAN;
LinitT2_2,LrestT2_2,LfirstT2_2,LlastT2_2:LSSTREE_prelnode;
iT2_2:INTEGER;
nomoretreesT2_2,lastmatchT2_2:BOOLEAN;
LinitT2_3,LrestT2_3,LfirstT2_3,LlastT2_3:LSSTREE_prelnode;
iT2_3:INTEGER;
nomoretreesT2_3,lastmatchT2_3:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_PUNCREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PUNC THEN
            match:=FALSE;
          IF match THEN
            PUNCREC1:=s^.ls^.PUNCfield^;
          IF match THEN match:=(s^.ls^.PUNCfield^.key=auxkey('KOMMAPUNCKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PUNCREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PUNCREL
,match,matchnode,matchlist0items,lastmatchSIG1_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesSIG1_1:=False;
        LfirstSIG1_1:=NIL;
        SelectLfirstAndLlast(LfirstSIG1_1,LlastSIG1_1,LrestSIG1_1
,nomoretreesSIG1_1,L);
        IF LlastSIG1_1=Lfinal THEN LrestSIG1_1:=NIL;
        IF NOT nomoretreesSIG1_1 THEN
          BEGIN
          Match_PUNCREL(LfirstSIG1_1,LlastSIG1_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestSIG1_1=NIL) AND ((LfirstSIG1_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastSIG1_1=Lfinal THEN LrestSIG1_1:=NIL;
        Match_PUNCREL(LfirstSIG1_1,LlastSIG1_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestSIG1_1,FALSE,match);
      END;
    IF (LfirstSIG1_1<>NIL) THEN match:=match AND (LlastSIG1_1=Lfinal);
      IF match THEN IF NOT MatchcondSIG1 THEN
        MatchList1Items(LrestSIG1_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=PUNCREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(SIG1.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
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
      IF s^.ls^.cat<>PREPP THEN
        match:=FALSE;
      IF match THEN
        PREPPREC1:=s^.ls^.PREPPfield^;
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
            RADVPREC2:=s^.ls^.RADVPfield^;
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
              IF s^.ls^.cat<>RADV THEN
                match:=FALSE;
              IF match THEN
                RADVREC1:=s^.ls^.RADVfield^;
              IF match THEN match:=(s^.ls^.RADVfield^.key=auxkey('WAARRADVKEY'));
            END{MatchNode};
                                                      BEGIN{MatchTree}
                            RADVREC1tree:=Lfirst^.node;
                IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT2_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT2_1_1,LfirstT2_1_1,LrestT2_1_1,nomoretreesT2_1_1) END;
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,ERREL
,HEAD,match,matchnode,matchlist1items,lastmatchT2_1) END;
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
,match,matchnode,matchlist0items,lastmatchT2_2) END;
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
,match,matchnode,matchlist0items,lastmatchT2_3) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT2_3,LfirstT2_3,LrestT2_3,nomoretreesT2_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_GLUEREL,matchlist1items,
LlastT2_2,LfirstT2_2,LrestT2_2,nomoretreesT2_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_ERREL,matchlist2items,
LlastT2_1,LfirstT2_1,LrestT2_1,nomoretreesT2_1) END;
                                                          BEGIN
    s:= T2;
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
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := VARPREPP;
      N^.ls^.VARPREPPfield^ := VARPREPPREC1;
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
          N^.ls^.RADVPfield^ := RADVPREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        VAR list:LSMRUQUO_ListOfStrees;
        PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
          PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
          VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
           list1:LSMRUQUO_ListOfStrees;
            PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
            BEGIN{CreateNode}
              N^.ls^.cat := CNVAR;
              N^.ls^.CNVARfield^ := CNVARREC1;
            END{CreateNode};
                                                                  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
            BEGIN
            wholelist.first:=NIL;wholelist.last:=NIL;
            END;
                                                                BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,CNVAR,createnode,createlist1);
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
                                                        BEGIN{T1}
  s:=MAKET_stree(VARPREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION96;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION102;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=CNREC2.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION118;
BEGIN
VARPREPPREC1:=PREPPREC1;                              ;
VARPREPPREC1.MOOD:=RELATIVEXPMOOD
                                                      ;
VARPREPPREC1.RADVKEY:=0
                                                      ;
RADVPREC1.MOOD:=DECLXPMOOD;
RADVPREC1.KINDEFS:=
[PK]                                                  ;RADVPREC1.RADVKEY:=0;
                                                      ;
CNVARREC1:=COPYT_CNTOVAR(CNREC2);                     ;
CNVARREC1.INDEX:=level
                                                      ;
CNVARREC1.CASES:=[RCASE]                                               ;
CNREC1:=CNREC2;                                       ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((PREPPREC1.MOOD =WH                                    )
                                                      )
THEN IF
          ((PREPPREC1.RADVKEY =auxkey('WAARRADVKEY')                                 )
                                                      )
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          ((((CNREC2.SUPERDEIXIS<>PRESENTDEIXIS                     )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
          ((((CNREC2.SUPERDEIXIS<>PASTDEIXIS                        )
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
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action96;
      action118;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =CNREC2.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action102;
      action118;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X5:=result
 END;
 FUNCTION subrule0X6 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
LinitT2_1_1,LrestT2_1_1,LfirstT2_1_1,LlastT2_1_1:LSSTREE_prelnode;
iT2_1_1:INTEGER;
nomoretreesT2_1_1,lastmatchT2_1_1:BOOLEAN;
LinitT2_2,LrestT2_2,LfirstT2_2,LlastT2_2:LSSTREE_prelnode;
iT2_2:INTEGER;
nomoretreesT2_2,lastmatchT2_2:BOOLEAN;
LinitT2_3,LrestT2_3,LfirstT2_3,LlastT2_3:LSSTREE_prelnode;
iT2_3:INTEGER;
nomoretreesT2_3,lastmatchT2_3:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
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
      IF s^.ls^.cat<>PREPP THEN
        match:=FALSE;
      IF match THEN
        PREPPREC1:=s^.ls^.PREPPfield^;
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
            RADVPREC2:=s^.ls^.RADVPfield^;
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
              IF s^.ls^.cat<>RADV THEN
                match:=FALSE;
              IF match THEN
                RADVREC1:=s^.ls^.RADVfield^;
              IF match THEN match:=(s^.ls^.RADVfield^.key=auxkey('WAARRADVKEY'));
            END{MatchNode};
                                                      BEGIN{MatchTree}
                            RADVREC1tree:=Lfirst^.node;
                IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT2_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT2_1_1,LfirstT2_1_1,LrestT2_1_1,nomoretreesT2_1_1) END;
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,ERREL
,HEAD,match,matchnode,matchlist1items,lastmatchT2_1) END;
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
,match,matchnode,matchlist0items,lastmatchT2_2) END;
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
,match,matchnode,matchlist0items,lastmatchT2_3) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT2_3,LfirstT2_3,LrestT2_3,nomoretreesT2_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_GLUEREL,matchlist1items,
LlastT2_2,LfirstT2_2,LrestT2_2,nomoretreesT2_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_ERREL,matchlist2items,
LlastT2_1,LfirstT2_1,LrestT2_1,nomoretreesT2_1) END;
                                                          BEGIN
    s:= T2;
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
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := VARPREPP;
      N^.ls^.VARPREPPfield^ := VARPREPPREC1;
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
          N^.ls^.RADVPfield^ := RADVPREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        VAR list:LSMRUQUO_ListOfStrees;
        PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
          PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
          VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
           list1:LSMRUQUO_ListOfStrees;
            PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
            BEGIN{CreateNode}
              N^.ls^.cat := CNVAR;
              N^.ls^.CNVARfield^ := CNVARREC1;
            END{CreateNode};
                                                                  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
            BEGIN
            wholelist.first:=NIL;wholelist.last:=NIL;
            END;
                                                                BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,CNVAR,createnode,createlist1);
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
                                                        BEGIN{T1}
  s:=MAKET_stree(VARPREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION141;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION147;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=CNREC2.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION163;
BEGIN
VARPREPPREC1:=PREPPREC1;                              ;
VARPREPPREC1.MOOD:=RELATIVEXPMOOD
                                                      ;
VARPREPPREC1.RADVKEY:=0
                                                      ;
RADVPREC1.MOOD:=DECLXPMOOD;
RADVPREC1.KINDEFS:=
[PK]                                                  ;RADVPREC1.RADVKEY:=0;
                                                      ;
CNVARREC1:=COPYT_CNTOVAR(CNREC2);                     ;
CNVARREC1.INDEX:=level
                                                      ;
CNVARREC1.CASES:=[RCASE]                                               ;
CNREC1:=CNREC2;                                       ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((PREPPREC1.MOOD =WH                                    )
                                                      )
THEN IF
          ((PREPPREC1.RADVKEY =auxkey('WAARRADVKEY')                                 )
                                                      )
THEN IF
          (((RADVPREC2.MOOD=WH) AND 
          (RADVPREC2.RADVKEY=auxkey('WAARRADVKEY')                                 ) AND 
                    (PK IN RADVPREC2.KINDEFS) AND 
          TRUE
                                                      )
                                                      )
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          ((((CNREC2.SUPERDEIXIS<>PRESENTDEIXIS                     )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
          ((((CNREC2.SUPERDEIXIS<>PASTDEIXIS                        )
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
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action141;
      action163;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =CNREC2.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action147;
      action163;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X6:=result
 END;
 FUNCTION subrule0X7 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitSIG1_1,LrestSIG1_1,LfirstSIG1_1,LlastSIG1_1:LSSTREE_prelnode;
iSIG1_1:INTEGER;
nomoretreesSIG1_1,lastmatchSIG1_1:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_PUNCREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PUNC THEN
            match:=FALSE;
          IF match THEN
            PUNCREC1:=s^.ls^.PUNCfield^;
          IF match THEN match:=(s^.ls^.PUNCfield^.key=auxkey('KOMMAPUNCKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PUNCREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PUNCREL
,match,matchnode,matchlist0items,lastmatchSIG1_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesSIG1_1:=False;
        LfirstSIG1_1:=NIL;
        SelectLfirstAndLlast(LfirstSIG1_1,LlastSIG1_1,LrestSIG1_1
,nomoretreesSIG1_1,L);
        IF LlastSIG1_1=Lfinal THEN LrestSIG1_1:=NIL;
        IF NOT nomoretreesSIG1_1 THEN
          BEGIN
          Match_PUNCREL(LfirstSIG1_1,LlastSIG1_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestSIG1_1=NIL) AND ((LfirstSIG1_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastSIG1_1=Lfinal THEN LrestSIG1_1:=NIL;
        Match_PUNCREL(LfirstSIG1_1,LlastSIG1_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestSIG1_1,FALSE,match);
      END;
    IF (LfirstSIG1_1<>NIL) THEN match:=match AND (LlastSIG1_1=Lfinal);
      IF match THEN IF NOT MatchcondSIG1 THEN
        MatchList1Items(LrestSIG1_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=PUNCREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(SIG1.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>RADVP THEN
        match:=FALSE;
      IF match THEN
        RADVPREC2:=s^.ls^.RADVPfield^;
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
          IF s^.ls^.cat<>RADV THEN
            match:=FALSE;
          IF match THEN
            RADVREC1:=s^.ls^.RADVfield^;
          IF match THEN match:=(s^.ls^.RADVfield^.key=auxkey('WAARRADVKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    RADVREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT2_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT2_1,LfirstT2_1,LrestT2_1,nomoretreesT2_1) END;
                                                          BEGIN
    s:= T2;
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
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := RADVP;
      N^.ls^.RADVPfield^ := RADVPREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := CNVAR;
          N^.ls^.CNVARfield^ := CNVARREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,CNVAR,createnode,createlist1);
      END{HEAD};
                                                          BEGIN{createitem11}
    createHEAD(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{T1}
  s:=MAKET_stree(RADVP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION166;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION172;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=CNREC2.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION182;
BEGIN
RADVPREC1.MOOD:=DECLXPMOOD;
RADVPREC1.RADVKEY:=0;
RADVPREC1.KINDEFS:=
[PK]                                                  ;                                                     ;
CNVARREC1:=COPYT_CNTOVAR(CNREC2);                     ;
CNVARREC1.INDEX:=level
                                                      ;
CNVARREC1.CASES:=[RCASE]                                               ;
CNREC1:=CNREC2;                                       ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF (((RADVPREC2.MOOD=WH) AND 
          (PK IN RADVPREC2.KINDEFS) AND 
          (RADVPREC2.RADVKEY=RADVREC1.KEY) AND 
                    TRUE
                                                      )
                                                      )
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          ((((CNREC2.SUPERDEIXIS<>PRESENTDEIXIS                     )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
          ((((CNREC2.SUPERDEIXIS<>PASTDEIXIS                        )
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
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action166;
      action182;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =CNREC2.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action172;
      action182;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X7:=result
 END;
 FUNCTION subrule0X8 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>RADVP THEN
        match:=FALSE;
      IF match THEN
        RADVPREC2:=s^.ls^.RADVPfield^;
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
          IF s^.ls^.cat<>RADV THEN
            match:=FALSE;
          IF match THEN
            RADVREC1:=s^.ls^.RADVfield^;
          IF match THEN match:=(s^.ls^.RADVfield^.key=auxkey('WAARRADVKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    RADVREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT2_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT2_1,LfirstT2_1,LrestT2_1,nomoretreesT2_1) END;
                                                          BEGIN
    s:= T2;
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
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := RADVP;
      N^.ls^.RADVPfield^ := RADVPREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := CNVAR;
          N^.ls^.CNVARfield^ := CNVARREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,CNVAR,createnode,createlist1);
      END{HEAD};
                                                          BEGIN{createitem11}
    createHEAD(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{T1}
  s:=MAKET_stree(RADVP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION199;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION205;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=CNREC2.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION215;
BEGIN
RADVPREC1.MOOD:=DECLXPMOOD;
RADVPREC1.KINDEFS:=
[PK]                                                  ;RADVPREC1.RADVKEY:=0;
                                                      ;
CNVARREC1:=COPYT_CNTOVAR(CNREC2);                     ;
CNVARREC1.INDEX:=level
                                                      ;
CNVARREC1.CASES:=[RCASE]                                               ;
CNREC1:=CNREC2;                                       ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF (((RADVPREC2.MOOD=WH) AND 
          (PK IN RADVPREC2.KINDEFS) AND 
          (RADVPREC2.RADVKEY=auxkey('WAARRADVKEY')                                 ) AND 
                    TRUE
                                                      )
                                                      )
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          ((((CNREC2.SUPERDEIXIS<>PRESENTDEIXIS                     )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
          ((((CNREC2.SUPERDEIXIS<>PASTDEIXIS                        )
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
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action199;
      action215;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =CNREC2.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action205;
      action215;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X8:=result
 END;
 FUNCTION subrule0X9 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitSIG1_1,LrestSIG1_1,LfirstSIG1_1,LlastSIG1_1:LSSTREE_prelnode;
iSIG1_1:INTEGER;
nomoretreesSIG1_1,lastmatchSIG1_1:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_PUNCREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PUNC THEN
            match:=FALSE;
          IF match THEN
            PUNCREC1:=s^.ls^.PUNCfield^;
          IF match THEN match:=(s^.ls^.PUNCfield^.key=auxkey('KOMMAPUNCKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PUNCREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PUNCREL
,match,matchnode,matchlist0items,lastmatchSIG1_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesSIG1_1:=False;
        LfirstSIG1_1:=NIL;
        SelectLfirstAndLlast(LfirstSIG1_1,LlastSIG1_1,LrestSIG1_1
,nomoretreesSIG1_1,L);
        IF LlastSIG1_1=Lfinal THEN LrestSIG1_1:=NIL;
        IF NOT nomoretreesSIG1_1 THEN
          BEGIN
          Match_PUNCREL(LfirstSIG1_1,LlastSIG1_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestSIG1_1=NIL) AND ((LfirstSIG1_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastSIG1_1=Lfinal THEN LrestSIG1_1:=NIL;
        Match_PUNCREL(LfirstSIG1_1,LlastSIG1_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestSIG1_1,FALSE,match);
      END;
    IF (LfirstSIG1_1<>NIL) THEN match:=match AND (LlastSIG1_1=Lfinal);
      IF match THEN IF NOT MatchcondSIG1 THEN
        MatchList1Items(LrestSIG1_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=PUNCREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(SIG1.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>RADVP THEN
        match:=FALSE;
      IF match THEN
        RADVPREC2:=s^.ls^.RADVPfield^;
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
          IF s^.ls^.cat<>RADV THEN
            match:=FALSE;
          IF match THEN
            RADVREC1:=s^.ls^.RADVfield^;
          IF match THEN match:=(s^.ls^.RADVfield^.key=auxkey('WAARRADVKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    RADVREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT2_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT2_1,LfirstT2_1,LrestT2_1,nomoretreesT2_1) END;
                                                          BEGIN
    s:= T2;
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
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := VARPREPP;
      N^.ls^.VARPREPPfield^ := VARPREPPREC1;
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
          N^.ls^.cat := CNVAR;
          N^.ls^.CNVARfield^ := CNVARREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{OBJREL}
LSMATCHES_createitem(list,OBJREL,CNVAR,createnode,createlist1);
      END{OBJREL};
                                                          BEGIN{createitem12}
    createOBJREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist2items11(wholelist,createitem11,createitem12);
    END{createlist1};
                                                        BEGIN{T1}
  s:=MAKET_stree(VARPREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION218;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION224;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=CNREC2.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION234;
BEGIN
VARPREPPREC1.MOOD:=RELATIVEXPMOOD;
VARPREPPREC1.ACTSUBCEFS:=PREPREC1.SUBCS;
VARPREPPREC1.SYNPPEFS:=PREPREC1.SYNPPS;
VARPREPPREC1.THETAPP:=PREPREC1.THETAPP;
VARPREPPREC1.HEADKEY:=PREPREC1.KEY;
VARPREPPREC1.CLASS:=PREPREC1.CLASS;
VARPREPPREC1.DEIXIS:=PREPREC1.DEIXIS;
VARPREPPREC1.ASPECT:=PREPREC1.ASPECT;
VARPREPPREC1.RETRO:=PREPREC1.RETRO;
VARPREPPREC1.RADVKEY:=0;
VARPREPPREC1.SPECQ:=YESSPEC;
                                                      ;
CNVARREC1:=COPYT_CNTOVAR(CNREC2);                     ;
CNVARREC1.INDEX:=level
                                                      ;
CNVARREC1.CASES:=[ACCUSATIVE]                                          ;
CNREC1:=CNREC2;                                       ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF (((RADVPREC2.MOOD=WH) AND 
          (LK IN RADVPREC2.KINDEFS) AND 
          (RADVPREC2.RADVKEY=RADVREC1.KEY) AND 
                    TRUE
                                                      )
                                                      )
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          ((((CNREC2.SUPERDEIXIS<>PRESENTDEIXIS                     )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
          ((((CNREC2.SUPERDEIXIS<>PASTDEIXIS                        )
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
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      hulpstree:=LDBLEX_read(auxkey('INPREPKEY'));
      PREPREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
      PREPREC1:=PREPREC1tree^.ls^.PREPfield^;
      action218;
      action234;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =CNREC2.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      hulpstree:=LDBLEX_read(auxkey('INPREPKEY'));
      PREPREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
      PREPREC1:=PREPREC1tree^.ls^.PREPfield^;
      action224;
      action234;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X9:=result
 END;
 FUNCTION subrule0X10 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>RADVP THEN
        match:=FALSE;
      IF match THEN
        RADVPREC2:=s^.ls^.RADVPfield^;
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
          IF s^.ls^.cat<>RADV THEN
            match:=FALSE;
          IF match THEN
            RADVREC1:=s^.ls^.RADVfield^;
          IF match THEN match:=(s^.ls^.RADVfield^.key=auxkey('WAARRADVKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    RADVREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT2_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT2_1,LfirstT2_1,LrestT2_1,nomoretreesT2_1) END;
                                                          BEGIN
    s:= T2;
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
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := VARPREPP;
      N^.ls^.VARPREPPfield^ := VARPREPPREC1;
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
          N^.ls^.cat := CNVAR;
          N^.ls^.CNVARfield^ := CNVARREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{OBJREL}
LSMATCHES_createitem(list,OBJREL,CNVAR,createnode,createlist1);
      END{OBJREL};
                                                          BEGIN{createitem12}
    createOBJREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist2items11(wholelist,createitem11,createitem12);
    END{createlist1};
                                                        BEGIN{T1}
  s:=MAKET_stree(VARPREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION255;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION261;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=CNREC2.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION271;
BEGIN
VARPREPPREC1.MOOD:=RELATIVEXPMOOD;
VARPREPPREC1.ACTSUBCEFS:=PREPREC1.SUBCS;
VARPREPPREC1.SYNPPEFS:=PREPREC1.SYNPPS;
VARPREPPREC1.THETAPP:=PREPREC1.THETAPP;
VARPREPPREC1.HEADKEY:=PREPREC1.KEY;
VARPREPPREC1.CLASS:=PREPREC1.CLASS;
VARPREPPREC1.DEIXIS:=PREPREC1.DEIXIS;
VARPREPPREC1.ASPECT:=PREPREC1.ASPECT;
VARPREPPREC1.RETRO:=PREPREC1.RETRO;
VARPREPPREC1.RADVKEY:=0;
VARPREPPREC1.SPECQ:=YESSPEC;
                                                      ;
CNVARREC1:=COPYT_CNTOVAR(CNREC2);                     ;
CNVARREC1.INDEX:=level
                                                      ;
CNVARREC1.CASES:=[ACCUSATIVE]                                          ;
CNREC1:=CNREC2;                                       ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF (((RADVPREC2.MOOD=WH) AND 
          (LK IN RADVPREC2.KINDEFS) AND 
          (RADVPREC2.RADVKEY=auxkey('WAARRADVKEY')                                 ) AND 
                    TRUE
                                                      )
                                                      )
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          ((((CNREC2.SUPERDEIXIS<>PRESENTDEIXIS                     )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
          ((((CNREC2.SUPERDEIXIS<>PASTDEIXIS                        )
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
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      hulpstree:=LDBLEX_read(auxkey('INPREPKEY'));
      PREPREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
      PREPREC1:=PREPREC1tree^.ls^.PREPfield^;
      action255;
      action271;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =CNREC2.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      hulpstree:=LDBLEX_read(auxkey('INPREPKEY'));
      PREPREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
      PREPREC1:=PREPREC1tree^.ls^.PREPfield^;
      action261;
      action271;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X10:=result
 END;
 FUNCTION subrule0X11 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitSIG1_1,LrestSIG1_1,LfirstSIG1_1,LlastSIG1_1:LSSTREE_prelnode;
iSIG1_1:INTEGER;
nomoretreesSIG1_1,lastmatchSIG1_1:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
LinitT2_2,LrestT2_2,LfirstT2_2,LlastT2_2:LSSTREE_prelnode;
iT2_2:INTEGER;
nomoretreesT2_2,lastmatchT2_2:BOOLEAN;
LinitT2_2_1,LrestT2_2_1,LfirstT2_2_1,LlastT2_2_1:LSSTREE_prelnode;
iT2_2_1:INTEGER;
nomoretreesT2_2_1,lastmatchT2_2_1:BOOLEAN;
LinitT2_2_1_1,LrestT2_2_1_1,LfirstT2_2_1_1,LlastT2_2_1_1:LSSTREE_prelnode;
iT2_2_1_1:INTEGER;
nomoretreesT2_2_1_1,lastmatchT2_2_1_1:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_PUNCREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PUNC THEN
            match:=FALSE;
          IF match THEN
            PUNCREC1:=s^.ls^.PUNCfield^;
          IF match THEN match:=(s^.ls^.PUNCfield^.key=auxkey('KOMMAPUNCKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PUNCREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PUNCREL
,match,matchnode,matchlist0items,lastmatchSIG1_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesSIG1_1:=False;
        LfirstSIG1_1:=NIL;
        SelectLfirstAndLlast(LfirstSIG1_1,LlastSIG1_1,LrestSIG1_1
,nomoretreesSIG1_1,L);
        IF LlastSIG1_1=Lfinal THEN LrestSIG1_1:=NIL;
        IF NOT nomoretreesSIG1_1 THEN
          BEGIN
          Match_PUNCREL(LfirstSIG1_1,LlastSIG1_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestSIG1_1=NIL) AND ((LfirstSIG1_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastSIG1_1=Lfinal THEN LrestSIG1_1:=NIL;
        Match_PUNCREL(LfirstSIG1_1,LlastSIG1_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestSIG1_1,FALSE,match);
      END;
    IF (LfirstSIG1_1<>NIL) THEN match:=match AND (LlastSIG1_1=Lfinal);
      IF match THEN IF NOT MatchcondSIG1 THEN
        MatchList1Items(LrestSIG1_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=PUNCREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(SIG1.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      lirel2:LIDOMAINT_synrel;
      lsrel2:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>PREPP THEN
        match:=FALSE;
      IF match THEN
        PREPPREC1:=s^.ls^.PREPPfield^;
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
,match,matchnode,matchlist0items,lastmatchT2_1) END;
                                                            PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
      PROCEDURE Match_OBJREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
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
            lirel1:LIDOMAINT_synrel;
            lsrel1:LSDOMAINT_synrel;
            PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
            BEGIN{MatchNode}
              IF s^.ls^.cat<>WHPRO THEN
                match:=FALSE;
              IF match THEN
                WHPROREC1:=s^.ls^.WHPROfield^;
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
                  IF s^.ls^.cat<>BWHPRO THEN
                    match:=FALSE;
                  IF match THEN
                    BWHPROREC1:=s^.ls^.BWHPROfield^;
                  IF match THEN match:=(s^.ls^.BWHPROfield^.key=auxkey('WIEMSGWHPROKEY'));
                END{MatchNode};
                                                      BEGIN{MatchTree}
                                    BWHPROREC1tree:=Lfirst^.node;
                    IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT2_2_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT2_2_1_1,LfirstT2_2_1_1,LrestT2_2_1_1,nomoretreesT2_2_1_1) END;
                                                      BEGIN{MatchTree}
                              IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1
)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist1items,lastmatchT2_2_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT2_2_1,LfirstT2_2_1,LrestT2_2_1,nomoretreesT2_2_1) END;
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,OBJREL
,HEAD,match,matchnode,matchlist1items,lastmatchT2_2) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_OBJREL,matchlist0items,
LlastT2_2,LfirstT2_2,LrestT2_2,nomoretreesT2_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastT2_1,LfirstT2_1,LrestT2_1,nomoretreesT2_1) END;
                                                          BEGIN
    s:= T2;
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
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := VARPREPP;
      N^.ls^.VARPREPPfield^ := VARPREPPREC1;
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
          N^.ls^.cat := CNVAR;
          N^.ls^.CNVARfield^ := CNVARREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{OBJREL}
LSMATCHES_createitem(list,OBJREL,CNVAR,createnode,createlist1);
      END{OBJREL};
                                                          BEGIN{createitem12}
    createOBJREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist2items11(wholelist,createitem11,createitem12);
    END{createlist1};
                                                        BEGIN{T1}
  s:=MAKET_stree(VARPREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION274;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION280;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=CNREC2.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION294;
BEGIN
VARPREPPREC1:=PREPPREC1;                              ;
VARPREPPREC1.MOOD:=RELATIVEXPMOOD
                                                      ;
CNVARREC1:=COPYT_CNTOVAR(CNREC2);                     ;
CNVARREC1.HUMAN:=YESHUMAN
                                                      ;
CNVARREC1.INDEX:=level
                                                      ;
CNVARREC1.CASES:=NPREC1.CASES
                                                      ;
CNREC1:=CNREC2;                                       ;
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result:=COPYX_BWHPROTOWHPRO(
WHPROREC1,BWHPROREC1);

;except1:=result
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((PREPPREC1.MOOD =WH                                    )
                                                      )
THEN IF
          ((except1                                               )
                                                      )
THEN IF
          (((NPREC1.DEFINITE=INDEF) AND 
          (NPREC1.NUMBER=WHPROREC1.NUMBER) AND 
                    (NPREC1.SEXES=WHPROREC1.SEXES) AND 
                    (NPREC1.ANIMATE=WHPROREC1.ANIMATE) AND 
                    (NPREC1.HUMAN=YESHUMAN) AND 
          (NPREC1.MOOD=WH) AND 
          (NPREC1.GENERIC=OMEGAGENERIC) AND 
          (NPREC1.POSSRFORM=WHPROREC1.POSSRFORM) AND 
                    (NPREC1.SYNTQUANT=OMEGAQUANT) AND 
          (NPREC1.SPECQ=YESSPEC) AND 
          (NPREC1.POSSPRED=TRUE) AND 
          TRUE
                                                      )
                                                      )
THEN IF
          ((NPREC1.CASES *[DATIVE,
ACCUSATIVE]                                           <>[]                                                    )
                                                      )
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          ((((CNREC2.SUPERDEIXIS<>PRESENTDEIXIS                     )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
          ((((CNREC2.SUPERDEIXIS<>PASTDEIXIS                        )
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
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action274;
      action294;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =CNREC2.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action280;
      action294;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X11:=result
 END;
 FUNCTION subrule0X12 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
LinitT2_2,LrestT2_2,LfirstT2_2,LlastT2_2:LSSTREE_prelnode;
iT2_2:INTEGER;
nomoretreesT2_2,lastmatchT2_2:BOOLEAN;
LinitT2_2_1,LrestT2_2_1,LfirstT2_2_1,LlastT2_2_1:LSSTREE_prelnode;
iT2_2_1:INTEGER;
nomoretreesT2_2_1,lastmatchT2_2_1:BOOLEAN;
LinitT2_2_1_1,LrestT2_2_1_1,LfirstT2_2_1_1,LlastT2_2_1_1:LSSTREE_prelnode;
iT2_2_1_1:INTEGER;
nomoretreesT2_2_1_1,lastmatchT2_2_1_1:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      lirel2:LIDOMAINT_synrel;
      lsrel2:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>PREPP THEN
        match:=FALSE;
      IF match THEN
        PREPPREC1:=s^.ls^.PREPPfield^;
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
,match,matchnode,matchlist0items,lastmatchT2_1) END;
                                                            PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
      PROCEDURE Match_OBJREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
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
            lirel1:LIDOMAINT_synrel;
            lsrel1:LSDOMAINT_synrel;
            PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
            BEGIN{MatchNode}
              IF s^.ls^.cat<>WHPRO THEN
                match:=FALSE;
              IF match THEN
                WHPROREC1:=s^.ls^.WHPROfield^;
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
                  IF s^.ls^.cat<>BWHPRO THEN
                    match:=FALSE;
                  IF match THEN
                    BWHPROREC1:=s^.ls^.BWHPROfield^;
                  IF match THEN match:=(s^.ls^.BWHPROfield^.key=auxkey('WIEMSGWHPROKEY'));
                END{MatchNode};
                                                      BEGIN{MatchTree}
                                    BWHPROREC1tree:=Lfirst^.node;
                    IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchT2_2_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT2_2_1_1,LfirstT2_2_1_1,LrestT2_2_1_1,nomoretreesT2_2_1_1) END;
                                                      BEGIN{MatchTree}
                              IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1
)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist1items,lastmatchT2_2_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastT2_2_1,LfirstT2_2_1,LrestT2_2_1,nomoretreesT2_2_1) END;
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,OBJREL
,HEAD,match,matchnode,matchlist1items,lastmatchT2_2) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_OBJREL,matchlist0items,
LlastT2_2,LfirstT2_2,LrestT2_2,nomoretreesT2_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastT2_1,LfirstT2_1,LrestT2_1,nomoretreesT2_1) END;
                                                          BEGIN
    s:= T2;
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
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := VARPREPP;
      N^.ls^.VARPREPPfield^ := VARPREPPREC1;
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
          N^.ls^.cat := CNVAR;
          N^.ls^.CNVARfield^ := CNVARREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{OBJREL}
LSMATCHES_createitem(list,OBJREL,CNVAR,createnode,createlist1);
      END{OBJREL};
                                                          BEGIN{createitem12}
    createOBJREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist2items11(wholelist,createitem11,createitem12);
    END{createlist1};
                                                        BEGIN{T1}
  s:=MAKET_stree(VARPREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION317;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION323;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=CNREC2.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION337;
BEGIN
VARPREPPREC1:=PREPPREC1;                              ;
VARPREPPREC1.MOOD:=RELATIVEXPMOOD
                                                      ;
CNVARREC1:=COPYT_CNTOVAR(CNREC2);                     ;
CNVARREC1.HUMAN:=YESHUMAN
                                                      ;
CNVARREC1.INDEX:=level
                                                      ;
CNVARREC1.CASES:=NPREC1.CASES
                                                      ;
CNREC1:=CNREC2;                                       ;
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result:=COPYX_BWHPROTOWHPRO(
WHPROREC1,BWHPROREC1);

;except1:=result
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((PREPPREC1.MOOD =WH                                    )
                                                      )
THEN IF
          ((except1                                               )
                                                      )
THEN IF
          (((NPREC1.DEFINITE=INDEF) AND 
          (NPREC1.NUMBER=WHPROREC1.NUMBER) AND 
                    (NPREC1.SEXES=WHPROREC1.SEXES) AND 
                    (NPREC1.ANIMATE=WHPROREC1.ANIMATE) AND 
                    (NPREC1.HUMAN=YESHUMAN) AND 
          (NPREC1.MOOD=WH) AND 
          (NPREC1.GENERIC=OMEGAGENERIC) AND 
          (NPREC1.POSSRFORM=WHPROREC1.POSSRFORM) AND 
                    (NPREC1.SYNTQUANT=OMEGAQUANT) AND 
          (NPREC1.SPECQ=YESSPEC) AND 
          (NPREC1.POSSPRED=TRUE) AND 
          TRUE
                                                      )
                                                      )
THEN IF
          ((NPREC1.CASES *[DATIVE,
ACCUSATIVE]                                           <>[]                                                    )
                                                      )
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          ((((CNREC2.SUPERDEIXIS<>PRESENTDEIXIS                     )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
          ((((CNREC2.SUPERDEIXIS<>PASTDEIXIS                        )
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
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action317;
      action337;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =CNREC2.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action323;
      action337;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X12:=result
 END;
 FUNCTION subrule0X13 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>RELPRO THEN
        match:=FALSE;
      IF match THEN
        RELPROREC1:=s^.ls^.RELPROfield^;
      IF match THEN match:=(s^.ls^.RELPROfield^.key=auxkey('DATRELPROKEY'));
    END{MatchNode};
                                                          BEGIN
    s:= T2;
        RELPROREC1tree:=s;
matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := VARPREPP;
      N^.ls^.VARPREPPfield^ := VARPREPPREC1;
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
          N^.ls^.cat := CNVAR;
          N^.ls^.CNVARfield^ := CNVARREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{OBJREL}
LSMATCHES_createitem(list,OBJREL,CNVAR,createnode,createlist1);
      END{OBJREL};
                                                          BEGIN{createitem12}
    createOBJREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist2items11(wholelist,createitem11,createitem12);
    END{createlist1};
                                                        BEGIN{T1}
  s:=MAKET_stree(VARPREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION346;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION352;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=CNREC2.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION362;
BEGIN
VARPREPPREC1.MOOD:=RELATIVEXPMOOD;
VARPREPPREC1.ACTSUBCEFS:=PREPREC1.SUBCS;
VARPREPPREC1.SYNPPEFS:=PREPREC1.SYNPPS;
VARPREPPREC1.THETAPP:=PREPREC1.THETAPP;
VARPREPPREC1.HEADKEY:=PREPREC1.KEY;
VARPREPPREC1.CLASS:=PREPREC1.CLASS;
VARPREPPREC1.DEIXIS:=PREPREC1.DEIXIS;
VARPREPPREC1.ASPECT:=PREPREC1.ASPECT;
VARPREPPREC1.RETRO:=PREPREC1.RETRO;
VARPREPPREC1.RADVKEY:=0;
VARPREPPREC1.SPECQ:=YESSPEC;
                                                      ;
CNVARREC1:=COPYT_CNTOVAR(CNREC2);                     ;
CNVARREC1.INDEX:=level
                                                      ;
CNVARREC1.CASES:=[ACCUSATIVE]                                          ;
CNREC1:=CNREC2;                                       ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((CNREC2.TEMPORAL =TRUE                                 )
                                                      )
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          ((((CNREC2.SUPERDEIXIS<>PRESENTDEIXIS                     )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
          ((((CNREC2.SUPERDEIXIS<>PASTDEIXIS                        )
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
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      hulpstree:=LDBLEX_read(auxkey('S_PREP1243607'));
      PREPREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
      PREPREC1:=PREPREC1tree^.ls^.PREPfield^;
      action346;
      action362;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =CNREC2.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      hulpstree:=LDBLEX_read(auxkey('S_PREP1243607'));
      PREPREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
      PREPREC1:=PREPREC1tree^.ls^.PREPfield^;
      action352;
      action362;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X13:=result
 END;
                                                      BEGIN
m:=loopholes.retype(Is,LSSTREE_pstree);
LISTREE_InitSetOfTupleOfStrees(result);
match:=TRUE;
first:=TRUE;
matchmodel(m,first,match);
first:=FALSE;
IF match THEN
 BEGIN
 level:=LIMATCHES_newlevel;
 subst:=1;
  LISTREE_mergesetsoftuplestrees(subrule0X1,result);
  LISTREE_mergesetsoftuplestrees(subrule0X2,result);
  LISTREE_mergesetsoftuplestrees(subrule0X3,result);
  LISTREE_mergesetsoftuplestrees(subrule0X4,result);
  LISTREE_mergesetsoftuplestrees(subrule0X5,result);
  LISTREE_mergesetsoftuplestrees(subrule0X6,result);
  LISTREE_mergesetsoftuplestrees(subrule0X7,result);
  LISTREE_mergesetsoftuplestrees(subrule0X8,result);
  LISTREE_mergesetsoftuplestrees(subrule0X9,result);
  LISTREE_mergesetsoftuplestrees(subrule0X10,result);
  LISTREE_mergesetsoftuplestrees(subrule0X11,result);
  LISTREE_mergesetsoftuplestrees(subrule0X12,result);
  LISTREE_mergesetsoftuplestrees(subrule0X13,result);
 END;
DECRCNMODRELSENT1:=result
END;
{:RCNMODRELSENT1}
{rule:}
{:RNONCNMODRELSENT1}
 FUNCTION DECRNONCNMODRELSENT1(VAR LEVEL,subst:INTEGER;
Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
VAR result:LISTREE_SetOfTupleOfStrees;
 wbonus,sbonus:INTEGER;
 m:LSSTREE_pstree;
 tuple:LISTREE_TupleOfStrees;
 first:BOOLEAN;
 match:BOOLEAN;
 idargs:LIIDDICT_idargs;
dtree:HYPERDTREE_phyperdtree;
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
LinitM_1,LrestM_1,LfirstM_1,LlastM_1:LSSTREE_prelnode;
iM_1:INTEGER;
nomoretreesM_1,lastmatchM_1:BOOLEAN;
LinitM_2,LrestM_2,LfirstM_2,LlastM_2:LSSTREE_prelnode;
iM_2:INTEGER;
nomoretreesM_2,lastmatchM_2:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
LinitM_3_1,LrestM_3_1,LfirstM_3_1,LlastM_3_1:LSSTREE_prelnode;
iM_3_1:INTEGER;
nomoretreesM_3_1,lastmatchM_3_1:BOOLEAN;
LinitM_3_2,LrestM_3_2,LfirstM_3_2,LlastM_3_2:LSSTREE_prelnode;
iM_3_2:INTEGER;
nomoretreesM_3_2,lastmatchM_3_2:BOOLEAN;
LinitM_4,LrestM_4,LfirstM_4,LlastM_4:LSSTREE_prelnode;
iM_4:INTEGER;
nomoretreesM_4,lastmatchM_4:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
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
RADVPREC1:LSDOMAINT_RADVPrecord;
VARPREPPREC1:LSDOMAINT_PREPPrecord;
NPVARREC1:LSDOMAINT_NPVARrecord;
SENTENCEREC1:LSDOMAINT_SENTENCErecord;
PREPREC1:LSDOMAINT_PREPrecord;
RADVREC1:LSDOMAINT_RADVrecord;
PREPPREC1:LSDOMAINT_PREPPrecord;
BWHPROREC1:LSDOMAINT_BWHPROrecord;
INDEFPROREC1:LSDOMAINT_INDEFPROrecord;
RELPROREC1:LSDOMAINT_RELPROrecord;
PROPERNOUNREC1:LSDOMAINT_PROPERNOUNrecord;
PUNCREC2:LSDOMAINT_PUNCrecord;
PUNCREC1:LSDOMAINT_PUNCrecord;
SENTENCEREC2:LSDOMAINT_SENTENCErecord;
NPREC1:LSDOMAINT_NPrecord;
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
                                                      PROCEDURE createM1;
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
  BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(NP);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
PROCEDURE createM2;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := SENTENCE;
    N^.ls^.SENTENCEfield^ := SENTENCEREC1;
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
LSMATCHES_createitemVar(list,SHIFTREL,T4);
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
                                                      BEGIN{createM}
m2:=MAKET_stree(SENTENCE);
createnode(m2);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m2^.li^.n:=numberofelements(list);
m2^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  lirel2:LIDOMAINT_synrel;
  lsrel2:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>NP THEN
      match:=FALSE;
    IF match THEN
      NPREC1:=s^.ls^.NPfield^;
  END{MatchNode};
                                                        PROCEDURE MatchList4Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR
    itemmatch,listmatch:Boolean;
    PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeConVar(Lfirst,Llast,first,HEAD,T2,match,matchcondI1,lastmatchM_1);
END;
                                                          PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
    PROCEDURE Match_SIG1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        SIG1.first:=Lfirst;
        SIG1.last:=Llast;
        match:= matchcondI3;
      END
      ELSE match:=FALSE
    END;
                                                            PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
    PROCEDURE Match_POSTMODREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>SENTENCE THEN
          match:=FALSE;
        IF match THEN
          SENTENCEREC2:=s^.ls^.SENTENCEfield^;
        IF match THEN
          match:= matchcondI5;
      END{MatchNode};
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        PROCEDURE Match_SHIFTREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR matchcond:BOOLEAN;
          Stree:LSSTREE_pStree;
          lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
            LSMATCHES_matchtreeVar(Lfirst,Llast,first,SHIFTREL,T1,match,lastmatchM_3_1);
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
BEGIN IF first THEN LSMATCHES_RMfirst(L,match,item1,LfirstM_3_1,LlastM_3_1
,item2,LfirstM_3_2,LlastM_3_2
) ELSE match_SHIFTREL(LfirstM_3_1,LfirstM_3_1,FALSE,match) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,POSTMODREL
,SHIFTREL,match,matchnode,matchlist2items,lastmatchM_3) END;
                                                              PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
    PROCEDURE Match_SIG2(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        SIG2.first:=Lfirst;
        SIG2.last:=Llast;
        match:= matchcondI4;
      END
      ELSE match:=FALSE
    END;
                                                      BEGIN LSMATCHES_matchlistsigma
(L,first,match,match_SIG2,matchlist0items,
LlastM_4,LfirstM_4,LrestM_4,nomoretreesM_4,iM_4) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_POSTMODREL,matchlist1items,
LlastM_3,LfirstM_3,LrestM_3,nomoretreesM_3) END;
BEGIN LSMATCHES_matchlistsigma
(L,first,match,match_SIG1,matchlist2items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2,iM_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist3items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2) AND (s^.li^.n <=4)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,HEAD,POSTMODREL,match,matchnode,matchlist4items,lastmatch) END;
                                                       FUNCTION subrule0X1 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitSIG1_1,LrestSIG1_1,LfirstSIG1_1,LlastSIG1_1:LSSTREE_prelnode;
iSIG1_1:INTEGER;
nomoretreesSIG1_1,lastmatchSIG1_1:BOOLEAN;
LinitSIG2_1,LrestSIG2_1,LfirstSIG2_1,LlastSIG2_1:LSSTREE_prelnode;
iSIG2_1:INTEGER;
nomoretreesSIG2_1,lastmatchSIG2_1:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDSIG2:BOOLEAN;
BEGIN MATCHCONDSIG2:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_PUNCREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PUNC THEN
            match:=FALSE;
          IF match THEN
            PUNCREC1:=s^.ls^.PUNCfield^;
          IF match THEN match:=(s^.ls^.PUNCfield^.key=auxkey('KOMMAPUNCKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PUNCREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PUNCREL
,match,matchnode,matchlist0items,lastmatchSIG1_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesSIG1_1:=False;
        LfirstSIG1_1:=NIL;
        SelectLfirstAndLlast(LfirstSIG1_1,LlastSIG1_1,LrestSIG1_1
,nomoretreesSIG1_1,L);
        IF LlastSIG1_1=Lfinal THEN LrestSIG1_1:=NIL;
        IF NOT nomoretreesSIG1_1 THEN
          BEGIN
          Match_PUNCREL(LfirstSIG1_1,LlastSIG1_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestSIG1_1=NIL) AND ((LfirstSIG1_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastSIG1_1=Lfinal THEN LrestSIG1_1:=NIL;
        Match_PUNCREL(LfirstSIG1_1,LlastSIG1_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestSIG1_1,FALSE,match);
      END;
    IF (LfirstSIG1_1<>NIL) THEN match:=match AND (LlastSIG1_1=Lfinal);
      IF match THEN IF NOT MatchcondSIG1 THEN
        MatchList1Items(LrestSIG1_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=PUNCREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(SIG1.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchlistSIG2(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
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
,match,matchnode,matchlist0items,lastmatchSIG2_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesSIG2_1:=False;
        LfirstSIG2_1:=NIL;
        SelectLfirstAndLlast(LfirstSIG2_1,LlastSIG2_1,LrestSIG2_1
,nomoretreesSIG2_1,L);
        IF LlastSIG2_1=Lfinal THEN LrestSIG2_1:=NIL;
        IF NOT nomoretreesSIG2_1 THEN
          BEGIN
          Match_PUNCREL(LfirstSIG2_1,LlastSIG2_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestSIG2_1=NIL) AND ((LfirstSIG2_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastSIG2_1=Lfinal THEN LrestSIG2_1:=NIL;
        Match_PUNCREL(LfirstSIG2_1,LlastSIG2_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestSIG2_1,FALSE,match);
      END;
    IF (LfirstSIG2_1<>NIL) THEN match:=match AND (LlastSIG2_1=Lfinal);
      IF match THEN IF NOT MatchcondSIG2 THEN
        MatchList1Items(LrestSIG2_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=PUNCREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(SIG2.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(SIG2.first,first,match);
    END;
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
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>RELPRO THEN
        match:=FALSE;
      IF match THEN
        RELPROREC1:=s^.ls^.RELPROfield^;
      IF match THEN match:=(s^.ls^.RELPROfield^.key=auxkey('DIERELPROKEY'));
    END{MatchNode};
                                                          BEGIN
    s:= T1;
        RELPROREC1tree:=s;
matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
  PROCEDURE createT4;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := NPVAR;
      N^.ls^.NPVARfield^ := NPVARREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T4}
  s:=MAKET_stree(NPVAR);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T4:=s;
  END{T4};
                                                      PROCEDURE ACTION11;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION17;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION23;
BEGIN
NPVARREC1:=COPYT_NPTOVAR(NPREC1);                     ;
NPVARREC1.INDEX:=level
                                                      ;
NPVARREC1.CASES:=[NOMINATIVE,
ACCUSATIVE,
DATIVE]                                               ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchlistSIG2(SIG2.first,SIG2.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((((NPREC1.GENDERS *[MASCGENDER,
FEMGENDER]                                            <>[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action11;
      action23;
      createT2;
      createT4;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =NPREC1.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action17;
      action23;
      createT2;
      createT4;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X1:=result
 END;
 FUNCTION subrule0X2 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitSIG2_1,LrestSIG2_1,LfirstSIG2_1,LlastSIG2_1:LSSTREE_prelnode;
iSIG2_1:INTEGER;
nomoretreesSIG2_1,lastmatchSIG2_1:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDSIG2:BOOLEAN;
BEGIN MATCHCONDSIG2:=TRUE END;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
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
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchlistSIG2(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
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
,match,matchnode,matchlist0items,lastmatchSIG2_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesSIG2_1:=False;
        LfirstSIG2_1:=NIL;
        SelectLfirstAndLlast(LfirstSIG2_1,LlastSIG2_1,LrestSIG2_1
,nomoretreesSIG2_1,L);
        IF LlastSIG2_1=Lfinal THEN LrestSIG2_1:=NIL;
        IF NOT nomoretreesSIG2_1 THEN
          BEGIN
          Match_PUNCREL(LfirstSIG2_1,LlastSIG2_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestSIG2_1=NIL) AND ((LfirstSIG2_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastSIG2_1=Lfinal THEN LrestSIG2_1:=NIL;
        Match_PUNCREL(LfirstSIG2_1,LlastSIG2_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestSIG2_1,FALSE,match);
      END;
    IF (LfirstSIG2_1<>NIL) THEN match:=match AND (LlastSIG2_1=Lfinal);
      IF match THEN IF NOT MatchcondSIG2 THEN
        MatchList1Items(LrestSIG2_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=PUNCREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(SIG2.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(SIG2.first,first,match);
    END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                          BEGIN
    s:= T2;
    match:=first;
    T3:=s;
    END;
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>RELPRO THEN
        match:=FALSE;
      IF match THEN
        RELPROREC1:=s^.ls^.RELPROfield^;
      IF match THEN match:=(s^.ls^.RELPROfield^.key=auxkey('DIERELPROKEY'));
    END{MatchNode};
                                                          BEGIN
    s:= T1;
        RELPROREC1tree:=s;
matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
  PROCEDURE createT4;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := NPVAR;
      N^.ls^.NPVARfield^ := NPVARREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T4}
  s:=MAKET_stree(NPVAR);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T4:=s;
  END{T4};
                                                      PROCEDURE ACTION35;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION41;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION47;
BEGIN
NPVARREC1:=COPYT_NPTOVAR(NPREC1);                     ;
NPVARREC1.INDEX:=level
                                                      ;
NPVARREC1.CASES:=[NOMINATIVE,
ACCUSATIVE,
DATIVE]                                               ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchlistSIG2(SIG2.first,SIG2.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((((NPREC1.GENDERS *[MASCGENDER,
FEMGENDER]                                            <>[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action35;
      action47;
      createT2;
      createT4;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =NPREC1.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action41;
      action47;
      createT2;
      createT4;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X2:=result
 END;
 FUNCTION subrule0X3 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDSIG2:BOOLEAN;
BEGIN MATCHCONDSIG2:=TRUE END;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
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
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchlistSIG2(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG2.first,first,match);
    END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                          BEGIN
    s:= T2;
    match:=first;
    T3:=s;
    END;
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>RELPRO THEN
        match:=FALSE;
      IF match THEN
        RELPROREC1:=s^.ls^.RELPROfield^;
      IF match THEN match:=(s^.ls^.RELPROfield^.key=auxkey('DIERELPROKEY'));
    END{MatchNode};
                                                          BEGIN
    s:= T1;
        RELPROREC1tree:=s;
matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
  PROCEDURE createT4;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := NPVAR;
      N^.ls^.NPVARfield^ := NPVARREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T4}
  s:=MAKET_stree(NPVAR);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T4:=s;
  END{T4};
                                                      PROCEDURE ACTION50;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION56;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION62;
BEGIN
NPVARREC1:=COPYT_NPTOVAR(NPREC1);                     ;
NPVARREC1.INDEX:=level
                                                      ;
NPVARREC1.CASES:=[NOMINATIVE,
ACCUSATIVE,
DATIVE]                                               ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchlistSIG2(SIG2.first,SIG2.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((((NPREC1.GENDERS *[MASCGENDER,
FEMGENDER]                                            <>[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action50;
      action62;
      createT2;
      createT4;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =NPREC1.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action56;
      action62;
      createT2;
      createT4;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X3:=result
 END;
 FUNCTION subrule0X4 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitSIG2_1,LrestSIG2_1,LfirstSIG2_1,LlastSIG2_1:LSSTREE_prelnode;
iSIG2_1:INTEGER;
nomoretreesSIG2_1,lastmatchSIG2_1:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDSIG2:BOOLEAN;
BEGIN MATCHCONDSIG2:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchlistSIG2(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
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
,match,matchnode,matchlist0items,lastmatchSIG2_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesSIG2_1:=False;
        LfirstSIG2_1:=NIL;
        SelectLfirstAndLlast(LfirstSIG2_1,LlastSIG2_1,LrestSIG2_1
,nomoretreesSIG2_1,L);
        IF LlastSIG2_1=Lfinal THEN LrestSIG2_1:=NIL;
        IF NOT nomoretreesSIG2_1 THEN
          BEGIN
          Match_PUNCREL(LfirstSIG2_1,LlastSIG2_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestSIG2_1=NIL) AND ((LfirstSIG2_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastSIG2_1=Lfinal THEN LrestSIG2_1:=NIL;
        Match_PUNCREL(LfirstSIG2_1,LlastSIG2_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestSIG2_1,FALSE,match);
      END;
    IF (LfirstSIG2_1<>NIL) THEN match:=match AND (LlastSIG2_1=Lfinal);
      IF match THEN IF NOT MatchcondSIG2 THEN
        MatchList1Items(LrestSIG2_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=PUNCREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(SIG2.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(SIG2.first,first,match);
    END;
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
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>RELPRO THEN
        match:=FALSE;
      IF match THEN
        RELPROREC1:=s^.ls^.RELPROfield^;
      IF match THEN match:=(s^.ls^.RELPROfield^.key=auxkey('DATRELPROKEY'));
    END{MatchNode};
                                                          BEGIN
    s:= T1;
        RELPROREC1tree:=s;
matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
  PROCEDURE createT4;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := NPVAR;
      N^.ls^.NPVARfield^ := NPVARREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T4}
  s:=MAKET_stree(NPVAR);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T4:=s;
  END{T4};
                                                      PROCEDURE ACTION74;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION80;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION86;
BEGIN
NPVARREC1:=COPYT_NPTOVAR(NPREC1);                     ;
NPVARREC1.INDEX:=level
                                                      ;
NPVARREC1.CASES:=[NOMINATIVE,
ACCUSATIVE,
DATIVE]                                               ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchlistSIG2(SIG2.first,SIG2.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
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
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action74;
      action86;
      createT2;
      createT4;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =NPREC1.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action80;
      action86;
      createT2;
      createT4;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X4:=result
 END;
 FUNCTION subrule0X5 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitSIG2_1,LrestSIG2_1,LfirstSIG2_1,LlastSIG2_1:LSSTREE_prelnode;
iSIG2_1:INTEGER;
nomoretreesSIG2_1,lastmatchSIG2_1:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDSIG2:BOOLEAN;
BEGIN MATCHCONDSIG2:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchlistSIG2(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
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
,match,matchnode,matchlist0items,lastmatchSIG2_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesSIG2_1:=False;
        LfirstSIG2_1:=NIL;
        SelectLfirstAndLlast(LfirstSIG2_1,LlastSIG2_1,LrestSIG2_1
,nomoretreesSIG2_1,L);
        IF LlastSIG2_1=Lfinal THEN LrestSIG2_1:=NIL;
        IF NOT nomoretreesSIG2_1 THEN
          BEGIN
          Match_PUNCREL(LfirstSIG2_1,LlastSIG2_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestSIG2_1=NIL) AND ((LfirstSIG2_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastSIG2_1=Lfinal THEN LrestSIG2_1:=NIL;
        Match_PUNCREL(LfirstSIG2_1,LlastSIG2_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestSIG2_1,FALSE,match);
      END;
    IF (LfirstSIG2_1<>NIL) THEN match:=match AND (LlastSIG2_1=Lfinal);
      IF match THEN IF NOT MatchcondSIG2 THEN
        MatchList1Items(LrestSIG2_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=PUNCREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(SIG2.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(SIG2.first,first,match);
    END;
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
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>BWHPRO THEN
        match:=FALSE;
      IF match THEN
        BWHPROREC1:=s^.ls^.BWHPROfield^;
      IF match THEN match:=(s^.ls^.BWHPROfield^.key=auxkey('WATWHPROKEY'));
    END{MatchNode};
                                                          BEGIN
    s:= T1;
        BWHPROREC1tree:=s;
matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
  PROCEDURE createT4;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := NPVAR;
      N^.ls^.NPVARfield^ := NPVARREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T4}
  s:=MAKET_stree(NPVAR);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T4:=s;
  END{T4};
                                                      PROCEDURE ACTION98;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION104;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION110;
BEGIN
NPVARREC1:=COPYT_NPTOVAR(NPREC1);                     ;
NPVARREC1.INDEX:=level
                                                      ;
NPVARREC1.CASES:=[NOMINATIVE,
ACCUSATIVE,
DATIVE]                                               ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchlistSIG2(SIG2.first,SIG2.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
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
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action98;
      action110;
      createT2;
      createT4;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =NPREC1.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action104;
      action110;
      createT2;
      createT4;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X5:=result
 END;
 FUNCTION subrule0X6 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDSIG2:BOOLEAN;
BEGIN MATCHCONDSIG2:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchlistSIG2(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG2.first,first,match);
    END;
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
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>RELPRO THEN
        match:=FALSE;
      IF match THEN
        RELPROREC1:=s^.ls^.RELPROfield^;
      IF match THEN match:=(s^.ls^.RELPROfield^.key=auxkey('DATRELPROKEY'));
    END{MatchNode};
                                                          BEGIN
    s:= T1;
        RELPROREC1tree:=s;
matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
  PROCEDURE createT4;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := NPVAR;
      N^.ls^.NPVARfield^ := NPVARREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T4}
  s:=MAKET_stree(NPVAR);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T4:=s;
  END{T4};
                                                      PROCEDURE ACTION113;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION119;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION125;
BEGIN
NPVARREC1:=COPYT_NPTOVAR(NPREC1);                     ;
NPVARREC1.INDEX:=level
                                                      ;
NPVARREC1.CASES:=[NOMINATIVE,
ACCUSATIVE,
DATIVE]                                               ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchlistSIG2(SIG2.first,SIG2.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
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
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action113;
      action125;
      createT2;
      createT4;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =NPREC1.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action119;
      action125;
      createT2;
      createT4;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X6:=result
 END;
 FUNCTION subrule0X7 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDSIG2:BOOLEAN;
BEGIN MATCHCONDSIG2:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchlistSIG2(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG2.first,first,match);
    END;
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
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>BWHPRO THEN
        match:=FALSE;
      IF match THEN
        BWHPROREC1:=s^.ls^.BWHPROfield^;
      IF match THEN match:=(s^.ls^.BWHPROfield^.key=auxkey('WATWHPROKEY'));
    END{MatchNode};
                                                          BEGIN
    s:= T1;
        BWHPROREC1tree:=s;
matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
  PROCEDURE createT4;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := NPVAR;
      N^.ls^.NPVARfield^ := NPVARREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T4}
  s:=MAKET_stree(NPVAR);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T4:=s;
  END{T4};
                                                      PROCEDURE ACTION128;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION134;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION140;
BEGIN
NPVARREC1:=COPYT_NPTOVAR(NPREC1);                     ;
NPVARREC1.INDEX:=level
                                                      ;
NPVARREC1.CASES:=[NOMINATIVE,
ACCUSATIVE,
DATIVE]                                               ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchlistSIG2(SIG2.first,SIG2.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
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
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action128;
      action140;
      createT2;
      createT4;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =NPREC1.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action134;
      action140;
      createT2;
      createT4;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X7:=result
 END;
 FUNCTION subrule0X8 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitSIG1_1,LrestSIG1_1,LfirstSIG1_1,LlastSIG1_1:LSSTREE_prelnode;
iSIG1_1:INTEGER;
nomoretreesSIG1_1,lastmatchSIG1_1:BOOLEAN;
LinitSIG2_1,LrestSIG2_1,LfirstSIG2_1,LlastSIG2_1:LSSTREE_prelnode;
iSIG2_1:INTEGER;
nomoretreesSIG2_1,lastmatchSIG2_1:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
LinitT1_1,LrestT1_1,LfirstT1_1,LlastT1_1:LSSTREE_prelnode;
iT1_1:INTEGER;
nomoretreesT1_1,lastmatchT1_1:BOOLEAN;
LinitT1_2,LrestT1_2,LfirstT1_2,LlastT1_2:LSSTREE_prelnode;
iT1_2:INTEGER;
nomoretreesT1_2,lastmatchT1_2:BOOLEAN;
LinitT1_3,LrestT1_3,LfirstT1_3,LlastT1_3:LSSTREE_prelnode;
iT1_3:INTEGER;
nomoretreesT1_3,lastmatchT1_3:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDSIG2:BOOLEAN;
BEGIN MATCHCONDSIG2:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_PUNCREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PUNC THEN
            match:=FALSE;
          IF match THEN
            PUNCREC1:=s^.ls^.PUNCfield^;
          IF match THEN match:=(s^.ls^.PUNCfield^.key=auxkey('KOMMAPUNCKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PUNCREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PUNCREL
,match,matchnode,matchlist0items,lastmatchSIG1_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesSIG1_1:=False;
        LfirstSIG1_1:=NIL;
        SelectLfirstAndLlast(LfirstSIG1_1,LlastSIG1_1,LrestSIG1_1
,nomoretreesSIG1_1,L);
        IF LlastSIG1_1=Lfinal THEN LrestSIG1_1:=NIL;
        IF NOT nomoretreesSIG1_1 THEN
          BEGIN
          Match_PUNCREL(LfirstSIG1_1,LlastSIG1_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestSIG1_1=NIL) AND ((LfirstSIG1_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastSIG1_1=Lfinal THEN LrestSIG1_1:=NIL;
        Match_PUNCREL(LfirstSIG1_1,LlastSIG1_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestSIG1_1,FALSE,match);
      END;
    IF (LfirstSIG1_1<>NIL) THEN match:=match AND (LlastSIG1_1=Lfinal);
      IF match THEN IF NOT MatchcondSIG1 THEN
        MatchList1Items(LrestSIG1_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=PUNCREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(SIG1.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchlistSIG2(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
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
,match,matchnode,matchlist0items,lastmatchSIG2_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesSIG2_1:=False;
        LfirstSIG2_1:=NIL;
        SelectLfirstAndLlast(LfirstSIG2_1,LlastSIG2_1,LrestSIG2_1
,nomoretreesSIG2_1,L);
        IF LlastSIG2_1=Lfinal THEN LrestSIG2_1:=NIL;
        IF NOT nomoretreesSIG2_1 THEN
          BEGIN
          Match_PUNCREL(LfirstSIG2_1,LlastSIG2_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestSIG2_1=NIL) AND ((LfirstSIG2_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastSIG2_1=Lfinal THEN LrestSIG2_1:=NIL;
        Match_PUNCREL(LfirstSIG2_1,LlastSIG2_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestSIG2_1,FALSE,match);
      END;
    IF (LfirstSIG2_1<>NIL) THEN match:=match AND (LlastSIG2_1=Lfinal);
      IF match THEN IF NOT MatchcondSIG2 THEN
        MatchList1Items(LrestSIG2_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=PUNCREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(SIG2.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(SIG2.first,first,match);
    END;
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
      IF s^.ls^.cat<>PREPP THEN
        match:=FALSE;
      IF match THEN
        PREPPREC1:=s^.ls^.PREPPfield^;
    END{MatchNode};
                                                          PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_ERREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>RADV THEN
            match:=FALSE;
          IF match THEN
            RADVREC1:=s^.ls^.RADVfield^;
          IF match THEN match:=(s^.ls^.RADVfield^.key=auxkey('WAARRADVKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    RADVREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,ERREL
,match,matchnode,matchlist0items,lastmatchT1_1) END;
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
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
  PROCEDURE createT4;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := VARPREPP;
      N^.ls^.VARPREPPfield^ := VARPREPPREC1;
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
          N^.ls^.RADVPfield^ := RADVPREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        VAR list:LSMRUQUO_ListOfStrees;
        PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
          PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
          VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
           list1:LSMRUQUO_ListOfStrees;
            PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
            BEGIN{CreateNode}
              N^.ls^.cat := NPVAR;
              N^.ls^.NPVARfield^ := NPVARREC1;
            END{CreateNode};
                                                                  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
            BEGIN
            wholelist.first:=NIL;wholelist.last:=NIL;
            END;
                                                                BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,NPVAR,createnode,createlist1);
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
                                                        BEGIN{T4}
  s:=MAKET_stree(VARPREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T4:=s;
  END{T4};
                                                      PROCEDURE ACTION155;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION161;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION173;
BEGIN
VARPREPPREC1:=PREPPREC1;                              ;
VARPREPPREC1.MOOD:=DECLXPMOOD
                                                      ;
RADVPREC1.MOOD:=DECLXPMOOD;
RADVPREC1.KINDEFS:=
[LK]                                                  ;RADVPREC1.RADVKEY:=RADVREC1.KEY;
                                                      ;
NPVARREC1:=COPYT_NPTOVAR(NPREC1);                     ;
NPVARREC1.INDEX:=level
                                                      ;
NPVARREC1.CASES:=[RCASE]                                               ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchlistSIG2(SIG2.first,SIG2.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((PREPPREC1.MOOD =WH                                    )
                                                      )
THEN IF
          ((((NPREC1.GENDERS *[MASCGENDER,
FEMGENDER]                                            <>[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action155;
      action173;
      createT2;
      createT4;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =NPREC1.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action161;
      action173;
      createT2;
      createT4;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X8:=result
 END;
 FUNCTION subrule0X9 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitSIG2_1,LrestSIG2_1,LfirstSIG2_1,LlastSIG2_1:LSSTREE_prelnode;
iSIG2_1:INTEGER;
nomoretreesSIG2_1,lastmatchSIG2_1:BOOLEAN;
LinitT1_1,LrestT1_1,LfirstT1_1,LlastT1_1:LSSTREE_prelnode;
iT1_1:INTEGER;
nomoretreesT1_1,lastmatchT1_1:BOOLEAN;
LinitT1_2,LrestT1_2,LfirstT1_2,LlastT1_2:LSSTREE_prelnode;
iT1_2:INTEGER;
nomoretreesT1_2,lastmatchT1_2:BOOLEAN;
LinitT1_3,LrestT1_3,LfirstT1_3,LlastT1_3:LSSTREE_prelnode;
iT1_3:INTEGER;
nomoretreesT1_3,lastmatchT1_3:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDSIG2:BOOLEAN;
BEGIN MATCHCONDSIG2:=TRUE END;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
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
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchlistSIG2(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
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
,match,matchnode,matchlist0items,lastmatchSIG2_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesSIG2_1:=False;
        LfirstSIG2_1:=NIL;
        SelectLfirstAndLlast(LfirstSIG2_1,LlastSIG2_1,LrestSIG2_1
,nomoretreesSIG2_1,L);
        IF LlastSIG2_1=Lfinal THEN LrestSIG2_1:=NIL;
        IF NOT nomoretreesSIG2_1 THEN
          BEGIN
          Match_PUNCREL(LfirstSIG2_1,LlastSIG2_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestSIG2_1=NIL) AND ((LfirstSIG2_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastSIG2_1=Lfinal THEN LrestSIG2_1:=NIL;
        Match_PUNCREL(LfirstSIG2_1,LlastSIG2_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestSIG2_1,FALSE,match);
      END;
    IF (LfirstSIG2_1<>NIL) THEN match:=match AND (LlastSIG2_1=Lfinal);
      IF match THEN IF NOT MatchcondSIG2 THEN
        MatchList1Items(LrestSIG2_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=PUNCREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(SIG2.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(SIG2.first,first,match);
    END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                          BEGIN
    s:= T2;
    match:=first;
    T3:=s;
    END;
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
      IF s^.ls^.cat<>PREPP THEN
        match:=FALSE;
      IF match THEN
        PREPPREC1:=s^.ls^.PREPPfield^;
    END{MatchNode};
                                                          PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_ERREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>RADV THEN
            match:=FALSE;
          IF match THEN
            RADVREC1:=s^.ls^.RADVfield^;
          IF match THEN match:=(s^.ls^.RADVfield^.key=auxkey('WAARRADVKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    RADVREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,ERREL
,match,matchnode,matchlist0items,lastmatchT1_1) END;
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
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
  PROCEDURE createT4;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := VARPREPP;
      N^.ls^.VARPREPPfield^ := VARPREPPREC1;
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
          N^.ls^.RADVPfield^ := RADVPREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        VAR list:LSMRUQUO_ListOfStrees;
        PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
          PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
          VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
           list1:LSMRUQUO_ListOfStrees;
            PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
            BEGIN{CreateNode}
              N^.ls^.cat := NPVAR;
              N^.ls^.NPVARfield^ := NPVARREC1;
            END{CreateNode};
                                                                  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
            BEGIN
            wholelist.first:=NIL;wholelist.last:=NIL;
            END;
                                                                BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,NPVAR,createnode,createlist1);
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
                                                        BEGIN{T4}
  s:=MAKET_stree(VARPREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T4:=s;
  END{T4};
                                                      PROCEDURE ACTION188;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION194;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION206;
BEGIN
VARPREPPREC1:=PREPPREC1;                              ;
VARPREPPREC1.MOOD:=DECLXPMOOD
                                                      ;
RADVPREC1.MOOD:=DECLXPMOOD;
RADVPREC1.KINDEFS:=
[LK]                                                  ;RADVPREC1.RADVKEY:=RADVREC1.KEY;
                                                      ;
NPVARREC1:=COPYT_NPTOVAR(NPREC1);                     ;
NPVARREC1.INDEX:=level
                                                      ;
NPVARREC1.CASES:=[RCASE]                                               ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchlistSIG2(SIG2.first,SIG2.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((PREPPREC1.MOOD =WH                                    )
                                                      )
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action188;
      action206;
      createT2;
      createT4;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =NPREC1.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action194;
      action206;
      createT2;
      createT4;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X9:=result
 END;
 FUNCTION subrule0X10 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitT1_1,LrestT1_1,LfirstT1_1,LlastT1_1:LSSTREE_prelnode;
iT1_1:INTEGER;
nomoretreesT1_1,lastmatchT1_1:BOOLEAN;
LinitT1_2,LrestT1_2,LfirstT1_2,LlastT1_2:LSSTREE_prelnode;
iT1_2:INTEGER;
nomoretreesT1_2,lastmatchT1_2:BOOLEAN;
LinitT1_3,LrestT1_3,LfirstT1_3,LlastT1_3:LSSTREE_prelnode;
iT1_3:INTEGER;
nomoretreesT1_3,lastmatchT1_3:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
FUNCTION MATCHCONDSIG2:BOOLEAN;
BEGIN MATCHCONDSIG2:=TRUE END;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
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
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG1.first,first,match);
    END;
                                                          PROCEDURE matchlistSIG2(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG2.first,first,match);
    END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                          BEGIN
    s:= T2;
    match:=first;
    T3:=s;
    END;
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
      IF s^.ls^.cat<>PREPP THEN
        match:=FALSE;
      IF match THEN
        PREPPREC1:=s^.ls^.PREPPfield^;
    END{MatchNode};
                                                          PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_ERREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>RADV THEN
            match:=FALSE;
          IF match THEN
            RADVREC1:=s^.ls^.RADVfield^;
          IF match THEN match:=(s^.ls^.RADVfield^.key=auxkey('WAARRADVKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    RADVREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,ERREL
,match,matchnode,matchlist0items,lastmatchT1_1) END;
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
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
  PROCEDURE createT4;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := VARPREPP;
      N^.ls^.VARPREPPfield^ := VARPREPPREC1;
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
          N^.ls^.RADVPfield^ := RADVPREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        VAR list:LSMRUQUO_ListOfStrees;
        PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
          PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
          VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
           list1:LSMRUQUO_ListOfStrees;
            PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
            BEGIN{CreateNode}
              N^.ls^.cat := NPVAR;
              N^.ls^.NPVARfield^ := NPVARREC1;
            END{CreateNode};
                                                                  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
            BEGIN
            wholelist.first:=NIL;wholelist.last:=NIL;
            END;
                                                                BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,NPVAR,createnode,createlist1);
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
                                                        BEGIN{T4}
  s:=MAKET_stree(VARPREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T4:=s;
  END{T4};
                                                      PROCEDURE ACTION209;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION215;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
SENTENCEREC1.DEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION227;
BEGIN
VARPREPPREC1:=PREPPREC1;                              ;
VARPREPPREC1.MOOD:=DECLXPMOOD
                                                      ;
RADVPREC1.MOOD:=DECLXPMOOD;
RADVPREC1.KINDEFS:=
[LK]                                                  ;RADVPREC1.RADVKEY:=RADVREC1.KEY;
                                                      ;
NPVARREC1:=COPYT_NPTOVAR(NPREC1);                     ;
NPVARREC1.INDEX:=level
                                                      ;
NPVARREC1.CASES:=[RCASE]                                               ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
 IF match THEN matchlistSIG2(SIG2.first,SIG2.last,match,TRUE);
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT1(match,TRUE);
If match Then
WHILE match AND NOT matchcondT1 DO
BEGIN
MatchtreeT1(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((PREPPREC1.MOOD =WH                                    )
                                                      )
                                                       THEN
    BEGIN
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((((SENTENCEREC2.DEIXIS =PRESENTDEIXIS                    )
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
          (((((SENTENCEREC2.DEIXIS =PASTDEIXIS                       )
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
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action209;
      action227;
      createT2;
      createT4;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =NPREC1.SUPERDEIXIS               )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_RADVPrec(RADVPREC1);
      action215;
      action227;
      createT2;
      createT4;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X10:=result
 END;
                                                      BEGIN
m:=loopholes.retype(Is,LSSTREE_pstree);
LISTREE_InitSetOfTupleOfStrees(result);
match:=TRUE;
first:=TRUE;
matchmodel(m,first,match);
first:=FALSE;
IF match THEN
 BEGIN
 level:=LIMATCHES_newlevel;
 subst:=1;
  LISTREE_mergesetsoftuplestrees(subrule0X1,result);
  LISTREE_mergesetsoftuplestrees(subrule0X2,result);
  LISTREE_mergesetsoftuplestrees(subrule0X3,result);
  LISTREE_mergesetsoftuplestrees(subrule0X4,result);
  LISTREE_mergesetsoftuplestrees(subrule0X5,result);
  LISTREE_mergesetsoftuplestrees(subrule0X6,result);
  LISTREE_mergesetsoftuplestrees(subrule0X7,result);
  LISTREE_mergesetsoftuplestrees(subrule0X8,result);
  LISTREE_mergesetsoftuplestrees(subrule0X9,result);
  LISTREE_mergesetsoftuplestrees(subrule0X10,result);
 END;
DECRNONCNMODRELSENT1:=result
END;
{:RNONCNMODRELSENT1}
{rule:}
{:RCNMODINFREL}
 FUNCTION DECRCNMODINFREL(VAR LEVEL,subst:INTEGER;
Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
VAR result:LISTREE_SetOfTupleOfStrees;
 wbonus,sbonus:INTEGER;
 m:LSSTREE_pstree;
 tuple:LISTREE_TupleOfStrees;
 first:BOOLEAN;
 match:BOOLEAN;
 idargs:LIIDDICT_idargs;
dtree:HYPERDTREE_phyperdtree;
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
LinitM_1,LrestM_1,LfirstM_1,LlastM_1:LSSTREE_prelnode;
iM_1:INTEGER;
nomoretreesM_1,lastmatchM_1:BOOLEAN;
LinitM_2,LrestM_2,LfirstM_2,LlastM_2:LSSTREE_prelnode;
iM_2:INTEGER;
nomoretreesM_2,lastmatchM_2:BOOLEAN;
LinitM_2_1,LrestM_2_1,LfirstM_2_1,LlastM_2_1:LSSTREE_prelnode;
iM_2_1:INTEGER;
nomoretreesM_2_1,lastmatchM_2_1:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
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
PUNCREC1:LSDOMAINT_PUNCrecord;
SENTENCEREC2:LSDOMAINT_SENTENCErecord;
CNREC2:LSDOMAINT_CNrecord;
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
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CN;
    N^.ls^.CNfield^ := CNREC1;
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
  BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem11);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(CN);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
PROCEDURE createM2;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := SENTENCE;
    N^.ls^.SENTENCEfield^ := SENTENCEREC1;
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
                                                      BEGIN{createM}
m2:=MAKET_stree(SENTENCE);
createnode(m2);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m2^.li^.n:=numberofelements(list);
m2^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>CN THEN
      match:=FALSE;
    IF match THEN
      CNREC2:=s^.ls^.CNfield^;
  END{MatchNode};
                                                        PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR
    itemmatch,listmatch:Boolean;
    PROCEDURE Match_MU1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU1.first:=Lfirst;
        MU1.last:=Llast;
        match:= matchcondI1;
      END
      ELSE match:=FALSE
    END;
                                                          PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
          SENTENCEREC2:=s^.ls^.SENTENCEfield^;
        IF match THEN
          match:= matchcondI4;
      END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        PROCEDURE Match_MU2(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU2.first:=Lfirst;
            MU2.last:=Llast;
            match:= matchcondI5;
          END
          ELSE match:=FALSE
        END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU2(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU2(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM_2_1:=L;WHILE LlastM_2_1^.brother<>NIL DO
LlastM_2_1:=LlastM_2_1^.brother;
match_MU2(L,LlastM_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,POSTMODREL
,match,matchnode,matchlist1items,lastmatchM_2) END;
                                                            PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
    PROCEDURE Match_SIG1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        SIG1.first:=Lfirst;
        SIG1.last:=Llast;
        match:= matchcondI3;
      END
      ELSE match:=FALSE
    END;
                                                      BEGIN LSMATCHES_matchlistsigma
(L,first,match,match_SIG1,matchlist0items,
LlastM_3,LfirstM_3,LrestM_3,nomoretreesM_3,iM_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_POSTMODREL,matchlist1items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist2items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,POSTMODREL,match,matchnode,matchlist3items,lastmatch) END;
                                                       FUNCTION subrule0X1 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitSIG1_1,LrestSIG1_1,LfirstSIG1_1,LlastSIG1_1:LSSTREE_prelnode;
iSIG1_1:INTEGER;
nomoretreesSIG1_1,lastmatchSIG1_1:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_PUNCREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PUNC THEN
            match:=FALSE;
          IF match THEN
            PUNCREC1:=s^.ls^.PUNCfield^;
          IF match THEN match:=(s^.ls^.PUNCfield^.key=auxkey('KOMMAPUNCKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PUNCREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PUNCREL
,match,matchnode,matchlist0items,lastmatchSIG1_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesSIG1_1:=False;
        LfirstSIG1_1:=NIL;
        SelectLfirstAndLlast(LfirstSIG1_1,LlastSIG1_1,LrestSIG1_1
,nomoretreesSIG1_1,L);
        IF LlastSIG1_1=Lfinal THEN LrestSIG1_1:=NIL;
        IF NOT nomoretreesSIG1_1 THEN
          BEGIN
          Match_PUNCREL(LfirstSIG1_1,LlastSIG1_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestSIG1_1=NIL) AND ((LfirstSIG1_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastSIG1_1=Lfinal THEN LrestSIG1_1:=NIL;
        Match_PUNCREL(LfirstSIG1_1,LlastSIG1_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestSIG1_1,FALSE,match);
      END;
    IF (LfirstSIG1_1<>NIL) THEN match:=match AND (LlastSIG1_1=Lfinal);
      IF match THEN IF NOT MatchcondSIG1 THEN
        MatchList1Items(LrestSIG1_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=PUNCREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(SIG1.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(SIG1.first,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := CNVAR;
      N^.ls^.CNVARfield^ := CNVARREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T1}
  s:=MAKET_stree(CNVAR);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION2;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION6;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=CNREC2.SUPERDEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION14;
BEGIN
CNVARREC1:=COPYT_CNTOVAR(CNREC2);                     ;
CNVARREC1.INDEX:=level
                                                      ;
CNVARREC1.CASES:=[NOMINATIVE,
ACCUSATIVE,
DATIVE]                                               ;
CNREC1:=CNREC2;                                       ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
  IF match THEN
    BEGIN
  IF ((TRUE                                                  )
                                                      )
                                                       THEN
    BEGIN
    IF ((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
THEN IF
          ((SENTENCEREC2.DEIXIS =OMEGADEIXIS                      )
                                                      )
THEN IF
          ((((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_RADVPrec(RADVPREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_PREPrec(PREPREC1);
      action2;
      action14;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =OMEGADEIXIS                      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_RADVPrec(RADVPREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_PREPrec(PREPREC1);
      action6;
      action14;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X1:=result
 END;
 FUNCTION subrule0X2 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG1.first,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := CNVAR;
      N^.ls^.CNVARfield^ := CNVARREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T1}
  s:=MAKET_stree(CNVAR);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION27;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION31;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=CNREC2.SUPERDEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION39;
BEGIN
CNVARREC1:=COPYT_CNTOVAR(CNREC2);                     ;
CNVARREC1.INDEX:=level
                                                      ;
CNVARREC1.CASES:=[NOMINATIVE,
ACCUSATIVE,
DATIVE]                                               ;
CNREC1:=CNREC2;                                       ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
  IF match THEN
    BEGIN
  IF ((TRUE                                                  )
                                                      )
                                                       THEN
    BEGIN
    IF ((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
THEN IF
          ((SENTENCEREC2.DEIXIS =OMEGADEIXIS                      )
                                                      )
THEN IF
          ((((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_RADVPrec(RADVPREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_PREPrec(PREPREC1);
      action27;
      action39;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =OMEGADEIXIS                      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_RADVPrec(RADVPREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_PREPrec(PREPREC1);
      action31;
      action39;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X2:=result
 END;
 FUNCTION subrule0X3 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitSIG1_1,LrestSIG1_1,LfirstSIG1_1,LlastSIG1_1:LSSTREE_prelnode;
iSIG1_1:INTEGER;
nomoretreesSIG1_1,lastmatchSIG1_1:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_PUNCREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PUNC THEN
            match:=FALSE;
          IF match THEN
            PUNCREC1:=s^.ls^.PUNCfield^;
          IF match THEN match:=(s^.ls^.PUNCfield^.key=auxkey('KOMMAPUNCKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PUNCREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PUNCREL
,match,matchnode,matchlist0items,lastmatchSIG1_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesSIG1_1:=False;
        LfirstSIG1_1:=NIL;
        SelectLfirstAndLlast(LfirstSIG1_1,LlastSIG1_1,LrestSIG1_1
,nomoretreesSIG1_1,L);
        IF LlastSIG1_1=Lfinal THEN LrestSIG1_1:=NIL;
        IF NOT nomoretreesSIG1_1 THEN
          BEGIN
          Match_PUNCREL(LfirstSIG1_1,LlastSIG1_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestSIG1_1=NIL) AND ((LfirstSIG1_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastSIG1_1=Lfinal THEN LrestSIG1_1:=NIL;
        Match_PUNCREL(LfirstSIG1_1,LlastSIG1_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestSIG1_1,FALSE,match);
      END;
    IF (LfirstSIG1_1<>NIL) THEN match:=match AND (LlastSIG1_1=Lfinal);
      IF match THEN IF NOT MatchcondSIG1 THEN
        MatchList1Items(LrestSIG1_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=PUNCREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(SIG1.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(SIG1.first,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := RADVP;
      N^.ls^.RADVPfield^ := RADVPREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := CNVAR;
          N^.ls^.CNVARfield^ := CNVARREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,CNVAR,createnode,createlist1);
      END{HEAD};
                                                          BEGIN{createitem11}
    createHEAD(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{T1}
  s:=MAKET_stree(RADVP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION42;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION46;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=CNREC2.SUPERDEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION56;
BEGIN
RADVPREC1.MOOD:=DECLXPMOOD;
RADVPREC1.RADVKEY:=0;
RADVPREC1.KINDEFS:=
[PK]                                                  ;                                                     ;
CNVARREC1:=COPYT_CNTOVAR(CNREC2);                     ;
CNVARREC1.INDEX:=level
                                                      ;
CNVARREC1.CASES:=[RCASE]                                               ;
CNREC1:=CNREC2;                                       ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
  IF match THEN
    BEGIN
  IF ((TRUE                                                  )
                                                      )
                                                       THEN
    BEGIN
    IF ((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
THEN IF
          ((SENTENCEREC2.DEIXIS =OMEGADEIXIS                      )
                                                      )
THEN IF
          ((((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_RADVPrec(RADVPREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_PREPrec(PREPREC1);
      action42;
      action56;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =OMEGADEIXIS                      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_RADVPrec(RADVPREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_PREPrec(PREPREC1);
      action46;
      action56;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X3:=result
 END;
 FUNCTION subrule0X4 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG1.first,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := RADVP;
      N^.ls^.RADVPfield^ := RADVPREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
      VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
       list1:LSMRUQUO_ListOfStrees;
        PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
        BEGIN{CreateNode}
          N^.ls^.cat := CNVAR;
          N^.ls^.CNVARfield^ := CNVARREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,CNVAR,createnode,createlist1);
      END{HEAD};
                                                          BEGIN{createitem11}
    createHEAD(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{T1}
  s:=MAKET_stree(RADVP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION69;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION73;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=CNREC2.SUPERDEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION83;
BEGIN
RADVPREC1.MOOD:=DECLXPMOOD;
RADVPREC1.KINDEFS:=
[PK]                                                  ;RADVPREC1.RADVKEY:=0;
                                                      ;
CNVARREC1:=COPYT_CNTOVAR(CNREC2);                     ;
CNVARREC1.INDEX:=level
                                                      ;
CNVARREC1.CASES:=[RCASE]                                               ;
CNREC1:=CNREC2;                                       ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
  IF match THEN
    BEGIN
  IF ((TRUE                                                  )
                                                      )
                                                       THEN
    BEGIN
    IF ((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
THEN IF
          ((SENTENCEREC2.DEIXIS =OMEGADEIXIS                      )
                                                      )
THEN IF
          ((((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_RADVPrec(RADVPREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_PREPrec(PREPREC1);
      action69;
      action83;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =OMEGADEIXIS                      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_RADVPrec(RADVPREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_PREPrec(PREPREC1);
      action73;
      action83;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X4:=result
 END;
 FUNCTION subrule0X5 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitSIG1_1,LrestSIG1_1,LfirstSIG1_1,LlastSIG1_1:LSSTREE_prelnode;
iSIG1_1:INTEGER;
nomoretreesSIG1_1,lastmatchSIG1_1:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_PUNCREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>PUNC THEN
            match:=FALSE;
          IF match THEN
            PUNCREC1:=s^.ls^.PUNCfield^;
          IF match THEN match:=(s^.ls^.PUNCfield^.key=auxkey('KOMMAPUNCKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PUNCREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PUNCREL
,match,matchnode,matchlist0items,lastmatchSIG1_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesSIG1_1:=False;
        LfirstSIG1_1:=NIL;
        SelectLfirstAndLlast(LfirstSIG1_1,LlastSIG1_1,LrestSIG1_1
,nomoretreesSIG1_1,L);
        IF LlastSIG1_1=Lfinal THEN LrestSIG1_1:=NIL;
        IF NOT nomoretreesSIG1_1 THEN
          BEGIN
          Match_PUNCREL(LfirstSIG1_1,LlastSIG1_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestSIG1_1=NIL) AND ((LfirstSIG1_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastSIG1_1=Lfinal THEN LrestSIG1_1:=NIL;
        Match_PUNCREL(LfirstSIG1_1,LlastSIG1_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestSIG1_1,FALSE,match);
      END;
    IF (LfirstSIG1_1<>NIL) THEN match:=match AND (LlastSIG1_1=Lfinal);
      IF match THEN IF NOT MatchcondSIG1 THEN
        MatchList1Items(LrestSIG1_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=PUNCREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(SIG1.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(SIG1.first,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := VARPREPP;
      N^.ls^.VARPREPPfield^ := VARPREPPREC1;
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
          N^.ls^.cat := CNVAR;
          N^.ls^.CNVARfield^ := CNVARREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{OBJREL}
LSMATCHES_createitem(list,OBJREL,CNVAR,createnode,createlist1);
      END{OBJREL};
                                                          BEGIN{createitem12}
    createOBJREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist2items11(wholelist,createitem11,createitem12);
    END{createlist1};
                                                        BEGIN{T1}
  s:=MAKET_stree(VARPREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION86;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION90;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=CNREC2.SUPERDEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION100;
BEGIN
VARPREPPREC1.MOOD:=RELATIVEXPMOOD;
VARPREPPREC1.ACTSUBCEFS:=PREPREC1.SUBCS;
VARPREPPREC1.SYNPPEFS:=PREPREC1.SYNPPS;
VARPREPPREC1.THETAPP:=PREPREC1.THETAPP;
VARPREPPREC1.HEADKEY:=PREPREC1.KEY;
VARPREPPREC1.CLASS:=PREPREC1.CLASS;
VARPREPPREC1.DEIXIS:=PREPREC1.DEIXIS;
VARPREPPREC1.ASPECT:=PREPREC1.ASPECT;
VARPREPPREC1.RETRO:=PREPREC1.RETRO;
VARPREPPREC1.RADVKEY:=0;
VARPREPPREC1.SPECQ:=YESSPEC;
                                                      ;
CNVARREC1:=COPYT_CNTOVAR(CNREC2);                     ;
CNVARREC1.INDEX:=level
                                                      ;
CNVARREC1.CASES:=[ACCUSATIVE]                                          ;
CNREC1:=CNREC2;                                       ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
  IF match THEN
    BEGIN
  IF ((TRUE                                                  )
                                                      )
                                                       THEN
    BEGIN
    IF ((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
THEN IF
          ((SENTENCEREC2.DEIXIS =OMEGADEIXIS                      )
                                                      )
THEN IF
          ((((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_RADVPrec(RADVPREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_PREPrec(PREPREC1);
      hulpstree:=LDBLEX_read(auxkey('INPREPKEY'));
      PREPREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
      PREPREC1:=PREPREC1tree^.ls^.PREPfield^;
      action86;
      action100;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =OMEGADEIXIS                      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_RADVPrec(RADVPREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_PREPrec(PREPREC1);
      hulpstree:=LDBLEX_read(auxkey('INPREPKEY'));
      PREPREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
      PREPREC1:=PREPREC1tree^.ls^.PREPfield^;
      action90;
      action100;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X5:=result
 END;
 FUNCTION subrule0X6 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG1.first,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := VARPREPP;
      N^.ls^.VARPREPPfield^ := VARPREPPREC1;
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
          N^.ls^.cat := CNVAR;
          N^.ls^.CNVARfield^ := CNVARREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{OBJREL}
LSMATCHES_createitem(list,OBJREL,CNVAR,createnode,createlist1);
      END{OBJREL};
                                                          BEGIN{createitem12}
    createOBJREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist2items11(wholelist,createitem11,createitem12);
    END{createlist1};
                                                        BEGIN{T1}
  s:=MAKET_stree(VARPREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION113;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION117;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
SENTENCEREC1.SUPERDEIXIS:=CNREC2.SUPERDEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION127;
BEGIN
VARPREPPREC1.MOOD:=RELATIVEXPMOOD;
VARPREPPREC1.ACTSUBCEFS:=PREPREC1.SUBCS;
VARPREPPREC1.SYNPPEFS:=PREPREC1.SYNPPS;
VARPREPPREC1.THETAPP:=PREPREC1.THETAPP;
VARPREPPREC1.HEADKEY:=PREPREC1.KEY;
VARPREPPREC1.CLASS:=PREPREC1.CLASS;
VARPREPPREC1.DEIXIS:=PREPREC1.DEIXIS;
VARPREPPREC1.ASPECT:=PREPREC1.ASPECT;
VARPREPPREC1.RETRO:=PREPREC1.RETRO;
VARPREPPREC1.RADVKEY:=0;
VARPREPPREC1.SPECQ:=YESSPEC;
                                                      ;
CNVARREC1:=COPYT_CNTOVAR(CNREC2);                     ;
CNVARREC1.INDEX:=level
                                                      ;
CNVARREC1.CASES:=[ACCUSATIVE]                                          ;
CNREC1:=CNREC2;                                       ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
  IF match THEN
    BEGIN
  IF ((TRUE                                                  )
                                                      )
                                                       THEN
    BEGIN
    IF ((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
THEN IF
          ((SENTENCEREC2.DEIXIS =OMEGADEIXIS                      )
                                                      )
THEN IF
          ((((NOT(LSMRUQUO_TEMPREFNOTFOUND(MU2
))                                                    )
                                                      )
                                                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_RADVPrec(RADVPREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_PREPrec(PREPREC1);
      hulpstree:=LDBLEX_read(auxkey('INPREPKEY'));
      PREPREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
      PREPREC1:=PREPREC1tree^.ls^.PREPfield^;
      action113;
      action127;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((SENTENCEREC2.DEIXIS =OMEGADEIXIS                      )
                                                      )
                                                      )
                                                      )
THEN IF
          ((LSMRUQUO_TEMPREFNOTFOUND(MU2
)                                                     )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_RADVPrec(RADVPREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_PREPrec(PREPREC1);
      hulpstree:=LDBLEX_read(auxkey('INPREPKEY'));
      PREPREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
      PREPREC1:=PREPREC1tree^.ls^.PREPfield^;
      action117;
      action127;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X6:=result
 END;
 FUNCTION subrule0X7 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDSIG1:BOOLEAN;
BEGIN MATCHCONDSIG1:=TRUE END;
                                                          PROCEDURE matchlistSIG1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(SIG1.first,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := VARPREPP;
      N^.ls^.VARPREPPfield^ := VARPREPPREC1;
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
          N^.ls^.cat := CNVAR;
          N^.ls^.CNVARfield^ := CNVARREC1;
        END{CreateNode};
                                                              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
        BEGIN
        wholelist.first:=NIL;wholelist.last:=NIL;
        END;
                                                            BEGIN{OBJREL}
LSMATCHES_createitem(list,OBJREL,CNVAR,createnode,createlist1);
      END{OBJREL};
                                                          BEGIN{createitem12}
    createOBJREL(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist2items11(wholelist,createitem11,createitem12);
    END{createlist1};
                                                        BEGIN{T1}
  s:=MAKET_stree(VARPREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION136;
BEGIN
SENTENCEREC1:=SENTENCEREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION146;
BEGIN
VARPREPPREC1.MOOD:=RELATIVEXPMOOD;
VARPREPPREC1.ACTSUBCEFS:=PREPREC1.SUBCS;
VARPREPPREC1.SYNPPEFS:=PREPREC1.SYNPPS;
VARPREPPREC1.THETAPP:=PREPREC1.THETAPP;
VARPREPPREC1.HEADKEY:=PREPREC1.KEY;
VARPREPPREC1.CLASS:=PREPREC1.CLASS;
VARPREPPREC1.DEIXIS:=PREPREC1.DEIXIS;
VARPREPPREC1.ASPECT:=PREPREC1.ASPECT;
VARPREPPREC1.RETRO:=PREPREC1.RETRO;
VARPREPPREC1.RADVKEY:=0;
VARPREPPREC1.SPECQ:=YESSPEC;
                                                      ;
CNVARREC1:=COPYT_CNTOVAR(CNREC2);                     ;
CNVARREC1.INDEX:=level
                                                      ;
CNVARREC1.CASES:=[ACCUSATIVE]                                          ;
CNREC1:=CNREC2;                                       ;
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
  IF match THEN
    BEGIN
  IF ((CNREC2.TEMPORAL =TRUE                                 )
                                                      )
                                                       THEN
    BEGIN
    IF ((SENTENCEREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
THEN IF
          ((SENTENCEREC2.DEIXIS =OMEGADEIXIS                      )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC1);
      MAKET_SENTENCErec(SENTENCEREC1);
      MAKET_CNVARrec(CNVARREC1);
      MAKET_RADVPrec(RADVPREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_PREPrec(PREPREC1);
      hulpstree:=LDBLEX_read(auxkey('S_PREP1243607'));
      PREPREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
      PREPREC1:=PREPREC1tree^.ls^.PREPfield^;
      action136;
      action146;
      createT1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X7:=result
 END;
                                                      BEGIN
m:=loopholes.retype(Is,LSSTREE_pstree);
LISTREE_InitSetOfTupleOfStrees(result);
match:=TRUE;
first:=TRUE;
matchmodel(m,first,match);
first:=FALSE;
IF match THEN
 BEGIN
 level:=LIMATCHES_newlevel;
 subst:=1;
  LISTREE_mergesetsoftuplestrees(subrule0X1,result);
  LISTREE_mergesetsoftuplestrees(subrule0X2,result);
  LISTREE_mergesetsoftuplestrees(subrule0X3,result);
  LISTREE_mergesetsoftuplestrees(subrule0X4,result);
  LISTREE_mergesetsoftuplestrees(subrule0X5,result);
  LISTREE_mergesetsoftuplestrees(subrule0X6,result);
  LISTREE_mergesetsoftuplestrees(subrule0X7,result);
 END;
DECRCNMODINFREL:=result
END;
{:RCNMODINFREL}
