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
pragma C_include('commrules100.pf');
END;
PROGRAM comMrules100;
WITH globsubst,listree,limatches,lsmatches,
lidomaint,liiddict,lsdomaint,maket,lsstree,
copyt,mem,
gidderiv,hyperdtree,strtokey,lsmruquo,
lsauxdom,ldblex;
TYPE synrelset=SET OF LSDOMAINT_synrel;
VAR hulpstree:LISTREE_pstree;
 VPID:LSDOMAINT_synpatternsettype;
hulplsstree:LSSTREE_pstree;
 PROCEDURE commrules100_init;
BEGIN
END;
{rule:}
{:RRECIPROCALSUBST1}
 FUNCTION COMRRECIPROCALSUBST1(LEVEL:INTEGER;
ANTECEDENT:LSDOMAINT_INDEXTYPE;
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
LinitM1_2_2,LrestM1_2_2,LfirstM1_2_2,LlastM1_2_2:LSSTREE_prelnode;
iM1_2_2:INTEGER;
nomoretreesM1_2_2,lastmatchM1_2_2:BOOLEAN;
LinitM1_2_3,LrestM1_2_3,LfirstM1_2_3,LlastM1_2_3:LSSTREE_prelnode;
iM1_2_3:INTEGER;
nomoretreesM1_2_3,lastmatchM1_2_3:BOOLEAN;
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
LinitM2_1,LrestM2_1,LfirstM2_1,LlastM2_1:LSSTREE_prelnode;
iM2_1:INTEGER;
nomoretreesM2_1,lastmatchM2_1:BOOLEAN;
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
REL2:LSDOMAINT_synrel;
T1:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
SIG1:LSMRUQUO_ListOfStrees;
SIG2:LSMRUQUO_ListOfStrees;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
NPVARREC2:LSDOMAINT_NPVARrecord;
NPREC1:LSDOMAINT_NPrecord;
NPREC2:LSDOMAINT_NPrecord;
FUNCTION matchcondI7:BOOLEAN;
BEGIN
  matchcondI7:= TRUE
END;{matchcondI7}
FUNCTION matchcondI5:BOOLEAN;
FUNCTION ALL1(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
lastmatch:BOOLEAN;
      match:Boolean;
PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR matchcond:BOOLEAN;
  Stree:LSSTREE_pStree;
  lisons:LISTREE_pRelnode;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>RECIPRO THEN
      match:=FALSE;
    IF match THEN
      ;
  END{MatchNode};
                                                      BEGIN{MatchTree}
          IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatch) END;
                                                        BEGIN{All1}
    next:=mu.first;match:=TRUE;
    IF next =NIL THEN
      ALL1:=TRUE
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND (match) DO
      BEGIN
        match_HEAD(next,next,TRUE,match);
        next:=next^.brother;
      END;
      IF match THEN
      BEGIN
        match_HEAD(next,mu.last,TRUE,match);
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
  PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>RECIPRO THEN
        match:=FALSE;
      IF match THEN
        ;
    END{MatchNode};
                                                      BEGIN{MatchTree}
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
matchcondI5:=FALSE;
  IF
((ALL1(SIG2)                                            )
                                                      )
THEN IF
          ((Exist2(SIG2)                                          )
                                                      )
                                                      THEN 
matchcondI5:=TRUE;

END;{matchcondI5}
FUNCTION matchcondI3:BOOLEAN;
FUNCTION ALL1(mu:LSMRUQUO_ListOfStrees):Boolean;
  VAR next:LSSTREE_pRelNode;
lastmatch:BOOLEAN;
      match:Boolean;
PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
VAR matchcond:BOOLEAN;
  Stree:LSSTREE_pStree;
  lisons:LISTREE_pRelnode;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>RECIPRO THEN
      match:=FALSE;
    IF match THEN
      ;
  END{MatchNode};
                                                      BEGIN{MatchTree}
          IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatch) END;
                                                        BEGIN{All1}
    next:=mu.first;match:=TRUE;
    IF next =NIL THEN
      ALL1:=TRUE
    ELSE
    BEGIN
      WHILE (next<>mu.last) AND (match) DO
      BEGIN
        match_HEAD(next,next,TRUE,match);
        next:=next^.brother;
      END;
      IF match THEN
      BEGIN
        match_HEAD(next,mu.last,TRUE,match);
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
  PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>RECIPRO THEN
        match:=FALSE;
      IF match THEN
        ;
    END{MatchNode};
                                                      BEGIN{MatchTree}
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
((ALL1(SIG1)                                            )
                                                      )
