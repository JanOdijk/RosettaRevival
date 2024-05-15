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
pragma C_include('decommrules47.pf');
END;
PROGRAM decomMrules47;
WITH globsubst,listree,limatches,lsmatches,
lidomaint,liiddict,lsdomaint,maket,lsstree,
copyt,mem,
aidderiv,hyperdtree,strtokey,lsmruquo,
lsauxdom,ldblex;
TYPE synrelset=SET OF LSDOMAINT_synrel;
VAR hulpstree:LISTREE_pstree;
 VPID:LSDOMAINT_synpatternsettype;
hulplsstree:LSSTREE_pstree;
 PROCEDURE decommrules47_init;
BEGIN
END;
{rule:}
{:TNPADJQPCOMPLEXTRAPOS1}
 FUNCTION DECTNPADJQPCOMPLEXTRAPOS1(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
LinitM_2_2_1,LrestM_2_2_1,LfirstM_2_2_1,LlastM_2_2_1:LSSTREE_prelnode;
iM_2_2_1:INTEGER;
nomoretreesM_2_2_1,lastmatchM_2_2_1:BOOLEAN;
LinitM_2_2_2,LrestM_2_2_2,LfirstM_2_2_2,LlastM_2_2_2:LSSTREE_prelnode;
iM_2_2_2:INTEGER;
nomoretreesM_2_2_2,lastmatchM_2_2_2:BOOLEAN;
LinitM_2_2_2_1,LrestM_2_2_2_1,LfirstM_2_2_2_1,LlastM_2_2_2_1:LSSTREE_prelnode;
iM_2_2_2_1:INTEGER;
nomoretreesM_2_2_2_1,lastmatchM_2_2_2_1:BOOLEAN;
LinitM_2_2_3,LrestM_2_2_3,LfirstM_2_2_3,LlastM_2_2_3:LSSTREE_prelnode;
iM_2_2_3:INTEGER;
nomoretreesM_2_2_3,lastmatchM_2_2_3:BOOLEAN;
LinitM_2_3,LrestM_2_3,LfirstM_2_3,LlastM_2_3:LSSTREE_prelnode;
iM_2_3:INTEGER;
nomoretreesM_2_3,lastmatchM_2_3:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
N1:LSDOMAINT_lsrecord;
T1:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
ADJPREC1:LSDOMAINT_ADJPrecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
FUNCTION matchcondI2:BOOLEAN;
FUNCTION casefile1:BOOLEAN;
BEGIN IF
N1.cat IN [
QP,ADVP] THEN CASE N1.cat OF
QP:casefile1:=(N1.QPfield^.THANAS IN [DANCOMPL,
VANCOMPL,
ALSCOMPL]                                             );
ADVP:casefile1:=(N1.ADVPfield^.THANAS IN [DANCOMPL,
VANCOMPL,
ALSCOMPL]                                             );
END
END;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
          (N1.cat
 IN [QP,
ADVP]                                                 ) AND 
((casefile1                                             )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
          ((T1^.CAT IN [PREPP,
THANP]                                                )
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
        N^.ls^.cat := CN;
        N^.ls^.CNfield^ := CNREC1;
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
      PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMODREL(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := ADJP;
            N^.ls^.ADJPfield^ := ADJPREC1;
          END{CreateNode};
                                                                PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          VAR list:LSMRUQUO_ListOfStrees;
          PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createMU4(VAR list:LSMRUQUO_ListOfStrees);
            BEGIN{MU4}
            copylist(MU4,list);
            END{MU4};
                                                                BEGIN{createitem21}
          createMU4(list);
          END;
          PROCEDURE createitem22(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createDEGREEMODREL(VAR list:LSMRUQUO_ListOfStrees);
            VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
             list1:LSMRUQUO_ListOfStrees;
              PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
              BEGIN{CreateNode}
                N^.ls^:=N1;
              END;{CreateNode}
                                                                    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
              VAR list:LSMRUQUO_ListOfStrees;
              PROCEDURE createitem31(VAR list:LSMRUQUO_ListOfStrees);
                PROCEDURE createMU3(VAR list:LSMRUQUO_ListOfStrees);
                BEGIN{MU3}
                copylist(MU3,list);
                END{MU3};
                                                                    BEGIN{createitem31}
              createMU3(list);
              END;
              BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem31);
              END{createlist1};
                                                                  BEGIN{DEGREEMODREL}
            LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
            list.first:=relnode;
            list.last:=relnode;
            relnode^.relation:=DEGREEMODREL;
            s:=MAKET_stree(N1.cat);
            createnode(s);
            createlist1(list1);
            IF (list1.first<>NIL) THEN list1.last^.brother:=NIL;
            s^.li^.n:=numberofelements(list1);
            s^.sons:=list1.first;
            relnode^.node:=s;
            END{DEGREEMODREL};
                                                                BEGIN{createitem22}
          createDEGREEMODREL(list);
          END;
          PROCEDURE createitem23(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createMU5(VAR list:LSMRUQUO_ListOfStrees);
            BEGIN{MU5}
            copylist(MU5,list);
            END{MU5};
                                                                BEGIN{createitem23}
          createMU5(list);
          END;
          PROCEDURE createitem24(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createEXTRAPOSREL(VAR list:LSMRUQUO_ListOfStrees);
            VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
             list1:LSMRUQUO_ListOfStrees;
              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
              BEGIN
              wholelist.first:=NIL;wholelist.last:=NIL;
              END;
                                                                  BEGIN{EXTRAPOSREL}
LSMATCHES_createitemVar(list,EXTRAPOSREL,T1);
            END{EXTRAPOSREL};
                                                                BEGIN{createitem24}
          createEXTRAPOSREL(list);
          END;
          BEGIN{createlist1}
LSMATCHES_createlist4items0101(wholelist,createitem21,createitem22,createitem23,createitem24);
          END{createlist1};
                                                              BEGIN{MODREL}
LSMATCHES_createitem(list,MODREL,ADJP,createnode,createlist1);
        END{MODREL};
                                                            BEGIN{createitem12}
      createMODREL(list);
      END;
      PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU6(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU6}
        copylist(MU6,list);
        END{MU6};
                                                            BEGIN{createitem13}
      createMU6(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
      END{createlist1};
                                                          BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,CN,createnode,createlist1);
    END{HEAD};
                                                        BEGIN{createitem12}
  createHEAD(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist2items01(wholelist,createitem11,createitem12);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(NP);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
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
                                                        PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR
    itemmatch,listmatch:Boolean;
    PROCEDURE Match_MU1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU1.first:=Lfirst;
        MU1.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                          PROCEDURE MatchList2Items
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
        IF s^.ls^.cat<>CN THEN
          match:=FALSE;
        IF match THEN
          CNREC1:=s^.ls^.CNfield^;
      END{MatchNode};
                                                      PROCEDURE MatchList3Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
        PROCEDURE Match_MODREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR matchcond:BOOLEAN;
          Stree:LSSTREE_pStree;
          lisons:LISTREE_pRelnode;
          lirel1:LIDOMAINT_synrel;
          lsrel1:LSDOMAINT_synrel;
          PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
          BEGIN{MatchNode}
            IF s^.ls^.cat<>ADJP THEN
              match:=FALSE;
            IF match THEN
              ADJPREC1:=s^.ls^.ADJPfield^;
          END{MatchNode};
                                                      PROCEDURE MatchList3Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
            PROCEDURE Match_DEGREEMODREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            VAR matchcond:BOOLEAN;
              Stree:LSSTREE_pStree;
              lisons:LISTREE_pRelnode;
              PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
              BEGIN{MatchNode}
                N1:= s^.ls^;match:=TRUE;
                              IF match THEN
                  match:= matchcondI2;
              END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
                PROCEDURE Match_MU3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
                BEGIN{match}
                  IF first THEN BEGIN
                    MU3.first:=Lfirst;
                    MU3.last:=Llast;
                    match:=TRUE;
                  END
                  ELSE match:=FALSE
                END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU3(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU3(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM_2_2_2_1:=L;WHILE LlastM_2_2_2_1^.brother<>NIL DO
LlastM_2_2_2_1:=LlastM_2_2_2_1^.brother;
match_MU3(L,LlastM_2_2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
                LSMATCHES_matchtree0rels(Lfirst,Llast,first,DEGREEMODREL
,match,matchnode,matchlist1items,lastmatchM_2_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_DEGREEMODREL(Lfirst,Llast,TRUE,match);
END;
            PROCEDURE Match_MU5(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            BEGIN{match}
              IF first THEN BEGIN
                MU5.first:=Lfirst;
                MU5.last:=Llast;
                match:=TRUE;
              END
              ELSE match:=FALSE
            END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU5(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM_2_2_1,LlastM_2_2_1
,item2,LfirstM_2_2_2,LlastM_2_2_2
,item3,LfirstM_2_2_3,LlastM_2_2_3
) ELSE BEGIN match_DEGREEMODREL(LfirstM_2_2_2,LfirstM_2_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM_2_2_1,LlastM_2_2_1
,item2,LfirstM_2_2_2,LlastM_2_2_2
,item3,LfirstM_2_2_3,LlastM_2_2_3
) END END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,MODREL
,DEGREEMODREL,match,matchnode,matchlist3items,lastmatchM_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MODREL(Lfirst,Llast,TRUE,match);
END;
        PROCEDURE Match_MU6(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU6.first:=Lfirst;
            MU6.last:=Llast;
            match:=TRUE;
          END
          ELSE match:=FALSE
        END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU6(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM_2_1,LlastM_2_1
,item2,LfirstM_2_2,LlastM_2_2
,item3,LfirstM_2_3,LlastM_2_3
) ELSE BEGIN match_MODREL(LfirstM_2_2,LfirstM_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM_2_1,LlastM_2_1
,item2,LfirstM_2_2,LlastM_2_2
,item3,LfirstM_2_3,LlastM_2_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,MODREL,match,matchnode,matchlist3items,lastmatchM_2) END;
                                                            PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
    PROCEDURE Match_EXTRAPOSREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeConVar(Lfirst,Llast,first,EXTRAPOSREL,T1,match,matchcondI1,lastmatchM_3);
END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_EXTRAPOSREL,matchlist0items,
LlastM_3,LfirstM_3,LrestM_3,nomoretreesM_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist2items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,HEAD,EXTRAPOSREL,match,matchnode,matchlist3items,lastmatch) END;
                                                      PROCEDURE ACTION1;
BEGIN
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
  action1;
  createM1;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
                                                        END;
                                                      DECTNPADJQPCOMPLEXTRAPOS1:=result
END;
{:TNPADJQPCOMPLEXTRAPOS1}
{rule:}
{:FPOSTNPADJQPCOMPLEXTRAPOS1}
 FUNCTION DECFPOSTNPADJQPCOMPLEXTRAPOS1(Is:LISTREE_pStree):LISTREE_pstree;BEGIN
DECFPOSTNPADJQPCOMPLEXTRAPOS1:=Is;
END;
{:FPOSTNPADJQPCOMPLEXTRAPOS1}
{rule:}
{:FPRENPADJQPCOMPLEXTRAPOS1}
 FUNCTION DECFPRENPADJQPCOMPLEXTRAPOS1(Is:LISTREE_pStree):LISTREE_pstree;VAR result:LISTREE_pStree;
 m:LSSTREE_pstree;
 match:BOOLEAN;
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
LinitM_2_2_1,LrestM_2_2_1,LfirstM_2_2_1,LlastM_2_2_1:LSSTREE_prelnode;
iM_2_2_1:INTEGER;
nomoretreesM_2_2_1,lastmatchM_2_2_1:BOOLEAN;
LinitM_2_2_2,LrestM_2_2_2,LfirstM_2_2_2,LlastM_2_2_2:LSSTREE_prelnode;
iM_2_2_2:INTEGER;
nomoretreesM_2_2_2,lastmatchM_2_2_2:BOOLEAN;
LinitM_2_2_2_1,LrestM_2_2_2_1,LfirstM_2_2_2_1,LlastM_2_2_2_1:LSSTREE_prelnode;
iM_2_2_2_1:INTEGER;
nomoretreesM_2_2_2_1,lastmatchM_2_2_2_1:BOOLEAN;
LinitM_2_2_3,LrestM_2_2_3,LfirstM_2_2_3,LlastM_2_2_3:LSSTREE_prelnode;
iM_2_2_3:INTEGER;
nomoretreesM_2_2_3,lastmatchM_2_2_3:BOOLEAN;
LinitM_2_3,LrestM_2_3,LfirstM_2_3,LlastM_2_3:LSSTREE_prelnode;
iM_2_3:INTEGER;
nomoretreesM_2_3,lastmatchM_2_3:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
N1:LSDOMAINT_lsrecord;
T1:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
ADJPREC1:LSDOMAINT_ADJPrecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
FUNCTION matchcondI2:BOOLEAN;
FUNCTION casefile1:BOOLEAN;
BEGIN IF
N1.cat IN [
QP,ADVP] THEN CASE N1.cat OF
QP:casefile1:=(N1.QPfield^.THANAS IN [DANCOMPL,
VANCOMPL,
ALSCOMPL]                                             );
ADVP:casefile1:=(N1.ADVPfield^.THANAS IN [DANCOMPL,
VANCOMPL,
ALSCOMPL]                                             );
END
END;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
          (N1.cat
 IN [QP,
ADVP]                                                 ) AND 
((casefile1                                             )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
          ((T1^.CAT IN [PREPP,
THANP]                                                )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

END;{matchcondI1}
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
                                                        PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR
    itemmatch,listmatch:Boolean;
    PROCEDURE Match_MU1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU1.first:=Lfirst;
        MU1.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                          PROCEDURE MatchList2Items
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
        IF s^.ls^.cat<>CN THEN
          match:=FALSE;
        IF match THEN
          CNREC1:=s^.ls^.CNfield^;
      END{MatchNode};
                                                      PROCEDURE MatchList3Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
        PROCEDURE Match_MODREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR matchcond:BOOLEAN;
          Stree:LSSTREE_pStree;
          lisons:LISTREE_pRelnode;
          lirel1:LIDOMAINT_synrel;
          lsrel1:LSDOMAINT_synrel;
          PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
          BEGIN{MatchNode}
            IF s^.ls^.cat<>ADJP THEN
              match:=FALSE;
            IF match THEN
              ADJPREC1:=s^.ls^.ADJPfield^;
          END{MatchNode};
                                                      PROCEDURE MatchList3Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
            PROCEDURE Match_DEGREEMODREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            VAR matchcond:BOOLEAN;
              Stree:LSSTREE_pStree;
              lisons:LISTREE_pRelnode;
              PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
              BEGIN{MatchNode}
                N1:= s^.ls^;match:=TRUE;
                              IF match THEN
                  match:= matchcondI2;
              END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
                PROCEDURE Match_MU3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
                BEGIN{match}
                  IF first THEN BEGIN
                    MU3.first:=Lfirst;
                    MU3.last:=Llast;
                    match:=TRUE;
                  END
                  ELSE match:=FALSE
                END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU3(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU3(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM_2_2_2_1:=L;WHILE LlastM_2_2_2_1^.brother<>NIL DO
LlastM_2_2_2_1:=LlastM_2_2_2_1^.brother;
match_MU3(L,LlastM_2_2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
                LSMATCHES_matchtree0rels(Lfirst,Llast,first,DEGREEMODREL
,match,matchnode,matchlist1items,lastmatchM_2_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_DEGREEMODREL(Lfirst,Llast,TRUE,match);
END;
            PROCEDURE Match_MU5(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            BEGIN{match}
              IF first THEN BEGIN
                MU5.first:=Lfirst;
                MU5.last:=Llast;
                match:=TRUE;
              END
              ELSE match:=FALSE
            END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU5(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM_2_2_1,LlastM_2_2_1
,item2,LfirstM_2_2_2,LlastM_2_2_2
,item3,LfirstM_2_2_3,LlastM_2_2_3
) ELSE BEGIN match_DEGREEMODREL(LfirstM_2_2_2,LfirstM_2_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM_2_2_1,LlastM_2_2_1
,item2,LfirstM_2_2_2,LlastM_2_2_2
,item3,LfirstM_2_2_3,LlastM_2_2_3
) END END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,MODREL
,DEGREEMODREL,match,matchnode,matchlist3items,lastmatchM_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MODREL(Lfirst,Llast,TRUE,match);
END;
        PROCEDURE Match_MU6(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU6.first:=Lfirst;
            MU6.last:=Llast;
            match:=TRUE;
          END
          ELSE match:=FALSE
        END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU6(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM_2_1,LlastM_2_1
,item2,LfirstM_2_2,LlastM_2_2
,item3,LfirstM_2_3,LlastM_2_3
) ELSE BEGIN match_MODREL(LfirstM_2_2,LfirstM_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM_2_1,LlastM_2_1
,item2,LfirstM_2_2,LlastM_2_2
,item3,LfirstM_2_3,LlastM_2_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,MODREL,match,matchnode,matchlist3items,lastmatchM_2) END;
                                                            PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
    PROCEDURE Match_EXTRAPOSREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeConVar(Lfirst,Llast,first,EXTRAPOSREL,T1,match,matchcondI1,lastmatchM_3);
END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_EXTRAPOSREL,matchlist0items,
LlastM_3,LfirstM_3,LrestM_3,nomoretreesM_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist2items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,HEAD,EXTRAPOSREL,match,matchnode,matchlist3items,lastmatch) END;
                                                      BEGIN
result:=Is;
m:=loopholes.retype(Is,LSSTREE_pstree);
match:= TRUE;
MatchModel(m,TRUE,match);
 IF match THEN BEGIN
  IF ((TRUE                                                  )
                                                      )
                                                       THEN
    BEGIN
    result:=NIL;
    END;
                                                       END;
DECFPRENPADJQPCOMPLEXTRAPOS1:=result
END;
{:FPRENPADJQPCOMPLEXTRAPOS1}
{rule:}
{:TNPNOTOOMEGA1}
 FUNCTION DECTNPNOTOOMEGA1(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
LinitM_2_2_1,LrestM_2_2_1,LfirstM_2_2_1,LlastM_2_2_1:LSSTREE_prelnode;
iM_2_2_1:INTEGER;
nomoretreesM_2_2_1,lastmatchM_2_2_1:BOOLEAN;
LinitM_2_2_2,LrestM_2_2_2,LfirstM_2_2_2,LlastM_2_2_2:LSSTREE_prelnode;
iM_2_2_2:INTEGER;
nomoretreesM_2_2_2,lastmatchM_2_2_2:BOOLEAN;
LinitM_2_2_2_1,LrestM_2_2_2_1,LfirstM_2_2_2_1,LlastM_2_2_2_1:LSSTREE_prelnode;
iM_2_2_2_1:INTEGER;
nomoretreesM_2_2_2_1,lastmatchM_2_2_2_1:BOOLEAN;
LinitM_2_2_3,LrestM_2_2_3,LfirstM_2_2_3,LlastM_2_2_3:LSSTREE_prelnode;
iM_2_2_3:INTEGER;
nomoretreesM_2_2_3,lastmatchM_2_2_3:BOOLEAN;
LinitM_2_3,LrestM_2_3,LfirstM_2_3,LlastM_2_3:LSSTREE_prelnode;
iM_2_3:INTEGER;
nomoretreesM_2_3,lastmatchM_2_3:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
MU7:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
ADJREC1:LSDOMAINT_ADJrecord;
ADJPREC1:LSDOMAINT_ADJPrecord;
ADJREC2:LSDOMAINT_ADJrecord;
ADJPREC2:LSDOMAINT_ADJPrecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
          ((ADJPREC2.EORENFORM =OMEGAFORM                         )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
          ((ADJPREC1.EORENFORM =NOFORM                            )
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
        N^.ls^.cat := CN;
        N^.ls^.CNfield^ := CNREC1;
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
      PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMODREL(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := ADJP;
            N^.ls^.ADJPfield^ := ADJPREC1;
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
                N^.ls^.cat := ADJ;
                N^.ls^.ADJfield^ := ADJREC1;
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
LSMATCHES_createitem(list,HEAD,ADJ,createnode,createlist1);
            END{HEAD};
                                                                BEGIN{createitem22}
          createHEAD(list);
          END;
          PROCEDURE createitem23(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createMU7(VAR list:LSMRUQUO_ListOfStrees);
            BEGIN{MU7}
            copylist(MU7,list);
            END{MU7};
                                                                BEGIN{createitem23}
          createMU7(list);
          END;
          BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem21,createitem22,createitem23);
          END{createlist1};
                                                              BEGIN{MODREL}
LSMATCHES_createitem(list,MODREL,ADJP,createnode,createlist1);
        END{MODREL};
                                                            BEGIN{createitem12}
      createMODREL(list);
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
                                                          BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,CN,createnode,createlist1);
    END{HEAD};
                                                        BEGIN{createitem12}
  createHEAD(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU4(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU4}
    copylist(MU4,list);
    END{MU4};
                                                        BEGIN{createitem13}
  createMU4(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(NP);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
        PROCEDURE Match_MODREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR matchcond:BOOLEAN;
          Stree:LSSTREE_pStree;
          lisons:LISTREE_pRelnode;
          lirel1:LIDOMAINT_synrel;
          lsrel1:LSDOMAINT_synrel;
          PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
          BEGIN{MatchNode}
            IF s^.ls^.cat<>ADJP THEN
              match:=FALSE;
            IF match THEN
              ADJPREC2:=s^.ls^.ADJPfield^;
          END{MatchNode};
                                                      PROCEDURE MatchList3Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
                IF s^.ls^.cat<>ADJ THEN
                  match:=FALSE;
                IF match THEN
                  ADJREC2:=s^.ls^.ADJfield^;
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
LlastM_2_2_2_1:=L;WHILE LlastM_2_2_2_1^.brother<>NIL DO
LlastM_2_2_2_1:=LlastM_2_2_2_1^.brother;
match_MU6(L,LlastM_2_2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
                LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_2_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
            PROCEDURE Match_MU7(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            BEGIN{match}
              IF first THEN BEGIN
                MU7.first:=Lfirst;
                MU7.last:=Llast;
                match:=TRUE;
              END
              ELSE match:=FALSE
            END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU7(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM_2_2_1,LlastM_2_2_1
,HEAD,item2,LfirstM_2_2_2,LlastM_2_2_2
,item3,LfirstM_2_2_3,LlastM_2_2_3
) ELSE match_HEAD(LfirstM_2_2_2,LfirstM_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtreeCon1rels(Lfirst,Llast,first,MODREL
,HEAD,match,matchnode,matchlist3items,lastmatchM_2_2,matchcondI2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MODREL(Lfirst,Llast,TRUE,match);
END;
        PROCEDURE Match_MU3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU3.first:=Lfirst;
            MU3.last:=Llast;
            match:=TRUE;
          END
          ELSE match:=FALSE
        END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU3(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM_2_1,LlastM_2_1
,item2,LfirstM_2_2,LlastM_2_2
,item3,LfirstM_2_3,LlastM_2_3
) ELSE BEGIN match_MODREL(LfirstM_2_2,LfirstM_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM_2_1,LlastM_2_1
,item2,LfirstM_2_2,LlastM_2_2
,item3,LfirstM_2_3,LlastM_2_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,MODREL,match,matchnode,matchlist3items,lastmatchM_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_MU4(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU4.first:=Lfirst;
        MU4.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU4(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM_1,LlastM_1
,HEAD,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
) ELSE match_HEAD(LfirstM_2,LfirstM_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
                                                      PROCEDURE ACTION15;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;
ADJPREC1.EORENFORM:=NOFORM
                                                      ;
ADJREC1:=ADJREC2;                                     ;
ADJREC1.EORENFORM:=NOFORM
                                                      ;
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
IF ((ADJREC2.EORENFORM =OMEGAFORM                          )
                                                      )
                                                       THEN
  BEGIN
  MAKET_ADJPrec(ADJPREC1);
  MAKET_ADJrec(ADJREC1);
  action15;
  createM1;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
                                                        END;
                                                      DECTNPNOTOOMEGA1:=result
END;
{:TNPNOTOOMEGA1}
{rule:}
{:TNPNOTOOMEGA2}
 FUNCTION DECTNPNOTOOMEGA2(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
LinitM_2_2_1,LrestM_2_2_1,LfirstM_2_2_1,LlastM_2_2_1:LSSTREE_prelnode;
iM_2_2_1:INTEGER;
nomoretreesM_2_2_1,lastmatchM_2_2_1:BOOLEAN;
LinitM_2_2_2,LrestM_2_2_2,LfirstM_2_2_2,LlastM_2_2_2:LSSTREE_prelnode;
iM_2_2_2:INTEGER;
nomoretreesM_2_2_2,lastmatchM_2_2_2:BOOLEAN;
LinitM_2_2_2_1,LrestM_2_2_2_1,LfirstM_2_2_2_1,LlastM_2_2_2_1:LSSTREE_prelnode;
iM_2_2_2_1:INTEGER;
nomoretreesM_2_2_2_1,lastmatchM_2_2_2_1:BOOLEAN;
LinitM_2_2_2_2,LrestM_2_2_2_2,LfirstM_2_2_2_2,LlastM_2_2_2_2:LSSTREE_prelnode;
iM_2_2_2_2:INTEGER;
nomoretreesM_2_2_2_2,lastmatchM_2_2_2_2:BOOLEAN;
LinitM_2_2_2_2_1,LrestM_2_2_2_2_1,LfirstM_2_2_2_2_1,LlastM_2_2_2_2_1:LSSTREE_prelnode;
iM_2_2_2_2_1:INTEGER;
nomoretreesM_2_2_2_2_1,lastmatchM_2_2_2_2_1:BOOLEAN;
LinitM_2_2_3,LrestM_2_2_3,LfirstM_2_2_3,LlastM_2_2_3:LSSTREE_prelnode;
iM_2_2_3:INTEGER;
nomoretreesM_2_2_3,lastmatchM_2_2_3:BOOLEAN;
LinitM_2_3,LrestM_2_3,LfirstM_2_3,LlastM_2_3:LSSTREE_prelnode;
iM_2_3:INTEGER;
nomoretreesM_2_3,lastmatchM_2_3:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
REL1:LSDOMAINT_synrel;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
MU7:LSMRUQUO_ListOfStrees;
MU8:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
VERBREC1:LSDOMAINT_VERBrecord;
VERBREC2:LSDOMAINT_VERBrecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
SENTENCEREC1:LSDOMAINT_SENTENCErecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
FUNCTION matchcondI3:BOOLEAN;
                                                      BEGIN
matchcondI3:=FALSE;
  IF
          ((VERBREC2.EORENFORM =OMEGAFORM                         )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
          ((VERBREC1.EORENFORM =NOFORM                            )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
          ((SENTENCEREC1.MOOD =ANTERELATIVE                       )
                                                      )
THEN IF
          ((SENTENCEREC1.MODUS IN [PRESPART,
PASTPART]                                             )
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
        N^.ls^.cat := CN;
        N^.ls^.CNfield^ := CNREC1;
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
      PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMODREL(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := SENTENCE;
            N^.ls^.SENTENCEfield^ := SENTENCEREC1;
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
              PROCEDURE createitem31(VAR list:LSMRUQUO_ListOfStrees);
                PROCEDURE createMU7(VAR list:LSMRUQUO_ListOfStrees);
                BEGIN{MU7}
                copylist(MU7,list);
                END{MU7};
                                                                    BEGIN{createitem31}
              createMU7(list);
              END;
              PROCEDURE createitem32(VAR list:LSMRUQUO_ListOfStrees);
                PROCEDURE createREL1(VAR list:LSMRUQUO_ListOfStrees);
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
                    PROCEDURE createMU8(VAR list:LSMRUQUO_ListOfStrees);
                    BEGIN{MU8}
                    copylist(MU8,list);
                    END{MU8};
                                                                        BEGIN{createitem31}
                  createMU8(list);
                  END;
                  BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem31);
                  END{createlist1};
                                                                      BEGIN{REL1}
LSMATCHES_createitem(list,REL1,VERB,createnode,createlist1);
                END{REL1};
                                                                    BEGIN{createitem32}
              createREL1(list);
              END;
              BEGIN{createlist1}
LSMATCHES_createlist2items01(wholelist,createitem31,createitem32);
              END{createlist1};
                                                                  BEGIN{PREDREL}
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
            END{PREDREL};
                                                                BEGIN{createitem22}
          createPREDREL(list);
          END;
          PROCEDURE createitem23(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createMU6(VAR list:LSMRUQUO_ListOfStrees);
            BEGIN{MU6}
            copylist(MU6,list);
            END{MU6};
                                                                BEGIN{createitem23}
          createMU6(list);
          END;
          BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem21,createitem22,createitem23);
          END{createlist1};
                                                              BEGIN{MODREL}
LSMATCHES_createitem(list,MODREL,SENTENCE,createnode,createlist1);
        END{MODREL};
                                                            BEGIN{createitem12}
      createMODREL(list);
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
                                                          BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,CN,createnode,createlist1);
    END{HEAD};
                                                        BEGIN{createitem12}
  createHEAD(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU4(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU4}
    copylist(MU4,list);
    END{MU4};
                                                        BEGIN{createitem13}
  createMU4(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(NP);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
        PROCEDURE Match_MODREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
              SENTENCEREC1:=s^.ls^.SENTENCEfield^;
          END{MatchNode};
                                                      PROCEDURE MatchList3Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
            PROCEDURE Match_PREDREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            VAR matchcond:BOOLEAN;
              Stree:LSSTREE_pStree;
              lisons:LISTREE_pRelnode;
              PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
              BEGIN{MatchNode}
                IF s^.ls^.cat<>VERBP THEN
                  match:=FALSE;
                IF match THEN
                  VERBPREC1:=s^.ls^.VERBPfield^;
              END{MatchNode};
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
                PROCEDURE Match_MU7(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
                BEGIN{match}
                  IF first THEN BEGIN
                    MU7.first:=Lfirst;
                    MU7.last:=Llast;
                    match:=TRUE;
                  END
                  ELSE match:=FALSE
                END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU7(Lfirst,Llast,TRUE,match);
END;
                PROCEDURE Match_REL1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
                VAR matchcond:BOOLEAN;
                  Stree:LSSTREE_pStree;
                  lisons:LISTREE_pRelnode;
                  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
                  BEGIN{MatchNode}
                    IF s^.ls^.cat<>VERB THEN
                      match:=FALSE;
                    IF match THEN
                      VERBREC2:=s^.ls^.VERBfield^;
                    IF match THEN
                      match:= matchcondI3;
                  END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
                    PROCEDURE Match_MU8(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
                    BEGIN{match}
                      IF first THEN BEGIN
                        MU8.first:=Lfirst;
                        MU8.last:=Llast;
                        match:=TRUE;
                      END
                      ELSE match:=FALSE
                    END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU8(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU8(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM_2_2_2_2_1:=L;WHILE LlastM_2_2_2_2_1^.brother<>NIL DO
LlastM_2_2_2_2_1:=LlastM_2_2_2_2_1^.brother;
match_MU8(L,LlastM_2_2_2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
                                    IF first THEN REL1:= Lfirst^.relation;match:=TRUE;
LSMATCHES_matchtreeVar0rels(Lfirst^.node,first
,match,matchnode,matchlist1items,lastmatchM_2_2_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_REL1(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM_2_2_2_1,LlastM_2_2_2_1
,item2,LfirstM_2_2_2_2,LlastM_2_2_2_2
) ELSE match_REL1(LfirstM_2_2_2_2,LfirstM_2_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist2items,lastmatchM_2_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_PREDREL(Lfirst,Llast,TRUE,match);
END;
            PROCEDURE Match_MU6(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            BEGIN{match}
              IF first THEN BEGIN
                MU6.first:=Lfirst;
                MU6.last:=Llast;
                match:=TRUE;
              END
              ELSE match:=FALSE
            END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU6(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM_2_2_1,LlastM_2_2_1
,PREDREL,item2,LfirstM_2_2_2,LlastM_2_2_2
,item3,LfirstM_2_2_3,LlastM_2_2_3
) ELSE match_PREDREL(LfirstM_2_2_2,LfirstM_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtreeCon1rels(Lfirst,Llast,first,MODREL
,PREDREL,match,matchnode,matchlist3items,lastmatchM_2_2,matchcondI1) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MODREL(Lfirst,Llast,TRUE,match);
END;
        PROCEDURE Match_MU3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU3.first:=Lfirst;
            MU3.last:=Llast;
            match:=TRUE;
          END
          ELSE match:=FALSE
        END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU3(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM_2_1,LlastM_2_1
,item2,LfirstM_2_2,LlastM_2_2
,item3,LfirstM_2_3,LlastM_2_3
) ELSE BEGIN match_MODREL(LfirstM_2_2,LfirstM_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM_2_1,LlastM_2_1
,item2,LfirstM_2_2,LlastM_2_2
,item3,LfirstM_2_3,LlastM_2_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,MODREL,match,matchnode,matchlist3items,lastmatchM_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_MU4(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU4.first:=Lfirst;
        MU4.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU4(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM_1,LlastM_1
,HEAD,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
) ELSE match_HEAD(LfirstM_2,LfirstM_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
                                                      PROCEDURE ACTION7;
BEGIN
VERBREC1:=VERBREC2;                                   ;
VERBREC1.EORENFORM:=NOFORM
                                                      ;
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
  MAKET_VERBrec(VERBREC1);
  action7;
  createM1;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
                                                        END;
                                                      DECTNPNOTOOMEGA2:=result
END;
{:TNPNOTOOMEGA2}
{rule:}
{:FPOSTNPNOTOOMEGA1}
 FUNCTION DECFPOSTNPNOTOOMEGA1(Is:LISTREE_pStree):LISTREE_pstree;BEGIN
DECFPOSTNPNOTOOMEGA1:=Is;
END;
{:FPOSTNPNOTOOMEGA1}
{rule:}
{:FPOSTNPNOTOOMEGA2}
 FUNCTION DECFPOSTNPNOTOOMEGA2(Is:LISTREE_pStree):LISTREE_pstree;BEGIN
DECFPOSTNPNOTOOMEGA2:=Is;
END;
{:FPOSTNPNOTOOMEGA2}
{rule:}
{:TNPQPCOMPLEXTRAPOS}
 FUNCTION DECTNPQPCOMPLEXTRAPOS(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
LinitM_2_1_1,LrestM_2_1_1,LfirstM_2_1_1,LlastM_2_1_1:LSSTREE_prelnode;
iM_2_1_1:INTEGER;
nomoretreesM_2_1_1,lastmatchM_2_1_1:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
LinitM_4,LrestM_4,LfirstM_4,LlastM_4:LSSTREE_prelnode;
iM_4:INTEGER;
nomoretreesM_4,lastmatchM_4:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
REL1:LSDOMAINT_synrel;
T1:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
QPREC1:LSDOMAINT_QPrecord;
DETPREC1:LSDOMAINT_DETPrecord;
NPREC1:LSDOMAINT_NPrecord;
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
          ((T1^.CAT IN [PREPP,
THANP]                                                )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
          ((REL1 IN [VANCOMPLREL,
THANASCOMPLREL]                                       )
                                                      )
THEN IF
          ((T1^.CAT IN [PREPP,
THANP]                                                )
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
    PROCEDURE createMU1(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU1}
    copylist(MU1,list);
    END{MU1};
                                                        BEGIN{createitem11}
  createMU1(list);
  END;
  PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createDETREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := DETP;
        N^.ls^.DETPfield^ := DETPREC1;
      END{CreateNode};
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      VAR list:LSMRUQUO_ListOfStrees;
      PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := QP;
            N^.ls^.QPfield^ := QPREC1;
          END{CreateNode};
                                                                PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          VAR list:LSMRUQUO_ListOfStrees;
          PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
            BEGIN{MU2}
            copylist(MU2,list);
            END{MU2};
                                                                BEGIN{createitem21}
          createMU2(list);
          END;
          PROCEDURE createitem22(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createREL1(VAR list:LSMRUQUO_ListOfStrees);
            VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
             list1:LSMRUQUO_ListOfStrees;
              PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
              BEGIN
              wholelist.first:=NIL;wholelist.last:=NIL;
              END;
                                                                  BEGIN{REL1}
LSMATCHES_createitemVar(list,REL1,T1);
            END{REL1};
                                                                BEGIN{createitem22}
          createREL1(list);
          END;
          BEGIN{createlist1}
LSMATCHES_createlist2items01(wholelist,createitem21,createitem22);
          END{createlist1};
                                                              BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,QP,createnode,createlist1);
        END{HEAD};
                                                            BEGIN{createitem11}
      createHEAD(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
      END{createlist1};
                                                          BEGIN{DETREL}
LSMATCHES_createitem(list,DETREL,DETP,createnode,createlist1);
    END{DETREL};
                                                        BEGIN{createitem12}
  createDETREL(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU4(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU4}
    copylist(MU4,list);
    END{MU4};
                                                        BEGIN{createitem13}
  createMU4(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(NP);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
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
    PROCEDURE Match_MU1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU1.first:=Lfirst;
        MU1.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                          PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
    PROCEDURE Match_DETREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>DETP THEN
          match:=FALSE;
        IF match THEN
          DETPREC1:=s^.ls^.DETPfield^;
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
            IF s^.ls^.cat<>QP THEN
              match:=FALSE;
            IF match THEN
              QPREC1:=s^.ls^.QPfield^;
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
LlastM_2_1_1:=L;WHILE LlastM_2_1_1^.brother<>NIL DO
LlastM_2_1_1:=LlastM_2_1_1^.brother;
match_MU2(L,LlastM_2_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
            LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_2_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM_2_1,LfirstM_2_1,LrestM_2_1,nomoretreesM_2_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,DETREL
,HEAD,match,matchnode,matchlist1items,lastmatchM_2) END;
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
    PROCEDURE Match_EXTRAPOSREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeConVar(Lfirst,Llast,first,EXTRAPOSREL,T1,match,matchcondI2,lastmatchM_4);
END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_EXTRAPOSREL,matchlist0items,
LlastM_4,LfirstM_4,LrestM_4,nomoretreesM_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU4,matchlist1items,
LlastM_3,LfirstM_3,LrestM_3,nomoretreesM_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_DETREL,matchlist2items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist3items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,DETREL,EXTRAPOSREL,match,matchnode,matchlist4items,lastmatch) END;
                                                      PROCEDURE ACTION1;
BEGIN
REL1:=THANASCOMPLREL
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION2;
BEGIN
REL1:=VANCOMPLREL
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION3;
BEGIN

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
  IF ((QPREC1.THANAS IN [DANCOMPL,
ALSCOMPL]                                             )
                                                      )
                                                       THEN
    BEGIN
    action1;
    action3;
    createM1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
    END;
  IF ((QPREC1.THANAS =VANCOMPL                               )
                                                      )
                                                       THEN
    BEGIN
    action2;
    action3;
    createM1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
    END;
                                                        END;
                                                        END;
                                                      DECTNPQPCOMPLEXTRAPOS:=result
END;
{:TNPQPCOMPLEXTRAPOS}
{rule:}
{:FPRENPQPCOMPLEXTRAPOS}
 FUNCTION DECFPRENPQPCOMPLEXTRAPOS(Is:LISTREE_pStree):LISTREE_pstree;VAR result:LISTREE_pStree;
 m:LSSTREE_pstree;
 match:BOOLEAN;
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
LinitM_2_1_1,LrestM_2_1_1,LfirstM_2_1_1,LlastM_2_1_1:LSSTREE_prelnode;
iM_2_1_1:INTEGER;
nomoretreesM_2_1_1,lastmatchM_2_1_1:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
LinitM_4,LrestM_4,LfirstM_4,LlastM_4:LSSTREE_prelnode;
iM_4:INTEGER;
nomoretreesM_4,lastmatchM_4:BOOLEAN;
T1:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
QPREC1:LSDOMAINT_QPrecord;
DETPREC1:LSDOMAINT_DETPrecord;
NPREC1:LSDOMAINT_NPrecord;
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
          ((T1^.CAT IN [PREPP,
THANP]                                                )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
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
    PROCEDURE Match_MU1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU1.first:=Lfirst;
        MU1.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                          PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
    PROCEDURE Match_DETREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>DETP THEN
          match:=FALSE;
        IF match THEN
          DETPREC1:=s^.ls^.DETPfield^;
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
            IF s^.ls^.cat<>QP THEN
              match:=FALSE;
            IF match THEN
              QPREC1:=s^.ls^.QPfield^;
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
LlastM_2_1_1:=L;WHILE LlastM_2_1_1^.brother<>NIL DO
LlastM_2_1_1:=LlastM_2_1_1^.brother;
match_MU2(L,LlastM_2_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
            LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_2_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM_2_1,LfirstM_2_1,LrestM_2_1,nomoretreesM_2_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,DETREL
,HEAD,match,matchnode,matchlist1items,lastmatchM_2) END;
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
    PROCEDURE Match_EXTRAPOSREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeConVar(Lfirst,Llast,first,EXTRAPOSREL,T1,match,matchcondI2,lastmatchM_4);
END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_EXTRAPOSREL,matchlist0items,
LlastM_4,LfirstM_4,LrestM_4,nomoretreesM_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU4,matchlist1items,
LlastM_3,LfirstM_3,LrestM_3,nomoretreesM_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_DETREL,matchlist2items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist3items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,DETREL,EXTRAPOSREL,match,matchnode,matchlist4items,lastmatch) END;
                                                      BEGIN
result:=Is;
m:=loopholes.retype(Is,LSSTREE_pstree);
match:= TRUE;
MatchModel(m,TRUE,match);
 IF match THEN BEGIN
  IF ((TRUE                                                  )
                                                      )
                                                       THEN
    BEGIN
    result:=NIL;
    END;
                                                       END;
DECFPRENPQPCOMPLEXTRAPOS:=result
END;
{:FPRENPQPCOMPLEXTRAPOS}
{rule:}
{:FPOSTNPQPCOMPLEXTRAPOS}
 FUNCTION DECFPOSTNPQPCOMPLEXTRAPOS(Is:LISTREE_pStree):LISTREE_pstree;BEGIN
DECFPOSTNPQPCOMPLEXTRAPOS:=Is;
END;
{:FPOSTNPQPCOMPLEXTRAPOS}
{rule:}
{:RNPPRESENTSUPERDEIXIS1}
 FUNCTION DECRNPPRESENTSUPERDEIXIS1(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
MU1:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
CNREC2:LSDOMAINT_CNrecord;
NPREC2:LSDOMAINT_NPrecord;
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((NPREC2.SUPERDEIXIS =PRESENTDEIXIS                     )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM1:BOOLEAN;
                                                      BEGIN
matchcondM1:=FALSE;
  IF
          ((NPREC1.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
                                                      THEN 
matchcondM1:=TRUE;

END;{matchcondM1}
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
        N^.ls^.cat := CN;
        N^.ls^.CNfield^ := CNREC1;
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
                                                          BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,CN,createnode,createlist1);
    END{HEAD};
                                                        BEGIN{createitem12}
  createHEAD(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU2}
    copylist(MU2,list);
    END{MU2};
                                                        BEGIN{createitem13}
  createMU2(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(NP);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>NP THEN
      match:=FALSE;
    IF match THEN
      NPREC2:=s^.ls^.NPfield^;
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
        IF s^.ls^.cat<>CN THEN
          match:=FALSE;
        IF match THEN
          CNREC2:=s^.ls^.CNfield^;
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
LlastM_2_1:=L;WHILE LlastM_2_1^.brother<>NIL DO
LlastM_2_1:=LlastM_2_1^.brother;
match_MU4(L,LlastM_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
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
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU2(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM_1,LlastM_1
,HEAD,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
) ELSE match_HEAD(LfirstM_2,LfirstM_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
                                                      PROCEDURE ACTION15;
BEGIN
NPREC1:=NPREC2;                                       ;
CNREC1:=CNREC2;                                       ;
CNREC1.SUPERDEIXIS:=PRESENTDEIXIS
                                                      ;
NPREC1.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      BEGIN
m:=loopholes.retype(Is,LSSTREE_pstree);
LISTREE_InitSetOfTupleOfStrees(result);
match:=TRUE;
first:=TRUE;
matchmodel(m,first,match);
first:=FALSE;
  If match Then
  WHILE match AND NOT matchcondM DO
  BEGIN
  MatchModel(m,FALSE,match);
  END;
IF match THEN
 BEGIN
 END;
IF match THEN
  BEGIN
IF ((CNREC2.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
                                                       THEN
  BEGIN
  MAKET_NPrec(NPREC1);
  MAKET_CNrec(CNREC1);
  action15;
  createM1;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
                                                        END;
                                                      DECRNPPRESENTSUPERDEIXIS1:=result
END;
{:RNPPRESENTSUPERDEIXIS1}
{rule:}
{:RNPPASTSUPERDEIXIS1}
 FUNCTION DECRNPPASTSUPERDEIXIS1(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
MU1:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
CNREC2:LSDOMAINT_CNrecord;
NPREC2:LSDOMAINT_NPrecord;
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((NPREC2.SUPERDEIXIS =PASTDEIXIS                        )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM1:BOOLEAN;
                                                      BEGIN
matchcondM1:=FALSE;
  IF
          ((NPREC1.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
                                                      THEN 
matchcondM1:=TRUE;

END;{matchcondM1}
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
        N^.ls^.cat := CN;
        N^.ls^.CNfield^ := CNREC1;
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
                                                          BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,CN,createnode,createlist1);
    END{HEAD};
                                                        BEGIN{createitem12}
  createHEAD(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU2}
    copylist(MU2,list);
    END{MU2};
                                                        BEGIN{createitem13}
  createMU2(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(NP);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>NP THEN
      match:=FALSE;
    IF match THEN
      NPREC2:=s^.ls^.NPfield^;
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
        IF s^.ls^.cat<>CN THEN
          match:=FALSE;
        IF match THEN
          CNREC2:=s^.ls^.CNfield^;
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
LlastM_2_1:=L;WHILE LlastM_2_1^.brother<>NIL DO
LlastM_2_1:=LlastM_2_1^.brother;
match_MU4(L,LlastM_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
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
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU2(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM_1,LlastM_1
,HEAD,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
) ELSE match_HEAD(LfirstM_2,LfirstM_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
                                                      PROCEDURE ACTION15;
BEGIN
NPREC1:=NPREC2;                                       ;
CNREC1:=CNREC2;                                       ;
CNREC1.SUPERDEIXIS:=PASTDEIXIS
                                                      ;
NPREC1.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      BEGIN
m:=loopholes.retype(Is,LSSTREE_pstree);
LISTREE_InitSetOfTupleOfStrees(result);
match:=TRUE;
first:=TRUE;
matchmodel(m,first,match);
first:=FALSE;
  If match Then
  WHILE match AND NOT matchcondM DO
  BEGIN
  MatchModel(m,FALSE,match);
  END;
IF match THEN
 BEGIN
 END;
IF match THEN
  BEGIN
IF ((CNREC2.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
                                                       THEN
  BEGIN
  MAKET_NPrec(NPREC1);
  MAKET_CNrec(CNREC1);
  action15;
  createM1;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
                                                        END;
                                                      DECRNPPASTSUPERDEIXIS1:=result
END;
{:RNPPASTSUPERDEIXIS1}
{rule:}
{:RNPPRESENTSUPERDEIXIS2}
 FUNCTION DECRNPPRESENTSUPERDEIXIS2(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
N1:LSDOMAINT_lsrecord;
MU1:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
NPREC1:LSDOMAINT_NPrecord;
NPREC2:LSDOMAINT_NPrecord;
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
          ((N1.CAT IN [PERSPRO,
WHPRO,
INDEFPRO,
PROPERNOUN,
DEMPRO,
RECIPRO,
BIGPRO,
CARD]                                                 )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

END;{matchcondI1}
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((NPREC2.SUPERDEIXIS =PRESENTDEIXIS                     )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM1:BOOLEAN;
                                                      BEGIN
matchcondM1:=FALSE;
  IF
          ((NPREC1.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
                                                      THEN 
matchcondM1:=TRUE;

END;{matchcondM1}
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
    PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU2}
    copylist(MU2,list);
    END{MU2};
                                                        BEGIN{createitem13}
  createMU2(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(NP);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>NP THEN
      match:=FALSE;
    IF match THEN
      NPREC2:=s^.ls^.NPfield^;
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
LlastM_2_1:=L;WHILE LlastM_2_1^.brother<>NIL DO
LlastM_2_1:=LlastM_2_1^.brother;
match_MU4(L,LlastM_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeCon0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_2,matchcondI1) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
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
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU2(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM_1,LlastM_1
,HEAD,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
) ELSE match_HEAD(LfirstM_2,LfirstM_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
                                                      PROCEDURE ACTION7;
BEGIN
NPREC1:=NPREC2;                                       ;
NPREC1.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      BEGIN
m:=loopholes.retype(Is,LSSTREE_pstree);
LISTREE_InitSetOfTupleOfStrees(result);
match:=TRUE;
first:=TRUE;
matchmodel(m,first,match);
first:=FALSE;
  If match Then
  WHILE match AND NOT matchcondM DO
  BEGIN
  MatchModel(m,FALSE,match);
  END;
IF match THEN
 BEGIN
 END;
IF match THEN
  BEGIN
IF ((TRUE                                                  )
                                                      )
                                                       THEN
  BEGIN
  MAKET_NPrec(NPREC1);
  action7;
  createM1;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
                                                        END;
                                                      DECRNPPRESENTSUPERDEIXIS2:=result
END;
{:RNPPRESENTSUPERDEIXIS2}
{rule:}
{:RNPPASTSUPERDEIXIS2}
 FUNCTION DECRNPPASTSUPERDEIXIS2(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
N1:LSDOMAINT_lsrecord;
MU1:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
NPREC1:LSDOMAINT_NPrecord;
NPREC2:LSDOMAINT_NPrecord;
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
          ((N1.CAT IN [PERSPRO,
WHPRO,
INDEFPRO,
PROPERNOUN,
DEMPRO,
RECIPRO,
BIGPRO,
CARD]                                                 )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

END;{matchcondI1}
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((NPREC2.SUPERDEIXIS =PASTDEIXIS                        )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM1:BOOLEAN;
                                                      BEGIN
matchcondM1:=FALSE;
  IF
          ((NPREC1.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
                                                      THEN 
matchcondM1:=TRUE;

END;{matchcondM1}
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
    PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU2}
    copylist(MU2,list);
    END{MU2};
                                                        BEGIN{createitem13}
  createMU2(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(NP);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>NP THEN
      match:=FALSE;
    IF match THEN
      NPREC2:=s^.ls^.NPfield^;
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
LlastM_2_1:=L;WHILE LlastM_2_1^.brother<>NIL DO
LlastM_2_1:=LlastM_2_1^.brother;
match_MU4(L,LlastM_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeCon0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_2,matchcondI1) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
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
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU2(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM_1,LlastM_1
,HEAD,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
) ELSE match_HEAD(LfirstM_2,LfirstM_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
                                                      PROCEDURE ACTION7;
BEGIN
NPREC1:=NPREC2;                                       ;
NPREC1.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      BEGIN
m:=loopholes.retype(Is,LSSTREE_pstree);
LISTREE_InitSetOfTupleOfStrees(result);
match:=TRUE;
first:=TRUE;
matchmodel(m,first,match);
first:=FALSE;
  If match Then
  WHILE match AND NOT matchcondM DO
  BEGIN
  MatchModel(m,FALSE,match);
  END;
IF match THEN
 BEGIN
 END;
IF match THEN
  BEGIN
IF ((TRUE                                                  )
                                                      )
                                                       THEN
  BEGIN
  MAKET_NPrec(NPREC1);
  action7;
  createM1;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
                                                        END;
                                                      DECRNPPASTSUPERDEIXIS2:=result
END;
{:RNPPASTSUPERDEIXIS2}
{rule:}
{:RNPINDEFMODPOSS}
 FUNCTION DECRNPINDEFMODPOSS(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
LinitM_1_1,LrestM_1_1,LfirstM_1_1,LlastM_1_1:LSSTREE_prelnode;
iM_1_1:INTEGER;
nomoretreesM_1_1,lastmatchM_1_1:BOOLEAN;
LinitM_2,LrestM_2,LfirstM_2,LlastM_2:LSSTREE_prelnode;
iM_2:INTEGER;
nomoretreesM_2,lastmatchM_2:BOOLEAN;
LinitM_2_1,LrestM_2_1,LfirstM_2_1,LlastM_2_1:LSSTREE_prelnode;
iM_2_1:INTEGER;
nomoretreesM_2_1,lastmatchM_2_1:BOOLEAN;
LinitM_2_2,LrestM_2_2,LfirstM_2_2,LlastM_2_2:LSSTREE_prelnode;
iM_2_2:INTEGER;
nomoretreesM_2_2,lastmatchM_2_2:BOOLEAN;
LinitM_2_2_1,LrestM_2_2_1,LfirstM_2_2_1,LlastM_2_2_1:LSSTREE_prelnode;
iM_2_2_1:INTEGER;
nomoretreesM_2_2_1,lastmatchM_2_2_1:BOOLEAN;
LinitM_2_2_2,LrestM_2_2_2,LfirstM_2_2_2,LlastM_2_2_2:LSSTREE_prelnode;
iM_2_2_2:INTEGER;
nomoretreesM_2_2_2,lastmatchM_2_2_2:BOOLEAN;
LinitM_2_2_3,LrestM_2_2_3,LfirstM_2_2_3,LlastM_2_2_3:LSSTREE_prelnode;
iM_2_2_3:INTEGER;
nomoretreesM_2_2_3,lastmatchM_2_2_3:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
T1:LSSTREE_pStree;
PREPREC1tree:LSSTREE_pStree;
T2:LSSTREE_pStree;
MU10:LSMRUQUO_ListOfStrees;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
PERSPROREC1:LSDOMAINT_PERSPROrecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC2:LSDOMAINT_NPrecord;
PERSPROREC2:LSDOMAINT_PERSPROrecord;
PROPERNOUNREC1:LSDOMAINT_PROPERNOUNrecord;
CNREC2:LSDOMAINT_CNrecord;
NPREC3:LSDOMAINT_NPrecord;
PREPREC1:LSDOMAINT_PREPrecord;
PREPPREC1:LSDOMAINT_PREPPrecord;
INDEFPROREC1:LSDOMAINT_INDEFPROrecord;
NPREC1:LSDOMAINT_NPrecord;
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
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := INDEFPRO;
        N^.ls^.INDEFPROfield^ := INDEFPROREC1;
      END{CreateNode};
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      VAR list:LSMRUQUO_ListOfStrees;
      PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU10(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU10}
        copylist(MU10,list);
        END{MU10};
                                                            BEGIN{createitem11}
      createMU10(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem11);
      END{createlist1};
                                                          BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,INDEFPRO,createnode,createlist1);
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
    N^.ls^.cat := NP;
    N^.ls^.NPfield^ := NPREC2;
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
      PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      BEGIN
      wholelist.first:=NIL;wholelist.last:=NIL;
      END;
                                                          BEGIN{HEAD}
LSMATCHES_createitemVar(list,HEAD,T1);
    END{HEAD};
                                                        BEGIN{createitem12}
  createHEAD(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU2}
    copylist(MU2,list);
    END{MU2};
                                                        BEGIN{createitem13}
  createMU2(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m2:=MAKET_stree(NP);
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
        IF s^.ls^.cat<>INDEFPRO THEN
          match:=FALSE;
        IF match THEN
          INDEFPROREC1:=s^.ls^.INDEFPROfield^;
      END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        PROCEDURE Match_MU10(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU10.first:=Lfirst;
            MU10.last:=Llast;
            match:=TRUE;
          END
          ELSE match:=FALSE
        END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU10(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU10(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM_1_1:=L;WHILE LlastM_1_1^.brother<>NIL DO
LlastM_1_1:=LlastM_1_1^.brother;
match_MU10(L,LlastM_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_1) END;
                                                          PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
    PROCEDURE Match_POSREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
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
            IF match THEN match:=(s^.ls^.PREPfield^.key=auxkey('VANPREPKEY'));
          END{MatchNode};
                                                      BEGIN{MatchTree}
                        PREPREC1tree:=Lfirst^.node;
              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchM_2_1) END;
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
              NPREC3:=s^.ls^.NPfield^;
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
                                                      BEGIN{MatchTree}
                LSMATCHES_matchtreeVar(Lfirst,Llast,first,HEAD,T2,match,lastmatchM_2_2_2);
END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
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
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU2(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM_2_2_1,LlastM_2_2_1
,HEAD,item2,LfirstM_2_2_2,LlastM_2_2_2
,item3,LfirstM_2_2_3,LlastM_2_2_3
) ELSE match_HEAD(LfirstM_2_2_2,LfirstM_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,OBJREL
,HEAD,match,matchnode,matchlist3items,lastmatchM_2_2) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_OBJREL,matchlist0items,
LlastM_2_2,LfirstM_2_2,LrestM_2_2,nomoretreesM_2_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM_2_1,LfirstM_2_1,LrestM_2_1,nomoretreesM_2_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=2) AND (Lfirst^.node^.li^.n <=2)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree2rels(Lfirst,Llast,first,POSREL
,HEAD,OBJREL,match,matchnode,matchlist2items,lastmatchM_2) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_POSREL,matchlist0items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2) AND (s^.li^.n <=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,HEAD,POSREL,match,matchnode,matchlist2items,lastmatch) END;
                                                       FUNCTION subrule0X1 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>CN THEN
        match:=FALSE;
      IF match THEN
        CNREC2:=s^.ls^.CNfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      PROCEDURE Match_MU3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU3.first:=Lfirst;
          MU3.last:=Llast;
          match:=TRUE;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU3(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU3(NIL,NIL,TRUE,match) ELSE BEGIN
LlastT2_1:=L;WHILE LlastT2_1^.brother<>NIL DO
LlastT2_1:=LlastT2_1^.brother;
match_MU3(L,LlastT2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T2;
    matchnode(s,match);
        IF match THEN
          BEGIN
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
      N^.ls^.cat := CN;
      N^.ls^.CNfield^ := CNREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createMU3(VAR list:LSMRUQUO_ListOfStrees);
      BEGIN{MU3}
      copylist(MU3,list);
      END{MU3};
                                                          BEGIN{createitem11}
    createMU3(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{T1}
  s:=MAKET_stree(CN);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION23;
BEGIN
NPREC2:=NPREC3;                                       ;
NPREC2.SUPERDEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
NPREC2.CASES:=[NOMINATIVE]                                          ;
NPREC2.GENERIC:=NOGENERIC
                                                      ;
CNREC1:=CNREC2;                                       ;
CNREC1.CASES:=[NOMINATIVE]                                          ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((NPREC3.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
THEN IF
          ((ACCUSATIVE IN NPREC3.CASES                            )
                                                      )
THEN IF
          ((ACCUSATIVE IN CNREC2.CASES                            )
                                                      )
THEN IF
          ((NPREC3.GENERIC =OMEGAGENERIC                          )
                                                      )
                                                       THEN
    BEGIN
    MAKET_NPrec(NPREC2);
    MAKET_CNrec(CNREC1);
    MAKET_PERSPROrec(PERSPROREC1);
    action23;
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
                                                       subrule0X1:=result
 END;
 FUNCTION subrule0X2 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
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
LlastT2_1:=L;WHILE LlastT2_1^.brother<>NIL DO
LlastT2_1:=LlastT2_1^.brother;
match_MU4(L,LlastT2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T2;
    matchnode(s,match);
        IF match THEN
          BEGIN
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
      N^.ls^.cat := PROPERNOUN;
      N^.ls^.PROPERNOUNfield^ := PROPERNOUNREC1;
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
                                                        BEGIN{T1}
  s:=MAKET_stree(PROPERNOUN);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION38;
BEGIN
NPREC2:=NPREC3;                                       ;
NPREC2.SUPERDEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
NPREC2.CASES:=[NOMINATIVE]                                          ;
NPREC2.GENERIC:=NOGENERIC
                                                      ;wbonus:=0;sbonus:=0

END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((NPREC3.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
THEN IF
          ((ACCUSATIVE IN NPREC3.CASES                            )
                                                      )
THEN IF
          ((NPREC3.GENERIC =OMEGAGENERIC                          )
                                                      )
                                                       THEN
    BEGIN
    MAKET_NPrec(NPREC2);
    MAKET_CNrec(CNREC1);
    MAKET_PERSPROrec(PERSPROREC1);
    action38;
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
                                                       subrule0X2:=result
 END;
 FUNCTION subrule0X3 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>PERSPRO THEN
        match:=FALSE;
      IF match THEN
        PERSPROREC2:=s^.ls^.PERSPROfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU5(NIL,NIL,TRUE,match) ELSE BEGIN
LlastT2_1:=L;WHILE LlastT2_1^.brother<>NIL DO
LlastT2_1:=LlastT2_1^.brother;
match_MU5(L,LlastT2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T2;
    matchnode(s,match);
        IF match THEN
          BEGIN
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
      N^.ls^.cat := PERSPRO;
      N^.ls^.PERSPROfield^ := PERSPROREC1;
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
    BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{T1}
  s:=MAKET_stree(PERSPRO);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION61;
BEGIN
NPREC2:=NPREC3;                                       ;
NPREC2.SUPERDEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
NPREC2.CASES:=[NOMINATIVE]                                          ;
NPREC2.GENERIC:=NOGENERIC
                                                      ;
PERSPROREC1:=PERSPROREC2;                             ;
PERSPROREC1.PERSPROCASES:=[NOMINATIVE]                                          ;wbonus:=0;sbonus:=0

END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((PERSPROREC2.PERSPROCASES *[ACCUSATIVE,
DATIVE]                                               <>[]                                                    )
                                                      )
THEN IF
          ((NPREC3.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
THEN IF
          ((ACCUSATIVE IN NPREC3.CASES                            )
                                                      )
THEN IF
          ((NPREC3.GENERIC =OMEGAGENERIC                          )
                                                      )
                                                       THEN
    BEGIN
    MAKET_NPrec(NPREC2);
    MAKET_CNrec(CNREC1);
    MAKET_PERSPROrec(PERSPROREC1);
    action61;
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
                                                       subrule0X3:=result
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
  LISTREE_mergesetsoftuplestrees(subrule0X1,result);
  LISTREE_mergesetsoftuplestrees(subrule0X2,result);
  LISTREE_mergesetsoftuplestrees(subrule0X3,result);
 END;
DECRNPINDEFMODPOSS:=result
END;
{:RNPINDEFMODPOSS}
{rule:}
{:RNPWHMODPOSS}
 FUNCTION DECRNPWHMODPOSS(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
LinitM_1_1,LrestM_1_1,LfirstM_1_1,LlastM_1_1:LSSTREE_prelnode;
iM_1_1:INTEGER;
nomoretreesM_1_1,lastmatchM_1_1:BOOLEAN;
LinitM_2,LrestM_2,LfirstM_2,LlastM_2:LSSTREE_prelnode;
iM_2:INTEGER;
nomoretreesM_2,lastmatchM_2:BOOLEAN;
LinitM_2_1,LrestM_2_1,LfirstM_2_1,LlastM_2_1:LSSTREE_prelnode;
iM_2_1:INTEGER;
nomoretreesM_2_1,lastmatchM_2_1:BOOLEAN;
LinitM_2_2,LrestM_2_2,LfirstM_2_2,LlastM_2_2:LSSTREE_prelnode;
iM_2_2:INTEGER;
nomoretreesM_2_2,lastmatchM_2_2:BOOLEAN;
LinitM_2_2_1,LrestM_2_2_1,LfirstM_2_2_1,LlastM_2_2_1:LSSTREE_prelnode;
iM_2_2_1:INTEGER;
nomoretreesM_2_2_1,lastmatchM_2_2_1:BOOLEAN;
LinitM_2_2_2,LrestM_2_2_2,LfirstM_2_2_2,LlastM_2_2_2:LSSTREE_prelnode;
iM_2_2_2:INTEGER;
nomoretreesM_2_2_2,lastmatchM_2_2_2:BOOLEAN;
LinitM_2_2_3,LrestM_2_2_3,LfirstM_2_2_3,LlastM_2_2_3:LSSTREE_prelnode;
iM_2_2_3:INTEGER;
nomoretreesM_2_2_3,lastmatchM_2_2_3:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
T1:LSSTREE_pStree;
PREPREC1tree:LSSTREE_pStree;
T2:LSSTREE_pStree;
MU4:LSMRUQUO_ListOfStrees;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
PERSPROREC1:LSDOMAINT_PERSPROrecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC2:LSDOMAINT_NPrecord;
PERSPROREC2:LSDOMAINT_PERSPROrecord;
PROPERNOUNREC1:LSDOMAINT_PROPERNOUNrecord;
CNREC2:LSDOMAINT_CNrecord;
NPREC3:LSDOMAINT_NPrecord;
PREPREC1:LSDOMAINT_PREPrecord;
PREPPREC1:LSDOMAINT_PREPPrecord;
WHPROREC1:LSDOMAINT_WHPROrecord;
NPREC1:LSDOMAINT_NPrecord;
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
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := WHPRO;
        N^.ls^.WHPROfield^ := WHPROREC1;
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
                                                          BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,WHPRO,createnode,createlist1);
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
    N^.ls^.cat := NP;
    N^.ls^.NPfield^ := NPREC2;
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
      PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      BEGIN
      wholelist.first:=NIL;wholelist.last:=NIL;
      END;
                                                          BEGIN{HEAD}
LSMATCHES_createitemVar(list,HEAD,T1);
    END{HEAD};
                                                        BEGIN{createitem12}
  createHEAD(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU2}
    copylist(MU2,list);
    END{MU2};
                                                        BEGIN{createitem13}
  createMU2(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m2:=MAKET_stree(NP);
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
        IF s^.ls^.cat<>WHPRO THEN
          match:=FALSE;
        IF match THEN
          WHPROREC1:=s^.ls^.WHPROfield^;
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
LlastM_1_1:=L;WHILE LlastM_1_1^.brother<>NIL DO
LlastM_1_1:=LlastM_1_1^.brother;
match_MU4(L,LlastM_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_1) END;
                                                          PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
    PROCEDURE Match_POSREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
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
            IF match THEN match:=(s^.ls^.PREPfield^.key=auxkey('VANPREPKEY'));
          END{MatchNode};
                                                      BEGIN{MatchTree}
                        PREPREC1tree:=Lfirst^.node;
              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchM_2_1) END;
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
              NPREC3:=s^.ls^.NPfield^;
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
                                                      BEGIN{MatchTree}
                LSMATCHES_matchtreeVar(Lfirst,Llast,first,HEAD,T2,match,lastmatchM_2_2_2);
END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
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
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU2(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM_2_2_1,LlastM_2_2_1
,HEAD,item2,LfirstM_2_2_2,LlastM_2_2_2
,item3,LfirstM_2_2_3,LlastM_2_2_3
) ELSE match_HEAD(LfirstM_2_2_2,LfirstM_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,OBJREL
,HEAD,match,matchnode,matchlist3items,lastmatchM_2_2) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_OBJREL,matchlist0items,
LlastM_2_2,LfirstM_2_2,LrestM_2_2,nomoretreesM_2_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM_2_1,LfirstM_2_1,LrestM_2_1,nomoretreesM_2_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=2) AND (Lfirst^.node^.li^.n <=2)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree2rels(Lfirst,Llast,first,POSREL
,HEAD,OBJREL,match,matchnode,matchlist2items,lastmatchM_2) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_POSREL,matchlist0items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2) AND (s^.li^.n <=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,HEAD,POSREL,match,matchnode,matchlist2items,lastmatch) END;
                                                       FUNCTION subrule0X1 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>CN THEN
        match:=FALSE;
      IF match THEN
        CNREC2:=s^.ls^.CNfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU5(NIL,NIL,TRUE,match) ELSE BEGIN
LlastT2_1:=L;WHILE LlastT2_1^.brother<>NIL DO
LlastT2_1:=LlastT2_1^.brother;
match_MU5(L,LlastT2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T2;
    matchnode(s,match);
        IF match THEN
          BEGIN
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
      N^.ls^.cat := CN;
      N^.ls^.CNfield^ := CNREC1;
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
    BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{T1}
  s:=MAKET_stree(CN);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION22;
BEGIN
NPREC2:=NPREC3;                                       ;
NPREC2.SUPERDEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
NPREC2.CASES:=[NOMINATIVE]                                          ;
NPREC2.GENERIC:=NOGENERIC
                                                      ;
CNREC1:=CNREC2;                                       ;
CNREC1.CASES:=[NOMINATIVE]                                          ;wbonus:=0;sbonus:=0

END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((NPREC3.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
THEN IF
          ((ACCUSATIVE IN NPREC3.CASES                            )
                                                      )
THEN IF
          ((ACCUSATIVE IN CNREC2.CASES                            )
                                                      )
THEN IF
          ((NPREC3.GENERIC =OMEGAGENERIC                          )
                                                      )
                                                       THEN
    BEGIN
    MAKET_NPrec(NPREC2);
    MAKET_CNrec(CNREC1);
    MAKET_PERSPROrec(PERSPROREC1);
    action22;
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
                                                       subrule0X1:=result
 END;
 FUNCTION subrule0X2 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
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
      PROCEDURE Match_MU3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU3.first:=Lfirst;
          MU3.last:=Llast;
          match:=TRUE;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU3(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU3(NIL,NIL,TRUE,match) ELSE BEGIN
LlastT2_1:=L;WHILE LlastT2_1^.brother<>NIL DO
LlastT2_1:=LlastT2_1^.brother;
match_MU3(L,LlastT2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T2;
    matchnode(s,match);
        IF match THEN
          BEGIN
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
      N^.ls^.cat := PROPERNOUN;
      N^.ls^.PROPERNOUNfield^ := PROPERNOUNREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createMU3(VAR list:LSMRUQUO_ListOfStrees);
      BEGIN{MU3}
      copylist(MU3,list);
      END{MU3};
                                                          BEGIN{createitem11}
    createMU3(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{T1}
  s:=MAKET_stree(PROPERNOUN);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION37;
BEGIN
NPREC2:=NPREC3;                                       ;
NPREC2.SUPERDEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
NPREC2.CASES:=[NOMINATIVE]                                          ;
NPREC2.GENERIC:=NOGENERIC
                                                      ;wbonus:=0;sbonus:=0

END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((NPREC3.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
THEN IF
          ((ACCUSATIVE IN NPREC3.CASES                            )
                                                      )
THEN IF
          ((NPREC3.GENERIC =OMEGAGENERIC                          )
                                                      )
                                                       THEN
    BEGIN
    MAKET_NPrec(NPREC2);
    MAKET_CNrec(CNREC1);
    MAKET_PERSPROrec(PERSPROREC1);
    action37;
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
                                                       subrule0X2:=result
 END;
 FUNCTION subrule0X3 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>PERSPRO THEN
        match:=FALSE;
      IF match THEN
        PERSPROREC2:=s^.ls^.PERSPROfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU5(NIL,NIL,TRUE,match) ELSE BEGIN
LlastT2_1:=L;WHILE LlastT2_1^.brother<>NIL DO
LlastT2_1:=LlastT2_1^.brother;
match_MU5(L,LlastT2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T2;
    matchnode(s,match);
        IF match THEN
          BEGIN
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
      N^.ls^.cat := PERSPRO;
      N^.ls^.PERSPROfield^ := PERSPROREC1;
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
    BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{T1}
  s:=MAKET_stree(PERSPRO);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION60;
BEGIN
NPREC2:=NPREC3;                                       ;
NPREC2.SUPERDEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
NPREC2.CASES:=[NOMINATIVE]                                          ;
NPREC2.GENERIC:=NOGENERIC
                                                      ;
PERSPROREC1:=PERSPROREC2;                             ;
PERSPROREC1.PERSPROCASES:=[NOMINATIVE]                                          ;wbonus:=0;sbonus:=0

END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((PERSPROREC2.PERSPROCASES *[ACCUSATIVE,
DATIVE]                                               <>[]                                                    )
                                                      )
THEN IF
          ((NPREC3.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
THEN IF
          ((ACCUSATIVE IN NPREC3.CASES                            )
                                                      )
THEN IF
          ((NPREC3.GENERIC =OMEGAGENERIC                          )
                                                      )
                                                       THEN
    BEGIN
    MAKET_NPrec(NPREC2);
    MAKET_CNrec(CNREC1);
    MAKET_PERSPROrec(PERSPROREC1);
    action60;
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
                                                       subrule0X3:=result
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
  LISTREE_mergesetsoftuplestrees(subrule0X1,result);
  LISTREE_mergesetsoftuplestrees(subrule0X2,result);
  LISTREE_mergesetsoftuplestrees(subrule0X3,result);
 END;
DECRNPWHMODPOSS:=result
END;
{:RNPWHMODPOSS}
{rule:}
{:RNPPROPERNOUNMODPOSS}
 FUNCTION DECRNPPROPERNOUNMODPOSS(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
LinitM_1_1,LrestM_1_1,LfirstM_1_1,LlastM_1_1:LSSTREE_prelnode;
iM_1_1:INTEGER;
nomoretreesM_1_1,lastmatchM_1_1:BOOLEAN;
LinitM_2,LrestM_2,LfirstM_2,LlastM_2:LSSTREE_prelnode;
iM_2:INTEGER;
nomoretreesM_2,lastmatchM_2:BOOLEAN;
LinitM_2_1,LrestM_2_1,LfirstM_2_1,LlastM_2_1:LSSTREE_prelnode;
iM_2_1:INTEGER;
nomoretreesM_2_1,lastmatchM_2_1:BOOLEAN;
LinitM_2_2,LrestM_2_2,LfirstM_2_2,LlastM_2_2:LSSTREE_prelnode;
iM_2_2:INTEGER;
nomoretreesM_2_2,lastmatchM_2_2:BOOLEAN;
LinitM_2_2_1,LrestM_2_2_1,LfirstM_2_2_1,LlastM_2_2_1:LSSTREE_prelnode;
iM_2_2_1:INTEGER;
nomoretreesM_2_2_1,lastmatchM_2_2_1:BOOLEAN;
LinitM_2_2_2,LrestM_2_2_2,LfirstM_2_2_2,LlastM_2_2_2:LSSTREE_prelnode;
iM_2_2_2:INTEGER;
nomoretreesM_2_2_2,lastmatchM_2_2_2:BOOLEAN;
LinitM_2_2_3,LrestM_2_2_3,LfirstM_2_2_3,LlastM_2_2_3:LSSTREE_prelnode;
iM_2_2_3:INTEGER;
nomoretreesM_2_2_3,lastmatchM_2_2_3:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
T1:LSSTREE_pStree;
PREPREC1tree:LSSTREE_pStree;
T2:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
PERSPROREC1:LSDOMAINT_PERSPROrecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC2:LSDOMAINT_NPrecord;
PERSPROREC2:LSDOMAINT_PERSPROrecord;
PROPERNOUNREC2:LSDOMAINT_PROPERNOUNrecord;
CNREC2:LSDOMAINT_CNrecord;
NPREC3:LSDOMAINT_NPrecord;
PREPREC1:LSDOMAINT_PREPrecord;
PREPPREC1:LSDOMAINT_PREPPrecord;
PROPERNOUNREC1:LSDOMAINT_PROPERNOUNrecord;
NPREC1:LSDOMAINT_NPrecord;
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
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := PROPERNOUN;
        N^.ls^.PROPERNOUNfield^ := PROPERNOUNREC1;
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
                                                          BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,PROPERNOUN,createnode,createlist1);
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
    N^.ls^.cat := NP;
    N^.ls^.NPfield^ := NPREC2;
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
  PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      BEGIN
      wholelist.first:=NIL;wholelist.last:=NIL;
      END;
                                                          BEGIN{HEAD}
LSMATCHES_createitemVar(list,HEAD,T1);
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
m2:=MAKET_stree(NP);
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
        IF s^.ls^.cat<>PROPERNOUN THEN
          match:=FALSE;
        IF match THEN
          PROPERNOUNREC1:=s^.ls^.PROPERNOUNfield^;
      END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU1(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM_1_1:=L;WHILE LlastM_1_1^.brother<>NIL DO
LlastM_1_1:=LlastM_1_1^.brother;
match_MU1(L,LlastM_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_1) END;
                                                          PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
    PROCEDURE Match_POSREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
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
            IF match THEN match:=(s^.ls^.PREPfield^.key=auxkey('VANPREPKEY'));
          END{MatchNode};
                                                      BEGIN{MatchTree}
                        PREPREC1tree:=Lfirst^.node;
              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchM_2_1) END;
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
              NPREC3:=s^.ls^.NPfield^;
          END{MatchNode};
                                                      PROCEDURE MatchList3Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
            PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            VAR matchcond:BOOLEAN;
              Stree:LSSTREE_pStree;
              lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
                LSMATCHES_matchtreeVar(Lfirst,Llast,first,HEAD,T2,match,lastmatchM_2_2_2);
END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
            PROCEDURE Match_MU3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            BEGIN{match}
              IF first THEN BEGIN
                MU3.first:=Lfirst;
                MU3.last:=Llast;
                match:=TRUE;
              END
              ELSE match:=FALSE
            END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU3(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM_2_2_1,LlastM_2_2_1
,HEAD,item2,LfirstM_2_2_2,LlastM_2_2_2
,item3,LfirstM_2_2_3,LlastM_2_2_3
) ELSE match_HEAD(LfirstM_2_2_2,LfirstM_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,OBJREL
,HEAD,match,matchnode,matchlist3items,lastmatchM_2_2) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_OBJREL,matchlist0items,
LlastM_2_2,LfirstM_2_2,LrestM_2_2,nomoretreesM_2_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM_2_1,LfirstM_2_1,LrestM_2_1,nomoretreesM_2_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=2) AND (Lfirst^.node^.li^.n <=2)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree2rels(Lfirst,Llast,first,POSREL
,HEAD,OBJREL,match,matchnode,matchlist2items,lastmatchM_2) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_POSREL,matchlist0items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2) AND (s^.li^.n <=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,HEAD,POSREL,match,matchnode,matchlist2items,lastmatch) END;
                                                       FUNCTION subrule0X1 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>CN THEN
        match:=FALSE;
      IF match THEN
        CNREC2:=s^.ls^.CNfield^;
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
LlastT2_1:=L;WHILE LlastT2_1^.brother<>NIL DO
LlastT2_1:=LlastT2_1^.brother;
match_MU4(L,LlastT2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T2;
    matchnode(s,match);
        IF match THEN
          BEGIN
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
      N^.ls^.cat := CN;
      N^.ls^.CNfield^ := CNREC1;
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
                                                        BEGIN{T1}
  s:=MAKET_stree(CN);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION22;
BEGIN
NPREC2:=NPREC3;                                       ;
NPREC2.SUPERDEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
NPREC2.CASES:=[NOMINATIVE]                                          ;
NPREC2.GENERIC:=NOGENERIC
                                                      ;
CNREC1:=CNREC2;                                       ;
CNREC1.CASES:=[NOMINATIVE]                                          ;wbonus:=0;sbonus:=0

END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((NPREC3.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
THEN IF
          ((ACCUSATIVE IN NPREC3.CASES                            )
                                                      )
THEN IF
          ((ACCUSATIVE IN CNREC2.CASES                            )
                                                      )
THEN IF
          ((NPREC3.GENERIC =OMEGAGENERIC                          )
                                                      )
                                                       THEN
    BEGIN
    MAKET_NPrec(NPREC2);
    MAKET_CNrec(CNREC1);
    MAKET_PERSPROrec(PERSPROREC1);
    action22;
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
                                                       subrule0X1:=result
 END;
 FUNCTION subrule0X2 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>PROPERNOUN THEN
        match:=FALSE;
      IF match THEN
        PROPERNOUNREC2:=s^.ls^.PROPERNOUNfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU5(NIL,NIL,TRUE,match) ELSE BEGIN
LlastT2_1:=L;WHILE LlastT2_1^.brother<>NIL DO
LlastT2_1:=LlastT2_1^.brother;
match_MU5(L,LlastT2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T2;
    matchnode(s,match);
        IF match THEN
          BEGIN
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
      N^.ls^.cat := PROPERNOUN;
      N^.ls^.PROPERNOUNfield^ := PROPERNOUNREC2;
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
    BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{T1}
  s:=MAKET_stree(PROPERNOUN);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION37;
BEGIN
NPREC2:=NPREC3;                                       ;
NPREC2.SUPERDEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
NPREC2.CASES:=[NOMINATIVE]                                          ;
NPREC2.GENERIC:=NOGENERIC
                                                      ;wbonus:=0;sbonus:=0

END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((NPREC3.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
THEN IF
          ((ACCUSATIVE IN NPREC3.CASES                            )
                                                      )
THEN IF
          ((NPREC3.GENERIC =OMEGAGENERIC                          )
                                                      )
                                                       THEN
    BEGIN
    MAKET_NPrec(NPREC2);
    MAKET_CNrec(CNREC1);
    MAKET_PERSPROrec(PERSPROREC1);
    action37;
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
                                                       subrule0X2:=result
 END;
 FUNCTION subrule0X3 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>PERSPRO THEN
        match:=FALSE;
      IF match THEN
        PERSPROREC2:=s^.ls^.PERSPROfield^;
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
      N^.ls^.cat := PERSPRO;
      N^.ls^.PERSPROfield^ := PERSPROREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
      PROCEDURE createMU6(VAR list:LSMRUQUO_ListOfStrees);
      BEGIN{MU6}
      copylist(MU6,list);
      END{MU6};
                                                          BEGIN{createitem11}
    createMU6(list);
    END;
    BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem11);
    END{createlist1};
                                                        BEGIN{T1}
  s:=MAKET_stree(PERSPRO);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION60;
BEGIN
NPREC2:=NPREC3;                                       ;
NPREC2.SUPERDEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
NPREC2.CASES:=[NOMINATIVE]                                          ;
NPREC2.GENERIC:=NOGENERIC
                                                      ;
PERSPROREC1:=PERSPROREC2;                             ;
PERSPROREC1.PERSPROCASES:=[NOMINATIVE]                                          ;wbonus:=0;sbonus:=0

END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((PERSPROREC2.PERSPROCASES *[ACCUSATIVE,
DATIVE]                                               <>[]                                                    )
                                                      )
THEN IF
          ((NPREC3.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
THEN IF
          ((ACCUSATIVE IN NPREC3.CASES                            )
                                                      )
THEN IF
          ((NPREC3.GENERIC =OMEGAGENERIC                          )
                                                      )
                                                       THEN
    BEGIN
    MAKET_NPrec(NPREC2);
    MAKET_CNrec(CNREC1);
    MAKET_PERSPROrec(PERSPROREC1);
    action60;
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
                                                       subrule0X3:=result
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
  LISTREE_mergesetsoftuplestrees(subrule0X1,result);
  LISTREE_mergesetsoftuplestrees(subrule0X2,result);
  LISTREE_mergesetsoftuplestrees(subrule0X3,result);
 END;
DECRNPPROPERNOUNMODPOSS:=result
END;
{:RNPPROPERNOUNMODPOSS}
{rule:}
{:TNPASSIGNEFORM1}
 FUNCTION DECTNPASSIGNEFORM1(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
LinitM_2_2_1,LrestM_2_2_1,LfirstM_2_2_1,LlastM_2_2_1:LSSTREE_prelnode;
iM_2_2_1:INTEGER;
nomoretreesM_2_2_1,lastmatchM_2_2_1:BOOLEAN;
LinitM_2_2_2,LrestM_2_2_2,LfirstM_2_2_2,LlastM_2_2_2:LSSTREE_prelnode;
iM_2_2_2:INTEGER;
nomoretreesM_2_2_2,lastmatchM_2_2_2:BOOLEAN;
LinitM_2_2_2_1,LrestM_2_2_2_1,LfirstM_2_2_2_1,LlastM_2_2_2_1:LSSTREE_prelnode;
iM_2_2_2_1:INTEGER;
nomoretreesM_2_2_2_1,lastmatchM_2_2_2_1:BOOLEAN;
LinitM_2_3,LrestM_2_3,LfirstM_2_3,LlastM_2_3:LSSTREE_prelnode;
iM_2_3:INTEGER;
nomoretreesM_2_3,lastmatchM_2_3:BOOLEAN;
LinitM_2_4,LrestM_2_4,LfirstM_2_4,LlastM_2_4:LSSTREE_prelnode;
iM_2_4:INTEGER;
nomoretreesM_2_4,lastmatchM_2_4:BOOLEAN;
LinitM_2_4_1,LrestM_2_4_1,LfirstM_2_4_1,LlastM_2_4_1:LSSTREE_prelnode;
iM_2_4_1:INTEGER;
nomoretreesM_2_4_1,lastmatchM_2_4_1:BOOLEAN;
LinitM_2_5,LrestM_2_5,LfirstM_2_5,LlastM_2_5:LSSTREE_prelnode;
iM_2_5:INTEGER;
nomoretreesM_2_5,lastmatchM_2_5:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
T1:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU9:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
MU7:LSMRUQUO_ListOfStrees;
MU11:LSMRUQUO_ListOfStrees;
MU13:LSMRUQUO_ListOfStrees;
MU12:LSMRUQUO_ListOfStrees;
ADJREC1:LSDOMAINT_ADJrecord;
ADJPREC1:LSDOMAINT_ADJPrecord;
NPREC8:LSDOMAINT_NPrecord;
POSSADJREC1:LSDOMAINT_POSSADJrecord;
DETPREC1:LSDOMAINT_DETPrecord;
NOUNREC1:LSDOMAINT_NOUNrecord;
ADJREC2:LSDOMAINT_ADJrecord;
ADJPREC2:LSDOMAINT_ADJPrecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
FUNCTION matchcondM1:BOOLEAN;
BEGIN
  matchcondM1:= TRUE
END;{matchcondM1}
FUNCTION matchcondM:BOOLEAN;
BEGIN
  matchcondM:= TRUE
END;{matchcondM}
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
        N^.ls^.cat := CN;
        N^.ls^.CNfield^ := CNREC1;
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
      PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMODREL(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := ADJP;
            N^.ls^.ADJPfield^ := ADJPREC1;
          END{CreateNode};
                                                                PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          VAR list:LSMRUQUO_ListOfStrees;
          PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createMU3(VAR list:LSMRUQUO_ListOfStrees);
            BEGIN{MU3}
            copylist(MU3,list);
            END{MU3};
                                                                BEGIN{createitem21}
          createMU3(list);
          END;
          PROCEDURE createitem22(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
            VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
             list1:LSMRUQUO_ListOfStrees;
              PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
              BEGIN{CreateNode}
                N^.ls^.cat := ADJ;
                N^.ls^.ADJfield^ := ADJREC1;
              END{CreateNode};
                                                                    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
              VAR list:LSMRUQUO_ListOfStrees;
              PROCEDURE createitem31(VAR list:LSMRUQUO_ListOfStrees);
                PROCEDURE createMU9(VAR list:LSMRUQUO_ListOfStrees);
                BEGIN{MU9}
                copylist(MU9,list);
                END{MU9};
                                                                    BEGIN{createitem31}
              createMU9(list);
              END;
              BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem31);
              END{createlist1};
                                                                  BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,ADJ,createnode,createlist1);
            END{HEAD};
                                                                BEGIN{createitem22}
          createHEAD(list);
          END;
          BEGIN{createlist1}
LSMATCHES_createlist2items01(wholelist,createitem21,createitem22);
          END{createlist1};
                                                              BEGIN{MODREL}
LSMATCHES_createitem(list,MODREL,ADJP,createnode,createlist1);
        END{MODREL};
                                                            BEGIN{createitem12}
      createMODREL(list);
      END;
      PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU4(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU4}
        copylist(MU4,list);
        END{MU4};
                                                            BEGIN{createitem13}
      createMU4(list);
      END;
      PROCEDURE createitem14(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := NOUN;
            N^.ls^.NOUNfield^ := NOUNREC1;
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
          BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem21);
          END{createlist1};
                                                              BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,NOUN,createnode,createlist1);
        END{HEAD};
                                                            BEGIN{createitem14}
      createHEAD(list);
      END;
      PROCEDURE createitem15(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU6(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU6}
        copylist(MU6,list);
        END{MU6};
                                                            BEGIN{createitem15}
      createMU6(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist4items0101(wholelist,createitem11,createitem12,createitem13,createitem14);
      createitem15(list);
      IF list.first<>NIL THEN
        BEGIN
        wholelist.last^.brother:=list.first;
        wholelist.last:=list.last;
        END;
      END{createlist1};
                                                          BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,CN,createnode,createlist1);
    END{HEAD};
                                                        BEGIN{createitem12}
  createHEAD(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU7(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU7}
    copylist(MU7,list);
    END{MU7};
                                                        BEGIN{createitem13}
  createMU7(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(NP);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      lirel2:LIDOMAINT_synrel;
      lsrel2:LSDOMAINT_synrel;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>CN THEN
          match:=FALSE;
        IF match THEN
          CNREC1:=s^.ls^.CNfield^;
      END{MatchNode};
                                                            PROCEDURE MatchList5Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
        PROCEDURE Match_MU2(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU2.first:=Lfirst;
            MU2.last:=Llast;
            match:=TRUE;
          END
          ELSE match:=FALSE
        END;
                                                              PROCEDURE MatchList4Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
        PROCEDURE Match_MODREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR matchcond:BOOLEAN;
          Stree:LSSTREE_pStree;
          lisons:LISTREE_pRelnode;
          lirel1:LIDOMAINT_synrel;
          lsrel1:LSDOMAINT_synrel;
          PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
          BEGIN{MatchNode}
            IF s^.ls^.cat<>ADJP THEN
              match:=FALSE;
            IF match THEN
              ADJPREC2:=s^.ls^.ADJPfield^;
          END{MatchNode};
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            PROCEDURE Match_MU3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            BEGIN{match}
              IF first THEN BEGIN
                MU3.first:=Lfirst;
                MU3.last:=Llast;
                match:=TRUE;
              END
              ELSE match:=FALSE
            END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU3(Lfirst,Llast,TRUE,match);
END;
            PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            VAR matchcond:BOOLEAN;
              Stree:LSSTREE_pStree;
              lisons:LISTREE_pRelnode;
              PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
              BEGIN{MatchNode}
                IF s^.ls^.cat<>ADJ THEN
                  match:=FALSE;
                IF match THEN
                  ADJREC2:=s^.ls^.ADJfield^;
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
LlastM_2_2_2_1:=L;WHILE LlastM_2_2_2_1^.brother<>NIL DO
LlastM_2_2_2_1:=LlastM_2_2_2_1^.brother;
match_MU9(L,LlastM_2_2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
                LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_2_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM_2_2_1,LlastM_2_2_1
,item2,LfirstM_2_2_2,LlastM_2_2_2
) ELSE match_HEAD(LfirstM_2_2_2,LfirstM_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,MODREL
,HEAD,match,matchnode,matchlist2items,lastmatchM_2_2) END;
                                                                PROCEDURE MatchList3Items
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
            IF s^.ls^.cat<>NOUN THEN
              match:=FALSE;
            IF match THEN
              NOUNREC1:=s^.ls^.NOUNfield^;
          END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU5(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM_2_4_1:=L;WHILE LlastM_2_4_1^.brother<>NIL DO
LlastM_2_4_1:=LlastM_2_4_1^.brother;
match_MU5(L,LlastM_2_4_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
            LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_2_4) END;
                                                                    PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
              VAR
                itemmatch,listmatch:Boolean;
        PROCEDURE Match_MU6(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU6.first:=Lfirst;
            MU6.last:=Llast;
            match:=TRUE;
          END
          ELSE match:=FALSE
        END;
                                                      BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU6,matchlist0items,
LlastM_2_5,LfirstM_2_5,LrestM_2_5,nomoretreesM_2_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM_2_4,LfirstM_2_4,LrestM_2_4,nomoretreesM_2_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU4,matchlist2items,
LlastM_2_3,LfirstM_2_3,LrestM_2_3,nomoretreesM_2_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_MODREL,matchlist3items,
LlastM_2_2,LfirstM_2_2,LrestM_2_2,nomoretreesM_2_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU2,matchlist4items,
LlastM_2_1,LfirstM_2_1,LrestM_2_1,nomoretreesM_2_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=2)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree2rels(Lfirst,Llast,first,HEAD
,MODREL,HEAD,match,matchnode,matchlist5items,lastmatchM_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_MU7(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU7.first:=Lfirst;
        MU7.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU7(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM_1,LlastM_1
,HEAD,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
) ELSE match_HEAD(LfirstM_2,LfirstM_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
                                                       FUNCTION subrule0X1 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDMU1:BOOLEAN;
BEGIN MATCHCONDMU1:=TRUE END;
                                                          PROCEDURE matchlistMU1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(MU1.first,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  END;
  PROCEDURE createMU1;
  BEGIN{MU1}
  END{MU1};
                                                      PROCEDURE ACTION27;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION28;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION29;
BEGIN

END;
                                                      PROCEDURE ACTION31;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION33;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION35;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION36;
BEGIN

END;
                                                      PROCEDURE ACTION37;
BEGIN

END;
                                                      PROCEDURE ACTION42;
BEGIN
ADJPREC1.EORENFORM:=OMEGAFORM
                                                      ;
ADJREC1:=ADJREC2;                                     ;
ADJREC1.EORENFORM:=ADJPREC1.EORENFORM
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistMU1(MU1.first,MU1.last,match,TRUE);
  IF match THEN
    BEGIN
  IF ((ADJREC2.EORENFORM =ADJPREC2.EORENFORM                 )
                                                      )
                                                       THEN
    BEGIN
    IF ((NOUNREC1.NUMBER =PLURAL                               )
                                                      )
                                                       THEN
      BEGIN
      IF ((ADJREC2.EFORMATION<>NOFORMATION                       )
                                                      )
THEN IF
          ((ADJPREC2.EORENFORM =EFORM                             )
                                                      )
                                                       THEN
        BEGIN
        MAKET_ADJPrec(ADJPREC1);
        MAKET_ADJrec(ADJREC1);
        action27;
        action29;
        action42;
        createMU1;
        previous1;
        LISTREE_emptytuple(tuple);
        Is1:=loopholes.retype(m1,LISTREE_pstree);
        LISTREE_addtotuple(Is1,tuple);
        LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
        END;
      IF ((ADJREC2.EFORMATION =NOFORMATION                       )
                                                      )
THEN IF
          ((ADJPREC2.EORENFORM =NOFORM                            )
                                                      )
                                                       THEN
        BEGIN
        MAKET_ADJPrec(ADJPREC1);
        MAKET_ADJrec(ADJREC1);
        action28;
        action29;
        action42;
        createMU1;
        previous1;
        LISTREE_emptytuple(tuple);
        Is1:=loopholes.retype(m1,LISTREE_pstree);
        LISTREE_addtotuple(Is1,tuple);
        LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
        END;
                                                            END;
    IF ((NOUNREC1.NUMBER =SINGULAR                             )
                                                      )
                                                       THEN
      BEGIN
      IF (([NEUTGENDER]                                           *NOUNREC1.GENDERS<>
[]                                                    )
                                                      )
THEN IF
          ((ADJPREC2.EORENFORM =NOFORM                            )
                                                      )
                                                       THEN
        BEGIN
        MAKET_ADJPrec(ADJPREC1);
        MAKET_ADJrec(ADJREC1);
        action31;
        action37;
        action42;
        createMU1;
        previous1;
        LISTREE_emptytuple(tuple);
        Is1:=loopholes.retype(m1,LISTREE_pstree);
        LISTREE_addtotuple(Is1,tuple);
        LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
        END;
      IF (([FEMGENDER,
MASCGENDER]                                            *NOUNREC1.GENDERS<>[]                                                    )
                                                      )
                                                       THEN
        BEGIN
        IF ((ADJREC2.EFORMATION<>NOFORMATION                       )
                                                      )
THEN IF
          ((ADJPREC2.EORENFORM =EFORM                             )
                                                      )
                                                       THEN
          BEGIN
          MAKET_ADJPrec(ADJPREC1);
          MAKET_ADJrec(ADJREC1);
          action33;
          action36;
          action37;
          action42;
          createMU1;
          previous1;
          LISTREE_emptytuple(tuple);
          Is1:=loopholes.retype(m1,LISTREE_pstree);
          LISTREE_addtotuple(Is1,tuple);
          LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
          END;
        IF ((ADJPREC2.EORENFORM =NOFORM                            )
                                                      )
THEN IF
          ((ADJREC2.EFORMATION =NOFORMATION                       )
                                                      )
                                                       THEN
          BEGIN
          MAKET_ADJPrec(ADJPREC1);
          MAKET_ADJrec(ADJREC1);
          action35;
          action36;
          action37;
          action42;
          createMU1;
          previous1;
          LISTREE_emptytuple(tuple);
          Is1:=loopholes.retype(m1,LISTREE_pstree);
          LISTREE_addtotuple(Is1,tuple);
          LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
          END;
                                                              END;
                                                            END;
                                                          END;
                                                          END;
                                                       subrule0X1:=result
 END;
 FUNCTION subrule0X2 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitMU1_1,LrestMU1_1,LfirstMU1_1,LlastMU1_1:LSSTREE_prelnode;
iMU1_1:INTEGER;
nomoretreesMU1_1,lastmatchMU1_1:BOOLEAN;
FUNCTION MATCHCONDMU1:BOOLEAN;
BEGIN MATCHCONDMU1:=TRUE END;
  FUNCTION matchcondI1:BOOLEAN;
                                                        BEGIN
matchcondI1:=FALSE;
    IF
            (( NOT(T1^.CAT IN [POSSADJ]                                             
)                                                     )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

  END;{matchcondI1}
                                                          PROCEDURE matchlistMU1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_DETREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
          LSMATCHES_matchtreeConVar(Lfirst,Llast,first,DETREL,T1,match,matchcondI1,lastmatchMU1_1);
END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesMU1_1:=False;
        LfirstMU1_1:=NIL;
        SelectLfirstAndLlast(LfirstMU1_1,LlastMU1_1,LrestMU1_1
,nomoretreesMU1_1,L);
        IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
        IF NOT nomoretreesMU1_1 THEN
          BEGIN
          Match_DETREL(LfirstMU1_1,LlastMU1_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestMU1_1=NIL) AND ((LfirstMU1_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
        Match_DETREL(LfirstMU1_1,LlastMU1_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestMU1_1,FALSE,match);
      END;
    IF (LfirstMU1_1<>NIL) THEN match:=match AND (LlastMU1_1=Lfinal);
      IF match THEN IF NOT MatchcondMU1 THEN
        MatchList1Items(LrestMU1_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=DETREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(MU1.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(MU1.first,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  END;
  PROCEDURE createMU1;
  BEGIN{MU1}
  END{MU1};
                                                      PROCEDURE ACTION70;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION72;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION74;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION75;
BEGIN

END;
                                                      PROCEDURE ACTION76;
BEGIN

END;
                                                      PROCEDURE ACTION78;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION80;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION81;
BEGIN

END;
                                                      PROCEDURE ACTION86;
BEGIN
ADJPREC1.EORENFORM:=OMEGAFORM
                                                      ;
ADJREC1:=ADJREC2;                                     ;
ADJREC1.EORENFORM:=ADJPREC1.EORENFORM
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistMU1(MU1.first,MU1.last,match,TRUE);
  IF match THEN
    BEGIN
  IF ((NPREC1.DEFINITE IN [INDEF,
MENIGDEF]                                             )
                                                      )
THEN IF
          ((ADJREC2.EORENFORM =ADJPREC2.EORENFORM                 )
                                                      )
                                                       THEN
    BEGIN
    IF ((NOUNREC1.NUMBER =SINGULAR                             )
                                                      )
                                                       THEN
      BEGIN
      IF (([NEUTGENDER]                                           *NOUNREC1.GENDERS<>
[]                                                    )
                                                      )
THEN IF
          ((ADJPREC2.FORM<>SUPERLATIVE                            )
                                                      )
THEN IF
          ((ADJPREC2.EORENFORM =NOFORM                            )
                                                      )
                                                       THEN
        BEGIN
        MAKET_ADJPrec(ADJPREC1);
        MAKET_ADJrec(ADJREC1);
        action70;
        action76;
        action86;
        createMU1;
        previous1;
        LISTREE_emptytuple(tuple);
        Is1:=loopholes.retype(m1,LISTREE_pstree);
        LISTREE_addtotuple(Is1,tuple);
        LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
        END;
      IF (((([FEMGENDER,
MASCGENDER]                                            *NOUNREC1.GENDERS<>[]                                                    )
                                                      )
                                                      )
OR
          ((([NEUTGENDER]                                           *NOUNREC1.GENDERS<>
[]                                                    )
                                                      )
AND
          ((ADJPREC2.FORM =SUPERLATIVE                            )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        IF ((ADJPREC2.EORENFORM =EFORM                             )
                                                      )
THEN IF
          ((ADJREC2.EFORMATION<>NOFORMATION                       )
                                                      )
                                                       THEN
          BEGIN
          MAKET_ADJPrec(ADJPREC1);
          MAKET_ADJrec(ADJREC1);
          action72;
          action75;
          action76;
          action86;
          createMU1;
          previous1;
          LISTREE_emptytuple(tuple);
          Is1:=loopholes.retype(m1,LISTREE_pstree);
          LISTREE_addtotuple(Is1,tuple);
          LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
          END;
        IF ((ADJPREC2.EORENFORM =NOFORM                            )
                                                      )
THEN IF
          ((ADJREC2.EFORMATION =NOFORMATION                       )
                                                      )
                                                       THEN
          BEGIN
          MAKET_ADJPrec(ADJPREC1);
          MAKET_ADJrec(ADJREC1);
          action74;
          action75;
          action76;
          action86;
          createMU1;
          previous1;
          LISTREE_emptytuple(tuple);
          Is1:=loopholes.retype(m1,LISTREE_pstree);
          LISTREE_addtotuple(Is1,tuple);
          LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
          END;
                                                              END;
                                                            END;
    IF ((NOUNREC1.NUMBER =PLURAL                               )
                                                      )
                                                       THEN
      BEGIN
      IF ((ADJREC2.EFORMATION<>NOFORMATION                       )
                                                      )
THEN IF
          ((ADJPREC2.EORENFORM =EFORM                             )
                                                      )
                                                       THEN
        BEGIN
        MAKET_ADJPrec(ADJPREC1);
        MAKET_ADJrec(ADJREC1);
        action78;
        action81;
        action86;
        createMU1;
        previous1;
        LISTREE_emptytuple(tuple);
        Is1:=loopholes.retype(m1,LISTREE_pstree);
        LISTREE_addtotuple(Is1,tuple);
        LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
        END;
      IF ((ADJREC2.EFORMATION =NOFORMATION                       )
                                                      )
THEN IF
          ((ADJPREC2.EORENFORM =NOFORM                            )
                                                      )
                                                       THEN
        BEGIN
        MAKET_ADJPrec(ADJPREC1);
        MAKET_ADJrec(ADJREC1);
        action80;
        action81;
        action86;
        createMU1;
        previous1;
        LISTREE_emptytuple(tuple);
        Is1:=loopholes.retype(m1,LISTREE_pstree);
        LISTREE_addtotuple(Is1,tuple);
        LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                          END;
                                                       subrule0X2:=result
 END;
 FUNCTION subrule0X3 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitMU1_1,LrestMU1_1,LfirstMU1_1,LlastMU1_1:LSSTREE_prelnode;
iMU1_1:INTEGER;
nomoretreesMU1_1,lastmatchMU1_1:BOOLEAN;
LinitMU1_1_1,LrestMU1_1_1,LfirstMU1_1_1,LlastMU1_1_1:LSSTREE_prelnode;
iMU1_1_1:INTEGER;
nomoretreesMU1_1_1,lastmatchMU1_1_1:BOOLEAN;
LinitMU1_1_2,LrestMU1_1_2,LfirstMU1_1_2,LlastMU1_1_2:LSSTREE_prelnode;
iMU1_1_2:INTEGER;
nomoretreesMU1_1_2,lastmatchMU1_1_2:BOOLEAN;
 MU12:LSMRUQUO_ListOfStrees;
 DETREC1:LSDOMAINT_DETrecord;
 DETPREC2:LSDOMAINT_DETPrecord;
FUNCTION MATCHCONDMU1:BOOLEAN;
BEGIN MATCHCONDMU1:=TRUE END;
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
  PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>DET THEN
        match:=FALSE;
      IF match THEN
        DETREC1:=s^.ls^.DETfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      PROCEDURE Match_MU12(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU12.first:=Lfirst;
          MU12.last:=Llast;
          match:=TRUE;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU12(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU12(NIL,NIL,TRUE,match) ELSE BEGIN
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU12(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
      LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
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
                                                      FUNCTION EXIST2(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
Linit_1,Lrest_1,Lfirst_1,Llast_1:LSSTREE_prelnode;
i_1:INTEGER;
nomoretrees_1,lastmatch_1:BOOLEAN;
Linit_1_1,Lrest_1_1,Lfirst_1_1,Llast_1_1:LSSTREE_prelnode;
i_1_1:INTEGER;
nomoretrees_1_1,lastmatch_1_1:BOOLEAN;
Linit_1_1_1,Lrest_1_1_1,Lfirst_1_1_1,Llast_1_1_1:LSSTREE_prelnode;
i_1_1_1:INTEGER;
nomoretrees_1_1_1,lastmatch_1_1_1:BOOLEAN;
      Lfinal:LSSTREE_prelnode;
match:Boolean;
PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
      IF s^.ls^.cat<>DETP THEN
        match:=FALSE;
      IF match THEN
        DETPREC2:=s^.ls^.DETPfield^;
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
          IF s^.ls^.cat<>DET THEN
            match:=FALSE;
          IF match THEN
            DETREC1:=s^.ls^.DETfield^;
        END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          PROCEDURE Match_MU12(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          BEGIN{match}
            IF first THEN BEGIN
              MU12.first:=Lfirst;
              MU12.last:=Llast;
              match:=TRUE;
            END
            ELSE match:=FALSE
          END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU12(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU12(NIL,NIL,TRUE,match) ELSE BEGIN
Llast_1_1_1:=L;WHILE Llast_1_1_1^.brother<>NIL DO
Llast_1_1_1:=Llast_1_1_1^.brother;
match_MU12(L,Llast_1_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
          LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatch_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
Llast_1_1,Lfirst_1_1,Lrest_1_1,nomoretrees_1_1) END;
                                                      BEGIN{MatchTree}
              IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist1items,lastmatch_1) END;
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
                                                        BEGIN{Exist2}
    next:=mu.first;match:=False;Lfinal:=mu.last;
    IF next =NIL THEN
      EXIST2:=False
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND NOT(match) DO
      BEGIN
        matchlist1items(next,TRUE,match);
        next:=next^.brother;
      END;
      IF match = False THEN
        matchlist1items(next,TRUE,match);
      EXIST2:=match;
    END;
  END;{Exist}
                                                        BEGIN
matchcondI3:=FALSE;
    IF
            ((Exist1(MU13)                                          )
OR
          (Exist2(MU13)                                          )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

  END;{matchcondI3}
                                                          PROCEDURE matchlistMU1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_DETREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>DETP THEN
            match:=FALSE;
          IF match THEN
            DETPREC1:=s^.ls^.DETPfield^;
        END{MatchNode};
                                                              PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
          PROCEDURE Match_MU11(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          BEGIN{match}
            IF first THEN BEGIN
              MU11.first:=Lfirst;
              MU11.last:=Llast;
              match:=TRUE;
            END
            ELSE match:=FALSE
          END;
                                                                PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          VAR
            itemmatch,listmatch:Boolean;
          PROCEDURE Match_MU13(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          BEGIN{match}
            IF first THEN BEGIN
              MU13.first:=Lfirst;
              MU13.last:=Llast;
              match:= matchcondI3;
            END
            ELSE match:=FALSE
          END;
                                                      BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU13,matchlist0items,
LlastMU1_1_2,LfirstMU1_1_2,LrestMU1_1_2,nomoretreesMU1_1_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU11,matchlist1items,
LlastMU1_1_1,LfirstMU1_1_1,LrestMU1_1_1,nomoretreesMU1_1_1) END;
                                                      BEGIN{MatchTree}
          LSMATCHES_matchtree0rels(Lfirst,Llast,first,DETREL
,match,matchnode,matchlist2items,lastmatchMU1_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesMU1_1:=False;
        LfirstMU1_1:=NIL;
        SelectLfirstAndLlast(LfirstMU1_1,LlastMU1_1,LrestMU1_1
,nomoretreesMU1_1,L);
        IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
        IF NOT nomoretreesMU1_1 THEN
          BEGIN
          Match_DETREL(LfirstMU1_1,LlastMU1_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestMU1_1=NIL) AND ((LfirstMU1_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
        Match_DETREL(LfirstMU1_1,LlastMU1_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestMU1_1,FALSE,match);
      END;
    IF (LfirstMU1_1<>NIL) THEN match:=match AND (LlastMU1_1=Lfinal);
      IF match THEN IF NOT MatchcondMU1 THEN
        MatchList1Items(LrestMU1_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=DETREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(MU1.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(MU1.first,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  END;
  PROCEDURE createMU1;
  BEGIN{MU1}
  END{MU1};
                                                      PROCEDURE ACTION113;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION115;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION116;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION117;
BEGIN

END;
                                                      PROCEDURE ACTION118;
BEGIN

END;
                                                      PROCEDURE ACTION120;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION121;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION122;
BEGIN

END;
                                                      PROCEDURE ACTION127;
BEGIN
ADJPREC1.EORENFORM:=OMEGAFORM
                                                      ;
ADJREC1:=ADJREC2;                                     ;
ADJREC1.EORENFORM:=ADJPREC1.EORENFORM
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistMU1(MU1.first,MU1.last,match,TRUE);
  IF match THEN
    BEGIN
  IF ((NPREC1.DEFINITE IN [DEF,
ADEF]                                                 )
                                                      )
THEN IF
          ((ADJREC2.EORENFORM =ADJPREC2.EORENFORM                 )
                                                      )
                                                       THEN
    BEGIN
    IF ((NOUNREC1.NUMBER =SINGULAR                             )
                                                      )
                                                       THEN
      BEGIN
      IF (([NEUTGENDER]                                           *NOUNREC1.GENDERS<>
[]                                                    )
                                                      )
THEN IF
          ((DETREC1.EFORMATION =REGEFORMATION                     )
                                                      )
THEN IF
          ((ADJPREC2.FORM<>SUPERLATIVE                            )
                                                      )
THEN IF
          ((ADJPREC2.EORENFORM =NOFORM                            )
                                                      )
                                                       THEN
        BEGIN
        MAKET_ADJPrec(ADJPREC1);
        MAKET_ADJrec(ADJREC1);
        action113;
        action118;
        action127;
        createMU1;
        previous1;
        LISTREE_emptytuple(tuple);
        Is1:=loopholes.retype(m1,LISTREE_pstree);
        LISTREE_addtotuple(Is1,tuple);
        LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
        END;
      IF (((([FEMGENDER,
MASCGENDER]                                            *NOUNREC1.GENDERS<>[]                                                    )
                                                      )
                                                      )
OR
          ((([NEUTGENDER]                                           *NOUNREC1.GENDERS<>
[]                                                    )
                                                      )
AND
          ((ADJPREC2.FORM =SUPERLATIVE                            )
                                                      )
                                                      )
                                                      )
                                                       THEN
        BEGIN
        IF ((ADJPREC2.EORENFORM =EFORM                             )
                                                      )
THEN IF
          ((ADJREC2.EFORMATION<>NOFORMATION                       )
                                                      )
                                                       THEN
          BEGIN
          MAKET_ADJPrec(ADJPREC1);
          MAKET_ADJrec(ADJREC1);
          action115;
          action117;
          action118;
          action127;
          createMU1;
          previous1;
          LISTREE_emptytuple(tuple);
          Is1:=loopholes.retype(m1,LISTREE_pstree);
          LISTREE_addtotuple(Is1,tuple);
          LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
          END;
        IF ((ADJPREC2.EORENFORM =NOFORM                            )
                                                      )
THEN IF
          ((ADJREC2.EFORMATION =NOFORMATION                       )
                                                      )
                                                       THEN
          BEGIN
          MAKET_ADJPrec(ADJPREC1);
          MAKET_ADJrec(ADJREC1);
          action116;
          action117;
          action118;
          action127;
          createMU1;
          previous1;
          LISTREE_emptytuple(tuple);
          Is1:=loopholes.retype(m1,LISTREE_pstree);
          LISTREE_addtotuple(Is1,tuple);
          LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
          END;
                                                              END;
                                                            END;
    IF ((NOUNREC1.NUMBER =PLURAL                               )
                                                      )
                                                       THEN
      BEGIN
      IF ((ADJPREC2.EORENFORM =EFORM                             )
                                                      )
THEN IF
          ((ADJREC2.EFORMATION<>NOFORMATION                       )
                                                      )
                                                       THEN
        BEGIN
        MAKET_ADJPrec(ADJPREC1);
        MAKET_ADJrec(ADJREC1);
        action120;
        action122;
        action127;
        createMU1;
        previous1;
        LISTREE_emptytuple(tuple);
        Is1:=loopholes.retype(m1,LISTREE_pstree);
        LISTREE_addtotuple(Is1,tuple);
        LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
        END;
      IF ((ADJPREC2.EORENFORM =NOFORM                            )
                                                      )
THEN IF
          ((ADJREC2.EFORMATION =NOFORMATION                       )
                                                      )
                                                       THEN
        BEGIN
        MAKET_ADJPrec(ADJPREC1);
        MAKET_ADJrec(ADJREC1);
        action121;
        action122;
        action127;
        createMU1;
        previous1;
        LISTREE_emptytuple(tuple);
        Is1:=loopholes.retype(m1,LISTREE_pstree);
        LISTREE_addtotuple(Is1,tuple);
        LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                          END;
                                                       subrule0X3:=result
 END;
 FUNCTION subrule0X4 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitMU1_1,LrestMU1_1,LfirstMU1_1,LlastMU1_1:LSSTREE_prelnode;
iMU1_1:INTEGER;
nomoretreesMU1_1,lastmatchMU1_1:BOOLEAN;
LinitMU1_1_1,LrestMU1_1_1,LfirstMU1_1_1,LlastMU1_1_1:LSSTREE_prelnode;
iMU1_1_1:INTEGER;
nomoretreesMU1_1_1,lastmatchMU1_1_1:BOOLEAN;
LinitMU1_1_2,LrestMU1_1_2,LfirstMU1_1_2,LlastMU1_1_2:LSSTREE_prelnode;
iMU1_1_2:INTEGER;
nomoretreesMU1_1_2,lastmatchMU1_1_2:BOOLEAN;
 ARTREC1tree:LSSTREE_pStree;
 DEMADJREC1tree:LSSTREE_pStree;
 MU13:LSMRUQUO_ListOfStrees;
 MU14:LSMRUQUO_ListOfStrees;
 MU15:LSMRUQUO_ListOfStrees;
 ARTREC1:LSDOMAINT_ARTrecord;
 DETPREC2:LSDOMAINT_DETPrecord;
 DEMADJREC1:LSDOMAINT_DEMADJrecord;
 POSSADJREC1:LSDOMAINT_POSSADJrecord;
 NPREC3:LSDOMAINT_NPrecord;
FUNCTION MATCHCONDMU1:BOOLEAN;
BEGIN MATCHCONDMU1:=TRUE END;
  FUNCTION matchcondI14:BOOLEAN;
                                                        BEGIN
matchcondI14:=FALSE;
    IF
            ((GENITIVE IN NPREC3.CASES                              )
                                                      )
                                                      THEN 
matchcondI14:=TRUE;

  END;{matchcondI14}
  FUNCTION matchcondI13:BOOLEAN;
                                                        BEGIN
matchcondI13:=FALSE;
    IF
            ((ARTREC1.DEFINITE =DEF                                 )
                                                      )
                                                      THEN 
matchcondI13:=TRUE;

  END;{matchcondI13}
  FUNCTION matchcondI3:BOOLEAN;
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
      IF s^.ls^.cat<>ART THEN
        match:=FALSE;
      IF match THEN
        ARTREC1:=s^.ls^.ARTfield^;
      IF match THEN
        match:= matchcondI13;
    END{MatchNode};
                                                      BEGIN{MatchTree}
            ARTREC1tree:=Lfirst^.node;
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
                                                      FUNCTION EXIST2(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
Linit_1,Lrest_1,Lfirst_1,Llast_1:LSSTREE_prelnode;
i_1:INTEGER;
nomoretrees_1,lastmatch_1:BOOLEAN;
Linit_1_1,Lrest_1_1,Lfirst_1_1,Llast_1_1:LSSTREE_prelnode;
i_1_1:INTEGER;
nomoretrees_1_1,lastmatch_1_1:BOOLEAN;
Linit_1_2,Lrest_1_2,Lfirst_1_2,Llast_1_2:LSSTREE_prelnode;
i_1_2:INTEGER;
nomoretrees_1_2,lastmatch_1_2:BOOLEAN;
      Lfinal:LSSTREE_prelnode;
match:Boolean;
PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
      IF s^.ls^.cat<>DETP THEN
        match:=FALSE;
      IF match THEN
        DETPREC2:=s^.ls^.DETPfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      PROCEDURE Match_MU13(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU13.first:=Lfirst;
          MU13.last:=Llast;
          match:=TRUE;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU13(Lfirst,Llast,TRUE,match);
END;
      PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>ART THEN
            match:=FALSE;
          IF match THEN
            ARTREC1:=s^.ls^.ARTfield^;
          IF match THEN
            match:= matchcondI13;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    ARTREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatch_1_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,Lfirst_1_1,Llast_1_1
,item2,Lfirst_1_2,Llast_1_2
) ELSE match_HEAD(Lfirst_1_2,Lfirst_1_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
              IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist2items,lastmatch_1) END;
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
                                                        BEGIN{Exist2}
    next:=mu.first;match:=False;Lfinal:=mu.last;
    IF next =NIL THEN
      EXIST2:=False
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND NOT(match) DO
      BEGIN
        matchlist1items(next,TRUE,match);
        next:=next^.brother;
      END;
      IF match = False THEN
        matchlist1items(next,TRUE,match);
      EXIST2:=match;
    END;
  END;{Exist}
                                                      FUNCTION EXIST3(mu:LSMRUQUO_ListOfStrees):Boolean;
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
      IF s^.ls^.cat<>DEMADJ THEN
        match:=FALSE;
      IF match THEN
        DEMADJREC1:=s^.ls^.DEMADJfield^;
    END{MatchNode};
                                                      BEGIN{MatchTree}
            DEMADJREC1tree:=Lfirst^.node;
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
                                                        BEGIN{Exist3}
    next:=mu.first;match:=False;Lfinal:=mu.last;
    IF next =NIL THEN
      EXIST3:=False
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND NOT(match) DO
      BEGIN
        matchlist1items(next,TRUE,match);
        next:=next^.brother;
      END;
      IF match = False THEN
        matchlist1items(next,TRUE,match);
      EXIST3:=match;
    END;
  END;{Exist}
                                                      FUNCTION EXIST4(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
Linit_1,Lrest_1,Lfirst_1,Llast_1:LSSTREE_prelnode;
i_1:INTEGER;
nomoretrees_1,lastmatch_1:BOOLEAN;
Linit_1_1,Lrest_1_1,Lfirst_1_1,Llast_1_1:LSSTREE_prelnode;
i_1_1:INTEGER;
nomoretrees_1_1,lastmatch_1_1:BOOLEAN;
Linit_1_2,Lrest_1_2,Lfirst_1_2,Llast_1_2:LSSTREE_prelnode;
i_1_2:INTEGER;
nomoretrees_1_2,lastmatch_1_2:BOOLEAN;
      Lfinal:LSSTREE_prelnode;
match:Boolean;
PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
      IF s^.ls^.cat<>DETP THEN
        match:=FALSE;
      IF match THEN
        DETPREC2:=s^.ls^.DETPfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      PROCEDURE Match_MU13(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU13.first:=Lfirst;
          MU13.last:=Llast;
          match:=TRUE;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU13(Lfirst,Llast,TRUE,match);
END;
      PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>DEMADJ THEN
            match:=FALSE;
          IF match THEN
            DEMADJREC1:=s^.ls^.DEMADJfield^;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    DEMADJREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatch_1_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,Lfirst_1_1,Llast_1_1
,item2,Lfirst_1_2,Llast_1_2
) ELSE match_HEAD(Lfirst_1_2,Lfirst_1_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
              IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist2items,lastmatch_1) END;
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
                                                        BEGIN{Exist4}
    next:=mu.first;match:=False;Lfinal:=mu.last;
    IF next =NIL THEN
      EXIST4:=False
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND NOT(match) DO
      BEGIN
        matchlist1items(next,TRUE,match);
        next:=next^.brother;
      END;
      IF match = False THEN
        matchlist1items(next,TRUE,match);
      EXIST4:=match;
    END;
  END;{Exist}
                                                      FUNCTION EXIST5(mu:LSMRUQUO_ListOfStrees):Boolean;
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
  PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>POSSADJ THEN
        match:=FALSE;
      IF match THEN
        POSSADJREC1:=s^.ls^.POSSADJfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      PROCEDURE Match_MU14(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU14.first:=Lfirst;
          MU14.last:=Llast;
          match:=TRUE;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU14(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU14(NIL,NIL,TRUE,match) ELSE BEGIN
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU14(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
      LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
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
                                                        BEGIN{Exist5}
    next:=mu.first;match:=False;Lfinal:=mu.last;
    IF next =NIL THEN
      EXIST5:=False
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND NOT(match) DO
      BEGIN
        matchlist1items(next,TRUE,match);
        next:=next^.brother;
      END;
      IF match = False THEN
        matchlist1items(next,TRUE,match);
      EXIST5:=match;
    END;
  END;{Exist}
                                                      FUNCTION EXIST6(mu:LSMRUQUO_ListOfStrees):Boolean;
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
  PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>NP THEN
        match:=FALSE;
      IF match THEN
        NPREC3:=s^.ls^.NPfield^;
      IF match THEN
        match:= matchcondI14;
    END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      PROCEDURE Match_MU15(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU15.first:=Lfirst;
          MU15.last:=Llast;
          match:=TRUE;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU15(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU15(NIL,NIL,TRUE,match) ELSE BEGIN
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU15(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
      LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
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
                                                        BEGIN{Exist6}
    next:=mu.first;match:=False;Lfinal:=mu.last;
    IF next =NIL THEN
      EXIST6:=False
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND NOT(match) DO
      BEGIN
        matchlist1items(next,TRUE,match);
        next:=next^.brother;
      END;
      IF match = False THEN
        matchlist1items(next,TRUE,match);
      EXIST6:=match;
    END;
  END;{Exist}
                                                        BEGIN
matchcondI3:=FALSE;
    IF
            ((Exist1(MU12)                                          )
OR
          (Exist2(MU12)                                          )
OR
          (Exist3(MU12)                                          )
OR
          (Exist4(MU12)                                          )
OR
          (Exist5(MU12)                                          )
OR
          (Exist6(MU12)                                          )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

  END;{matchcondI3}
                                                          PROCEDURE matchlistMU1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_DETREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>DETP THEN
            match:=FALSE;
          IF match THEN
            DETPREC1:=s^.ls^.DETPfield^;
        END{MatchNode};
                                                              PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
          PROCEDURE Match_MU11(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          BEGIN{match}
            IF first THEN BEGIN
              MU11.first:=Lfirst;
              MU11.last:=Llast;
              match:=TRUE;
            END
            ELSE match:=FALSE
          END;
                                                                PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          VAR
            itemmatch,listmatch:Boolean;
          PROCEDURE Match_MU12(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          BEGIN{match}
            IF first THEN BEGIN
              MU12.first:=Lfirst;
              MU12.last:=Llast;
              match:= matchcondI3;
            END
            ELSE match:=FALSE
          END;
                                                      BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU12,matchlist0items,
LlastMU1_1_2,LfirstMU1_1_2,LrestMU1_1_2,nomoretreesMU1_1_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU11,matchlist1items,
LlastMU1_1_1,LfirstMU1_1_1,LrestMU1_1_1,nomoretreesMU1_1_1) END;
                                                      BEGIN{MatchTree}
          LSMATCHES_matchtree0rels(Lfirst,Llast,first,DETREL
,match,matchnode,matchlist2items,lastmatchMU1_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesMU1_1:=False;
        LfirstMU1_1:=NIL;
        SelectLfirstAndLlast(LfirstMU1_1,LlastMU1_1,LrestMU1_1
,nomoretreesMU1_1,L);
        IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
        IF NOT nomoretreesMU1_1 THEN
          BEGIN
          Match_DETREL(LfirstMU1_1,LlastMU1_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestMU1_1=NIL) AND ((LfirstMU1_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
        Match_DETREL(LfirstMU1_1,LlastMU1_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestMU1_1,FALSE,match);
      END;
    IF (LfirstMU1_1<>NIL) THEN match:=match AND (LlastMU1_1=Lfinal);
      IF match THEN IF NOT MatchcondMU1 THEN
        MatchList1Items(LrestMU1_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=DETREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(MU1.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(MU1.first,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  END;
  PROCEDURE createMU1;
  BEGIN{MU1}
  END{MU1};
                                                      PROCEDURE ACTION140;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION141;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION146;
BEGIN
ADJPREC1.EORENFORM:=OMEGAFORM
                                                      ;
ADJREC1:=ADJREC2;                                     ;
ADJREC1.EORENFORM:=ADJPREC1.EORENFORM
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistMU1(MU1.first,MU1.last,match,TRUE);
  IF match THEN
    BEGIN
  IF ((ADJREC2.EORENFORM =ADJPREC2.EORENFORM                 )
                                                      )
THEN IF
          ((NPREC1.DEFINITE IN [DEF,
ADEF]                                                 )
                                                      )
                                                       THEN
    BEGIN
    IF ((ADJPREC2.EORENFORM =EFORM                             )
                                                      )
THEN IF
          ((ADJREC2.EFORMATION<>NOFORMATION                       )
                                                      )
                                                       THEN
      BEGIN
      MAKET_ADJPrec(ADJPREC1);
      MAKET_ADJrec(ADJREC1);
      action140;
      action146;
      createMU1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((ADJPREC2.EORENFORM =NOFORM                            )
                                                      )
THEN IF
          ((ADJREC2.EFORMATION =NOFORMATION                       )
                                                      )
                                                       THEN
      BEGIN
      MAKET_ADJPrec(ADJPREC1);
      MAKET_ADJrec(ADJREC1);
      action141;
      action146;
      createMU1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X4:=result
 END;
 FUNCTION subrule0X5 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitMU1_1,LrestMU1_1,LfirstMU1_1,LlastMU1_1:LSSTREE_prelnode;
iMU1_1:INTEGER;
nomoretreesMU1_1,lastmatchMU1_1:BOOLEAN;
LinitMU1_1_1,LrestMU1_1_1,LfirstMU1_1_1,LlastMU1_1_1:LSSTREE_prelnode;
iMU1_1_1:INTEGER;
nomoretreesMU1_1_1,lastmatchMU1_1_1:BOOLEAN;
FUNCTION MATCHCONDMU1:BOOLEAN;
BEGIN MATCHCONDMU1:=TRUE END;
                                                          PROCEDURE matchlistMU1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_DETREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>POSSADJ THEN
            match:=FALSE;
          IF match THEN
            POSSADJREC1:=s^.ls^.POSSADJfield^;
        END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          PROCEDURE Match_MU11(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          BEGIN{match}
            IF first THEN BEGIN
              MU11.first:=Lfirst;
              MU11.last:=Llast;
              match:=TRUE;
            END
            ELSE match:=FALSE
          END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU11(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU11(NIL,NIL,TRUE,match) ELSE BEGIN
LlastMU1_1_1:=L;WHILE LlastMU1_1_1^.brother<>NIL DO
LlastMU1_1_1:=LlastMU1_1_1^.brother;
match_MU11(L,LlastMU1_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
          LSMATCHES_matchtree0rels(Lfirst,Llast,first,DETREL
,match,matchnode,matchlist1items,lastmatchMU1_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesMU1_1:=False;
        LfirstMU1_1:=NIL;
        SelectLfirstAndLlast(LfirstMU1_1,LlastMU1_1,LrestMU1_1
,nomoretreesMU1_1,L);
        IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
        IF NOT nomoretreesMU1_1 THEN
          BEGIN
          Match_DETREL(LfirstMU1_1,LlastMU1_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestMU1_1=NIL) AND ((LfirstMU1_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
        Match_DETREL(LfirstMU1_1,LlastMU1_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestMU1_1,FALSE,match);
      END;
    IF (LfirstMU1_1<>NIL) THEN match:=match AND (LlastMU1_1=Lfinal);
      IF match THEN IF NOT MatchcondMU1 THEN
        MatchList1Items(LrestMU1_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=DETREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(MU1.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(MU1.first,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  END;
  PROCEDURE createMU1;
  BEGIN{MU1}
  END{MU1};
                                                      PROCEDURE ACTION160;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION161;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION166;
BEGIN
ADJPREC1.EORENFORM:=OMEGAFORM
                                                      ;
ADJREC1:=ADJREC2;                                     ;
ADJREC1.EORENFORM:=ADJPREC1.EORENFORM
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistMU1(MU1.first,MU1.last,match,TRUE);
  IF match THEN
    BEGIN
  IF ((ADJREC2.EORENFORM =ADJPREC2.EORENFORM                 )
                                                      )
THEN IF
          ((NPREC1.DEFINITE IN [INDEF,
DEF]                                                  )
                                                      )
                                                       THEN
    BEGIN
    IF ((ADJPREC2.EORENFORM =EFORM                             )
                                                      )
THEN IF
          ((ADJREC2.EFORMATION<>NOFORMATION                       )
                                                      )
                                                       THEN
      BEGIN
      MAKET_ADJPrec(ADJPREC1);
      MAKET_ADJrec(ADJREC1);
      action160;
      action166;
      createMU1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((ADJPREC2.EORENFORM =NOFORM                            )
                                                      )
THEN IF
          ((ADJREC2.EFORMATION =NOFORMATION                       )
                                                      )
                                                       THEN
      BEGIN
      MAKET_ADJPrec(ADJPREC1);
      MAKET_ADJrec(ADJREC1);
      action161;
      action166;
      createMU1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X5:=result
 END;
 FUNCTION subrule0X6 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitMU1_1,LrestMU1_1,LfirstMU1_1,LlastMU1_1:LSSTREE_prelnode;
iMU1_1:INTEGER;
nomoretreesMU1_1,lastmatchMU1_1:BOOLEAN;
LinitMU1_1_1,LrestMU1_1_1,LfirstMU1_1_1,LlastMU1_1_1:LSSTREE_prelnode;
iMU1_1_1:INTEGER;
nomoretreesMU1_1_1,lastmatchMU1_1_1:BOOLEAN;
FUNCTION MATCHCONDMU1:BOOLEAN;
BEGIN MATCHCONDMU1:=TRUE END;
                                                          PROCEDURE matchlistMU1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_DETREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>NP THEN
            match:=FALSE;
          IF match THEN
            NPREC8:=s^.ls^.NPfield^;
        END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          PROCEDURE Match_MU11(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          BEGIN{match}
            IF first THEN BEGIN
              MU11.first:=Lfirst;
              MU11.last:=Llast;
              match:=TRUE;
            END
            ELSE match:=FALSE
          END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU11(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU11(NIL,NIL,TRUE,match) ELSE BEGIN
LlastMU1_1_1:=L;WHILE LlastMU1_1_1^.brother<>NIL DO
LlastMU1_1_1:=LlastMU1_1_1^.brother;
match_MU11(L,LlastMU1_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
          LSMATCHES_matchtree0rels(Lfirst,Llast,first,DETREL
,match,matchnode,matchlist1items,lastmatchMU1_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesMU1_1:=False;
        LfirstMU1_1:=NIL;
        SelectLfirstAndLlast(LfirstMU1_1,LlastMU1_1,LrestMU1_1
,nomoretreesMU1_1,L);
        IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
        IF NOT nomoretreesMU1_1 THEN
          BEGIN
          Match_DETREL(LfirstMU1_1,LlastMU1_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestMU1_1=NIL) AND ((LfirstMU1_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
        Match_DETREL(LfirstMU1_1,LlastMU1_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestMU1_1,FALSE,match);
      END;
    IF (LfirstMU1_1<>NIL) THEN match:=match AND (LlastMU1_1=Lfinal);
      IF match THEN IF NOT MatchcondMU1 THEN
        MatchList1Items(LrestMU1_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=DETREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(MU1.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(MU1.first,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  END;
  PROCEDURE createMU1;
  BEGIN{MU1}
  END{MU1};
                                                      PROCEDURE ACTION180;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION181;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION186;
BEGIN
ADJPREC1.EORENFORM:=OMEGAFORM
                                                      ;
ADJREC1:=ADJREC2;                                     ;
ADJREC1.EORENFORM:=ADJPREC1.EORENFORM
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistMU1(MU1.first,MU1.last,match,TRUE);
  IF match THEN
    BEGIN
  IF ((ADJREC2.EORENFORM =ADJPREC2.EORENFORM                 )
                                                      )
THEN IF
          ((NPREC1.DEFINITE IN [DEF]                                                 )
                                                      )
THEN IF
          ((NPREC8.CASES =[GENITIVE]                                            )
                                                      )
                                                       THEN
    BEGIN
    IF ((ADJPREC2.EORENFORM =EFORM                             )
                                                      )
THEN IF
          ((ADJREC2.EFORMATION<>NOFORMATION                       )
                                                      )
                                                       THEN
      BEGIN
      MAKET_ADJPrec(ADJPREC1);
      MAKET_ADJrec(ADJREC1);
      action180;
      action186;
      createMU1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((ADJPREC2.EORENFORM =NOFORM                            )
                                                      )
THEN IF
          ((ADJREC2.EFORMATION =NOFORMATION                       )
                                                      )
                                                       THEN
      BEGIN
      MAKET_ADJPrec(ADJPREC1);
      MAKET_ADJrec(ADJREC1);
      action181;
      action186;
      createMU1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                          END;
                                                       subrule0X6:=result
 END;
                                                      BEGIN
m:=loopholes.retype(Is,LSSTREE_pstree);
LISTREE_InitSetOfTupleOfStrees(result);
match:=TRUE;
first:=TRUE;
WHILE match DO BEGIN
matchmodel(m,first,match);
first:=FALSE;
  If match Then
  WHILE match AND NOT matchcondM DO
  BEGIN
  MatchModel(m,FALSE,match);
  END;
IF match THEN
 BEGIN
  LISTREE_mergesetsoftuplestrees(subrule0X1,result);
  LISTREE_mergesetsoftuplestrees(subrule0X2,result);
  LISTREE_mergesetsoftuplestrees(subrule0X3,result);
  LISTREE_mergesetsoftuplestrees(subrule0X4,result);
  LISTREE_mergesetsoftuplestrees(subrule0X5,result);
  LISTREE_mergesetsoftuplestrees(subrule0X6,result);
 END;
END;{WHILE}
DECTNPASSIGNEFORM1:=result
END;
{:TNPASSIGNEFORM1}
{rule:}
{:TNPASSIGNEFORM2}
 FUNCTION DECTNPASSIGNEFORM2(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
LinitM_2_2_1,LrestM_2_2_1,LfirstM_2_2_1,LlastM_2_2_1:LSSTREE_prelnode;
iM_2_2_1:INTEGER;
nomoretreesM_2_2_1,lastmatchM_2_2_1:BOOLEAN;
LinitM_2_2_2,LrestM_2_2_2,LfirstM_2_2_2,LlastM_2_2_2:LSSTREE_prelnode;
iM_2_2_2:INTEGER;
nomoretreesM_2_2_2,lastmatchM_2_2_2:BOOLEAN;
LinitM_2_2_2_1,LrestM_2_2_2_1,LfirstM_2_2_2_1,LlastM_2_2_2_1:LSSTREE_prelnode;
iM_2_2_2_1:INTEGER;
nomoretreesM_2_2_2_1,lastmatchM_2_2_2_1:BOOLEAN;
LinitM_2_3,LrestM_2_3,LfirstM_2_3,LlastM_2_3:LSSTREE_prelnode;
iM_2_3:INTEGER;
nomoretreesM_2_3,lastmatchM_2_3:BOOLEAN;
LinitM_2_4,LrestM_2_4,LfirstM_2_4,LlastM_2_4:LSSTREE_prelnode;
iM_2_4:INTEGER;
nomoretreesM_2_4,lastmatchM_2_4:BOOLEAN;
LinitM_2_5,LrestM_2_5,LfirstM_2_5,LlastM_2_5:LSSTREE_prelnode;
iM_2_5:INTEGER;
nomoretreesM_2_5,lastmatchM_2_5:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
ENREC1tree:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU8:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
MU7:LSMRUQUO_ListOfStrees;
ADJREC1:LSDOMAINT_ADJrecord;
ADJPREC1:LSDOMAINT_ADJPrecord;
ENREC1:LSDOMAINT_ENrecord;
ADJREC2:LSDOMAINT_ADJrecord;
ADJPREC2:LSDOMAINT_ADJPrecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
FUNCTION matchcondM1:BOOLEAN;
BEGIN
  matchcondM1:= TRUE
END;{matchcondM1}
FUNCTION matchcondM:BOOLEAN;
BEGIN
  matchcondM:= TRUE
END;{matchcondM}
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
        N^.ls^.cat := CN;
        N^.ls^.CNfield^ := CNREC1;
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
      PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMODREL(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := ADJP;
            N^.ls^.ADJPfield^ := ADJPREC1;
          END{CreateNode};
                                                                PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          VAR list:LSMRUQUO_ListOfStrees;
          PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createMU3(VAR list:LSMRUQUO_ListOfStrees);
            BEGIN{MU3}
            copylist(MU3,list);
            END{MU3};
                                                                BEGIN{createitem21}
          createMU3(list);
          END;
          PROCEDURE createitem22(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
            VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
             list1:LSMRUQUO_ListOfStrees;
              PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
              BEGIN{CreateNode}
                N^.ls^.cat := ADJ;
                N^.ls^.ADJfield^ := ADJREC1;
              END{CreateNode};
                                                                    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
              VAR list:LSMRUQUO_ListOfStrees;
              PROCEDURE createitem31(VAR list:LSMRUQUO_ListOfStrees);
                PROCEDURE createMU8(VAR list:LSMRUQUO_ListOfStrees);
                BEGIN{MU8}
                copylist(MU8,list);
                END{MU8};
                                                                    BEGIN{createitem31}
              createMU8(list);
              END;
              BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem31);
              END{createlist1};
                                                                  BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,ADJ,createnode,createlist1);
            END{HEAD};
                                                                BEGIN{createitem22}
          createHEAD(list);
          END;
          BEGIN{createlist1}
LSMATCHES_createlist2items01(wholelist,createitem21,createitem22);
          END{createlist1};
                                                              BEGIN{MODREL}
LSMATCHES_createitem(list,MODREL,ADJP,createnode,createlist1);
        END{MODREL};
                                                            BEGIN{createitem12}
      createMODREL(list);
      END;
      PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU4(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU4}
        copylist(MU4,list);
        END{MU4};
                                                            BEGIN{createitem13}
      createMU4(list);
      END;
      PROCEDURE createitem14(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := EN;
            N^.ls^.ENfield^ := ENREC1;
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
s:=ENREC1tree;
        relnode^.node:=s;
        END{HEAD};
                                                            BEGIN{createitem14}
      createHEAD(list);
      END;
      PROCEDURE createitem15(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU6(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU6}
        copylist(MU6,list);
        END{MU6};
                                                            BEGIN{createitem15}
      createMU6(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist4items0101(wholelist,createitem11,createitem12,createitem13,createitem14);
      createitem15(list);
      IF list.first<>NIL THEN
        BEGIN
        wholelist.last^.brother:=list.first;
        wholelist.last:=list.last;
        END;
      END{createlist1};
                                                          BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,CN,createnode,createlist1);
    END{HEAD};
                                                        BEGIN{createitem12}
  createHEAD(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU7(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU7}
    copylist(MU7,list);
    END{MU7};
                                                        BEGIN{createitem13}
  createMU7(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(NP);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      lirel2:LIDOMAINT_synrel;
      lsrel2:LSDOMAINT_synrel;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>CN THEN
          match:=FALSE;
        IF match THEN
          CNREC1:=s^.ls^.CNfield^;
      END{MatchNode};
                                                            PROCEDURE MatchList5Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
        PROCEDURE Match_MU2(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU2.first:=Lfirst;
            MU2.last:=Llast;
            match:=TRUE;
          END
          ELSE match:=FALSE
        END;
                                                              PROCEDURE MatchList4Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
        PROCEDURE Match_MODREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR matchcond:BOOLEAN;
          Stree:LSSTREE_pStree;
          lisons:LISTREE_pRelnode;
          lirel1:LIDOMAINT_synrel;
          lsrel1:LSDOMAINT_synrel;
          PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
          BEGIN{MatchNode}
            IF s^.ls^.cat<>ADJP THEN
              match:=FALSE;
            IF match THEN
              ADJPREC2:=s^.ls^.ADJPfield^;
          END{MatchNode};
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            PROCEDURE Match_MU3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            BEGIN{match}
              IF first THEN BEGIN
                MU3.first:=Lfirst;
                MU3.last:=Llast;
                match:=TRUE;
              END
              ELSE match:=FALSE
            END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU3(Lfirst,Llast,TRUE,match);
END;
            PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            VAR matchcond:BOOLEAN;
              Stree:LSSTREE_pStree;
              lisons:LISTREE_pRelnode;
              PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
              BEGIN{MatchNode}
                IF s^.ls^.cat<>ADJ THEN
                  match:=FALSE;
                IF match THEN
                  ADJREC2:=s^.ls^.ADJfield^;
              END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
                PROCEDURE Match_MU8(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
                BEGIN{match}
                  IF first THEN BEGIN
                    MU8.first:=Lfirst;
                    MU8.last:=Llast;
                    match:=TRUE;
                  END
                  ELSE match:=FALSE
                END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU8(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU8(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM_2_2_2_1:=L;WHILE LlastM_2_2_2_1^.brother<>NIL DO
LlastM_2_2_2_1:=LlastM_2_2_2_1^.brother;
match_MU8(L,LlastM_2_2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
                LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_2_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM_2_2_1,LlastM_2_2_1
,item2,LfirstM_2_2_2,LlastM_2_2_2
) ELSE match_HEAD(LfirstM_2_2_2,LfirstM_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,MODREL
,HEAD,match,matchnode,matchlist2items,lastmatchM_2_2) END;
                                                                PROCEDURE MatchList3Items
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
            IF s^.ls^.cat<>EN THEN
              match:=FALSE;
            IF match THEN
              ENREC1:=s^.ls^.ENfield^;
          END{MatchNode};
                                                      BEGIN{MatchTree}
                        ENREC1tree:=Lfirst^.node;
              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchM_2_4) END;
                                                                    PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
              VAR
                itemmatch,listmatch:Boolean;
        PROCEDURE Match_MU6(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU6.first:=Lfirst;
            MU6.last:=Llast;
            match:=TRUE;
          END
          ELSE match:=FALSE
        END;
                                                      BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU6,matchlist0items,
LlastM_2_5,LfirstM_2_5,LrestM_2_5,nomoretreesM_2_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM_2_4,LfirstM_2_4,LrestM_2_4,nomoretreesM_2_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU4,matchlist2items,
LlastM_2_3,LfirstM_2_3,LrestM_2_3,nomoretreesM_2_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_MODREL,matchlist3items,
LlastM_2_2,LfirstM_2_2,LrestM_2_2,nomoretreesM_2_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU2,matchlist4items,
LlastM_2_1,LfirstM_2_1,LrestM_2_1,nomoretreesM_2_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=2)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree2rels(Lfirst,Llast,first,HEAD
,MODREL,HEAD,match,matchnode,matchlist5items,lastmatchM_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_MU7(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU7.first:=Lfirst;
        MU7.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU7(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM_1,LlastM_1
,HEAD,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
) ELSE match_HEAD(LfirstM_2,LfirstM_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
                                                      PROCEDURE ACTION11;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION12;
BEGIN
ADJPREC1:=ADJPREC2;                                   ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION17;
BEGIN
ADJREC1:=ADJREC2;                                     ;
ADJPREC1.EORENFORM:=OMEGAFORM
                                                      ;
ADJREC1.EORENFORM:=ADJPREC1.EORENFORM
                                                      
END;
                                                      BEGIN
m:=loopholes.retype(Is,LSSTREE_pstree);
LISTREE_InitSetOfTupleOfStrees(result);
match:=TRUE;
first:=TRUE;
WHILE match DO BEGIN
matchmodel(m,first,match);
first:=FALSE;
  If match Then
  WHILE match AND NOT matchcondM DO
  BEGIN
  MatchModel(m,FALSE,match);
  END;
IF match THEN
 BEGIN
 END;
IF match THEN
  BEGIN
IF ((ADJREC2.EORENFORM =ADJPREC2.EORENFORM                 )
                                                      )
                                                       THEN
  BEGIN
  IF ((ADJPREC2.EORENFORM =EFORM                             )
                                                      )
THEN IF
          ((ADJREC2.EFORMATION<>NOFORMATION                       )
                                                      )
                                                       THEN
    BEGIN
    MAKET_ADJPrec(ADJPREC1);
    MAKET_ADJrec(ADJREC1);
    action11;
    action17;
    createM1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
    END;
  IF ((ADJPREC2.EORENFORM =NOFORM                            )
                                                      )
THEN IF
          ((ADJREC2.EFORMATION =NOFORMATION                       )
                                                      )
                                                       THEN
    BEGIN
    MAKET_ADJPrec(ADJPREC1);
    MAKET_ADJrec(ADJREC1);
    action12;
    action17;
    createM1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
    END;
                                                        END;
                                                        END;
                                                      END;{WHILE}
DECTNPASSIGNEFORM2:=result
END;
{:TNPASSIGNEFORM2}
{rule:}
{:TNPASSIGNEFORM3}
 FUNCTION DECTNPASSIGNEFORM3(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
LinitM_2_2_1,LrestM_2_2_1,LfirstM_2_2_1,LlastM_2_2_1:LSSTREE_prelnode;
iM_2_2_1:INTEGER;
nomoretreesM_2_2_1,lastmatchM_2_2_1:BOOLEAN;
LinitM_2_2_2,LrestM_2_2_2,LfirstM_2_2_2,LlastM_2_2_2:LSSTREE_prelnode;
iM_2_2_2:INTEGER;
nomoretreesM_2_2_2,lastmatchM_2_2_2:BOOLEAN;
LinitM_2_2_2_1,LrestM_2_2_2_1,LfirstM_2_2_2_1,LlastM_2_2_2_1:LSSTREE_prelnode;
iM_2_2_2_1:INTEGER;
nomoretreesM_2_2_2_1,lastmatchM_2_2_2_1:BOOLEAN;
LinitM_2_2_2_2,LrestM_2_2_2_2,LfirstM_2_2_2_2,LlastM_2_2_2_2:LSSTREE_prelnode;
iM_2_2_2_2:INTEGER;
nomoretreesM_2_2_2_2,lastmatchM_2_2_2_2:BOOLEAN;
LinitM_2_2_2_2_1,LrestM_2_2_2_2_1,LfirstM_2_2_2_2_1,LlastM_2_2_2_2_1:LSSTREE_prelnode;
iM_2_2_2_2_1:INTEGER;
nomoretreesM_2_2_2_2_1,lastmatchM_2_2_2_2_1:BOOLEAN;
LinitM_2_3,LrestM_2_3,LfirstM_2_3,LlastM_2_3:LSSTREE_prelnode;
iM_2_3:INTEGER;
nomoretreesM_2_3,lastmatchM_2_3:BOOLEAN;
LinitM_2_4,LrestM_2_4,LfirstM_2_4,LlastM_2_4:LSSTREE_prelnode;
iM_2_4:INTEGER;
nomoretreesM_2_4,lastmatchM_2_4:BOOLEAN;
LinitM_2_4_1,LrestM_2_4_1,LfirstM_2_4_1,LlastM_2_4_1:LSSTREE_prelnode;
iM_2_4_1:INTEGER;
nomoretreesM_2_4_1,lastmatchM_2_4_1:BOOLEAN;
LinitM_2_5,LrestM_2_5,LfirstM_2_5,LlastM_2_5:LSSTREE_prelnode;
iM_2_5:INTEGER;
nomoretreesM_2_5,lastmatchM_2_5:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
T1:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU8:LSMRUQUO_ListOfStrees;
MU9:LSMRUQUO_ListOfStrees;
MU10:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
MU7:LSMRUQUO_ListOfStrees;
MU11:LSMRUQUO_ListOfStrees;
MU12:LSMRUQUO_ListOfStrees;
VERBREC1:LSDOMAINT_VERBrecord;
POSSADJREC1:LSDOMAINT_POSSADJrecord;
DETREC1:LSDOMAINT_DETrecord;
DETPREC1:LSDOMAINT_DETPrecord;
NOUNREC1:LSDOMAINT_NOUNrecord;
VERBREC2:LSDOMAINT_VERBrecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
SENTENCEREC1:LSDOMAINT_SENTENCErecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
FUNCTION matchcondM1:BOOLEAN;
BEGIN
  matchcondM1:= TRUE
END;{matchcondM1}
FUNCTION matchcondM:BOOLEAN;
BEGIN
  matchcondM:= TRUE
END;{matchcondM}
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
        N^.ls^.cat := CN;
        N^.ls^.CNfield^ := CNREC1;
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
      PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMODREL(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := SENTENCE;
            N^.ls^.SENTENCEfield^ := SENTENCEREC1;
          END{CreateNode};
                                                                PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          VAR list:LSMRUQUO_ListOfStrees;
          PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createMU8(VAR list:LSMRUQUO_ListOfStrees);
            BEGIN{MU8}
            copylist(MU8,list);
            END{MU8};
                                                                BEGIN{createitem21}
          createMU8(list);
          END;
          PROCEDURE createitem22(VAR list:LSMRUQUO_ListOfStrees);
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
              PROCEDURE createitem31(VAR list:LSMRUQUO_ListOfStrees);
                PROCEDURE createMU9(VAR list:LSMRUQUO_ListOfStrees);
                BEGIN{MU9}
                copylist(MU9,list);
                END{MU9};
                                                                    BEGIN{createitem31}
              createMU9(list);
              END;
              PROCEDURE createitem32(VAR list:LSMRUQUO_ListOfStrees);
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
                    PROCEDURE createMU10(VAR list:LSMRUQUO_ListOfStrees);
                    BEGIN{MU10}
                    copylist(MU10,list);
                    END{MU10};
                                                                        BEGIN{createitem31}
                  createMU10(list);
                  END;
                  BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem31);
                  END{createlist1};
                                                                      BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,VERB,createnode,createlist1);
                END{HEAD};
                                                                    BEGIN{createitem32}
              createHEAD(list);
              END;
              BEGIN{createlist1}
LSMATCHES_createlist2items01(wholelist,createitem31,createitem32);
              END{createlist1};
                                                                  BEGIN{PREDREL}
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
            END{PREDREL};
                                                                BEGIN{createitem22}
          createPREDREL(list);
          END;
          BEGIN{createlist1}
LSMATCHES_createlist2items01(wholelist,createitem21,createitem22);
          END{createlist1};
                                                              BEGIN{MODREL}
LSMATCHES_createitem(list,MODREL,SENTENCE,createnode,createlist1);
        END{MODREL};
                                                            BEGIN{createitem12}
      createMODREL(list);
      END;
      PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU4(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU4}
        copylist(MU4,list);
        END{MU4};
                                                            BEGIN{createitem13}
      createMU4(list);
      END;
      PROCEDURE createitem14(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := NOUN;
            N^.ls^.NOUNfield^ := NOUNREC1;
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
          BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem21);
          END{createlist1};
                                                              BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,NOUN,createnode,createlist1);
        END{HEAD};
                                                            BEGIN{createitem14}
      createHEAD(list);
      END;
      PROCEDURE createitem15(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU6(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU6}
        copylist(MU6,list);
        END{MU6};
                                                            BEGIN{createitem15}
      createMU6(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist4items0101(wholelist,createitem11,createitem12,createitem13,createitem14);
      createitem15(list);
      IF list.first<>NIL THEN
        BEGIN
        wholelist.last^.brother:=list.first;
        wholelist.last:=list.last;
        END;
      END{createlist1};
                                                          BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,CN,createnode,createlist1);
    END{HEAD};
                                                        BEGIN{createitem12}
  createHEAD(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU7(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU7}
    copylist(MU7,list);
    END{MU7};
                                                        BEGIN{createitem13}
  createMU7(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(NP);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      lirel2:LIDOMAINT_synrel;
      lsrel2:LSDOMAINT_synrel;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>CN THEN
          match:=FALSE;
        IF match THEN
          CNREC1:=s^.ls^.CNfield^;
      END{MatchNode};
                                                            PROCEDURE MatchList5Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
        PROCEDURE Match_MU2(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU2.first:=Lfirst;
            MU2.last:=Llast;
            match:=TRUE;
          END
          ELSE match:=FALSE
        END;
                                                              PROCEDURE MatchList4Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
        PROCEDURE Match_MODREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
              SENTENCEREC1:=s^.ls^.SENTENCEfield^;
          END{MatchNode};
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            PROCEDURE Match_MU8(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            BEGIN{match}
              IF first THEN BEGIN
                MU8.first:=Lfirst;
                MU8.last:=Llast;
                match:=TRUE;
              END
              ELSE match:=FALSE
            END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU8(Lfirst,Llast,TRUE,match);
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
                PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
                VAR matchcond:BOOLEAN;
                  Stree:LSSTREE_pStree;
                  lisons:LISTREE_pRelnode;
                  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
                  BEGIN{MatchNode}
                    IF s^.ls^.cat<>VERB THEN
                      match:=FALSE;
                    IF match THEN
                      VERBREC2:=s^.ls^.VERBfield^;
                  END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
                    PROCEDURE Match_MU10(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
                    BEGIN{match}
                      IF first THEN BEGIN
                        MU10.first:=Lfirst;
                        MU10.last:=Llast;
                        match:=TRUE;
                      END
                      ELSE match:=FALSE
                    END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU10(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU10(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM_2_2_2_2_1:=L;WHILE LlastM_2_2_2_2_1^.brother<>NIL DO
LlastM_2_2_2_2_1:=LlastM_2_2_2_2_1^.brother;
match_MU10(L,LlastM_2_2_2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
                    LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_2_2_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM_2_2_2_1,LlastM_2_2_2_1
,item2,LfirstM_2_2_2_2,LlastM_2_2_2_2
) ELSE match_HEAD(LfirstM_2_2_2_2,LfirstM_2_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,PREDREL
,HEAD,match,matchnode,matchlist2items,lastmatchM_2_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_PREDREL(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM_2_2_1,LlastM_2_2_1
,item2,LfirstM_2_2_2,LlastM_2_2_2
) ELSE match_PREDREL(LfirstM_2_2_2,LfirstM_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,MODREL
,PREDREL,match,matchnode,matchlist2items,lastmatchM_2_2) END;
                                                                PROCEDURE MatchList3Items
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
            IF s^.ls^.cat<>NOUN THEN
              match:=FALSE;
            IF match THEN
              NOUNREC1:=s^.ls^.NOUNfield^;
          END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU5(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM_2_4_1:=L;WHILE LlastM_2_4_1^.brother<>NIL DO
LlastM_2_4_1:=LlastM_2_4_1^.brother;
match_MU5(L,LlastM_2_4_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
            LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_2_4) END;
                                                                    PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
              VAR
                itemmatch,listmatch:Boolean;
        PROCEDURE Match_MU6(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU6.first:=Lfirst;
            MU6.last:=Llast;
            match:=TRUE;
          END
          ELSE match:=FALSE
        END;
                                                      BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU6,matchlist0items,
LlastM_2_5,LfirstM_2_5,LrestM_2_5,nomoretreesM_2_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM_2_4,LfirstM_2_4,LrestM_2_4,nomoretreesM_2_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU4,matchlist2items,
LlastM_2_3,LfirstM_2_3,LrestM_2_3,nomoretreesM_2_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_MODREL,matchlist3items,
LlastM_2_2,LfirstM_2_2,LrestM_2_2,nomoretreesM_2_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU2,matchlist4items,
LlastM_2_1,LfirstM_2_1,LrestM_2_1,nomoretreesM_2_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=2)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree2rels(Lfirst,Llast,first,HEAD
,MODREL,HEAD,match,matchnode,matchlist5items,lastmatchM_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_MU7(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU7.first:=Lfirst;
        MU7.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU7(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM_1,LlastM_1
,HEAD,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
) ELSE match_HEAD(LfirstM_2,LfirstM_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
                                                       FUNCTION subrule0X1 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDMU1:BOOLEAN;
BEGIN MATCHCONDMU1:=TRUE END;
                                                          PROCEDURE matchlistMU1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
                                                          BEGIN
IF match THEN matchlist0items(MU1.first,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  END;
  PROCEDURE createMU1;
  BEGIN{MU1}
  END{MU1};
                                                      PROCEDURE ACTION36;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION38;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION40;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION41;
BEGIN

END;
                                                      PROCEDURE ACTION42;
BEGIN

END;
                                                      PROCEDURE ACTION44;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION46;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION48;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION50;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION51;
BEGIN

END;
                                                      PROCEDURE ACTION52;
BEGIN

END;
                                                      PROCEDURE ACTION53;
BEGIN

END;
                                                      PROCEDURE ACTION54;
BEGIN
VERBREC1.EORENFORM:=OMEGAFORM
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistMU1(MU1.first,MU1.last,match,TRUE);
  IF match THEN
    BEGIN
  IF ((TRUE                                                  )
                                                      )
                                                       THEN
    BEGIN
    IF ((NOUNREC1.NUMBER =PLURAL                               )
                                                      )
                                                       THEN
      BEGIN
      IF ((VERBREC2.MODUS =PRESPART                              )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =EFORM                             )
                                                      )
                                                       THEN
        BEGIN
        MAKET_VERBrec(VERBREC1);
        action36;
        action42;
        action54;
        createMU1;
        previous1;
        LISTREE_emptytuple(tuple);
        Is1:=loopholes.retype(m1,LISTREE_pstree);
        LISTREE_addtotuple(Is1,tuple);
        LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
        END;
      IF ((VERBREC2.MODUS =PASTPART                              )
                                                      )
                                                       THEN
        BEGIN
        IF ((VERBREC2.CONJCLASSES *[1,
2,
5,
6,
7,
8,
11,
12,
15,
16]                                                   <>[]                                                    )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =NOFORM                            )
                                                      )
                                                       THEN
          BEGIN
          MAKET_VERBrec(VERBREC1);
          action38;
          action41;
          action42;
          action54;
          createMU1;
          previous1;
          LISTREE_emptytuple(tuple);
          Is1:=loopholes.retype(m1,LISTREE_pstree);
          LISTREE_addtotuple(Is1,tuple);
          LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
          END;
        IF ((VERBREC2.CONJCLASSES *[5,
6,
7,
8,
11,
12,
15,
16]                                                    =[]                                                    )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =EFORM                             )
                                                      )
                                                       THEN
          BEGIN
          MAKET_VERBrec(VERBREC1);
          action40;
          action41;
          action42;
          action54;
          createMU1;
          previous1;
          LISTREE_emptytuple(tuple);
          Is1:=loopholes.retype(m1,LISTREE_pstree);
          LISTREE_addtotuple(Is1,tuple);
          LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
          END;
                                                              END;
                                                            END;
    IF ((NOUNREC1.NUMBER =SINGULAR                             )
                                                      )
                                                       THEN
      BEGIN
      IF (([NEUTGENDER]                                           *NOUNREC1.GENDERS<>
[]                                                    )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =NOFORM                            )
                                                      )
                                                       THEN
        BEGIN
        MAKET_VERBrec(VERBREC1);
        action44;
        action53;
        action54;
        createMU1;
        previous1;
        LISTREE_emptytuple(tuple);
        Is1:=loopholes.retype(m1,LISTREE_pstree);
        LISTREE_addtotuple(Is1,tuple);
        LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
        END;
      IF (([FEMGENDER,
MASCGENDER]                                            *NOUNREC1.GENDERS<>[]                                                    )
                                                      )
                                                       THEN
        BEGIN
        IF ((VERBREC2.MODUS =PRESPART                              )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =EFORM                             )
                                                      )
                                                       THEN
          BEGIN
          MAKET_VERBrec(VERBREC1);
          action46;
          action52;
          action53;
          action54;
          createMU1;
          previous1;
          LISTREE_emptytuple(tuple);
          Is1:=loopholes.retype(m1,LISTREE_pstree);
          LISTREE_addtotuple(Is1,tuple);
          LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
          END;
        IF ((VERBREC2.MODUS =PASTPART                              )
                                                      )
                                                       THEN
          BEGIN
          IF ((VERBREC2.CONJCLASSES *[1,
2,
5,
6,
7,
8,
11,
12,
15,
16]                                                   <>[]                                                    )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =NOFORM                            )
                                                      )
                                                       THEN
            BEGIN
            MAKET_VERBrec(VERBREC1);
            action48;
            action51;
            action52;
            action53;
            action54;
            createMU1;
            previous1;
            LISTREE_emptytuple(tuple);
            Is1:=loopholes.retype(m1,LISTREE_pstree);
            LISTREE_addtotuple(Is1,tuple);
            LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
            END;
          IF ((VERBREC2.CONJCLASSES *[5,
6,
7,
8,
11,
12,
15,
16]                                                    =[]                                                    )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =EFORM                             )
                                                      )
                                                       THEN
            BEGIN
            MAKET_VERBrec(VERBREC1);
            action50;
            action51;
            action52;
            action53;
            action54;
            createMU1;
            previous1;
            LISTREE_emptytuple(tuple);
            Is1:=loopholes.retype(m1,LISTREE_pstree);
            LISTREE_addtotuple(Is1,tuple);
            LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
            END;
                                                                END;
                                                              END;
                                                            END;
                                                          END;
                                                          END;
                                                       subrule0X1:=result
 END;
 FUNCTION subrule0X2 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitMU1_1,LrestMU1_1,LfirstMU1_1,LlastMU1_1:LSSTREE_prelnode;
iMU1_1:INTEGER;
nomoretreesMU1_1,lastmatchMU1_1:BOOLEAN;
FUNCTION MATCHCONDMU1:BOOLEAN;
BEGIN MATCHCONDMU1:=TRUE END;
  FUNCTION matchcondI1:BOOLEAN;
                                                        BEGIN
matchcondI1:=FALSE;
    IF
            (( NOT(T1^.CAT IN [POSSADJ]                                             
)                                                     )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

  END;{matchcondI1}
                                                          PROCEDURE matchlistMU1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_DETREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
          LSMATCHES_matchtreeConVar(Lfirst,Llast,first,DETREL,T1,match,matchcondI1,lastmatchMU1_1);
END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesMU1_1:=False;
        LfirstMU1_1:=NIL;
        SelectLfirstAndLlast(LfirstMU1_1,LlastMU1_1,LrestMU1_1
,nomoretreesMU1_1,L);
        IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
        IF NOT nomoretreesMU1_1 THEN
          BEGIN
          Match_DETREL(LfirstMU1_1,LlastMU1_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestMU1_1=NIL) AND ((LfirstMU1_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
        Match_DETREL(LfirstMU1_1,LlastMU1_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestMU1_1,FALSE,match);
      END;
    IF (LfirstMU1_1<>NIL) THEN match:=match AND (LlastMU1_1=Lfinal);
      IF match THEN IF NOT MatchcondMU1 THEN
        MatchList1Items(LrestMU1_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=DETREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(MU1.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(MU1.first,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  END;
  PROCEDURE createMU1;
  BEGIN{MU1}
  END{MU1};
                                                      PROCEDURE ACTION89;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION90;
BEGIN
VERBREC1:=VERBREC2;                                   ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION92;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION93;
BEGIN

END;
                                                      PROCEDURE ACTION94;
BEGIN

END;
                                                      PROCEDURE ACTION96;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION98;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION100;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION102;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION103;
BEGIN

END;
                                                      PROCEDURE ACTION104;
BEGIN

END;
                                                      PROCEDURE ACTION105;
BEGIN

END;
                                                      PROCEDURE ACTION106;
BEGIN
VERBREC1.EORENFORM:=OMEGAFORM
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistMU1(MU1.first,MU1.last,match,TRUE);
  IF match THEN
    BEGIN
  IF ((NPREC1.DEFINITE IN [INDEF,
MENIGDEF]                                             )
                                                      )
                                                       THEN
    BEGIN
    IF ((NOUNREC1.NUMBER =PLURAL                               )
                                                      )
                                                       THEN
      BEGIN
      IF ((VERBREC2.MODUS =PRESPART                              )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =EFORM                             )
                                                      )
                                                       THEN
        BEGIN
        MAKET_VERBrec(VERBREC1);
        action89;
        action94;
        action106;
        createMU1;
        previous1;
        LISTREE_emptytuple(tuple);
        Is1:=loopholes.retype(m1,LISTREE_pstree);
        LISTREE_addtotuple(Is1,tuple);
        LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
        END;
      IF ((VERBREC2.MODUS =PASTPART                              )
                                                      )
                                                       THEN
        BEGIN
        IF ((VERBREC2.CONJCLASSES *[1,
2,
5,
6,
7,
8,
11,
12,
15,
16]                                                   <>[]                                                    )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =NOFORM                            )
                                                      )
                                                       THEN
          BEGIN
          MAKET_VERBrec(VERBREC1);
          action90;
          action93;
          action94;
          action106;
          createMU1;
          previous1;
          LISTREE_emptytuple(tuple);
          Is1:=loopholes.retype(m1,LISTREE_pstree);
          LISTREE_addtotuple(Is1,tuple);
          LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
          END;
        IF ((VERBREC2.CONJCLASSES *[5,
6,
7,
8,
11,
12,
15,
16]                                                    =[]                                                    )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =EFORM                             )
                                                      )
                                                       THEN
          BEGIN
          MAKET_VERBrec(VERBREC1);
          action92;
          action93;
          action94;
          action106;
          createMU1;
          previous1;
          LISTREE_emptytuple(tuple);
          Is1:=loopholes.retype(m1,LISTREE_pstree);
          LISTREE_addtotuple(Is1,tuple);
          LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
          END;
                                                              END;
                                                            END;
    IF ((NOUNREC1.NUMBER =SINGULAR                             )
                                                      )
                                                       THEN
      BEGIN
      IF (([NEUTGENDER]                                           *NOUNREC1.GENDERS<>
[]                                                    )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =NOFORM                            )
                                                      )
                                                       THEN
        BEGIN
        MAKET_VERBrec(VERBREC1);
        action96;
        action105;
        action106;
        createMU1;
        previous1;
        LISTREE_emptytuple(tuple);
        Is1:=loopholes.retype(m1,LISTREE_pstree);
        LISTREE_addtotuple(Is1,tuple);
        LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
        END;
      IF (([FEMGENDER,
MASCGENDER]                                            *NOUNREC1.GENDERS<>[]                                                    )
                                                      )
                                                       THEN
        BEGIN
        IF ((VERBREC2.MODUS =PRESPART                              )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =EFORM                             )
                                                      )
                                                       THEN
          BEGIN
          MAKET_VERBrec(VERBREC1);
          action98;
          action104;
          action105;
          action106;
          createMU1;
          previous1;
          LISTREE_emptytuple(tuple);
          Is1:=loopholes.retype(m1,LISTREE_pstree);
          LISTREE_addtotuple(Is1,tuple);
          LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
          END;
        IF ((VERBREC2.MODUS =PASTPART                              )
                                                      )
                                                       THEN
          BEGIN
          IF ((VERBREC2.CONJCLASSES *[1,
2,
5,
6,
7,
8,
11,
12,
15,
16]                                                   <>[]                                                    )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =NOFORM                            )
                                                      )
                                                       THEN
            BEGIN
            MAKET_VERBrec(VERBREC1);
            action100;
            action103;
            action104;
            action105;
            action106;
            createMU1;
            previous1;
            LISTREE_emptytuple(tuple);
            Is1:=loopholes.retype(m1,LISTREE_pstree);
            LISTREE_addtotuple(Is1,tuple);
            LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
            END;
          IF ((VERBREC2.CONJCLASSES *[5,
6,
7,
8,
11,
12,
15,
16]                                                    =[]                                                    )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =EFORM                             )
                                                      )
                                                       THEN
            BEGIN
            MAKET_VERBrec(VERBREC1);
            action102;
            action103;
            action104;
            action105;
            action106;
            createMU1;
            previous1;
            LISTREE_emptytuple(tuple);
            Is1:=loopholes.retype(m1,LISTREE_pstree);
            LISTREE_addtotuple(Is1,tuple);
            LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
            END;
                                                                END;
                                                              END;
                                                            END;
                                                          END;
                                                          END;
                                                       subrule0X2:=result
 END;
 FUNCTION subrule0X3 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitMU1_1,LrestMU1_1,LfirstMU1_1,LlastMU1_1:LSSTREE_prelnode;
iMU1_1:INTEGER;
nomoretreesMU1_1,lastmatchMU1_1:BOOLEAN;
LinitMU1_1_1,LrestMU1_1_1,LfirstMU1_1_1,LlastMU1_1_1:LSSTREE_prelnode;
iMU1_1_1:INTEGER;
nomoretreesMU1_1_1,lastmatchMU1_1_1:BOOLEAN;
LinitMU1_1_2,LrestMU1_1_2,LfirstMU1_1_2,LlastMU1_1_2:LSSTREE_prelnode;
iMU1_1_2:INTEGER;
nomoretreesMU1_1_2,lastmatchMU1_1_2:BOOLEAN;
LinitMU1_1_2_1,LrestMU1_1_2_1,LfirstMU1_1_2_1,LlastMU1_1_2_1:LSSTREE_prelnode;
iMU1_1_2_1:INTEGER;
nomoretreesMU1_1_2_1,lastmatchMU1_1_2_1:BOOLEAN;
FUNCTION MATCHCONDMU1:BOOLEAN;
BEGIN MATCHCONDMU1:=TRUE END;
                                                          PROCEDURE matchlistMU1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_DETREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        lirel1:LIDOMAINT_synrel;
        lsrel1:LSDOMAINT_synrel;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>DETP THEN
            match:=FALSE;
          IF match THEN
            DETPREC1:=s^.ls^.DETPfield^;
        END{MatchNode};
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          PROCEDURE Match_MU11(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          BEGIN{match}
            IF first THEN BEGIN
              MU11.first:=Lfirst;
              MU11.last:=Llast;
              match:=TRUE;
            END
            ELSE match:=FALSE
          END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU11(Lfirst,Llast,TRUE,match);
END;
          PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          VAR matchcond:BOOLEAN;
            Stree:LSSTREE_pStree;
            lisons:LISTREE_pRelnode;
            PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
            BEGIN{MatchNode}
              IF s^.ls^.cat<>DET THEN
                match:=FALSE;
              IF match THEN
                DETREC1:=s^.ls^.DETfield^;
            END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
              PROCEDURE Match_MU12(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
              BEGIN{match}
                IF first THEN BEGIN
                  MU12.first:=Lfirst;
                  MU12.last:=Llast;
                  match:=TRUE;
                END
                ELSE match:=FALSE
              END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU12(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU12(NIL,NIL,TRUE,match) ELSE BEGIN
LlastMU1_1_2_1:=L;WHILE LlastMU1_1_2_1^.brother<>NIL DO
LlastMU1_1_2_1:=LlastMU1_1_2_1^.brother;
match_MU12(L,LlastMU1_1_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
              LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchMU1_1_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstMU1_1_1,LlastMU1_1_1
,item2,LfirstMU1_1_2,LlastMU1_1_2
) ELSE match_HEAD(LfirstMU1_1_2,LfirstMU1_1_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                      IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,DETREL
,HEAD,match,matchnode,matchlist2items,lastmatchMU1_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesMU1_1:=False;
        LfirstMU1_1:=NIL;
        SelectLfirstAndLlast(LfirstMU1_1,LlastMU1_1,LrestMU1_1
,nomoretreesMU1_1,L);
        IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
        IF NOT nomoretreesMU1_1 THEN
          BEGIN
          Match_DETREL(LfirstMU1_1,LlastMU1_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestMU1_1=NIL) AND ((LfirstMU1_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
        Match_DETREL(LfirstMU1_1,LlastMU1_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestMU1_1,FALSE,match);
      END;
    IF (LfirstMU1_1<>NIL) THEN match:=match AND (LlastMU1_1=Lfinal);
      IF match THEN IF NOT MatchcondMU1 THEN
        MatchList1Items(LrestMU1_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=DETREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(MU1.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(MU1.first,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  END;
  PROCEDURE createMU1;
  BEGIN{MU1}
  END{MU1};
                                                      PROCEDURE ACTION143;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION145;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION147;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION148;
BEGIN

END;
                                                      PROCEDURE ACTION149;
BEGIN

END;
                                                      PROCEDURE ACTION151;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION153;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION155;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION157;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION158;
BEGIN

END;
                                                      PROCEDURE ACTION159;
BEGIN

END;
                                                      PROCEDURE ACTION160;
BEGIN

END;
                                                      PROCEDURE ACTION161;
BEGIN
VERBREC1.EORENFORM:=OMEGAFORM
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistMU1(MU1.first,MU1.last,match,TRUE);
  IF match THEN
    BEGIN
  IF ((NPREC1.DEFINITE IN [DEF,
ADEF]                                                 )
                                                      )
                                                       THEN
    BEGIN
    IF ((NOUNREC1.NUMBER =PLURAL                               )
                                                      )
                                                       THEN
      BEGIN
      IF ((VERBREC2.MODUS =PRESPART                              )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =EFORM                             )
                                                      )
                                                       THEN
        BEGIN
        MAKET_VERBrec(VERBREC1);
        action143;
        action149;
        action161;
        createMU1;
        previous1;
        LISTREE_emptytuple(tuple);
        Is1:=loopholes.retype(m1,LISTREE_pstree);
        LISTREE_addtotuple(Is1,tuple);
        LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
        END;
      IF ((VERBREC2.MODUS =PASTPART                              )
                                                      )
                                                       THEN
        BEGIN
        IF ((VERBREC2.CONJCLASSES *[1,
2,
5,
6,
7,
8,
11,
12,
15,
16]                                                   <>[]                                                    )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =NOFORM                            )
                                                      )
                                                       THEN
          BEGIN
          MAKET_VERBrec(VERBREC1);
          action145;
          action148;
          action149;
          action161;
          createMU1;
          previous1;
          LISTREE_emptytuple(tuple);
          Is1:=loopholes.retype(m1,LISTREE_pstree);
          LISTREE_addtotuple(Is1,tuple);
          LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
          END;
        IF ((VERBREC2.CONJCLASSES *[5,
6,
7,
8,
11,
12,
15,
16]                                                    =[]                                                    )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =EFORM                             )
                                                      )
                                                       THEN
          BEGIN
          MAKET_VERBrec(VERBREC1);
          action147;
          action148;
          action149;
          action161;
          createMU1;
          previous1;
          LISTREE_emptytuple(tuple);
          Is1:=loopholes.retype(m1,LISTREE_pstree);
          LISTREE_addtotuple(Is1,tuple);
          LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
          END;
                                                              END;
                                                            END;
    IF ((NOUNREC1.NUMBER =SINGULAR                             )
                                                      )
                                                       THEN
      BEGIN
      IF (([NEUTGENDER]                                           *NOUNREC1.GENDERS<>
[]                                                    )
                                                      )
THEN IF
          ((DETREC1.EFORMATION =REGEFORMATION                     )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =NOFORM                            )
                                                      )
                                                       THEN
        BEGIN
        MAKET_VERBrec(VERBREC1);
        action151;
        action160;
        action161;
        createMU1;
        previous1;
        LISTREE_emptytuple(tuple);
        Is1:=loopholes.retype(m1,LISTREE_pstree);
        LISTREE_addtotuple(Is1,tuple);
        LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
        END;
      IF (([FEMGENDER,
MASCGENDER]                                            *NOUNREC1.GENDERS<>[]                                                    )
                                                      )
                                                       THEN
        BEGIN
        IF ((VERBREC2.MODUS =PRESPART                              )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =EFORM                             )
                                                      )
                                                       THEN
          BEGIN
          MAKET_VERBrec(VERBREC1);
          action153;
          action159;
          action160;
          action161;
          createMU1;
          previous1;
          LISTREE_emptytuple(tuple);
          Is1:=loopholes.retype(m1,LISTREE_pstree);
          LISTREE_addtotuple(Is1,tuple);
          LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
          END;
        IF ((VERBREC2.MODUS =PASTPART                              )
                                                      )
                                                       THEN
          BEGIN
          IF ((VERBREC2.CONJCLASSES *[1,
2,
5,
6,
7,
8,
11,
12,
15,
16]                                                   <>[]                                                    )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =NOFORM                            )
                                                      )
                                                       THEN
            BEGIN
            MAKET_VERBrec(VERBREC1);
            action155;
            action158;
            action159;
            action160;
            action161;
            createMU1;
            previous1;
            LISTREE_emptytuple(tuple);
            Is1:=loopholes.retype(m1,LISTREE_pstree);
            LISTREE_addtotuple(Is1,tuple);
            LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
            END;
          IF ((VERBREC2.CONJCLASSES *[5,
6,
7,
8,
11,
12,
15,
16]                                                    =[]                                                    )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =EFORM                             )
                                                      )
                                                       THEN
            BEGIN
            MAKET_VERBrec(VERBREC1);
            action157;
            action158;
            action159;
            action160;
            action161;
            createMU1;
            previous1;
            LISTREE_emptytuple(tuple);
            Is1:=loopholes.retype(m1,LISTREE_pstree);
            LISTREE_addtotuple(Is1,tuple);
            LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
            END;
                                                                END;
                                                              END;
                                                            END;
                                                          END;
                                                          END;
                                                       subrule0X3:=result
 END;
 FUNCTION subrule0X4 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitMU1_1,LrestMU1_1,LfirstMU1_1,LlastMU1_1:LSSTREE_prelnode;
iMU1_1:INTEGER;
nomoretreesMU1_1,lastmatchMU1_1:BOOLEAN;
LinitMU1_1_1,LrestMU1_1_1,LfirstMU1_1_1,LlastMU1_1_1:LSSTREE_prelnode;
iMU1_1_1:INTEGER;
nomoretreesMU1_1_1,lastmatchMU1_1_1:BOOLEAN;
LinitMU1_1_2,LrestMU1_1_2,LfirstMU1_1_2,LlastMU1_1_2:LSSTREE_prelnode;
iMU1_1_2:INTEGER;
nomoretreesMU1_1_2,lastmatchMU1_1_2:BOOLEAN;
 ARTREC1tree:LSSTREE_pStree;
 DEMADJREC1tree:LSSTREE_pStree;
 MU13:LSMRUQUO_ListOfStrees;
 MU14:LSMRUQUO_ListOfStrees;
 MU15:LSMRUQUO_ListOfStrees;
 ARTREC1:LSDOMAINT_ARTrecord;
 DETPREC2:LSDOMAINT_DETPrecord;
 DEMADJREC1:LSDOMAINT_DEMADJrecord;
 POSSADJREC1:LSDOMAINT_POSSADJrecord;
 NPREC3:LSDOMAINT_NPrecord;
FUNCTION MATCHCONDMU1:BOOLEAN;
BEGIN MATCHCONDMU1:=TRUE END;
  FUNCTION matchcondI14:BOOLEAN;
                                                        BEGIN
matchcondI14:=FALSE;
    IF
            ((GENITIVE IN NPREC3.CASES                              )
                                                      )
                                                      THEN 
matchcondI14:=TRUE;

  END;{matchcondI14}
  FUNCTION matchcondI13:BOOLEAN;
                                                        BEGIN
matchcondI13:=FALSE;
    IF
            ((ARTREC1.DEFINITE =DEF                                 )
                                                      )
                                                      THEN 
matchcondI13:=TRUE;

  END;{matchcondI13}
  FUNCTION matchcondI3:BOOLEAN;
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
      IF s^.ls^.cat<>ART THEN
        match:=FALSE;
      IF match THEN
        ARTREC1:=s^.ls^.ARTfield^;
      IF match THEN
        match:= matchcondI13;
    END{MatchNode};
                                                      BEGIN{MatchTree}
            ARTREC1tree:=Lfirst^.node;
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
                                                      FUNCTION EXIST2(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
Linit_1,Lrest_1,Lfirst_1,Llast_1:LSSTREE_prelnode;
i_1:INTEGER;
nomoretrees_1,lastmatch_1:BOOLEAN;
Linit_1_1,Lrest_1_1,Lfirst_1_1,Llast_1_1:LSSTREE_prelnode;
i_1_1:INTEGER;
nomoretrees_1_1,lastmatch_1_1:BOOLEAN;
Linit_1_2,Lrest_1_2,Lfirst_1_2,Llast_1_2:LSSTREE_prelnode;
i_1_2:INTEGER;
nomoretrees_1_2,lastmatch_1_2:BOOLEAN;
      Lfinal:LSSTREE_prelnode;
match:Boolean;
PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
      IF s^.ls^.cat<>DETP THEN
        match:=FALSE;
      IF match THEN
        DETPREC2:=s^.ls^.DETPfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      PROCEDURE Match_MU13(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU13.first:=Lfirst;
          MU13.last:=Llast;
          match:=TRUE;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU13(Lfirst,Llast,TRUE,match);
END;
      PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>ART THEN
            match:=FALSE;
          IF match THEN
            ARTREC1:=s^.ls^.ARTfield^;
          IF match THEN
            match:= matchcondI13;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    ARTREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatch_1_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,Lfirst_1_1,Llast_1_1
,item2,Lfirst_1_2,Llast_1_2
) ELSE match_HEAD(Lfirst_1_2,Lfirst_1_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
              IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist2items,lastmatch_1) END;
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
                                                        BEGIN{Exist2}
    next:=mu.first;match:=False;Lfinal:=mu.last;
    IF next =NIL THEN
      EXIST2:=False
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND NOT(match) DO
      BEGIN
        matchlist1items(next,TRUE,match);
        next:=next^.brother;
      END;
      IF match = False THEN
        matchlist1items(next,TRUE,match);
      EXIST2:=match;
    END;
  END;{Exist}
                                                      FUNCTION EXIST3(mu:LSMRUQUO_ListOfStrees):Boolean;
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
      IF s^.ls^.cat<>DEMADJ THEN
        match:=FALSE;
      IF match THEN
        DEMADJREC1:=s^.ls^.DEMADJfield^;
    END{MatchNode};
                                                      BEGIN{MatchTree}
            DEMADJREC1tree:=Lfirst^.node;
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
                                                        BEGIN{Exist3}
    next:=mu.first;match:=False;Lfinal:=mu.last;
    IF next =NIL THEN
      EXIST3:=False
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND NOT(match) DO
      BEGIN
        matchlist1items(next,TRUE,match);
        next:=next^.brother;
      END;
      IF match = False THEN
        matchlist1items(next,TRUE,match);
      EXIST3:=match;
    END;
  END;{Exist}
                                                      FUNCTION EXIST4(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
Linit_1,Lrest_1,Lfirst_1,Llast_1:LSSTREE_prelnode;
i_1:INTEGER;
nomoretrees_1,lastmatch_1:BOOLEAN;
Linit_1_1,Lrest_1_1,Lfirst_1_1,Llast_1_1:LSSTREE_prelnode;
i_1_1:INTEGER;
nomoretrees_1_1,lastmatch_1_1:BOOLEAN;
Linit_1_2,Lrest_1_2,Lfirst_1_2,Llast_1_2:LSSTREE_prelnode;
i_1_2:INTEGER;
nomoretrees_1_2,lastmatch_1_2:BOOLEAN;
      Lfinal:LSSTREE_prelnode;
match:Boolean;
PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
      IF s^.ls^.cat<>DETP THEN
        match:=FALSE;
      IF match THEN
        DETPREC2:=s^.ls^.DETPfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      PROCEDURE Match_MU13(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU13.first:=Lfirst;
          MU13.last:=Llast;
          match:=TRUE;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU13(Lfirst,Llast,TRUE,match);
END;
      PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>DEMADJ THEN
            match:=FALSE;
          IF match THEN
            DEMADJREC1:=s^.ls^.DEMADJfield^;
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    DEMADJREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatch_1_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,Lfirst_1_1,Llast_1_1
,item2,Lfirst_1_2,Llast_1_2
) ELSE match_HEAD(Lfirst_1_2,Lfirst_1_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
              IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist2items,lastmatch_1) END;
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
                                                        BEGIN{Exist4}
    next:=mu.first;match:=False;Lfinal:=mu.last;
    IF next =NIL THEN
      EXIST4:=False
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND NOT(match) DO
      BEGIN
        matchlist1items(next,TRUE,match);
        next:=next^.brother;
      END;
      IF match = False THEN
        matchlist1items(next,TRUE,match);
      EXIST4:=match;
    END;
  END;{Exist}
                                                      FUNCTION EXIST5(mu:LSMRUQUO_ListOfStrees):Boolean;
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
  PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>POSSADJ THEN
        match:=FALSE;
      IF match THEN
        POSSADJREC1:=s^.ls^.POSSADJfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      PROCEDURE Match_MU14(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU14.first:=Lfirst;
          MU14.last:=Llast;
          match:=TRUE;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU14(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU14(NIL,NIL,TRUE,match) ELSE BEGIN
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU14(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
      LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
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
                                                        BEGIN{Exist5}
    next:=mu.first;match:=False;Lfinal:=mu.last;
    IF next =NIL THEN
      EXIST5:=False
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND NOT(match) DO
      BEGIN
        matchlist1items(next,TRUE,match);
        next:=next^.brother;
      END;
      IF match = False THEN
        matchlist1items(next,TRUE,match);
      EXIST5:=match;
    END;
  END;{Exist}
                                                      FUNCTION EXIST6(mu:LSMRUQUO_ListOfStrees):Boolean;
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
  PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>NP THEN
        match:=FALSE;
      IF match THEN
        NPREC3:=s^.ls^.NPfield^;
      IF match THEN
        match:= matchcondI14;
    END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      PROCEDURE Match_MU15(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU15.first:=Lfirst;
          MU15.last:=Llast;
          match:=TRUE;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU15(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU15(NIL,NIL,TRUE,match) ELSE BEGIN
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU15(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
      LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
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
                                                        BEGIN{Exist6}
    next:=mu.first;match:=False;Lfinal:=mu.last;
    IF next =NIL THEN
      EXIST6:=False
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND NOT(match) DO
      BEGIN
        matchlist1items(next,TRUE,match);
        next:=next^.brother;
      END;
      IF match = False THEN
        matchlist1items(next,TRUE,match);
      EXIST6:=match;
    END;
  END;{Exist}
                                                        BEGIN
matchcondI3:=FALSE;
    IF
            ((Exist1(MU12)                                          )
OR
          (Exist2(MU12)                                          )
OR
          (Exist3(MU12)                                          )
OR
          (Exist4(MU12)                                          )
OR
          (Exist5(MU12)                                          )
OR
          (Exist6(MU12)                                          )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

  END;{matchcondI3}
                                                          PROCEDURE matchlistMU1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_DETREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>DETP THEN
            match:=FALSE;
          IF match THEN
            DETPREC1:=s^.ls^.DETPfield^;
        END{MatchNode};
                                                              PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
          PROCEDURE Match_MU11(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          BEGIN{match}
            IF first THEN BEGIN
              MU11.first:=Lfirst;
              MU11.last:=Llast;
              match:=TRUE;
            END
            ELSE match:=FALSE
          END;
                                                                PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          VAR
            itemmatch,listmatch:Boolean;
          PROCEDURE Match_MU12(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          BEGIN{match}
            IF first THEN BEGIN
              MU12.first:=Lfirst;
              MU12.last:=Llast;
              match:= matchcondI3;
            END
            ELSE match:=FALSE
          END;
                                                      BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU12,matchlist0items,
LlastMU1_1_2,LfirstMU1_1_2,LrestMU1_1_2,nomoretreesMU1_1_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU11,matchlist1items,
LlastMU1_1_1,LfirstMU1_1_1,LrestMU1_1_1,nomoretreesMU1_1_1) END;
                                                      BEGIN{MatchTree}
          LSMATCHES_matchtree0rels(Lfirst,Llast,first,DETREL
,match,matchnode,matchlist2items,lastmatchMU1_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesMU1_1:=False;
        LfirstMU1_1:=NIL;
        SelectLfirstAndLlast(LfirstMU1_1,LlastMU1_1,LrestMU1_1
,nomoretreesMU1_1,L);
        IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
        IF NOT nomoretreesMU1_1 THEN
          BEGIN
          Match_DETREL(LfirstMU1_1,LlastMU1_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestMU1_1=NIL) AND ((LfirstMU1_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
        Match_DETREL(LfirstMU1_1,LlastMU1_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestMU1_1,FALSE,match);
      END;
    IF (LfirstMU1_1<>NIL) THEN match:=match AND (LlastMU1_1=Lfinal);
      IF match THEN IF NOT MatchcondMU1 THEN
        MatchList1Items(LrestMU1_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=DETREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(MU1.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(MU1.first,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  END;
  PROCEDURE createMU1;
  BEGIN{MU1}
  END{MU1};
                                                      PROCEDURE ACTION178;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION180;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION182;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION183;
BEGIN

END;
                                                      PROCEDURE ACTION184;
BEGIN
VERBREC1.EORENFORM:=OMEGAFORM
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistMU1(MU1.first,MU1.last,match,TRUE);
  IF match THEN
    BEGIN
  IF ((NPREC1.DEFINITE IN [DEF,
ADEF]                                                 )
                                                      )
                                                       THEN
    BEGIN
    IF ((VERBREC2.MODUS =PRESPART                              )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =EFORM                             )
                                                      )
                                                       THEN
      BEGIN
      MAKET_VERBrec(VERBREC1);
      action178;
      action184;
      createMU1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((VERBREC2.MODUS =PASTPART                              )
                                                      )
                                                       THEN
      BEGIN
      IF ((VERBREC2.CONJCLASSES *[1,
2,
5,
6,
7,
8,
11,
12,
15,
16]                                                   <>[]                                                    )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =NOFORM                            )
                                                      )
                                                       THEN
        BEGIN
        MAKET_VERBrec(VERBREC1);
        action180;
        action183;
        action184;
        createMU1;
        previous1;
        LISTREE_emptytuple(tuple);
        Is1:=loopholes.retype(m1,LISTREE_pstree);
        LISTREE_addtotuple(Is1,tuple);
        LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
        END;
      IF ((VERBREC2.CONJCLASSES *[5,
6,
7,
8,
11,
12,
15,
16]                                                    =[]                                                    )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =EFORM                             )
                                                      )
                                                       THEN
        BEGIN
        MAKET_VERBrec(VERBREC1);
        action182;
        action183;
        action184;
        createMU1;
        previous1;
        LISTREE_emptytuple(tuple);
        Is1:=loopholes.retype(m1,LISTREE_pstree);
        LISTREE_addtotuple(Is1,tuple);
        LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                          END;
                                                       subrule0X4:=result
 END;
 FUNCTION subrule0X5 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitMU1_1,LrestMU1_1,LfirstMU1_1,LlastMU1_1:LSSTREE_prelnode;
iMU1_1:INTEGER;
nomoretreesMU1_1,lastmatchMU1_1:BOOLEAN;
LinitMU1_1_1,LrestMU1_1_1,LfirstMU1_1_1,LlastMU1_1_1:LSSTREE_prelnode;
iMU1_1_1:INTEGER;
nomoretreesMU1_1_1,lastmatchMU1_1_1:BOOLEAN;
FUNCTION MATCHCONDMU1:BOOLEAN;
BEGIN MATCHCONDMU1:=TRUE END;
                                                          PROCEDURE matchlistMU1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
    VAR lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
      PROCEDURE Match_DETREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR matchcond:BOOLEAN;
        Stree:LSSTREE_pStree;
        lisons:LISTREE_pRelnode;
        PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
        BEGIN{MatchNode}
          IF s^.ls^.cat<>POSSADJ THEN
            match:=FALSE;
          IF match THEN
            POSSADJREC1:=s^.ls^.POSSADJfield^;
        END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          PROCEDURE Match_MU11(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
          BEGIN{match}
            IF first THEN BEGIN
              MU11.first:=Lfirst;
              MU11.last:=Llast;
              match:=TRUE;
            END
            ELSE match:=FALSE
          END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU11(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU11(NIL,NIL,TRUE,match) ELSE BEGIN
LlastMU1_1_1:=L;WHILE LlastMU1_1_1^.brother<>NIL DO
LlastMU1_1_1:=LlastMU1_1_1^.brother;
match_MU11(L,LlastMU1_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
          LSMATCHES_matchtree0rels(Lfirst,Llast,first,DETREL
,match,matchnode,matchlist1items,lastmatchMU1_1) END;
                                                          BEGIN {MatchList1Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesMU1_1:=False;
        LfirstMU1_1:=NIL;
        SelectLfirstAndLlast(LfirstMU1_1,LlastMU1_1,LrestMU1_1
,nomoretreesMU1_1,L);
        IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
        IF NOT nomoretreesMU1_1 THEN
          BEGIN
          Match_DETREL(LfirstMU1_1,LlastMU1_1,TRUE,itemmatch);
          IF itemmatch THEN
            listmatch:= (LrestMU1_1=NIL) AND ((LfirstMU1_1<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
        Match_DETREL(LfirstMU1_1,LlastMU1_1,FALSE,match);
        IF NOT match THEN
          MatchList0Items(LrestMU1_1,FALSE,match);
      END;
    IF (LfirstMU1_1<>NIL) THEN match:=match AND (LlastMU1_1=Lfinal);
      IF match THEN IF NOT MatchcondMU1 THEN
        MatchList1Items(LrestMU1_1,FALSE,match);
    END;{MatchList1Items}
                                                          BEGIN
          lsrel1:=DETREL;
          lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
          lisons:=loopholes.retype(MU1.first,LISTREE_pRelnode);
          match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist1items(MU1.first,first,match);
    END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  END;
  PROCEDURE createMU1;
  BEGIN{MU1}
  END{MU1};
                                                      PROCEDURE ACTION200;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION202;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION204;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION205;
BEGIN

END;
                                                      PROCEDURE ACTION206;
BEGIN
VERBREC1.EORENFORM:=OMEGAFORM
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistMU1(MU1.first,MU1.last,match,TRUE);
  IF match THEN
    BEGIN
  IF ((NPREC1.DEFINITE IN [INDEF,
MENIGDEF]                                             )
                                                      )
                                                       THEN
    BEGIN
    IF ((VERBREC2.MODUS =PRESPART                              )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =EFORM                             )
                                                      )
                                                       THEN
      BEGIN
      MAKET_VERBrec(VERBREC1);
      action200;
      action206;
      createMU1;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((VERBREC2.MODUS =PASTPART                              )
                                                      )
                                                       THEN
      BEGIN
      IF ((VERBREC2.CONJCLASSES *[1,
2,
5,
6,
7,
8,
11,
12,
15,
16]                                                   <>[]                                                    )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =NOFORM                            )
                                                      )
                                                       THEN
        BEGIN
        MAKET_VERBrec(VERBREC1);
        action202;
        action205;
        action206;
        createMU1;
        previous1;
        LISTREE_emptytuple(tuple);
        Is1:=loopholes.retype(m1,LISTREE_pstree);
        LISTREE_addtotuple(Is1,tuple);
        LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
        END;
      IF ((VERBREC2.CONJCLASSES *[5,
6,
7,
8,
11,
12,
15,
16]                                                    =[]                                                    )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =EFORM                             )
                                                      )
                                                       THEN
        BEGIN
        MAKET_VERBrec(VERBREC1);
        action204;
        action205;
        action206;
        createMU1;
        previous1;
        LISTREE_emptytuple(tuple);
        Is1:=loopholes.retype(m1,LISTREE_pstree);
        LISTREE_addtotuple(Is1,tuple);
        LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                          END;
                                                       subrule0X5:=result
 END;
                                                      BEGIN
m:=loopholes.retype(Is,LSSTREE_pstree);
LISTREE_InitSetOfTupleOfStrees(result);
match:=TRUE;
first:=TRUE;
WHILE match DO BEGIN
matchmodel(m,first,match);
first:=FALSE;
  If match Then
  WHILE match AND NOT matchcondM DO
  BEGIN
  MatchModel(m,FALSE,match);
  END;
IF match THEN
 BEGIN
  LISTREE_mergesetsoftuplestrees(subrule0X1,result);
  LISTREE_mergesetsoftuplestrees(subrule0X2,result);
  LISTREE_mergesetsoftuplestrees(subrule0X3,result);
  LISTREE_mergesetsoftuplestrees(subrule0X4,result);
  LISTREE_mergesetsoftuplestrees(subrule0X5,result);
 END;
END;{WHILE}
DECTNPASSIGNEFORM3:=result
END;
{:TNPASSIGNEFORM3}
{rule:}
{:TNPASSIGNEFORM4}
 FUNCTION DECTNPASSIGNEFORM4(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
LinitM_2_2_1,LrestM_2_2_1,LfirstM_2_2_1,LlastM_2_2_1:LSSTREE_prelnode;
iM_2_2_1:INTEGER;
nomoretreesM_2_2_1,lastmatchM_2_2_1:BOOLEAN;
LinitM_2_2_2,LrestM_2_2_2,LfirstM_2_2_2,LlastM_2_2_2:LSSTREE_prelnode;
iM_2_2_2:INTEGER;
nomoretreesM_2_2_2,lastmatchM_2_2_2:BOOLEAN;
LinitM_2_2_2_1,LrestM_2_2_2_1,LfirstM_2_2_2_1,LlastM_2_2_2_1:LSSTREE_prelnode;
iM_2_2_2_1:INTEGER;
nomoretreesM_2_2_2_1,lastmatchM_2_2_2_1:BOOLEAN;
LinitM_2_2_2_2,LrestM_2_2_2_2,LfirstM_2_2_2_2,LlastM_2_2_2_2:LSSTREE_prelnode;
iM_2_2_2_2:INTEGER;
nomoretreesM_2_2_2_2,lastmatchM_2_2_2_2:BOOLEAN;
LinitM_2_2_2_2_1,LrestM_2_2_2_2_1,LfirstM_2_2_2_2_1,LlastM_2_2_2_2_1:LSSTREE_prelnode;
iM_2_2_2_2_1:INTEGER;
nomoretreesM_2_2_2_2_1,lastmatchM_2_2_2_2_1:BOOLEAN;
LinitM_2_3,LrestM_2_3,LfirstM_2_3,LlastM_2_3:LSSTREE_prelnode;
iM_2_3:INTEGER;
nomoretreesM_2_3,lastmatchM_2_3:BOOLEAN;
LinitM_2_4,LrestM_2_4,LfirstM_2_4,LlastM_2_4:LSSTREE_prelnode;
iM_2_4:INTEGER;
nomoretreesM_2_4,lastmatchM_2_4:BOOLEAN;
LinitM_2_5,LrestM_2_5,LfirstM_2_5,LlastM_2_5:LSSTREE_prelnode;
iM_2_5:INTEGER;
nomoretreesM_2_5,lastmatchM_2_5:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
ENREC1tree:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU8:LSMRUQUO_ListOfStrees;
MU9:LSMRUQUO_ListOfStrees;
MU10:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
MU7:LSMRUQUO_ListOfStrees;
VERBREC1:LSDOMAINT_VERBrecord;
ENREC1:LSDOMAINT_ENrecord;
VERBREC2:LSDOMAINT_VERBrecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
SENTENCEREC1:LSDOMAINT_SENTENCErecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
FUNCTION matchcondM1:BOOLEAN;
BEGIN
  matchcondM1:= TRUE
END;{matchcondM1}
FUNCTION matchcondM:BOOLEAN;
BEGIN
  matchcondM:= TRUE
END;{matchcondM}
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
        N^.ls^.cat := CN;
        N^.ls^.CNfield^ := CNREC1;
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
      PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMODREL(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := SENTENCE;
            N^.ls^.SENTENCEfield^ := SENTENCEREC1;
          END{CreateNode};
                                                                PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          VAR list:LSMRUQUO_ListOfStrees;
          PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createMU8(VAR list:LSMRUQUO_ListOfStrees);
            BEGIN{MU8}
            copylist(MU8,list);
            END{MU8};
                                                                BEGIN{createitem21}
          createMU8(list);
          END;
          PROCEDURE createitem22(VAR list:LSMRUQUO_ListOfStrees);
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
              PROCEDURE createitem31(VAR list:LSMRUQUO_ListOfStrees);
                PROCEDURE createMU9(VAR list:LSMRUQUO_ListOfStrees);
                BEGIN{MU9}
                copylist(MU9,list);
                END{MU9};
                                                                    BEGIN{createitem31}
              createMU9(list);
              END;
              PROCEDURE createitem32(VAR list:LSMRUQUO_ListOfStrees);
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
                    PROCEDURE createMU10(VAR list:LSMRUQUO_ListOfStrees);
                    BEGIN{MU10}
                    copylist(MU10,list);
                    END{MU10};
                                                                        BEGIN{createitem31}
                  createMU10(list);
                  END;
                  BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem31);
                  END{createlist1};
                                                                      BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,VERB,createnode,createlist1);
                END{HEAD};
                                                                    BEGIN{createitem32}
              createHEAD(list);
              END;
              BEGIN{createlist1}
LSMATCHES_createlist2items01(wholelist,createitem31,createitem32);
              END{createlist1};
                                                                  BEGIN{PREDREL}
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
            END{PREDREL};
                                                                BEGIN{createitem22}
          createPREDREL(list);
          END;
          BEGIN{createlist1}
LSMATCHES_createlist2items01(wholelist,createitem21,createitem22);
          END{createlist1};
                                                              BEGIN{MODREL}
LSMATCHES_createitem(list,MODREL,SENTENCE,createnode,createlist1);
        END{MODREL};
                                                            BEGIN{createitem12}
      createMODREL(list);
      END;
      PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU4(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU4}
        copylist(MU4,list);
        END{MU4};
                                                            BEGIN{createitem13}
      createMU4(list);
      END;
      PROCEDURE createitem14(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := EN;
            N^.ls^.ENfield^ := ENREC1;
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
s:=ENREC1tree;
        relnode^.node:=s;
        END{HEAD};
                                                            BEGIN{createitem14}
      createHEAD(list);
      END;
      PROCEDURE createitem15(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU6(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU6}
        copylist(MU6,list);
        END{MU6};
                                                            BEGIN{createitem15}
      createMU6(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist4items0101(wholelist,createitem11,createitem12,createitem13,createitem14);
      createitem15(list);
      IF list.first<>NIL THEN
        BEGIN
        wholelist.last^.brother:=list.first;
        wholelist.last:=list.last;
        END;
      END{createlist1};
                                                          BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,CN,createnode,createlist1);
    END{HEAD};
                                                        BEGIN{createitem12}
  createHEAD(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU7(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU7}
    copylist(MU7,list);
    END{MU7};
                                                        BEGIN{createitem13}
  createMU7(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(NP);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      lirel2:LIDOMAINT_synrel;
      lsrel2:LSDOMAINT_synrel;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>CN THEN
          match:=FALSE;
        IF match THEN
          CNREC1:=s^.ls^.CNfield^;
      END{MatchNode};
                                                            PROCEDURE MatchList5Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
        PROCEDURE Match_MU2(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU2.first:=Lfirst;
            MU2.last:=Llast;
            match:=TRUE;
          END
          ELSE match:=FALSE
        END;
                                                              PROCEDURE MatchList4Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
        PROCEDURE Match_MODREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
              SENTENCEREC1:=s^.ls^.SENTENCEfield^;
          END{MatchNode};
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            PROCEDURE Match_MU8(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            BEGIN{match}
              IF first THEN BEGIN
                MU8.first:=Lfirst;
                MU8.last:=Llast;
                match:=TRUE;
              END
              ELSE match:=FALSE
            END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU8(Lfirst,Llast,TRUE,match);
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
                PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
                VAR matchcond:BOOLEAN;
                  Stree:LSSTREE_pStree;
                  lisons:LISTREE_pRelnode;
                  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
                  BEGIN{MatchNode}
                    IF s^.ls^.cat<>VERB THEN
                      match:=FALSE;
                    IF match THEN
                      VERBREC2:=s^.ls^.VERBfield^;
                  END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
                    PROCEDURE Match_MU10(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
                    BEGIN{match}
                      IF first THEN BEGIN
                        MU10.first:=Lfirst;
                        MU10.last:=Llast;
                        match:=TRUE;
                      END
                      ELSE match:=FALSE
                    END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU10(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU10(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM_2_2_2_2_1:=L;WHILE LlastM_2_2_2_2_1^.brother<>NIL DO
LlastM_2_2_2_2_1:=LlastM_2_2_2_2_1^.brother;
match_MU10(L,LlastM_2_2_2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
                    LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_2_2_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM_2_2_2_1,LlastM_2_2_2_1
,item2,LfirstM_2_2_2_2,LlastM_2_2_2_2
) ELSE match_HEAD(LfirstM_2_2_2_2,LfirstM_2_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,PREDREL
,HEAD,match,matchnode,matchlist2items,lastmatchM_2_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_PREDREL(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM_2_2_1,LlastM_2_2_1
,item2,LfirstM_2_2_2,LlastM_2_2_2
) ELSE match_PREDREL(LfirstM_2_2_2,LfirstM_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,MODREL
,PREDREL,match,matchnode,matchlist2items,lastmatchM_2_2) END;
                                                                PROCEDURE MatchList3Items
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
            IF s^.ls^.cat<>EN THEN
              match:=FALSE;
            IF match THEN
              ENREC1:=s^.ls^.ENfield^;
          END{MatchNode};
                                                      BEGIN{MatchTree}
                        ENREC1tree:=Lfirst^.node;
              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchM_2_4) END;
                                                                    PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
              VAR
                itemmatch,listmatch:Boolean;
        PROCEDURE Match_MU6(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU6.first:=Lfirst;
            MU6.last:=Llast;
            match:=TRUE;
          END
          ELSE match:=FALSE
        END;
                                                      BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU6,matchlist0items,
LlastM_2_5,LfirstM_2_5,LrestM_2_5,nomoretreesM_2_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM_2_4,LfirstM_2_4,LrestM_2_4,nomoretreesM_2_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU4,matchlist2items,
LlastM_2_3,LfirstM_2_3,LrestM_2_3,nomoretreesM_2_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_MODREL,matchlist3items,
LlastM_2_2,LfirstM_2_2,LrestM_2_2,nomoretreesM_2_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU2,matchlist4items,
LlastM_2_1,LfirstM_2_1,LrestM_2_1,nomoretreesM_2_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=2)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree2rels(Lfirst,Llast,first,HEAD
,MODREL,HEAD,match,matchnode,matchlist5items,lastmatchM_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_MU7(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU7.first:=Lfirst;
        MU7.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU7(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM_1,LlastM_1
,HEAD,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
) ELSE match_HEAD(LfirstM_2,LfirstM_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
                                                      PROCEDURE ACTION15;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION17;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION19;
BEGIN
VERBREC1:=VERBREC2;                                   ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION20;
BEGIN

END;
                                                      PROCEDURE ACTION21;
BEGIN
VERBREC1.EORENFORM:=OMEGAFORM
                                                      
END;
                                                      BEGIN
m:=loopholes.retype(Is,LSSTREE_pstree);
LISTREE_InitSetOfTupleOfStrees(result);
match:=TRUE;
first:=TRUE;
WHILE match DO BEGIN
matchmodel(m,first,match);
first:=FALSE;
  If match Then
  WHILE match AND NOT matchcondM DO
  BEGIN
  MatchModel(m,FALSE,match);
  END;
IF match THEN
 BEGIN
 END;
IF match THEN
  BEGIN
IF ((TRUE                                                  )
                                                      )
                                                       THEN
  BEGIN
  IF ((VERBREC2.MODUS =PRESPART                              )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =EFORM                             )
                                                      )
                                                       THEN
    BEGIN
    MAKET_VERBrec(VERBREC1);
    action15;
    action21;
    createM1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
    END;
  IF ((VERBREC2.MODUS =PASTPART                              )
                                                      )
                                                       THEN
    BEGIN
    IF ((VERBREC2.CONJCLASSES *[1,
2,
5,
6,
7,
8,
11,
12,
15,
16]                                                   <>[]                                                    )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =NOFORM                            )
                                                      )
                                                       THEN
      BEGIN
      MAKET_VERBrec(VERBREC1);
      action17;
      action20;
      action21;
      createM1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((VERBREC2.CONJCLASSES *[5,
6,
7,
8,
11,
12,
15,
16]                                                    =[]                                                    )
                                                      )
THEN IF
          ((VERBREC2.EORENFORM =EFORM                             )
                                                      )
                                                       THEN
      BEGIN
      MAKET_VERBrec(VERBREC1);
      action19;
      action20;
      action21;
      createM1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
                                                          END;
                                                        END;
                                                        END;
                                                      END;{WHILE}
DECTNPASSIGNEFORM4:=result
END;
{:TNPASSIGNEFORM4}
{rule:}
{:RNPMODADVP}
 FUNCTION DECRNPMODADVP(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
LinitM_1_1,LrestM_1_1,LfirstM_1_1,LlastM_1_1:LSSTREE_prelnode;
iM_1_1:INTEGER;
nomoretreesM_1_1,lastmatchM_1_1:BOOLEAN;
LinitM_2,LrestM_2,LfirstM_2,LlastM_2:LSSTREE_prelnode;
iM_2:INTEGER;
nomoretreesM_2,lastmatchM_2:BOOLEAN;
LinitM_2_1,LrestM_2_1,LfirstM_2_1,LlastM_2_1:LSSTREE_prelnode;
iM_2_1:INTEGER;
nomoretreesM_2_1,lastmatchM_2_1:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
WHPROREC1:LSDOMAINT_WHPROrecord;
INDEFPROREC1:LSDOMAINT_INDEFPROrecord;
ADVPREC1:LSDOMAINT_ADVPrecord;
NPREC1:LSDOMAINT_NPrecord;
ADVPREC2:LSDOMAINT_ADVPrecord;
NPREC2:LSDOMAINT_NPrecord;
FUNCTION matchcondI1:BOOLEAN;
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
  PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>INDEFPRO THEN
        match:=FALSE;
      IF match THEN
        INDEFPROREC1:=s^.ls^.INDEFPROfield^;
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
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU4(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
      LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
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
                                                      FUNCTION EXIST2(mu:LSMRUQUO_ListOfStrees):Boolean;
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
  PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>WHPRO THEN
        match:=FALSE;
      IF match THEN
        WHPROREC1:=s^.ls^.WHPROfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      PROCEDURE Match_MU3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU3.first:=Lfirst;
          MU3.last:=Llast;
          match:=TRUE;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU3(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU3(NIL,NIL,TRUE,match) ELSE BEGIN
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU3(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
      LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
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
                                                        BEGIN{Exist2}
    next:=mu.first;match:=False;Lfinal:=mu.last;
    IF next =NIL THEN
      EXIST2:=False
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND NOT(match) DO
      BEGIN
        matchlist1items(next,TRUE,match);
        next:=next^.brother;
      END;
      IF match = False THEN
        matchlist1items(next,TRUE,match);
      EXIST2:=match;
    END;
  END;{Exist}
                                                      BEGIN
matchcondI1:=FALSE;
  IF
          ((((NOT Exist1(MU1)                                       )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((NOT Exist2(MU1)                                       )
                                                      )
                                                      )
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
    N^.ls^.cat := ADVP;
    N^.ls^.ADVPfield^ := ADVPREC1;
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
    IF s^.ls^.cat<>NP THEN
      match:=FALSE;
    IF match THEN
      NPREC2:=s^.ls^.NPfield^;
  END{MatchNode};
                                                        PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR
    itemmatch,listmatch:Boolean;
    PROCEDURE Match_MODREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>ADVP THEN
          match:=FALSE;
        IF match THEN
          ADVPREC2:=s^.ls^.ADVPfield^;
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
LlastM_1_1:=L;WHILE LlastM_1_1^.brother<>NIL DO
LlastM_1_1:=LlastM_1_1^.brother;
match_MU2(L,LlastM_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,MODREL
,match,matchnode,matchlist1items,lastmatchM_1) END;
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
        IF s^.ls^.cat<>NP THEN
          match:=FALSE;
        IF match THEN
          NPREC1:=s^.ls^.NPfield^;
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
LlastM_2_1:=L;WHILE LlastM_2_1^.brother<>NIL DO
LlastM_2_1:=LlastM_2_1^.brother;
match_MU1(L,LlastM_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_2) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_MODREL,matchlist1items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2) AND (s^.li^.n <=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,MODREL,HEAD,match,matchnode,matchlist2items,lastmatch) END;
                                                      PROCEDURE ACTION15;
BEGIN
ADVPREC1:=ADVPREC2;                                   ;
ADVPREC1.SUPERDEIXIS:=NPREC2.SUPERDEIXIS
                                                      ;
NPREC1:=NPREC2;                                       ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result:=TRUE
AND
(NPREC1.req=NPREC2.req)AND
(NPREC1.env=NPREC2.env)AND
(NPREC1.class=NPREC2.class)AND
(NPREC1.deixis=NPREC2.deixis)AND
(NPREC1.aspect=NPREC2.aspect)AND
(NPREC1.retro=NPREC2.retro)AND
(NPREC1.definite=NPREC2.definite)AND
(NPREC1.person=NPREC2.person)AND
(NPREC1.number=NPREC2.number)AND
(NPREC1.genders=NPREC2.genders)AND
(NPREC1.sexes=NPREC2.sexes)AND
(NPREC1.actsubcs=NPREC2.actsubcs)AND
(NPREC1.temporal=NPREC2.temporal)AND
(NPREC1.possgeni=NPREC2.possgeni)AND
(NPREC1.animate=NPREC2.animate)AND
(NPREC1.human=NPREC2.human)AND
(NPREC1.actcomas=NPREC2.actcomas)AND
(NPREC1.thetanp=NPREC2.thetanp)AND
(NPREC1.nounpatternefs=NPREC2.nounpatternefs)AND
(NPREC1.posspred=NPREC2.posspred)AND
(NPREC1.possnietnp=NPREC2.possnietnp)AND
(NPREC1.mood=NPREC2.mood)AND
(NPREC1.possRform=NPREC2.possRform)AND
(NPREC1.syntquant=NPREC2.syntquant)AND
(NPREC1.NPhead=NPREC2.NPhead)AND
(NPREC1.specQ=NPREC2.specQ)AND
(NPREC1.coord=NPREC2.coord)
;except1:=result
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
IF ((PREXPADV IN ADVPREC2.ACTSUBCEFS                       )
                                                      )
THEN IF
          ((except1                                               )
                                                      )
THEN IF
          ((NPREC1.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
THEN IF
          ((NPREC1.GENERIC =OMEGAGENERIC                          )
                                                      )
THEN IF
          ((ADVPREC2.SUPERDEIXIS =OMEGADEIXIS                     )
                                                      )
                                                       THEN
  BEGIN
  MAKET_ADVPrec(ADVPREC1);
  action15;
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
                                                      DECRNPMODADVP:=result
END;
{:RNPMODADVP}
{rule:}
{:TNPENDELETION1}
 FUNCTION DECTNPENDELETION1(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
REL3:LSDOMAINT_synrel;
ENREC1tree:LSSTREE_pStree;
T11:LSSTREE_pStree;
T1:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU11:LSMRUQUO_ListOfStrees;
DETPREC1:LSDOMAINT_DETPrecord;
ENREC1:LSDOMAINT_ENrecord;
CNREC1:LSDOMAINT_CNrecord;
CNREC2:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
FUNCTION matchcondI5:BOOLEAN;
                                                      BEGIN
matchcondI5:=FALSE;
  IF
          (((MU2.first<>NIL)
                                                      )
OR
          ((MU3.first<>NIL)
                                                      )
                                                      )
                                                      THEN 
matchcondI5:=TRUE;

END;{matchcondI5}
FUNCTION matchcondI13:BOOLEAN;
FUNCTION casefile1:BOOLEAN;
BEGIN IF
T1^.cat IN [
SENTENCE] THEN CASE T1^.cat OF
SENTENCE:casefile1:=(T1^.ls^.SENTENCEfield^.MOOD =RELATIVE                                            );
END
END;
                                                      BEGIN
matchcondI13:=FALSE;
  IF
          ((((REL3 IN [POSTMODREL,
POSREL,
MODREL]                                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((T1^.CAT IN [PREPP]                                               )
                                                      )
                                                      )
OR
          ((T1^.cat IN [SENTENCE]                                            ) AND 
((casefile1                                             )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      THEN 
matchcondI13:=TRUE;

END;{matchcondI13}
FUNCTION matchcondI3:BOOLEAN;
FUNCTION ALL1(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
lastmatch:BOOLEAN;
      match:Boolean;
PROCEDURE Match_REL3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR matchcond:BOOLEAN;
  Stree:LSSTREE_pStree;
  lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
    LSMATCHES_matchtreeVarConVar(Lfirst,Llast,first,REL3,T1,match,matchcondI13,lastmatch);
END;
                                                        BEGIN{All1}
    next:=mu.first;match:=TRUE;
    IF next =NIL THEN
      ALL1:=TRUE
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND (match) DO
      BEGIN
        match_REL3(next,next,TRUE,match);
        next:=next^.brother;
      END;
      IF match THEN
      BEGIN
        match_REL3(next,mu.last,TRUE,match);
        ALL1:=match;
      END
      ELSE
        ALL1:=FALSE;
    END;
  END;{All}
                                                      BEGIN
matchcondI3:=FALSE;
  IF
          ((ALL1(MU3)                                             )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI2:BOOLEAN;
FUNCTION ALL1(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
lastmatch:BOOLEAN;
      match:Boolean;
PROCEDURE Match_MODREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR matchcond:BOOLEAN;
  Stree:LSSTREE_pStree;
  lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
    LSMATCHES_matchtreeEmp(Lfirst,Llast,first,MODREL,match,lastmatch);
END;
                                                        BEGIN{All1}
    next:=mu.first;match:=TRUE;
    IF next =NIL THEN
      ALL1:=TRUE
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND (match) DO
      BEGIN
        match_MODREL(next,next,TRUE,match);
        next:=next^.brother;
      END;
      IF match THEN
      BEGIN
        match_MODREL(next,mu.last,TRUE,match);
        ALL1:=match;
      END
      ELSE
        ALL1:=FALSE;
    END;
  END;{All}
                                                      BEGIN
matchcondI2:=FALSE;
  IF
          ((ALL1(MU2)                                             )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI11:BOOLEAN;
FUNCTION casefile1:BOOLEAN;
BEGIN IF
T11^.cat IN [
DET,DETP] THEN CASE T11^.cat OF
DET:casefile1:=(T11^.ls^.DETfield^.DEFINITE =DEF                                                 );
DETP:casefile1:=(T11^.ls^.DETPfield^.DEFINITE =DEF                                                 );
END
END;
                                                      BEGIN
matchcondI11:=FALSE;
  IF
          (((T11^.cat IN [DET,
DETP]                                                 ) AND 
((casefile1                                             )
                                                      )
                                                      )
OR
          (((T11^.CAT IN [ART]                                                 )
                                                      )
                                                      )
                                                      )
                                                      THEN 
matchcondI11:=TRUE;

END;{matchcondI11}
FUNCTION matchcondM:BOOLEAN;
FUNCTION ALL2(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
lastmatch:BOOLEAN;
      Linit_1,Lrest_1,Lfirst_1,Llast_1:LSSTREE_prelnode;
i_1:INTEGER;
nomoretrees_1,lastmatch_1:BOOLEAN;
Linit_2,Lrest_2,Lfirst_2,Llast_2:LSSTREE_prelnode;
i_2:INTEGER;
nomoretrees_2,lastmatch_2:BOOLEAN;
match:Boolean;
PROCEDURE Match_DETREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR matchcond:BOOLEAN;
  Stree:LSSTREE_pStree;
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>DETP THEN
      match:=FALSE;
    IF match THEN
      DETPREC1:=s^.ls^.DETPfield^;
  END{MatchNode};
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    PROCEDURE Match_MU11(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU11.first:=Lfirst;
        MU11.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU11(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeConVar(Lfirst,Llast,first,HEAD,T11,match,matchcondI11,lastmatch_2);
END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,Lfirst_1,Llast_1
,item2,Lfirst_2,Llast_2
) ELSE match_HEAD(Lfirst_2,Lfirst_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,DETREL
,HEAD,match,matchnode,matchlist2items,lastmatch) END;
                                                        BEGIN{All2}
    next:=mu.first;match:=TRUE;
    IF next =NIL THEN
      ALL2:=TRUE
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND (match) DO
      BEGIN
        match_DETREL(next,next,TRUE,match);
        next:=next^.brother;
      END;
      IF match THEN
      BEGIN
        match_DETREL(next,mu.last,TRUE,match);
        ALL2:=match;
      END
      ELSE
        ALL2:=FALSE;
    END;
  END;{All}
                                                      FUNCTION imply1:BOOLEAN;
BEGIN
IF ((NPREC1.NUMBER =SINGULAR                               )
                                                      )
                                                      
THEN imply1:=
((ALL2(MU1)                                             )
                                                      )
                                                       ELSE imply1:=TRUE;
END;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((imply1                                                )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM1:BOOLEAN;
FUNCTION ALL2(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
lastmatch:BOOLEAN;
      Linit_1,Lrest_1,Lfirst_1,Llast_1:LSSTREE_prelnode;
i_1:INTEGER;
nomoretrees_1,lastmatch_1:BOOLEAN;
Linit_2,Lrest_2,Lfirst_2,Llast_2:LSSTREE_prelnode;
i_2:INTEGER;
nomoretrees_2,lastmatch_2:BOOLEAN;
match:Boolean;
PROCEDURE Match_DETREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR matchcond:BOOLEAN;
  Stree:LSSTREE_pStree;
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>DETP THEN
      match:=FALSE;
    IF match THEN
      DETPREC1:=s^.ls^.DETPfield^;
  END{MatchNode};
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    PROCEDURE Match_MU11(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU11.first:=Lfirst;
        MU11.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU11(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeConVar(Lfirst,Llast,first,HEAD,T11,match,matchcondI11,lastmatch_2);
END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,Lfirst_1,Llast_1
,item2,Lfirst_2,Llast_2
) ELSE match_HEAD(Lfirst_2,Lfirst_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,DETREL
,HEAD,match,matchnode,matchlist2items,lastmatch) END;
                                                        BEGIN{All2}
    next:=mu.first;match:=TRUE;
    IF next =NIL THEN
      ALL2:=TRUE
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND (match) DO
      BEGIN
        match_DETREL(next,next,TRUE,match);
        next:=next^.brother;
      END;
      IF match THEN
      BEGIN
        match_DETREL(next,mu.last,TRUE,match);
        ALL2:=match;
      END
      ELSE
        ALL2:=FALSE;
    END;
  END;{All}
                                                      FUNCTION imply1:BOOLEAN;
BEGIN
IF ((NPREC1.NUMBER =SINGULAR                               )
                                                      )
                                                      
THEN imply1:=
((ALL2(MU1)                                             )
                                                      )
                                                       ELSE imply1:=TRUE;
END;
                                                      BEGIN
matchcondM1:=FALSE;
  IF
          ((imply1                                                )
                                                      )
                                                      THEN 
matchcondM1:=TRUE;

END;{matchcondM1}
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
        N^.ls^.cat := CN;
        N^.ls^.CNfield^ := CNREC1;
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
      PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := EN;
            N^.ls^.ENfield^ := ENREC1;
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
s:=ENREC1tree;
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
                                                          BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,CN,createnode,createlist1);
    END{HEAD};
                                                        BEGIN{createitem12}
  createHEAD(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU4(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU4}
    copylist(MU4,list);
    END{MU4};
                                                        BEGIN{createitem13}
  createMU4(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(NP);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
        IF s^.ls^.cat<>CN THEN
          match:=FALSE;
        IF match THEN
          CNREC2:=s^.ls^.CNfield^;
      END{MatchNode};
                                                            PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
        PROCEDURE Match_MU2(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU2.first:=Lfirst;
            MU2.last:=Llast;
            match:= matchcondI2;
          END
          ELSE match:=FALSE
        END;
                                                              PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
        PROCEDURE Match_MU3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU3.first:=Lfirst;
            MU3.last:=Llast;
            match:= matchcondI3;
          END
          ELSE match:=FALSE
        END;
                                                      BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU3,matchlist0items,
LlastM_2_2,LfirstM_2_2,LrestM_2_2,nomoretreesM_2_2) END;
      BEGIN {MatchList2Items}
        match:=FALSE;
        IF first THEN
          BEGIN 
        nomoretreesM_2_1:=False;
          LlastM_2_1:=NIL;LrestM_2_1:=L;LfirstM_2_1:=NIL;
          END
        ELSE
        BEGIN
          Match_MU2(LfirstM_2_1,LlastM_2_1,FALSE,match);
          IF NOT match THEN
            MatchList1Items(LrestM_2_1,FALSE,match);
        END;
        IF NOT(first OR nomoretreesM_2_1 OR match) THEN
          SelectLfirstAndLlast(LfirstM_2_1,LlastM_2_1,LrestM_2_1
,nomoretreesM_2_1,L);
        While (NOT match) AND (NOT nomoretreesM_2_1) DO
        BEGIN
          Match_MU2(LfirstM_2_1,LlastM_2_1,TRUE,itemmatch);
          IF itemmatch THEN
            MatchList1Items(LrestM_2_1,TRUE,listmatch);
          match:=(itemmatch AND listmatch);
          IF (NOT match) THEN
            SelectLfirstAndLlast(LfirstM_2_1,LlastM_2_1,LrestM_2_1
,nomoretreesM_2_1,L);
        END;{while}
        IF match THEN IF NOT MatchcondI5 THEN
          MatchList2Items(LrestM_2_1,FALSE,match);
      END;{MatchList2Items}
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist2items,lastmatchM_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_MU4(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU4.first:=Lfirst;
        MU4.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU4(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM_1,LlastM_1
,HEAD,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
) ELSE match_HEAD(LfirstM_2,LfirstM_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
                                                      PROCEDURE ACTION9;
BEGIN
CNREC1:=CNREC2;                                       ;
CNREC1.NUMBERS:=[PLURAL]                                              ;
CNREC1.POSSCOMAS:=[COUNT]                                               ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION15;
BEGIN
CNREC1:=CNREC2;                                       ;
CNREC1.NUMBERS:=[SINGULAR]                                            ;
CNREC1.POSSCOMAS:=[COUNT]                                               ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION16;
BEGIN

END;
                                                      BEGIN
m:=loopholes.retype(Is,LSSTREE_pstree);
LISTREE_InitSetOfTupleOfStrees(result);
match:=TRUE;
first:=TRUE;
matchmodel(m,first,match);
first:=FALSE;
  If match Then
  WHILE match AND NOT matchcondM DO
  BEGIN
  MatchModel(m,FALSE,match);
  END;
IF match THEN
 BEGIN
 END;
IF match THEN
  BEGIN
IF ((COUNT IN NPREC1.ACTCOMAS                              )
                                                      )
THEN IF
          ((COUNT IN CNREC2.POSSCOMAS                             )
                                                      )
                                                       THEN
  BEGIN
  IF ((NPREC1.NUMBER =PLURAL                                 )
                                                      )
                                                       THEN
    BEGIN
    MAKET_CNrec(CNREC1);
    MAKET_ENrec(ENREC1);
    hulpstree:=LDBLEX_read(auxkey('COUNTENKEY'));
    ENREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    ENREC1:=ENREC1tree^.ls^.ENfield^;
    action9;
    action16;
    createM1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
    END;
  IF ((NPREC1.NUMBER =SINGULAR                               )
                                                      )
                                                       THEN
    BEGIN
    MAKET_CNrec(CNREC1);
    MAKET_ENrec(ENREC1);
    hulpstree:=LDBLEX_read(auxkey('COUNTENKEY'));
    ENREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    ENREC1:=ENREC1tree^.ls^.ENfield^;
    action15;
    action16;
    createM1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
    END;
                                                        END;
                                                        END;
                                                      DECTNPENDELETION1:=result
END;
{:TNPENDELETION1}
{rule:}
{:TNPENDELETION2}
 FUNCTION DECTNPENDELETION2(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
REL1:LSDOMAINT_synrel;
REL3:LSDOMAINT_synrel;
ENREC1tree:LSSTREE_pStree;
T1:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
ENREC1:LSDOMAINT_ENrecord;
CNREC1:LSDOMAINT_CNrecord;
CNREC2:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
FUNCTION matchcondI5:BOOLEAN;
                                                      BEGIN
matchcondI5:=FALSE;
  IF
          (((MU2.first<>NIL)
                                                      )
OR
          ((MU3.first<>NIL)
                                                      )
                                                      )
                                                      THEN 
matchcondI5:=TRUE;

END;{matchcondI5}
FUNCTION matchcondI13:BOOLEAN;
FUNCTION casefile1:BOOLEAN;
BEGIN IF
T1^.cat IN [
SENTENCE] THEN CASE T1^.cat OF
SENTENCE:casefile1:=(T1^.ls^.SENTENCEfield^.MOOD =RELATIVE                                            );
END
END;
                                                      BEGIN
matchcondI13:=FALSE;
  IF
          ((((REL3 IN [POSTMODREL,
POSREL,
MODREL]                                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((T1^.CAT IN [PREPP]                                               )
                                                      )
                                                      )
OR
          ((T1^.cat IN [SENTENCE]                                            ) AND 
((casefile1                                             )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      THEN 
matchcondI13:=TRUE;

END;{matchcondI13}
FUNCTION matchcondI3:BOOLEAN;
FUNCTION ALL1(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
lastmatch:BOOLEAN;
      match:Boolean;
PROCEDURE Match_REL3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR matchcond:BOOLEAN;
  Stree:LSSTREE_pStree;
  lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
    LSMATCHES_matchtreeVarConVar(Lfirst,Llast,first,REL3,T1,match,matchcondI13,lastmatch);
END;
                                                        BEGIN{All1}
    next:=mu.first;match:=TRUE;
    IF next =NIL THEN
      ALL1:=TRUE
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND (match) DO
      BEGIN
        match_REL3(next,next,TRUE,match);
        next:=next^.brother;
      END;
      IF match THEN
      BEGIN
        match_REL3(next,mu.last,TRUE,match);
        ALL1:=match;
      END
      ELSE
        ALL1:=FALSE;
    END;
  END;{All}
                                                      BEGIN
matchcondI3:=FALSE;
  IF
          ((ALL1(MU3)                                             )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI2:BOOLEAN;
FUNCTION ALL1(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
lastmatch:BOOLEAN;
      match:Boolean;
PROCEDURE Match_MODREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR matchcond:BOOLEAN;
  Stree:LSSTREE_pStree;
  lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
    LSMATCHES_matchtreeEmp(Lfirst,Llast,first,MODREL,match,lastmatch);
END;
                                                        BEGIN{All1}
    next:=mu.first;match:=TRUE;
    IF next =NIL THEN
      ALL1:=TRUE
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND (match) DO
      BEGIN
        match_MODREL(next,next,TRUE,match);
        next:=next^.brother;
      END;
      IF match THEN
      BEGIN
        match_MODREL(next,mu.last,TRUE,match);
        ALL1:=match;
      END
      ELSE
        ALL1:=FALSE;
    END;
  END;{All}
                                                      BEGIN
matchcondI2:=FALSE;
  IF
          ((ALL1(MU2)                                             )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI11:BOOLEAN;
                                                      BEGIN
matchcondI11:=FALSE;
  IF
          ((REL1 IN [DETREL]                                              )
                                                      )
                                                      THEN 
matchcondI11:=TRUE;

END;{matchcondI11}
FUNCTION matchcondI1:BOOLEAN;
FUNCTION ALL1(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
lastmatch:BOOLEAN;
      match:Boolean;
PROCEDURE Match_REL1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR matchcond:BOOLEAN;
  Stree:LSSTREE_pStree;
  lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
    LSMATCHES_matchtreeVarConEmp(Lfirst,Llast,first,REL1,match,matchcondI11,lastmatch);
END;
                                                        BEGIN{All1}
    next:=mu.first;match:=TRUE;
    IF next =NIL THEN
      ALL1:=TRUE
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND (match) DO
      BEGIN
        match_REL1(next,next,TRUE,match);
        next:=next^.brother;
      END;
      IF match THEN
      BEGIN
        match_REL1(next,mu.last,TRUE,match);
        ALL1:=match;
      END
      ELSE
        ALL1:=FALSE;
    END;
  END;{All}
                                                      BEGIN
matchcondI1:=FALSE;
  IF
          ((ALL1(MU1)                                             )
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
        N^.ls^.cat := CN;
        N^.ls^.CNfield^ := CNREC1;
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
      PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := EN;
            N^.ls^.ENfield^ := ENREC1;
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
s:=ENREC1tree;
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
                                                          BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,CN,createnode,createlist1);
    END{HEAD};
                                                        BEGIN{createitem12}
  createHEAD(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU4(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU4}
    copylist(MU4,list);
    END{MU4};
                                                        BEGIN{createitem13}
  createMU4(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(NP);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
                                                      PROCEDURE MatchList3Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
    PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>CN THEN
          match:=FALSE;
        IF match THEN
          CNREC2:=s^.ls^.CNfield^;
      END{MatchNode};
                                                            PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
        PROCEDURE Match_MU2(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU2.first:=Lfirst;
            MU2.last:=Llast;
            match:= matchcondI2;
          END
          ELSE match:=FALSE
        END;
                                                              PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
        PROCEDURE Match_MU3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU3.first:=Lfirst;
            MU3.last:=Llast;
            match:= matchcondI3;
          END
          ELSE match:=FALSE
        END;
                                                      BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU3,matchlist0items,
LlastM_2_2,LfirstM_2_2,LrestM_2_2,nomoretreesM_2_2) END;
      BEGIN {MatchList2Items}
        match:=FALSE;
        IF first THEN
          BEGIN 
        nomoretreesM_2_1:=False;
          LlastM_2_1:=NIL;LrestM_2_1:=L;LfirstM_2_1:=NIL;
          END
        ELSE
        BEGIN
          Match_MU2(LfirstM_2_1,LlastM_2_1,FALSE,match);
          IF NOT match THEN
            MatchList1Items(LrestM_2_1,FALSE,match);
        END;
        IF NOT(first OR nomoretreesM_2_1 OR match) THEN
          SelectLfirstAndLlast(LfirstM_2_1,LlastM_2_1,LrestM_2_1
,nomoretreesM_2_1,L);
        While (NOT match) AND (NOT nomoretreesM_2_1) DO
        BEGIN
          Match_MU2(LfirstM_2_1,LlastM_2_1,TRUE,itemmatch);
          IF itemmatch THEN
            MatchList1Items(LrestM_2_1,TRUE,listmatch);
          match:=(itemmatch AND listmatch);
          IF (NOT match) THEN
            SelectLfirstAndLlast(LfirstM_2_1,LlastM_2_1,LrestM_2_1
,nomoretreesM_2_1,L);
        END;{while}
        IF match THEN IF NOT MatchcondI5 THEN
          MatchList2Items(LrestM_2_1,FALSE,match);
      END;{MatchList2Items}
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist2items,lastmatchM_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_MU4(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU4.first:=Lfirst;
        MU4.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU4(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM_1,LlastM_1
,HEAD,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
) ELSE match_HEAD(LfirstM_2,LfirstM_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
                                                      PROCEDURE ACTION5;
BEGIN
CNREC1:=CNREC2;                                       ;
CNREC1.NUMBERS:=[SINGULAR]                                            ;
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
IF ((MASS IN NPREC1.ACTCOMAS                               )
                                                      )
                                                       THEN
  BEGIN
  MAKET_CNrec(CNREC1);
  MAKET_ENrec(ENREC1);
  hulpstree:=LDBLEX_read(auxkey('MASSENKEY'));
  ENREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
  ENREC1:=ENREC1tree^.ls^.ENfield^;
  action5;
  createM1;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
                                                        END;
                                                      DECTNPENDELETION2:=result
END;
{:TNPENDELETION2}
{rule:}
{:FNPPOSTENDELETION}
 FUNCTION DECFNPPOSTENDELETION(Is:LISTREE_pStree):LISTREE_pstree;BEGIN
DECFNPPOSTENDELETION:=Is;
END;
{:FNPPOSTENDELETION}
{rule:}
{:FNPPREENDELETION}
 FUNCTION DECFNPPREENDELETION(Is:LISTREE_pStree):LISTREE_pstree;VAR result:LISTREE_pStree;
 m:LSSTREE_pstree;
 match:BOOLEAN;
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
REL3:LSDOMAINT_synrel;
T1:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
FUNCTION matchcondI5:BOOLEAN;
                                                      BEGIN
matchcondI5:=FALSE;
  IF
          (((MU2.first<>NIL)
                                                      )
OR
          ((MU3.first<>NIL)
                                                      )
                                                      )
                                                      THEN 
matchcondI5:=TRUE;

END;{matchcondI5}
FUNCTION matchcondI13:BOOLEAN;
FUNCTION casefile1:BOOLEAN;
BEGIN IF
T1^.cat IN [
SENTENCE] THEN CASE T1^.cat OF
SENTENCE:casefile1:=(T1^.ls^.SENTENCEfield^.MOOD =RELATIVE                                            );
END
END;
                                                      BEGIN
matchcondI13:=FALSE;
  IF
          ((((REL3 IN [POSTMODREL,
POSREL,
MODREL]                                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((((T1^.CAT IN [PREPP]                                               )
                                                      )
                                                      )
OR
          ((T1^.cat IN [SENTENCE]                                            ) AND 
((casefile1                                             )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      )
                                                      THEN 
matchcondI13:=TRUE;

END;{matchcondI13}
FUNCTION matchcondI3:BOOLEAN;
FUNCTION ALL1(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
lastmatch:BOOLEAN;
      match:Boolean;
PROCEDURE Match_REL3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR matchcond:BOOLEAN;
  Stree:LSSTREE_pStree;
  lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
    LSMATCHES_matchtreeVarConVar(Lfirst,Llast,first,REL3,T1,match,matchcondI13,lastmatch);
END;
                                                        BEGIN{All1}
    next:=mu.first;match:=TRUE;
    IF next =NIL THEN
      ALL1:=TRUE
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND (match) DO
      BEGIN
        match_REL3(next,next,TRUE,match);
        next:=next^.brother;
      END;
      IF match THEN
      BEGIN
        match_REL3(next,mu.last,TRUE,match);
        ALL1:=match;
      END
      ELSE
        ALL1:=FALSE;
    END;
  END;{All}
                                                      BEGIN
matchcondI3:=FALSE;
  IF
          ((ALL1(MU3)                                             )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI2:BOOLEAN;
FUNCTION ALL1(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
lastmatch:BOOLEAN;
      match:Boolean;
PROCEDURE Match_MODREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR matchcond:BOOLEAN;
  Stree:LSSTREE_pStree;
  lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
    LSMATCHES_matchtreeEmp(Lfirst,Llast,first,MODREL,match,lastmatch);
END;
                                                        BEGIN{All1}
    next:=mu.first;match:=TRUE;
    IF next =NIL THEN
      ALL1:=TRUE
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND (match) DO
      BEGIN
        match_MODREL(next,next,TRUE,match);
        next:=next^.brother;
      END;
      IF match THEN
      BEGIN
        match_MODREL(next,mu.last,TRUE,match);
        ALL1:=match;
      END
      ELSE
        ALL1:=FALSE;
    END;
  END;{All}
                                                      BEGIN
matchcondI2:=FALSE;
  IF
          ((ALL1(MU2)                                             )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI1:BOOLEAN;
FUNCTION ALL1(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
lastmatch:BOOLEAN;
      match:Boolean;
PROCEDURE Match_DETREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR matchcond:BOOLEAN;
  Stree:LSSTREE_pStree;
  lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
    LSMATCHES_matchtreeEmp(Lfirst,Llast,first,DETREL,match,lastmatch);
END;
                                                        BEGIN{All1}
    next:=mu.first;match:=TRUE;
    IF next =NIL THEN
      ALL1:=TRUE
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND (match) DO
      BEGIN
        match_DETREL(next,next,TRUE,match);
        next:=next^.brother;
      END;
      IF match THEN
      BEGIN
        match_DETREL(next,mu.last,TRUE,match);
        ALL1:=match;
      END
      ELSE
        ALL1:=FALSE;
    END;
  END;{All}
                                                      BEGIN
matchcondI1:=FALSE;
  IF
          ((ALL1(MU1)                                             )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

END;{matchcondI1}
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
                                                      PROCEDURE MatchList3Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
    PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>CN THEN
          match:=FALSE;
        IF match THEN
          CNREC1:=s^.ls^.CNfield^;
      END{MatchNode};
                                                            PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
        PROCEDURE Match_MU2(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU2.first:=Lfirst;
            MU2.last:=Llast;
            match:= matchcondI2;
          END
          ELSE match:=FALSE
        END;
                                                              PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
        PROCEDURE Match_MU3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU3.first:=Lfirst;
            MU3.last:=Llast;
            match:= matchcondI3;
          END
          ELSE match:=FALSE
        END;
                                                      BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU3,matchlist0items,
LlastM_2_2,LfirstM_2_2,LrestM_2_2,nomoretreesM_2_2) END;
      BEGIN {MatchList2Items}
        match:=FALSE;
        IF first THEN
          BEGIN 
        nomoretreesM_2_1:=False;
          LlastM_2_1:=NIL;LrestM_2_1:=L;LfirstM_2_1:=NIL;
          END
        ELSE
        BEGIN
          Match_MU2(LfirstM_2_1,LlastM_2_1,FALSE,match);
          IF NOT match THEN
            MatchList1Items(LrestM_2_1,FALSE,match);
        END;
        IF NOT(first OR nomoretreesM_2_1 OR match) THEN
          SelectLfirstAndLlast(LfirstM_2_1,LlastM_2_1,LrestM_2_1
,nomoretreesM_2_1,L);
        While (NOT match) AND (NOT nomoretreesM_2_1) DO
        BEGIN
          Match_MU2(LfirstM_2_1,LlastM_2_1,TRUE,itemmatch);
          IF itemmatch THEN
            MatchList1Items(LrestM_2_1,TRUE,listmatch);
          match:=(itemmatch AND listmatch);
          IF (NOT match) THEN
            SelectLfirstAndLlast(LfirstM_2_1,LlastM_2_1,LrestM_2_1
,nomoretreesM_2_1,L);
        END;{while}
        IF match THEN IF NOT MatchcondI5 THEN
          MatchList2Items(LrestM_2_1,FALSE,match);
      END;{MatchList2Items}
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist2items,lastmatchM_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_MU4(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU4.first:=Lfirst;
        MU4.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU4(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM_1,LlastM_1
,HEAD,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
) ELSE match_HEAD(LfirstM_2,LfirstM_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
                                                      BEGIN
result:=Is;
m:=loopholes.retype(Is,LSSTREE_pstree);
match:= TRUE;
MatchModel(m,TRUE,match);
 IF match THEN BEGIN
  IF ((TRUE                                                  )
                                                      )
                                                       THEN
    BEGIN
    result:=NIL;
    END;
                                                       END;
DECFNPPREENDELETION:=result
END;
{:FNPPREENDELETION}
{rule:}
{:TNPCNDELETION1}
 FUNCTION DECTNPCNDELETION1(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
LinitM_1_1,LrestM_1_1,LfirstM_1_1,LlastM_1_1:LSSTREE_prelnode;
iM_1_1:INTEGER;
nomoretreesM_1_1,lastmatchM_1_1:BOOLEAN;
LinitM_1_1_1,LrestM_1_1_1,LfirstM_1_1_1,LlastM_1_1_1:LSSTREE_prelnode;
iM_1_1_1:INTEGER;
nomoretreesM_1_1_1,lastmatchM_1_1_1:BOOLEAN;
LinitM_2,LrestM_2,LfirstM_2,LlastM_2:LSSTREE_prelnode;
iM_2:INTEGER;
nomoretreesM_2,lastmatchM_2:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
ENREC1tree:LSSTREE_pStree;
MU4:LSMRUQUO_ListOfStrees;
MU1:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
CNREC2:LSDOMAINT_CNrecord;
ENREC1:LSDOMAINT_ENrecord;
CNREC1:LSDOMAINT_CNrecord;
DETREC1:LSDOMAINT_DETrecord;
DETPREC1:LSDOMAINT_DETPrecord;
NPREC1:LSDOMAINT_NPrecord;
FUNCTION matchcondI1:BOOLEAN;
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
  PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>CN THEN
        match:=FALSE;
      IF match THEN
        CNREC2:=s^.ls^.CNfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      PROCEDURE Match_MU3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU3.first:=Lfirst;
          MU3.last:=Llast;
          match:=TRUE;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU3(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU3(NIL,NIL,TRUE,match) ELSE BEGIN
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU3(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
      LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
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
    N^.ls^.cat := NP;
    N^.ls^.NPfield^ := NPREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createDETREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := DETP;
        N^.ls^.DETPfield^ := DETPREC1;
      END{CreateNode};
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      VAR list:LSMRUQUO_ListOfStrees;
      PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := DET;
            N^.ls^.DETfield^ := DETREC1;
          END{CreateNode};
                                                                PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          VAR list:LSMRUQUO_ListOfStrees;
          PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createMU4(VAR list:LSMRUQUO_ListOfStrees);
            BEGIN{MU4}
            copylist(MU4,list);
            END{MU4};
                                                                BEGIN{createitem21}
          createMU4(list);
          END;
          BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem21);
          END{createlist1};
                                                              BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,DET,createnode,createlist1);
        END{HEAD};
                                                            BEGIN{createitem11}
      createHEAD(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
      END{createlist1};
                                                          BEGIN{DETREL}
LSMATCHES_createitem(list,DETREL,DETP,createnode,createlist1);
    END{DETREL};
                                                        BEGIN{createitem11}
  createDETREL(list);
  END;
  PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := CN;
        N^.ls^.CNfield^ := CNREC1;
      END{CreateNode};
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      VAR list:LSMRUQUO_ListOfStrees;
      PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := EN;
            N^.ls^.ENfield^ := ENREC1;
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
s:=ENREC1tree;
        relnode^.node:=s;
        END{HEAD};
                                                            BEGIN{createitem11}
      createHEAD(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
      END{createlist1};
                                                          BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,CN,createnode,createlist1);
    END{HEAD};
                                                        BEGIN{createitem12}
  createHEAD(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU1(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU1}
    copylist(MU1,list);
    END{MU1};
                                                        BEGIN{createitem13}
  createMU1(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist3items110(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(NP);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    PROCEDURE Match_DETREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>DETP THEN
          match:=FALSE;
        IF match THEN
          DETPREC1:=s^.ls^.DETPfield^;
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
            IF s^.ls^.cat<>DET THEN
              match:=FALSE;
            IF match THEN
              DETREC1:=s^.ls^.DETfield^;
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
LlastM_1_1_1:=L;WHILE LlastM_1_1_1^.brother<>NIL DO
LlastM_1_1_1:=LlastM_1_1_1^.brother;
match_MU4(L,LlastM_1_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
            LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM_1_1,LfirstM_1_1,LrestM_1_1,nomoretreesM_1_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,DETREL
,HEAD,match,matchnode,matchlist1items,lastmatchM_1) END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_DETREL(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_MU1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU1.first:=Lfirst;
        MU1.last:=Llast;
        match:= matchcondI1;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU1(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_RMfirst(L,match,item1,LfirstM_1,LlastM_1
,item2,LfirstM_2,LlastM_2
) ELSE match_DETREL(LfirstM_1,LfirstM_1,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,DETREL,match,matchnode,matchlist2items,lastmatch) END;
                                                      PROCEDURE ACTION3;
BEGIN
MAKET_CNrec(CNREC1);                                  ;
CNREC1.NUMBERS:=
[PLURAL]                                              ;CNREC1.POSSCOMAS:=
[COUNT]                                               ;                                                     ;wbonus:=0;sbonus:=0

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
IF ((COUNT IN NPREC1.ACTCOMAS                              )
                                                      )
THEN IF
          ((NPREC1.NPHEAD =ENOKNP                                 )
                                                      )
THEN IF
          ((NPREC1.NUMBER =PLURAL                                 )
                                                      )
                                                       THEN
  BEGIN
  MAKET_CNrec(CNREC1);
  MAKET_ENrec(ENREC1);
  hulpstree:=LDBLEX_read(auxkey('COUNTENKEY'));
  ENREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
  ENREC1:=ENREC1tree^.ls^.ENfield^;
  action3;
  createM1;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
                                                        END;
                                                      DECTNPCNDELETION1:=result
END;
{:TNPCNDELETION1}
{rule:}
{:TNPCNDELETION2}
 FUNCTION DECTNPCNDELETION2(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
LinitM_1_1,LrestM_1_1,LfirstM_1_1,LlastM_1_1:LSSTREE_prelnode;
iM_1_1:INTEGER;
nomoretreesM_1_1,lastmatchM_1_1:BOOLEAN;
LinitM_1_2,LrestM_1_2,LfirstM_1_2,LlastM_1_2:LSSTREE_prelnode;
iM_1_2:INTEGER;
nomoretreesM_1_2,lastmatchM_1_2:BOOLEAN;
LinitM_1_2_1,LrestM_1_2_1,LfirstM_1_2_1,LlastM_1_2_1:LSSTREE_prelnode;
iM_1_2_1:INTEGER;
nomoretreesM_1_2_1,lastmatchM_1_2_1:BOOLEAN;
LinitM_2,LrestM_2,LfirstM_2,LlastM_2:LSSTREE_prelnode;
iM_2:INTEGER;
nomoretreesM_2,lastmatchM_2:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
ENREC1tree:LSSTREE_pStree;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
CNREC2:LSDOMAINT_CNrecord;
ENREC1:LSDOMAINT_ENrecord;
CNREC1:LSDOMAINT_CNrecord;
QPREC1:LSDOMAINT_QPrecord;
DETPREC1:LSDOMAINT_DETPrecord;
NPREC1:LSDOMAINT_NPrecord;
FUNCTION matchcondI1:BOOLEAN;
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
  PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>CN THEN
        match:=FALSE;
      IF match THEN
        CNREC2:=s^.ls^.CNfield^;
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
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU2(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
      LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
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
    N^.ls^.cat := NP;
    N^.ls^.NPfield^ := NPREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createDETREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := DETP;
        N^.ls^.DETPfield^ := DETPREC1;
      END{CreateNode};
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      VAR list:LSMRUQUO_ListOfStrees;
      PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU3(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU3}
        copylist(MU3,list);
        END{MU3};
                                                            BEGIN{createitem11}
      createMU3(list);
      END;
      PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := QP;
            N^.ls^.QPfield^ := QPREC1;
          END{CreateNode};
                                                                PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          VAR list:LSMRUQUO_ListOfStrees;
          PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createMU4(VAR list:LSMRUQUO_ListOfStrees);
            BEGIN{MU4}
            copylist(MU4,list);
            END{MU4};
                                                                BEGIN{createitem21}
          createMU4(list);
          END;
          BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem21);
          END{createlist1};
                                                              BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,QP,createnode,createlist1);
        END{HEAD};
                                                            BEGIN{createitem12}
      createHEAD(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist2items01(wholelist,createitem11,createitem12);
      END{createlist1};
                                                          BEGIN{DETREL}
LSMATCHES_createitem(list,DETREL,DETP,createnode,createlist1);
    END{DETREL};
                                                        BEGIN{createitem11}
  createDETREL(list);
  END;
  PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := CN;
        N^.ls^.CNfield^ := CNREC1;
      END{CreateNode};
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      VAR list:LSMRUQUO_ListOfStrees;
      PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := EN;
            N^.ls^.ENfield^ := ENREC1;
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
s:=ENREC1tree;
        relnode^.node:=s;
        END{HEAD};
                                                            BEGIN{createitem11}
      createHEAD(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
      END{createlist1};
                                                          BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,CN,createnode,createlist1);
    END{HEAD};
                                                        BEGIN{createitem12}
  createHEAD(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU1(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU1}
    copylist(MU1,list);
    END{MU1};
                                                        BEGIN{createitem13}
  createMU1(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist3items110(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(NP);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    PROCEDURE Match_DETREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>DETP THEN
          match:=FALSE;
        IF match THEN
          DETPREC1:=s^.ls^.DETPfield^;
      END{MatchNode};
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        PROCEDURE Match_MU3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU3.first:=Lfirst;
            MU3.last:=Llast;
            match:=TRUE;
          END
          ELSE match:=FALSE
        END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU3(Lfirst,Llast,TRUE,match);
END;
        PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR matchcond:BOOLEAN;
          Stree:LSSTREE_pStree;
          lisons:LISTREE_pRelnode;
          PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
          BEGIN{MatchNode}
            IF s^.ls^.cat<>QP THEN
              match:=FALSE;
            IF match THEN
              QPREC1:=s^.ls^.QPfield^;
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
LlastM_1_2_1:=L;WHILE LlastM_1_2_1^.brother<>NIL DO
LlastM_1_2_1:=LlastM_1_2_1^.brother;
match_MU4(L,LlastM_1_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
            LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_1_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM_1_1,LlastM_1_1
,item2,LfirstM_1_2,LlastM_1_2
) ELSE match_HEAD(LfirstM_1_2,LfirstM_1_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,DETREL
,HEAD,match,matchnode,matchlist2items,lastmatchM_1) END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_DETREL(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_MU1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU1.first:=Lfirst;
        MU1.last:=Llast;
        match:= matchcondI1;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU1(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_RMfirst(L,match,item1,LfirstM_1,LlastM_1
,item2,LfirstM_2,LlastM_2
) ELSE match_DETREL(LfirstM_1,LfirstM_1,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,DETREL,match,matchnode,matchlist2items,lastmatch) END;
                                                      PROCEDURE ACTION1;
BEGIN
CNREC1.NUMBERS:=
[SINGULAR]                                            ;CNREC1.POSSCOMAS:=
[MASS]                                                ;                                                     ;wbonus:=0;sbonus:=0

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
IF ((MASS IN NPREC1.ACTCOMAS                               )
                                                      )
THEN IF
          ((NPREC1.NPHEAD =ENOKNP                                 )
                                                      )
THEN IF
          ((NPREC1.NUMBER =SINGULAR                               )
                                                      )
THEN IF
          ((NPREC1.DEFINITE =INDEF                                )
                                                      )
                                                       THEN
  BEGIN
  MAKET_CNrec(CNREC1);
  MAKET_ENrec(ENREC1);
  hulpstree:=LDBLEX_read(auxkey('MASSENKEY'));
  ENREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
  ENREC1:=ENREC1tree^.ls^.ENfield^;
  action1;
  createM1;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
                                                        END;
                                                      DECTNPCNDELETION2:=result
END;
{:TNPCNDELETION2}
{rule:}
{:FPOSTNPCNDELETION1}
 FUNCTION DECFPOSTNPCNDELETION1(Is:LISTREE_pStree):LISTREE_pstree;BEGIN
DECFPOSTNPCNDELETION1:=Is;
END;
{:FPOSTNPCNDELETION1}
{rule:}
{:FPOSTNPCNDELETION2}
 FUNCTION DECFPOSTNPCNDELETION2(Is:LISTREE_pStree):LISTREE_pstree;BEGIN
DECFPOSTNPCNDELETION2:=Is;
END;
{:FPOSTNPCNDELETION2}
{rule:}
{:RNPAPPOSITION}
 FUNCTION DECRNPAPPOSITION(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
LinitM_1_1,LrestM_1_1,LfirstM_1_1,LlastM_1_1:LSSTREE_prelnode;
iM_1_1:INTEGER;
nomoretreesM_1_1,lastmatchM_1_1:BOOLEAN;
LinitM_2,LrestM_2,LfirstM_2,LlastM_2:LSSTREE_prelnode;
iM_2:INTEGER;
nomoretreesM_2,lastmatchM_2:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
LinitM_3_1,LrestM_3_1,LfirstM_3_1,LlastM_3_1:LSSTREE_prelnode;
iM_3_1:INTEGER;
nomoretreesM_3_1,lastmatchM_3_1:BOOLEAN;
LinitM_4,LrestM_4,LfirstM_4,LlastM_4:LSSTREE_prelnode;
iM_4:INTEGER;
nomoretreesM_4,lastmatchM_4:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
PUNCREC2tree:LSSTREE_pStree;
PUNCREC1tree:LSSTREE_pStree;
PUNCREC3tree:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
SIG1:LSMRUQUO_ListOfStrees;
PUNCREC2:LSDOMAINT_PUNCrecord;
NPREC2:LSDOMAINT_NPrecord;
PUNCREC3:LSDOMAINT_PUNCrecord;
NPREC4:LSDOMAINT_NPrecord;
PUNCREC1:LSDOMAINT_PUNCrecord;
NPREC1:LSDOMAINT_NPrecord;
NPREC3:LSDOMAINT_NPrecord;
FUNCTION matchcondI1:BOOLEAN;
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
matchcondI1:=FALSE;
  IF
          ((ALL1(SIG1)                                            )
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
    N^.ls^.cat := NP;
    N^.ls^.NPfield^ := NPREC2;
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
                                                      BEGIN{createM}
m2:=MAKET_stree(NP);
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
  lirel3:LIDOMAINT_synrel;
  lsrel3:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>NP THEN
      match:=FALSE;
    IF match THEN
      NPREC3:=s^.ls^.NPfield^;
  END{MatchNode};
                                                        PROCEDURE MatchList4Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR
    itemmatch,listmatch:Boolean;
    PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>NP THEN
          match:=FALSE;
        IF match THEN
          NPREC1:=s^.ls^.NPfield^;
      END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU1(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM_1_1:=L;WHILE LlastM_1_1^.brother<>NIL DO
LlastM_1_1:=LlastM_1_1^.brother;
match_MU1(L,LlastM_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_1) END;
                                                          PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
,match,matchnode,matchlist0items,lastmatchM_2) END;
                                                            PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
    PROCEDURE Match_APPOSREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>NP THEN
          match:=FALSE;
        IF match THEN
          NPREC4:=s^.ls^.NPfield^;
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
LlastM_3_1:=L;WHILE LlastM_3_1^.brother<>NIL DO
LlastM_3_1:=LlastM_3_1^.brother;
match_MU4(L,LlastM_3_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,APPOSREL
,match,matchnode,matchlist1items,lastmatchM_3) END;
                                                              PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
    PROCEDURE Match_SIG1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        SIG1.first:=Lfirst;
        SIG1.last:=Llast;
        match:= matchcondI1;
      END
      ELSE match:=FALSE
    END;
                                                      BEGIN LSMATCHES_matchlistsigma
(L,first,match,match_SIG1,matchlist0items,
LlastM_4,LfirstM_4,LrestM_4,nomoretreesM_4,iM_4) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_APPOSREL,matchlist1items,
LlastM_3,LfirstM_3,LrestM_3,nomoretreesM_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PUNCREL,matchlist2items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist3items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=3) AND (s^.li^.n <=4)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar3rels(s,first,HEAD,PUNCREL,APPOSREL,match,matchnode,matchlist4items,lastmatch) END;
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
            PUNCREC3:=s^.ls^.PUNCfield^;
          IF match THEN match:=(s^.ls^.PUNCfield^.key=auxkey('KOMMAPUNCKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    PUNCREC3tree:=Lfirst^.node;
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
                                                      PROCEDURE ACTION11;
BEGIN
NPREC1:=NPREC3;                                       ;
LSMRUQUO_ASSIGNCASE(NPREC4,MU4,NPREC2,MU2,[NOMINATIVE])                                                     ;
NPREC2.CASES:=[NOMINATIVE]                                          ;
NPREC2.SUPERDEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
NPREC2.GENERIC:=NOGENERIC
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
  IF match THEN
    BEGIN
  IF ((NPREC1.NUMBER =NPREC4.NUMBER                          )
                                                      )
THEN IF
          ((NPREC1.MOOD =DECLXPMOOD                               )
                                                      )
THEN IF
          ((NPREC1.MOOD =NPREC4.MOOD                              )
                                                      )
THEN IF
          ((NPREC1.NPHEAD IN [PERSPRONP,
OTHERNP,
ALLESNP]                                              )
                                                      )
THEN IF
          ((NPREC4.NPHEAD IN [PERSPRONP,
OTHERNP,
ALLESNP]                                              )
                                                      )
THEN IF
          ((NPREC4.GENERIC =OMEGAGENERIC                          )
                                                      )
THEN IF
          ((NPREC4.CASES =NPREC1.CASES                            )
                                                      )
                                                       THEN
    BEGIN
    MAKET_NPrec(NPREC2);
    action11;
    previous1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(m2,LISTREE_pstree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
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
                                                      PROCEDURE ACTION29;
BEGIN
NPREC1:=NPREC3;                                       ;
LSMRUQUO_ASSIGNCASE(NPREC4,MU4,NPREC2,MU2,[NOMINATIVE])                                                     ;
NPREC2.SUPERDEIXIS:=NPREC1.SUPERDEIXIS
                                                      ;
NPREC2.GENERIC:=NOGENERIC
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchlistSIG1(SIG1.first,SIG1.last,match,TRUE);
  IF match THEN
    BEGIN
  IF ((NPREC1.NUMBER =NPREC4.NUMBER                          )
                                                      )
THEN IF
          ((NPREC1.MOOD =DECLXPMOOD                               )
                                                      )
THEN IF
          ((NPREC1.MOOD =NPREC4.MOOD                              )
                                                      )
THEN IF
          ((NPREC1.NPHEAD IN [PERSPRONP,
OTHERNP,
ALLESNP]                                              )
                                                      )
THEN IF
          ((NPREC4.NPHEAD IN [PERSPRONP,
OTHERNP,
ALLESNP]                                              )
                                                      )
THEN IF
          ((NPREC4.GENERIC =OMEGAGENERIC                          )
                                                      )
THEN IF
          ((NPREC4.CASES =NPREC1.CASES                            )
                                                      )
                                                       THEN
    BEGIN
    MAKET_NPrec(NPREC2);
    action29;
    previous1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(m2,LISTREE_pstree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
    END;
                                                          END;
                                                       subrule0X2:=result
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
  LISTREE_mergesetsoftuplestrees(subrule0X1,result);
  LISTREE_mergesetsoftuplestrees(subrule0X2,result);
 END;
DECRNPAPPOSITION:=result
END;
{:RNPAPPOSITION}
