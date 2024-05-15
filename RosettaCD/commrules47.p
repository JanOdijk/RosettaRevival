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
pragma C_include('commrules47.pf');
END;
PROGRAM comMrules47;
WITH globsubst,listree,limatches,lsmatches,
lidomaint,liiddict,lsdomaint,maket,lsstree,
copyt,mem,
gidderiv,hyperdtree,strtokey,lsmruquo,
lsauxdom,ldblex;
TYPE synrelset=SET OF LSDOMAINT_synrel;
VAR hulpstree:LISTREE_pstree;
 VPID:LSDOMAINT_synpatternsettype;
hulplsstree:LSSTREE_pstree;
 PROCEDURE commrules47_init;
BEGIN
END;
{rule:}
{:TNPADJQPCOMPLEXTRAPOS1}
 FUNCTION COMTNPADJQPCOMPLEXTRAPOS1(Is1:LISTREE_pStree
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
LinitM1_2_2,LrestM1_2_2,LfirstM1_2_2,LlastM1_2_2:LSSTREE_prelnode;
iM1_2_2:INTEGER;
nomoretreesM1_2_2,lastmatchM1_2_2:BOOLEAN;
LinitM1_2_2_1,LrestM1_2_2_1,LfirstM1_2_2_1,LlastM1_2_2_1:LSSTREE_prelnode;
iM1_2_2_1:INTEGER;
nomoretreesM1_2_2_1,lastmatchM1_2_2_1:BOOLEAN;
LinitM1_2_2_2,LrestM1_2_2_2,LfirstM1_2_2_2,LlastM1_2_2_2:LSSTREE_prelnode;
iM1_2_2_2:INTEGER;
nomoretreesM1_2_2_2,lastmatchM1_2_2_2:BOOLEAN;
LinitM1_2_2_2_1,LrestM1_2_2_2_1,LfirstM1_2_2_2_1,LlastM1_2_2_2_1:LSSTREE_prelnode;
iM1_2_2_2_1:INTEGER;
nomoretreesM1_2_2_2_1,lastmatchM1_2_2_2_1:BOOLEAN;
LinitM1_2_2_3,LrestM1_2_2_3,LfirstM1_2_2_3,LlastM1_2_2_3:LSSTREE_prelnode;
iM1_2_2_3:INTEGER;
nomoretreesM1_2_2_3,lastmatchM1_2_2_3:BOOLEAN;
LinitM1_2_2_4,LrestM1_2_2_4,LfirstM1_2_2_4,LlastM1_2_2_4:LSSTREE_prelnode;
iM1_2_2_4:INTEGER;
nomoretreesM1_2_2_4,lastmatchM1_2_2_4:BOOLEAN;
LinitM1_2_3,LrestM1_2_3,LfirstM1_2_3,LlastM1_2_3:LSSTREE_prelnode;
iM1_2_3:INTEGER;
nomoretreesM1_2_3,lastmatchM1_2_3:BOOLEAN;
 m1:LSSTREE_pstree;
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
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
          lirel2:LIDOMAINT_synrel;
          lsrel2:LSDOMAINT_synrel;
          PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
          BEGIN{MatchNode}
            IF s^.ls^.cat<>ADJP THEN
              match:=FALSE;
            IF match THEN
              ADJPREC1:=s^.ls^.ADJPfield^;
          END{MatchNode};
                                                                PROCEDURE MatchList4Items
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
                                                                  PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            VAR
              itemmatch,listmatch:Boolean;
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
LlastM1_2_2_2_1:=L;WHILE LlastM1_2_2_2_1^.brother<>NIL DO
LlastM1_2_2_2_1:=LlastM1_2_2_2_1^.brother;
match_MU3(L,LlastM1_2_2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
                LSMATCHES_matchtree0rels(Lfirst,Llast,first,DEGREEMODREL
,match,matchnode,matchlist1items,lastmatchM1_2_2_2) END;
                                                                    PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
              VAR
                itemmatch,listmatch:Boolean;
            PROCEDURE Match_MU5(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            BEGIN{match}
              IF first THEN BEGIN
                MU5.first:=Lfirst;
                MU5.last:=Llast;
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
                LSMATCHES_matchtreeConVar(Lfirst,Llast,first,EXTRAPOSREL,T1,match,matchcondI1,lastmatchM1_2_2_4);
END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_EXTRAPOSREL,matchlist0items,
LlastM1_2_2_4,LfirstM1_2_2_4,LrestM1_2_2_4,nomoretreesM1_2_2_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU5,matchlist1items,
LlastM1_2_2_3,LfirstM1_2_2_3,LrestM1_2_2_3,nomoretreesM1_2_2_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_DEGREEMODREL,matchlist2items,
LlastM1_2_2_2,LfirstM1_2_2_2,LrestM1_2_2_2,nomoretreesM1_2_2_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU4,matchlist3items,
LlastM1_2_2_1,LfirstM1_2_2_1,LrestM1_2_2_1,nomoretreesM1_2_2_1) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=2)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree2rels(Lfirst,Llast,first,MODREL
,DEGREEMODREL,EXTRAPOSREL,match,matchnode,matchlist4items,lastmatchM1_2_2) END;
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
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) ELSE BEGIN match_MODREL(LfirstM1_2_2,LfirstM1_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,MODREL,match,matchnode,matchlist3items,lastmatchM1_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM1_1,LlastM1_1
,item2,LfirstM1_2,LlastM1_2
) ELSE match_HEAD(LfirstM1_2,LfirstM1_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist2items,lastmatch) END;
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
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
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
                                                        BEGIN{createitem13}
  createEXTRAPOSREL(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist3items011(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m:=MAKET_stree(NP);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION0;
BEGIN
;wbonus:=0;sbonus:=0

END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
  BEGIN
 END;
IF match THEN
  BEGIN
  IF ((TRUE                                                  )
                                                      )
                                                       THEN
    BEGIN
    action0;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                      COMTNPADJQPCOMPLEXTRAPOS1:=result
END;
{:TNPADJQPCOMPLEXTRAPOS1}
{rule:}
{:FPOSTNPADJQPCOMPLEXTRAPOS1}
 FUNCTION COMFPOSTNPADJQPCOMPLEXTRAPOS1(Is:LISTREE_pStree):LISTREE_pstree;VAR result:LISTREE_pStree;
 m:LSSTREE_pstree;
 match:BOOLEAN;
LinitM1_1,LrestM1_1,LfirstM1_1,LlastM1_1:LSSTREE_prelnode;
iM1_1:INTEGER;
nomoretreesM1_1,lastmatchM1_1:BOOLEAN;
LinitM1_2,LrestM1_2,LfirstM1_2,LlastM1_2:LSSTREE_prelnode;
iM1_2:INTEGER;
nomoretreesM1_2,lastmatchM1_2:BOOLEAN;
LinitM1_2_1,LrestM1_2_1,LfirstM1_2_1,LlastM1_2_1:LSSTREE_prelnode;
iM1_2_1:INTEGER;
nomoretreesM1_2_1,lastmatchM1_2_1:BOOLEAN;
LinitM1_2_2,LrestM1_2_2,LfirstM1_2_2,LlastM1_2_2:LSSTREE_prelnode;
iM1_2_2:INTEGER;
nomoretreesM1_2_2,lastmatchM1_2_2:BOOLEAN;
LinitM1_2_2_1,LrestM1_2_2_1,LfirstM1_2_2_1,LlastM1_2_2_1:LSSTREE_prelnode;
iM1_2_2_1:INTEGER;
nomoretreesM1_2_2_1,lastmatchM1_2_2_1:BOOLEAN;
LinitM1_2_2_2,LrestM1_2_2_2,LfirstM1_2_2_2,LlastM1_2_2_2:LSSTREE_prelnode;
iM1_2_2_2:INTEGER;
nomoretreesM1_2_2_2,lastmatchM1_2_2_2:BOOLEAN;
LinitM1_2_2_2_1,LrestM1_2_2_2_1,LfirstM1_2_2_2_1,LlastM1_2_2_2_1:LSSTREE_prelnode;
iM1_2_2_2_1:INTEGER;
nomoretreesM1_2_2_2_1,lastmatchM1_2_2_2_1:BOOLEAN;
LinitM1_2_2_3,LrestM1_2_2_3,LfirstM1_2_2_3,LlastM1_2_2_3:LSSTREE_prelnode;
iM1_2_2_3:INTEGER;
nomoretreesM1_2_2_3,lastmatchM1_2_2_3:BOOLEAN;
LinitM1_2_2_4,LrestM1_2_2_4,LfirstM1_2_2_4,LlastM1_2_2_4:LSSTREE_prelnode;
iM1_2_2_4:INTEGER;
nomoretreesM1_2_2_4,lastmatchM1_2_2_4:BOOLEAN;
LinitM1_2_3,LrestM1_2_3,LfirstM1_2_3,LlastM1_2_3:LSSTREE_prelnode;
iM1_2_3:INTEGER;
nomoretreesM1_2_3,lastmatchM1_2_3:BOOLEAN;
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
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
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>NP THEN
      match:=FALSE;
    IF match THEN
      NPREC1:=s^.ls^.NPfield^;
  END{MatchNode};
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
          lirel2:LIDOMAINT_synrel;
          lsrel2:LSDOMAINT_synrel;
          PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
          BEGIN{MatchNode}
            IF s^.ls^.cat<>ADJP THEN
              match:=FALSE;
            IF match THEN
              ADJPREC1:=s^.ls^.ADJPfield^;
          END{MatchNode};
                                                                PROCEDURE MatchList4Items
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
                                                                  PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            VAR
              itemmatch,listmatch:Boolean;
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
LlastM1_2_2_2_1:=L;WHILE LlastM1_2_2_2_1^.brother<>NIL DO
LlastM1_2_2_2_1:=LlastM1_2_2_2_1^.brother;
match_MU3(L,LlastM1_2_2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
                LSMATCHES_matchtree0rels(Lfirst,Llast,first,DEGREEMODREL
,match,matchnode,matchlist1items,lastmatchM1_2_2_2) END;
                                                                    PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
              VAR
                itemmatch,listmatch:Boolean;
            PROCEDURE Match_MU5(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            BEGIN{match}
              IF first THEN BEGIN
                MU5.first:=Lfirst;
                MU5.last:=Llast;
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
                LSMATCHES_matchtreeConVar(Lfirst,Llast,first,EXTRAPOSREL,T1,match,matchcondI1,lastmatchM1_2_2_4);
END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_EXTRAPOSREL,matchlist0items,
LlastM1_2_2_4,LfirstM1_2_2_4,LrestM1_2_2_4,nomoretreesM1_2_2_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU5,matchlist1items,
LlastM1_2_2_3,LfirstM1_2_2_3,LrestM1_2_2_3,nomoretreesM1_2_2_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_DEGREEMODREL,matchlist2items,
LlastM1_2_2_2,LfirstM1_2_2_2,LrestM1_2_2_2,nomoretreesM1_2_2_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU4,matchlist3items,
LlastM1_2_2_1,LfirstM1_2_2_1,LrestM1_2_2_1,nomoretreesM1_2_2_1) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=2)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree2rels(Lfirst,Llast,first,MODREL
,DEGREEMODREL,EXTRAPOSREL,match,matchnode,matchlist4items,lastmatchM1_2_2) END;
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
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) ELSE BEGIN match_MODREL(LfirstM1_2_2,LfirstM1_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,MODREL,match,matchnode,matchlist3items,lastmatchM1_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM1_1,LlastM1_1
,item2,LfirstM1_2,LlastM1_2
) ELSE match_HEAD(LfirstM1_2,LfirstM1_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist2items,lastmatch) END;
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
COMFPOSTNPADJQPCOMPLEXTRAPOS1:=result
END;
{:FPOSTNPADJQPCOMPLEXTRAPOS1}
{rule:}
{:FPRENPADJQPCOMPLEXTRAPOS1}
 FUNCTION COMFPRENPADJQPCOMPLEXTRAPOS1(Is:LISTREE_pStree):LISTREE_pstree;BEGIN
COMFPRENPADJQPCOMPLEXTRAPOS1:=Is;
END;
{:FPRENPADJQPCOMPLEXTRAPOS1}
{rule:}
{:TNPNOTOOMEGA1}
 FUNCTION COMTNPNOTOOMEGA1(Is1:LISTREE_pStree
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
LinitM1_2_2,LrestM1_2_2,LfirstM1_2_2,LlastM1_2_2:LSSTREE_prelnode;
iM1_2_2:INTEGER;
nomoretreesM1_2_2,lastmatchM1_2_2:BOOLEAN;
LinitM1_2_2_1,LrestM1_2_2_1,LfirstM1_2_2_1,LlastM1_2_2_1:LSSTREE_prelnode;
iM1_2_2_1:INTEGER;
nomoretreesM1_2_2_1,lastmatchM1_2_2_1:BOOLEAN;
LinitM1_2_2_2,LrestM1_2_2_2,LfirstM1_2_2_2,LlastM1_2_2_2:LSSTREE_prelnode;
iM1_2_2_2:INTEGER;
nomoretreesM1_2_2_2,lastmatchM1_2_2_2:BOOLEAN;
LinitM1_2_2_2_1,LrestM1_2_2_2_1,LfirstM1_2_2_2_1,LlastM1_2_2_2_1:LSSTREE_prelnode;
iM1_2_2_2_1:INTEGER;
nomoretreesM1_2_2_2_1,lastmatchM1_2_2_2_1:BOOLEAN;
LinitM1_2_2_3,LrestM1_2_2_3,LfirstM1_2_2_3,LlastM1_2_2_3:LSSTREE_prelnode;
iM1_2_2_3:INTEGER;
nomoretreesM1_2_2_3,lastmatchM1_2_2_3:BOOLEAN;
LinitM1_2_3,LrestM1_2_3,LfirstM1_2_3,LlastM1_2_3:LSSTREE_prelnode;
iM1_2_3:INTEGER;
nomoretreesM1_2_3,lastmatchM1_2_3:BOOLEAN;
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
 m1:LSSTREE_pstree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
MU7:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
ADJREC1:LSDOMAINT_ADJrecord;
ADJPREC1:LSDOMAINT_ADJPrecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
ADJPREC2:LSDOMAINT_ADJPrecord;
ADJREC2:LSDOMAINT_ADJrecord;
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
              ADJPREC1:=s^.ls^.ADJPfield^;
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
                  ADJREC1:=s^.ls^.ADJfield^;
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
LlastM1_2_2_2_1:=L;WHILE LlastM1_2_2_2_1^.brother<>NIL DO
LlastM1_2_2_2_1:=LlastM1_2_2_2_1^.brother;
match_MU6(L,LlastM1_2_2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
                LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM1_2_2_2) END;
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_2_2_1,LlastM1_2_2_1
,HEAD,item2,LfirstM1_2_2_2,LlastM1_2_2_2
,item3,LfirstM1_2_2_3,LlastM1_2_2_3
) ELSE match_HEAD(LfirstM1_2_2_2,LfirstM1_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtreeCon1rels(Lfirst,Llast,first,MODREL
,HEAD,match,matchnode,matchlist3items,lastmatchM1_2_2,matchcondI1) END;
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
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) ELSE BEGIN match_MODREL(LfirstM1_2_2,LfirstM1_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,MODREL,match,matchnode,matchlist3items,lastmatchM1_2) END;
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,HEAD,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) ELSE match_HEAD(LfirstM1_2,LfirstM1_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
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
            N^.ls^.ADJPfield^ := ADJPREC2;
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
                N^.ls^.ADJfield^ := ADJREC2;
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
m:=MAKET_stree(NP);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION7;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=OMEGAFORM
                                                      ;
ADJREC2:=ADJREC1;                                     ;
ADJREC2.EORENFORM:=OMEGAFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
  BEGIN
 END;
IF match THEN
  BEGIN
  IF ((ADJREC1.EORENFORM =NOFORM                             )
                                                      )
                                                       THEN
    BEGIN
    MAKET_ADJPrec(ADJPREC2);
    MAKET_ADJrec(ADJREC2);
    action7;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                      COMTNPNOTOOMEGA1:=result
END;
{:TNPNOTOOMEGA1}
{rule:}
{:TNPNOTOOMEGA2}
 FUNCTION COMTNPNOTOOMEGA2(Is1:LISTREE_pStree
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
LinitM1_2_2,LrestM1_2_2,LfirstM1_2_2,LlastM1_2_2:LSSTREE_prelnode;
iM1_2_2:INTEGER;
nomoretreesM1_2_2,lastmatchM1_2_2:BOOLEAN;
LinitM1_2_2_1,LrestM1_2_2_1,LfirstM1_2_2_1,LlastM1_2_2_1:LSSTREE_prelnode;
iM1_2_2_1:INTEGER;
nomoretreesM1_2_2_1,lastmatchM1_2_2_1:BOOLEAN;
LinitM1_2_2_2,LrestM1_2_2_2,LfirstM1_2_2_2,LlastM1_2_2_2:LSSTREE_prelnode;
iM1_2_2_2:INTEGER;
nomoretreesM1_2_2_2,lastmatchM1_2_2_2:BOOLEAN;
LinitM1_2_2_2_1,LrestM1_2_2_2_1,LfirstM1_2_2_2_1,LlastM1_2_2_2_1:LSSTREE_prelnode;
iM1_2_2_2_1:INTEGER;
nomoretreesM1_2_2_2_1,lastmatchM1_2_2_2_1:BOOLEAN;
LinitM1_2_2_2_2,LrestM1_2_2_2_2,LfirstM1_2_2_2_2,LlastM1_2_2_2_2:LSSTREE_prelnode;
iM1_2_2_2_2:INTEGER;
nomoretreesM1_2_2_2_2,lastmatchM1_2_2_2_2:BOOLEAN;
LinitM1_2_2_2_2_1,LrestM1_2_2_2_2_1,LfirstM1_2_2_2_2_1,LlastM1_2_2_2_2_1:LSSTREE_prelnode;
iM1_2_2_2_2_1:INTEGER;
nomoretreesM1_2_2_2_2_1,lastmatchM1_2_2_2_2_1:BOOLEAN;
LinitM1_2_2_3,LrestM1_2_2_3,LfirstM1_2_2_3,LlastM1_2_2_3:LSSTREE_prelnode;
iM1_2_2_3:INTEGER;
nomoretreesM1_2_2_3,lastmatchM1_2_2_3:BOOLEAN;
LinitM1_2_3,LrestM1_2_3,LfirstM1_2_3,LlastM1_2_3:LSSTREE_prelnode;
iM1_2_3:INTEGER;
nomoretreesM1_2_3,lastmatchM1_2_3:BOOLEAN;
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
 m1:LSSTREE_pstree;
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
VERBPREC1:LSDOMAINT_VERBPrecord;
SENTENCEREC1:LSDOMAINT_SENTENCErecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
VERBREC2:LSDOMAINT_VERBrecord;
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
                      VERBREC1:=s^.ls^.VERBfield^;
                    IF match THEN
                      match:= matchcondI2;
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
LlastM1_2_2_2_2_1:=L;WHILE LlastM1_2_2_2_2_1^.brother<>NIL DO
LlastM1_2_2_2_2_1:=LlastM1_2_2_2_2_1^.brother;
match_MU8(L,LlastM1_2_2_2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
                                    IF first THEN REL1:= Lfirst^.relation;match:=TRUE;
LSMATCHES_matchtreeVar0rels(Lfirst^.node,first
,match,matchnode,matchlist1items,lastmatchM1_2_2_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_REL1(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM1_2_2_2_1,LlastM1_2_2_2_1
,item2,LfirstM1_2_2_2_2,LlastM1_2_2_2_2
) ELSE match_REL1(LfirstM1_2_2_2_2,LfirstM1_2_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist2items,lastmatchM1_2_2_2) END;
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_2_2_1,LlastM1_2_2_1
,PREDREL,item2,LfirstM1_2_2_2,LlastM1_2_2_2
,item3,LfirstM1_2_2_3,LlastM1_2_2_3
) ELSE match_PREDREL(LfirstM1_2_2_2,LfirstM1_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtreeCon1rels(Lfirst,Llast,first,MODREL
,PREDREL,match,matchnode,matchlist3items,lastmatchM1_2_2,matchcondI1) END;
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
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) ELSE BEGIN match_MODREL(LfirstM1_2_2,LfirstM1_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,MODREL,match,matchnode,matchlist3items,lastmatchM1_2) END;
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,HEAD,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) ELSE match_HEAD(LfirstM1_2,LfirstM1_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
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
                    N^.ls^.VERBfield^ := VERBREC2;
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
m:=MAKET_stree(NP);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION3;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=OMEGAFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
  BEGIN
 END;
IF match THEN
  BEGIN
  IF ((TRUE                                                  )
                                                      )
                                                       THEN
    BEGIN
    MAKET_VERBrec(VERBREC2);
    action3;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                      COMTNPNOTOOMEGA2:=result
END;
{:TNPNOTOOMEGA2}
{rule:}
{:FPOSTNPNOTOOMEGA1}
 FUNCTION COMFPOSTNPNOTOOMEGA1(Is:LISTREE_pStree):LISTREE_pstree;VAR result:LISTREE_pStree;
 m:LSSTREE_pstree;
 match:BOOLEAN;
LinitM1_1,LrestM1_1,LfirstM1_1,LlastM1_1:LSSTREE_prelnode;
iM1_1:INTEGER;
nomoretreesM1_1,lastmatchM1_1:BOOLEAN;
LinitM1_2,LrestM1_2,LfirstM1_2,LlastM1_2:LSSTREE_prelnode;
iM1_2:INTEGER;
nomoretreesM1_2,lastmatchM1_2:BOOLEAN;
LinitM1_2_1,LrestM1_2_1,LfirstM1_2_1,LlastM1_2_1:LSSTREE_prelnode;
iM1_2_1:INTEGER;
nomoretreesM1_2_1,lastmatchM1_2_1:BOOLEAN;
LinitM1_2_2,LrestM1_2_2,LfirstM1_2_2,LlastM1_2_2:LSSTREE_prelnode;
iM1_2_2:INTEGER;
nomoretreesM1_2_2,lastmatchM1_2_2:BOOLEAN;
LinitM1_2_2_1,LrestM1_2_2_1,LfirstM1_2_2_1,LlastM1_2_2_1:LSSTREE_prelnode;
iM1_2_2_1:INTEGER;
nomoretreesM1_2_2_1,lastmatchM1_2_2_1:BOOLEAN;
LinitM1_2_2_2,LrestM1_2_2_2,LfirstM1_2_2_2,LlastM1_2_2_2:LSSTREE_prelnode;
iM1_2_2_2:INTEGER;
nomoretreesM1_2_2_2,lastmatchM1_2_2_2:BOOLEAN;
LinitM1_2_2_2_1,LrestM1_2_2_2_1,LfirstM1_2_2_2_1,LlastM1_2_2_2_1:LSSTREE_prelnode;
iM1_2_2_2_1:INTEGER;
nomoretreesM1_2_2_2_1,lastmatchM1_2_2_2_1:BOOLEAN;
LinitM1_2_2_3,LrestM1_2_2_3,LfirstM1_2_2_3,LlastM1_2_2_3:LSSTREE_prelnode;
iM1_2_2_3:INTEGER;
nomoretreesM1_2_2_3,lastmatchM1_2_2_3:BOOLEAN;
LinitM1_2_3,LrestM1_2_3,LfirstM1_2_3,LlastM1_2_3:LSSTREE_prelnode;
iM1_2_3:INTEGER;
nomoretreesM1_2_3,lastmatchM1_2_3:BOOLEAN;
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
MU7:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
ADJREC1:LSDOMAINT_ADJrecord;
ADJPREC1:LSDOMAINT_ADJPrecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
((ADJPREC1.EORENFORM =NOFORM                            )
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
              ADJPREC1:=s^.ls^.ADJPfield^;
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
                  ADJREC1:=s^.ls^.ADJfield^;
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
LlastM1_2_2_2_1:=L;WHILE LlastM1_2_2_2_1^.brother<>NIL DO
LlastM1_2_2_2_1:=LlastM1_2_2_2_1^.brother;
match_MU6(L,LlastM1_2_2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
                LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM1_2_2_2) END;
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_2_2_1,LlastM1_2_2_1
,HEAD,item2,LfirstM1_2_2_2,LlastM1_2_2_2
,item3,LfirstM1_2_2_3,LlastM1_2_2_3
) ELSE match_HEAD(LfirstM1_2_2_2,LfirstM1_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtreeCon1rels(Lfirst,Llast,first,MODREL
,HEAD,match,matchnode,matchlist3items,lastmatchM1_2_2,matchcondI1) END;
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
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) ELSE BEGIN match_MODREL(LfirstM1_2_2,LfirstM1_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,MODREL,match,matchnode,matchlist3items,lastmatchM1_2) END;
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,HEAD,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) ELSE match_HEAD(LfirstM1_2,LfirstM1_2,FALSE,match) END;
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
  IF ((ADJREC1.EORENFORM =NOFORM                             )
                                                      )
                                                       THEN
    BEGIN
    result:=NIL;
    END;
                                                       END;
COMFPOSTNPNOTOOMEGA1:=result
END;
{:FPOSTNPNOTOOMEGA1}
{rule:}
{:FPOSTNPNOTOOMEGA2}
 FUNCTION COMFPOSTNPNOTOOMEGA2(Is:LISTREE_pStree):LISTREE_pstree;VAR result:LISTREE_pStree;
 m:LSSTREE_pstree;
 match:BOOLEAN;
LinitM1_1,LrestM1_1,LfirstM1_1,LlastM1_1:LSSTREE_prelnode;
iM1_1:INTEGER;
nomoretreesM1_1,lastmatchM1_1:BOOLEAN;
LinitM1_2,LrestM1_2,LfirstM1_2,LlastM1_2:LSSTREE_prelnode;
iM1_2:INTEGER;
nomoretreesM1_2,lastmatchM1_2:BOOLEAN;
LinitM1_2_1,LrestM1_2_1,LfirstM1_2_1,LlastM1_2_1:LSSTREE_prelnode;
iM1_2_1:INTEGER;
nomoretreesM1_2_1,lastmatchM1_2_1:BOOLEAN;
LinitM1_2_2,LrestM1_2_2,LfirstM1_2_2,LlastM1_2_2:LSSTREE_prelnode;
iM1_2_2:INTEGER;
nomoretreesM1_2_2,lastmatchM1_2_2:BOOLEAN;
LinitM1_2_2_1,LrestM1_2_2_1,LfirstM1_2_2_1,LlastM1_2_2_1:LSSTREE_prelnode;
iM1_2_2_1:INTEGER;
nomoretreesM1_2_2_1,lastmatchM1_2_2_1:BOOLEAN;
LinitM1_2_2_2,LrestM1_2_2_2,LfirstM1_2_2_2,LlastM1_2_2_2:LSSTREE_prelnode;
iM1_2_2_2:INTEGER;
nomoretreesM1_2_2_2,lastmatchM1_2_2_2:BOOLEAN;
LinitM1_2_2_2_1,LrestM1_2_2_2_1,LfirstM1_2_2_2_1,LlastM1_2_2_2_1:LSSTREE_prelnode;
iM1_2_2_2_1:INTEGER;
nomoretreesM1_2_2_2_1,lastmatchM1_2_2_2_1:BOOLEAN;
LinitM1_2_2_2_2,LrestM1_2_2_2_2,LfirstM1_2_2_2_2,LlastM1_2_2_2_2:LSSTREE_prelnode;
iM1_2_2_2_2:INTEGER;
nomoretreesM1_2_2_2_2,lastmatchM1_2_2_2_2:BOOLEAN;
LinitM1_2_2_2_2_1,LrestM1_2_2_2_2_1,LfirstM1_2_2_2_2_1,LlastM1_2_2_2_2_1:LSSTREE_prelnode;
iM1_2_2_2_2_1:INTEGER;
nomoretreesM1_2_2_2_2_1,lastmatchM1_2_2_2_2_1:BOOLEAN;
LinitM1_2_2_3,LrestM1_2_2_3,LfirstM1_2_2_3,LlastM1_2_2_3:LSSTREE_prelnode;
iM1_2_2_3:INTEGER;
nomoretreesM1_2_2_3,lastmatchM1_2_2_3:BOOLEAN;
LinitM1_2_3,LrestM1_2_3,LfirstM1_2_3,LlastM1_2_3:LSSTREE_prelnode;
iM1_2_3:INTEGER;
nomoretreesM1_2_3,lastmatchM1_2_3:BOOLEAN;
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
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
VERBPREC1:LSDOMAINT_VERBPrecord;
SENTENCEREC1:LSDOMAINT_SENTENCErecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
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
                      VERBREC1:=s^.ls^.VERBfield^;
                    IF match THEN
                      match:= matchcondI2;
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
LlastM1_2_2_2_2_1:=L;WHILE LlastM1_2_2_2_2_1^.brother<>NIL DO
LlastM1_2_2_2_2_1:=LlastM1_2_2_2_2_1^.brother;
match_MU8(L,LlastM1_2_2_2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
                                    IF first THEN REL1:= Lfirst^.relation;match:=TRUE;
LSMATCHES_matchtreeVar0rels(Lfirst^.node,first
,match,matchnode,matchlist1items,lastmatchM1_2_2_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_REL1(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM1_2_2_2_1,LlastM1_2_2_2_1
,item2,LfirstM1_2_2_2_2,LlastM1_2_2_2_2
) ELSE match_REL1(LfirstM1_2_2_2_2,LfirstM1_2_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist2items,lastmatchM1_2_2_2) END;
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_2_2_1,LlastM1_2_2_1
,PREDREL,item2,LfirstM1_2_2_2,LlastM1_2_2_2
,item3,LfirstM1_2_2_3,LlastM1_2_2_3
) ELSE match_PREDREL(LfirstM1_2_2_2,LfirstM1_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtreeCon1rels(Lfirst,Llast,first,MODREL
,PREDREL,match,matchnode,matchlist3items,lastmatchM1_2_2,matchcondI1) END;
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
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) ELSE BEGIN match_MODREL(LfirstM1_2_2,LfirstM1_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,MODREL,match,matchnode,matchlist3items,lastmatchM1_2) END;
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,HEAD,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) ELSE match_HEAD(LfirstM1_2,LfirstM1_2,FALSE,match) END;
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
COMFPOSTNPNOTOOMEGA2:=result
END;
{:FPOSTNPNOTOOMEGA2}
{rule:}
{:TNPQPCOMPLEXTRAPOS}
 FUNCTION COMTNPQPCOMPLEXTRAPOS(Is1:LISTREE_pStree
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
LinitM1_2_1_1,LrestM1_2_1_1,LfirstM1_2_1_1,LlastM1_2_1_1:LSSTREE_prelnode;
iM1_2_1_1:INTEGER;
nomoretreesM1_2_1_1,lastmatchM1_2_1_1:BOOLEAN;
LinitM1_2_1_2,LrestM1_2_1_2,LfirstM1_2_1_2,LlastM1_2_1_2:LSSTREE_prelnode;
iM1_2_1_2:INTEGER;
nomoretreesM1_2_1_2,lastmatchM1_2_1_2:BOOLEAN;
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
 m1:LSSTREE_pstree;
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
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
            PROCEDURE Match_REL1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            VAR matchcond:BOOLEAN;
              Stree:LSSTREE_pStree;
              lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
                LSMATCHES_matchtreeVarConVar(Lfirst,Llast,first,REL1,T1,match,matchcondI1,lastmatchM1_2_1_2);
END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_REL1(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM1_2_1_1,LlastM1_2_1_1
,item2,LfirstM1_2_1_2,LlastM1_2_1_2
) ELSE match_REL1(LfirstM1_2_1_2,LfirstM1_2_1_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist2items,lastmatchM1_2_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM1_2_1,LfirstM1_2_1,LrestM1_2_1,nomoretreesM1_2_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,DETREL
,HEAD,match,matchnode,matchlist1items,lastmatchM1_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_DETREL(Lfirst,Llast,TRUE,match);
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
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) ELSE BEGIN match_DETREL(LfirstM1_2,LfirstM1_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM1_1,LlastM1_1
,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) END END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,DETREL,match,matchnode,matchlist3items,lastmatch) END;
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
          BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem21);
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
  PROCEDURE createitem14(VAR list:LSMRUQUO_ListOfStrees);
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
                                                        BEGIN{createitem14}
  createEXTRAPOSREL(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist4items0101(wholelist,createitem11,createitem12,createitem13,createitem14);
  END{createlist1};
                                                      BEGIN{createM}
m:=MAKET_stree(NP);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION0;
BEGIN
;wbonus:=0;sbonus:=0

END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
  BEGIN
 END;
IF match THEN
  BEGIN
  IF ((TRUE                                                  )
                                                      )
                                                       THEN
    BEGIN
    action0;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                      COMTNPQPCOMPLEXTRAPOS:=result
END;
{:TNPQPCOMPLEXTRAPOS}
{rule:}
{:FPRENPQPCOMPLEXTRAPOS}
 FUNCTION COMFPRENPQPCOMPLEXTRAPOS(Is:LISTREE_pStree):LISTREE_pstree;BEGIN
COMFPRENPQPCOMPLEXTRAPOS:=Is;
END;
{:FPRENPQPCOMPLEXTRAPOS}
{rule:}
{:FPOSTNPQPCOMPLEXTRAPOS}
 FUNCTION COMFPOSTNPQPCOMPLEXTRAPOS(Is:LISTREE_pStree):LISTREE_pstree;VAR result:LISTREE_pStree;
 m:LSSTREE_pstree;
 match:BOOLEAN;
LinitM1_1,LrestM1_1,LfirstM1_1,LlastM1_1:LSSTREE_prelnode;
iM1_1:INTEGER;
nomoretreesM1_1,lastmatchM1_1:BOOLEAN;
LinitM1_2,LrestM1_2,LfirstM1_2,LlastM1_2:LSSTREE_prelnode;
iM1_2:INTEGER;
nomoretreesM1_2,lastmatchM1_2:BOOLEAN;
LinitM1_2_1,LrestM1_2_1,LfirstM1_2_1,LlastM1_2_1:LSSTREE_prelnode;
iM1_2_1:INTEGER;
nomoretreesM1_2_1,lastmatchM1_2_1:BOOLEAN;
LinitM1_2_1_1,LrestM1_2_1_1,LfirstM1_2_1_1,LlastM1_2_1_1:LSSTREE_prelnode;
iM1_2_1_1:INTEGER;
nomoretreesM1_2_1_1,lastmatchM1_2_1_1:BOOLEAN;
LinitM1_2_1_2,LrestM1_2_1_2,LfirstM1_2_1_2,LlastM1_2_1_2:LSSTREE_prelnode;
iM1_2_1_2:INTEGER;
nomoretreesM1_2_1_2,lastmatchM1_2_1_2:BOOLEAN;
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
REL1:LSDOMAINT_synrel;
T1:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
QPREC1:LSDOMAINT_QPrecord;
DETPREC1:LSDOMAINT_DETPrecord;
NPREC1:LSDOMAINT_NPrecord;
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
                                                      PROCEDURE MatchList2Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
            PROCEDURE Match_REL1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            VAR matchcond:BOOLEAN;
              Stree:LSSTREE_pStree;
              lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
                LSMATCHES_matchtreeVarConVar(Lfirst,Llast,first,REL1,T1,match,matchcondI1,lastmatchM1_2_1_2);
END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_REL1(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM1_2_1_1,LlastM1_2_1_1
,item2,LfirstM1_2_1_2,LlastM1_2_1_2
) ELSE match_REL1(LfirstM1_2_1_2,LfirstM1_2_1_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist2items,lastmatchM1_2_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM1_2_1,LfirstM1_2_1,LrestM1_2_1,nomoretreesM1_2_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,DETREL
,HEAD,match,matchnode,matchlist1items,lastmatchM1_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_DETREL(Lfirst,Llast,TRUE,match);
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
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) ELSE BEGIN match_DETREL(LfirstM1_2,LfirstM1_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM1_1,LlastM1_1
,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) END END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,DETREL,match,matchnode,matchlist3items,lastmatch) END;
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
COMFPOSTNPQPCOMPLEXTRAPOS:=result
END;
{:FPOSTNPQPCOMPLEXTRAPOS}
{rule:}
{:RNPPRESENTSUPERDEIXIS1}
 FUNCTION COMRNPPRESENTSUPERDEIXIS1(Is1:LISTREE_pStree
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
 m1:LSSTREE_pstree;
MU1:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
NPREC2:LSDOMAINT_NPrecord;
CNREC2:LSDOMAINT_CNrecord;
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
          CNREC1:=s^.ls^.CNfield^;
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
LlastM1_2_1:=L;WHILE LlastM1_2_1^.brother<>NIL DO
LlastM1_2_1:=LlastM1_2_1^.brother;
match_MU4(L,LlastM1_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM1_2) END;
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,HEAD,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) ELSE match_HEAD(LfirstM1_2,LfirstM1_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
                                                      PROCEDURE createM;
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
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := CN;
        N^.ls^.CNfield^ := CNREC2;
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
m:=MAKET_stree(NP);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION7;
BEGIN
NPREC2:=NPREC1;                                       ;
NPREC2.SUPERDEIXIS:=PRESENTDEIXIS
                                                      ;
CNREC2:=CNREC1;                                       ;
CNREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
  WHILE match AND NOT matchcondM1 DO
  BEGIN
  MatchModel1(m1,FALSE,match);
  END;
  If match Then
  BEGIN
 END;
IF match THEN
  BEGIN
  IF ((CNREC1.SUPERDEIXIS =PRESENTDEIXIS                     )
                                                      )
                                                       THEN
    BEGIN
    MAKET_NPrec(NPREC2);
    MAKET_CNrec(CNREC2);
    action7;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                      COMRNPPRESENTSUPERDEIXIS1:=result
END;
{:RNPPRESENTSUPERDEIXIS1}
{rule:}
{:RNPPASTSUPERDEIXIS1}
 FUNCTION COMRNPPASTSUPERDEIXIS1(Is1:LISTREE_pStree
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
 m1:LSSTREE_pstree;
MU1:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
NPREC2:LSDOMAINT_NPrecord;
CNREC2:LSDOMAINT_CNrecord;
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
          CNREC1:=s^.ls^.CNfield^;
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
LlastM1_2_1:=L;WHILE LlastM1_2_1^.brother<>NIL DO
LlastM1_2_1:=LlastM1_2_1^.brother;
match_MU4(L,LlastM1_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM1_2) END;
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,HEAD,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) ELSE match_HEAD(LfirstM1_2,LfirstM1_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
                                                      PROCEDURE createM;
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
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := CN;
        N^.ls^.CNfield^ := CNREC2;
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
m:=MAKET_stree(NP);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION7;
BEGIN
NPREC2:=NPREC1;                                       ;
NPREC2.SUPERDEIXIS:=PASTDEIXIS
                                                      ;
CNREC2:=CNREC1;                                       ;
CNREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
  WHILE match AND NOT matchcondM1 DO
  BEGIN
  MatchModel1(m1,FALSE,match);
  END;
  If match Then
  BEGIN
 END;
IF match THEN
  BEGIN
  IF ((CNREC1.SUPERDEIXIS =PASTDEIXIS                        )
                                                      )
                                                       THEN
    BEGIN
    MAKET_NPrec(NPREC2);
    MAKET_CNrec(CNREC2);
    action7;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                      COMRNPPASTSUPERDEIXIS1:=result
END;
{:RNPPASTSUPERDEIXIS1}
{rule:}
{:RNPPRESENTSUPERDEIXIS2}
 FUNCTION COMRNPPRESENTSUPERDEIXIS2(Is1:LISTREE_pStree
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
 m1:LSSTREE_pstree;
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
LlastM1_2_1:=L;WHILE LlastM1_2_1^.brother<>NIL DO
LlastM1_2_1:=LlastM1_2_1^.brother;
match_MU4(L,LlastM1_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeCon0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM1_2,matchcondI1) END;
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,HEAD,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) ELSE match_HEAD(LfirstM1_2,LfirstM1_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
                                                      PROCEDURE createM;
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
m:=MAKET_stree(NP);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION3;
BEGIN
NPREC2:=NPREC1;                                       ;
NPREC2.SUPERDEIXIS:=PRESENTDEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
  WHILE match AND NOT matchcondM1 DO
  BEGIN
  MatchModel1(m1,FALSE,match);
  END;
  If match Then
  BEGIN
 END;
IF match THEN
  BEGIN
  IF ((TRUE                                                  )
                                                      )
                                                       THEN
    BEGIN
    MAKET_NPrec(NPREC2);
    action3;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                      COMRNPPRESENTSUPERDEIXIS2:=result
END;
{:RNPPRESENTSUPERDEIXIS2}
{rule:}
{:RNPPASTSUPERDEIXIS2}
 FUNCTION COMRNPPASTSUPERDEIXIS2(Is1:LISTREE_pStree
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
 m1:LSSTREE_pstree;
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
LlastM1_2_1:=L;WHILE LlastM1_2_1^.brother<>NIL DO
LlastM1_2_1:=LlastM1_2_1^.brother;
match_MU4(L,LlastM1_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeCon0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM1_2,matchcondI1) END;
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,HEAD,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) ELSE match_HEAD(LfirstM1_2,LfirstM1_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
                                                      PROCEDURE createM;
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
m:=MAKET_stree(NP);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION3;
BEGIN
NPREC2:=NPREC1;                                       ;
NPREC2.SUPERDEIXIS:=PASTDEIXIS
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
  WHILE match AND NOT matchcondM1 DO
  BEGIN
  MatchModel1(m1,FALSE,match);
  END;
  If match Then
  BEGIN
 END;
IF match THEN
  BEGIN
  IF ((TRUE                                                  )
                                                      )
                                                       THEN
    BEGIN
    MAKET_NPrec(NPREC2);
    action3;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                      COMRNPPASTSUPERDEIXIS2:=result
END;
{:RNPPASTSUPERDEIXIS2}
{rule:}
{:RNPINDEFMODPOSS}
 FUNCTION COMRNPINDEFMODPOSS(Is1:LISTREE_pStree;Is2:LISTREE_pStree
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
LinitM1_1_1,LrestM1_1_1,LfirstM1_1_1,LlastM1_1_1:LSSTREE_prelnode;
iM1_1_1:INTEGER;
nomoretreesM1_1_1,lastmatchM1_1_1:BOOLEAN;
LinitM2_1,LrestM2_1,LfirstM2_1,LlastM2_1:LSSTREE_prelnode;
iM2_1:INTEGER;
nomoretreesM2_1,lastmatchM2_1:BOOLEAN;
LinitM2_2,LrestM2_2,LfirstM2_2,LlastM2_2:LSSTREE_prelnode;
iM2_2:INTEGER;
nomoretreesM2_2,lastmatchM2_2:BOOLEAN;
LinitM2_3,LrestM2_3,LfirstM2_3,LlastM2_3:LSSTREE_prelnode;
iM2_3:INTEGER;
nomoretreesM2_3,lastmatchM2_3:BOOLEAN;
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
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
PROPERNOUNREC1:LSDOMAINT_PROPERNOUNrecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC2:LSDOMAINT_NPrecord;
INDEFPROREC1:LSDOMAINT_INDEFPROrecord;
NPREC1:LSDOMAINT_NPrecord;
PREPPREC1:LSDOMAINT_PREPPrecord;
PREPREC1:LSDOMAINT_PREPrecord;
NPREC3:LSDOMAINT_NPrecord;
CNREC2:LSDOMAINT_CNrecord;
PERSPROREC2:LSDOMAINT_PERSPROrecord;
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
LlastM1_1_1:=L;WHILE LlastM1_1_1^.brother<>NIL DO
LlastM1_1_1:=LlastM1_1_1^.brother;
match_MU10(L,LlastM1_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM1_1) END;
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
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeVar(Lfirst,Llast,first,HEAD,T1,match,lastmatchM2_2);
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM2_1,LlastM2_1
,HEAD,item2,LfirstM2_2,LlastM2_2
,item3,LfirstM2_3,LlastM2_3
) ELSE match_HEAD(LfirstM2_2,LfirstM2_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
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
  PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createPOSREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
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
            N^.ls^.NPfield^ := NPREC3;
          END{CreateNode};
                                                                PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          VAR list:LSMRUQUO_ListOfStrees;
          PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createMU1(VAR list:LSMRUQUO_ListOfStrees);
            BEGIN{MU1}
            copylist(MU1,list);
            END{MU1};
                                                                BEGIN{createitem21}
          createMU1(list);
          END;
          PROCEDURE createitem22(VAR list:LSMRUQUO_ListOfStrees);
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
                                                                BEGIN{createitem22}
          createHEAD(list);
          END;
          PROCEDURE createitem23(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
            BEGIN{MU2}
            copylist(MU2,list);
            END{MU2};
                                                                BEGIN{createitem23}
          createMU2(list);
          END;
          BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem21,createitem22,createitem23);
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
                                                          BEGIN{POSREL}
LSMATCHES_createitem(list,POSREL,PREPP,createnode,createlist1);
    END{POSREL};
                                                        BEGIN{createitem12}
  createPOSREL(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist2items11(wholelist,createitem11,createitem12);
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
LinitT1_1,LrestT1_1,LfirstT1_1,LlastT1_1:LSSTREE_prelnode;
iT1_1:INTEGER;
nomoretreesT1_1,lastmatchT1_1:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createT2;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := CN;
      N^.ls^.CNfield^ := CNREC2;
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
                                                        BEGIN{T2}
  s:=MAKET_stree(CN);
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
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>CN THEN
        match:=FALSE;
      IF match THEN
        CNREC1:=s^.ls^.CNfield^;
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
LlastT1_1:=L;WHILE LlastT1_1^.brother<>NIL DO
LlastT1_1:=LlastT1_1^.brother;
match_MU3(L,LlastT1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist1items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION11;
BEGIN
NPREC3:=NPREC2;                                       ;
NPREC3.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
NPREC3.GENERIC:=OMEGAGENERIC
                                                      ;
NPREC3.CASES:=[ACCUSATIVE]                                          ;
CNREC2:=CNREC1;                                       ;
CNREC2.CASES:=[ACCUSATIVE]                                          ;wbonus:=0;sbonus:=0

END;
                                                       BEGIN{01}
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
    IF ((NPREC1.SUPERDEIXIS =NPREC2.SUPERDEIXIS                )
                                                      )
THEN IF
          ((NPREC2.CASES =[NOMINATIVE]                                          )
                                                      )
THEN IF
          ((CNREC1.CASES =[NOMINATIVE]                                          )
                                                      )
THEN IF
          ((NPREC2.GENERIC =NOGENERIC                             )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPrec(PREPPREC1);
      MAKET_PREPrec(PREPREC1);
      MAKET_NPrec(NPREC3);
      MAKET_CNrec(CNREC2);
      MAKET_PERSPROrec(PERSPROREC2);
      hulpstree:=LDBLEX_read(auxkey('VANPREPKEY'));
      PREPREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
      PREPREC1:=PREPREC1tree^.ls^.PREPfield^;
      action11;
      createT2;
      previous1;
      Is:=loopholes.retype(m,LISTREE_pstree);
      IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
      END;
                                                          END;
                                                       subrule0X1:=result
 END;
 FUNCTION subrule0X2 :LISTREE_SetOfStrees;
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
  PROCEDURE createT2;
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
                                                        BEGIN{T2}
  s:=MAKET_stree(PROPERNOUN);
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
LlastT1_1:=L;WHILE LlastT1_1^.brother<>NIL DO
LlastT1_1:=LlastT1_1^.brother;
match_MU4(L,LlastT1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist1items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION31;
BEGIN
NPREC3:=NPREC2;                                       ;
NPREC3.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
NPREC3.GENERIC:=OMEGAGENERIC
                                                      ;
NPREC3.CASES:=[ACCUSATIVE]                                          ;wbonus:=0;sbonus:=0

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
    IF ((NPREC1.SUPERDEIXIS =NPREC2.SUPERDEIXIS                )
                                                      )
THEN IF
          ((NPREC2.CASES =[NOMINATIVE]                                          )
                                                      )
THEN IF
          ((NPREC2.GENERIC =NOGENERIC                             )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPrec(PREPPREC1);
      MAKET_PREPrec(PREPREC1);
      MAKET_NPrec(NPREC3);
      MAKET_CNrec(CNREC2);
      MAKET_PERSPROrec(PERSPROREC2);
      hulpstree:=LDBLEX_read(auxkey('VANPREPKEY'));
      PREPREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
      PREPREC1:=PREPREC1tree^.ls^.PREPfield^;
      action31;
      createT2;
      previous1;
      Is:=loopholes.retype(m,LISTREE_pstree);
      IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
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
  PROCEDURE createT2;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := PERSPRO;
      N^.ls^.PERSPROfield^ := PERSPROREC2;
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
                                                        BEGIN{T2}
  s:=MAKET_stree(PERSPRO);
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
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>PERSPRO THEN
        match:=FALSE;
      IF match THEN
        PERSPROREC1:=s^.ls^.PERSPROfield^;
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
LlastT1_1:=L;WHILE LlastT1_1^.brother<>NIL DO
LlastT1_1:=LlastT1_1^.brother;
match_MU5(L,LlastT1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist1items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION50;
BEGIN
PERSPROREC2:=PERSPROREC1;                             ;
PERSPROREC2.PERSPROCASES:=[ACCUSATIVE]                                          ;
NPREC3:=NPREC2;                                       ;
NPREC3.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
NPREC3.GENERIC:=OMEGAGENERIC
                                                      ;
NPREC3.CASES:=[ACCUSATIVE]                                          ;wbonus:=0;sbonus:=0

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
  IF match THEN
    BEGIN
    IF ((NPREC1.SUPERDEIXIS =NPREC2.SUPERDEIXIS                )
                                                      )
THEN IF
          ((NPREC2.CASES =[NOMINATIVE]                                          )
                                                      )
THEN IF
          ((NPREC2.GENERIC =NOGENERIC                             )
                                                      )
THEN IF
          ((PERSPROREC1.PERSPROCASES =[NOMINATIVE]                                          )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPrec(PREPPREC1);
      MAKET_PREPrec(PREPREC1);
      MAKET_NPrec(NPREC3);
      MAKET_CNrec(CNREC2);
      MAKET_PERSPROrec(PERSPROREC2);
      hulpstree:=LDBLEX_read(auxkey('VANPREPKEY'));
      PREPREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
      PREPREC1:=PREPREC1tree^.ls^.PREPfield^;
      action50;
      createT2;
      previous1;
      Is:=loopholes.retype(m,LISTREE_pstree);
      IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
      END;
                                                          END;
                                                       subrule0X3:=result
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
 END;
    END;
COMRNPINDEFMODPOSS:=result
END;
{:RNPINDEFMODPOSS}
{rule:}
{:RNPWHMODPOSS}
 FUNCTION COMRNPWHMODPOSS(Is1:LISTREE_pStree;Is2:LISTREE_pStree
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
LinitM1_1_1,LrestM1_1_1,LfirstM1_1_1,LlastM1_1_1:LSSTREE_prelnode;
iM1_1_1:INTEGER;
nomoretreesM1_1_1,lastmatchM1_1_1:BOOLEAN;
LinitM2_1,LrestM2_1,LfirstM2_1,LlastM2_1:LSSTREE_prelnode;
iM2_1:INTEGER;
nomoretreesM2_1,lastmatchM2_1:BOOLEAN;
LinitM2_2,LrestM2_2,LfirstM2_2,LlastM2_2:LSSTREE_prelnode;
iM2_2:INTEGER;
nomoretreesM2_2,lastmatchM2_2:BOOLEAN;
LinitM2_3,LrestM2_3,LfirstM2_3,LlastM2_3:LSSTREE_prelnode;
iM2_3:INTEGER;
nomoretreesM2_3,lastmatchM2_3:BOOLEAN;
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
T1:LSSTREE_pStree;
PREPREC1tree:LSSTREE_pStree;
T2:LSSTREE_pStree;
MU4:LSMRUQUO_ListOfStrees;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
PERSPROREC1:LSDOMAINT_PERSPROrecord;
PROPERNOUNREC1:LSDOMAINT_PROPERNOUNrecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC2:LSDOMAINT_NPrecord;
WHPROREC1:LSDOMAINT_WHPROrecord;
NPREC1:LSDOMAINT_NPrecord;
PREPPREC1:LSDOMAINT_PREPPrecord;
PREPREC1:LSDOMAINT_PREPrecord;
NPREC3:LSDOMAINT_NPrecord;
CNREC2:LSDOMAINT_CNrecord;
PERSPROREC2:LSDOMAINT_PERSPROrecord;
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
LlastM1_1_1:=L;WHILE LlastM1_1_1^.brother<>NIL DO
LlastM1_1_1:=LlastM1_1_1^.brother;
match_MU4(L,LlastM1_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM1_1) END;
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
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeVar(Lfirst,Llast,first,HEAD,T1,match,lastmatchM2_2);
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM2_1,LlastM2_1
,HEAD,item2,LfirstM2_2,LlastM2_2
,item3,LfirstM2_3,LlastM2_3
) ELSE match_HEAD(LfirstM2_2,LfirstM2_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
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
  PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createPOSREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
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
            N^.ls^.NPfield^ := NPREC3;
          END{CreateNode};
                                                                PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          VAR list:LSMRUQUO_ListOfStrees;
          PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createMU1(VAR list:LSMRUQUO_ListOfStrees);
            BEGIN{MU1}
            copylist(MU1,list);
            END{MU1};
                                                                BEGIN{createitem21}
          createMU1(list);
          END;
          PROCEDURE createitem22(VAR list:LSMRUQUO_ListOfStrees);
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
                                                                BEGIN{createitem22}
          createHEAD(list);
          END;
          PROCEDURE createitem23(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
            BEGIN{MU2}
            copylist(MU2,list);
            END{MU2};
                                                                BEGIN{createitem23}
          createMU2(list);
          END;
          BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem21,createitem22,createitem23);
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
                                                          BEGIN{POSREL}
LSMATCHES_createitem(list,POSREL,PREPP,createnode,createlist1);
    END{POSREL};
                                                        BEGIN{createitem12}
  createPOSREL(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist2items11(wholelist,createitem11,createitem12);
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
LinitT1_1,LrestT1_1,LfirstT1_1,LlastT1_1:LSSTREE_prelnode;
iT1_1:INTEGER;
nomoretreesT1_1,lastmatchT1_1:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createT2;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := CN;
      N^.ls^.CNfield^ := CNREC2;
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
                                                        BEGIN{T2}
  s:=MAKET_stree(CN);
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
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>CN THEN
        match:=FALSE;
      IF match THEN
        CNREC1:=s^.ls^.CNfield^;
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
LlastT1_1:=L;WHILE LlastT1_1^.brother<>NIL DO
LlastT1_1:=LlastT1_1^.brother;
match_MU5(L,LlastT1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist1items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION11;
BEGIN
NPREC3:=NPREC2;                                       ;
NPREC3.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
NPREC3.GENERIC:=OMEGAGENERIC
                                                      ;
NPREC3.CASES:=[ACCUSATIVE]                                          ;
CNREC2:=CNREC1;                                       ;
CNREC2.CASES:=[ACCUSATIVE]                                          ;wbonus:=0;sbonus:=0

END;
                                                       BEGIN{01}
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
    IF ((NPREC1.SUPERDEIXIS =NPREC2.SUPERDEIXIS                )
                                                      )
THEN IF
          ((NPREC2.CASES =[NOMINATIVE]                                          )
                                                      )
THEN IF
          ((CNREC1.CASES =[NOMINATIVE]                                          )
                                                      )
THEN IF
          ((NPREC2.GENERIC =NOGENERIC                             )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPrec(PREPPREC1);
      MAKET_PREPrec(PREPREC1);
      MAKET_NPrec(NPREC3);
      MAKET_CNrec(CNREC2);
      MAKET_PERSPROrec(PERSPROREC2);
      hulpstree:=LDBLEX_read(auxkey('VANPREPKEY'));
      PREPREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
      PREPREC1:=PREPREC1tree^.ls^.PREPfield^;
      action11;
      createT2;
      previous1;
      Is:=loopholes.retype(m,LISTREE_pstree);
      IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
      END;
                                                          END;
                                                       subrule0X1:=result
 END;
 FUNCTION subrule0X2 :LISTREE_SetOfStrees;
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
  PROCEDURE createT2;
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
                                                        BEGIN{T2}
  s:=MAKET_stree(PROPERNOUN);
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
LlastT1_1:=L;WHILE LlastT1_1^.brother<>NIL DO
LlastT1_1:=LlastT1_1^.brother;
match_MU3(L,LlastT1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist1items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION30;
BEGIN
NPREC3:=NPREC2;                                       ;
NPREC3.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
NPREC3.GENERIC:=OMEGAGENERIC
                                                      ;
NPREC3.CASES:=[ACCUSATIVE]                                          ;wbonus:=0;sbonus:=0

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
    IF ((NPREC1.SUPERDEIXIS =NPREC2.SUPERDEIXIS                )
                                                      )
THEN IF
          ((NPREC2.CASES =[NOMINATIVE]                                          )
                                                      )
THEN IF
          ((NPREC2.GENERIC =NOGENERIC                             )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPrec(PREPPREC1);
      MAKET_PREPrec(PREPREC1);
      MAKET_NPrec(NPREC3);
      MAKET_CNrec(CNREC2);
      MAKET_PERSPROrec(PERSPROREC2);
      hulpstree:=LDBLEX_read(auxkey('VANPREPKEY'));
      PREPREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
      PREPREC1:=PREPREC1tree^.ls^.PREPfield^;
      action30;
      createT2;
      previous1;
      Is:=loopholes.retype(m,LISTREE_pstree);
      IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
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
  PROCEDURE createT2;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := PERSPRO;
      N^.ls^.PERSPROfield^ := PERSPROREC2;
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
                                                        BEGIN{T2}
  s:=MAKET_stree(PERSPRO);
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
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>PERSPRO THEN
        match:=FALSE;
      IF match THEN
        PERSPROREC1:=s^.ls^.PERSPROfield^;
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
LlastT1_1:=L;WHILE LlastT1_1^.brother<>NIL DO
LlastT1_1:=LlastT1_1^.brother;
match_MU5(L,LlastT1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist1items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION49;
BEGIN
PERSPROREC2:=PERSPROREC1;                             ;
PERSPROREC2.PERSPROCASES:=[ACCUSATIVE]                                          ;
NPREC3:=NPREC2;                                       ;
NPREC3.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
NPREC3.GENERIC:=OMEGAGENERIC
                                                      ;
NPREC3.CASES:=[ACCUSATIVE]                                          ;wbonus:=0;sbonus:=0

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
  IF match THEN
    BEGIN
    IF ((NPREC1.SUPERDEIXIS =NPREC2.SUPERDEIXIS                )
                                                      )
THEN IF
          ((NPREC2.CASES =[NOMINATIVE]                                          )
                                                      )
THEN IF
          ((NPREC2.GENERIC =NOGENERIC                             )
                                                      )
THEN IF
          ((PERSPROREC1.PERSPROCASES =[NOMINATIVE]                                          )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPrec(PREPPREC1);
      MAKET_PREPrec(PREPREC1);
      MAKET_NPrec(NPREC3);
      MAKET_CNrec(CNREC2);
      MAKET_PERSPROrec(PERSPROREC2);
      hulpstree:=LDBLEX_read(auxkey('VANPREPKEY'));
      PREPREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
      PREPREC1:=PREPREC1tree^.ls^.PREPfield^;
      action49;
      createT2;
      previous1;
      Is:=loopholes.retype(m,LISTREE_pstree);
      IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
      END;
                                                          END;
                                                       subrule0X3:=result
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
 END;
    END;
COMRNPWHMODPOSS:=result
END;
{:RNPWHMODPOSS}
{rule:}
{:RNPPROPERNOUNMODPOSS}
 FUNCTION COMRNPPROPERNOUNMODPOSS(Is1:LISTREE_pStree;Is2:LISTREE_pStree
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
LinitM1_1_1,LrestM1_1_1,LfirstM1_1_1,LlastM1_1_1:LSSTREE_prelnode;
iM1_1_1:INTEGER;
nomoretreesM1_1_1,lastmatchM1_1_1:BOOLEAN;
LinitM2_1,LrestM2_1,LfirstM2_1,LlastM2_1:LSSTREE_prelnode;
iM2_1:INTEGER;
nomoretreesM2_1,lastmatchM2_1:BOOLEAN;
LinitM2_2,LrestM2_2,LfirstM2_2,LlastM2_2:LSSTREE_prelnode;
iM2_2:INTEGER;
nomoretreesM2_2,lastmatchM2_2:BOOLEAN;
LinitM2_3,LrestM2_3,LfirstM2_3,LlastM2_3:LSSTREE_prelnode;
iM2_3:INTEGER;
nomoretreesM2_3,lastmatchM2_3:BOOLEAN;
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
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
PROPERNOUNREC2:LSDOMAINT_PROPERNOUNrecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC2:LSDOMAINT_NPrecord;
PROPERNOUNREC1:LSDOMAINT_PROPERNOUNrecord;
NPREC1:LSDOMAINT_NPrecord;
PREPPREC1:LSDOMAINT_PREPPrecord;
PREPREC1:LSDOMAINT_PREPrecord;
NPREC3:LSDOMAINT_NPrecord;
CNREC2:LSDOMAINT_CNrecord;
PERSPROREC2:LSDOMAINT_PERSPROrecord;
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
LlastM1_1_1:=L;WHILE LlastM1_1_1^.brother<>NIL DO
LlastM1_1_1:=LlastM1_1_1^.brother;
match_MU1(L,LlastM1_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM1_1) END;
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
    IF s^.ls^.cat<>NP THEN
      match:=FALSE;
    IF match THEN
      NPREC2:=s^.ls^.NPfield^;
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
        LSMATCHES_matchtreeVar(Lfirst,Llast,first,HEAD,T1,match,lastmatchM2_2);
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM2_1,LlastM2_1
,HEAD,item2,LfirstM2_2,LlastM2_2
,item3,LfirstM2_3,LlastM2_3
) ELSE match_HEAD(LfirstM2_2,LfirstM2_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
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
  PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createPOSREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
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
            N^.ls^.NPfield^ := NPREC3;
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
                                                                BEGIN{createitem22}
          createHEAD(list);
          END;
          PROCEDURE createitem23(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createMU3(VAR list:LSMRUQUO_ListOfStrees);
            BEGIN{MU3}
            copylist(MU3,list);
            END{MU3};
                                                                BEGIN{createitem23}
          createMU3(list);
          END;
          BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem21,createitem22,createitem23);
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
                                                          BEGIN{POSREL}
LSMATCHES_createitem(list,POSREL,PREPP,createnode,createlist1);
    END{POSREL};
                                                        BEGIN{createitem12}
  createPOSREL(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist2items11(wholelist,createitem11,createitem12);
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
LinitT1_1,LrestT1_1,LfirstT1_1,LlastT1_1:LSSTREE_prelnode;
iT1_1:INTEGER;
nomoretreesT1_1,lastmatchT1_1:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createT2;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := CN;
      N^.ls^.CNfield^ := CNREC2;
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
                                                        BEGIN{T2}
  s:=MAKET_stree(CN);
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
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>CN THEN
        match:=FALSE;
      IF match THEN
        CNREC1:=s^.ls^.CNfield^;
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
LlastT1_1:=L;WHILE LlastT1_1^.brother<>NIL DO
LlastT1_1:=LlastT1_1^.brother;
match_MU4(L,LlastT1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist1items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION11;
BEGIN
NPREC3:=NPREC2;                                       ;
NPREC3.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
NPREC3.GENERIC:=OMEGAGENERIC
                                                      ;
NPREC3.CASES:=[ACCUSATIVE]                                          ;
CNREC2:=CNREC1;                                       ;
CNREC2.CASES:=[ACCUSATIVE]                                          ;wbonus:=0;sbonus:=0

END;
                                                       BEGIN{01}
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
    IF ((NPREC1.SUPERDEIXIS =NPREC2.SUPERDEIXIS                )
                                                      )
THEN IF
          ((NPREC2.CASES =[NOMINATIVE]                                          )
                                                      )
THEN IF
          ((CNREC1.CASES =[NOMINATIVE]                                          )
                                                      )
THEN IF
          ((NPREC2.GENERIC =NOGENERIC                             )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPrec(PREPPREC1);
      MAKET_PREPrec(PREPREC1);
      MAKET_NPrec(NPREC3);
      MAKET_CNrec(CNREC2);
      MAKET_PERSPROrec(PERSPROREC2);
      hulpstree:=LDBLEX_read(auxkey('VANPREPKEY'));
      PREPREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
      PREPREC1:=PREPREC1tree^.ls^.PREPfield^;
      action11;
      createT2;
      previous1;
      Is:=loopholes.retype(m,LISTREE_pstree);
      IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
      END;
                                                          END;
                                                       subrule0X1:=result
 END;
 FUNCTION subrule0X2 :LISTREE_SetOfStrees;
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
  PROCEDURE createT2;
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
                                                        BEGIN{T2}
  s:=MAKET_stree(PROPERNOUN);
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
LlastT1_1:=L;WHILE LlastT1_1^.brother<>NIL DO
LlastT1_1:=LlastT1_1^.brother;
match_MU5(L,LlastT1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist1items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION30;
BEGIN
NPREC3:=NPREC2;                                       ;
NPREC3.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
NPREC3.GENERIC:=OMEGAGENERIC
                                                      ;
NPREC3.CASES:=[ACCUSATIVE]                                          ;wbonus:=0;sbonus:=0

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
    IF ((NPREC1.SUPERDEIXIS =NPREC2.SUPERDEIXIS                )
                                                      )
THEN IF
          ((NPREC2.CASES =[NOMINATIVE]                                          )
                                                      )
THEN IF
          ((NPREC2.GENERIC =NOGENERIC                             )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPrec(PREPPREC1);
      MAKET_PREPrec(PREPREC1);
      MAKET_NPrec(NPREC3);
      MAKET_CNrec(CNREC2);
      MAKET_PERSPROrec(PERSPROREC2);
      hulpstree:=LDBLEX_read(auxkey('VANPREPKEY'));
      PREPREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
      PREPREC1:=PREPREC1tree^.ls^.PREPfield^;
      action30;
      createT2;
      previous1;
      Is:=loopholes.retype(m,LISTREE_pstree);
      IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
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
  PROCEDURE createT2;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := PERSPRO;
      N^.ls^.PERSPROfield^ := PERSPROREC2;
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
                                                        BEGIN{T2}
  s:=MAKET_stree(PERSPRO);
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
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>PERSPRO THEN
        match:=FALSE;
      IF match THEN
        PERSPROREC1:=s^.ls^.PERSPROfield^;
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
LlastT1_1:=L;WHILE LlastT1_1^.brother<>NIL DO
LlastT1_1:=LlastT1_1^.brother;
match_MU6(L,LlastT1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T1;
    matchnode(s,match);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist1items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION49;
BEGIN
PERSPROREC2:=PERSPROREC1;                             ;
PERSPROREC2.PERSPROCASES:=[ACCUSATIVE]                                          ;
NPREC3:=NPREC2;                                       ;
NPREC3.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
NPREC3.GENERIC:=OMEGAGENERIC
                                                      ;
NPREC3.CASES:=[ACCUSATIVE]                                          ;wbonus:=0;sbonus:=0

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
  IF match THEN
    BEGIN
    IF ((NPREC1.SUPERDEIXIS =NPREC2.SUPERDEIXIS                )
                                                      )
THEN IF
          ((NPREC2.CASES =[NOMINATIVE]                                          )
                                                      )
THEN IF
          ((NPREC2.GENERIC =NOGENERIC                             )
                                                      )
THEN IF
          ((PERSPROREC1.PERSPROCASES =[NOMINATIVE]                                          )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPrec(PREPPREC1);
      MAKET_PREPrec(PREPREC1);
      MAKET_NPrec(NPREC3);
      MAKET_CNrec(CNREC2);
      MAKET_PERSPROrec(PERSPROREC2);
      hulpstree:=LDBLEX_read(auxkey('VANPREPKEY'));
      PREPREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
      PREPREC1:=PREPREC1tree^.ls^.PREPfield^;
      action49;
      createT2;
      previous1;
      Is:=loopholes.retype(m,LISTREE_pstree);
      IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
      END;
                                                          END;
                                                       subrule0X3:=result
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
 END;
    END;
COMRNPPROPERNOUNMODPOSS:=result
END;
{:RNPPROPERNOUNMODPOSS}
{rule:}
{:TNPASSIGNEFORM1}
 FUNCTION COMTNPASSIGNEFORM1(Is1:LISTREE_pStree
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
LinitM1_2_2,LrestM1_2_2,LfirstM1_2_2,LlastM1_2_2:LSSTREE_prelnode;
iM1_2_2:INTEGER;
nomoretreesM1_2_2,lastmatchM1_2_2:BOOLEAN;
LinitM1_2_2_1,LrestM1_2_2_1,LfirstM1_2_2_1,LlastM1_2_2_1:LSSTREE_prelnode;
iM1_2_2_1:INTEGER;
nomoretreesM1_2_2_1,lastmatchM1_2_2_1:BOOLEAN;
LinitM1_2_2_2,LrestM1_2_2_2,LfirstM1_2_2_2,LlastM1_2_2_2:LSSTREE_prelnode;
iM1_2_2_2:INTEGER;
nomoretreesM1_2_2_2,lastmatchM1_2_2_2:BOOLEAN;
LinitM1_2_2_2_1,LrestM1_2_2_2_1,LfirstM1_2_2_2_1,LlastM1_2_2_2_1:LSSTREE_prelnode;
iM1_2_2_2_1:INTEGER;
nomoretreesM1_2_2_2_1,lastmatchM1_2_2_2_1:BOOLEAN;
LinitM1_2_3,LrestM1_2_3,LfirstM1_2_3,LlastM1_2_3:LSSTREE_prelnode;
iM1_2_3:INTEGER;
nomoretreesM1_2_3,lastmatchM1_2_3:BOOLEAN;
LinitM1_2_4,LrestM1_2_4,LfirstM1_2_4,LlastM1_2_4:LSSTREE_prelnode;
iM1_2_4:INTEGER;
nomoretreesM1_2_4,lastmatchM1_2_4:BOOLEAN;
LinitM1_2_4_1,LrestM1_2_4_1,LfirstM1_2_4_1,LlastM1_2_4_1:LSSTREE_prelnode;
iM1_2_4_1:INTEGER;
nomoretreesM1_2_4_1,lastmatchM1_2_4_1:BOOLEAN;
LinitM1_2_5,LrestM1_2_5,LfirstM1_2_5,LlastM1_2_5:LSSTREE_prelnode;
iM1_2_5:INTEGER;
nomoretreesM1_2_5,lastmatchM1_2_5:BOOLEAN;
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
 m1:LSSTREE_pstree;
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
NPREC8:LSDOMAINT_NPrecord;
POSSADJREC1:LSDOMAINT_POSSADJrecord;
DETPREC1:LSDOMAINT_DETPrecord;
NOUNREC1:LSDOMAINT_NOUNrecord;
ADJREC1:LSDOMAINT_ADJrecord;
ADJPREC1:LSDOMAINT_ADJPrecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
ADJPREC2:LSDOMAINT_ADJPrecord;
ADJREC2:LSDOMAINT_ADJrecord;
FUNCTION matchcondM1:BOOLEAN;
BEGIN
  matchcondM1:= TRUE
END;{matchcondM1}
FUNCTION matchcondM:BOOLEAN;
BEGIN
  matchcondM:= TRUE
END;{matchcondM}
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
              ADJPREC1:=s^.ls^.ADJPfield^;
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
                  ADJREC1:=s^.ls^.ADJfield^;
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
LlastM1_2_2_2_1:=L;WHILE LlastM1_2_2_2_1^.brother<>NIL DO
LlastM1_2_2_2_1:=LlastM1_2_2_2_1^.brother;
match_MU9(L,LlastM1_2_2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
                LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM1_2_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM1_2_2_1,LlastM1_2_2_1
,item2,LfirstM1_2_2_2,LlastM1_2_2_2
) ELSE match_HEAD(LfirstM1_2_2_2,LfirstM1_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,MODREL
,HEAD,match,matchnode,matchlist2items,lastmatchM1_2_2) END;
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
LlastM1_2_4_1:=L;WHILE LlastM1_2_4_1^.brother<>NIL DO
LlastM1_2_4_1:=LlastM1_2_4_1^.brother;
match_MU5(L,LlastM1_2_4_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
            LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM1_2_4) END;
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
LlastM1_2_5,LfirstM1_2_5,LrestM1_2_5,nomoretreesM1_2_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM1_2_4,LfirstM1_2_4,LrestM1_2_4,nomoretreesM1_2_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU4,matchlist2items,
LlastM1_2_3,LfirstM1_2_3,LrestM1_2_3,nomoretreesM1_2_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_MODREL,matchlist3items,
LlastM1_2_2,LfirstM1_2_2,LrestM1_2_2,nomoretreesM1_2_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU2,matchlist4items,
LlastM1_2_1,LfirstM1_2_1,LrestM1_2_1,nomoretreesM1_2_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=2)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree2rels(Lfirst,Llast,first,HEAD
,MODREL,HEAD,match,matchnode,matchlist5items,lastmatchM1_2) END;
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,HEAD,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) ELSE match_HEAD(LfirstM1_2,LfirstM1_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
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
            N^.ls^.ADJPfield^ := ADJPREC2;
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
                N^.ls^.ADJfield^ := ADJREC2;
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
FUNCTION MATCHCONDMU1:BOOLEAN;
BEGIN MATCHCONDMU1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createMU1;
  BEGIN{MU1}
  END{MU1};
                                                        PROCEDURE matchlistMU1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
  VAR lisons:LISTREE_pRelnode;
                                                        BEGIN
IF match THEN matchlist0items(MU1.first,first,match);
  END;
                                                      PROCEDURE ACTION4;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=EFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION8;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION9;
BEGIN

END;
                                                      PROCEDURE ACTION13;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION16;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=EFORM
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION20;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION21;
BEGIN

END;
                                                      PROCEDURE ACTION22;
BEGIN

END;
                                                      PROCEDURE ACTION25;
BEGIN
ADJREC2:=ADJREC1;                                     ;
ADJREC2.EORENFORM:=ADJPREC2.EORENFORM
                                                      
END;
                                                       BEGIN{01}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchlistMU1(MU1.first,MU1.last,match,TRUE);
  IF match THEN
    BEGIN
    IF ((ADJPREC1.EORENFORM =OMEGAFORM                         )
                                                      )
THEN IF
          ((ADJREC1.EORENFORM =OMEGAFORM                          )
                                                      )
                                                       THEN
      BEGIN
      IF ((NOUNREC1.NUMBER =PLURAL                               )
                                                      )
                                                       THEN
        BEGIN
        IF ((ADJREC1.EFORMATION<>NOFORMATION                       )
                                                      )
                                                       THEN
          BEGIN
          MAKET_ADJPrec(ADJPREC2);
          MAKET_ADJrec(ADJREC2);
          action4;
          action9;
          action25;
          createMU1;
          previous1;
          Is:=loopholes.retype(m,LISTREE_pstree);
          LISTREE_appendstreebonus(Is,result,wbonus);
          END;
        IF ((ADJREC1.EFORMATION =NOFORMATION                       )
                                                      )
                                                       THEN
          BEGIN
          MAKET_ADJPrec(ADJPREC2);
          MAKET_ADJrec(ADJREC2);
          action8;
          action9;
          action25;
          createMU1;
          previous1;
          Is:=loopholes.retype(m,LISTREE_pstree);
          LISTREE_appendstreebonus(Is,result,wbonus);
          END;
                                                              END;
      IF ((NOUNREC1.NUMBER =SINGULAR                             )
                                                      )
                                                       THEN
        BEGIN
        IF (([NEUTGENDER]                                           *NOUNREC1.GENDERS<>
[]                                                    )
                                                      )
                                                       THEN
          BEGIN
          MAKET_ADJPrec(ADJPREC2);
          MAKET_ADJrec(ADJREC2);
          action13;
          action22;
          action25;
          createMU1;
          previous1;
          Is:=loopholes.retype(m,LISTREE_pstree);
          LISTREE_appendstreebonus(Is,result,wbonus);
          END;
        IF (([FEMGENDER,
MASCGENDER]                                            *NOUNREC1.GENDERS<>[]                                                    )
                                                      )
                                                       THEN
          BEGIN
          IF ((ADJREC1.EFORMATION<>NOFORMATION                       )
                                                      )
                                                       THEN
            BEGIN
            MAKET_ADJPrec(ADJPREC2);
            MAKET_ADJrec(ADJREC2);
            action16;
            action21;
            action22;
            action25;
            createMU1;
            previous1;
            Is:=loopholes.retype(m,LISTREE_pstree);
            LISTREE_appendstreebonus(Is,result,wbonus);
            END;
          IF ((ADJREC1.EFORMATION =NOFORMATION                       )
                                                      )
                                                       THEN
            BEGIN
            MAKET_ADJPrec(ADJPREC2);
            MAKET_ADJrec(ADJREC2);
            action20;
            action21;
            action22;
            action25;
            createMU1;
            previous1;
            Is:=loopholes.retype(m,LISTREE_pstree);
            LISTREE_appendstreebonus(Is,result,wbonus);
            END;
                                                                END;
                                                              END;
                                                            END;
                                                          END;
                                                       subrule0X1:=result
 END;
 FUNCTION subrule0X2 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
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
(( NOT(T1^.CAT IN [POSSADJ]                                             )                                                     )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

  END;{matchcondI1}
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createMU1;
  BEGIN{MU1}
  END{MU1};
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
                                                      PROCEDURE ACTION47;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION51;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=EFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION55;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION56;
BEGIN

END;
                                                      PROCEDURE ACTION57;
BEGIN

END;
                                                      PROCEDURE ACTION60;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=EFORM
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION64;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION65;
BEGIN

END;
                                                      PROCEDURE ACTION68;
BEGIN
ADJREC2:=ADJREC1;                                     ;
ADJREC2.EORENFORM:=ADJPREC2.EORENFORM
                                                      
END;
                                                       BEGIN{02}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchlistMU1(MU1.first,MU1.last,match,TRUE);
  IF match THEN
    BEGIN
    IF ((NPREC1.DEFINITE IN [INDEF,
MENIGDEF]                                             )
                                                      )
THEN IF
          ((ADJPREC1.EORENFORM =OMEGAFORM                         )
                                                      )
THEN IF
          ((ADJREC1.EORENFORM =OMEGAFORM                          )
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
          ((ADJPREC1.FORM<>SUPERLATIVE                            )
                                                      )
                                                       THEN
          BEGIN
          MAKET_ADJPrec(ADJPREC2);
          MAKET_ADJrec(ADJREC2);
          action47;
          action57;
          action68;
          createMU1;
          previous1;
          Is:=loopholes.retype(m,LISTREE_pstree);
          LISTREE_appendstreebonus(Is,result,wbonus);
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
          ((ADJPREC1.FORM =SUPERLATIVE                            )
                                                      )
                                                      )
                                                      )
                                                       THEN
          BEGIN
          IF ((ADJREC1.EFORMATION<>NOFORMATION                       )
                                                      )
                                                       THEN
            BEGIN
            MAKET_ADJPrec(ADJPREC2);
            MAKET_ADJrec(ADJREC2);
            action51;
            action56;
            action57;
            action68;
            createMU1;
            previous1;
            Is:=loopholes.retype(m,LISTREE_pstree);
            LISTREE_appendstreebonus(Is,result,wbonus);
            END;
          IF ((ADJREC1.EFORMATION =NOFORMATION                       )
                                                      )
                                                       THEN
            BEGIN
            MAKET_ADJPrec(ADJPREC2);
            MAKET_ADJrec(ADJREC2);
            action55;
            action56;
            action57;
            action68;
            createMU1;
            previous1;
            Is:=loopholes.retype(m,LISTREE_pstree);
            LISTREE_appendstreebonus(Is,result,wbonus);
            END;
                                                                END;
                                                              END;
      IF ((NOUNREC1.NUMBER =PLURAL                               )
                                                      )
                                                       THEN
        BEGIN
        IF ((ADJREC1.EFORMATION<>NOFORMATION                       )
                                                      )
                                                       THEN
          BEGIN
          MAKET_ADJPrec(ADJPREC2);
          MAKET_ADJrec(ADJREC2);
          action60;
          action65;
          action68;
          createMU1;
          previous1;
          Is:=loopholes.retype(m,LISTREE_pstree);
          LISTREE_appendstreebonus(Is,result,wbonus);
          END;
        IF ((ADJREC1.EFORMATION =NOFORMATION                       )
                                                      )
                                                       THEN
          BEGIN
          MAKET_ADJPrec(ADJPREC2);
          MAKET_ADJrec(ADJREC2);
          action64;
          action65;
          action68;
          createMU1;
          previous1;
          Is:=loopholes.retype(m,LISTREE_pstree);
          LISTREE_appendstreebonus(Is,result,wbonus);
          END;
                                                              END;
                                                            END;
                                                          END;
                                                       subrule0X2:=result
 END;
 FUNCTION subrule0X3 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
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
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createMU1;
  BEGIN{MU1}
  END{MU1};
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
                                                      PROCEDURE ACTION91;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION94;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=EFORM
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION98;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION99;
BEGIN

END;
                                                      PROCEDURE ACTION100;
BEGIN

END;
                                                      PROCEDURE ACTION103;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=EFORM
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION107;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION108;
BEGIN

END;
                                                      PROCEDURE ACTION112;
BEGIN
ADJREC2:=ADJREC1;                                     ;
ADJREC2.EORENFORM:=ADJPREC2.EORENFORM
                                                      ;
                                                      
END;
                                                       BEGIN{03}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchlistMU1(MU1.first,MU1.last,match,TRUE);
  IF match THEN
    BEGIN
    IF ((NPREC1.DEFINITE IN [DEF,
ADEF]                                                 )
                                                      )
THEN IF
          ((ADJPREC1.EORENFORM =OMEGAFORM                         )
                                                      )
THEN IF
          ((ADJREC1.EORENFORM =OMEGAFORM                          )
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
          ((ADJPREC1.FORM<>SUPERLATIVE                            )
                                                      )
THEN IF
          ((DETREC1.EFORMATION =REGEFORMATION                     )
                                                      )
                                                       THEN
          BEGIN
          MAKET_ADJPrec(ADJPREC2);
          MAKET_ADJrec(ADJREC2);
          action91;
          action100;
          action112;
          createMU1;
          previous1;
          Is:=loopholes.retype(m,LISTREE_pstree);
          LISTREE_appendstreebonus(Is,result,wbonus);
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
          ((ADJPREC1.FORM =SUPERLATIVE                            )
                                                      )
                                                      )
                                                      )
                                                       THEN
          BEGIN
          IF ((ADJREC1.EFORMATION<>NOFORMATION                       )
                                                      )
                                                       THEN
            BEGIN
            MAKET_ADJPrec(ADJPREC2);
            MAKET_ADJrec(ADJREC2);
            action94;
            action99;
            action100;
            action112;
            createMU1;
            previous1;
            Is:=loopholes.retype(m,LISTREE_pstree);
            LISTREE_appendstreebonus(Is,result,wbonus);
            END;
          IF ((ADJREC1.EFORMATION =NOFORMATION                       )
                                                      )
                                                       THEN
            BEGIN
            MAKET_ADJPrec(ADJPREC2);
            MAKET_ADJrec(ADJREC2);
            action98;
            action99;
            action100;
            action112;
            createMU1;
            previous1;
            Is:=loopholes.retype(m,LISTREE_pstree);
            LISTREE_appendstreebonus(Is,result,wbonus);
            END;
                                                                END;
                                                              END;
      IF ((NOUNREC1.NUMBER =PLURAL                               )
                                                      )
                                                       THEN
        BEGIN
        IF ((ADJREC1.EFORMATION<>NOFORMATION                       )
                                                      )
                                                       THEN
          BEGIN
          MAKET_ADJPrec(ADJPREC2);
          MAKET_ADJrec(ADJREC2);
          action103;
          action108;
          action112;
          createMU1;
          previous1;
          Is:=loopholes.retype(m,LISTREE_pstree);
          LISTREE_appendstreebonus(Is,result,wbonus);
          END;
        IF ((ADJREC1.EFORMATION =NOFORMATION                       )
                                                      )
                                                       THEN
          BEGIN
          MAKET_ADJPrec(ADJPREC2);
          MAKET_ADJrec(ADJREC2);
          action107;
          action108;
          action112;
          createMU1;
          previous1;
          Is:=loopholes.retype(m,LISTREE_pstree);
          LISTREE_appendstreebonus(Is,result,wbonus);
          END;
                                                              END;
                                                            END;
                                                          END;
                                                       subrule0X3:=result
 END;
 FUNCTION subrule0X4 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
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
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createMU1;
  BEGIN{MU1}
  END{MU1};
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
                                                      PROCEDURE ACTION131;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=EFORM
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION135;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION138;
BEGIN
ADJREC2:=ADJREC1;                                     ;
ADJREC2.EORENFORM:=ADJPREC2.EORENFORM
                                                      
END;
                                                       BEGIN{04}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchlistMU1(MU1.first,MU1.last,match,TRUE);
  IF match THEN
    BEGIN
    IF ((NPREC1.DEFINITE IN [DEF,
ADEF]                                                 )
                                                      )
THEN IF
          ((ADJPREC1.EORENFORM =OMEGAFORM                         )
                                                      )
THEN IF
          ((ADJREC1.EORENFORM =OMEGAFORM                          )
                                                      )
                                                       THEN
      BEGIN
      IF ((ADJREC1.EFORMATION<>NOFORMATION                       )
                                                      )
                                                       THEN
        BEGIN
        MAKET_ADJPrec(ADJPREC2);
        MAKET_ADJrec(ADJREC2);
        action131;
        action138;
        createMU1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((ADJREC1.EFORMATION =NOFORMATION                       )
                                                      )
                                                       THEN
        BEGIN
        MAKET_ADJPrec(ADJPREC2);
        MAKET_ADJrec(ADJREC2);
        action135;
        action138;
        createMU1;
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
LinitMU1_1,LrestMU1_1,LfirstMU1_1,LlastMU1_1:LSSTREE_prelnode;
iMU1_1:INTEGER;
nomoretreesMU1_1,lastmatchMU1_1:BOOLEAN;
LinitMU1_1_1,LrestMU1_1_1,LfirstMU1_1_1,LlastMU1_1_1:LSSTREE_prelnode;
iMU1_1_1:INTEGER;
nomoretreesMU1_1_1,lastmatchMU1_1_1:BOOLEAN;
FUNCTION MATCHCONDMU1:BOOLEAN;
BEGIN MATCHCONDMU1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createMU1;
  BEGIN{MU1}
  END{MU1};
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
                                                      PROCEDURE ACTION151;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=EFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION155;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION158;
BEGIN
ADJREC2:=ADJREC1;                                     ;
ADJREC2.EORENFORM:=ADJPREC2.EORENFORM
                                                      
END;
                                                       BEGIN{05}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchlistMU1(MU1.first,MU1.last,match,TRUE);
  IF match THEN
    BEGIN
    IF ((NPREC1.DEFINITE IN [INDEF,
DEF]                                                  )
                                                      )
THEN IF
          ((ADJPREC1.EORENFORM =OMEGAFORM                         )
                                                      )
THEN IF
          ((ADJREC1.EORENFORM =OMEGAFORM                          )
                                                      )
                                                       THEN
      BEGIN
      IF ((ADJREC1.EFORMATION<>NOFORMATION                       )
                                                      )
                                                       THEN
        BEGIN
        MAKET_ADJPrec(ADJPREC2);
        MAKET_ADJrec(ADJREC2);
        action151;
        action158;
        createMU1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((ADJREC1.EFORMATION =NOFORMATION                       )
                                                      )
                                                       THEN
        BEGIN
        MAKET_ADJPrec(ADJPREC2);
        MAKET_ADJrec(ADJREC2);
        action155;
        action158;
        createMU1;
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
LinitMU1_1,LrestMU1_1,LfirstMU1_1,LlastMU1_1:LSSTREE_prelnode;
iMU1_1:INTEGER;
nomoretreesMU1_1,lastmatchMU1_1:BOOLEAN;
LinitMU1_1_1,LrestMU1_1_1,LfirstMU1_1_1,LlastMU1_1_1:LSSTREE_prelnode;
iMU1_1_1:INTEGER;
nomoretreesMU1_1_1,lastmatchMU1_1_1:BOOLEAN;
FUNCTION MATCHCONDMU1:BOOLEAN;
BEGIN MATCHCONDMU1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createMU1;
  BEGIN{MU1}
  END{MU1};
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
                                                      PROCEDURE ACTION171;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=EFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION175;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION178;
BEGIN
ADJREC2:=ADJREC1;                                     ;
ADJREC2.EORENFORM:=ADJPREC2.EORENFORM
                                                      
END;
                                                       BEGIN{06}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchlistMU1(MU1.first,MU1.last,match,TRUE);
  IF match THEN
    BEGIN
    IF ((NPREC1.DEFINITE IN [DEF]                                                 )
                                                      )
THEN IF
          ((NPREC8.CASES =[GENITIVE]                                            )
                                                      )
THEN IF
          ((ADJPREC1.EORENFORM =OMEGAFORM                         )
                                                      )
THEN IF
          ((ADJREC1.EORENFORM =OMEGAFORM                          )
                                                      )
                                                       THEN
      BEGIN
      IF ((ADJREC1.EFORMATION<>NOFORMATION                       )
                                                      )
                                                       THEN
        BEGIN
        MAKET_ADJPrec(ADJPREC2);
        MAKET_ADJrec(ADJREC2);
        action171;
        action178;
        createMU1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((ADJREC1.EFORMATION =NOFORMATION                       )
                                                      )
                                                       THEN
        BEGIN
        MAKET_ADJPrec(ADJPREC2);
        MAKET_ADJrec(ADJREC2);
        action175;
        action178;
        createMU1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                       subrule0X6:=result
 END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
match:= TRUE;
  first:=TRUE;
  WHILE match DO BEGIN
  MatchModel1(m1,first,match);
first:=FALSE;
  If match Then
  WHILE match AND NOT matchcondM1 DO
  BEGIN
  MatchModel1(m1,FALSE,match);
  END;
  If match Then
  BEGIN
  LISTREE_mergesetsofstrees(subrule0X1,result);
  LISTREE_mergesetsofstrees(subrule0X2,result);
  LISTREE_mergesetsofstrees(subrule0X3,result);
  LISTREE_mergesetsofstrees(subrule0X4,result);
  LISTREE_mergesetsofstrees(subrule0X5,result);
  LISTREE_mergesetsofstrees(subrule0X6,result);
 END;
END;{WHILE}
COMTNPASSIGNEFORM1:=result
END;
{:TNPASSIGNEFORM1}
{rule:}
{:TNPASSIGNEFORM2}
 FUNCTION COMTNPASSIGNEFORM2(Is1:LISTREE_pStree
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
LinitM1_2_2,LrestM1_2_2,LfirstM1_2_2,LlastM1_2_2:LSSTREE_prelnode;
iM1_2_2:INTEGER;
nomoretreesM1_2_2,lastmatchM1_2_2:BOOLEAN;
LinitM1_2_2_1,LrestM1_2_2_1,LfirstM1_2_2_1,LlastM1_2_2_1:LSSTREE_prelnode;
iM1_2_2_1:INTEGER;
nomoretreesM1_2_2_1,lastmatchM1_2_2_1:BOOLEAN;
LinitM1_2_2_2,LrestM1_2_2_2,LfirstM1_2_2_2,LlastM1_2_2_2:LSSTREE_prelnode;
iM1_2_2_2:INTEGER;
nomoretreesM1_2_2_2,lastmatchM1_2_2_2:BOOLEAN;
LinitM1_2_2_2_1,LrestM1_2_2_2_1,LfirstM1_2_2_2_1,LlastM1_2_2_2_1:LSSTREE_prelnode;
iM1_2_2_2_1:INTEGER;
nomoretreesM1_2_2_2_1,lastmatchM1_2_2_2_1:BOOLEAN;
LinitM1_2_3,LrestM1_2_3,LfirstM1_2_3,LlastM1_2_3:LSSTREE_prelnode;
iM1_2_3:INTEGER;
nomoretreesM1_2_3,lastmatchM1_2_3:BOOLEAN;
LinitM1_2_4,LrestM1_2_4,LfirstM1_2_4,LlastM1_2_4:LSSTREE_prelnode;
iM1_2_4:INTEGER;
nomoretreesM1_2_4,lastmatchM1_2_4:BOOLEAN;
LinitM1_2_5,LrestM1_2_5,LfirstM1_2_5,LlastM1_2_5:LSSTREE_prelnode;
iM1_2_5:INTEGER;
nomoretreesM1_2_5,lastmatchM1_2_5:BOOLEAN;
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
 m1:LSSTREE_pstree;
ENREC1tree:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU8:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
MU7:LSMRUQUO_ListOfStrees;
ENREC1:LSDOMAINT_ENrecord;
ADJREC1:LSDOMAINT_ADJrecord;
ADJPREC1:LSDOMAINT_ADJPrecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
ADJPREC2:LSDOMAINT_ADJPrecord;
ADJREC2:LSDOMAINT_ADJrecord;
FUNCTION matchcondM1:BOOLEAN;
BEGIN
  matchcondM1:= TRUE
END;{matchcondM1}
FUNCTION matchcondM:BOOLEAN;
BEGIN
  matchcondM:= TRUE
END;{matchcondM}
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
              ADJPREC1:=s^.ls^.ADJPfield^;
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
                  ADJREC1:=s^.ls^.ADJfield^;
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
LlastM1_2_2_2_1:=L;WHILE LlastM1_2_2_2_1^.brother<>NIL DO
LlastM1_2_2_2_1:=LlastM1_2_2_2_1^.brother;
match_MU8(L,LlastM1_2_2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
                LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM1_2_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM1_2_2_1,LlastM1_2_2_1
,item2,LfirstM1_2_2_2,LlastM1_2_2_2
) ELSE match_HEAD(LfirstM1_2_2_2,LfirstM1_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,MODREL
,HEAD,match,matchnode,matchlist2items,lastmatchM1_2_2) END;
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
,match,matchnode,matchlist0items,lastmatchM1_2_4) END;
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
LlastM1_2_5,LfirstM1_2_5,LrestM1_2_5,nomoretreesM1_2_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM1_2_4,LfirstM1_2_4,LrestM1_2_4,nomoretreesM1_2_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU4,matchlist2items,
LlastM1_2_3,LfirstM1_2_3,LrestM1_2_3,nomoretreesM1_2_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_MODREL,matchlist3items,
LlastM1_2_2,LfirstM1_2_2,LrestM1_2_2,nomoretreesM1_2_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU2,matchlist4items,
LlastM1_2_1,LfirstM1_2_1,LrestM1_2_1,nomoretreesM1_2_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=2)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree2rels(Lfirst,Llast,first,HEAD
,MODREL,HEAD,match,matchnode,matchlist5items,lastmatchM1_2) END;
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,HEAD,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) ELSE match_HEAD(LfirstM1_2,LfirstM1_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
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
            N^.ls^.ADJPfield^ := ADJPREC2;
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
                N^.ls^.ADJfield^ := ADJREC2;
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
m:=MAKET_stree(NP);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION3;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=EFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION6;
BEGIN
ADJPREC2:=ADJPREC1;                                   ;
ADJPREC2.EORENFORM:=NOFORM
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION9;
BEGIN
ADJREC2:=ADJREC1;                                     ;
ADJREC2.EORENFORM:=ADJPREC2.EORENFORM
                                                      
END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
match:= TRUE;
  first:=TRUE;
  WHILE match DO BEGIN
  MatchModel1(m1,first,match);
first:=FALSE;
  If match Then
  WHILE match AND NOT matchcondM1 DO
  BEGIN
  MatchModel1(m1,FALSE,match);
  END;
  If match Then
  BEGIN
 END;
IF match THEN
  BEGIN
  IF ((ADJPREC1.EORENFORM =OMEGAFORM                         )
                                                      )
THEN IF
          ((ADJREC1.EORENFORM =OMEGAFORM                          )
                                                      )
                                                       THEN
    BEGIN
    IF ((ADJREC1.EFORMATION<>NOFORMATION                       )
                                                      )
                                                       THEN
      BEGIN
      MAKET_ADJPrec(ADJPREC2);
      MAKET_ADJrec(ADJREC2);
      action3;
      action9;
      createM;
      Is:=loopholes.retype(m,LISTREE_pstree);
      LISTREE_appendstreebonus(Is,result,wbonus);
      END;
    IF ((ADJREC1.EFORMATION =NOFORMATION                       )
                                                      )
                                                       THEN
      BEGIN
      MAKET_ADJPrec(ADJPREC2);
      MAKET_ADJrec(ADJREC2);
      action6;
      action9;
      createM;
      Is:=loopholes.retype(m,LISTREE_pstree);
      LISTREE_appendstreebonus(Is,result,wbonus);
      END;
                                                          END;
                                                        END;
                                                      END;{WHILE}
COMTNPASSIGNEFORM2:=result
END;
{:TNPASSIGNEFORM2}
{rule:}
{:TNPASSIGNEFORM3}
 FUNCTION COMTNPASSIGNEFORM3(Is1:LISTREE_pStree
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
LinitM1_2_2,LrestM1_2_2,LfirstM1_2_2,LlastM1_2_2:LSSTREE_prelnode;
iM1_2_2:INTEGER;
nomoretreesM1_2_2,lastmatchM1_2_2:BOOLEAN;
LinitM1_2_2_1,LrestM1_2_2_1,LfirstM1_2_2_1,LlastM1_2_2_1:LSSTREE_prelnode;
iM1_2_2_1:INTEGER;
nomoretreesM1_2_2_1,lastmatchM1_2_2_1:BOOLEAN;
LinitM1_2_2_2,LrestM1_2_2_2,LfirstM1_2_2_2,LlastM1_2_2_2:LSSTREE_prelnode;
iM1_2_2_2:INTEGER;
nomoretreesM1_2_2_2,lastmatchM1_2_2_2:BOOLEAN;
LinitM1_2_2_2_1,LrestM1_2_2_2_1,LfirstM1_2_2_2_1,LlastM1_2_2_2_1:LSSTREE_prelnode;
iM1_2_2_2_1:INTEGER;
nomoretreesM1_2_2_2_1,lastmatchM1_2_2_2_1:BOOLEAN;
LinitM1_2_2_2_2,LrestM1_2_2_2_2,LfirstM1_2_2_2_2,LlastM1_2_2_2_2:LSSTREE_prelnode;
iM1_2_2_2_2:INTEGER;
nomoretreesM1_2_2_2_2,lastmatchM1_2_2_2_2:BOOLEAN;
LinitM1_2_2_2_2_1,LrestM1_2_2_2_2_1,LfirstM1_2_2_2_2_1,LlastM1_2_2_2_2_1:LSSTREE_prelnode;
iM1_2_2_2_2_1:INTEGER;
nomoretreesM1_2_2_2_2_1,lastmatchM1_2_2_2_2_1:BOOLEAN;
LinitM1_2_3,LrestM1_2_3,LfirstM1_2_3,LlastM1_2_3:LSSTREE_prelnode;
iM1_2_3:INTEGER;
nomoretreesM1_2_3,lastmatchM1_2_3:BOOLEAN;
LinitM1_2_4,LrestM1_2_4,LfirstM1_2_4,LlastM1_2_4:LSSTREE_prelnode;
iM1_2_4:INTEGER;
nomoretreesM1_2_4,lastmatchM1_2_4:BOOLEAN;
LinitM1_2_4_1,LrestM1_2_4_1,LfirstM1_2_4_1,LlastM1_2_4_1:LSSTREE_prelnode;
iM1_2_4_1:INTEGER;
nomoretreesM1_2_4_1,lastmatchM1_2_4_1:BOOLEAN;
LinitM1_2_5,LrestM1_2_5,LfirstM1_2_5,LlastM1_2_5:LSSTREE_prelnode;
iM1_2_5:INTEGER;
nomoretreesM1_2_5,lastmatchM1_2_5:BOOLEAN;
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
 m1:LSSTREE_pstree;
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
POSSADJREC1:LSDOMAINT_POSSADJrecord;
DETREC1:LSDOMAINT_DETrecord;
DETPREC1:LSDOMAINT_DETPrecord;
NOUNREC1:LSDOMAINT_NOUNrecord;
VERBREC1:LSDOMAINT_VERBrecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
SENTENCEREC1:LSDOMAINT_SENTENCErecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
VERBREC2:LSDOMAINT_VERBrecord;
FUNCTION matchcondM1:BOOLEAN;
BEGIN
  matchcondM1:= TRUE
END;{matchcondM1}
FUNCTION matchcondM:BOOLEAN;
BEGIN
  matchcondM:= TRUE
END;{matchcondM}
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
                      VERBREC1:=s^.ls^.VERBfield^;
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
LlastM1_2_2_2_2_1:=L;WHILE LlastM1_2_2_2_2_1^.brother<>NIL DO
LlastM1_2_2_2_2_1:=LlastM1_2_2_2_2_1^.brother;
match_MU10(L,LlastM1_2_2_2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
                    LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM1_2_2_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM1_2_2_2_1,LlastM1_2_2_2_1
,item2,LfirstM1_2_2_2_2,LlastM1_2_2_2_2
) ELSE match_HEAD(LfirstM1_2_2_2_2,LfirstM1_2_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,PREDREL
,HEAD,match,matchnode,matchlist2items,lastmatchM1_2_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_PREDREL(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM1_2_2_1,LlastM1_2_2_1
,item2,LfirstM1_2_2_2,LlastM1_2_2_2
) ELSE match_PREDREL(LfirstM1_2_2_2,LfirstM1_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,MODREL
,PREDREL,match,matchnode,matchlist2items,lastmatchM1_2_2) END;
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
LlastM1_2_4_1:=L;WHILE LlastM1_2_4_1^.brother<>NIL DO
LlastM1_2_4_1:=LlastM1_2_4_1^.brother;
match_MU5(L,LlastM1_2_4_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
            LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM1_2_4) END;
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
LlastM1_2_5,LfirstM1_2_5,LrestM1_2_5,nomoretreesM1_2_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM1_2_4,LfirstM1_2_4,LrestM1_2_4,nomoretreesM1_2_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU4,matchlist2items,
LlastM1_2_3,LfirstM1_2_3,LrestM1_2_3,nomoretreesM1_2_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_MODREL,matchlist3items,
LlastM1_2_2,LfirstM1_2_2,LrestM1_2_2,nomoretreesM1_2_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU2,matchlist4items,
LlastM1_2_1,LfirstM1_2_1,LrestM1_2_1,nomoretreesM1_2_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=2)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree2rels(Lfirst,Llast,first,HEAD
,MODREL,HEAD,match,matchnode,matchlist5items,lastmatchM1_2) END;
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,HEAD,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) ELSE match_HEAD(LfirstM1_2,LfirstM1_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
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
                    N^.ls^.VERBfield^ := VERBREC2;
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
FUNCTION MATCHCONDMU1:BOOLEAN;
BEGIN MATCHCONDMU1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createMU1;
  BEGIN{MU1}
  END{MU1};
                                                        PROCEDURE matchlistMU1(Lfirst,Lfinal:LSSTREE_pRelNode;
VAR match:BOOLEAN;first:BOOLEAN);
  VAR lisons:LISTREE_pRelnode;
                                                        BEGIN
IF match THEN matchlist0items(MU1.first,first,match);
  END;
                                                      PROCEDURE ACTION4;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=EFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION8;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION12;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=EFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION13;
BEGIN

END;
                                                      PROCEDURE ACTION14;
BEGIN

END;
                                                      PROCEDURE ACTION18;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION22;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=EFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION26;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION30;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=EFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION31;
BEGIN

END;
                                                      PROCEDURE ACTION32;
BEGIN

END;
                                                      PROCEDURE ACTION33;
BEGIN

END;
                                                      PROCEDURE ACTION34;
BEGIN

END;
                                                       BEGIN{01}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
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
        IF ((VERBREC1.MODUS =PRESPART                              )
                                                      )
THEN IF
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
          BEGIN
          MAKET_VERBrec(VERBREC2);
          action4;
          action14;
          action34;
          createMU1;
          previous1;
          Is:=loopholes.retype(m,LISTREE_pstree);
          LISTREE_appendstreebonus(Is,result,wbonus);
          END;
        IF ((VERBREC1.MODUS =PASTPART                              )
                                                      )
THEN IF
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
          BEGIN
          IF ((VERBREC1.CONJCLASSES *[1,
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
                                                       THEN
            BEGIN
            MAKET_VERBrec(VERBREC2);
            action8;
            action13;
            action14;
            action34;
            createMU1;
            previous1;
            Is:=loopholes.retype(m,LISTREE_pstree);
            LISTREE_appendstreebonus(Is,result,wbonus);
            END;
          IF ((VERBREC1.CONJCLASSES *[1,
2,
5,
6,
7,
8,
11,
12,
15,
16]                                                    =[]                                                    )
                                                      )
                                                       THEN
            BEGIN
            MAKET_VERBrec(VERBREC2);
            action12;
            action13;
            action14;
            action34;
            createMU1;
            previous1;
            Is:=loopholes.retype(m,LISTREE_pstree);
            LISTREE_appendstreebonus(Is,result,wbonus);
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
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
          BEGIN
          MAKET_VERBrec(VERBREC2);
          action18;
          action33;
          action34;
          createMU1;
          previous1;
          Is:=loopholes.retype(m,LISTREE_pstree);
          LISTREE_appendstreebonus(Is,result,wbonus);
          END;
        IF (([FEMGENDER,
MASCGENDER]                                            *NOUNREC1.GENDERS<>[]                                                    )
                                                      )
                                                       THEN
          BEGIN
          IF ((VERBREC1.MODUS =PRESPART                              )
                                                      )
THEN IF
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
            BEGIN
            MAKET_VERBrec(VERBREC2);
            action22;
            action32;
            action33;
            action34;
            createMU1;
            previous1;
            Is:=loopholes.retype(m,LISTREE_pstree);
            LISTREE_appendstreebonus(Is,result,wbonus);
            END;
          IF ((VERBREC1.MODUS =PASTPART                              )
                                                      )
THEN IF
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
            BEGIN
            IF ((VERBREC1.CONJCLASSES *[1,
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
                                                       THEN
              BEGIN
              MAKET_VERBrec(VERBREC2);
              action26;
              action31;
              action32;
              action33;
              action34;
              createMU1;
              previous1;
              Is:=loopholes.retype(m,LISTREE_pstree);
              LISTREE_appendstreebonus(Is,result,wbonus);
              END;
            IF ((VERBREC1.CONJCLASSES *[1,
2,
5,
6,
7,
8,
11,
12,
15,
16]                                                    =[]                                                    )
                                                      )
                                                       THEN
              BEGIN
              MAKET_VERBrec(VERBREC2);
              action30;
              action31;
              action32;
              action33;
              action34;
              createMU1;
              previous1;
              Is:=loopholes.retype(m,LISTREE_pstree);
              LISTREE_appendstreebonus(Is,result,wbonus);
              END;
                                                                  END;
                                                                END;
                                                              END;
                                                            END;
                                                          END;
                                                       subrule0X1:=result
 END;
 FUNCTION subrule0X2 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
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
(( NOT(T1^.CAT IN [POSSADJ]                                             )                                                     )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

  END;{matchcondI1}
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createMU1;
  BEGIN{MU1}
  END{MU1};
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
                                                      PROCEDURE ACTION58;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=EFORM
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION62;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION65;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=EFORM
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION66;
BEGIN

END;
                                                      PROCEDURE ACTION67;
BEGIN

END;
                                                      PROCEDURE ACTION71;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION75;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=EFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION79;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION83;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=EFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION84;
BEGIN

END;
                                                      PROCEDURE ACTION85;
BEGIN

END;
                                                      PROCEDURE ACTION86;
BEGIN

END;
                                                      PROCEDURE ACTION87;
BEGIN

END;
                                                       BEGIN{02}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
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
        IF ((VERBREC1.MODUS =PRESPART                              )
                                                      )
THEN IF
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
          BEGIN
          MAKET_VERBrec(VERBREC2);
          action58;
          action67;
          action87;
          createMU1;
          previous1;
          Is:=loopholes.retype(m,LISTREE_pstree);
          LISTREE_appendstreebonus(Is,result,wbonus);
          END;
        IF ((VERBREC1.MODUS =PASTPART                              )
                                                      )
THEN IF
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
          BEGIN
          IF ((VERBREC1.CONJCLASSES *[1,
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
                                                       THEN
            BEGIN
            MAKET_VERBrec(VERBREC2);
            action62;
            action66;
            action67;
            action87;
            createMU1;
            previous1;
            Is:=loopholes.retype(m,LISTREE_pstree);
            LISTREE_appendstreebonus(Is,result,wbonus);
            END;
          IF ((VERBREC1.CONJCLASSES *[1,
2,
5,
6,
7,
8,
11,
12,
15,
16]                                                    =[]                                                    )
                                                      )
                                                       THEN
            BEGIN
            MAKET_VERBrec(VERBREC2);
            action65;
            action66;
            action67;
            action87;
            createMU1;
            previous1;
            Is:=loopholes.retype(m,LISTREE_pstree);
            LISTREE_appendstreebonus(Is,result,wbonus);
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
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
          BEGIN
          MAKET_VERBrec(VERBREC2);
          action71;
          action86;
          action87;
          createMU1;
          previous1;
          Is:=loopholes.retype(m,LISTREE_pstree);
          LISTREE_appendstreebonus(Is,result,wbonus);
          END;
        IF (([FEMGENDER,
MASCGENDER]                                            *NOUNREC1.GENDERS<>[]                                                    )
                                                      )
                                                       THEN
          BEGIN
          IF ((VERBREC1.MODUS =PRESPART                              )
                                                      )
THEN IF
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
            BEGIN
            MAKET_VERBrec(VERBREC2);
            action75;
            action85;
            action86;
            action87;
            createMU1;
            previous1;
            Is:=loopholes.retype(m,LISTREE_pstree);
            LISTREE_appendstreebonus(Is,result,wbonus);
            END;
          IF ((VERBREC1.MODUS =PASTPART                              )
                                                      )
THEN IF
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
            BEGIN
            IF ((VERBREC1.CONJCLASSES *[1,
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
                                                       THEN
              BEGIN
              MAKET_VERBrec(VERBREC2);
              action79;
              action84;
              action85;
              action86;
              action87;
              createMU1;
              previous1;
              Is:=loopholes.retype(m,LISTREE_pstree);
              LISTREE_appendstreebonus(Is,result,wbonus);
              END;
            IF ((VERBREC1.CONJCLASSES *[1,
2,
5,
6,
7,
8,
11,
12,
15,
16]                                                    =[]                                                    )
                                                      )
                                                       THEN
              BEGIN
              MAKET_VERBrec(VERBREC2);
              action83;
              action84;
              action85;
              action86;
              action87;
              createMU1;
              previous1;
              Is:=loopholes.retype(m,LISTREE_pstree);
              LISTREE_appendstreebonus(Is,result,wbonus);
              END;
                                                                  END;
                                                                END;
                                                              END;
                                                            END;
                                                          END;
                                                       subrule0X2:=result
 END;
 FUNCTION subrule0X3 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
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
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createMU1;
  BEGIN{MU1}
  END{MU1};
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
                                                      PROCEDURE ACTION111;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=EFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION115;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION119;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=EFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION120;
BEGIN

END;
                                                      PROCEDURE ACTION121;
BEGIN

END;
                                                      PROCEDURE ACTION125;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION129;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=EFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION133;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION137;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=EFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION138;
BEGIN

END;
                                                      PROCEDURE ACTION139;
BEGIN

END;
                                                      PROCEDURE ACTION140;
BEGIN

END;
                                                      PROCEDURE ACTION141;
BEGIN

END;
                                                       BEGIN{03}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
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
        IF ((VERBREC1.MODUS =PRESPART                              )
                                                      )
THEN IF
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
          BEGIN
          MAKET_VERBrec(VERBREC2);
          action111;
          action121;
          action141;
          createMU1;
          previous1;
          Is:=loopholes.retype(m,LISTREE_pstree);
          LISTREE_appendstreebonus(Is,result,wbonus);
          END;
        IF ((VERBREC1.MODUS =PASTPART                              )
                                                      )
                                                       THEN
          BEGIN
          IF ((VERBREC1.CONJCLASSES *[1,
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
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
            BEGIN
            MAKET_VERBrec(VERBREC2);
            action115;
            action120;
            action121;
            action141;
            createMU1;
            previous1;
            Is:=loopholes.retype(m,LISTREE_pstree);
            LISTREE_appendstreebonus(Is,result,wbonus);
            END;
          IF ((VERBREC1.CONJCLASSES *[1,
2,
5,
6,
7,
8,
11,
12,
15,
16]                                                    =[]                                                    )
                                                      )
THEN IF
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
            BEGIN
            MAKET_VERBrec(VERBREC2);
            action119;
            action120;
            action121;
            action141;
            createMU1;
            previous1;
            Is:=loopholes.retype(m,LISTREE_pstree);
            LISTREE_appendstreebonus(Is,result,wbonus);
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
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
          BEGIN
          MAKET_VERBrec(VERBREC2);
          action125;
          action140;
          action141;
          createMU1;
          previous1;
          Is:=loopholes.retype(m,LISTREE_pstree);
          LISTREE_appendstreebonus(Is,result,wbonus);
          END;
        IF (([FEMGENDER,
MASCGENDER]                                            *NOUNREC1.GENDERS<>[]                                                    )
                                                      )
                                                       THEN
          BEGIN
          IF ((VERBREC1.MODUS =PRESPART                              )
                                                      )
THEN IF
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
            BEGIN
            MAKET_VERBrec(VERBREC2);
            action129;
            action139;
            action140;
            action141;
            createMU1;
            previous1;
            Is:=loopholes.retype(m,LISTREE_pstree);
            LISTREE_appendstreebonus(Is,result,wbonus);
            END;
          IF ((VERBREC1.MODUS =PASTPART                              )
                                                      )
                                                       THEN
            BEGIN
            IF ((VERBREC1.CONJCLASSES *[1,
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
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
              BEGIN
              MAKET_VERBrec(VERBREC2);
              action133;
              action138;
              action139;
              action140;
              action141;
              createMU1;
              previous1;
              Is:=loopholes.retype(m,LISTREE_pstree);
              LISTREE_appendstreebonus(Is,result,wbonus);
              END;
            IF ((VERBREC1.CONJCLASSES *[1,
2,
5,
6,
7,
8,
11,
12,
15,
16]                                                    =[]                                                    )
                                                      )
THEN IF
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
              BEGIN
              MAKET_VERBrec(VERBREC2);
              action137;
              action138;
              action139;
              action140;
              action141;
              createMU1;
              previous1;
              Is:=loopholes.retype(m,LISTREE_pstree);
              LISTREE_appendstreebonus(Is,result,wbonus);
              END;
                                                                  END;
                                                                END;
                                                              END;
                                                            END;
                                                          END;
                                                       subrule0X3:=result
 END;
 FUNCTION subrule0X4 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
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
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createMU1;
  BEGIN{MU1}
  END{MU1};
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
                                                      PROCEDURE ACTION166;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=EFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION170;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION174;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=EFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION175;
BEGIN

END;
                                                      PROCEDURE ACTION176;
BEGIN

END;
                                                       BEGIN{04}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchlistMU1(MU1.first,MU1.last,match,TRUE);
  IF match THEN
    BEGIN
    IF ((NPREC1.DEFINITE IN [DEF,
ADEF]                                                 )
                                                      )
                                                       THEN
      BEGIN
      IF ((VERBREC1.MODUS =PRESPART                              )
                                                      )
THEN IF
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
        BEGIN
        MAKET_VERBrec(VERBREC2);
        action166;
        action176;
        createMU1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((VERBREC1.MODUS =PASTPART                              )
                                                      )
                                                       THEN
        BEGIN
        IF ((VERBREC1.CONJCLASSES *[1,
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
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
          BEGIN
          MAKET_VERBrec(VERBREC2);
          action170;
          action175;
          action176;
          createMU1;
          previous1;
          Is:=loopholes.retype(m,LISTREE_pstree);
          LISTREE_appendstreebonus(Is,result,wbonus);
          END;
        IF ((VERBREC1.CONJCLASSES *[1,
2,
5,
6,
7,
8,
11,
12,
15,
16]                                                    =[]                                                    )
                                                      )
THEN IF
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
          BEGIN
          MAKET_VERBrec(VERBREC2);
          action174;
          action175;
          action176;
          createMU1;
          previous1;
          Is:=loopholes.retype(m,LISTREE_pstree);
          LISTREE_appendstreebonus(Is,result,wbonus);
          END;
                                                              END;
                                                            END;
                                                          END;
                                                       subrule0X4:=result
 END;
 FUNCTION subrule0X5 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitMU1_1,LrestMU1_1,LfirstMU1_1,LlastMU1_1:LSSTREE_prelnode;
iMU1_1:INTEGER;
nomoretreesMU1_1,lastmatchMU1_1:BOOLEAN;
LinitMU1_1_1,LrestMU1_1_1,LfirstMU1_1_1,LlastMU1_1_1:LSSTREE_prelnode;
iMU1_1_1:INTEGER;
nomoretreesMU1_1_1,lastmatchMU1_1_1:BOOLEAN;
FUNCTION MATCHCONDMU1:BOOLEAN;
BEGIN MATCHCONDMU1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createMU1;
  BEGIN{MU1}
  END{MU1};
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
                                                      PROCEDURE ACTION188;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=EFORM
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION192;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION196;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=EFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION197;
BEGIN

END;
                                                      PROCEDURE ACTION198;
BEGIN

END;
                                                       BEGIN{05}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchlistMU1(MU1.first,MU1.last,match,TRUE);
  IF match THEN
    BEGIN
    IF ((NPREC1.DEFINITE IN [INDEF,
MENIGDEF]                                             )
                                                      )
                                                       THEN
      BEGIN
      IF ((VERBREC1.MODUS =PRESPART                              )
                                                      )
THEN IF
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
        BEGIN
        MAKET_VERBrec(VERBREC2);
        action188;
        action198;
        createMU1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((VERBREC1.MODUS =PASTPART                              )
                                                      )
                                                       THEN
        BEGIN
        IF ((VERBREC1.CONJCLASSES *[1,
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
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
          BEGIN
          MAKET_VERBrec(VERBREC2);
          action192;
          action197;
          action198;
          createMU1;
          previous1;
          Is:=loopholes.retype(m,LISTREE_pstree);
          LISTREE_appendstreebonus(Is,result,wbonus);
          END;
        IF ((VERBREC1.CONJCLASSES *[1,
2,
5,
6,
7,
8,
11,
12,
15,
16]                                                    =[]                                                    )
                                                      )
THEN IF
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
          BEGIN
          MAKET_VERBrec(VERBREC2);
          action196;
          action197;
          action198;
          createMU1;
          previous1;
          Is:=loopholes.retype(m,LISTREE_pstree);
          LISTREE_appendstreebonus(Is,result,wbonus);
          END;
                                                              END;
                                                            END;
                                                          END;
                                                       subrule0X5:=result
 END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
match:= TRUE;
  first:=TRUE;
  WHILE match DO BEGIN
  MatchModel1(m1,first,match);
first:=FALSE;
  If match Then
  WHILE match AND NOT matchcondM1 DO
  BEGIN
  MatchModel1(m1,FALSE,match);
  END;
  If match Then
  BEGIN
  LISTREE_mergesetsofstrees(subrule0X1,result);
  LISTREE_mergesetsofstrees(subrule0X2,result);
  LISTREE_mergesetsofstrees(subrule0X3,result);
  LISTREE_mergesetsofstrees(subrule0X4,result);
  LISTREE_mergesetsofstrees(subrule0X5,result);
 END;
END;{WHILE}
COMTNPASSIGNEFORM3:=result
END;
{:TNPASSIGNEFORM3}
{rule:}
{:TNPASSIGNEFORM4}
 FUNCTION COMTNPASSIGNEFORM4(Is1:LISTREE_pStree
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
LinitM1_2_2,LrestM1_2_2,LfirstM1_2_2,LlastM1_2_2:LSSTREE_prelnode;
iM1_2_2:INTEGER;
nomoretreesM1_2_2,lastmatchM1_2_2:BOOLEAN;
LinitM1_2_2_1,LrestM1_2_2_1,LfirstM1_2_2_1,LlastM1_2_2_1:LSSTREE_prelnode;
iM1_2_2_1:INTEGER;
nomoretreesM1_2_2_1,lastmatchM1_2_2_1:BOOLEAN;
LinitM1_2_2_2,LrestM1_2_2_2,LfirstM1_2_2_2,LlastM1_2_2_2:LSSTREE_prelnode;
iM1_2_2_2:INTEGER;
nomoretreesM1_2_2_2,lastmatchM1_2_2_2:BOOLEAN;
LinitM1_2_2_2_1,LrestM1_2_2_2_1,LfirstM1_2_2_2_1,LlastM1_2_2_2_1:LSSTREE_prelnode;
iM1_2_2_2_1:INTEGER;
nomoretreesM1_2_2_2_1,lastmatchM1_2_2_2_1:BOOLEAN;
LinitM1_2_2_2_2,LrestM1_2_2_2_2,LfirstM1_2_2_2_2,LlastM1_2_2_2_2:LSSTREE_prelnode;
iM1_2_2_2_2:INTEGER;
nomoretreesM1_2_2_2_2,lastmatchM1_2_2_2_2:BOOLEAN;
LinitM1_2_2_2_2_1,LrestM1_2_2_2_2_1,LfirstM1_2_2_2_2_1,LlastM1_2_2_2_2_1:LSSTREE_prelnode;
iM1_2_2_2_2_1:INTEGER;
nomoretreesM1_2_2_2_2_1,lastmatchM1_2_2_2_2_1:BOOLEAN;
LinitM1_2_3,LrestM1_2_3,LfirstM1_2_3,LlastM1_2_3:LSSTREE_prelnode;
iM1_2_3:INTEGER;
nomoretreesM1_2_3,lastmatchM1_2_3:BOOLEAN;
LinitM1_2_4,LrestM1_2_4,LfirstM1_2_4,LlastM1_2_4:LSSTREE_prelnode;
iM1_2_4:INTEGER;
nomoretreesM1_2_4,lastmatchM1_2_4:BOOLEAN;
LinitM1_2_5,LrestM1_2_5,LfirstM1_2_5,LlastM1_2_5:LSSTREE_prelnode;
iM1_2_5:INTEGER;
nomoretreesM1_2_5,lastmatchM1_2_5:BOOLEAN;
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
 m1:LSSTREE_pstree;
ENREC1tree:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU8:LSMRUQUO_ListOfStrees;
MU9:LSMRUQUO_ListOfStrees;
MU10:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
MU7:LSMRUQUO_ListOfStrees;
ENREC1:LSDOMAINT_ENrecord;
VERBREC1:LSDOMAINT_VERBrecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
SENTENCEREC1:LSDOMAINT_SENTENCErecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
VERBREC2:LSDOMAINT_VERBrecord;
FUNCTION matchcondM1:BOOLEAN;
BEGIN
  matchcondM1:= TRUE
END;{matchcondM1}
FUNCTION matchcondM:BOOLEAN;
BEGIN
  matchcondM:= TRUE
END;{matchcondM}
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
                      VERBREC1:=s^.ls^.VERBfield^;
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
LlastM1_2_2_2_2_1:=L;WHILE LlastM1_2_2_2_2_1^.brother<>NIL DO
LlastM1_2_2_2_2_1:=LlastM1_2_2_2_2_1^.brother;
match_MU10(L,LlastM1_2_2_2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
                    LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM1_2_2_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM1_2_2_2_1,LlastM1_2_2_2_1
,item2,LfirstM1_2_2_2_2,LlastM1_2_2_2_2
) ELSE match_HEAD(LfirstM1_2_2_2_2,LfirstM1_2_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,PREDREL
,HEAD,match,matchnode,matchlist2items,lastmatchM1_2_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_PREDREL(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM1_2_2_1,LlastM1_2_2_1
,item2,LfirstM1_2_2_2,LlastM1_2_2_2
) ELSE match_PREDREL(LfirstM1_2_2_2,LfirstM1_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,MODREL
,PREDREL,match,matchnode,matchlist2items,lastmatchM1_2_2) END;
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
,match,matchnode,matchlist0items,lastmatchM1_2_4) END;
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
LlastM1_2_5,LfirstM1_2_5,LrestM1_2_5,nomoretreesM1_2_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM1_2_4,LfirstM1_2_4,LrestM1_2_4,nomoretreesM1_2_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU4,matchlist2items,
LlastM1_2_3,LfirstM1_2_3,LrestM1_2_3,nomoretreesM1_2_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_MODREL,matchlist3items,
LlastM1_2_2,LfirstM1_2_2,LrestM1_2_2,nomoretreesM1_2_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU2,matchlist4items,
LlastM1_2_1,LfirstM1_2_1,LrestM1_2_1,nomoretreesM1_2_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=2)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree2rels(Lfirst,Llast,first,HEAD
,MODREL,HEAD,match,matchnode,matchlist5items,lastmatchM1_2) END;
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,HEAD,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) ELSE match_HEAD(LfirstM1_2,LfirstM1_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
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
                    N^.ls^.VERBfield^ := VERBREC2;
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
m:=MAKET_stree(NP);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION3;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=EFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION7;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=NOFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION11;
BEGIN
VERBREC2:=VERBREC1;                                   ;
VERBREC2.EORENFORM:=EFORM
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION12;
BEGIN

END;
                                                      PROCEDURE ACTION13;
BEGIN

END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
match:= TRUE;
  first:=TRUE;
  WHILE match DO BEGIN
  MatchModel1(m1,first,match);
first:=FALSE;
  If match Then
  WHILE match AND NOT matchcondM1 DO
  BEGIN
  MatchModel1(m1,FALSE,match);
  END;
  If match Then
  BEGIN
 END;
IF match THEN
  BEGIN
  IF ((TRUE                                                  )
                                                      )
                                                       THEN
    BEGIN
    IF ((VERBREC1.MODUS =PRESPART                              )
                                                      )
THEN IF
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
      BEGIN
      MAKET_VERBrec(VERBREC2);
      action3;
      action13;
      createM;
      Is:=loopholes.retype(m,LISTREE_pstree);
      LISTREE_appendstreebonus(Is,result,wbonus);
      END;
    IF ((VERBREC1.MODUS =PASTPART                              )
                                                      )
                                                       THEN
      BEGIN
      IF ((VERBREC1.CONJCLASSES *[1,
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
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
        BEGIN
        MAKET_VERBrec(VERBREC2);
        action7;
        action12;
        action13;
        createM;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((VERBREC1.CONJCLASSES *[1,
2,
5,
6,
7,
8,
11,
12,
15,
16]                                                    =[]                                                    )
                                                      )
THEN IF
          ((VERBREC1.EORENFORM =OMEGAFORM                         )
                                                      )
                                                       THEN
        BEGIN
        MAKET_VERBrec(VERBREC2);
        action11;
        action12;
        action13;
        createM;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                        END;
                                                      END;{WHILE}
COMTNPASSIGNEFORM4:=result
END;
{:TNPASSIGNEFORM4}
{rule:}
{:RNPMODADVP}
 FUNCTION COMRNPMODADVP(Is1:LISTREE_pStree;Is2:LISTREE_pStree
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
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
WHPROREC1:LSDOMAINT_WHPROrecord;
INDEFPROREC1:LSDOMAINT_INDEFPROrecord;
ADVPREC1:LSDOMAINT_ADVPrecord;
NPREC1:LSDOMAINT_NPrecord;
NPREC2:LSDOMAINT_NPrecord;
ADVPREC2:LSDOMAINT_ADVPrecord;
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
                                                      PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
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
LlastM1_1:=L;WHILE LlastM1_1^.brother<>NIL DO
LlastM1_1:=LlastM1_1^.brother;
match_MU1(L,LlastM1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist1items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>ADVP THEN
      match:=FALSE;
    IF match THEN
      ADVPREC1:=s^.ls^.ADVPfield^;
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
LlastM2_1:=L;WHILE LlastM2_1^.brother<>NIL DO
LlastM2_1:=LlastM2_1^.brother;
match_MU2(L,LlastM2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist1items,lastmatch) END;
                                                      PROCEDURE createM;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := NP;
    N^.ls^.NPfield^ := NPREC2;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMODREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := ADVP;
        N^.ls^.ADVPfield^ := ADVPREC2;
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
                                                          BEGIN{MODREL}
LSMATCHES_createitem(list,MODREL,ADVP,createnode,createlist1);
    END{MODREL};
                                                        BEGIN{createitem11}
  createMODREL(list);
  END;
  PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
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
                                                          BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,NP,createnode,createlist1);
    END{HEAD};
                                                        BEGIN{createitem12}
  createHEAD(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist2items11(wholelist,createitem11,createitem12);
  END{createlist1};
                                                      BEGIN{createM}
m:=MAKET_stree(NP);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION9;
BEGIN
ADVPREC2:=ADVPREC1;                                   ;
ADVPREC1.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
NPREC2:=NPREC1;                                       ;
NPREC1.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
NPREC1.GENERIC:=OMEGAGENERIC
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
  IF ((PREXPADV IN ADVPREC1.ACTSUBCEFS                       )
                                                      )
                                                       THEN
    BEGIN
    MAKET_NPrec(NPREC2);
    MAKET_ADVPrec(ADVPREC2);
    action9;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                          END;
COMRNPMODADVP:=result
END;
{:RNPMODADVP}
{rule:}
{:TNPENDELETION1}
 FUNCTION COMTNPENDELETION1(Is1:LISTREE_pStree
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
LinitM1_2_2,LrestM1_2_2,LfirstM1_2_2,LlastM1_2_2:LSSTREE_prelnode;
iM1_2_2:INTEGER;
nomoretreesM1_2_2,lastmatchM1_2_2:BOOLEAN;
LinitM1_2_3,LrestM1_2_3,LfirstM1_2_3,LlastM1_2_3:LSSTREE_prelnode;
iM1_2_3:INTEGER;
nomoretreesM1_2_3,lastmatchM1_2_3:BOOLEAN;
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
 m1:LSSTREE_pstree;
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
NPREC1:LSDOMAINT_NPrecord;
CNREC2:LSDOMAINT_CNrecord;
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
                                                            PROCEDURE MatchList3Items
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
            IF match THEN match:=(s^.ls^.ENfield^.key=auxkey('COUNTENKEY'));
          END{MatchNode};
                                                      BEGIN{MatchTree}
                        ENREC1tree:=Lfirst^.node;
              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchM1_2_2) END;
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
LlastM1_2_3,LfirstM1_2_3,LrestM1_2_3,nomoretreesM1_2_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM1_2_2,LfirstM1_2_2,LrestM1_2_2,nomoretreesM1_2_2) END;
      BEGIN {MatchList3Items}
        match:=FALSE;
        IF first THEN
          BEGIN 
        nomoretreesM1_2_1:=False;
          LlastM1_2_1:=NIL;LrestM1_2_1:=L;LfirstM1_2_1:=NIL;
          END
        ELSE
        BEGIN
          Match_MU2(LfirstM1_2_1,LlastM1_2_1,FALSE,match);
          IF NOT match THEN
            MatchList2Items(LrestM1_2_1,FALSE,match);
        END;
        IF NOT(first OR nomoretreesM1_2_1 OR match) THEN
          SelectLfirstAndLlast(LfirstM1_2_1,LlastM1_2_1,LrestM1_2_1
,nomoretreesM1_2_1,L);
        While (NOT match) AND (NOT nomoretreesM1_2_1) DO
        BEGIN
          Match_MU2(LfirstM1_2_1,LlastM1_2_1,TRUE,itemmatch);
          IF itemmatch THEN
            MatchList2Items(LrestM1_2_1,TRUE,listmatch);
          match:=(itemmatch AND listmatch);
          IF (NOT match) THEN
            SelectLfirstAndLlast(LfirstM1_2_1,LlastM1_2_1,LrestM1_2_1
,nomoretreesM1_2_1,L);
        END;{while}
        IF match THEN IF NOT MatchcondI5 THEN
          MatchList3Items(LrestM1_2_1,FALSE,match);
      END;{MatchList3Items}
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist3items,lastmatchM1_2) END;
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,HEAD,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) ELSE match_HEAD(LfirstM1_2,LfirstM1_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
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
        N^.ls^.CNfield^ := CNREC2;
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
        PROCEDURE createMU3(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU3}
        copylist(MU3,list);
        END{MU3};
                                                            BEGIN{createitem12}
      createMU3(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist2items00(wholelist,createitem11,createitem12);
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
m:=MAKET_stree(NP);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION0;
BEGIN
CNREC2:=CNREC1;                                       ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION2;
BEGIN
CNREC2:=CNREC1;                                       ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION3;
BEGIN

END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
  WHILE match AND NOT matchcondM1 DO
  BEGIN
  MatchModel1(m1,FALSE,match);
  END;
  If match Then
  BEGIN
 END;
IF match THEN
  BEGIN
  IF ((COUNT IN NPREC1.ACTCOMAS                              )
                                                      )
THEN IF
          ((COUNT IN CNREC1.POSSCOMAS                             )
                                                      )
                                                       THEN
    BEGIN
    IF ((NPREC1.NUMBER =PLURAL                                 )
                                                      )
THEN IF
          ((CNREC2.NUMBERS =[PLURAL]                                              )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC2);
      action0;
      action3;
      createM;
      Is:=loopholes.retype(m,LISTREE_pstree);
      LISTREE_appendstreebonus(Is,result,wbonus);
      END;
    IF ((NPREC1.NUMBER =SINGULAR                               )
                                                      )
THEN IF
          ((CNREC2.NUMBERS =[SINGULAR]                                            )
                                                      )
                                                       THEN
      BEGIN
      MAKET_CNrec(CNREC2);
      action2;
      action3;
      createM;
      Is:=loopholes.retype(m,LISTREE_pstree);
      LISTREE_appendstreebonus(Is,result,wbonus);
      END;
                                                          END;
                                                        END;
                                                      COMTNPENDELETION1:=result
END;
{:TNPENDELETION1}
{rule:}
{:TNPENDELETION2}
 FUNCTION COMTNPENDELETION2(Is1:LISTREE_pStree
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
LinitM1_2_2,LrestM1_2_2,LfirstM1_2_2,LlastM1_2_2:LSSTREE_prelnode;
iM1_2_2:INTEGER;
nomoretreesM1_2_2,lastmatchM1_2_2:BOOLEAN;
LinitM1_2_3,LrestM1_2_3,LfirstM1_2_3,LlastM1_2_3:LSSTREE_prelnode;
iM1_2_3:INTEGER;
nomoretreesM1_2_3,lastmatchM1_2_3:BOOLEAN;
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
 m1:LSSTREE_pstree;
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
NPREC1:LSDOMAINT_NPrecord;
CNREC2:LSDOMAINT_CNrecord;
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
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>CN THEN
          match:=FALSE;
        IF match THEN
          CNREC1:=s^.ls^.CNfield^;
      END{MatchNode};
                                                            PROCEDURE MatchList3Items
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
            IF match THEN match:=(s^.ls^.ENfield^.key=auxkey('MASSENKEY'));
          END{MatchNode};
                                                      BEGIN{MatchTree}
                        ENREC1tree:=Lfirst^.node;
              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchM1_2_2) END;
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
LlastM1_2_3,LfirstM1_2_3,LrestM1_2_3,nomoretreesM1_2_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM1_2_2,LfirstM1_2_2,LrestM1_2_2,nomoretreesM1_2_2) END;
      BEGIN {MatchList3Items}
        match:=FALSE;
        IF first THEN
          BEGIN 
        nomoretreesM1_2_1:=False;
          LlastM1_2_1:=NIL;LrestM1_2_1:=L;LfirstM1_2_1:=NIL;
          END
        ELSE
        BEGIN
          Match_MU2(LfirstM1_2_1,LlastM1_2_1,FALSE,match);
          IF NOT match THEN
            MatchList2Items(LrestM1_2_1,FALSE,match);
        END;
        IF NOT(first OR nomoretreesM1_2_1 OR match) THEN
          SelectLfirstAndLlast(LfirstM1_2_1,LlastM1_2_1,LrestM1_2_1
,nomoretreesM1_2_1,L);
        While (NOT match) AND (NOT nomoretreesM1_2_1) DO
        BEGIN
          Match_MU2(LfirstM1_2_1,LlastM1_2_1,TRUE,itemmatch);
          IF itemmatch THEN
            MatchList2Items(LrestM1_2_1,TRUE,listmatch);
          match:=(itemmatch AND listmatch);
          IF (NOT match) THEN
            SelectLfirstAndLlast(LfirstM1_2_1,LlastM1_2_1,LrestM1_2_1
,nomoretreesM1_2_1,L);
        END;{while}
        IF match THEN IF NOT MatchcondI5 THEN
          MatchList3Items(LrestM1_2_1,FALSE,match);
      END;{MatchList3Items}
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist3items,lastmatchM1_2) END;
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,HEAD,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) ELSE match_HEAD(LfirstM1_2,LfirstM1_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist3items,lastmatch) END;
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
        N^.ls^.CNfield^ := CNREC2;
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
        PROCEDURE createMU3(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU3}
        copylist(MU3,list);
        END{MU3};
                                                            BEGIN{createitem12}
      createMU3(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist2items00(wholelist,createitem11,createitem12);
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
m:=MAKET_stree(NP);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION1;
BEGIN
CNREC2:=CNREC1;                                       ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
  BEGIN
 END;
IF match THEN
  BEGIN
  IF ((MASS IN NPREC1.ACTCOMAS                               )
                                                      )
THEN IF
          ((CNREC1.NUMBERS =[SINGULAR]                                            )
                                                      )
                                                       THEN
    BEGIN
    MAKET_CNrec(CNREC2);
    action1;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                      COMTNPENDELETION2:=result
END;
{:TNPENDELETION2}
{rule:}
{:FNPPOSTENDELETION}
 FUNCTION COMFNPPOSTENDELETION(Is:LISTREE_pStree):LISTREE_pstree;VAR result:LISTREE_pStree;
 m:LSSTREE_pstree;
 match:BOOLEAN;
LinitM1_1,LrestM1_1,LfirstM1_1,LlastM1_1:LSSTREE_prelnode;
iM1_1:INTEGER;
nomoretreesM1_1,lastmatchM1_1:BOOLEAN;
LinitM1_2,LrestM1_2,LfirstM1_2,LlastM1_2:LSSTREE_prelnode;
iM1_2:INTEGER;
nomoretreesM1_2,lastmatchM1_2:BOOLEAN;
LinitM1_2_1,LrestM1_2_1,LfirstM1_2_1,LlastM1_2_1:LSSTREE_prelnode;
iM1_2_1:INTEGER;
nomoretreesM1_2_1,lastmatchM1_2_1:BOOLEAN;
LinitM1_2_2,LrestM1_2_2,LfirstM1_2_2,LlastM1_2_2:LSSTREE_prelnode;
iM1_2_2:INTEGER;
nomoretreesM1_2_2,lastmatchM1_2_2:BOOLEAN;
LinitM1_2_3,LrestM1_2_3,LfirstM1_2_3,LlastM1_2_3:LSSTREE_prelnode;
iM1_2_3:INTEGER;
nomoretreesM1_2_3,lastmatchM1_2_3:BOOLEAN;
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
REL3:LSDOMAINT_synrel;
T1:LSSTREE_pStree;
ENREC1tree:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
ENREC1:LSDOMAINT_ENrecord;
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
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>CN THEN
          match:=FALSE;
        IF match THEN
          CNREC1:=s^.ls^.CNfield^;
      END{MatchNode};
                                                            PROCEDURE MatchList3Items
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
,match,matchnode,matchlist0items,lastmatchM1_2_2) END;
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
LlastM1_2_3,LfirstM1_2_3,LrestM1_2_3,nomoretreesM1_2_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM1_2_2,LfirstM1_2_2,LrestM1_2_2,nomoretreesM1_2_2) END;
      BEGIN {MatchList3Items}
        match:=FALSE;
        IF first THEN
          BEGIN 
        nomoretreesM1_2_1:=False;
          LlastM1_2_1:=NIL;LrestM1_2_1:=L;LfirstM1_2_1:=NIL;
          END
        ELSE
        BEGIN
          Match_MU2(LfirstM1_2_1,LlastM1_2_1,FALSE,match);
          IF NOT match THEN
            MatchList2Items(LrestM1_2_1,FALSE,match);
        END;
        IF NOT(first OR nomoretreesM1_2_1 OR match) THEN
          SelectLfirstAndLlast(LfirstM1_2_1,LlastM1_2_1,LrestM1_2_1
,nomoretreesM1_2_1,L);
        While (NOT match) AND (NOT nomoretreesM1_2_1) DO
        BEGIN
          Match_MU2(LfirstM1_2_1,LlastM1_2_1,TRUE,itemmatch);
          IF itemmatch THEN
            MatchList2Items(LrestM1_2_1,TRUE,listmatch);
          match:=(itemmatch AND listmatch);
          IF (NOT match) THEN
            SelectLfirstAndLlast(LfirstM1_2_1,LlastM1_2_1,LrestM1_2_1
,nomoretreesM1_2_1,L);
        END;{while}
        IF match THEN IF NOT MatchcondI5 THEN
          MatchList3Items(LrestM1_2_1,FALSE,match);
      END;{MatchList3Items}
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist3items,lastmatchM1_2) END;
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,HEAD,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) ELSE match_HEAD(LfirstM1_2,LfirstM1_2,FALSE,match) END;
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
COMFNPPOSTENDELETION:=result
END;
{:FNPPOSTENDELETION}
{rule:}
{:FNPPREENDELETION}
 FUNCTION COMFNPPREENDELETION(Is:LISTREE_pStree):LISTREE_pstree;BEGIN
COMFNPPREENDELETION:=Is;
END;
{:FNPPREENDELETION}
{rule:}
{:TNPCNDELETION1}
 FUNCTION COMTNPCNDELETION1(Is1:LISTREE_pStree
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
LinitM1_1_1,LrestM1_1_1,LfirstM1_1_1,LlastM1_1_1:LSSTREE_prelnode;
iM1_1_1:INTEGER;
nomoretreesM1_1_1,lastmatchM1_1_1:BOOLEAN;
LinitM1_1_1_1,LrestM1_1_1_1,LfirstM1_1_1_1,LlastM1_1_1_1:LSSTREE_prelnode;
iM1_1_1_1:INTEGER;
nomoretreesM1_1_1_1,lastmatchM1_1_1_1:BOOLEAN;
LinitM1_2,LrestM1_2,LfirstM1_2,LlastM1_2:LSSTREE_prelnode;
iM1_2:INTEGER;
nomoretreesM1_2,lastmatchM1_2:BOOLEAN;
LinitM1_2_1,LrestM1_2_1,LfirstM1_2_1,LlastM1_2_1:LSSTREE_prelnode;
iM1_2_1:INTEGER;
nomoretreesM1_2_1,lastmatchM1_2_1:BOOLEAN;
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
 m1:LSSTREE_pstree;
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
                                                      PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
LlastM1_1_1_1:=L;WHILE LlastM1_1_1_1^.brother<>NIL DO
LlastM1_1_1_1:=LlastM1_1_1_1^.brother;
match_MU4(L,LlastM1_1_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
            LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM1_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM1_1_1,LfirstM1_1_1,LrestM1_1_1,nomoretreesM1_1_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,DETREL
,HEAD,match,matchnode,matchlist1items,lastmatchM1_1) END;
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
            IF s^.ls^.cat<>EN THEN
              match:=FALSE;
            IF match THEN
              ENREC1:=s^.ls^.ENfield^;
            IF match THEN match:=(s^.ls^.ENfield^.key=auxkey('COUNTENKEY'));
          END{MatchNode};
                                                      BEGIN{MatchTree}
                        ENREC1tree:=Lfirst^.node;
              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchM1_2_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM1_2_1,LfirstM1_2_1,LrestM1_2_1,nomoretreesM1_2_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist1items,lastmatchM1_2) END;
                                                            PROCEDURE MatchList1Items
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
                                                      BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist0items,
LlastM1_3,LfirstM1_3,LrestM1_3,nomoretreesM1_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM1_2,LfirstM1_2,LrestM1_2,nomoretreesM1_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_DETREL,matchlist2items,
LlastM1_1,LfirstM1_1,LrestM1_1,nomoretreesM1_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,DETREL,HEAD,match,matchnode,matchlist3items,lastmatch) END;
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
    PROCEDURE createMU1(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU1}
    copylist(MU1,list);
    END{MU1};
                                                        BEGIN{createitem12}
  createMU1(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist2items10(wholelist,createitem11,createitem12);
  END{createlist1};
                                                      BEGIN{createM}
m:=MAKET_stree(NP);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION0;
BEGIN
;wbonus:=0;sbonus:=0

END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
CNRECDEF:LSDOMAINT_CNrecord;
BEGIN
MAKET_CNrec(CNRECDEF);
result:=TRUE
AND
(CNREC1.req=CNRECDEF.req)AND
(CNREC1.env=CNRECDEF.env)AND
(CNREC1.superdeixis=CNRECDEF.superdeixis)AND
(CNREC1.class=CNRECDEF.class)AND
(CNREC1.deixis=CNRECDEF.deixis)AND
(CNREC1.aspect=CNRECDEF.aspect)AND
(CNREC1.retro=CNRECDEF.retro)AND
(CNREC1.definite=CNRECDEF.definite)AND
(CNREC1.cases=CNRECDEF.cases)AND
(CNREC1.genders=CNRECDEF.genders)AND
(CNREC1.sexes=CNRECDEF.sexes)AND
(CNREC1.actsubcs=CNRECDEF.actsubcs)AND
(CNREC1.temporal=CNRECDEF.temporal)AND
(CNREC1.possgeni=CNRECDEF.possgeni)AND
(CNREC1.animate=CNRECDEF.animate)AND
(CNREC1.human=CNRECDEF.human)AND
(CNREC1.thetanp=CNRECDEF.thetanp)AND
(CNREC1.nounpatternefs=CNRECDEF.nounpatternefs)
;except1:=result
END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
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
THEN IF
          ((except1                                               )
                                                      )
THEN IF
          ((PLURAL IN CNREC1.NUMBERS                              )
                                                      )
THEN IF
          ((COUNT IN CNREC1.POSSCOMAS                             )
                                                      )
                                                       THEN
    BEGIN
    action0;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                      COMTNPCNDELETION1:=result
END;
{:TNPCNDELETION1}
{rule:}
{:TNPCNDELETION2}
 FUNCTION COMTNPCNDELETION2(Is1:LISTREE_pStree
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
LinitM1_1_1,LrestM1_1_1,LfirstM1_1_1,LlastM1_1_1:LSSTREE_prelnode;
iM1_1_1:INTEGER;
nomoretreesM1_1_1,lastmatchM1_1_1:BOOLEAN;
LinitM1_1_2,LrestM1_1_2,LfirstM1_1_2,LlastM1_1_2:LSSTREE_prelnode;
iM1_1_2:INTEGER;
nomoretreesM1_1_2,lastmatchM1_1_2:BOOLEAN;
LinitM1_1_2_1,LrestM1_1_2_1,LfirstM1_1_2_1,LlastM1_1_2_1:LSSTREE_prelnode;
iM1_1_2_1:INTEGER;
nomoretreesM1_1_2_1,lastmatchM1_1_2_1:BOOLEAN;
LinitM1_2,LrestM1_2,LfirstM1_2,LlastM1_2:LSSTREE_prelnode;
iM1_2:INTEGER;
nomoretreesM1_2,lastmatchM1_2:BOOLEAN;
LinitM1_2_1,LrestM1_2_1,LfirstM1_2_1,LlastM1_2_1:LSSTREE_prelnode;
iM1_2_1:INTEGER;
nomoretreesM1_2_1,lastmatchM1_2_1:BOOLEAN;
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
 m1:LSSTREE_pstree;
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
                                                      PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
LlastM1_1_2_1:=L;WHILE LlastM1_1_2_1^.brother<>NIL DO
LlastM1_1_2_1:=LlastM1_1_2_1^.brother;
match_MU4(L,LlastM1_1_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
            LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM1_1_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_HEAD(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM1_1_1,LlastM1_1_1
,item2,LfirstM1_1_2,LlastM1_1_2
) ELSE match_HEAD(LfirstM1_1_2,LfirstM1_1_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,DETREL
,HEAD,match,matchnode,matchlist2items,lastmatchM1_1) END;
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
            IF s^.ls^.cat<>EN THEN
              match:=FALSE;
            IF match THEN
              ENREC1:=s^.ls^.ENfield^;
            IF match THEN match:=(s^.ls^.ENfield^.key=auxkey('MASSENKEY'));
          END{MatchNode};
                                                      BEGIN{MatchTree}
                        ENREC1tree:=Lfirst^.node;
              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchM1_2_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM1_2_1,LfirstM1_2_1,LrestM1_2_1,nomoretreesM1_2_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist1items,lastmatchM1_2) END;
                                                            PROCEDURE MatchList1Items
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
                                                      BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist0items,
LlastM1_3,LfirstM1_3,LrestM1_3,nomoretreesM1_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM1_2,LfirstM1_2,LrestM1_2,nomoretreesM1_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_DETREL,matchlist2items,
LlastM1_1,LfirstM1_1,LrestM1_1,nomoretreesM1_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,DETREL,HEAD,match,matchnode,matchlist3items,lastmatch) END;
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
    PROCEDURE createMU1(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU1}
    copylist(MU1,list);
    END{MU1};
                                                        BEGIN{createitem12}
  createMU1(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist2items10(wholelist,createitem11,createitem12);
  END{createlist1};
                                                      BEGIN{createM}
m:=MAKET_stree(NP);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION0;
BEGIN
;wbonus:=0;sbonus:=0

END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
CNRECDEF:LSDOMAINT_CNrecord;
BEGIN
MAKET_CNrec(CNRECDEF);
result:=TRUE
AND
(CNREC1.req=CNRECDEF.req)AND
(CNREC1.env=CNRECDEF.env)AND
(CNREC1.superdeixis=CNRECDEF.superdeixis)AND
(CNREC1.class=CNRECDEF.class)AND
(CNREC1.deixis=CNRECDEF.deixis)AND
(CNREC1.aspect=CNRECDEF.aspect)AND
(CNREC1.retro=CNRECDEF.retro)AND
(CNREC1.definite=CNRECDEF.definite)AND
(CNREC1.cases=CNRECDEF.cases)AND
(CNREC1.genders=CNRECDEF.genders)AND
(CNREC1.sexes=CNRECDEF.sexes)AND
(CNREC1.actsubcs=CNRECDEF.actsubcs)AND
(CNREC1.temporal=CNRECDEF.temporal)AND
(CNREC1.possgeni=CNRECDEF.possgeni)AND
(CNREC1.animate=CNRECDEF.animate)AND
(CNREC1.human=CNRECDEF.human)AND
(CNREC1.thetanp=CNRECDEF.thetanp)AND
(CNREC1.nounpatternefs=CNRECDEF.nounpatternefs)
;except1:=result
END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
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
THEN IF
          ((except1                                               )
                                                      )
THEN IF
          ((SINGULAR IN CNREC1.NUMBERS                            )
                                                      )
THEN IF
          ((MASS IN CNREC1.POSSCOMAS                              )
                                                      )
                                                       THEN
    BEGIN
    action0;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                      COMTNPCNDELETION2:=result
END;
{:TNPCNDELETION2}
{rule:}
{:FPOSTNPCNDELETION1}
 FUNCTION COMFPOSTNPCNDELETION1(Is:LISTREE_pStree):LISTREE_pstree;VAR result:LISTREE_pStree;
 m:LSSTREE_pstree;
 match:BOOLEAN;
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
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
T1:LSSTREE_pStree;
ENREC1tree:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
ENREC1:LSDOMAINT_ENrecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
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
    PROCEDURE Match_DETREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeVar(Lfirst,Llast,first,DETREL,T1,match,lastmatchM1_1);
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
            IF s^.ls^.cat<>EN THEN
              match:=FALSE;
            IF match THEN
              ENREC1:=s^.ls^.ENfield^;
            IF match THEN match:=(s^.ls^.ENfield^.key=auxkey('COUNTENKEY'));
          END{MatchNode};
                                                      BEGIN{MatchTree}
                        ENREC1tree:=Lfirst^.node;
              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchM1_2_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM1_2_1,LfirstM1_2_1,LrestM1_2_1,nomoretreesM1_2_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist1items,lastmatchM1_2) END;
                                                            PROCEDURE MatchList1Items
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
                                                      BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist0items,
LlastM1_3,LfirstM1_3,LrestM1_3,nomoretreesM1_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM1_2,LfirstM1_2,LrestM1_2,nomoretreesM1_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_DETREL,matchlist2items,
LlastM1_1,LfirstM1_1,LrestM1_1,nomoretreesM1_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,DETREL,HEAD,match,matchnode,matchlist3items,lastmatch) END;
                                                      BEGIN
result:=Is;
m:=loopholes.retype(Is,LSSTREE_pstree);
match:= TRUE;
MatchModel(m,TRUE,match);
 IF match THEN BEGIN
  IF ((COUNT IN NPREC1.ACTCOMAS                              )
                                                      )
THEN IF
          ((NPREC1.NPHEAD =ENNP                                   )
                                                      )
THEN IF
          ((NPREC1.DEFINITE<>INDEF                                )
                                                      )
THEN IF
          ((NPREC1.NUMBER =PLURAL                                 )
                                                      )
THEN IF
          ((COUNT IN CNREC1.POSSCOMAS                             )
                                                      )
                                                       THEN
    BEGIN
    result:=NIL;
    END;
                                                       END;
COMFPOSTNPCNDELETION1:=result
END;
{:FPOSTNPCNDELETION1}
{rule:}
{:FPOSTNPCNDELETION2}
 FUNCTION COMFPOSTNPCNDELETION2(Is:LISTREE_pStree):LISTREE_pstree;VAR result:LISTREE_pStree;
 m:LSSTREE_pstree;
 match:BOOLEAN;
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
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
T1:LSSTREE_pStree;
ENREC1tree:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
ENREC1:LSDOMAINT_ENrecord;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
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
    PROCEDURE Match_DETREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeVar(Lfirst,Llast,first,DETREL,T1,match,lastmatchM1_1);
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
            IF s^.ls^.cat<>EN THEN
              match:=FALSE;
            IF match THEN
              ENREC1:=s^.ls^.ENfield^;
            IF match THEN match:=(s^.ls^.ENfield^.key=auxkey('MASSENKEY'));
          END{MatchNode};
                                                      BEGIN{MatchTree}
                        ENREC1tree:=Lfirst^.node;
              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchM1_2_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM1_2_1,LfirstM1_2_1,LrestM1_2_1,nomoretreesM1_2_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist1items,lastmatchM1_2) END;
                                                            PROCEDURE MatchList1Items
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
                                                      BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist0items,
LlastM1_3,LfirstM1_3,LrestM1_3,nomoretreesM1_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM1_2,LfirstM1_2,LrestM1_2,nomoretreesM1_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_DETREL,matchlist2items,
LlastM1_1,LfirstM1_1,LrestM1_1,nomoretreesM1_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,DETREL,HEAD,match,matchnode,matchlist3items,lastmatch) END;
                                                      BEGIN
result:=Is;
m:=loopholes.retype(Is,LSSTREE_pstree);
match:= TRUE;
MatchModel(m,TRUE,match);
 IF match THEN BEGIN
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
    result:=NIL;
    END;
                                                       END;
COMFPOSTNPCNDELETION2:=result
END;
{:FPOSTNPCNDELETION2}
{rule:}
{:RNPAPPOSITION}
 FUNCTION COMRNPAPPOSITION(Is1:LISTREE_pStree;Is2:LISTREE_pStree
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
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
PUNCREC2tree:LSSTREE_pStree;
PUNCREC1tree:LSSTREE_pStree;
PUNCREC3tree:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
SIG1:LSMRUQUO_ListOfStrees;
PUNCREC2:LSDOMAINT_PUNCrecord;
NPREC2:LSDOMAINT_NPrecord;
NPREC1:LSDOMAINT_NPrecord;
NPREC3:LSDOMAINT_NPrecord;
PUNCREC1:LSDOMAINT_PUNCrecord;
NPREC4:LSDOMAINT_NPrecord;
PUNCREC3:LSDOMAINT_PUNCrecord;
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
                                                      PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
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
LlastM1_1:=L;WHILE LlastM1_1^.brother<>NIL DO
LlastM1_1:=LlastM1_1^.brother;
match_MU1(L,LlastM1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist1items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>NP THEN
      match:=FALSE;
    IF match THEN
      NPREC2:=s^.ls^.NPfield^;
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
LlastM2_1:=L;WHILE LlastM2_1^.brother<>NIL DO
LlastM2_1:=LlastM2_1^.brother;
match_MU2(L,LlastM2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist1items,lastmatch) END;
                                                      PROCEDURE createM;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := NP;
    N^.ls^.NPfield^ := NPREC3;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
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
                                                          BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,NP,createnode,createlist1);
    END{HEAD};
                                                        BEGIN{createitem11}
  createHEAD(list);
  END;
  PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
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
                                                        BEGIN{createitem12}
  createPUNCREL(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createAPPOSREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := NP;
        N^.ls^.NPfield^ := NPREC4;
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
                                                          BEGIN{APPOSREL}
LSMATCHES_createitem(list,APPOSREL,NP,createnode,createlist1);
    END{APPOSREL};
                                                        BEGIN{createitem13}
  createAPPOSREL(list);
  END;
  PROCEDURE createitem14(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createSIG1(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{SIG1}
    copylist(SIG1,list);
    END{SIG1};
                                                        BEGIN{createitem14}
  createSIG1(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist4items1110(wholelist,createitem11,createitem12,createitem13,createitem14);
  END{createlist1};
                                                      BEGIN{createM}
m:=MAKET_stree(NP);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                       FUNCTION subrule0X2 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
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
                                                      PROCEDURE ACTION20;
BEGIN
NPREC3:=NPREC1;                                       ;
NPREC4:=NPREC2;                                       ;
NPREC4.GENERIC:=OMEGAGENERIC
                                                      ;
NPREC4.CASES:=NPREC1.CASES
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                       BEGIN{02}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
  IF match THEN
    BEGIN
    IF ((NPREC1.NUMBER =NPREC2.NUMBER                          )
                                                      )
THEN IF
          ((NPREC1.SUPERDEIXIS =NPREC2.SUPERDEIXIS                )
                                                      )
THEN IF
          ((NPREC1.MOOD =DECLXPMOOD                               )
                                                      )
THEN IF
          ((NPREC1.MOOD =NPREC2.MOOD                              )
                                                      )
THEN IF
          ((NPREC1.NPHEAD IN [PERSPRONP,
OTHERNP,
ALLESNP]                                              )
                                                      )
THEN IF
          ((NPREC2.NPHEAD IN [PERSPRONP,
OTHERNP,
ALLESNP]                                              )
                                                      )
THEN IF
          ((NPREC2.GENERIC =NOGENERIC                             )
                                                      )
THEN IF
          ((NPREC2.CASES =[NOMINATIVE]                                          )
                                                      )
                                                       THEN
      BEGIN
      MAKET_NPrec(NPREC3);
      MAKET_PUNCrec(PUNCREC1);
      MAKET_NPrec(NPREC4);
      MAKET_PUNCrec(PUNCREC3);
      hulpstree:=LDBLEX_read(auxkey('KOMMAPUNCKEY'));
      PUNCREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
      PUNCREC1:=PUNCREC1tree^.ls^.PUNCfield^;
      action20;
      createSIG1;
      previous1;
      Is:=loopholes.retype(m,LISTREE_pstree);
      IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
      END;
                                                          END;
                                                       subrule0X2:=result
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
 END;
    END;
COMRNPAPPOSITION:=result
END;
{:RNPAPPOSITION}