THEN IF
          ((Exist2(SIG1)                                          )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI4:BOOLEAN;
                                                      BEGIN
matchcondI4:=FALSE;
  IF
((NPVARREC2.INDEX =level                                )
                                                      )
                                                      THEN 
matchcondI4:=TRUE;

END;{matchcondI4}
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
((REL2 IN [OBJREL,
INDOBJREL]                                            )
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
            IF s^.ls^.cat<>NPVAR THEN
              match:=FALSE;
            IF match THEN
              NPVARREC2:=s^.ls^.NPVARfield^;
            IF match THEN
              match:= matchcondI4;
          END{MatchNode};
                                                      BEGIN{MatchTree}
                    IF first THEN REL2:= Lfirst^.relation;match:=TRUE;
              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtreeConVar0rels(Lfirst^.node,first
,match,matchnode,matchlist0items,lastmatchM1_2_2,matchcondI2) END;
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
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) ELSE BEGIN match_REL2(LfirstM1_2_2,LfirstM1_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist3items,lastmatchM1_2) END;
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,PREDREL,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
) ELSE match_PREDREL(LfirstM1_2,LfirstM1_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,PREDREL,match,matchnode,matchlist3items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
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
LlastM2_1,LfirstM2_1,LrestM2_1,nomoretreesM2_1,iM2_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n <=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist1items,lastmatch) END;
                                                      PROCEDURE createM;
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
            N^.ls^.cat := NP;
            N^.ls^.NPfield^ := NPREC2;
          END{CreateNode};
                                                                PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          VAR list:LSMRUQUO_ListOfStrees;
          PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createSIG2(VAR list:LSMRUQUO_ListOfStrees);
            BEGIN{SIG2}
            copylist(SIG2,list);
            END{SIG2};
                                                                BEGIN{createitem21}
          createSIG2(list);
          END;
          BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem21);
          END{createlist1};
                                                              BEGIN{REL2}
LSMATCHES_createitem(list,REL2,NP,createnode,createlist1);
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
m:=MAKET_stree(CLAUSE);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                       FUNCTION subrule0X1 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitMU1_1,LrestMU1_1,LfirstMU1_1,LlastMU1_1:LSSTREE_prelnode;
iMU1_1:INTEGER;
nomoretreesMU1_1,lastmatchMU1_1:BOOLEAN;
LinitMU1_2,LrestMU1_2,LfirstMU1_2,LlastMU1_2:LSSTREE_prelnode;
iMU1_2:INTEGER;
nomoretreesMU1_2,lastmatchMU1_2:BOOLEAN;
LinitMU1_3,LrestMU1_3,LfirstMU1_3,LlastMU1_3:LSSTREE_prelnode;
iMU1_3:INTEGER;
nomoretreesMU1_3,lastmatchMU1_3:BOOLEAN;
FUNCTION MATCHCONDMU1:BOOLEAN;
BEGIN MATCHCONDMU1:=TRUE END;
  FUNCTION matchcondI8:BOOLEAN;
                                                      BEGIN
matchcondI8:=FALSE;
    IF
((LSMRUQUO_ELKAARANT(T1
)                                                     )
                                                      )
                                                      THEN 
matchcondI8:=TRUE;

  END;{matchcondI8}
  FUNCTION matchcondI3:BOOLEAN;
FUNCTION casefile1:BOOLEAN;
BEGIN IF
T1^.cat IN [
NPVAR,CNVAR] THEN CASE T1^.cat OF
NPVAR:casefile1:=(T1^.ls^.NPVARfield^.INDEX =ANTECEDENT                                          );
CNVAR:casefile1:=(T1^.ls^.CNVARfield^.INDEX =ANTECEDENT                                          );
END
END;
                                                      BEGIN
matchcondI3:=FALSE;
    IF
(((T1^.cat IN [NPVAR,
CNVAR]                                                ) AND 
((casefile1                                             )
                                                      )
                                                      )
                                                      )
