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
pragma C_include('decommrules16.pf');
END;
PROGRAM decomMrules16;
WITH globsubst,listree,limatches,lsmatches,
lidomaint,liiddict,lsdomaint,maket,lsstree,
copyt,mem,
aidderiv,hyperdtree,strtokey,lsmruquo,
lsauxdom,ldblex;
TYPE synrelset=SET OF LSDOMAINT_synrel;
VAR hulpstree:LISTREE_pstree;
 VPID:LSDOMAINT_synpatternsettype;
hulplsstree:LSSTREE_pstree;
 PROCEDURE decommrules16_init;
BEGIN
END;
{rule:}
{:ROBJNPSUBST}
 FUNCTION DECROBJNPSUBST(VAR LEVEL,subst:INTEGER;
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
LinitM_2_2_1,LrestM_2_2_1,LfirstM_2_2_1,LlastM_2_2_1:LSSTREE_prelnode;
iM_2_2_1:INTEGER;
nomoretreesM_2_2_1,lastmatchM_2_2_1:BOOLEAN;
LinitM_2_3,LrestM_2_3,LfirstM_2_3,LlastM_2_3:LSSTREE_prelnode;
iM_2_3:INTEGER;
nomoretreesM_2_3,lastmatchM_2_3:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
REL1:LSDOMAINT_synrel;
T3:LSSTREE_pStree;
T4:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
MU10:LSMRUQUO_ListOfStrees;
MU11:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
NPVARREC1:LSDOMAINT_NPVARrecord;
NPREC1:LSDOMAINT_NPrecord;
NPREC2:LSDOMAINT_NPrecord;
FUNCTION matchcondI7:BOOLEAN;
                                                      BEGIN
matchcondI7:=FALSE;
  IF
          ((REL1 IN [OBJREL,
INDOBJREL,
PREDREL]                                              )
                                                      )
THEN IF
          ((NOT(LSMRUQUO_NEGPHRASE(T4
))                                                    )
                                                      )
                                                      THEN 
matchcondI7:=TRUE;

END;{matchcondI7}
FUNCTION matchcondI6:BOOLEAN;
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
      IF s^.ls^.cat<>BIGPRO THEN
        match:=FALSE;
      IF match THEN
        ;
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
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU11(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
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
matchcondI6:=FALSE;
  IF
          ((NOT Exist1(MU6)                                       )
                                                      )
                                                      THEN 
matchcondI6:=TRUE;

END;{matchcondI6}
FUNCTION matchcondI5:BOOLEAN;
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
      IF s^.ls^.cat<>BIGPRO THEN
        match:=FALSE;
      IF match THEN
        ;
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
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU10(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
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
matchcondI5:=FALSE;
  IF
          ((NOT Exist1(MU5)                                       )
                                                      )
                                                      THEN 
matchcondI5:=TRUE;

END;{matchcondI5}
FUNCTION matchcondI4:BOOLEAN;
                                                      BEGIN
matchcondI4:=FALSE;
  IF
          (( NOT(NPREC2.NPHEAD IN [REFLNP,
RECIPRONP,
SENTNP,
OPENINGNP]                                            )                                                     )
                                                      )
                                                      THEN 
matchcondI4:=TRUE;

END;{matchcondI4}
FUNCTION matchcondI3:BOOLEAN;
                                                      BEGIN
matchcondI3:=FALSE;
  IF
          (( NOT(NPREC1.NPHEAD IN [REFLNP,
RECIPRONP,
SENTNP,
OPENINGNP]                                            )                                                     )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
          ((REL1 IN [OBJREL,
INDOBJREL,
PREDREL]                                              )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
          ((NPVARREC1.INDEX =level                                )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

END;{matchcondI1}
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((LSMRUQUO_SUBSTORDERCONDITION2(MU3
,MU4
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
          ((LSMRUQUO_GSUBSTORDERCONDITION2(MU3
,MU4
,T3
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
THEN IF
          ((NOT(LSMRUQUO_NEGPHRASE(T3
))                                                    )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CLAUSE;
    N^.ls^.CLAUSEfield^ := CLAUSEREC1;
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
        PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU2}
        copylist(MU2,list);
        END{MU2};
                                                            BEGIN{createitem11}
      createMU2(list);
      END;
      PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createREL1(VAR list:LSMRUQUO_ListOfStrees);
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
                                                              BEGIN{REL1}
LSMATCHES_createitem(list,REL1,NPVAR,createnode,createlist1);
        END{REL1};
                                                            BEGIN{createitem12}
      createREL1(list);
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
                                                          BEGIN{PREDREL}
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
    END{PREDREL};
                                                        BEGIN{createitem12}
  createPREDREL(list);
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
m1:=MAKET_stree(CLAUSE);
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
    N^.ls^.NPfield^ := NPREC1;
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
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>CLAUSE THEN
      match:=FALSE;
    IF match THEN
      CLAUSEREC1:=s^.ls^.CLAUSEfield^;
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
        PROCEDURE Match_REL1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR matchcond:BOOLEAN;
          Stree:LSSTREE_pStree;
          lisons:LISTREE_pRelnode;
          PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
          BEGIN{MatchNode}
            IF s^.ls^.cat<>NP THEN
              match:=FALSE;
            IF match THEN
              NPREC2:=s^.ls^.NPfield^;
            IF match THEN
              match:= matchcondI4;
T4:=s;
          END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            PROCEDURE Match_MU6(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            BEGIN{match}
              IF first THEN BEGIN
                MU6.first:=Lfirst;
                MU6.last:=Llast;
                match:= matchcondI6;
              END
              ELSE match:=FALSE
            END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU6(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU6(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM_2_2_1:=L;WHILE LlastM_2_2_1^.brother<>NIL DO
LlastM_2_2_1:=LlastM_2_2_1^.brother;
match_MU6(L,LlastM_2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
                    IF first THEN REL1:= Lfirst^.relation;match:=TRUE;
LSMATCHES_matchtreeConVar0rels(Lfirst^.node,first
,match,matchnode,matchlist1items,lastmatchM_2_2,matchcondI7) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_REL1(Lfirst,Llast,TRUE,match);
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
) ELSE BEGIN match_REL1(LfirstM_2_2,LfirstM_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM_2_1,LlastM_2_1
,item2,LfirstM_2_2,LlastM_2_2
,item3,LfirstM_2_3,LlastM_2_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist3items,lastmatchM_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_PREDREL(Lfirst,Llast,TRUE,match);
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
,PREDREL,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
) ELSE match_PREDREL(LfirstM_2,LfirstM_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,PREDREL,match,matchnode,matchlist3items,lastmatch) END;
                                                      PROCEDURE ACTION10;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC2,MU6,NPREC1,MU5,[])         ;
NPREC1.SUPERDEIXIS:=CLAUSEREC1.SUPERDEIXIS
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION14;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC2,MU6,NPREC1,MU5,[])         ;
NPREC1.SUPERDEIXIS:=CLAUSEREC1.DEIXIS
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION19;
BEGIN
NPVARREC1:=COPYT_NPTOVAR(NPREC2);                     ;
NPVARREC1.INDEX:=level;
NPVARREC1.GENERIC:=NOGENERIC;
                                                      ;
NPREC1.GENERIC:=NOGENERIC
                                                      
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
 level:=LIMATCHES_newlevel;
 subst:=2;
 END;
IF match THEN
  BEGIN
IF ((NPREC2.GENERIC =OMEGAGENERIC                          )
                                                      )
THEN IF
          ((NPREC2.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
                                                       THEN
  BEGIN
  IF ((CLAUSEREC1.DEIXIS =OMEGADEIXIS                        )
                                                      )
                                                       THEN
    BEGIN
    MAKET_NPVARrec(NPVARREC1);
    MAKET_NPrec(NPREC1);
    action10;
    action19;
    createM1;
    createM2;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(m2,LISTREE_pstree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
    END;
  IF ((CLAUSEREC1.DEIXIS<>OMEGADEIXIS                        )
                                                      )
                                                       THEN
    BEGIN
    MAKET_NPVARrec(NPVARREC1);
    MAKET_NPrec(NPREC1);
    action14;
    action19;
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
                                                      END;{WHILE}
DECROBJNPSUBST:=result
END;
{:ROBJNPSUBST}
{rule:}
{:RSUBJNPSUBST}
 FUNCTION DECRSUBJNPSUBST(VAR LEVEL,subst:INTEGER;
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
LinitM_5,LrestM_5,LfirstM_5,LlastM_5:LSSTREE_prelnode;
iM_5:INTEGER;
nomoretreesM_5,lastmatchM_5:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
T3:LSSTREE_pStree;
BVERBREC1tree:LSSTREE_pStree;
T4:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
MU8:LSMRUQUO_ListOfStrees;
MU10:LSMRUQUO_ListOfStrees;
MU11:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
NPVARREC1:LSDOMAINT_NPVARrecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
NPREC1:LSDOMAINT_NPrecord;
VERBREC1:LSDOMAINT_VERBrecord;
SUBVERBREC1:LSDOMAINT_SUBVERBrecord;
BVERBREC1:LSDOMAINT_BVERBrecord;
NPREC2:LSDOMAINT_NPrecord;
FUNCTION matchcondI9:BOOLEAN;
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
    lirel1:LIDOMAINT_synrel;
    lsrel1:LSDOMAINT_synrel;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>SUBVERB THEN
        match:=FALSE;
      IF match THEN
        SUBVERBREC1:=s^.ls^.SUBVERBfield^;
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
          IF s^.ls^.cat<>BVERB THEN
            match:=FALSE;
          IF match THEN
            BVERBREC1:=s^.ls^.BVERBfield^;
          IF match THEN match:=(s^.ls^.BVERBfield^.key=auxkey('WILLBVERBKEY'));
        END{MatchNode};
                                                      BEGIN{MatchTree}
                    BVERBREC1tree:=Lfirst^.node;
            IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatch_1_1) END;
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
matchcondI9:=FALSE;
  IF
          ((VERBREC1.SUBC =MODALVERB                              )
                                                      )
THEN IF
          ((NOT Exist1(MU8)                                       )
                                                      )
                                                      THEN 
matchcondI9:=TRUE;

END;{matchcondI9}
FUNCTION matchcondI8:BOOLEAN;
                                                      BEGIN
matchcondI8:=FALSE;
  IF
          ((VERBREC1.SUBC =MODALVERB                              )
                                                      )
                                                      THEN 
matchcondI8:=TRUE;

END;{matchcondI8}
FUNCTION matchcondI7:BOOLEAN;
                                                      BEGIN
matchcondI7:=FALSE;
  IF
          ((NOT(LSMRUQUO_NEGPHRASE(T4
))                                                    )
                                                      )
                                                      THEN 
matchcondI7:=TRUE;

END;{matchcondI7}
FUNCTION matchcondI6:BOOLEAN;
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
      IF s^.ls^.cat<>BIGPRO THEN
        match:=FALSE;
      IF match THEN
        ;
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
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU11(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
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
matchcondI6:=FALSE;
  IF
          ((NOT Exist1(MU6)                                       )
                                                      )
                                                      THEN 
matchcondI6:=TRUE;

END;{matchcondI6}
FUNCTION matchcondI5:BOOLEAN;
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
      IF s^.ls^.cat<>BIGPRO THEN
        match:=FALSE;
      IF match THEN
        ;
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
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU10(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
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
matchcondI5:=FALSE;
  IF
          ((NOT Exist1(MU5)                                       )
                                                      )
                                                      THEN 
matchcondI5:=TRUE;

END;{matchcondI5}
FUNCTION matchcondI4:BOOLEAN;
                                                      BEGIN
matchcondI4:=FALSE;
  IF
          (( NOT(NPREC2.NPHEAD IN [REFLNP,
RECIPRONP,
SENTNP,
OPENINGNP]                                            )                                                     )
                                                      )
                                                      THEN 
matchcondI4:=TRUE;

END;{matchcondI4}
FUNCTION matchcondI3:BOOLEAN;
                                                      BEGIN
matchcondI3:=FALSE;
  IF
          (( NOT(NPREC1.NPHEAD IN [REFLNP,
RECIPRONP,
SENTNP,
OPENINGNP]                                            )                                                     )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
          ((NPVARREC1.INDEX =level                                )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

END;{matchcondI1}
FUNCTION matchcondM:BOOLEAN;
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
  PROCEDURE Match_AUXREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
        match:= matchcondI8;
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
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU8(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
      LSMATCHES_matchtree0rels(Lfirst,Llast,first,AUXREL
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
      Match_AUXREL(Lfirst_1,Llast_1,TRUE,itemmatch);
      match:=itemmatch;
END
    END
  ELSE
  BEGIN
IF Llast_1=Lfinal THEN Lrest_1:=NIL;
    Match_AUXREL(Lfirst_1,Llast_1,FALSE,match);
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
                                                      FUNCTION imply1:BOOLEAN;
BEGIN
IF ((NOT Exist2(MU2)                                       )
                                                      )
                                                      
THEN imply1:=
((((COPYT_id79([CLAUSEREC1.THETAVP])                       *[VP010,
VP012]                                                 =[]                                                    )
OR
          (CLAUSEREC1.SYNVPEFS *LSAUXDOM_RAISINGVPS                                    =
[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       ELSE imply1:=TRUE;
END;
                                                      FUNCTION EXIST4(mu:LSMRUQUO_ListOfStrees):Boolean;
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
  PROCEDURE Match_AUXREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
        match:= matchcondI8;
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
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU8(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
      LSMATCHES_matchtree0rels(Lfirst,Llast,first,AUXREL
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
      Match_AUXREL(Lfirst_1,Llast_1,TRUE,itemmatch);
      match:=itemmatch;
END
    END
  ELSE
  BEGIN
IF Llast_1=Lfinal THEN Lrest_1:=NIL;
    Match_AUXREL(Lfirst_1,Llast_1,FALSE,match);
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
                                                      FUNCTION imply3:BOOLEAN;
BEGIN
IF ((Exist4(MU2)                                           )
                                                      )
                                                      
THEN imply3:=
((((COPYT_id79([VERBREC1.THETAVP])                         *[VP010,
VP012]                                                 =[]                                                    )
OR
          (VERBREC1.SYNVPS *LSAUXDOM_RAISINGVPS                                    =
[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       ELSE imply3:=TRUE;
END;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((LSMRUQUO_SUBSTORDERCONDITION(MU2
,MU3
,MU4
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
THEN IF
          ((CLAUSEREC1.PROSUBJECT =FALSE                          )
                                                      )
THEN IF
          ((((imply1                                                )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((imply3                                                )
                                                      )
                                                      )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
          ((LSMRUQUO_GSUBSTORDERCONDITION(MU2
,MU3
,MU4
,T3
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
THEN IF
          ((NOT(LSMRUQUO_NEGPHRASE(T3
))                                                    )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
FUNCTION matchcondM1:BOOLEAN;
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
  PROCEDURE Match_AUXREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
        match:= matchcondI8;
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
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU8(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
      LSMATCHES_matchtree0rels(Lfirst,Llast,first,AUXREL
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
      Match_AUXREL(Lfirst_1,Llast_1,TRUE,itemmatch);
      match:=itemmatch;
END
    END
  ELSE
  BEGIN
IF Llast_1=Lfinal THEN Lrest_1:=NIL;
    Match_AUXREL(Lfirst_1,Llast_1,FALSE,match);
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
                                                      FUNCTION imply1:BOOLEAN;
BEGIN
IF ((NOT Exist2(MU2)                                       )
                                                      )
                                                      
THEN imply1:=
((((COPYT_id79([CLAUSEREC1.THETAVP])                       *[VP010,
VP012]                                                 =[]                                                    )
OR
          (CLAUSEREC1.SYNVPEFS *LSAUXDOM_RAISINGVPS                                    =
[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       ELSE imply1:=TRUE;
END;
                                                      FUNCTION EXIST4(mu:LSMRUQUO_ListOfStrees):Boolean;
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
  PROCEDURE Match_AUXREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU8(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
      LSMATCHES_matchtreeCon0rels(Lfirst,Llast,first,AUXREL
,match,matchnode,matchlist1items,lastmatch_1,matchcondI9) END;
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
      Match_AUXREL(Lfirst_1,Llast_1,TRUE,itemmatch);
      match:=itemmatch;
END
    END
  ELSE
  BEGIN
IF Llast_1=Lfinal THEN Lrest_1:=NIL;
    Match_AUXREL(Lfirst_1,Llast_1,FALSE,match);
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
                                                      FUNCTION imply3:BOOLEAN;
BEGIN
IF ((Exist4(MU2)                                           )
                                                      )
                                                      
THEN imply3:=
((((COPYT_id79([VERBREC1.THETAVP])                         *[VP010,
VP012]                                                 =[]                                                    )
OR
          (VERBREC1.SYNVPS *LSAUXDOM_RAISINGVPS                                    =
[]                                                    )
                                                      )
                                                      )
                                                      )
                                                       ELSE imply3:=TRUE;
END;
                                                      BEGIN
matchcondM1:=FALSE;
  IF
          ((CLAUSEREC1.PROSUBJECT =FALSE                          )
                                                      )
THEN IF
          ((((imply1                                                )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((imply3                                                )
                                                      )
                                                      )
                                                      )
                                                      THEN 
matchcondM1:=TRUE;

END;{matchcondM1}
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CLAUSE;
    N^.ls^.CLAUSEfield^ := CLAUSEREC1;
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
    PROCEDURE createSUBJREL(VAR list:LSMRUQUO_ListOfStrees);
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
                                                          BEGIN{SUBJREL}
LSMATCHES_createitem(list,SUBJREL,NPVAR,createnode,createlist1);
    END{SUBJREL};
                                                        BEGIN{createitem12}
  createSUBJREL(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU2}
    copylist(MU2,list);
    END{MU2};
                                                        BEGIN{createitem13}
  createMU2(list);
  END;
  PROCEDURE createitem14(VAR list:LSMRUQUO_ListOfStrees);
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
                                                          BEGIN{PREDREL}
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
    END{PREDREL};
                                                        BEGIN{createitem14}
  createPREDREL(list);
  END;
  PROCEDURE createitem15(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU4(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU4}
    copylist(MU4,list);
    END{MU4};
                                                        BEGIN{createitem15}
  createMU4(list);
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
                                                      BEGIN{createM}
m1:=MAKET_stree(CLAUSE);
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
    N^.ls^.NPfield^ := NPREC1;
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
    IF s^.ls^.cat<>CLAUSE THEN
      match:=FALSE;
    IF match THEN
      CLAUSEREC1:=s^.ls^.CLAUSEfield^;
  END{MatchNode};
                                                      PROCEDURE MatchList5Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
    PROCEDURE Match_SUBJREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>NP THEN
          match:=FALSE;
        IF match THEN
          NPREC2:=s^.ls^.NPfield^;
        IF match THEN
          match:= matchcondI4;
T4:=s;
      END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        PROCEDURE Match_MU6(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU6.first:=Lfirst;
            MU6.last:=Llast;
            match:= matchcondI6;
          END
          ELSE match:=FALSE
        END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU6(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU6(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM_2_1:=L;WHILE LlastM_2_1^.brother<>NIL DO
LlastM_2_1:=LlastM_2_1^.brother;
match_MU6(L,LlastM_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeCon0rels(Lfirst,Llast,first,SUBJREL
,match,matchnode,matchlist1items,lastmatchM_2,matchcondI7) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_SUBJREL(Lfirst,Llast,TRUE,match);
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
LlastM_4_1:=L;WHILE LlastM_4_1^.brother<>NIL DO
LlastM_4_1:=LlastM_4_1^.brother;
match_MU3(L,LlastM_4_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM_4) END;
                                                      PROCEDURE item4(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_PREDREL(Lfirst,Llast,TRUE,match);
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
                                                      PROCEDURE item5(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU4(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MUMUMfirst(L,match,item1,LfirstM_1,LlastM_1
,SUBJREL,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
,PREDREL,item4,LfirstM_4,LlastM_4
,item5,LfirstM_5,LlastM_5
) ELSE BEGIN match_SUBJREL(LfirstM_2,LfirstM_2,FALSE,match);
IF NOT match THEN match_PREDREL(LfirstM_4,LfirstM_4,FALSE,match) END END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,SUBJREL,PREDREL,match,matchnode,matchlist5items,lastmatch) END;
                                                      PROCEDURE ACTION20;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC2,MU6,NPREC1,MU5,[])         ;
NPVARREC1:=COPYT_NPTOVAR(NPREC2);                     ;
NPVARREC1.INDEX:=level;
NPVARREC1.GENERIC:=NOGENERIC;
                                                      ;
NPREC1.GENERIC:=NOGENERIC
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION28;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC2,MU6,NPREC1,MU5,[])         ;
NPVARREC1:=COPYT_NPTOVAR(NPREC2);                     ;
NPVARREC1.INDEX:=level;
NPVARREC1.GENERIC:=YESGENERIC;
                                                      ;
NPREC1.GENERIC:=YESGENERIC
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION29;
BEGIN
NPREC1.SUPERDEIXIS:=CLAUSEREC1.SUPERDEIXIS
                                                      
END;
                                                      PROCEDURE ACTION37;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC2,MU6,NPREC1,MU5,[])         ;
NPVARREC1:=COPYT_NPTOVAR(NPREC2);                     ;
NPVARREC1.INDEX:=level;
NPVARREC1.GENERIC:=NOGENERIC;
                                                      ;
NPREC1.GENERIC:=NOGENERIC
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION45;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC2,MU6,NPREC1,MU5,[])         ;
NPVARREC1:=COPYT_NPTOVAR(NPREC2);                     ;
NPVARREC1.INDEX:=level;
NPVARREC1.GENERIC:=YESGENERIC;
                                                      ;
NPREC1.GENERIC:=YESGENERIC
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION46;
BEGIN
NPREC1.SUPERDEIXIS:=CLAUSEREC1.DEIXIS
                                                      
END;
                                                      PROCEDURE ACTION47;
BEGIN

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
 level:=LIMATCHES_newlevel;
 subst:=2;
 END;
IF match THEN
  BEGIN
IF ((NPREC2.GENERIC =OMEGAGENERIC                          )
                                                      )
THEN IF
          ((NPREC2.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
                                                       THEN
  BEGIN
  IF ((CLAUSEREC1.DEIXIS =OMEGADEIXIS                        )
                                                      )
                                                       THEN
    BEGIN
    IF ((COPYT_id58([NPREC2.NPHEAD])                            *[THEYNP,
ONENP]                                                 =[]                                                    )
                                                      )
                                                       THEN
      BEGIN
      MAKET_NPVARrec(NPVARREC1);
      MAKET_NPrec(NPREC1);
      action20;
      action29;
      action47;
      createM1;
      createM2;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((COPYT_id58([NPREC2.NPHEAD])                            *[THEYNP,
ONENP]                                                <>[]                                                    )
                                                      )
                                                       THEN
      BEGIN
      MAKET_NPVARrec(NPVARREC1);
      MAKET_NPrec(NPREC1);
      action28;
      action29;
      action47;
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
  IF ((CLAUSEREC1.DEIXIS<>OMEGADEIXIS                        )
                                                      )
                                                       THEN
    BEGIN
    IF ((COPYT_id58([NPREC2.NPHEAD])                            *[THEYNP,
ONENP]                                                 =[]                                                    )
                                                      )
                                                       THEN
      BEGIN
      MAKET_NPVARrec(NPVARREC1);
      MAKET_NPrec(NPREC1);
      action37;
      action46;
      action47;
      createM1;
      createM2;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((COPYT_id58([NPREC2.NPHEAD])                            *[THEYNP,
ONENP]                                                <>[]                                                    )
                                                      )
                                                       THEN
      BEGIN
      MAKET_NPVARrec(NPVARREC1);
      MAKET_NPrec(NPREC1);
      action45;
      action46;
      action47;
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
                                                        END;
                                                      END;{WHILE}
DECRSUBJNPSUBST:=result
END;
{:RSUBJNPSUBST}
{rule:}
{:RSHIFTNPSUBST}
 FUNCTION DECRSHIFTNPSUBST(VAR LEVEL,subst:INTEGER;
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
LinitM_5,LrestM_5,LfirstM_5,LlastM_5:LSSTREE_prelnode;
iM_5:INTEGER;
nomoretreesM_5,lastmatchM_5:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
T3:LSSTREE_pStree;
T4:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
MU10:LSMRUQUO_ListOfStrees;
MU11:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
NPVARREC1:LSDOMAINT_NPVARrecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
NPREC1:LSDOMAINT_NPrecord;
NPREC2:LSDOMAINT_NPrecord;
FUNCTION matchcondI7:BOOLEAN;
                                                      BEGIN
matchcondI7:=FALSE;
  IF
          ((NOT(LSMRUQUO_NEGPHRASE(T4
))                                                    )
                                                      )
                                                      THEN 
matchcondI7:=TRUE;

END;{matchcondI7}
FUNCTION matchcondI6:BOOLEAN;
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
      IF s^.ls^.cat<>BIGPRO THEN
        match:=FALSE;
      IF match THEN
        ;
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
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU11(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
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
matchcondI6:=FALSE;
  IF
          ((NOT Exist1(MU6)                                       )
                                                      )
                                                      THEN 
matchcondI6:=TRUE;

END;{matchcondI6}
FUNCTION matchcondI5:BOOLEAN;
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
      IF s^.ls^.cat<>BIGPRO THEN
        match:=FALSE;
      IF match THEN
        ;
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
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU10(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
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
matchcondI5:=FALSE;
  IF
          ((NOT Exist1(MU5)                                       )
                                                      )
                                                      THEN 
matchcondI5:=TRUE;

END;{matchcondI5}
FUNCTION matchcondI4:BOOLEAN;
                                                      BEGIN
matchcondI4:=FALSE;
  IF
          (( NOT(NPREC2.NPHEAD IN [REFLNP,
RECIPRONP,
SENTNP,
OPENINGNP]                                            )                                                     )
                                                      )
                                                      THEN 
matchcondI4:=TRUE;

END;{matchcondI4}
FUNCTION matchcondI3:BOOLEAN;
                                                      BEGIN
matchcondI3:=FALSE;
  IF
          (( NOT(NPREC1.NPHEAD IN [REFLNP,
RECIPRONP,
SENTNP,
OPENINGNP]                                            )                                                     )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
          ((NPVARREC1.INDEX =level                                )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

END;{matchcondI1}
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((LSMRUQUO_SUBSTORDERCONDITION(MU2
,MU3
,MU4
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
          ((NOT(LSMRUQUO_NEGPHRASE(T3
))                                                    )
                                                      )
THEN IF
          ((LSMRUQUO_GSUBSTORDERCONDITION(MU2
,MU3
,MU4
,T3
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
FUNCTION matchcondM1:BOOLEAN;
BEGIN
  matchcondM1:= TRUE
END;{matchcondM1}
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CLAUSE;
    N^.ls^.CLAUSEfield^ := CLAUSEREC1;
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
    PROCEDURE createSHIFTREL(VAR list:LSMRUQUO_ListOfStrees);
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
                                                          BEGIN{SHIFTREL}
LSMATCHES_createitem(list,SHIFTREL,NPVAR,createnode,createlist1);
    END{SHIFTREL};
                                                        BEGIN{createitem12}
  createSHIFTREL(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU2}
    copylist(MU2,list);
    END{MU2};
                                                        BEGIN{createitem13}
  createMU2(list);
  END;
  PROCEDURE createitem14(VAR list:LSMRUQUO_ListOfStrees);
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
                                                          BEGIN{PREDREL}
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
    END{PREDREL};
                                                        BEGIN{createitem14}
  createPREDREL(list);
  END;
  PROCEDURE createitem15(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU4(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU4}
    copylist(MU4,list);
    END{MU4};
                                                        BEGIN{createitem15}
  createMU4(list);
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
                                                      BEGIN{createM}
m1:=MAKET_stree(CLAUSE);
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
    N^.ls^.NPfield^ := NPREC1;
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
    IF s^.ls^.cat<>CLAUSE THEN
      match:=FALSE;
    IF match THEN
      CLAUSEREC1:=s^.ls^.CLAUSEfield^;
  END{MatchNode};
                                                        PROCEDURE MatchList5Items
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
                                                          PROCEDURE MatchList4Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
    PROCEDURE Match_SHIFTREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>NP THEN
          match:=FALSE;
        IF match THEN
          NPREC2:=s^.ls^.NPfield^;
        IF match THEN
          match:= matchcondI4;
T4:=s;
      END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        PROCEDURE Match_MU6(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU6.first:=Lfirst;
            MU6.last:=Llast;
            match:= matchcondI6;
          END
          ELSE match:=FALSE
        END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU6(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU6(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM_2_1:=L;WHILE LlastM_2_1^.brother<>NIL DO
LlastM_2_1:=LlastM_2_1^.brother;
match_MU6(L,LlastM_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeCon0rels(Lfirst,Llast,first,SHIFTREL
,match,matchnode,matchlist1items,lastmatchM_2,matchcondI7) END;
                                                            PROCEDURE MatchList3Items
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
                                                              PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
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
LlastM_4_1:=L;WHILE LlastM_4_1^.brother<>NIL DO
LlastM_4_1:=LlastM_4_1^.brother;
match_MU3(L,LlastM_4_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM_4) END;
                                                                PROCEDURE MatchList1Items
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
                                                      BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU4,matchlist0items,
LlastM_5,LfirstM_5,LrestM_5,nomoretreesM_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist1items,
LlastM_4,LfirstM_4,LrestM_4,nomoretreesM_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU2,matchlist2items,
LlastM_3,LfirstM_3,LrestM_3,nomoretreesM_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_SHIFTREL,matchlist3items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist4items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,SHIFTREL,PREDREL,match,matchnode,matchlist5items,lastmatch) END;
                                                      PROCEDURE ACTION12;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC2,MU6,NPREC1,MU5,[])         ;
NPVARREC1:=COPYT_NPTOVAR(NPREC2);                     ;
NPVARREC1.MOOD:=TOPICMOOD
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION17;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC2,MU6,NPREC1,MU5,[])         ;
NPVARREC1:=COPYT_NPTOVAR(NPREC2);                     ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION23;
BEGIN
LSMRUQUO_ASSDEIXISMAX(CLAUSEREC1.
DEIXIS,CLAUSEREC1.
SUPERDEIXIS,NPREC1.
SUPERDEIXIS)                                          ;
NPVARREC1.INDEX:=level;
NPVARREC1.GENERIC:=NOGENERIC;
                                                      ;
NPREC1.GENERIC:=NOGENERIC
                                                      
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
 level:=LIMATCHES_newlevel;
 subst:=2;
 END;
IF match THEN
  BEGIN
IF ((NPREC2.GENERIC =OMEGAGENERIC                          )
                                                      )
THEN IF
          ((NPREC2.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
THEN IF
          ((NPREC2.CLASS<>FREQUENTIAL                             )
                                                      )
                                                       THEN
  BEGIN
  IF ((NPREC2.MOOD =NOWH                                     )
                                                      )
                                                       THEN
    BEGIN
    MAKET_NPVARrec(NPVARREC1);
    MAKET_NPrec(NPREC1);
    action12;
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
  IF ((NPREC2.MOOD =WH                                       )
                                                      )
                                                       THEN
    BEGIN
    MAKET_NPVARrec(NPVARREC1);
    MAKET_NPrec(NPREC1);
    action17;
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
                                                      END;{WHILE}
DECRSHIFTNPSUBST:=result
END;
{:RSHIFTNPSUBST}
{rule:}
{:RPREPNPSUBST}
 FUNCTION DECRPREPNPSUBST(VAR LEVEL,subst:INTEGER;
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
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
REL2:LSDOMAINT_synrel;
REL1:LSDOMAINT_synrel;
T3:LSSTREE_pStree;
T4:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
MU7:LSMRUQUO_ListOfStrees;
MU10:LSMRUQUO_ListOfStrees;
MU11:LSMRUQUO_ListOfStrees;
MU8:LSMRUQUO_ListOfStrees;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
PREPPREC1:LSDOMAINT_PREPPrecord;
NPVARREC1:LSDOMAINT_NPVARrecord;
NPREC1:LSDOMAINT_NPrecord;
PREPPREC2:LSDOMAINT_PREPPrecord;
NPREC2:LSDOMAINT_NPrecord;
FUNCTION matchcondI8:BOOLEAN;
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
      IF s^.ls^.cat<>BIGPRO THEN
        match:=FALSE;
      IF match THEN
        ;
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
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU11(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
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
matchcondI8:=FALSE;
  IF
          ((NOT Exist1(MU8)                                       )
                                                      )
                                                      THEN 
matchcondI8:=TRUE;

END;{matchcondI8}
FUNCTION matchcondI7:BOOLEAN;
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
      IF s^.ls^.cat<>BIGPRO THEN
        match:=FALSE;
      IF match THEN
        ;
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
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU10(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
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
matchcondI7:=FALSE;
  IF
          ((NOT Exist1(MU7)                                       )
                                                      )
                                                      THEN 
matchcondI7:=TRUE;

END;{matchcondI7}
FUNCTION matchcondI5:BOOLEAN;
                                                      BEGIN
matchcondI5:=FALSE;
  IF
          ((NOT(LSMRUQUO_NEGPHRASE(T4
))                                                    )
                                                      )
                                                      THEN 
matchcondI5:=TRUE;

END;{matchcondI5}
FUNCTION matchcondI4:BOOLEAN;
                                                      BEGIN
matchcondI4:=FALSE;
  IF
          (( NOT(NPREC2.NPHEAD IN [REFLNP,
RECIPRONP,
SENTNP,
OPENINGNP]                                            )                                                     )
                                                      )
                                                      THEN 
matchcondI4:=TRUE;

END;{matchcondI4}
FUNCTION matchcondI3:BOOLEAN;
                                                      BEGIN
matchcondI3:=FALSE;
  IF
          (( NOT(NPREC1.NPHEAD IN [REFLNP,
RECIPRONP,
SENTNP,
OPENINGNP]                                            )                                                     )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
          ((REL1 IN [LOCARGREL,
DIRARGREL,
COMPLREL,
VPADVREL]                                             )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
          ((NPVARREC1.INDEX =level                                )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

END;{matchcondI1}
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((LSMRUQUO_SUBSTORDERCONDITION2(MU5
,MU6
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
          ((LSMRUQUO_GSUBSTORDERCONDITION2(MU5
,MU6
,T3
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
THEN IF
          ((NOT(LSMRUQUO_NEGPHRASE(T3
))                                                    )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CLAUSE;
    N^.ls^.CLAUSEfield^ := CLAUSEREC1;
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
        PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU2}
        copylist(MU2,list);
        END{MU2};
                                                            BEGIN{createitem11}
      createMU2(list);
      END;
      PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createREL1(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := PREPP;
            N^.ls^.PREPPfield^ := PREPPREC1;
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
            PROCEDURE createREL2(VAR list:LSMRUQUO_ListOfStrees);
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
                                                                  BEGIN{REL2}
LSMATCHES_createitem(list,REL2,NPVAR,createnode,createlist1);
            END{REL2};
                                                                BEGIN{createitem22}
          createREL2(list);
          END;
          BEGIN{createlist1}
LSMATCHES_createlist2items01(wholelist,createitem21,createitem22);
          END{createlist1};
                                                              BEGIN{REL1}
LSMATCHES_createitem(list,REL1,PREPP,createnode,createlist1);
        END{REL1};
                                                            BEGIN{createitem12}
      createREL1(list);
      END;
      PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU5(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU5}
        copylist(MU5,list);
        END{MU5};
                                                            BEGIN{createitem13}
      createMU5(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
      END{createlist1};
                                                          BEGIN{PREDREL}
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
    END{PREDREL};
                                                        BEGIN{createitem12}
  createPREDREL(list);
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
                                                      BEGIN{createM}
m1:=MAKET_stree(CLAUSE);
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
    N^.ls^.NPfield^ := NPREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU7(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU7}
    copylist(MU7,list);
    END{MU7};
                                                        BEGIN{createitem11}
  createMU7(list);
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
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>CLAUSE THEN
      match:=FALSE;
    IF match THEN
      CLAUSEREC1:=s^.ls^.CLAUSEfield^;
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
        PROCEDURE Match_REL1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR matchcond:BOOLEAN;
          Stree:LSSTREE_pStree;
          lisons:LISTREE_pRelnode;
          PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
          BEGIN{MatchNode}
            IF s^.ls^.cat<>PREPP THEN
              match:=FALSE;
            IF match THEN
              PREPPREC2:=s^.ls^.PREPPfield^;
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
            PROCEDURE Match_REL2(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            VAR matchcond:BOOLEAN;
              Stree:LSSTREE_pStree;
              lisons:LISTREE_pRelnode;
              PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
              BEGIN{MatchNode}
                IF s^.ls^.cat<>NP THEN
                  match:=FALSE;
                IF match THEN
                  NPREC2:=s^.ls^.NPfield^;
                IF match THEN
                  match:= matchcondI4;
T4:=s;
              END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
                PROCEDURE Match_MU8(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
                BEGIN{match}
                  IF first THEN BEGIN
                    MU8.first:=Lfirst;
                    MU8.last:=Llast;
                    match:= matchcondI8;
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
                            IF first THEN REL2:= Lfirst^.relation;match:=TRUE;
LSMATCHES_matchtreeConVar0rels(Lfirst^.node,first
,match,matchnode,matchlist1items,lastmatchM_2_2_2,matchcondI5) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_REL2(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM_2_2_1,LlastM_2_2_1
,item2,LfirstM_2_2_2,LlastM_2_2_2
) ELSE match_REL2(LfirstM_2_2_2,LfirstM_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                    IF first THEN REL1:= Lfirst^.relation;match:=TRUE;
              IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtreeConVar0rels(Lfirst^.node,first
,match,matchnode,matchlist2items,lastmatchM_2_2,matchcondI2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_REL1(Lfirst,Llast,TRUE,match);
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
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM_2_1,LlastM_2_1
,item2,LfirstM_2_2,LlastM_2_2
,item3,LfirstM_2_3,LlastM_2_3
) ELSE BEGIN match_REL1(LfirstM_2_2,LfirstM_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM_2_1,LlastM_2_1
,item2,LfirstM_2_2,LlastM_2_2
,item3,LfirstM_2_3,LlastM_2_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist3items,lastmatchM_2) END;
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM_1,LlastM_1
,PREDREL,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
) ELSE match_PREDREL(LfirstM_2,LfirstM_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,PREDREL,match,matchnode,matchlist3items,lastmatch) END;
                                                      PROCEDURE ACTION12;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC2,MU8,NPREC1,MU7,[])         ;
NPREC1.SUPERDEIXIS:=CLAUSEREC1.SUPERDEIXIS
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION16;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC2,MU8,NPREC1,MU7,[])         ;
NPREC1.SUPERDEIXIS:=CLAUSEREC1.DEIXIS
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION23;
BEGIN
NPVARREC1:=COPYT_NPTOVAR(NPREC2);                     ;
NPVARREC1.INDEX:=level;
NPVARREC1.GENERIC:=NOGENERIC;
                                                      ;
NPREC1.GENERIC:=NOGENERIC
                                                      ;
PREPPREC1:=PREPPREC2;                                 
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
 level:=LIMATCHES_newlevel;
 subst:=2;
 END;
IF match THEN
  BEGIN
IF ((NPREC2.GENERIC =OMEGAGENERIC                          )
                                                      )
THEN IF
          ((NPREC2.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
                                                       THEN
  BEGIN
  IF ((CLAUSEREC1.DEIXIS =OMEGADEIXIS                        )
                                                      )
                                                       THEN
    BEGIN
    MAKET_PREPPrec(PREPPREC1);
    MAKET_NPVARrec(NPVARREC1);
    MAKET_NPrec(NPREC1);
    action12;
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
  IF ((CLAUSEREC1.DEIXIS<>OMEGADEIXIS                        )
                                                      )
                                                       THEN
    BEGIN
    MAKET_PREPPrec(PREPPREC1);
    MAKET_NPVARrec(NPVARREC1);
    MAKET_NPrec(NPREC1);
    action16;
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
                                                      DECRPREPNPSUBST:=result
END;
{:RPREPNPSUBST}
{rule:}
{:RVARPREPNPSUBST}
 FUNCTION DECRVARPREPNPSUBST(VAR LEVEL,subst:INTEGER;
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
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
REL2:LSDOMAINT_synrel;
REL1:LSDOMAINT_synrel;
T3:LSSTREE_pStree;
T4:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
MU7:LSMRUQUO_ListOfStrees;
MU10:LSMRUQUO_ListOfStrees;
MU11:LSMRUQUO_ListOfStrees;
MU8:LSMRUQUO_ListOfStrees;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
VARPREPPREC1:LSDOMAINT_PREPPrecord;
NPVARREC1:LSDOMAINT_NPVARrecord;
NPREC1:LSDOMAINT_NPrecord;
PREPPREC2:LSDOMAINT_PREPPrecord;
NPREC2:LSDOMAINT_NPrecord;
FUNCTION matchcondI8:BOOLEAN;
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
      IF s^.ls^.cat<>BIGPRO THEN
        match:=FALSE;
      IF match THEN
        ;
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
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU11(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
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
matchcondI8:=FALSE;
  IF
          ((NOT Exist1(MU8)                                       )
                                                      )
                                                      THEN 
matchcondI8:=TRUE;

END;{matchcondI8}
FUNCTION matchcondI7:BOOLEAN;
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
      IF s^.ls^.cat<>BIGPRO THEN
        match:=FALSE;
      IF match THEN
        ;
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
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU10(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
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
matchcondI7:=FALSE;
  IF
          ((NOT Exist1(MU7)                                       )
                                                      )
                                                      THEN 
matchcondI7:=TRUE;

END;{matchcondI7}
FUNCTION matchcondI5:BOOLEAN;
                                                      BEGIN
matchcondI5:=FALSE;
  IF
          ((NOT(LSMRUQUO_NEGPHRASE(T4
))                                                    )
                                                      )
                                                      THEN 
matchcondI5:=TRUE;

END;{matchcondI5}
FUNCTION matchcondI4:BOOLEAN;
                                                      BEGIN
matchcondI4:=FALSE;
  IF
          (( NOT(NPREC2.NPHEAD IN [REFLNP,
RECIPRONP,
SENTNP,
OPENINGNP]                                            )                                                     )
                                                      )
                                                      THEN 
matchcondI4:=TRUE;

END;{matchcondI4}
FUNCTION matchcondI3:BOOLEAN;
                                                      BEGIN
matchcondI3:=FALSE;
  IF
          (( NOT(NPREC1.NPHEAD IN [REFLNP,
RECIPRONP,
SENTNP,
OPENINGNP]                                            )                                                     )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
          ((REL1 IN [PREPOBJREL,
BYOBJREL,
VPADVREL]                                             )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
          ((NPVARREC1.INDEX =level                                )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

END;{matchcondI1}
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((LSMRUQUO_SUBSTORDERCONDITION2(MU5
,MU6
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
          ((LSMRUQUO_GSUBSTORDERCONDITION2(MU5
,MU6
,T3
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
THEN IF
          ((NOT(LSMRUQUO_NEGPHRASE(T3
))                                                    )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CLAUSE;
    N^.ls^.CLAUSEfield^ := CLAUSEREC1;
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
        PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU2}
        copylist(MU2,list);
        END{MU2};
                                                            BEGIN{createitem11}
      createMU2(list);
      END;
      PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createREL1(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := VARPREPP;
            N^.ls^.VARPREPPfield^ := VARPREPPREC1;
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
            PROCEDURE createREL2(VAR list:LSMRUQUO_ListOfStrees);
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
                                                                  BEGIN{REL2}
LSMATCHES_createitem(list,REL2,NPVAR,createnode,createlist1);
            END{REL2};
                                                                BEGIN{createitem22}
          createREL2(list);
          END;
          BEGIN{createlist1}
LSMATCHES_createlist2items01(wholelist,createitem21,createitem22);
          END{createlist1};
                                                              BEGIN{REL1}
LSMATCHES_createitem(list,REL1,VARPREPP,createnode,createlist1);
        END{REL1};
                                                            BEGIN{createitem12}
      createREL1(list);
      END;
      PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMU5(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU5}
        copylist(MU5,list);
        END{MU5};
                                                            BEGIN{createitem13}
      createMU5(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
      END{createlist1};
                                                          BEGIN{PREDREL}
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
    END{PREDREL};
                                                        BEGIN{createitem12}
  createPREDREL(list);
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
                                                      BEGIN{createM}
m1:=MAKET_stree(CLAUSE);
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
    N^.ls^.NPfield^ := NPREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU7(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU7}
    copylist(MU7,list);
    END{MU7};
                                                        BEGIN{createitem11}
  createMU7(list);
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
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>CLAUSE THEN
      match:=FALSE;
    IF match THEN
      CLAUSEREC1:=s^.ls^.CLAUSEfield^;
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
        PROCEDURE Match_REL1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR matchcond:BOOLEAN;
          Stree:LSSTREE_pStree;
          lisons:LISTREE_pRelnode;
          PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
          BEGIN{MatchNode}
            IF s^.ls^.cat<>PREPP THEN
              match:=FALSE;
            IF match THEN
              PREPPREC2:=s^.ls^.PREPPfield^;
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
            PROCEDURE Match_REL2(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            VAR matchcond:BOOLEAN;
              Stree:LSSTREE_pStree;
              lisons:LISTREE_pRelnode;
              PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
              BEGIN{MatchNode}
                IF s^.ls^.cat<>NP THEN
                  match:=FALSE;
                IF match THEN
                  NPREC2:=s^.ls^.NPfield^;
                IF match THEN
                  match:= matchcondI4;
T4:=s;
              END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
                PROCEDURE Match_MU8(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
                BEGIN{match}
                  IF first THEN BEGIN
                    MU8.first:=Lfirst;
                    MU8.last:=Llast;
                    match:= matchcondI8;
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
                            IF first THEN REL2:= Lfirst^.relation;match:=TRUE;
LSMATCHES_matchtreeConVar0rels(Lfirst^.node,first
,match,matchnode,matchlist1items,lastmatchM_2_2_2,matchcondI5) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_REL2(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM_2_2_1,LlastM_2_2_1
,item2,LfirstM_2_2_2,LlastM_2_2_2
) ELSE match_REL2(LfirstM_2_2_2,LfirstM_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                    IF first THEN REL1:= Lfirst^.relation;match:=TRUE;
              IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtreeConVar0rels(Lfirst^.node,first
,match,matchnode,matchlist2items,lastmatchM_2_2,matchcondI2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_REL1(Lfirst,Llast,TRUE,match);
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
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM_2_1,LlastM_2_1
,item2,LfirstM_2_2,LlastM_2_2
,item3,LfirstM_2_3,LlastM_2_3
) ELSE BEGIN match_REL1(LfirstM_2_2,LfirstM_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM_2_1,LlastM_2_1
,item2,LfirstM_2_2,LlastM_2_2
,item3,LfirstM_2_3,LlastM_2_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist3items,lastmatchM_2) END;
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM_1,LlastM_1
,PREDREL,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
) ELSE match_PREDREL(LfirstM_2,LfirstM_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,PREDREL,match,matchnode,matchlist3items,lastmatch) END;
                                                      PROCEDURE ACTION12;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC2,MU8,NPREC1,MU7,[])         ;
NPREC1.SUPERDEIXIS:=CLAUSEREC1.SUPERDEIXIS
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION16;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC2,MU8,NPREC1,MU7,[])         ;
NPREC1.SUPERDEIXIS:=CLAUSEREC1.DEIXIS
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION23;
BEGIN
NPVARREC1:=COPYT_NPTOVAR(NPREC2);                     ;
NPVARREC1.INDEX:=level;
NPVARREC1.GENERIC:=NOGENERIC;
                                                      ;
NPREC1.GENERIC:=NOGENERIC
                                                      ;
VARPREPPREC1:=PREPPREC2;                              
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
 level:=LIMATCHES_newlevel;
 subst:=2;
 END;
IF match THEN
  BEGIN
IF ((NPREC2.GENERIC =OMEGAGENERIC                          )
                                                      )
THEN IF
          ((NPREC2.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
                                                       THEN
  BEGIN
  IF ((CLAUSEREC1.DEIXIS =OMEGADEIXIS                        )
                                                      )
                                                       THEN
    BEGIN
    MAKET_VARPREPPrec(VARPREPPREC1);
    MAKET_NPVARrec(NPVARREC1);
    MAKET_NPrec(NPREC1);
    action12;
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
  IF ((CLAUSEREC1.DEIXIS<>OMEGADEIXIS                        )
                                                      )
                                                       THEN
    BEGIN
    MAKET_VARPREPPrec(VARPREPPREC1);
    MAKET_NPVARrec(NPVARREC1);
    MAKET_NPrec(NPREC1);
    action16;
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
                                                      DECRVARPREPNPSUBST:=result
END;
{:RVARPREPNPSUBST}
{rule:}
{:RVARPREPGENSUBST}
 FUNCTION DECRVARPREPGENSUBST(VAR LEVEL,subst:INTEGER;
Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
VAR result:LISTREE_setoftupleofstrees;
BEGIN
LISTREE_initsetoftupleofstrees(result);
DECRVARPREPGENSUBST:=result
END;
{rule:}
{:RLOCADVSUBST}
 FUNCTION DECRLOCADVSUBST(VAR LEVEL,subst:INTEGER;
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
LinitM_5,LrestM_5,LfirstM_5,LlastM_5:LSSTREE_prelnode;
iM_5:INTEGER;
nomoretreesM_5,lastmatchM_5:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
REL1:LSDOMAINT_synrel;
T1:LSSTREE_pStree;
T2:LSSTREE_pStree;
T3:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
PREPPVARREC1:LSDOMAINT_PREPPVARrecord;
PREPPREC1:LSDOMAINT_PREPPrecord;
VARPREPPREC1:LSDOMAINT_PREPPrecord;
ADVPVARREC1:LSDOMAINT_ADVPVARrecord;
ADVPREC1:LSDOMAINT_ADVPrecord;
PREPPREC2:LSDOMAINT_PREPPrecord;
VARPREPPREC2:LSDOMAINT_PREPPrecord;
ADVPREC2:LSDOMAINT_ADVPrecord;
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
          ((T3^.CAT IN [PREPP,
VARPREPP,
ADVP]                                                 )
                                                      )
THEN IF
          ((NOT(LSMRUQUO_NEGPHRASE(T3
))                                                    )
                                                      )
THEN IF
          ((REL1 IN [LOCADVREL,
SENTADVREL]                                           )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI1:BOOLEAN;
FUNCTION casefile1:BOOLEAN;
BEGIN IF
T1^.cat IN [
PREPPVAR,ADVPVAR] THEN CASE T1^.cat OF
PREPPVAR:casefile1:=(T1^.ls^.PREPPVARfield^.INDEX =level                                               );
ADVPVAR:casefile1:=(T1^.ls^.ADVPVARfield^.INDEX =level                                               );
END
END;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
          (((T1^.cat IN [PREPPVAR,
ADVPVAR]                                              ) AND 
((casefile1                                             )
                                                      )
                                                      )
                                                      )
THEN IF
          ((REL1 IN [LOCADVREL,
SENTADVREL]                                           )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

END;{matchcondI1}
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((LSMRUQUO_SUBSTORDERCONDITION1(MU6
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
          ((T2^.CAT IN [PREPP,
VARPREPP,
ADVP]                                                 )
                                                      )
THEN IF
          ((LSMRUQUO_GSUBSTORDERCONDITION1(MU6
,T2
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
THEN IF
          ((NOT(LSMRUQUO_NEGPHRASE(T2
))                                                    )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CLAUSE;
    N^.ls^.CLAUSEfield^ := CLAUSEREC1;
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
                                                          BEGIN{PREDREL}
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
    END{PREDREL};
                                                        BEGIN{createitem12}
  createPREDREL(list);
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
                                                        BEGIN{createitem14}
  createREL1(list);
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
                                                      BEGIN{createM}
m1:=MAKET_stree(CLAUSE);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
PROCEDURE createM2;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN{createM}
m2:=T2;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>CLAUSE THEN
      match:=FALSE;
    IF match THEN
      CLAUSEREC1:=s^.ls^.CLAUSEfield^;
  END{MatchNode};
                                                        PROCEDURE MatchList5Items
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
                                                          PROCEDURE MatchList4Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
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
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM_2) END;
                                                            PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
    PROCEDURE Match_MU3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU3.first:=Lfirst;
        MU3.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                              PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
    PROCEDURE Match_REL1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeVarConVar(Lfirst,Llast,first,REL1,T3,match,matchcondI2,lastmatchM_4);
END;
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
LlastM_5,LfirstM_5,LrestM_5,nomoretreesM_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_REL1,matchlist1items,
LlastM_4,LfirstM_4,LrestM_4,nomoretreesM_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU3,matchlist2items,
LlastM_3,LfirstM_3,LrestM_3,nomoretreesM_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist3items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist4items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,PREDREL,match,matchnode,matchlist5items,lastmatch) END;
                                                       FUNCTION subrule0X1 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitT3_1,LrestT3_1,LfirstT3_1,LlastT3_1:LSSTREE_prelnode;
iT3_1:INTEGER;
nomoretreesT3_1,lastmatchT3_1:BOOLEAN;
FUNCTION MATCHCONDT3:BOOLEAN;
BEGIN MATCHCONDT3:=TRUE END;
                                                          PROCEDURE matchtreeT3(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>PREPP THEN
        match:=FALSE;
      IF match THEN
        PREPPREC2:=s^.ls^.PREPPfield^;
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
LlastT3_1:=L;WHILE LlastT3_1^.brother<>NIL DO
LlastT3_1:=LlastT3_1^.brother;
match_MU4(L,LlastT3_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T3;
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
      N^.ls^.cat := PREPPVAR;
      N^.ls^.PREPPVARfield^ := PREPPVARREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T1}
  s:=MAKET_stree(PREPPVAR);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
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
  s:=MAKET_stree(PREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T2:=s;
  END{T2};
                                                      PROCEDURE ACTION11;
BEGIN
PREPPVARREC1:=COPYT_PREPPTOVAR(PREPPREC2);            ;
PREPPVARREC1.INDEX:=level
                                                      ;
PREPPREC1:=PREPPREC2;                                 ;
LSMRUQUO_ASSDEIXISMAX(CLAUSEREC1.
DEIXIS,CLAUSEREC1.
SUPERDEIXIS,PREPPREC1.
SUPERDEIXIS)                                          ;wbonus:=0;sbonus:=0

END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchtreeT3(match,TRUE);
If match Then
WHILE match AND NOT matchcondT3 DO
BEGIN
MatchtreeT3(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF (([LOC,
CAUS]                                                  *PREPPREC2.ACTSUBCEFS<>[]                                                    
)
                                                      )
THEN IF
          ((PREPPREC2.SUPERDEIXIS =OMEGADEIXIS                    )
                                                      )
THEN IF
          ((PREPPREC2.MOOD<>TOPICMOOD                             )
                                                      )
                                                       THEN
    BEGIN
    MAKET_PREPPVARrec(PREPPVARREC1);
    MAKET_PREPPrec(PREPPREC1);
    MAKET_VARPREPPrec(VARPREPPREC1);
    MAKET_ADVPVARrec(ADVPVARREC1);
    MAKET_ADVPrec(ADVPREC1);
    action11;
    createT1;
    createT2;
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
LinitT3_1,LrestT3_1,LfirstT3_1,LlastT3_1:LSSTREE_prelnode;
iT3_1:INTEGER;
nomoretreesT3_1,lastmatchT3_1:BOOLEAN;
FUNCTION MATCHCONDT3:BOOLEAN;
BEGIN MATCHCONDT3:=TRUE END;
                                                          PROCEDURE matchtreeT3(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>VARPREPP THEN
        match:=FALSE;
      IF match THEN
        VARPREPPREC2:=s^.ls^.VARPREPPfield^;
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
LlastT3_1:=L;WHILE LlastT3_1^.brother<>NIL DO
LlastT3_1:=LlastT3_1^.brother;
match_MU4(L,LlastT3_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T3;
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
      N^.ls^.cat := PREPPVAR;
      N^.ls^.PREPPVARfield^ := PREPPVARREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T1}
  s:=MAKET_stree(PREPPVAR);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
  PROCEDURE createT2;
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
  s:=MAKET_stree(VARPREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T2:=s;
  END{T2};
                                                      PROCEDURE ACTION23;
BEGIN
PREPPVARREC1:=COPYT_PREPPTOVAR(VARPREPPREC2);         ;
PREPPVARREC1.INDEX:=level
                                                      ;
VARPREPPREC1:=VARPREPPREC2;                           ;
LSMRUQUO_ASSDEIXISMAX(CLAUSEREC1.
DEIXIS,CLAUSEREC1.
SUPERDEIXIS,VARPREPPREC1.
SUPERDEIXIS)                                          ;wbonus:=0;sbonus:=0

END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchtreeT3(match,TRUE);
If match Then
WHILE match AND NOT matchcondT3 DO
BEGIN
MatchtreeT3(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF (([LOC,
CAUS]                                                  *PREPPREC2.ACTSUBCEFS<>[]                                                    
)
                                                      )
THEN IF
          ((VARPREPPREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
THEN IF
          ((VARPREPPREC2.MOOD<>TOPICMOOD                          )
                                                      )
                                                       THEN
    BEGIN
    MAKET_PREPPVARrec(PREPPVARREC1);
    MAKET_PREPPrec(PREPPREC1);
    MAKET_VARPREPPrec(VARPREPPREC1);
    MAKET_ADVPVARrec(ADVPVARREC1);
    MAKET_ADVPrec(ADVPREC1);
    action23;
    createT1;
    createT2;
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
LinitT3_1,LrestT3_1,LfirstT3_1,LlastT3_1:LSSTREE_prelnode;
iT3_1:INTEGER;
nomoretreesT3_1,lastmatchT3_1:BOOLEAN;
FUNCTION MATCHCONDT3:BOOLEAN;
BEGIN MATCHCONDT3:=TRUE END;
                                                          PROCEDURE matchtreeT3(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>ADVP THEN
        match:=FALSE;
      IF match THEN
        ADVPREC2:=s^.ls^.ADVPfield^;
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
LlastT3_1:=L;WHILE LlastT3_1^.brother<>NIL DO
LlastT3_1:=LlastT3_1^.brother;
match_MU5(L,LlastT3_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T3;
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
      N^.ls^.cat := ADVPVAR;
      N^.ls^.ADVPVARfield^ := ADVPVARREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T1}
  s:=MAKET_stree(ADVPVAR);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
  PROCEDURE createT2;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := ADVP;
      N^.ls^.ADVPfield^ := ADVPREC1;
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
  s:=MAKET_stree(ADVP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T2:=s;
  END{T2};
                                                      PROCEDURE ACTION35;
BEGIN
ADVPVARREC1:=COPYT_ADVPTOVAR(ADVPREC2);               ;
ADVPVARREC1.INDEX:=level
                                                      ;
ADVPREC1:=ADVPREC2;                                   ;
LSMRUQUO_ASSDEIXISMAX(CLAUSEREC1.
DEIXIS,CLAUSEREC1.
SUPERDEIXIS,ADVPREC1.
SUPERDEIXIS)                                          ;wbonus:=0;sbonus:=0

END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchtreeT3(match,TRUE);
If match Then
WHILE match AND NOT matchcondT3 DO
BEGIN
MatchtreeT3(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((LOCADV IN ADVPREC2.ACTSUBCEFS                         )
                                                      )
THEN IF
          ((ADVPREC2.MOOD<>TOPICMOOD                              )
                                                      )
THEN IF
          ((ADVPREC2.SUPERDEIXIS =OMEGADEIXIS                     )
                                                      )
                                                       THEN
    BEGIN
    MAKET_PREPPVARrec(PREPPVARREC1);
    MAKET_PREPPrec(PREPPREC1);
    MAKET_VARPREPPrec(VARPREPPREC1);
    MAKET_ADVPVARrec(ADVPVARREC1);
    MAKET_ADVPrec(ADVPREC1);
    action35;
    createT1;
    createT2;
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
  If match Then
  WHILE match AND NOT matchcondM DO
  BEGIN
  MatchModel(m,FALSE,match);
  END;
IF match THEN
 BEGIN
 level:=LIMATCHES_newlevel;
 subst:=2;
  LISTREE_mergesetsoftuplestrees(subrule0X1,result);
  LISTREE_mergesetsoftuplestrees(subrule0X2,result);
  LISTREE_mergesetsoftuplestrees(subrule0X3,result);
 END;
DECRLOCADVSUBST:=result
END;
{:RLOCADVSUBST}
{rule:}
{:RSHIFTLOCADVSUBST}
 FUNCTION DECRSHIFTLOCADVSUBST(VAR LEVEL,subst:INTEGER;
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
LinitM_4,LrestM_4,LfirstM_4,LlastM_4:LSSTREE_prelnode;
iM_4:INTEGER;
nomoretreesM_4,lastmatchM_4:BOOLEAN;
LinitM_4_1,LrestM_4_1,LfirstM_4_1,LlastM_4_1:LSSTREE_prelnode;
iM_4_1:INTEGER;
nomoretreesM_4_1,lastmatchM_4_1:BOOLEAN;
LinitM_5,LrestM_5,LfirstM_5,LlastM_5:LSSTREE_prelnode;
iM_5:INTEGER;
nomoretreesM_5,lastmatchM_5:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
T1:LSSTREE_pStree;
T2:LSSTREE_pStree;
T3:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
PREPPVARREC1:LSDOMAINT_PREPPVARrecord;
PREPPREC1:LSDOMAINT_PREPPrecord;
VARPREPPREC1:LSDOMAINT_PREPPrecord;
ADVPVARREC1:LSDOMAINT_ADVPVARrecord;
ADVPREC1:LSDOMAINT_ADVPrecord;
PREPPREC2:LSDOMAINT_PREPPrecord;
VARPREPPREC2:LSDOMAINT_PREPPrecord;
ADVPREC2:LSDOMAINT_ADVPrecord;
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
          ((T3^.CAT IN [PREPP,
VARPREPP,
ADVP]                                                 )
                                                      )
THEN IF
          ((NOT(LSMRUQUO_NEGPHRASE(T3
))                                                    )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI1:BOOLEAN;
FUNCTION casefile1:BOOLEAN;
BEGIN IF
T1^.cat IN [
PREPPVAR,ADVPVAR] THEN CASE T1^.cat OF
PREPPVAR:casefile1:=(T1^.ls^.PREPPVARfield^.INDEX =level                                               );
ADVPVAR:casefile1:=(T1^.ls^.ADVPVARfield^.INDEX =level                                               );
END
END;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
          (T1^.cat IN [PREPPVAR,
ADVPVAR]                                              ) AND 
((casefile1                                             )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

END;{matchcondI1}
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((LSMRUQUO_SUBSTORDERCONDITION(MU3
,MU2
,MU6
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
          ((T2^.CAT IN [PREPP,
VARPREPP,
ADVP]                                                 )
                                                      )
THEN IF
          ((LSMRUQUO_GSUBSTORDERCONDITION(MU3
,MU2
,MU6
,T2
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
THEN IF
          ((NOT(LSMRUQUO_NEGPHRASE(T2
))                                                    )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CLAUSE;
    N^.ls^.CLAUSEfield^ := CLAUSEREC1;
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
                                                        BEGIN{createitem12}
  createSHIFTREL(list);
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
                                                          BEGIN{PREDREL}
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
    END{PREDREL};
                                                        BEGIN{createitem14}
  createPREDREL(list);
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
                                                      BEGIN{createM}
m1:=MAKET_stree(CLAUSE);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
PROCEDURE createM2;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN{createM}
m2:=T2;
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
    IF s^.ls^.cat<>CLAUSE THEN
      match:=FALSE;
    IF match THEN
      CLAUSEREC1:=s^.ls^.CLAUSEfield^;
  END{MatchNode};
                                                        PROCEDURE MatchList5Items
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
                                                          PROCEDURE MatchList4Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
    PROCEDURE Match_SHIFTREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeConVar(Lfirst,Llast,first,SHIFTREL,T3,match,matchcondI2,lastmatchM_2);
END;
                                                            PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
    PROCEDURE Match_MU3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU3.first:=Lfirst;
        MU3.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                              PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
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
LlastM_4_1:=L;WHILE LlastM_4_1^.brother<>NIL DO
LlastM_4_1:=LlastM_4_1^.brother;
match_MU2(L,LlastM_4_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM_4) END;
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
LlastM_5,LfirstM_5,LrestM_5,nomoretreesM_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist1items,
LlastM_4,LfirstM_4,LrestM_4,nomoretreesM_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU3,matchlist2items,
LlastM_3,LfirstM_3,LrestM_3,nomoretreesM_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_SHIFTREL,matchlist3items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist4items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,SHIFTREL,PREDREL,match,matchnode,matchlist5items,lastmatch) END;
                                                       FUNCTION subrule0X1 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
LinitT3_1,LrestT3_1,LfirstT3_1,LlastT3_1:LSSTREE_prelnode;
iT3_1:INTEGER;
nomoretreesT3_1,lastmatchT3_1:BOOLEAN;
FUNCTION MATCHCONDT3:BOOLEAN;
BEGIN MATCHCONDT3:=TRUE END;
                                                          PROCEDURE matchtreeT3(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>PREPP THEN
        match:=FALSE;
      IF match THEN
        PREPPREC2:=s^.ls^.PREPPfield^;
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
LlastT3_1:=L;WHILE LlastT3_1^.brother<>NIL DO
LlastT3_1:=LlastT3_1^.brother;
match_MU4(L,LlastT3_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T3;
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
      N^.ls^.cat := PREPPVAR;
      N^.ls^.PREPPVARfield^ := PREPPVARREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T1}
  s:=MAKET_stree(PREPPVAR);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
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
  s:=MAKET_stree(PREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T2:=s;
  END{T2};
                                                      PROCEDURE ACTION8;
BEGIN
PREPPVARREC1:=COPYT_PREPPTOVAR(PREPPREC2);            ;
PREPPVARREC1.MOOD:=TOPICMOOD
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION10;
BEGIN
PREPPVARREC1:=COPYT_PREPPTOVAR(PREPPREC2);            ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION16;
BEGIN
PREPPVARREC1.INDEX:=level
                                                      ;
PREPPREC1:=PREPPREC2;                                 ;
LSMRUQUO_ASSDEIXISMAX(CLAUSEREC1.
DEIXIS,CLAUSEREC1.
SUPERDEIXIS,PREPPREC1.
SUPERDEIXIS)                                          
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchtreeT3(match,TRUE);
If match Then
WHILE match AND NOT matchcondT3 DO
BEGIN
MatchtreeT3(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF (([LOC,
CAUS]                                                  *PREPPREC2.ACTSUBCEFS<>[]                                                    
)
                                                      )
THEN IF
          ((PREPPREC2.SUPERDEIXIS =OMEGADEIXIS                    )
                                                      )
                                                       THEN
    BEGIN
    IF ((PREPPREC2.MOOD =NOWH                                  )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPVARrec(PREPPVARREC1);
      MAKET_PREPPrec(PREPPREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_ADVPVARrec(ADVPVARREC1);
      MAKET_ADVPrec(ADVPREC1);
      action8;
      action16;
      createT1;
      createT2;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((PREPPREC2.MOOD =WH                                    )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPVARrec(PREPPVARREC1);
      MAKET_PREPPrec(PREPPREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_ADVPVARrec(ADVPVARREC1);
      MAKET_ADVPrec(ADVPREC1);
      action10;
      action16;
      createT1;
      createT2;
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
LinitT3_1,LrestT3_1,LfirstT3_1,LlastT3_1:LSSTREE_prelnode;
iT3_1:INTEGER;
nomoretreesT3_1,lastmatchT3_1:BOOLEAN;
 NPVARREC4:LSDOMAINT_NPVARrecord;
FUNCTION MATCHCONDT3:BOOLEAN;
BEGIN MATCHCONDT3:=TRUE END;
  FUNCTION matchcondI4:BOOLEAN;
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
  PROCEDURE Match_(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>NPVAR THEN
        match:=FALSE;
      IF match THEN
        NPVARREC4:=s^.ls^.NPVARfield^;
    END{MatchNode};
                                                      BEGIN{MatchTree}
        match:=TRUE;
    IF match THEN
    BEGIN
      Stree:=Lfirst^.node;
      IF first THEN
      BEGIN
        MatchNode(Stree,match);
      IF match THEN
        match:= (Stree^.li^.n <=0);
      IF match THEN
        BEGIN
        END;
        IF match THEN
        BEGIN
          MatchList0Items(Stree^.sons,TRUE,match);
        END
      END
      ELSE
        BEGIN
          IF lastmatch_1 THEN
          MatchList0Items(Stree^.sons,FALSE,match)
          ELSE match:=FALSE;
        END
    END;
  lastmatch_1:=match;
  END;{MatchTree}
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
      Match_(Lfirst_1,Llast_1,TRUE,itemmatch);
      match:=itemmatch;
END
    END
  ELSE
  BEGIN
IF Llast_1=Lfinal THEN Lrest_1:=NIL;
    Match_(Lfirst_1,Llast_1,FALSE,match);
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
matchcondI4:=FALSE;
    IF
            ((Exist1(MU4)                                           )
                                                      )
                                                      THEN 
matchcondI4:=TRUE;

  END;{matchcondI4}
                                                          PROCEDURE matchtreeT3(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>VARPREPP THEN
        match:=FALSE;
      IF match THEN
        VARPREPPREC2:=s^.ls^.VARPREPPfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      PROCEDURE Match_MU4(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU4.first:=Lfirst;
          MU4.last:=Llast;
          match:= matchcondI4;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU4(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU4(NIL,NIL,TRUE,match) ELSE BEGIN
LlastT3_1:=L;WHILE LlastT3_1^.brother<>NIL DO
LlastT3_1:=LlastT3_1^.brother;
match_MU4(L,LlastT3_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T3;
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
      N^.ls^.cat := PREPPVAR;
      N^.ls^.PREPPVARfield^ := PREPPVARREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T1}
  s:=MAKET_stree(PREPPVAR);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
  PROCEDURE createT2;
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
  s:=MAKET_stree(VARPREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T2:=s;
  END{T2};
                                                      PROCEDURE ACTION29;
BEGIN
PREPPVARREC1:=COPYT_PREPPTOVAR(VARPREPPREC2);         ;
PREPPVARREC1.MOOD:=TOPICMOOD
                                                      ;
VARPREPPREC1:=VARPREPPREC2;                           ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION34;
BEGIN
PREPPVARREC1:=COPYT_PREPPTOVAR(VARPREPPREC2);         ;
VARPREPPREC1:=VARPREPPREC2;                           ;
VARPREPPREC1.MOOD:=NOWH
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION38;
BEGIN
PREPPVARREC1:=COPYT_PREPPTOVAR(VARPREPPREC2);         ;
VARPREPPREC1:=VARPREPPREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION42;
BEGIN
PREPPVARREC1.INDEX:=level
                                                      ;
LSMRUQUO_ASSDEIXISMAX(CLAUSEREC1.
DEIXIS,CLAUSEREC1.
SUPERDEIXIS,VARPREPPREC1.
SUPERDEIXIS)                                          
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchtreeT3(match,TRUE);
If match Then
WHILE match AND NOT matchcondT3 DO
BEGIN
MatchtreeT3(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF (([LOC,
CAUS]                                                  *VARPREPPREC2.ACTSUBCEFS<>
[]                                                    )
                                                      )
THEN IF
          ((VARPREPPREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                       THEN
    BEGIN
    IF ((VARPREPPREC2.MOOD =NOWH                               )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPVARrec(PREPPVARREC1);
      MAKET_PREPPrec(PREPPREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_ADVPVARrec(ADVPVARREC1);
      MAKET_ADVPrec(ADVPREC1);
      action29;
      action42;
      createT1;
      createT2;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((VARPREPPREC2.MOOD =RELATIVEXPMOOD                     )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPVARrec(PREPPVARREC1);
      MAKET_PREPPrec(PREPPREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_ADVPVARrec(ADVPVARREC1);
      MAKET_ADVPrec(ADVPREC1);
      action34;
      action42;
      createT1;
      createT2;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((VARPREPPREC2.MOOD =WH                                 )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPVARrec(PREPPVARREC1);
      MAKET_PREPPrec(PREPPREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_ADVPVARrec(ADVPVARREC1);
      MAKET_ADVPrec(ADVPREC1);
      action38;
      action42;
      createT1;
      createT2;
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
LinitT3_1,LrestT3_1,LfirstT3_1,LlastT3_1:LSSTREE_prelnode;
iT3_1:INTEGER;
nomoretreesT3_1,lastmatchT3_1:BOOLEAN;
 CNVARREC4:LSDOMAINT_CNVARrecord;
FUNCTION MATCHCONDT3:BOOLEAN;
BEGIN MATCHCONDT3:=TRUE END;
  FUNCTION matchcondI4:BOOLEAN;
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
  PROCEDURE Match_(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>CNVAR THEN
        match:=FALSE;
      IF match THEN
        CNVARREC4:=s^.ls^.CNVARfield^;
    END{MatchNode};
                                                      BEGIN{MatchTree}
        match:=TRUE;
    IF match THEN
    BEGIN
      Stree:=Lfirst^.node;
      IF first THEN
      BEGIN
        MatchNode(Stree,match);
      IF match THEN
        match:= (Stree^.li^.n <=0);
      IF match THEN
        BEGIN
        END;
        IF match THEN
        BEGIN
          MatchList0Items(Stree^.sons,TRUE,match);
        END
      END
      ELSE
        BEGIN
          IF lastmatch_1 THEN
          MatchList0Items(Stree^.sons,FALSE,match)
          ELSE match:=FALSE;
        END
    END;
  lastmatch_1:=match;
  END;{MatchTree}
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
      Match_(Lfirst_1,Llast_1,TRUE,itemmatch);
      match:=itemmatch;
END
    END
  ELSE
  BEGIN
IF Llast_1=Lfinal THEN Lrest_1:=NIL;
    Match_(Lfirst_1,Llast_1,FALSE,match);
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
matchcondI4:=FALSE;
    IF
            ((Exist1(MU4)                                           )
                                                      )
                                                      THEN 
matchcondI4:=TRUE;

  END;{matchcondI4}
                                                          PROCEDURE matchtreeT3(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>VARPREPP THEN
        match:=FALSE;
      IF match THEN
        VARPREPPREC2:=s^.ls^.VARPREPPfield^;
    END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      PROCEDURE Match_MU4(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      BEGIN{match}
        IF first THEN BEGIN
          MU4.first:=Lfirst;
          MU4.last:=Llast;
          match:= matchcondI4;
        END
        ELSE match:=FALSE
      END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU4(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU4(NIL,NIL,TRUE,match) ELSE BEGIN
LlastT3_1:=L;WHILE LlastT3_1^.brother<>NIL DO
LlastT3_1:=LlastT3_1^.brother;
match_MU4(L,LlastT3_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T3;
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
      N^.ls^.cat := PREPPVAR;
      N^.ls^.PREPPVARfield^ := PREPPVARREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T1}
  s:=MAKET_stree(PREPPVAR);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
  PROCEDURE createT2;
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
  s:=MAKET_stree(VARPREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T2:=s;
  END{T2};
                                                      PROCEDURE ACTION50;
BEGIN
PREPPVARREC1:=COPYT_PREPPTOVAR(VARPREPPREC2);         ;
VARPREPPREC1:=VARPREPPREC2;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION54;
BEGIN
PREPPVARREC1.INDEX:=level
                                                      ;
LSMRUQUO_ASSDEIXISMAX(CLAUSEREC1.
DEIXIS,CLAUSEREC1.
SUPERDEIXIS,VARPREPPREC1.
SUPERDEIXIS)                                          
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchtreeT3(match,TRUE);
If match Then
WHILE match AND NOT matchcondT3 DO
BEGIN
MatchtreeT3(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF (([LOC,
CAUS]                                                  *VARPREPPREC2.ACTSUBCEFS<>
[]                                                    )
                                                      )
THEN IF
          ((VARPREPPREC2.SUPERDEIXIS =OMEGADEIXIS                 )
                                                      )
                                                       THEN
    BEGIN
    IF ((VARPREPPREC2.MOOD =RELATIVEXPMOOD                     )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPVARrec(PREPPVARREC1);
      MAKET_PREPPrec(PREPPREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_ADVPVARrec(ADVPVARREC1);
      MAKET_ADVPrec(ADVPREC1);
      action50;
      action54;
      createT1;
      createT2;
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
LinitT3_1,LrestT3_1,LfirstT3_1,LlastT3_1:LSSTREE_prelnode;
iT3_1:INTEGER;
nomoretreesT3_1,lastmatchT3_1:BOOLEAN;
FUNCTION MATCHCONDT3:BOOLEAN;
BEGIN MATCHCONDT3:=TRUE END;
                                                          PROCEDURE matchtreeT3(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>ADVP THEN
        match:=FALSE;
      IF match THEN
        ADVPREC2:=s^.ls^.ADVPfield^;
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
LlastT3_1:=L;WHILE LlastT3_1^.brother<>NIL DO
LlastT3_1:=LlastT3_1^.brother;
match_MU5(L,LlastT3_1,TRUE,match) END END ELSE match:=FALSE END;
                                                          BEGIN
    s:= T3;
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
      N^.ls^.cat := ADVPVAR;
      N^.ls^.ADVPVARfield^ := ADVPVARREC1;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T1}
  s:=MAKET_stree(ADVPVAR);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T1:=s;
  END{T1};
  PROCEDURE createT2;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := ADVP;
      N^.ls^.ADVPfield^ := ADVPREC1;
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
  s:=MAKET_stree(ADVP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T2:=s;
  END{T2};
                                                      PROCEDURE ACTION63;
BEGIN
ADVPVARREC1:=COPYT_ADVPTOVAR(ADVPREC2);               ;
ADVPVARREC1.MOOD:=TOPICMOOD
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION65;
BEGIN
ADVPVARREC1:=COPYT_ADVPTOVAR(ADVPREC2);               ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION71;
BEGIN
ADVPREC1:=ADVPREC2;                                   ;
LSMRUQUO_ASSDEIXISMAX(CLAUSEREC1.
DEIXIS,CLAUSEREC1.
SUPERDEIXIS,ADVPREC1.
SUPERDEIXIS)                                          ;
ADVPVARREC1.INDEX:=level
                                                      
END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchtreeT3(match,TRUE);
If match Then
WHILE match AND NOT matchcondT3 DO
BEGIN
MatchtreeT3(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF (([LOCADV,
SENTADV]                                               *ADVPREC2.ACTSUBCEFS<>[]                                                    )
                                                      )
THEN IF
          ((ADVPREC2.SUPERDEIXIS =OMEGADEIXIS                     )
                                                      )
                                                       THEN
    BEGIN
    IF ((ADVPREC2.MOOD =NOWH                                   )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPVARrec(PREPPVARREC1);
      MAKET_PREPPrec(PREPPREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_ADVPVARrec(ADVPVARREC1);
      MAKET_ADVPrec(ADVPREC1);
      action63;
      action71;
      createT1;
      createT2;
      previous1;
      LISTREE_emptytuple(tuple);
      Is1:=loopholes.retype(m1,LISTREE_pstree);
      LISTREE_addtotuple(Is1,tuple);
      Is2:=loopholes.retype(m2,LISTREE_pstree);
      LISTREE_addtotuple(Is2,tuple);
      LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
      END;
    IF ((ADVPREC2.MOOD =WH                                     )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPVARrec(PREPPVARREC1);
      MAKET_PREPPrec(PREPPREC1);
      MAKET_VARPREPPrec(VARPREPPREC1);
      MAKET_ADVPVARrec(ADVPVARREC1);
      MAKET_ADVPrec(ADVPREC1);
      action65;
      action71;
      createT1;
      createT2;
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
 level:=LIMATCHES_newlevel;
 subst:=2;
  LISTREE_mergesetsoftuplestrees(subrule0X1,result);
  LISTREE_mergesetsoftuplestrees(subrule0X2,result);
  LISTREE_mergesetsoftuplestrees(subrule0X3,result);
  LISTREE_mergesetsoftuplestrees(subrule0X4,result);
 END;
DECRSHIFTLOCADVSUBST:=result
END;
{:RSHIFTLOCADVSUBST}
{rule:}
{:RSENTADVSUBST}
 FUNCTION DECRSENTADVSUBST(VAR LEVEL,subst:INTEGER;
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
LinitM_1_1,LrestM_1_1,LfirstM_1_1,LlastM_1_1:LSSTREE_prelnode;
iM_1_1:INTEGER;
nomoretreesM_1_1,lastmatchM_1_1:BOOLEAN;
LinitM_2,LrestM_2,LfirstM_2,LlastM_2:LSSTREE_prelnode;
iM_2:INTEGER;
nomoretreesM_2,lastmatchM_2:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
LinitM_4,LrestM_4,LfirstM_4,LlastM_4:LSSTREE_prelnode;
iM_4:INTEGER;
nomoretreesM_4,lastmatchM_4:BOOLEAN;
LinitM_4_1,LrestM_4_1,LfirstM_4_1,LlastM_4_1:LSSTREE_prelnode;
iM_4_1:INTEGER;
nomoretreesM_4_1,lastmatchM_4_1:BOOLEAN;
LinitM_5,LrestM_5,LfirstM_5,LlastM_5:LSSTREE_prelnode;
iM_5:INTEGER;
nomoretreesM_5,lastmatchM_5:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
T3:LSSTREE_pStree;
T4:LSSTREE_pStree;
PUNCREC1tree:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
ADVPVARREC1:LSDOMAINT_ADVPVARrecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
ADVPREC1:LSDOMAINT_ADVPrecord;
ADVPREC2:LSDOMAINT_ADVPrecord;
PUNCREC1:LSDOMAINT_PUNCrecord;
FUNCTION matchcondI8:BOOLEAN;
                                                      BEGIN
matchcondI8:=FALSE;
  IF
          ((NOT(LSMRUQUO_NEGPHRASE(T4
))                                                    )
                                                      )
                                                      THEN 
matchcondI8:=TRUE;

END;{matchcondI8}
FUNCTION matchcondI3:BOOLEAN;
                                                      BEGIN
matchcondI3:=FALSE;
  IF
          ((ADVPVARREC1.INDEX =level                              )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
          ((ADVPREC2.ACTSUBCEFS *[SENTADV,
CAUSADV]                                              <>[]                                                    )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
          ((ADVPREC1.ACTSUBCEFS *[SENTADV,
CAUSADV]                                              <>[]                                                    )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

END;{matchcondI1}
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((LSMRUQUO_SUBSTORDERCONDITION(MU1
,MU3
,MU4
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
          ((LSMRUQUO_GSUBSTORDERCONDITION(MU1
,MU3
,MU4
,T3
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
THEN IF
          ((NOT(LSMRUQUO_NEGPHRASE(T3
))                                                    )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CLAUSE;
    N^.ls^.CLAUSEfield^ := CLAUSEREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createLEFTDISLOCREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := ADVPVAR;
        N^.ls^.ADVPVARfield^ := ADVPVARREC1;
      END{CreateNode};
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      BEGIN
      wholelist.first:=NIL;wholelist.last:=NIL;
      END;
                                                          BEGIN{LEFTDISLOCREL}
LSMATCHES_createitem(list,LEFTDISLOCREL,ADVPVAR,createnode,createlist1);
    END{LEFTDISLOCREL};
                                                        BEGIN{createitem11}
  createLEFTDISLOCREL(list);
  END;
  PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU1(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU1}
    copylist(MU1,list);
    END{MU1};
                                                        BEGIN{createitem12}
  createMU1(list);
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
                                                          BEGIN{PREDREL}
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
    END{PREDREL};
                                                        BEGIN{createitem13}
  createPREDREL(list);
  END;
  PROCEDURE createitem14(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU4(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU4}
    copylist(MU4,list);
    END{MU4};
                                                        BEGIN{createitem14}
  createMU4(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist4items1010(wholelist,createitem11,createitem12,createitem13,createitem14);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(CLAUSE);
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
  lirel3:LIDOMAINT_synrel;
  lsrel3:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>CLAUSE THEN
      match:=FALSE;
    IF match THEN
      CLAUSEREC1:=s^.ls^.CLAUSEfield^;
  END{MatchNode};
                                                        PROCEDURE MatchList5Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR
    itemmatch,listmatch:Boolean;
    PROCEDURE Match_LEFTDISLOCREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>ADVP THEN
          match:=FALSE;
        IF match THEN
          ADVPREC2:=s^.ls^.ADVPfield^;
        IF match THEN
          match:= matchcondI2;
T4:=s;
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
LlastM_1_1:=L;WHILE LlastM_1_1^.brother<>NIL DO
LlastM_1_1:=LlastM_1_1^.brother;
match_MU5(L,LlastM_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeCon0rels(Lfirst,Llast,first,LEFTDISLOCREL
,match,matchnode,matchlist1items,lastmatchM_1,matchcondI8) END;
                                                          PROCEDURE MatchList4Items
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
        IF match THEN match:=(s^.ls^.PUNCfield^.key=auxkey('COMMAPUNCKEY'));
      END{MatchNode};
                                                      BEGIN{MatchTree}
                PUNCREC1tree:=Lfirst^.node;
          IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PUNCREL
,match,matchnode,matchlist0items,lastmatchM_2) END;
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
LlastM_4_1:=L;WHILE LlastM_4_1^.brother<>NIL DO
LlastM_4_1:=LlastM_4_1^.brother;
match_MU3(L,LlastM_4_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM_4) END;
                                                                PROCEDURE MatchList1Items
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
                                                      BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU4,matchlist0items,
LlastM_5,LfirstM_5,LrestM_5,nomoretreesM_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist1items,
LlastM_4,LfirstM_4,LrestM_4,nomoretreesM_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist2items,
LlastM_3,LfirstM_3,LrestM_3,nomoretreesM_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PUNCREL,matchlist3items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_LEFTDISLOCREL,matchlist4items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=3)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar3rels(s,first,LEFTDISLOCREL,PUNCREL,PREDREL,match,matchnode,matchlist5items,lastmatch) END;
                                                      PROCEDURE ACTION10;
BEGIN
ADVPVARREC1:=COPYT_ADVPTOVAR(ADVPREC2);               ;
ADVPVARREC1.INDEX:=level
                                                      ;
ADVPREC1:=ADVPREC2;                                   ;
LSMRUQUO_ASSDEIXISMAX(CLAUSEREC1.
DEIXIS,CLAUSEREC1.
SUPERDEIXIS,ADVPREC1.
SUPERDEIXIS)                                          ;wbonus:=0;sbonus:=0

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
 level:=LIMATCHES_newlevel;
 subst:=2;
 END;
IF match THEN
  BEGIN
IF ((ADVPREC2.SUPERDEIXIS =OMEGADEIXIS                     )
                                                      )
                                                       THEN
  BEGIN
  MAKET_ADVPVARrec(ADVPVARREC1);
  MAKET_ADVPrec(ADVPREC1);
  action10;
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
                                                      DECRSENTADVSUBST:=result
END;
{:RSENTADVSUBST}
{rule:}
{:RSENTPREPPSUBST}
 FUNCTION DECRSENTPREPPSUBST(VAR LEVEL,subst:INTEGER;
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
LinitM_1_1,LrestM_1_1,LfirstM_1_1,LlastM_1_1:LSSTREE_prelnode;
iM_1_1:INTEGER;
nomoretreesM_1_1,lastmatchM_1_1:BOOLEAN;
LinitM_2,LrestM_2,LfirstM_2,LlastM_2:LSSTREE_prelnode;
iM_2:INTEGER;
nomoretreesM_2,lastmatchM_2:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
LinitM_4,LrestM_4,LfirstM_4,LlastM_4:LSSTREE_prelnode;
iM_4:INTEGER;
nomoretreesM_4,lastmatchM_4:BOOLEAN;
LinitM_4_1,LrestM_4_1,LfirstM_4_1,LlastM_4_1:LSSTREE_prelnode;
iM_4_1:INTEGER;
nomoretreesM_4_1,lastmatchM_4_1:BOOLEAN;
LinitM_5,LrestM_5,LfirstM_5,LlastM_5:LSSTREE_prelnode;
iM_5:INTEGER;
nomoretreesM_5,lastmatchM_5:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
T3:LSSTREE_pStree;
T4:LSSTREE_pStree;
PUNCREC1tree:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
PREPPVARREC1:LSDOMAINT_PREPPVARrecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
PREPPREC1:LSDOMAINT_PREPPrecord;
PREPPREC2:LSDOMAINT_PREPPrecord;
PUNCREC1:LSDOMAINT_PUNCrecord;
FUNCTION matchcondI8:BOOLEAN;
                                                      BEGIN
matchcondI8:=FALSE;
  IF
          ((NOT(LSMRUQUO_NEGPHRASE(T4
))                                                    )
                                                      )
                                                      THEN 
matchcondI8:=TRUE;

END;{matchcondI8}
FUNCTION matchcondI3:BOOLEAN;
                                                      BEGIN
matchcondI3:=FALSE;
  IF
          ((PREPPVARREC1.INDEX =level                             )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
          ((CAUS IN PREPPREC2.ACTSUBCEFS                          )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
          ((CAUS IN PREPPREC1.ACTSUBCEFS                          )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

END;{matchcondI1}
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((LSMRUQUO_SUBSTORDERCONDITION(MU1
,MU3
,MU4
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
          ((LSMRUQUO_GSUBSTORDERCONDITION(MU1
,MU3
,MU4
,T3
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
THEN IF
          ((NOT(LSMRUQUO_NEGPHRASE(T3
))                                                    )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CLAUSE;
    N^.ls^.CLAUSEfield^ := CLAUSEREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createLEFTDISLOCREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := PREPPVAR;
        N^.ls^.PREPPVARfield^ := PREPPVARREC1;
      END{CreateNode};
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      BEGIN
      wholelist.first:=NIL;wholelist.last:=NIL;
      END;
                                                          BEGIN{LEFTDISLOCREL}
LSMATCHES_createitem(list,LEFTDISLOCREL,PREPPVAR,createnode,createlist1);
    END{LEFTDISLOCREL};
                                                        BEGIN{createitem11}
  createLEFTDISLOCREL(list);
  END;
  PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU1(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU1}
    copylist(MU1,list);
    END{MU1};
                                                        BEGIN{createitem12}
  createMU1(list);
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
                                                          BEGIN{PREDREL}
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
    END{PREDREL};
                                                        BEGIN{createitem13}
  createPREDREL(list);
  END;
  PROCEDURE createitem14(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU4(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU4}
    copylist(MU4,list);
    END{MU4};
                                                        BEGIN{createitem14}
  createMU4(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist4items1010(wholelist,createitem11,createitem12,createitem13,createitem14);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(CLAUSE);
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
    N^.ls^.cat := PREPP;
    N^.ls^.PREPPfield^ := PREPPREC1;
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
                                                      BEGIN{createM}
m2:=MAKET_stree(PREPP);
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
    IF s^.ls^.cat<>CLAUSE THEN
      match:=FALSE;
    IF match THEN
      CLAUSEREC1:=s^.ls^.CLAUSEfield^;
  END{MatchNode};
                                                        PROCEDURE MatchList5Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR
    itemmatch,listmatch:Boolean;
    PROCEDURE Match_LEFTDISLOCREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>PREPP THEN
          match:=FALSE;
        IF match THEN
          PREPPREC2:=s^.ls^.PREPPfield^;
        IF match THEN
          match:= matchcondI2;
T4:=s;
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
LlastM_1_1:=L;WHILE LlastM_1_1^.brother<>NIL DO
LlastM_1_1:=LlastM_1_1^.brother;
match_MU5(L,LlastM_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeCon0rels(Lfirst,Llast,first,LEFTDISLOCREL
,match,matchnode,matchlist1items,lastmatchM_1,matchcondI8) END;
                                                          PROCEDURE MatchList4Items
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
        IF match THEN match:=(s^.ls^.PUNCfield^.key=auxkey('COMMAPUNCKEY'));
      END{MatchNode};
                                                      BEGIN{MatchTree}
                PUNCREC1tree:=Lfirst^.node;
          IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PUNCREL
,match,matchnode,matchlist0items,lastmatchM_2) END;
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
LlastM_4_1:=L;WHILE LlastM_4_1^.brother<>NIL DO
LlastM_4_1:=LlastM_4_1^.brother;
match_MU3(L,LlastM_4_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM_4) END;
                                                                PROCEDURE MatchList1Items
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
                                                      BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU4,matchlist0items,
LlastM_5,LfirstM_5,LrestM_5,nomoretreesM_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist1items,
LlastM_4,LfirstM_4,LrestM_4,nomoretreesM_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist2items,
LlastM_3,LfirstM_3,LrestM_3,nomoretreesM_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PUNCREL,matchlist3items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_LEFTDISLOCREL,matchlist4items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=3)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar3rels(s,first,LEFTDISLOCREL,PUNCREL,PREDREL,match,matchnode,matchlist5items,lastmatch) END;
                                                      PROCEDURE ACTION10;
BEGIN
PREPPVARREC1:=COPYT_PREPPTOVAR(PREPPREC2);            ;
PREPPVARREC1.INDEX:=level
                                                      ;
PREPPREC1:=PREPPREC2;                                 ;
LSMRUQUO_ASSDEIXISMAX(CLAUSEREC1.
DEIXIS,CLAUSEREC1.
SUPERDEIXIS,PREPPREC1.
SUPERDEIXIS)                                          ;wbonus:=0;sbonus:=0

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
 level:=LIMATCHES_newlevel;
 subst:=2;
 END;
IF match THEN
  BEGIN
IF ((PREPPREC2.SUPERDEIXIS =OMEGADEIXIS                    )
                                                      )
                                                       THEN
  BEGIN
  MAKET_PREPPVARrec(PREPPVARREC1);
  MAKET_PREPPrec(PREPPREC1);
  action10;
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
                                                      DECRSENTPREPPSUBST:=result
END;
{:RSENTPREPPSUBST}
{rule:}
{:RPROSENTSUBST}
 FUNCTION DECRPROSENTSUBST(VAR LEVEL,subst:INTEGER;
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
REL1:LSDOMAINT_synrel;
REL2:LSDOMAINT_synrel;
REL3:LSDOMAINT_synrel;
T1:LSSTREE_pStree;
PROSENTREC1tree:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
PROSENTVARREC1:LSDOMAINT_PROSENTVARrecord;
PROSENTREC1:LSDOMAINT_PROSENTrecord;
FUNCTION matchcondI5:BOOLEAN;
                                                      BEGIN
matchcondI5:=FALSE;
  IF
          ((CLAUSEREC1.SYNVPEFS *LSAUXDOM_PROSENTVPS                                   <>
[]                                                    )
                                                      )
                                                      THEN 
matchcondI5:=TRUE;

END;{matchcondI5}
FUNCTION matchcondI3:BOOLEAN;
                                                      BEGIN
matchcondI3:=FALSE;
  IF
          ((PROSENTVARREC1.INDEX =level                           )
                                                      )
THEN IF
          ((PROSENTVARREC1.SO =FALSE                              )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI21:BOOLEAN;
                                                      BEGIN
matchcondI21:=FALSE;
  IF
          ((LSMRUQUO_VPRELPREC(COMPLREL
,REL3
)                                                     )
                                                      )
                                                      THEN 
matchcondI21:=TRUE;

END;{matchcondI21}
FUNCTION matchcondI2:BOOLEAN;
FUNCTION ALL1(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
lastmatch:BOOLEAN;
      match:Boolean;
PROCEDURE Match_REL3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR matchcond:BOOLEAN;
  Stree:LSSTREE_pStree;
  lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
    LSMATCHES_matchtreeVarConEmp(Lfirst,Llast,first,REL3,match,matchcondI21,lastmatch);
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
matchcondI2:=FALSE;
  IF
          ((ALL1(MU3)                                             )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI12:BOOLEAN;
                                                      BEGIN
matchcondI12:=FALSE;
  IF
          ((REL2 IN [OBJREL,
COMPLREL]                                             )
                                                      )
                                                      THEN 
matchcondI12:=TRUE;

END;{matchcondI12}
FUNCTION matchcondI11:BOOLEAN;
                                                      BEGIN
matchcondI11:=FALSE;
  IF
          ((LSMRUQUO_VPRELPREC(REL1
,COMPLREL
)                                                     )
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
                                                      FUNCTION EXIST2(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
Linit_1,Lrest_1,Lfirst_1,Llast_1:LSSTREE_prelnode;
i_1:INTEGER;
nomoretrees_1,lastmatch_1:BOOLEAN;
      Lfinal:LSSTREE_prelnode;
match:Boolean;
PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR
  itemmatch,listmatch:Boolean;
  PROCEDURE Match_REL2(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
      LSMATCHES_matchtreeVarConEmp(Lfirst,Llast,first,REL2,match,matchcondI12,lastmatch_1);
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
      Match_REL2(Lfirst_1,Llast_1,TRUE,itemmatch);
      match:=itemmatch;
END
    END
  ELSE
  BEGIN
IF Llast_1=Lfinal THEN Lrest_1:=NIL;
    Match_REL2(Lfirst_1,Llast_1,FALSE,match);
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
          ((ALL1(MU2)                                             )
                                                      )
THEN IF
          ((NOT Exist2(MU2)                                       )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

END;{matchcondI1}
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((LSMRUQUO_SUBSTORDERCONDITION2(MU3
,MU4
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
          ((LSMRUQUO_GSUBSTORDERCONDITION2(MU3
,MU4
,T1
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CLAUSE;
    N^.ls^.CLAUSEfield^ := CLAUSEREC1;
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
        PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU2}
        copylist(MU2,list);
        END{MU2};
                                                            BEGIN{createitem11}
      createMU2(list);
      END;
      PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createCOMPLREL(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := PROSENTVAR;
            N^.ls^.PROSENTVARfield^ := PROSENTVARREC1;
          END{CreateNode};
                                                                PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          BEGIN
          wholelist.first:=NIL;wholelist.last:=NIL;
          END;
                                                              BEGIN{COMPLREL}
LSMATCHES_createitem(list,COMPLREL,PROSENTVAR,createnode,createlist1);
        END{COMPLREL};
                                                            BEGIN{createitem12}
      createCOMPLREL(list);
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
                                                          BEGIN{PREDREL}
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
    END{PREDREL};
                                                        BEGIN{createitem12}
  createPREDREL(list);
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
m1:=MAKET_stree(CLAUSE);
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
    N^.ls^.cat := PROSENT;
    N^.ls^.PROSENTfield^ := PROSENTREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN{createM}
m2:=PROSENTREC1tree;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>CLAUSE THEN
      match:=FALSE;
    IF match THEN
      CLAUSEREC1:=s^.ls^.CLAUSEfield^;
    IF match THEN
      match:= matchcondI5;
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
                                                            PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
        PROCEDURE Match_MU2(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU2.first:=Lfirst;
            MU2.last:=Llast;
            match:= matchcondI1;
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
            match:= matchcondI2;
          END
          ELSE match:=FALSE
        END;
                                                      BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU3,matchlist0items,
LlastM_2_2,LfirstM_2_2,LrestM_2_2,nomoretreesM_2_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU2,matchlist1items,
LlastM_2_1,LfirstM_2_1,LrestM_2_1,nomoretreesM_2_1) END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist2items,lastmatchM_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_PREDREL(Lfirst,Llast,TRUE,match);
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
,PREDREL,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
) ELSE match_PREDREL(LfirstM_2,LfirstM_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,PREDREL,match,matchnode,matchlist3items,lastmatch) END;
                                                      PROCEDURE ACTION5;
BEGIN
PROSENTVARREC1.SO:=FALSE
                                                      ;
PROSENTVARREC1.INDEX:=level
                                                      ;
PROSENTREC1.SO:=FALSE
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
 level:=LIMATCHES_newlevel;
 subst:=2;
 END;
IF match THEN
  BEGIN
IF ((TRUE                                                  )
                                                      )
                                                       THEN
  BEGIN
  MAKET_PROSENTVARrec(PROSENTVARREC1);
  MAKET_PROSENTrec(PROSENTREC1);
  hulpstree:=LDBLEX_read(auxkey('PROSENTKEY'));
  PROSENTREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
  PROSENTREC1:=PROSENTREC1tree^.ls^.PROSENTfield^;
  action5;
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
                                                      DECRPROSENTSUBST:=result
END;
{:RPROSENTSUBST}
{rule:}
{:RSOPROSENTSUBST}
 FUNCTION DECRSOPROSENTSUBST(VAR LEVEL,subst:INTEGER;
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
LinitM_2_3,LrestM_2_3,LfirstM_2_3,LlastM_2_3:LSSTREE_prelnode;
iM_2_3:INTEGER;
nomoretreesM_2_3,lastmatchM_2_3:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
T1:LSSTREE_pStree;
PROSENTREC1tree:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
PROSENTVARREC1:LSDOMAINT_PROSENTVARrecord;
PROSENTREC1:LSDOMAINT_PROSENTrecord;
FUNCTION matchcondI5:BOOLEAN;
                                                      BEGIN
matchcondI5:=FALSE;
  IF
          ((CLAUSEREC1.SYNVPEFS *LSAUXDOM_SOPROSENTVPS                                 <>
[]                                                    )
                                                      )
                                                      THEN 
matchcondI5:=TRUE;

END;{matchcondI5}
FUNCTION matchcondI4:BOOLEAN;
                                                      BEGIN
matchcondI4:=FALSE;
  IF
          ((PROSENTREC1.SO =TRUE                                  )
                                                      )
THEN IF
          ((PROSENTREC1.NEG =FALSE                                )
                                                      )
                                                      THEN 
matchcondI4:=TRUE;

END;{matchcondI4}
FUNCTION matchcondI3:BOOLEAN;
                                                      BEGIN
matchcondI3:=FALSE;
  IF
          ((PROSENTVARREC1.INDEX =level                           )
                                                      )
THEN IF
          ((PROSENTVARREC1.SO =TRUE                               )
                                                      )
THEN IF
          ((PROSENTVARREC1.NEG =FALSE                             )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((LSMRUQUO_SUBSTORDERCONDITION2(MU3
,MU4
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
          ((LSMRUQUO_GSUBSTORDERCONDITION2(MU3
,MU4
,T1
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CLAUSE;
    N^.ls^.CLAUSEfield^ := CLAUSEREC1;
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
        PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU2}
        copylist(MU2,list);
        END{MU2};
                                                            BEGIN{createitem11}
      createMU2(list);
      END;
      PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createCOMPLREL(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := PROSENTVAR;
            N^.ls^.PROSENTVARfield^ := PROSENTVARREC1;
          END{CreateNode};
                                                                PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          BEGIN
          wholelist.first:=NIL;wholelist.last:=NIL;
          END;
                                                              BEGIN{COMPLREL}
LSMATCHES_createitem(list,COMPLREL,PROSENTVAR,createnode,createlist1);
        END{COMPLREL};
                                                            BEGIN{createitem12}
      createCOMPLREL(list);
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
                                                          BEGIN{PREDREL}
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
    END{PREDREL};
                                                        BEGIN{createitem12}
  createPREDREL(list);
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
m1:=MAKET_stree(CLAUSE);
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
    N^.ls^.cat := PROSENT;
    N^.ls^.PROSENTfield^ := PROSENTREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN{createM}
m2:=PROSENTREC1tree;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>CLAUSE THEN
      match:=FALSE;
    IF match THEN
      CLAUSEREC1:=s^.ls^.CLAUSEfield^;
    IF match THEN
      match:= matchcondI5;
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
        PROCEDURE Match_COMPLREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR matchcond:BOOLEAN;
          Stree:LSSTREE_pStree;
          lisons:LISTREE_pRelnode;
          PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
          BEGIN{MatchNode}
            IF s^.ls^.cat<>PROSENT THEN
              match:=FALSE;
            IF match THEN
              PROSENTREC1:=s^.ls^.PROSENTfield^;
            IF match THEN
              match:= matchcondI4;
            IF match THEN match:=(s^.ls^.PROSENTfield^.key=auxkey('SOPROSENTKEY'));
          END{MatchNode};
                                                      BEGIN{MatchTree}
                        PROSENTREC1tree:=Lfirst^.node;
              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,COMPLREL
,match,matchnode,matchlist0items,lastmatchM_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_COMPLREL(Lfirst,Llast,TRUE,match);
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
) ELSE BEGIN match_COMPLREL(LfirstM_2_2,LfirstM_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM_2_1,LlastM_2_1
,item2,LfirstM_2_2,LlastM_2_2
,item3,LfirstM_2_3,LlastM_2_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,PREDREL
,COMPLREL,match,matchnode,matchlist3items,lastmatchM_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_PREDREL(Lfirst,Llast,TRUE,match);
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
,PREDREL,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
) ELSE match_PREDREL(LfirstM_2,LfirstM_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,PREDREL,match,matchnode,matchlist3items,lastmatch) END;
                                                      PROCEDURE ACTION5;
BEGIN
PROSENTVARREC1.SO:=TRUE
                                                      ;
PROSENTVARREC1.NEG:=FALSE
                                                      ;
PROSENTVARREC1.INDEX:=level
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
 level:=LIMATCHES_newlevel;
 subst:=2;
 END;
IF match THEN
  BEGIN
IF ((TRUE                                                  )
                                                      )
                                                       THEN
  BEGIN
  MAKET_PROSENTVARrec(PROSENTVARREC1);
  hulpstree:=LDBLEX_read(auxkey('SOPROSENTKEY'));
  PROSENTREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
  PROSENTREC1:=PROSENTREC1tree^.ls^.PROSENTfield^;
  action5;
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
                                                      DECRSOPROSENTSUBST:=result
END;
{:RSOPROSENTSUBST}
{rule:}
{:RNOTPROSENTSUBST}
 FUNCTION DECRNOTPROSENTSUBST(VAR LEVEL,subst:INTEGER;
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
LinitM_4,LrestM_4,LfirstM_4,LlastM_4:LSSTREE_prelnode;
iM_4:INTEGER;
nomoretreesM_4,lastmatchM_4:BOOLEAN;
LinitM_4_1,LrestM_4_1,LfirstM_4_1,LlastM_4_1:LSSTREE_prelnode;
iM_4_1:INTEGER;
nomoretreesM_4_1,lastmatchM_4_1:BOOLEAN;
LinitM_4_2,LrestM_4_2,LfirstM_4_2,LlastM_4_2:LSSTREE_prelnode;
iM_4_2:INTEGER;
nomoretreesM_4_2,lastmatchM_4_2:BOOLEAN;
LinitM_4_3,LrestM_4_3,LfirstM_4_3,LlastM_4_3:LSSTREE_prelnode;
iM_4_3:INTEGER;
nomoretreesM_4_3,lastmatchM_4_3:BOOLEAN;
LinitM_5,LrestM_5,LfirstM_5,LlastM_5:LSSTREE_prelnode;
iM_5:INTEGER;
nomoretreesM_5,lastmatchM_5:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
REL6:LSDOMAINT_synrel;
T1:LSSTREE_pStree;
T2:LSSTREE_pStree;
PROSENTREC1tree:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
PROSENTVARREC1:LSDOMAINT_PROSENTVARrecord;
PROSENTREC1:LSDOMAINT_PROSENTrecord;
FUNCTION matchcondI61:BOOLEAN;
                                                      BEGIN
matchcondI61:=FALSE;
  IF
          ((REL6 IN [NEGREL,
MELTNEGREL]                                           )
                                                      )
                                                      THEN 
matchcondI61:=TRUE;

END;{matchcondI61}
FUNCTION matchcondI6:BOOLEAN;
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
  PROCEDURE Match_REL6(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
      LSMATCHES_matchtreeVarConEmp(Lfirst,Llast,first,REL6,match,matchcondI61,lastmatch_1);
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
      Match_REL6(Lfirst_1,Llast_1,TRUE,itemmatch);
      match:=itemmatch;
END
    END
  ELSE
  BEGIN
IF Llast_1=Lfinal THEN Lrest_1:=NIL;
    Match_REL6(Lfirst_1,Llast_1,FALSE,match);
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
matchcondI6:=FALSE;
  IF
          ((NOT Exist1(MU6)                                       )
                                                      )
                                                      THEN 
matchcondI6:=TRUE;

END;{matchcondI6}
FUNCTION matchcondI5:BOOLEAN;
                                                      BEGIN
matchcondI5:=FALSE;
  IF
          ((SYNNOTPROSENT IN CLAUSEREC1.SYNVPEFS                  )
                                                      )
                                                      THEN 
matchcondI5:=TRUE;

END;{matchcondI5}
FUNCTION matchcondI4:BOOLEAN;
                                                      BEGIN
matchcondI4:=FALSE;
  IF
          ((PROSENTREC1.SO =TRUE                                  )
                                                      )
THEN IF
          ((PROSENTREC1.NEG =TRUE                                 )
                                                      )
                                                      THEN 
matchcondI4:=TRUE;

END;{matchcondI4}
FUNCTION matchcondI3:BOOLEAN;
                                                      BEGIN
matchcondI3:=FALSE;
  IF
          ((PROSENTVARREC1.INDEX =level                           )
                                                      )
THEN IF
          ((PROSENTVARREC1.SO =TRUE                               )
                                                      )
THEN IF
          ((PROSENTVARREC1.NEG =TRUE                              )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((LSMRUQUO_SUBSTORDERCONDITION2(MU3
,MU4
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
          ((LSMRUQUO_GSUBSTORDERCONDITION2(MU3
,MU4
,T2
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CLAUSE;
    N^.ls^.CLAUSEfield^ := CLAUSEREC1;
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
    PROCEDURE createAUXREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      BEGIN
      wholelist.first:=NIL;wholelist.last:=NIL;
      END;
                                                          BEGIN{AUXREL}
LSMATCHES_createitemVar(list,AUXREL,T1);
    END{AUXREL};
                                                        BEGIN{createitem12}
  createAUXREL(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU6(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU6}
    copylist(MU6,list);
    END{MU6};
                                                        BEGIN{createitem13}
  createMU6(list);
  END;
  PROCEDURE createitem14(VAR list:LSMRUQUO_ListOfStrees);
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
        PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU2}
        copylist(MU2,list);
        END{MU2};
                                                            BEGIN{createitem11}
      createMU2(list);
      END;
      PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createCOMPLREL(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := PROSENTVAR;
            N^.ls^.PROSENTVARfield^ := PROSENTVARREC1;
          END{CreateNode};
                                                                PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          BEGIN
          wholelist.first:=NIL;wholelist.last:=NIL;
          END;
                                                              BEGIN{COMPLREL}
LSMATCHES_createitem(list,COMPLREL,PROSENTVAR,createnode,createlist1);
        END{COMPLREL};
                                                            BEGIN{createitem12}
      createCOMPLREL(list);
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
                                                          BEGIN{PREDREL}
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
    END{PREDREL};
                                                        BEGIN{createitem14}
  createPREDREL(list);
  END;
  PROCEDURE createitem15(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU4(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU4}
    copylist(MU4,list);
    END{MU4};
                                                        BEGIN{createitem15}
  createMU4(list);
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
                                                      BEGIN{createM}
m1:=MAKET_stree(CLAUSE);
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
    N^.ls^.cat := PROSENT;
    N^.ls^.PROSENTfield^ := PROSENTREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN{createM}
m2:=PROSENTREC1tree;
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
    IF s^.ls^.cat<>CLAUSE THEN
      match:=FALSE;
    IF match THEN
      CLAUSEREC1:=s^.ls^.CLAUSEfield^;
    IF match THEN
      match:= matchcondI5;
  END{MatchNode};
                                                        PROCEDURE MatchList5Items
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
                                                          PROCEDURE MatchList4Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
    PROCEDURE Match_AUXREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeVar(Lfirst,Llast,first,AUXREL,T1,match,lastmatchM_2);
END;
                                                            PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
    PROCEDURE Match_MU6(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU6.first:=Lfirst;
        MU6.last:=Llast;
        match:= matchcondI6;
      END
      ELSE match:=FALSE
    END;
                                                              PROCEDURE MatchList2Items
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
        PROCEDURE Match_COMPLREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR matchcond:BOOLEAN;
          Stree:LSSTREE_pStree;
          lisons:LISTREE_pRelnode;
          PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
          BEGIN{MatchNode}
            IF s^.ls^.cat<>PROSENT THEN
              match:=FALSE;
            IF match THEN
              PROSENTREC1:=s^.ls^.PROSENTfield^;
            IF match THEN
              match:= matchcondI4;
            IF match THEN match:=(s^.ls^.PROSENTfield^.key=auxkey('NOTPROSENTKEY'));
          END{MatchNode};
                                                      BEGIN{MatchTree}
                        PROSENTREC1tree:=Lfirst^.node;
              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,COMPLREL
,match,matchnode,matchlist0items,lastmatchM_4_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_COMPLREL(Lfirst,Llast,TRUE,match);
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
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM_4_1,LlastM_4_1
,item2,LfirstM_4_2,LlastM_4_2
,item3,LfirstM_4_3,LlastM_4_3
) ELSE BEGIN match_COMPLREL(LfirstM_4_2,LfirstM_4_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM_4_1,LlastM_4_1
,item2,LfirstM_4_2,LlastM_4_2
,item3,LfirstM_4_3,LlastM_4_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,PREDREL
,COMPLREL,match,matchnode,matchlist3items,lastmatchM_4) END;
                                                                PROCEDURE MatchList1Items
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
                                                      BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU4,matchlist0items,
LlastM_5,LfirstM_5,LrestM_5,nomoretreesM_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist1items,
LlastM_4,LfirstM_4,LrestM_4,nomoretreesM_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU6,matchlist2items,
LlastM_3,LfirstM_3,LrestM_3,nomoretreesM_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_AUXREL,matchlist3items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist4items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,AUXREL,PREDREL,match,matchnode,matchlist5items,lastmatch) END;
                                                      PROCEDURE ACTION5;
BEGIN
PROSENTVARREC1.SO:=TRUE
                                                      ;
PROSENTVARREC1.INDEX:=level
                                                      ;
PROSENTVARREC1.NEG:=TRUE
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
 level:=LIMATCHES_newlevel;
 subst:=2;
 END;
IF match THEN
  BEGIN
IF ((TRUE                                                  )
                                                      )
                                                       THEN
  BEGIN
  MAKET_PROSENTVARrec(PROSENTVARREC1);
  hulpstree:=LDBLEX_read(auxkey('NOTPROSENTKEY'));
  PROSENTREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
  PROSENTREC1:=PROSENTREC1tree^.ls^.PROSENTfield^;
  action5;
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
                                                      DECRNOTPROSENTSUBST:=result
END;
{:RNOTPROSENTSUBST}
{rule:}
{:RPOSSUBST}
 FUNCTION DECRPOSSUBST(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
LinitM_4,LrestM_4,LfirstM_4,LlastM_4:LSSTREE_prelnode;
iM_4:INTEGER;
nomoretreesM_4,lastmatchM_4:BOOLEAN;
LinitM_4_1,LrestM_4_1,LfirstM_4_1,LlastM_4_1:LSSTREE_prelnode;
iM_4_1:INTEGER;
nomoretreesM_4_1,lastmatchM_4_1:BOOLEAN;
LinitM_5,LrestM_5,LfirstM_5,LlastM_5:LSSTREE_prelnode;
iM_5:INTEGER;
nomoretreesM_5,lastmatchM_5:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
T1:LSSTREE_pStree;
POSREC1tree:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
POSVARREC1:LSDOMAINT_POSVARrecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
POSREC1:LSDOMAINT_POSrecord;
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((LSMRUQUO_SUBSTORDERCONDITION(MU3
,MU4
,MU5
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
          ((LSMRUQUO_GSUBSTORDERCONDITION(MU3
,MU4
,MU5
,T1
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CLAUSE;
    N^.ls^.CLAUSEfield^ := CLAUSEREC1;
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
    PROCEDURE createPOSREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := POSVAR;
        N^.ls^.POSVARfield^ := POSVARREC1;
      END{CreateNode};
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      BEGIN
      wholelist.first:=NIL;wholelist.last:=NIL;
      END;
                                                          BEGIN{POSREL}
LSMATCHES_createitem(list,POSREL,POSVAR,createnode,createlist1);
    END{POSREL};
                                                        BEGIN{createitem12}
  createPOSREL(list);
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
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
    END{PREDREL};
                                                        BEGIN{createitem14}
  createPREDREL(list);
  END;
  PROCEDURE createitem15(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU5(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU5}
    copylist(MU5,list);
    END{MU5};
                                                        BEGIN{createitem15}
  createMU5(list);
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
                                                      BEGIN{createM}
m1:=MAKET_stree(CLAUSE);
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
    N^.ls^.cat := POS;
    N^.ls^.POSfield^ := POSREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN{createM}
m2:=POSREC1tree;
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
    IF s^.ls^.cat<>CLAUSE THEN
      match:=FALSE;
    IF match THEN
      CLAUSEREC1:=s^.ls^.CLAUSEfield^;
  END{MatchNode};
                                                        PROCEDURE MatchList5Items
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
                                                          PROCEDURE MatchList4Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
    PROCEDURE Match_POSREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>POS THEN
          match:=FALSE;
        IF match THEN
          POSREC1:=s^.ls^.POSfield^;
        IF match THEN match:=(s^.ls^.POSfield^.key=auxkey('POSKEY'));
      END{MatchNode};
                                                      BEGIN{MatchTree}
                POSREC1tree:=Lfirst^.node;
          IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,POSREL
,match,matchnode,matchlist0items,lastmatchM_2) END;
                                                            PROCEDURE MatchList3Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
      VAR
        itemmatch,listmatch:Boolean;
    PROCEDURE Match_MU3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU3.first:=Lfirst;
        MU3.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                              PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
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
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM_4) END;
                                                                PROCEDURE MatchList1Items
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
                                                      BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU5,matchlist0items,
LlastM_5,LfirstM_5,LrestM_5,nomoretreesM_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist1items,
LlastM_4,LfirstM_4,LrestM_4,nomoretreesM_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU3,matchlist2items,
LlastM_3,LfirstM_3,LrestM_3,nomoretreesM_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_POSREL,matchlist3items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist4items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,POSREL,PREDREL,match,matchnode,matchlist5items,lastmatch) END;
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
  MAKET_POSVARrec(POSVARREC1);
  hulpstree:=LDBLEX_read(auxkey('POSKEY'));
  POSREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
  POSREC1:=POSREC1tree^.ls^.POSfield^;
  action1;
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
                                                      DECRPOSSUBST:=result
END;
{:RPOSSUBST}
{rule:}
{:RSENTNEGSUBST}
 FUNCTION DECRSENTNEGSUBST(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
LinitM_4,LrestM_4,LfirstM_4,LlastM_4:LSSTREE_prelnode;
iM_4:INTEGER;
nomoretreesM_4,lastmatchM_4:BOOLEAN;
LinitM_4_1,LrestM_4_1,LfirstM_4_1,LlastM_4_1:LSSTREE_prelnode;
iM_4_1:INTEGER;
nomoretreesM_4_1,lastmatchM_4_1:BOOLEAN;
LinitM_5,LrestM_5,LfirstM_5,LlastM_5:LSSTREE_prelnode;
iM_5:INTEGER;
nomoretreesM_5,lastmatchM_5:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
T1:LSSTREE_pStree;
NEGREC1tree:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
NEGVARREC1:LSDOMAINT_NEGVARrecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
NEGREC1:LSDOMAINT_NEGrecord;
CLAUSEREC2:LSDOMAINT_CLAUSErecord;
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((LSMRUQUO_SUBSTORDERCONDITION(MU2
,MU3
,MU4
,CLAUSEREC2
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
          ((LSMRUQUO_GSUBSTORDERCONDITION(MU2
,MU3
,MU4
,T1
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CLAUSE;
    N^.ls^.CLAUSEfield^ := CLAUSEREC1;
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
    PROCEDURE createNEGREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := NEGVAR;
        N^.ls^.NEGVARfield^ := NEGVARREC1;
      END{CreateNode};
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      BEGIN
      wholelist.first:=NIL;wholelist.last:=NIL;
      END;
                                                          BEGIN{NEGREL}
LSMATCHES_createitem(list,NEGREL,NEGVAR,createnode,createlist1);
    END{NEGREL};
                                                        BEGIN{createitem12}
  createNEGREL(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU2}
    copylist(MU2,list);
    END{MU2};
                                                        BEGIN{createitem13}
  createMU2(list);
  END;
  PROCEDURE createitem14(VAR list:LSMRUQUO_ListOfStrees);
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
                                                          BEGIN{PREDREL}
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
    END{PREDREL};
                                                        BEGIN{createitem14}
  createPREDREL(list);
  END;
  PROCEDURE createitem15(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU4(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU4}
    copylist(MU4,list);
    END{MU4};
                                                        BEGIN{createitem15}
  createMU4(list);
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
                                                      BEGIN{createM}
m1:=MAKET_stree(CLAUSE);
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
    N^.ls^.cat := NEG;
    N^.ls^.NEGfield^ := NEGREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN{createM}
m2:=NEGREC1tree;
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
    IF s^.ls^.cat<>CLAUSE THEN
      match:=FALSE;
    IF match THEN
      CLAUSEREC2:=s^.ls^.CLAUSEfield^;
  END{MatchNode};
                                                        PROCEDURE MatchList5Items
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
                                                          PROCEDURE MatchList4Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
    PROCEDURE Match_NEGREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>NEG THEN
          match:=FALSE;
        IF match THEN
          NEGREC1:=s^.ls^.NEGfield^;
        IF match THEN match:=(s^.ls^.NEGfield^.key=auxkey('NOTNEGKEY'));
      END{MatchNode};
                                                      BEGIN{MatchTree}
                NEGREC1tree:=Lfirst^.node;
          IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,NEGREL
,match,matchnode,matchlist0items,lastmatchM_2) END;
                                                            PROCEDURE MatchList3Items
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
                                                              PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
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
LlastM_4_1:=L;WHILE LlastM_4_1^.brother<>NIL DO
LlastM_4_1:=LlastM_4_1^.brother;
match_MU3(L,LlastM_4_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM_4) END;
                                                                PROCEDURE MatchList1Items
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
                                                      BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU4,matchlist0items,
LlastM_5,LfirstM_5,LrestM_5,nomoretreesM_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist1items,
LlastM_4,LfirstM_4,LrestM_4,nomoretreesM_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU2,matchlist2items,
LlastM_3,LfirstM_3,LrestM_3,nomoretreesM_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_NEGREL,matchlist3items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist4items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,NEGREL,PREDREL,match,matchnode,matchlist5items,lastmatch) END;
                                                      PROCEDURE ACTION4;
BEGIN
CLAUSEREC1:=CLAUSEREC2;                               ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION8;
BEGIN
CLAUSEREC1:=CLAUSEREC2;                               ;
CLAUSEREC1.AKTIONSARTS:=CLAUSEREC2.AKTIONSARTS
-[STATIVE]                                             ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION9;
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
IF ((TRUE                                                  )
                                                      )
                                                       THEN
  BEGIN
  IF ((CLAUSEREC2.AKTIONSARTS =[STATIVE]                                             )
                                                      )
                                                       THEN
    BEGIN
    MAKET_CLAUSErec(CLAUSEREC1);
    MAKET_NEGVARrec(NEGVARREC1);
    hulpstree:=LDBLEX_read(auxkey('NOTNEGKEY'));
    NEGREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    NEGREC1:=NEGREC1tree^.ls^.NEGfield^;
    action4;
    action9;
    createM1;
    createM2;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(m2,LISTREE_pstree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
    END;
  IF ((STATIVE IN CLAUSEREC2.AKTIONSARTS                     )
                                                      )
                                                       THEN
    BEGIN
    MAKET_CLAUSErec(CLAUSEREC1);
    MAKET_NEGVARrec(NEGVARREC1);
    hulpstree:=LDBLEX_read(auxkey('NOTNEGKEY'));
    NEGREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    NEGREC1:=NEGREC1tree^.ls^.NEGfield^;
    action8;
    action9;
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
                                                      DECRSENTNEGSUBST:=result
END;
{:RSENTNEGSUBST}
{rule:}
{:RSENTMELTNEGSUBST}
 FUNCTION DECRSENTMELTNEGSUBST(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
LinitM_4,LrestM_4,LfirstM_4,LlastM_4:LSSTREE_prelnode;
iM_4:INTEGER;
nomoretreesM_4,lastmatchM_4:BOOLEAN;
LinitM_4_1,LrestM_4_1,LfirstM_4_1,LlastM_4_1:LSSTREE_prelnode;
iM_4_1:INTEGER;
nomoretreesM_4_1,lastmatchM_4_1:BOOLEAN;
LinitM_5,LrestM_5,LfirstM_5,LlastM_5:LSSTREE_prelnode;
iM_5:INTEGER;
nomoretreesM_5,lastmatchM_5:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
T1:LSSTREE_pStree;
NEGREC1tree:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
NEGVARREC1:LSDOMAINT_NEGVARrecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
NEGREC1:LSDOMAINT_NEGrecord;
CLAUSEREC2:LSDOMAINT_CLAUSErecord;
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((LSMRUQUO_SUBSTORDERCONDITION(MU2
,MU4
,MU5
,CLAUSEREC2
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
          ((LSMRUQUO_GSUBSTORDERCONDITION(MU2
,MU4
,MU5
,T1
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CLAUSE;
    N^.ls^.CLAUSEfield^ := CLAUSEREC1;
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
    PROCEDURE createMELTNEGREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := NEGVAR;
        N^.ls^.NEGVARfield^ := NEGVARREC1;
      END{CreateNode};
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      BEGIN
      wholelist.first:=NIL;wholelist.last:=NIL;
      END;
                                                          BEGIN{MELTNEGREL}
LSMATCHES_createitem(list,MELTNEGREL,NEGVAR,createnode,createlist1);
    END{MELTNEGREL};
                                                        BEGIN{createitem12}
  createMELTNEGREL(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU2}
    copylist(MU2,list);
    END{MU2};
                                                        BEGIN{createitem13}
  createMU2(list);
  END;
  PROCEDURE createitem14(VAR list:LSMRUQUO_ListOfStrees);
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
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
    END{PREDREL};
                                                        BEGIN{createitem14}
  createPREDREL(list);
  END;
  PROCEDURE createitem15(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU5(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU5}
    copylist(MU5,list);
    END{MU5};
                                                        BEGIN{createitem15}
  createMU5(list);
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
                                                      BEGIN{createM}
m1:=MAKET_stree(CLAUSE);
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
    N^.ls^.cat := NEG;
    N^.ls^.NEGfield^ := NEGREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN{createM}
m2:=NEGREC1tree;
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
    IF s^.ls^.cat<>CLAUSE THEN
      match:=FALSE;
    IF match THEN
      CLAUSEREC2:=s^.ls^.CLAUSEfield^;
  END{MatchNode};
                                                        PROCEDURE MatchList5Items
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
                                                          PROCEDURE MatchList4Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
    PROCEDURE Match_MELTNEGREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>NEG THEN
          match:=FALSE;
        IF match THEN
          NEGREC1:=s^.ls^.NEGfield^;
        IF match THEN match:=(s^.ls^.NEGfield^.key=auxkey('NOTNEGKEY'));
      END{MatchNode};
                                                      BEGIN{MatchTree}
                NEGREC1tree:=Lfirst^.node;
          IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,MELTNEGREL
,match,matchnode,matchlist0items,lastmatchM_2) END;
                                                            PROCEDURE MatchList3Items
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
                                                              PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
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
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM_4) END;
                                                                PROCEDURE MatchList1Items
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
                                                      BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU5,matchlist0items,
LlastM_5,LfirstM_5,LrestM_5,nomoretreesM_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist1items,
LlastM_4,LfirstM_4,LrestM_4,nomoretreesM_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU2,matchlist2items,
LlastM_3,LfirstM_3,LrestM_3,nomoretreesM_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_MELTNEGREL,matchlist3items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist4items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,MELTNEGREL,PREDREL,match,matchnode,matchlist5items,lastmatch) END;
                                                      PROCEDURE ACTION5;
BEGIN
CLAUSEREC1:=CLAUSEREC2;                               ;
CLAUSEREC1.AKTIONSARTS:=[ACTIVITY,
ACCOMPLISHMENT,
STATIVE,
ACHIEVEMENT]                                          ;wbonus:=0;sbonus:=0

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
IF ((STATIVE IN CLAUSEREC2.AKTIONSARTS                     )
                                                      )
                                                       THEN
  BEGIN
  MAKET_CLAUSErec(CLAUSEREC1);
  MAKET_NEGVARrec(NEGVARREC1);
  hulpstree:=LDBLEX_read(auxkey('NOTNEGKEY'));
  NEGREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
  NEGREC1:=NEGREC1tree^.ls^.NEGfield^;
  action5;
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
                                                      DECRSENTMELTNEGSUBST:=result
END;
{:RSENTMELTNEGSUBST}
{rule:}
{:RVPMELTNEGSUBST}
 FUNCTION DECRVPMELTNEGSUBST(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
LinitM_2_3,LrestM_2_3,LfirstM_2_3,LlastM_2_3:LSSTREE_prelnode;
iM_2_3:INTEGER;
nomoretreesM_2_3,lastmatchM_2_3:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
T1:LSSTREE_pStree;
NEGREC1tree:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
NEGVARREC1:LSDOMAINT_NEGVARrecord;
NEGREC1:LSDOMAINT_NEGrecord;
CLAUSEREC2:LSDOMAINT_CLAUSErecord;
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((LSMRUQUO_SUBSTORDERCONDITION2(MU4
,MU5
,CLAUSEREC2
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
          ((LSMRUQUO_GSUBSTORDERCONDITION2(MU4
,MU5
,T1
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CLAUSE;
    N^.ls^.CLAUSEfield^ := CLAUSEREC1;
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
        PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU2}
        copylist(MU2,list);
        END{MU2};
                                                            BEGIN{createitem11}
      createMU2(list);
      END;
      PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createMELTNEGREL(VAR list:LSMRUQUO_ListOfStrees);
        VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
         list1:LSMRUQUO_ListOfStrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := NEGVAR;
            N^.ls^.NEGVARfield^ := NEGVARREC1;
          END{CreateNode};
                                                                PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          BEGIN
          wholelist.first:=NIL;wholelist.last:=NIL;
          END;
                                                              BEGIN{MELTNEGREL}
LSMATCHES_createitem(list,MELTNEGREL,NEGVAR,createnode,createlist1);
        END{MELTNEGREL};
                                                            BEGIN{createitem12}
      createMELTNEGREL(list);
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
                                                          BEGIN{PREDREL}
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
    END{PREDREL};
                                                        BEGIN{createitem12}
  createPREDREL(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU5(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU5}
    copylist(MU5,list);
    END{MU5};
                                                        BEGIN{createitem13}
  createMU5(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist3items010(wholelist,createitem11,createitem12,createitem13);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(CLAUSE);
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
    N^.ls^.cat := NEG;
    N^.ls^.NEGfield^ := NEGREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN{createM}
m2:=NEGREC1tree;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>CLAUSE THEN
      match:=FALSE;
    IF match THEN
      CLAUSEREC2:=s^.ls^.CLAUSEfield^;
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
        PROCEDURE Match_MELTNEGREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR matchcond:BOOLEAN;
          Stree:LSSTREE_pStree;
          lisons:LISTREE_pRelnode;
          PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
          BEGIN{MatchNode}
            IF s^.ls^.cat<>NEG THEN
              match:=FALSE;
            IF match THEN
              NEGREC1:=s^.ls^.NEGfield^;
            IF match THEN match:=(s^.ls^.NEGfield^.key=auxkey('NOTNEGKEY'));
          END{MatchNode};
                                                      BEGIN{MatchTree}
                        NEGREC1tree:=Lfirst^.node;
              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,MELTNEGREL
,match,matchnode,matchlist0items,lastmatchM_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MELTNEGREL(Lfirst,Llast,TRUE,match);
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
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM_2_1,LlastM_2_1
,item2,LfirstM_2_2,LlastM_2_2
,item3,LfirstM_2_3,LlastM_2_3
) ELSE BEGIN match_MELTNEGREL(LfirstM_2_2,LfirstM_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM_2_1,LlastM_2_1
,item2,LfirstM_2_2,LlastM_2_2
,item3,LfirstM_2_3,LlastM_2_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,PREDREL
,MELTNEGREL,match,matchnode,matchlist3items,lastmatchM_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_PREDREL(Lfirst,Llast,TRUE,match);
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM_1,LlastM_1
,PREDREL,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
) ELSE match_PREDREL(LfirstM_2,LfirstM_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,PREDREL,match,matchnode,matchlist3items,lastmatch) END;
                                                      PROCEDURE ACTION5;
BEGIN
CLAUSEREC1:=CLAUSEREC2;                               ;
CLAUSEREC1.AKTIONSARTS:=[ACTIVITY,
ACCOMPLISHMENT,
STATIVE,
ACHIEVEMENT]                                          ;wbonus:=0;sbonus:=0

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
IF ((STATIVE IN CLAUSEREC2.AKTIONSARTS                     )
                                                      )
                                                       THEN
  BEGIN
  MAKET_CLAUSErec(CLAUSEREC1);
  MAKET_NEGVARrec(NEGVARREC1);
  hulpstree:=LDBLEX_read(auxkey('NOTNEGKEY'));
  NEGREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
  NEGREC1:=NEGREC1tree^.ls^.NEGfield^;
  action5;
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
                                                      DECRVPMELTNEGSUBST:=result
END;
{:RVPMELTNEGSUBST}
{rule:}
{:RSHIFTPREPNPSUBST}
 FUNCTION DECRSHIFTPREPNPSUBST(VAR LEVEL,subst:INTEGER;
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
LinitM_2_2_1,LrestM_2_2_1,LfirstM_2_2_1,LlastM_2_2_1:LSSTREE_prelnode;
iM_2_2_1:INTEGER;
nomoretreesM_2_2_1,lastmatchM_2_2_1:BOOLEAN;
LinitM_2_3,LrestM_2_3,LfirstM_2_3,LlastM_2_3:LSSTREE_prelnode;
iM_2_3:INTEGER;
nomoretreesM_2_3,lastmatchM_2_3:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
LinitM_4,LrestM_4,LfirstM_4,LlastM_4:LSSTREE_prelnode;
iM_4:INTEGER;
nomoretreesM_4,lastmatchM_4:BOOLEAN;
LinitM_4_1,LrestM_4_1,LfirstM_4_1,LlastM_4_1:LSSTREE_prelnode;
iM_4_1:INTEGER;
nomoretreesM_4_1,lastmatchM_4_1:BOOLEAN;
LinitM_5,LrestM_5,LfirstM_5,LlastM_5:LSSTREE_prelnode;
iM_5:INTEGER;
nomoretreesM_5,lastmatchM_5:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
REL2:LSDOMAINT_synrel;
T3:LSSTREE_pStree;
T4:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
MU7:LSMRUQUO_ListOfStrees;
MU10:LSMRUQUO_ListOfStrees;
MU11:LSMRUQUO_ListOfStrees;
MU8:LSMRUQUO_ListOfStrees;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
PREPPREC1:LSDOMAINT_PREPPrecord;
NPVARREC1:LSDOMAINT_NPVARrecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
NPREC1:LSDOMAINT_NPrecord;
PREPPREC2:LSDOMAINT_PREPPrecord;
NPREC2:LSDOMAINT_NPrecord;
FUNCTION matchcondI9:BOOLEAN;
                                                      BEGIN
matchcondI9:=FALSE;
  IF
          ((PREPPREC2.ACTSUBCEFS *[LOC,
DIR,
OTHER]                                                <>[]                                                    )
                                                      )
THEN IF
          ((PREPPREC2.ACTSUBCEFS<>[DOORBY]                                              )
                                                      )
                                                      THEN 
matchcondI9:=TRUE;

END;{matchcondI9}
FUNCTION matchcondI8:BOOLEAN;
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
      IF s^.ls^.cat<>BIGPRO THEN
        match:=FALSE;
      IF match THEN
        ;
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
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU11(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
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
matchcondI8:=FALSE;
  IF
          ((NOT Exist1(MU8)                                       )
                                                      )
                                                      THEN 
matchcondI8:=TRUE;

END;{matchcondI8}
FUNCTION matchcondI7:BOOLEAN;
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
      IF s^.ls^.cat<>BIGPRO THEN
        match:=FALSE;
      IF match THEN
        ;
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
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU10(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
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
matchcondI7:=FALSE;
  IF
          ((NOT Exist1(MU7)                                       )
                                                      )
                                                      THEN 
matchcondI7:=TRUE;

END;{matchcondI7}
FUNCTION matchcondI6:BOOLEAN;
                                                      BEGIN
matchcondI6:=FALSE;
  IF
          ((NOT(LSMRUQUO_NEGPHRASE(T4
))                                                    )
                                                      )
                                                      THEN 
matchcondI6:=TRUE;

END;{matchcondI6}
FUNCTION matchcondI5:BOOLEAN;
                                                      BEGIN
matchcondI5:=FALSE;
  IF
          ((PREPPREC1.ACTSUBCEFS *[LOC,
DIR,
OTHER]                                                <>[]                                                    )
                                                      )
THEN IF
          ((PREPPREC1.ACTSUBCEFS<>[DOORBY]                                              )
                                                      )
                                                      THEN 
matchcondI5:=TRUE;

END;{matchcondI5}
FUNCTION matchcondI4:BOOLEAN;
                                                      BEGIN
matchcondI4:=FALSE;
  IF
          (( NOT(NPREC2.NPHEAD IN [REFLNP,
RECIPRONP,
SENTNP,
OPENINGNP]                                            )                                                     )
                                                      )
                                                      THEN 
matchcondI4:=TRUE;

END;{matchcondI4}
FUNCTION matchcondI3:BOOLEAN;
                                                      BEGIN
matchcondI3:=FALSE;
  IF
          (( NOT(NPREC1.NPHEAD IN [REFLNP,
RECIPRONP,
SENTNP,
OPENINGNP]                                            )                                                     )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
          ((NPVARREC1.INDEX =level                                )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

END;{matchcondI1}
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((LSMRUQUO_SUBSTORDERCONDITION(MU2
,MU5
,MU6
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
          ((LSMRUQUO_GSUBSTORDERCONDITION(MU2
,MU5
,MU6
,T3
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
THEN IF
          ((NOT(LSMRUQUO_NEGPHRASE(T3
))                                                    )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CLAUSE;
    N^.ls^.CLAUSEfield^ := CLAUSEREC1;
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
    PROCEDURE createSHIFTREL(VAR list:LSMRUQUO_ListOfStrees);
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
        PROCEDURE createMU3(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU3}
        copylist(MU3,list);
        END{MU3};
                                                            BEGIN{createitem11}
      createMU3(list);
      END;
      PROCEDURE createitem12(VAR list:LSMRUQUO_ListOfStrees);
        PROCEDURE createREL2(VAR list:LSMRUQUO_ListOfStrees);
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
                                                              BEGIN{REL2}
LSMATCHES_createitem(list,REL2,NPVAR,createnode,createlist1);
        END{REL2};
                                                            BEGIN{createitem12}
      createREL2(list);
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
                                                          BEGIN{SHIFTREL}
LSMATCHES_createitem(list,SHIFTREL,PREPP,createnode,createlist1);
    END{SHIFTREL};
                                                        BEGIN{createitem12}
  createSHIFTREL(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU2}
    copylist(MU2,list);
    END{MU2};
                                                        BEGIN{createitem13}
  createMU2(list);
  END;
  PROCEDURE createitem14(VAR list:LSMRUQUO_ListOfStrees);
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
      BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem11);
      END{createlist1};
                                                          BEGIN{PREDREL}
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
    END{PREDREL};
                                                        BEGIN{createitem14}
  createPREDREL(list);
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
                                                      BEGIN{createM}
m1:=MAKET_stree(CLAUSE);
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
    N^.ls^.NPfield^ := NPREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU7(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU7}
    copylist(MU7,list);
    END{MU7};
                                                        BEGIN{createitem11}
  createMU7(list);
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
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>CLAUSE THEN
      match:=FALSE;
    IF match THEN
      CLAUSEREC1:=s^.ls^.CLAUSEfield^;
  END{MatchNode};
                                                        PROCEDURE MatchList5Items
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
                                                          PROCEDURE MatchList4Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
    PROCEDURE Match_SHIFTREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>PREPP THEN
          match:=FALSE;
        IF match THEN
          PREPPREC2:=s^.ls^.PREPPfield^;
      END{MatchNode};
                                                      PROCEDURE MatchList3Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
        PROCEDURE Match_REL2(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR matchcond:BOOLEAN;
          Stree:LSSTREE_pStree;
          lisons:LISTREE_pRelnode;
          PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
          BEGIN{MatchNode}
            IF s^.ls^.cat<>NP THEN
              match:=FALSE;
            IF match THEN
              NPREC2:=s^.ls^.NPfield^;
            IF match THEN
              match:= matchcondI4;
T4:=s;
          END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            PROCEDURE Match_MU8(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            BEGIN{match}
              IF first THEN BEGIN
                MU8.first:=Lfirst;
                MU8.last:=Llast;
                match:= matchcondI8;
              END
              ELSE match:=FALSE
            END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU8(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU8(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM_2_2_1:=L;WHILE LlastM_2_2_1^.brother<>NIL DO
LlastM_2_2_1:=LlastM_2_2_1^.brother;
match_MU8(L,LlastM_2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
                    IF first THEN REL2:= Lfirst^.relation;match:=TRUE;
LSMATCHES_matchtreeConVar0rels(Lfirst^.node,first
,match,matchnode,matchlist1items,lastmatchM_2_2,matchcondI6) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_REL2(Lfirst,Llast,TRUE,match);
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
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM_2_1,LlastM_2_1
,item2,LfirstM_2_2,LlastM_2_2
,item3,LfirstM_2_3,LlastM_2_3
) ELSE BEGIN match_REL2(LfirstM_2_2,LfirstM_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM_2_1,LlastM_2_1
,item2,LfirstM_2_2,LlastM_2_2
,item3,LfirstM_2_3,LlastM_2_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtreeCon0rels(Lfirst,Llast,first,SHIFTREL
,match,matchnode,matchlist3items,lastmatchM_2,matchcondI9) END;
                                                            PROCEDURE MatchList3Items
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
                                                              PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
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
LlastM_4_1:=L;WHILE LlastM_4_1^.brother<>NIL DO
LlastM_4_1:=LlastM_4_1^.brother;
match_MU5(L,LlastM_4_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM_4) END;
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
LlastM_5,LfirstM_5,LrestM_5,nomoretreesM_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist1items,
LlastM_4,LfirstM_4,LrestM_4,nomoretreesM_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU2,matchlist2items,
LlastM_3,LfirstM_3,LrestM_3,nomoretreesM_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_SHIFTREL,matchlist3items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist4items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,SHIFTREL,PREDREL,match,matchnode,matchlist5items,lastmatch) END;
                                                      PROCEDURE ACTION23;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC2,MU8,NPREC1,MU7,[])         ;
NPVARREC1:=COPYT_NPTOVAR(NPREC2);                     ;
NPVARREC1.MOOD:=TOPICMOOD
                                                      ;
PREPPREC1:=PREPPREC2;                                 ;
PREPPREC1.MOOD:=TOPICMOOD
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION29;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC2,MU8,NPREC1,MU7,[])         ;
NPVARREC1:=COPYT_NPTOVAR(NPREC2);                     ;
PREPPREC1:=PREPPREC2;                                 ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION37;
BEGIN
LSMRUQUO_ASSDEIXISMAX(CLAUSEREC1.
DEIXIS,CLAUSEREC1.
SUPERDEIXIS,NPREC1.
SUPERDEIXIS)                                          ;
NPVARREC1.INDEX:=level
                                                      ;
NPVARREC1.GENERIC:=NOGENERIC
                                                      ;
NPREC1.GENERIC:=NOGENERIC
                                                      
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
 level:=LIMATCHES_newlevel;
 subst:=2;
 END;
IF match THEN
  BEGIN
IF ((NPREC2.GENERIC =OMEGAGENERIC                          )
                                                      )
THEN IF
          ((NPREC2.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
                                                       THEN
  BEGIN
  IF ((NPREC2.MOOD =NOWH                                     )
                                                      )
THEN IF
          ((PREPPREC2.MOOD =NOWH                                  )
                                                      )
                                                       THEN
    BEGIN
    MAKET_PREPPrec(PREPPREC1);
    MAKET_NPVARrec(NPVARREC1);
    MAKET_NPrec(NPREC1);
    action23;
    action37;
    createM1;
    createM2;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(m2,LISTREE_pstree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
    END;
  IF ((NPREC2.MOOD =WH                                       )
                                                      )
THEN IF
          ((PREPPREC2.MOOD =WH                                    )
                                                      )
                                                       THEN
    BEGIN
    MAKET_PREPPrec(PREPPREC1);
    MAKET_NPVARrec(NPVARREC1);
    MAKET_NPrec(NPREC1);
    action29;
    action37;
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
                                                      DECRSHIFTPREPNPSUBST:=result
END;
{:RSHIFTPREPNPSUBST}
{rule:}
{:RSHIFTVARPREPNPSUBST}
 FUNCTION DECRSHIFTVARPREPNPSUBST(VAR LEVEL,subst:INTEGER;
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
LinitM_2_2_1,LrestM_2_2_1,LfirstM_2_2_1,LlastM_2_2_1:LSSTREE_prelnode;
iM_2_2_1:INTEGER;
nomoretreesM_2_2_1,lastmatchM_2_2_1:BOOLEAN;
LinitM_2_3,LrestM_2_3,LfirstM_2_3,LlastM_2_3:LSSTREE_prelnode;
iM_2_3:INTEGER;
nomoretreesM_2_3,lastmatchM_2_3:BOOLEAN;
LinitM_3,LrestM_3,LfirstM_3,LlastM_3:LSSTREE_prelnode;
iM_3:INTEGER;
nomoretreesM_3,lastmatchM_3:BOOLEAN;
LinitM_4,LrestM_4,LfirstM_4,LlastM_4:LSSTREE_prelnode;
iM_4:INTEGER;
nomoretreesM_4,lastmatchM_4:BOOLEAN;
LinitM_4_1,LrestM_4_1,LfirstM_4_1,LlastM_4_1:LSSTREE_prelnode;
iM_4_1:INTEGER;
nomoretreesM_4_1,lastmatchM_4_1:BOOLEAN;
LinitM_5,LrestM_5,LfirstM_5,LlastM_5:LSSTREE_prelnode;
iM_5:INTEGER;
nomoretreesM_5,lastmatchM_5:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
REL2:LSDOMAINT_synrel;
T3:LSSTREE_pStree;
T4:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
MU7:LSMRUQUO_ListOfStrees;
MU10:LSMRUQUO_ListOfStrees;
MU11:LSMRUQUO_ListOfStrees;
MU8:LSMRUQUO_ListOfStrees;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
VARPREPPREC1:LSDOMAINT_PREPPrecord;
NPVARREC1:LSDOMAINT_NPVARrecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
NPREC1:LSDOMAINT_NPrecord;
PREPPREC1:LSDOMAINT_PREPPrecord;
NPREC2:LSDOMAINT_NPrecord;
FUNCTION matchcondI8:BOOLEAN;
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
      IF s^.ls^.cat<>BIGPRO THEN
        match:=FALSE;
      IF match THEN
        ;
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
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU11(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
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
matchcondI8:=FALSE;
  IF
          ((NOT Exist1(MU8)                                       )
                                                      )
                                                      THEN 
matchcondI8:=TRUE;

END;{matchcondI8}
FUNCTION matchcondI7:BOOLEAN;
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
      IF s^.ls^.cat<>BIGPRO THEN
        match:=FALSE;
      IF match THEN
        ;
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
Llast_1_1:=L;WHILE Llast_1_1^.brother<>NIL DO
Llast_1_1:=Llast_1_1^.brother;
match_MU10(L,Llast_1_1,TRUE,match) END END ELSE match:=FALSE END;
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
matchcondI7:=FALSE;
  IF
          ((NOT Exist1(MU7)                                       )
                                                      )
                                                      THEN 
matchcondI7:=TRUE;

END;{matchcondI7}
FUNCTION matchcondI5:BOOLEAN;
                                                      BEGIN
matchcondI5:=FALSE;
  IF
          ((NOT(LSMRUQUO_NEGPHRASE(T4
))                                                    )
                                                      )
                                                      THEN 
matchcondI5:=TRUE;

END;{matchcondI5}
FUNCTION matchcondI4:BOOLEAN;
                                                      BEGIN
matchcondI4:=FALSE;
  IF
          (( NOT(NPREC2.NPHEAD IN [REFLNP,
RECIPRONP,
SENTNP,
OPENINGNP]                                            )                                                     )
                                                      )
                                                      THEN 
matchcondI4:=TRUE;

END;{matchcondI4}
FUNCTION matchcondI3:BOOLEAN;
                                                      BEGIN
matchcondI3:=FALSE;
  IF
          (( NOT(NPREC1.NPHEAD IN [REFLNP,
RECIPRONP,
SENTNP,
OPENINGNP]                                            )                                                     )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
          ((NPVARREC1.INDEX =level                                )
                                                      )
                                                      THEN 
matchcondI1:=TRUE;

END;{matchcondI1}
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
          ((LSMRUQUO_SUBSTORDERCONDITION(MU2
,MU5
,MU6
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
          ((LSMRUQUO_GSUBSTORDERCONDITION(MU2
,MU5
,MU6
,T3
,CLAUSEREC1
.PROSUBJECT
)                                                     )
                                                      )
THEN IF
          ((NOT(LSMRUQUO_NEGPHRASE(T3
))                                                    )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CLAUSE;
    N^.ls^.CLAUSEfield^ := CLAUSEREC1;
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
    PROCEDURE createSHIFTREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := VARPREPP;
        N^.ls^.VARPREPPfield^ := VARPREPPREC1;
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
        PROCEDURE createREL2(VAR list:LSMRUQUO_ListOfStrees);
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
                                                              BEGIN{REL2}
LSMATCHES_createitem(list,REL2,NPVAR,createnode,createlist1);
        END{REL2};
                                                            BEGIN{createitem12}
      createREL2(list);
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
                                                          BEGIN{SHIFTREL}
LSMATCHES_createitem(list,SHIFTREL,VARPREPP,createnode,createlist1);
    END{SHIFTREL};
                                                        BEGIN{createitem12}
  createSHIFTREL(list);
  END;
  PROCEDURE createitem13(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU2(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU2}
    copylist(MU2,list);
    END{MU2};
                                                        BEGIN{createitem13}
  createMU2(list);
  END;
  PROCEDURE createitem14(VAR list:LSMRUQUO_ListOfStrees);
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
      BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem11);
      END{createlist1};
                                                          BEGIN{PREDREL}
LSMATCHES_createitem(list,PREDREL,VERBP,createnode,createlist1);
    END{PREDREL};
                                                        BEGIN{createitem14}
  createPREDREL(list);
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
                                                      BEGIN{createM}
m1:=MAKET_stree(CLAUSE);
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
    N^.ls^.NPfield^ := NPREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createMU7(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU7}
    copylist(MU7,list);
    END{MU7};
                                                        BEGIN{createitem11}
  createMU7(list);
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
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>CLAUSE THEN
      match:=FALSE;
    IF match THEN
      CLAUSEREC1:=s^.ls^.CLAUSEfield^;
  END{MatchNode};
                                                        PROCEDURE MatchList5Items
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
                                                          PROCEDURE MatchList4Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
    PROCEDURE Match_SHIFTREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>PREPP THEN
          match:=FALSE;
        IF match THEN
          PREPPREC1:=s^.ls^.PREPPfield^;
      END{MatchNode};
                                                      PROCEDURE MatchList3Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
        PROCEDURE Match_REL2(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR matchcond:BOOLEAN;
          Stree:LSSTREE_pStree;
          lisons:LISTREE_pRelnode;
          PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
          BEGIN{MatchNode}
            IF s^.ls^.cat<>NP THEN
              match:=FALSE;
            IF match THEN
              NPREC2:=s^.ls^.NPfield^;
            IF match THEN
              match:= matchcondI4;
T4:=s;
          END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            PROCEDURE Match_MU8(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
            BEGIN{match}
              IF first THEN BEGIN
                MU8.first:=Lfirst;
                MU8.last:=Llast;
                match:= matchcondI8;
              END
              ELSE match:=FALSE
            END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU8(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU8(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM_2_2_1:=L;WHILE LlastM_2_2_1^.brother<>NIL DO
LlastM_2_2_1:=LlastM_2_2_1^.brother;
match_MU8(L,LlastM_2_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
                    IF first THEN REL2:= Lfirst^.relation;match:=TRUE;
LSMATCHES_matchtreeConVar0rels(Lfirst^.node,first
,match,matchnode,matchlist1items,lastmatchM_2_2,matchcondI5) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_REL2(Lfirst,Llast,TRUE,match);
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
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM_2_1,LlastM_2_1
,item2,LfirstM_2_2,LlastM_2_2
,item3,LfirstM_2_3,LlastM_2_3
) ELSE BEGIN match_REL2(LfirstM_2_2,LfirstM_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM_2_1,LlastM_2_1
,item2,LfirstM_2_2,LlastM_2_2
,item3,LfirstM_2_3,LlastM_2_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,SHIFTREL
,match,matchnode,matchlist3items,lastmatchM_2) END;
                                                            PROCEDURE MatchList3Items
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
                                                              PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR
          itemmatch,listmatch:Boolean;
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
LlastM_4_1:=L;WHILE LlastM_4_1^.brother<>NIL DO
LlastM_4_1:=LlastM_4_1^.brother;
match_MU5(L,LlastM_4_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM_4) END;
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
LlastM_5,LfirstM_5,LrestM_5,nomoretreesM_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist1items,
LlastM_4,LfirstM_4,LrestM_4,nomoretreesM_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU2,matchlist2items,
LlastM_3,LfirstM_3,LrestM_3,nomoretreesM_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_SHIFTREL,matchlist3items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist4items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,SHIFTREL,PREDREL,match,matchnode,matchlist5items,lastmatch) END;
                                                      PROCEDURE ACTION23;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC2,MU8,NPREC1,MU7,[])         ;
NPVARREC1:=COPYT_NPTOVAR(NPREC2);                     ;
NPVARREC1.MOOD:=TOPICMOOD
                                                      ;
VARPREPPREC1:=PREPPREC1;                              ;
VARPREPPREC1.MOOD:=TOPICMOOD
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION29;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC2,MU8,NPREC1,MU7,[])         ;
NPVARREC1:=COPYT_NPTOVAR(NPREC2);                     ;
VARPREPPREC1:=PREPPREC1;                              ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION37;
BEGIN
LSMRUQUO_ASSDEIXISMAX(CLAUSEREC1.
DEIXIS,CLAUSEREC1.
SUPERDEIXIS,NPREC1.
SUPERDEIXIS)                                          ;
NPVARREC1.INDEX:=level
                                                      ;
NPVARREC1.GENERIC:=NOGENERIC
                                                      ;
NPREC1.GENERIC:=NOGENERIC
                                                      
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
 level:=LIMATCHES_newlevel;
 subst:=2;
 END;
IF match THEN
  BEGIN
IF ((NPREC2.GENERIC =OMEGAGENERIC                          )
                                                      )
THEN IF
          ((NPREC2.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
                                                       THEN
  BEGIN
  IF ((NPREC2.MOOD =NOWH                                     )
                                                      )
THEN IF
          ((PREPPREC1.MOOD =NOWH                                  )
                                                      )
                                                       THEN
    BEGIN
    MAKET_VARPREPPrec(VARPREPPREC1);
    MAKET_NPVARrec(NPVARREC1);
    MAKET_NPrec(NPREC1);
    action23;
    action37;
    createM1;
    createM2;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(m2,LISTREE_pstree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
    END;
  IF ((NPREC2.MOOD =WH                                       )
                                                      )
THEN IF
          ((PREPPREC1.MOOD =WH                                    )
                                                      )
                                                       THEN
    BEGIN
    MAKET_VARPREPPrec(VARPREPPREC1);
    MAKET_NPVARrec(NPVARREC1);
    MAKET_NPrec(NPREC1);
    action29;
    action37;
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
                                                      DECRSHIFTVARPREPNPSUBST:=result
END;
{:RSHIFTVARPREPNPSUBST}