THEN IF
          ((LSMRUQUO_ELKAARANT(T1
)                                                     )
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
  PROCEDURE MatchList3Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
    PROCEDURE Match_SUBJREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeConVar(Lfirst,Llast,first,SUBJREL,T1,match,matchcondI3,lastmatchMU1_2);
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
                                                            BEGIN {MatchList1Items}
        match:=FALSE;
        IF first THEN
          BEGIN 
        nomoretreesMU1_3:=False;
          LlastMU1_3:=NIL;LrestMU1_3:=L;LfirstMU1_3:=NIL;
          END
        ELSE
        BEGIN
IF LlastMU1_3=Lfinal THEN LrestMU1_3:=NIL;
          Match_MU6(LfirstMU1_3,LlastMU1_3,FALSE,match);
          IF NOT match THEN
            MatchList0Items(LrestMU1_3,FALSE,match);
        END;
        IF NOT(first OR nomoretreesMU1_3 OR match) THEN
          SelectLfirstAndLlast(LfirstMU1_3,LlastMU1_3,LrestMU1_3
,nomoretreesMU1_3,L);
        While (NOT match) AND (NOT nomoretreesMU1_3) DO
        BEGIN
          Match_MU6(LfirstMU1_3,LlastMU1_3,TRUE,itemmatch);
          IF LlastMU1_3=Lfinal THEN LrestMU1_3:=NIL;
          IF itemmatch THEN
            listmatch:=(LrestMU1_3=NIL) AND ((LfirstMU1_3<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          IF (NOT match) THEN
            SelectLfirstAndLlast(LfirstMU1_3,LlastMU1_3,LrestMU1_3
,nomoretreesMU1_3,L);
        END;{while}
      IF (LfirstMU1_3<>NIL) THEN match:=match AND (LlastMU1_3=Lfinal);
      END;{MatchList1Items}
    BEGIN {MatchList2Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesMU1_2:=False;
        LfirstMU1_2:=NIL;
        SelectLfirstAndLlast(LfirstMU1_2,LlastMU1_2,LrestMU1_2
,nomoretreesMU1_2,L);
        IF LlastMU1_2=Lfinal THEN LrestMU1_2:=NIL;
        IF NOT nomoretreesMU1_2 THEN
          BEGIN
          Match_SUBJREL(LfirstMU1_2,LlastMU1_2,TRUE,itemmatch);
          IF itemmatch THEN
            MatchList1Items(LrestMU1_2,TRUE,listmatch);
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastMU1_2=Lfinal THEN LrestMU1_2:=NIL;
        Match_SUBJREL(LfirstMU1_2,LlastMU1_2,FALSE,match);
        IF NOT match THEN
          MatchList1Items(LrestMU1_2,FALSE,match);
      END;
    END;{MatchList2Items}
  BEGIN {MatchList3Items}
    match:=FALSE;
    IF first THEN
      BEGIN 
    nomoretreesMU1_1:=False;
      LlastMU1_1:=NIL;LrestMU1_1:=L;LfirstMU1_1:=NIL;
      END
    ELSE
    BEGIN
IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
      Match_MU2(LfirstMU1_1,LlastMU1_1,FALSE,match);
      IF NOT match THEN
        MatchList2Items(LrestMU1_1,FALSE,match);
    END;
    IF NOT(first OR nomoretreesMU1_1 OR match) THEN
      SelectLfirstAndLlast(LfirstMU1_1,LlastMU1_1,LrestMU1_1
,nomoretreesMU1_1,L);
    While (NOT match) AND (NOT nomoretreesMU1_1) DO
    BEGIN
      Match_MU2(LfirstMU1_1,LlastMU1_1,TRUE,itemmatch);
      IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
      IF itemmatch THEN
        MatchList2Items(LrestMU1_1,TRUE,listmatch);
      match:=(itemmatch AND listmatch);
      IF (NOT match) THEN
        SelectLfirstAndLlast(LfirstMU1_1,LlastMU1_1,LrestMU1_1
,nomoretreesMU1_1,L);
    END;{while}
    IF match THEN IF NOT MatchcondMU1 THEN
      MatchList3Items(LrestMU1_1,FALSE,match);
  END;{MatchList3Items}
                                                        BEGIN
        lsrel1:=SUBJREL;
        lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
        lisons:=loopholes.retype(MU1.first,LISTREE_pRelnode);
        match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist3items(MU1.first,first,match);
  END;
                                                      PROCEDURE ACTION4;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC1,SIG1,NPREC2,SIG2,NPVARREC2.
CASES)                                                ;
NPREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION8;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC1,SIG1,NPREC2,SIG2,NPVARREC2.
CASES)                                                ;
NPREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION10;
BEGIN
NPREC2.GENERIC:=OMEGAGENERIC
                                                      ;
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
NPREC1loc:LSDOMAINT_NPVARrecord;
BEGIN
NPREC1loc:=COPYT_NPTOVAR(NPREC1);
result:=TRUE
AND
(NPVARREC2.req=NPREC1loc.req)AND
(NPVARREC2.env=NPREC1loc.env)AND
(NPVARREC2.superdeixis=NPREC1loc.superdeixis)AND
(NPVARREC2.class=NPREC1loc.class)AND
(NPVARREC2.deixis=NPREC1loc.deixis)AND
(NPVARREC2.aspect=NPREC1loc.aspect)AND
(NPVARREC2.retro=NPREC1loc.retro)AND
(NPVARREC2.definite=NPREC1loc.definite)AND
(NPVARREC2.person=NPREC1loc.person)AND
(NPVARREC2.number=NPREC1loc.number)AND
(NPVARREC2.genders=NPREC1loc.genders)AND
(NPVARREC2.sexes=NPREC1loc.sexes)AND
(NPVARREC2.actsubcs=NPREC1loc.actsubcs)AND
(NPVARREC2.temporal=NPREC1loc.temporal)AND
(NPVARREC2.possgeni=NPREC1loc.possgeni)AND
(NPVARREC2.animate=NPREC1loc.animate)AND
(NPVARREC2.human=NPREC1loc.human)AND
(NPVARREC2.actcomas=NPREC1loc.actcomas)AND
(NPVARREC2.thetanp=NPREC1loc.thetanp)AND
(NPVARREC2.nounpatternefs=NPREC1loc.nounpatternefs)AND
(NPVARREC2.posspred=NPREC1loc.posspred)AND
(NPVARREC2.possnietnp=NPREC1loc.possnietnp)AND
(NPVARREC2.mood=NPREC1loc.mood)AND
(NPVARREC2.generic=NPREC1loc.generic)AND
(NPVARREC2.possRform=NPREC1loc.possRform)AND
(NPVARREC2.syntquant=NPREC1loc.syntquant)AND
(NPVARREC2.NPhead=NPREC1loc.NPhead)AND
(NPVARREC2.specQ=NPREC1loc.specQ)AND
(NPVARREC2.coord=NPREC1loc.coord)
;except1:=result
END;
                                                       BEGIN{01}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchlistMU1(MU1.first,MU1.last,match,TRUE);
  IF match THEN
    BEGIN
    IF ((except1                                               )
                                                      )
THEN IF
          ((NPREC1.GENERIC =NOGENERIC                             )
                                                      )
THEN IF
          ((NPREC1.CASES =[NOMINATIVE]                                          )
                                                      )
                                                       THEN
      BEGIN
      IF ((CLAUSEREC1.DEIXIS =OMEGADEIXIS                        )
                                                      )
THEN IF
          ((NPREC1.SUPERDEIXIS =CLAUSEREC1.SUPERDEIXIS            )
                                                      )
                                                       THEN
        BEGIN
        MAKET_NPrec(NPREC2);
        action4;
        action10;
        createMU1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((CLAUSEREC1.DEIXIS<>OMEGADEIXIS                        )
                                                      )
THEN IF
          ((NPREC1.SUPERDEIXIS =CLAUSEREC1.DEIXIS                 )
                                                      )
                                                       THEN
        BEGIN
        MAKET_NPrec(NPREC2);
        action8;
        action10;
        createMU1;
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
LinitMU1_1,LrestMU1_1,LfirstMU1_1,LlastMU1_1:LSSTREE_prelnode;
iMU1_1:INTEGER;
nomoretreesMU1_1,lastmatchMU1_1:BOOLEAN;
LinitMU1_2,LrestMU1_2,LfirstMU1_2,LlastMU1_2:LSSTREE_prelnode;
iMU1_2:INTEGER;
nomoretreesMU1_2,lastmatchMU1_2:BOOLEAN;
LinitMU1_3,LrestMU1_3,LfirstMU1_3,LlastMU1_3:LSSTREE_prelnode;
iMU1_3:INTEGER;
nomoretreesMU1_3,lastmatchMU1_3:BOOLEAN;
FUNCTION MATCHCONDMU1:BOOLEAN;
BEGIN MATCHCONDMU1:=TRUE END;
  FUNCTION matchcondI8:BOOLEAN;
                                                      BEGIN
matchcondI8:=FALSE;
    IF
((LSMRUQUO_ELKAARANT(T1
)                                                     )
                                                      )
                                                      THEN 
matchcondI8:=TRUE;

  END;{matchcondI8}
  FUNCTION matchcondI3:BOOLEAN;
FUNCTION casefile1:BOOLEAN;
BEGIN IF
T1^.cat IN [
NPVAR,CNVAR] THEN CASE T1^.cat OF
NPVAR:casefile1:=(T1^.ls^.NPVARfield^.INDEX =ANTECEDENT                                          );
CNVAR:casefile1:=(T1^.ls^.CNVARfield^.INDEX =ANTECEDENT                                          );
END
END;
                                                      BEGIN
matchcondI3:=FALSE;
    IF
(((T1^.cat IN [NPVAR,
CNVAR]                                                ) AND 
((casefile1                                             )
                                                      )
                                                      )
                                                      )
THEN IF
          ((LSMRUQUO_ELKAARANT(T1
)                                                     )
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
  PROCEDURE MatchList3Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
    PROCEDURE Match_PREADVREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeConVar(Lfirst,Llast,first,PREADVREL,T1,match,matchcondI3,lastmatchMU1_2);
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
                                                            BEGIN {MatchList1Items}
        match:=FALSE;
        IF first THEN
          BEGIN 
        nomoretreesMU1_3:=False;
          LlastMU1_3:=NIL;LrestMU1_3:=L;LfirstMU1_3:=NIL;
          END
        ELSE
        BEGIN
IF LlastMU1_3=Lfinal THEN LrestMU1_3:=NIL;
          Match_MU6(LfirstMU1_3,LlastMU1_3,FALSE,match);
          IF NOT match THEN
            MatchList0Items(LrestMU1_3,FALSE,match);
        END;
        IF NOT(first OR nomoretreesMU1_3 OR match) THEN
          SelectLfirstAndLlast(LfirstMU1_3,LlastMU1_3,LrestMU1_3
,nomoretreesMU1_3,L);
        While (NOT match) AND (NOT nomoretreesMU1_3) DO
        BEGIN
          Match_MU6(LfirstMU1_3,LlastMU1_3,TRUE,itemmatch);
          IF LlastMU1_3=Lfinal THEN LrestMU1_3:=NIL;
          IF itemmatch THEN
            listmatch:=(LrestMU1_3=NIL) AND ((LfirstMU1_3<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          IF (NOT match) THEN
            SelectLfirstAndLlast(LfirstMU1_3,LlastMU1_3,LrestMU1_3
,nomoretreesMU1_3,L);
        END;{while}
      IF (LfirstMU1_3<>NIL) THEN match:=match AND (LlastMU1_3=Lfinal);
      END;{MatchList1Items}
    BEGIN {MatchList2Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesMU1_2:=False;
        LfirstMU1_2:=NIL;
        SelectLfirstAndLlast(LfirstMU1_2,LlastMU1_2,LrestMU1_2
,nomoretreesMU1_2,L);
        IF LlastMU1_2=Lfinal THEN LrestMU1_2:=NIL;
        IF NOT nomoretreesMU1_2 THEN
          BEGIN
          Match_PREADVREL(LfirstMU1_2,LlastMU1_2,TRUE,itemmatch);
          IF itemmatch THEN
            MatchList1Items(LrestMU1_2,TRUE,listmatch);
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastMU1_2=Lfinal THEN LrestMU1_2:=NIL;
        Match_PREADVREL(LfirstMU1_2,LlastMU1_2,FALSE,match);
        IF NOT match THEN
          MatchList1Items(LrestMU1_2,FALSE,match);
      END;
    END;{MatchList2Items}
  BEGIN {MatchList3Items}
    match:=FALSE;
    IF first THEN
      BEGIN 
    nomoretreesMU1_1:=False;
      LlastMU1_1:=NIL;LrestMU1_1:=L;LfirstMU1_1:=NIL;
      END
    ELSE
    BEGIN
IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
      Match_MU2(LfirstMU1_1,LlastMU1_1,FALSE,match);
      IF NOT match THEN
        MatchList2Items(LrestMU1_1,FALSE,match);
    END;
    IF NOT(first OR nomoretreesMU1_1 OR match) THEN
      SelectLfirstAndLlast(LfirstMU1_1,LlastMU1_1,LrestMU1_1
,nomoretreesMU1_1,L);
    While (NOT match) AND (NOT nomoretreesMU1_1) DO
    BEGIN
      Match_MU2(LfirstMU1_1,LlastMU1_1,TRUE,itemmatch);
      IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
      IF itemmatch THEN
        MatchList2Items(LrestMU1_1,TRUE,listmatch);
      match:=(itemmatch AND listmatch);
      IF (NOT match) THEN
        SelectLfirstAndLlast(LfirstMU1_1,LlastMU1_1,LrestMU1_1
,nomoretreesMU1_1,L);
    END;{while}
    IF match THEN IF NOT MatchcondMU1 THEN
      MatchList3Items(LrestMU1_1,FALSE,match);
  END;{MatchList3Items}
                                                        BEGIN
        lsrel1:=PREADVREL;
        lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
        lisons:=loopholes.retype(MU1.first,LISTREE_pRelnode);
        match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist3items(MU1.first,first,match);
  END;
                                                      PROCEDURE ACTION34;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC1,SIG1,NPREC2,SIG2,NPVARREC2.
CASES)                                                ;
NPREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION38;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC1,SIG1,NPREC2,SIG2,NPVARREC2.
CASES)                                                ;
NPREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION40;
BEGIN
NPREC2.GENERIC:=OMEGAGENERIC
                                                      ;
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
NPREC1loc:LSDOMAINT_NPVARrecord;
BEGIN
NPREC1loc:=COPYT_NPTOVAR(NPREC1);
result:=TRUE
AND
(NPVARREC2.req=NPREC1loc.req)AND
(NPVARREC2.env=NPREC1loc.env)AND
(NPVARREC2.superdeixis=NPREC1loc.superdeixis)AND
(NPVARREC2.class=NPREC1loc.class)AND
(NPVARREC2.deixis=NPREC1loc.deixis)AND
(NPVARREC2.aspect=NPREC1loc.aspect)AND
(NPVARREC2.retro=NPREC1loc.retro)AND
(NPVARREC2.definite=NPREC1loc.definite)AND
(NPVARREC2.person=NPREC1loc.person)AND
(NPVARREC2.number=NPREC1loc.number)AND
(NPVARREC2.genders=NPREC1loc.genders)AND
(NPVARREC2.sexes=NPREC1loc.sexes)AND
(NPVARREC2.actsubcs=NPREC1loc.actsubcs)AND
(NPVARREC2.temporal=NPREC1loc.temporal)AND
(NPVARREC2.possgeni=NPREC1loc.possgeni)AND
(NPVARREC2.animate=NPREC1loc.animate)AND
(NPVARREC2.human=NPREC1loc.human)AND
(NPVARREC2.actcomas=NPREC1loc.actcomas)AND
(NPVARREC2.thetanp=NPREC1loc.thetanp)AND
(NPVARREC2.nounpatternefs=NPREC1loc.nounpatternefs)AND
(NPVARREC2.posspred=NPREC1loc.posspred)AND
(NPVARREC2.possnietnp=NPREC1loc.possnietnp)AND
(NPVARREC2.mood=NPREC1loc.mood)AND
(NPVARREC2.generic=NPREC1loc.generic)AND
(NPVARREC2.possRform=NPREC1loc.possRform)AND
(NPVARREC2.syntquant=NPREC1loc.syntquant)AND
(NPVARREC2.NPhead=NPREC1loc.NPhead)AND
(NPVARREC2.specQ=NPREC1loc.specQ)AND
(NPVARREC2.coord=NPREC1loc.coord)
;except1:=result
END;
                                                       BEGIN{02}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchlistMU1(MU1.first,MU1.last,match,TRUE);
  IF match THEN
    BEGIN
    IF ((except1                                               )
                                                      )
THEN IF
          ((NPREC1.GENERIC =NOGENERIC                             )
                                                      )
THEN IF
          ((NPREC1.CASES =[NOMINATIVE]                                          )
                                                      )
                                                       THEN
      BEGIN
      IF ((CLAUSEREC1.DEIXIS =OMEGADEIXIS                        )
                                                      )
THEN IF
          ((NPREC1.SUPERDEIXIS =CLAUSEREC1.SUPERDEIXIS            )
                                                      )
                                                       THEN
        BEGIN
        MAKET_NPrec(NPREC2);
        action34;
        action40;
        createMU1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((CLAUSEREC1.DEIXIS<>OMEGADEIXIS                        )
                                                      )
THEN IF
          ((NPREC1.SUPERDEIXIS =CLAUSEREC1.DEIXIS                 )
                                                      )
                                                       THEN
        BEGIN
        MAKET_NPrec(NPREC2);
        action38;
        action40;
        createMU1;
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
LinitMU1_1,LrestMU1_1,LfirstMU1_1,LlastMU1_1:LSSTREE_prelnode;
iMU1_1:INTEGER;
nomoretreesMU1_1,lastmatchMU1_1:BOOLEAN;
LinitMU1_2,LrestMU1_2,LfirstMU1_2,LlastMU1_2:LSSTREE_prelnode;
iMU1_2:INTEGER;
nomoretreesMU1_2,lastmatchMU1_2:BOOLEAN;
LinitMU1_3,LrestMU1_3,LfirstMU1_3,LlastMU1_3:LSSTREE_prelnode;
iMU1_3:INTEGER;
nomoretreesMU1_3,lastmatchMU1_3:BOOLEAN;
FUNCTION MATCHCONDMU1:BOOLEAN;
BEGIN MATCHCONDMU1:=TRUE END;
  FUNCTION matchcondI8:BOOLEAN;
                                                      BEGIN
matchcondI8:=FALSE;
    IF
((LSMRUQUO_ELKAARANT(T1
)                                                     )
                                                      )
                                                      THEN 
matchcondI8:=TRUE;

  END;{matchcondI8}
  FUNCTION matchcondI3:BOOLEAN;
FUNCTION casefile1:BOOLEAN;
BEGIN IF
T1^.cat IN [
NPVAR,CNVAR] THEN CASE T1^.cat OF
NPVAR:casefile1:=(T1^.ls^.NPVARfield^.INDEX =ANTECEDENT                                          );
CNVAR:casefile1:=(T1^.ls^.CNVARfield^.INDEX =ANTECEDENT                                          );
END
END;
                                                      BEGIN
matchcondI3:=FALSE;
    IF
(((T1^.cat IN [NPVAR,
CNVAR]                                                ) AND 
((casefile1                                             )
                                                      )
                                                      )
                                                      )
THEN IF
          ((LSMRUQUO_ELKAARANT(T1
)                                                     )
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
  PROCEDURE MatchList3Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
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
    PROCEDURE Match_POSTSUBJREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeConVar(Lfirst,Llast,first,POSTSUBJREL,T1,match,matchcondI3,lastmatchMU1_2);
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
                                                            BEGIN {MatchList1Items}
        match:=FALSE;
        IF first THEN
          BEGIN 
        nomoretreesMU1_3:=False;
          LlastMU1_3:=NIL;LrestMU1_3:=L;LfirstMU1_3:=NIL;
          END
        ELSE
        BEGIN
IF LlastMU1_3=Lfinal THEN LrestMU1_3:=NIL;
          Match_MU6(LfirstMU1_3,LlastMU1_3,FALSE,match);
          IF NOT match THEN
            MatchList0Items(LrestMU1_3,FALSE,match);
        END;
        IF NOT(first OR nomoretreesMU1_3 OR match) THEN
          SelectLfirstAndLlast(LfirstMU1_3,LlastMU1_3,LrestMU1_3
,nomoretreesMU1_3,L);
        While (NOT match) AND (NOT nomoretreesMU1_3) DO
        BEGIN
          Match_MU6(LfirstMU1_3,LlastMU1_3,TRUE,itemmatch);
          IF LlastMU1_3=Lfinal THEN LrestMU1_3:=NIL;
          IF itemmatch THEN
            listmatch:=(LrestMU1_3=NIL) AND ((LfirstMU1_3<>NIL) OR (L=NIL));
          match:=(itemmatch AND listmatch);
          IF (NOT match) THEN
            SelectLfirstAndLlast(LfirstMU1_3,LlastMU1_3,LrestMU1_3
,nomoretreesMU1_3,L);
        END;{while}
      IF (LfirstMU1_3<>NIL) THEN match:=match AND (LlastMU1_3=Lfinal);
      END;{MatchList1Items}
    BEGIN {MatchList2Items}
      match:=FALSE;
      IF first THEN
        BEGIN 
      nomoretreesMU1_2:=False;
        LfirstMU1_2:=NIL;
        SelectLfirstAndLlast(LfirstMU1_2,LlastMU1_2,LrestMU1_2
,nomoretreesMU1_2,L);
        IF LlastMU1_2=Lfinal THEN LrestMU1_2:=NIL;
        IF NOT nomoretreesMU1_2 THEN
          BEGIN
          Match_POSTSUBJREL(LfirstMU1_2,LlastMU1_2,TRUE,itemmatch);
          IF itemmatch THEN
            MatchList1Items(LrestMU1_2,TRUE,listmatch);
          match:=(itemmatch AND listmatch);
          END
        END
      ELSE
      BEGIN
IF LlastMU1_2=Lfinal THEN LrestMU1_2:=NIL;
        Match_POSTSUBJREL(LfirstMU1_2,LlastMU1_2,FALSE,match);
        IF NOT match THEN
          MatchList1Items(LrestMU1_2,FALSE,match);
      END;
    END;{MatchList2Items}
  BEGIN {MatchList3Items}
    match:=FALSE;
    IF first THEN
      BEGIN 
    nomoretreesMU1_1:=False;
      LlastMU1_1:=NIL;LrestMU1_1:=L;LfirstMU1_1:=NIL;
      END
    ELSE
    BEGIN
IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
      Match_MU2(LfirstMU1_1,LlastMU1_1,FALSE,match);
      IF NOT match THEN
        MatchList2Items(LrestMU1_1,FALSE,match);
    END;
    IF NOT(first OR nomoretreesMU1_1 OR match) THEN
      SelectLfirstAndLlast(LfirstMU1_1,LlastMU1_1,LrestMU1_1
,nomoretreesMU1_1,L);
    While (NOT match) AND (NOT nomoretreesMU1_1) DO
    BEGIN
      Match_MU2(LfirstMU1_1,LlastMU1_1,TRUE,itemmatch);
      IF LlastMU1_1=Lfinal THEN LrestMU1_1:=NIL;
      IF itemmatch THEN
        MatchList2Items(LrestMU1_1,TRUE,listmatch);
      match:=(itemmatch AND listmatch);
      IF (NOT match) THEN
        SelectLfirstAndLlast(LfirstMU1_1,LlastMU1_1,LrestMU1_1
,nomoretreesMU1_1,L);
    END;{while}
    IF match THEN IF NOT MatchcondMU1 THEN
      MatchList3Items(LrestMU1_1,FALSE,match);
  END;{MatchList3Items}
                                                        BEGIN
        lsrel1:=POSTSUBJREL;
        lirel1:= loopholes.retype(lsrel1,LIDOMAINT_synrel);
        lisons:=loopholes.retype(MU1.first,LISTREE_pRelnode);
        match:= LIMATCHES_TEST1rels(lirel1,lisons,FALSE);
IF match THEN matchlist3items(MU1.first,first,match);
  END;
                                                      PROCEDURE ACTION64;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC1,SIG1,NPREC2,SIG2,NPVARREC2.
CASES)                                                ;
NPREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION68;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC1,SIG1,NPREC2,SIG2,NPVARREC2.
CASES)                                                ;
NPREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION70;
BEGIN
NPREC2.GENERIC:=OMEGAGENERIC
                                                      ;
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
NPREC1loc:LSDOMAINT_NPVARrecord;
BEGIN
NPREC1loc:=COPYT_NPTOVAR(NPREC1);
result:=TRUE
AND
(NPVARREC2.req=NPREC1loc.req)AND
(NPVARREC2.env=NPREC1loc.env)AND
(NPVARREC2.superdeixis=NPREC1loc.superdeixis)AND
(NPVARREC2.class=NPREC1loc.class)AND
(NPVARREC2.deixis=NPREC1loc.deixis)AND
(NPVARREC2.aspect=NPREC1loc.aspect)AND
(NPVARREC2.retro=NPREC1loc.retro)AND
(NPVARREC2.definite=NPREC1loc.definite)AND
(NPVARREC2.person=NPREC1loc.person)AND
(NPVARREC2.number=NPREC1loc.number)AND
(NPVARREC2.genders=NPREC1loc.genders)AND
(NPVARREC2.sexes=NPREC1loc.sexes)AND
(NPVARREC2.actsubcs=NPREC1loc.actsubcs)AND
(NPVARREC2.temporal=NPREC1loc.temporal)AND
(NPVARREC2.possgeni=NPREC1loc.possgeni)AND
(NPVARREC2.animate=NPREC1loc.animate)AND
(NPVARREC2.human=NPREC1loc.human)AND
(NPVARREC2.actcomas=NPREC1loc.actcomas)AND
(NPVARREC2.thetanp=NPREC1loc.thetanp)AND
(NPVARREC2.nounpatternefs=NPREC1loc.nounpatternefs)AND
(NPVARREC2.posspred=NPREC1loc.posspred)AND
(NPVARREC2.possnietnp=NPREC1loc.possnietnp)AND
(NPVARREC2.mood=NPREC1loc.mood)AND
(NPVARREC2.generic=NPREC1loc.generic)AND
(NPVARREC2.possRform=NPREC1loc.possRform)AND
(NPVARREC2.syntquant=NPREC1loc.syntquant)AND
(NPVARREC2.NPhead=NPREC1loc.NPhead)AND
(NPVARREC2.specQ=NPREC1loc.specQ)AND
(NPVARREC2.coord=NPREC1loc.coord)
;except1:=result
END;
                                                       BEGIN{03}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
 matchlistMU1(MU1.first,MU1.last,match,TRUE);
  IF match THEN
    BEGIN
    IF ((except1                                               )
                                                      )
THEN IF
          ((NPREC1.GENERIC =NOGENERIC                             )
                                                      )
THEN IF
          ((NPREC1.CASES =[NOMINATIVE]                                          )
                                                      )
                                                       THEN
      BEGIN
      IF ((CLAUSEREC1.DEIXIS =OMEGADEIXIS                        )
                                                      )
THEN IF
          ((NPREC1.SUPERDEIXIS =CLAUSEREC1.SUPERDEIXIS            )
                                                      )
                                                       THEN
        BEGIN
        MAKET_NPrec(NPREC2);
        action64;
        action70;
        createMU1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((CLAUSEREC1.DEIXIS<>OMEGADEIXIS                        )
                                                      )
THEN IF
          ((NPREC1.SUPERDEIXIS =CLAUSEREC1.DEIXIS                 )
                                                      )
                                                       THEN
        BEGIN
        MAKET_NPrec(NPREC2);
        action68;
        action70;
        createMU1;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
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
COMRRECIPROCALSUBST1:=result
END;
{:RRECIPROCALSUBST1}
{rule:}
{:FPRERECIPRO1}
 FUNCTION COMFPRERECIPRO1(Is:LISTREE_pStree):LISTREE_pstree;VAR result:LISTREE_pStree;
 m:LSSTREE_pstree;
 match:BOOLEAN;
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
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
MU4:LSMRUQUO_ListOfStrees;
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
NPREC1:LSDOMAINT_NPrecord;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
FUNCTION matchcondI11:BOOLEAN;
                                                      BEGIN
matchcondI11:=FALSE;
  IF
((NPREC1.NPHEAD =ELKAARNP                               )
                                                      )
                                                      THEN 
matchcondI11:=TRUE;

END;{matchcondI11}
FUNCTION matchcondM:BOOLEAN;
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
  PROCEDURE Match_(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>NP THEN
        match:=FALSE;
      IF match THEN
        NPREC1:=s^.ls^.NPfield^;
      IF match THEN
        match:= matchcondI11;
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
        match:=TRUE;
    IF match THEN
    BEGIN
      Stree:=Lfirst^.node;
      IF first THEN
      BEGIN
        MatchNode(Stree,match);
      IF match THEN
        BEGIN
        END;
        IF match THEN
        BEGIN
          MatchList1Items(Stree^.sons,TRUE,match);
        END
      END
      ELSE
        BEGIN
          IF lastmatch_1 THEN
          MatchList1Items(Stree^.sons,FALSE,match)
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
  PROCEDURE Match_(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR matchcond:BOOLEAN;
    Stree:LSSTREE_pStree;
    lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>NP THEN
        match:=FALSE;
      IF match THEN
        NPREC1:=s^.ls^.NPfield^;
      IF match THEN
        match:= matchcondI11;
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
        match:=TRUE;
    IF match THEN
    BEGIN
      Stree:=Lfirst^.node;
      IF first THEN
      BEGIN
        MatchNode(Stree,match);
      IF match THEN
        BEGIN
        END;
        IF match THEN
        BEGIN
          MatchList1Items(Stree^.sons,TRUE,match);
        END
      END
      ELSE
        BEGIN
          IF lastmatch_1 THEN
          MatchList1Items(Stree^.sons,FALSE,match)
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
Linit_1_1,Lrest_1_1,Lfirst_1_1,Llast_1_1:LSSTREE_prelnode;
i_1_1:INTEGER;
nomoretrees_1_1,lastmatch_1_1:BOOLEAN;
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
      IF s^.ls^.cat<>NP THEN
        match:=FALSE;
      IF match THEN
        NPREC1:=s^.ls^.NPfield^;
      IF match THEN
        match:= matchcondI11;
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
        match:=TRUE;
    IF match THEN
    BEGIN
      Stree:=Lfirst^.node;
      IF first THEN
      BEGIN
        MatchNode(Stree,match);
      IF match THEN
        BEGIN
        END;
        IF match THEN
        BEGIN
          MatchList1Items(Stree^.sons,TRUE,match);
        END
      END
      ELSE
        BEGIN
          IF lastmatch_1 THEN
          MatchList1Items(Stree^.sons,FALSE,match)
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
                                                      BEGIN
matchcondM:=FALSE;
  IF
((Exist1(MU1)                                           )
OR
          (Exist2(MU2)                                           )
OR
          (Exist3(MU3)                                           )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
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
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_PREDREL(Lfirst,Llast,TRUE,match);
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
BEGIN IF first THEN LSMATCHES_MUMfirst(L,match,item1,LfirstM_1,LlastM_1
,PREDREL,item2,LfirstM_2,LlastM_2
,item3,LfirstM_3,LlastM_3
) ELSE match_PREDREL(LfirstM_2,LfirstM_2,FALSE,match) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,PREDREL,match,matchnode,matchlist3items,lastmatch) END;
                                                      BEGIN
result:=Is;
m:=loopholes.retype(Is,LSSTREE_pstree);
match:= TRUE;
MatchModel(m,TRUE,match);
  If match Then
  WHILE match AND NOT matchcondM DO
  BEGIN
  MatchModel(m,FALSE,match);
  END;
 IF match THEN BEGIN
  IF ((TRUE                                                  )
                                                      )
                                                       THEN
    BEGIN
    result:=NIL;
    END;
                                                       END;
COMFPRERECIPRO1:=result
END;
{:FPRERECIPRO1}
