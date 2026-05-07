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
pragma C_include('drawstree.pf');
PACKAGE comMrules;
WITH listree,lsdomaint;
pragma C_include('commrules16.pf');
END;
PROGRAM comMrules16;
WITH globsubst,listree,limatches,lsmatches,
lidomaint,liiddict,lsdomaint,maket,lsstree,
copyt,mem,drawstree,
gidderiv,hyperdtree,strtokey,lsmruquo,
lsauxdom,ldblex;
TYPE synrelset=SET OF LSDOMAINT_synrel;
VAR hulpstree:LISTREE_pstree;
 VPID:LSDOMAINT_synpatternsettype;
hulplsstree:LSSTREE_pstree;
 PROCEDURE commrules16_init;
BEGIN
END;
{rule:}
{:ROBJNPSUBST}
 FUNCTION COMROBJNPSUBST(LEVEL:INTEGER;
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
            IF s^.ls^.cat<>NPVAR THEN
              match:=FALSE;
            IF match THEN
              NPVARREC1:=s^.ls^.NPVARfield^;
            IF match THEN
              match:= matchcondI1;
          END{MatchNode};
                                                      BEGIN{MatchTree}
                    IF first THEN REL1:= Lfirst^.relation;match:=TRUE;
              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtreeConVar0rels(Lfirst^.node,first
,match,matchnode,matchlist0items,lastmatchM1_2_2,matchcondI2) END;
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
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) ELSE BEGIN match_REL1(LfirstM1_2_2,LfirstM1_2_2,FALSE,match);
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
    IF match THEN
      match:= matchcondI3;
T3:=s;
  END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    PROCEDURE Match_MU5(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU5.first:=Lfirst;
        MU5.last:=Llast;
        match:= matchcondI5;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU5(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU5(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM2_1:=L;WHILE LlastM2_1^.brother<>NIL DO
LlastM2_1:=LlastM2_1^.brother;
match_MU5(L,LlastM2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist1items,lastmatch) END;
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
            N^.ls^.cat := NP;
            N^.ls^.NPfield^ := NPREC2;
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
                                                              BEGIN{REL1}
LSMATCHES_createitem(list,REL1,NP,createnode,createlist1);
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
m:=MAKET_stree(CLAUSE);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION1;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC1,MU5,NPREC2,MU6,NPVARREC1.
CASES)                                                ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION3;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC1,MU5,NPREC2,MU6,NPVARREC1.
CASES)                                                ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION6;
BEGIN
NPREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
NPREC2.GENERIC:=OMEGAGENERIC
                                                      
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
(NPVARREC1.animate=NPREC1loc.animate)AND
(NPVARREC1.human=NPREC1loc.human)AND
(NPVARREC1.actcomas=NPREC1loc.actcomas)AND
(NPVARREC1.thetanp=NPREC1loc.thetanp)AND
(NPVARREC1.nounpatternefs=NPREC1loc.nounpatternefs)AND
(NPVARREC1.mood=NPREC1loc.mood)AND
(NPVARREC1.generic=NPREC1loc.generic)AND
(NPVARREC1.posspred=NPREC1loc.posspred)AND
(NPVARREC1.possnietnp=NPREC1loc.possnietnp)AND
(NPVARREC1.syntquant=NPREC1loc.syntquant)AND
(NPVARREC1.NPhead=NPREC1loc.NPhead)AND
(NPVARREC1.specQ=NPREC1loc.specQ)AND
(NPVARREC1.poss=NPREC1loc.poss)AND
(NPVARREC1.coord=NPREC1loc.coord)
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
    WHILE match AND NOT matchcondM2 DO
    BEGIN
    MatchModel2(m2,FALSE,match);
    END;
    If match Then
    BEGIN
 END;
IF match THEN
  BEGIN
  IF ((except1                                               )
                                                      )
THEN IF
          ((NPREC1.CASES =[]                                                    )
                                                      )
THEN IF
          ((NPREC1.GENERIC =NOGENERIC                             )
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
      action1;
      action6;
      createM;
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
      action3;
      action6;
      createM;
      Is:=loopholes.retype(m,LISTREE_pstree);
      LISTREE_appendstreebonus(Is,result,wbonus);
      END;
                                                          END;
                                                        END;
                                                          END;
COMROBJNPSUBST:=result
END;
{:ROBJNPSUBST}
{rule:}
{:RSUBJNPSUBST}
 FUNCTION COMRSUBJNPSUBST(LEVEL:INTEGER;
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
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
LinitM1_4,LrestM1_4,LfirstM1_4,LlastM1_4:LSSTREE_prelnode;
iM1_4:INTEGER;
nomoretreesM1_4,lastmatchM1_4:BOOLEAN;
LinitM1_4_1,LrestM1_4_1,LfirstM1_4_1,LlastM1_4_1:LSSTREE_prelnode;
iM1_4_1:INTEGER;
nomoretreesM1_4_1,lastmatchM1_4_1:BOOLEAN;
LinitM1_5,LrestM1_5,LfirstM1_5,LlastM1_5:LSSTREE_prelnode;
iM1_5:INTEGER;
nomoretreesM1_5,lastmatchM1_5:BOOLEAN;
LinitM2_1,LrestM2_1,LfirstM2_1,LlastM2_1:LSSTREE_prelnode;
iM2_1:INTEGER;
nomoretreesM2_1,lastmatchM2_1:BOOLEAN;
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
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
writeln('NOT Exist2(MU2) ',NOT Exist2(MU2));
writeln('COPYT_id79([CLAUSEREC1.THETAVP])*[VP010,VP012]=[] ',
COPYT_id79([CLAUSEREC1.THETAVP])                       *[VP010,
VP012]                                                 =[]);
writeln('CLAUSEREC1.SYNVPEFS *LSAUXDOM_RAISINGVPS=[] ',CLAUSEREC1.SYNVPEFS *LSAUXDOM_RAISINGVPS=[]);
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
BEGIN matchcondM2:=TRUE;
writeln('matchcondition M2 TRUE') END
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
writeln('>matchcondM1');
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
writeln('CLAUSEREC1.PROSUBJECT =FALSE ',CLAUSEREC1.PROSUBJECT =FALSE);
writeln('imply1 ',imply1);
writeln('imply3 ',imply3);
END;{matchcondM1}
                                                      PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
if match then writeln('CLAUSEREC1.PROSUBJECT ',CLAUSEREC1.PROSUBJECT);  
if match then writeln('CLAUSEREC1.PROSUBJECT =FALSE ',CLAUSEREC1.PROSUBJECT =FALSE);
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
        IF s^.ls^.cat<>NPVAR THEN
          match:=FALSE;
        IF match THEN
          NPVARREC1:=s^.ls^.NPVARfield^;
        IF match THEN
          match:= matchcondI1;
      END{MatchNode};
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,SUBJREL
,match,matchnode,matchlist0items,lastmatchM1_2) END;
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
LlastM1_4_1:=L;WHILE LlastM1_4_1^.brother<>NIL DO
LlastM1_4_1:=LlastM1_4_1^.brother;
match_MU3(L,LlastM1_4_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM1_4) END;
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
BEGIN IF first THEN LSMATCHES_MUMUMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,SUBJREL,item2,LfirstM1_2,LlastM1_2
,item3,LfirstM1_3,LlastM1_3
,PREDREL,item4,LfirstM1_4,LlastM1_4
,item5,LfirstM1_5,LlastM1_5
) ELSE BEGIN match_SUBJREL(LfirstM1_2,LfirstM1_2,FALSE,match);
IF NOT match THEN match_PREDREL(LfirstM1_4,LfirstM1_4,FALSE,match) END END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,SUBJREL,PREDREL,match,matchnode,matchlist5items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>NP THEN
      match:=FALSE;
    IF match THEN
      NPREC1:=s^.ls^.NPfield^;
    IF match THEN
      match:= matchcondI3;
T3:=s;
  END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    PROCEDURE Match_MU5(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU5.first:=Lfirst;
        MU5.last:=Llast;
        match:= matchcondI5;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU5(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU5(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM2_1:=L;WHILE LlastM2_1^.brother<>NIL DO
LlastM2_1:=LlastM2_1^.brother;
match_MU5(L,LlastM2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist1items,lastmatch) END;
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
    PROCEDURE createSUBJREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := NP;
        N^.ls^.NPfield^ := NPREC2;
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
                                                          BEGIN{SUBJREL}
LSMATCHES_createitem(list,SUBJREL,NP,createnode,createlist1);
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
m:=MAKET_stree(CLAUSE);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION1;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC1,MU5,NPREC2,MU6,NPVARREC1.
CASES)                                                ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION3;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC1,MU5,NPREC2,MU6,NPVARREC1.
CASES)                                                ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION4;
BEGIN

END;
                                                      PROCEDURE ACTION6;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC1,MU5,NPREC2,MU6,NPVARREC1.
CASES)                                                ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION8;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC1,MU5,NPREC2,MU6,NPVARREC1.
CASES)                                                ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION9;
BEGIN

END;
                                                      PROCEDURE ACTION12;
BEGIN
NPREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
NPREC2.GENERIC:=OMEGAGENERIC
                                                      
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
(NPVARREC1.animate=NPREC1loc.animate)AND
(NPVARREC1.human=NPREC1loc.human)AND
(NPVARREC1.actcomas=NPREC1loc.actcomas)AND
(NPVARREC1.thetanp=NPREC1loc.thetanp)AND
(NPVARREC1.nounpatternefs=NPREC1loc.nounpatternefs)AND
(NPVARREC1.mood=NPREC1loc.mood)AND
(NPVARREC1.generic=NPREC1loc.generic)AND
(NPVARREC1.posspred=NPREC1loc.posspred)AND
(NPVARREC1.possnietnp=NPREC1loc.possnietnp)AND
(NPVARREC1.syntquant=NPREC1loc.syntquant)AND
(NPVARREC1.NPhead=NPREC1loc.NPhead)AND
(NPVARREC1.specQ=NPREC1loc.specQ)AND
(NPVARREC1.poss=NPREC1loc.poss)AND
(NPVARREC1.coord=NPREC1loc.coord)
;except1:=result
END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
m2:=loopholes.retype(Is2,LSSTREE_pStree);
match:= TRUE;
  first:=TRUE;
  WHILE match DO BEGIN
  MatchModel1(m1,first,match);
  writeln('match model m1 ',match);
first:=FALSE;
  If match Then
  WHILE match AND NOT matchcondM1 DO
  BEGIN
  MatchModel1(m1,FALSE,match);
  writeln('match model m1 ',match);
  END;
  If match Then
  BEGIN
    first:=TRUE;
    WHILE match DO BEGIN
    MatchModel2(m2,first,match);
  writeln('match model m2 ',match);
first:=FALSE;
    If match Then
    WHILE match AND NOT matchcondM2 DO
    BEGIN
    MatchModel2(m2,FALSE,match);
  writeln('match model m2 ',match);
    END;
    If match Then
    BEGIN
 END;
IF match THEN
  BEGIN
  IF ((except1                                               )
                                                      )
THEN IF
          ((NPREC1.CASES =[]                                                    )
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
      IF ((NPREC1.GENERIC =NOGENERIC                             )
                                                      )
THEN IF
          ((COPYT_id58([NPREC1.NPHEAD])                            *[ONENP,
THEYNP]                                                =[]                                                    )
                                                      )
                                                       THEN
        BEGIN
        MAKET_NPrec(NPREC2);
        action1;
        action4;
        action12;
        createM;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((NPREC1.GENERIC =YESGENERIC                            )
                                                      )
THEN IF
          ((COPYT_id58([NPREC1.NPHEAD])                            *[ONENP,
THEYNP]                                               <>[]                                                    )
                                                      )
                                                       THEN
        BEGIN
        MAKET_NPrec(NPREC2);
        action3;
        action4;
        action12;
        createM;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
    IF ((CLAUSEREC1.DEIXIS<>OMEGADEIXIS                        )
                                                      )
THEN IF
          ((NPREC1.SUPERDEIXIS =CLAUSEREC1.DEIXIS                 )
                                                      )
                                                       THEN
      BEGIN
      IF ((NPREC1.GENERIC =NOGENERIC                             )
                                                      )
THEN IF
          ((COPYT_id58([NPREC1.NPHEAD])                            *[ONENP,
THEYNP]                                                =[]                                                    )
                                                      )
                                                       THEN
        BEGIN
        MAKET_NPrec(NPREC2);
        action6;
        action9;
        action12;
        createM;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((NPREC1.GENERIC =YESGENERIC                            )
                                                      )
THEN IF
          ((COPYT_id58([NPREC1.NPHEAD])                            *[ONENP,
THEYNP]                                               <>[]                                                    )
                                                      )
                                                       THEN
        BEGIN
        MAKET_NPrec(NPREC2);
        action8;
        action9;
        action12;
        createM;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                        END;
                                                      END;{WHILE}
match:=TRUE;
END;{IF}
END;{WHILE}
COMRSUBJNPSUBST:=result
END;
{:RSUBJNPSUBST}
{rule:}
{:RSHIFTNPSUBST}
 FUNCTION COMRSHIFTNPSUBST(LEVEL:INTEGER;
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
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
LinitM1_4,LrestM1_4,LfirstM1_4,LlastM1_4:LSSTREE_prelnode;
iM1_4:INTEGER;
nomoretreesM1_4,lastmatchM1_4:BOOLEAN;
LinitM1_4_1,LrestM1_4_1,LfirstM1_4_1,LlastM1_4_1:LSSTREE_prelnode;
iM1_4_1:INTEGER;
nomoretreesM1_4_1,lastmatchM1_4_1:BOOLEAN;
LinitM1_5,LrestM1_5,LfirstM1_5,LlastM1_5:LSSTREE_prelnode;
iM1_5:INTEGER;
nomoretreesM1_5,lastmatchM1_5:BOOLEAN;
LinitM2_1,LrestM2_1,LfirstM2_1,LlastM2_1:LSSTREE_prelnode;
iM2_1:INTEGER;
nomoretreesM2_1,lastmatchM2_1:BOOLEAN;
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
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
                                                      PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
        IF s^.ls^.cat<>NPVAR THEN
          match:=FALSE;
        IF match THEN
          NPVARREC1:=s^.ls^.NPVARfield^;
        IF match THEN
          match:= matchcondI1;
      END{MatchNode};
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,SHIFTREL
,match,matchnode,matchlist0items,lastmatchM1_2) END;
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
LlastM1_4_1:=L;WHILE LlastM1_4_1^.brother<>NIL DO
LlastM1_4_1:=LlastM1_4_1^.brother;
match_MU3(L,LlastM1_4_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM1_4) END;
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
LlastM1_5,LfirstM1_5,LrestM1_5,nomoretreesM1_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist1items,
LlastM1_4,LfirstM1_4,LrestM1_4,nomoretreesM1_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU2,matchlist2items,
LlastM1_3,LfirstM1_3,LrestM1_3,nomoretreesM1_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_SHIFTREL,matchlist3items,
LlastM1_2,LfirstM1_2,LrestM1_2,nomoretreesM1_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist4items,
LlastM1_1,LfirstM1_1,LrestM1_1,nomoretreesM1_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,SHIFTREL,PREDREL,match,matchnode,matchlist5items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>NP THEN
      match:=FALSE;
    IF match THEN
      NPREC1:=s^.ls^.NPfield^;
    IF match THEN
      match:= matchcondI3;
T3:=s;
  END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    PROCEDURE Match_MU5(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU5.first:=Lfirst;
        MU5.last:=Llast;
        match:= matchcondI5;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU5(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU5(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM2_1:=L;WHILE LlastM2_1^.brother<>NIL DO
LlastM2_1:=LlastM2_1^.brother;
match_MU5(L,LlastM2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist1items,lastmatch) END;
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
    PROCEDURE createSHIFTREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := NP;
        N^.ls^.NPfield^ := NPREC2;
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
                                                          BEGIN{SHIFTREL}
LSMATCHES_createitem(list,SHIFTREL,NP,createnode,createlist1);
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
m:=MAKET_stree(CLAUSE);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION1;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC1,MU5,NPREC2,MU6,NPVARREC1.
CASES)                                                ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION3;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC1,MU5,NPREC2,MU6,NPVARREC1.
CASES)                                                ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION6;
BEGIN
NPREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
NPREC2.GENERIC:=OMEGAGENERIC
                                                      
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
(NPVARREC1.animate=NPREC1loc.animate)AND
(NPVARREC1.human=NPREC1loc.human)AND
(NPVARREC1.actcomas=NPREC1loc.actcomas)AND
(NPVARREC1.thetanp=NPREC1loc.thetanp)AND
(NPVARREC1.nounpatternefs=NPREC1loc.nounpatternefs)AND
(NPVARREC1.generic=NPREC1loc.generic)AND
(NPVARREC1.posspred=NPREC1loc.posspred)AND
(NPVARREC1.possnietnp=NPREC1loc.possnietnp)AND
(NPVARREC1.syntquant=NPREC1loc.syntquant)AND
(NPVARREC1.NPhead=NPREC1loc.NPhead)AND
(NPVARREC1.specQ=NPREC1loc.specQ)AND
(NPVARREC1.poss=NPREC1loc.poss)AND
(NPVARREC1.coord=NPREC1loc.coord)
;except1:=result
END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
m2:=loopholes.retype(Is2,LSSTREE_pStree);
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
    first:=TRUE;
    WHILE match DO BEGIN
    MatchModel2(m2,first,match);
first:=FALSE;
    If match Then
    WHILE match AND NOT matchcondM2 DO
    BEGIN
    MatchModel2(m2,FALSE,match);
    END;
    If match Then
    BEGIN
 END;
IF match THEN
  BEGIN
  IF ((except1                                               )
                                                      )
THEN IF
          ((NPREC1.CASES =[]                                                    )
                                                      )
THEN IF
          ((NPREC1.GENERIC =NOGENERIC                             )
                                                      )
THEN IF
          ((NPREC1.CLASS<>FREQUENTIAL                             )
                                                      )
THEN IF
          ((LSMRUQUO_DEIXISMAX(CLAUSEREC1
.DEIXIS
,CLAUSEREC1
.SUPERDEIXIS
,NPREC1
.SUPERDEIXIS
)                                                     )
                                                      )
                                                       THEN
    BEGIN
    IF ((NPVARREC1.MOOD =TOPICMOOD                             )
                                                      )
THEN IF
          ((NPREC1.MOOD =NOWH                                     )
                                                      )
                                                       THEN
      BEGIN
      MAKET_NPrec(NPREC2);
      action1;
      action6;
      createM;
      Is:=loopholes.retype(m,LISTREE_pstree);
      LISTREE_appendstreebonus(Is,result,wbonus);
      END;
    IF ((NPVARREC1.MOOD =WH                                    )
                                                      )
THEN IF
          ((NPREC1.MOOD =WH                                       )
                                                      )
                                                       THEN
      BEGIN
      MAKET_NPrec(NPREC2);
      action3;
      action6;
      createM;
      Is:=loopholes.retype(m,LISTREE_pstree);
      LISTREE_appendstreebonus(Is,result,wbonus);
      END;
                                                          END;
                                                        END;
                                                      END;{WHILE}
match:=TRUE;
END;{IF}
END;{WHILE}
COMRSHIFTNPSUBST:=result
END;
{:RSHIFTNPSUBST}
{rule:}
{:RPREPNPSUBST}
 FUNCTION COMRPREPNPSUBST(LEVEL:INTEGER;
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
LinitM1_2_2_1,LrestM1_2_2_1,LfirstM1_2_2_1,LlastM1_2_2_1:LSSTREE_prelnode;
iM1_2_2_1:INTEGER;
nomoretreesM1_2_2_1,lastmatchM1_2_2_1:BOOLEAN;
LinitM1_2_2_2,LrestM1_2_2_2,LfirstM1_2_2_2,LlastM1_2_2_2:LSSTREE_prelnode;
iM1_2_2_2:INTEGER;
nomoretreesM1_2_2_2,lastmatchM1_2_2_2:BOOLEAN;
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
              PREPPREC1:=s^.ls^.PREPPfield^;
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
                IF s^.ls^.cat<>NPVAR THEN
                  match:=FALSE;
                IF match THEN
                  NPVARREC1:=s^.ls^.NPVARfield^;
                IF match THEN
                  match:= matchcondI1;
              END{MatchNode};
                                                      BEGIN{MatchTree}
                            IF first THEN REL2:= Lfirst^.relation;match:=TRUE;
                  IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtreeVar0rels(Lfirst^.node,first
,match,matchnode,matchlist0items,lastmatchM1_2_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_REL2(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM1_2_2_1,LlastM1_2_2_1
,item2,LfirstM1_2_2_2,LlastM1_2_2_2
) ELSE match_REL2(LfirstM1_2_2_2,LfirstM1_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                    IF first THEN REL1:= Lfirst^.relation;match:=TRUE;
              IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtreeConVar0rels(Lfirst^.node,first
,match,matchnode,matchlist2items,lastmatchM1_2_2,matchcondI2) END;
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
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) ELSE BEGIN match_REL1(LfirstM1_2_2,LfirstM1_2_2,FALSE,match);
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
    IF match THEN
      match:= matchcondI3;
T3:=s;
  END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    PROCEDURE Match_MU7(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU7.first:=Lfirst;
        MU7.last:=Llast;
        match:= matchcondI7;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU7(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU7(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM2_1:=L;WHILE LlastM2_1^.brother<>NIL DO
LlastM2_1:=LlastM2_1^.brother;
match_MU7(L,LlastM2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist1items,lastmatch) END;
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
            N^.ls^.PREPPfield^ := PREPPREC2;
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
                N^.ls^.cat := NP;
                N^.ls^.NPfield^ := NPREC2;
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
                                                                  BEGIN{REL2}
LSMATCHES_createitem(list,REL2,NP,createnode,createlist1);
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
m:=MAKET_stree(CLAUSE);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION1;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC1,MU7,NPREC2,MU8,NPVARREC1.
CASES)                                                ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION3;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC1,MU7,NPREC2,MU8,NPVARREC1.
CASES)                                                ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION8;
BEGIN
NPREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
NPREC2.GENERIC:=OMEGAGENERIC
                                                      ;
PREPPREC2:=PREPPREC1;                                 
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
(NPVARREC1.animate=NPREC1loc.animate)AND
(NPVARREC1.human=NPREC1loc.human)AND
(NPVARREC1.actcomas=NPREC1loc.actcomas)AND
(NPVARREC1.thetanp=NPREC1loc.thetanp)AND
(NPVARREC1.nounpatternefs=NPREC1loc.nounpatternefs)AND
(NPVARREC1.mood=NPREC1loc.mood)AND
(NPVARREC1.generic=NPREC1loc.generic)AND
(NPVARREC1.posspred=NPREC1loc.posspred)AND
(NPVARREC1.possnietnp=NPREC1loc.possnietnp)AND
(NPVARREC1.syntquant=NPREC1loc.syntquant)AND
(NPVARREC1.NPhead=NPREC1loc.NPhead)AND
(NPVARREC1.specQ=NPREC1loc.specQ)AND
(NPVARREC1.poss=NPREC1loc.poss)AND
(NPVARREC1.coord=NPREC1loc.coord)
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
    WHILE match AND NOT matchcondM2 DO
    BEGIN
    MatchModel2(m2,FALSE,match);
    END;
    If match Then
    BEGIN
 END;
IF match THEN
  BEGIN
  IF ((except1                                               )
                                                      )
THEN IF
          ((NPREC1.CASES =[]                                                    )
                                                      )
THEN IF
          ((NPREC1.GENERIC =NOGENERIC                             )
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
      MAKET_PREPPrec(PREPPREC2);
      MAKET_NPrec(NPREC2);
      action1;
      action8;
      createM;
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
      MAKET_PREPPrec(PREPPREC2);
      MAKET_NPrec(NPREC2);
      action3;
      action8;
      createM;
      Is:=loopholes.retype(m,LISTREE_pstree);
      LISTREE_appendstreebonus(Is,result,wbonus);
      END;
                                                          END;
                                                        END;
                                                          END;
COMRPREPNPSUBST:=result
END;
{:RPREPNPSUBST}
{rule:}
{:RVARPREPNPSUBST}
 FUNCTION COMRVARPREPNPSUBST(LEVEL:INTEGER;
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
LinitM1_2_2_1,LrestM1_2_2_1,LfirstM1_2_2_1,LlastM1_2_2_1:LSSTREE_prelnode;
iM1_2_2_1:INTEGER;
nomoretreesM1_2_2_1,lastmatchM1_2_2_1:BOOLEAN;
LinitM1_2_2_2,LrestM1_2_2_2,LfirstM1_2_2_2,LlastM1_2_2_2:LSSTREE_prelnode;
iM1_2_2_2:INTEGER;
nomoretreesM1_2_2_2,lastmatchM1_2_2_2:BOOLEAN;
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
            IF s^.ls^.cat<>VARPREPP THEN
              match:=FALSE;
            IF match THEN
              VARPREPPREC1:=s^.ls^.VARPREPPfield^;
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
                IF s^.ls^.cat<>NPVAR THEN
                  match:=FALSE;
                IF match THEN
                  NPVARREC1:=s^.ls^.NPVARfield^;
                IF match THEN
                  match:= matchcondI1;
              END{MatchNode};
                                                      BEGIN{MatchTree}
                            IF first THEN REL2:= Lfirst^.relation;match:=TRUE;
                  IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtreeVar0rels(Lfirst^.node,first
,match,matchnode,matchlist0items,lastmatchM1_2_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_REL2(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM1_2_2_1,LlastM1_2_2_1
,item2,LfirstM1_2_2_2,LlastM1_2_2_2
) ELSE match_REL2(LfirstM1_2_2_2,LfirstM1_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                    IF first THEN REL1:= Lfirst^.relation;match:=TRUE;
              IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtreeConVar0rels(Lfirst^.node,first
,match,matchnode,matchlist2items,lastmatchM1_2_2,matchcondI2) END;
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
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) ELSE BEGIN match_REL1(LfirstM1_2_2,LfirstM1_2_2,FALSE,match);
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
    IF match THEN
      match:= matchcondI3;
T3:=s;
  END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    PROCEDURE Match_MU7(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU7.first:=Lfirst;
        MU7.last:=Llast;
        match:= matchcondI7;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU7(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU7(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM2_1:=L;WHILE LlastM2_1^.brother<>NIL DO
LlastM2_1:=LlastM2_1^.brother;
match_MU7(L,LlastM2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist1items,lastmatch) END;
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
            N^.ls^.PREPPfield^ := PREPPREC2;
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
                N^.ls^.cat := NP;
                N^.ls^.NPfield^ := NPREC2;
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
                                                                  BEGIN{REL2}
LSMATCHES_createitem(list,REL2,NP,createnode,createlist1);
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
m:=MAKET_stree(CLAUSE);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION1;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC1,MU7,NPREC2,MU8,NPVARREC1.
CASES)                                                ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION3;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC1,MU7,NPREC2,MU8,NPVARREC1.
CASES)                                                ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION8;
BEGIN
NPREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;
NPREC2.GENERIC:=OMEGAGENERIC
                                                      ;
PREPPREC2:=VARPREPPREC1;                              
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
(NPVARREC1.animate=NPREC1loc.animate)AND
(NPVARREC1.human=NPREC1loc.human)AND
(NPVARREC1.actcomas=NPREC1loc.actcomas)AND
(NPVARREC1.thetanp=NPREC1loc.thetanp)AND
(NPVARREC1.nounpatternefs=NPREC1loc.nounpatternefs)AND
(NPVARREC1.mood=NPREC1loc.mood)AND
(NPVARREC1.generic=NPREC1loc.generic)AND
(NPVARREC1.posspred=NPREC1loc.posspred)AND
(NPVARREC1.possnietnp=NPREC1loc.possnietnp)AND
(NPVARREC1.syntquant=NPREC1loc.syntquant)AND
(NPVARREC1.NPhead=NPREC1loc.NPhead)AND
(NPVARREC1.specQ=NPREC1loc.specQ)AND
(NPVARREC1.poss=NPREC1loc.poss)AND
(NPVARREC1.coord=NPREC1loc.coord)
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
    WHILE match AND NOT matchcondM2 DO
    BEGIN
    MatchModel2(m2,FALSE,match);
    END;
    If match Then
    BEGIN
 END;
IF match THEN
  BEGIN
  IF ((except1                                               )
                                                      )
THEN IF
          ((NPREC1.CASES =[]                                                    )
                                                      )
THEN IF
          ((NPREC1.GENERIC =NOGENERIC                             )
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
      MAKET_PREPPrec(PREPPREC2);
      MAKET_NPrec(NPREC2);
      action1;
      action8;
      createM;
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
      MAKET_PREPPrec(PREPPREC2);
      MAKET_NPrec(NPREC2);
      action3;
      action8;
      createM;
      Is:=loopholes.retype(m,LISTREE_pstree);
      LISTREE_appendstreebonus(Is,result,wbonus);
      END;
                                                          END;
                                                        END;
                                                          END;
COMRVARPREPNPSUBST:=result
END;
{:RVARPREPNPSUBST}
{rule:}
{:RVARPREPGENSUBST}
 FUNCTION COMRVARPREPGENSUBST(LEVEL:INTEGER;
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
LinitM1_2_2_1,LrestM1_2_2_1,LfirstM1_2_2_1,LlastM1_2_2_1:LSSTREE_prelnode;
iM1_2_2_1:INTEGER;
nomoretreesM1_2_2_1,lastmatchM1_2_2_1:BOOLEAN;
LinitM1_2_2_2,LrestM1_2_2_2,LfirstM1_2_2_2,LlastM1_2_2_2:LSSTREE_prelnode;
iM1_2_2_2:INTEGER;
nomoretreesM1_2_2_2,lastmatchM1_2_2_2:BOOLEAN;
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
MU1:LSMRUQUO_ListOfStrees;
MU2:LSMRUQUO_ListOfStrees;
MU3:LSMRUQUO_ListOfStrees;
MU5:LSMRUQUO_ListOfStrees;
MU6:LSMRUQUO_ListOfStrees;
MU4:LSMRUQUO_ListOfStrees;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
VARPREPPREC1:LSDOMAINT_PREPPrecord;
NPVARREC1:LSDOMAINT_NPVARrecord;
NPREC1:LSDOMAINT_NPrecord;
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
((NPREC1.NPHEAD =THEYNP                                 )
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
THEN IF
          ((NPVARREC1.NPHEAD =THEYNP                              )
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
        PROCEDURE Match_BYOBJREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR matchcond:BOOLEAN;
          Stree:LSSTREE_pStree;
          lisons:LISTREE_pRelnode;
          PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
          BEGIN{MatchNode}
            IF s^.ls^.cat<>VARPREPP THEN
              match:=FALSE;
            IF match THEN
              VARPREPPREC1:=s^.ls^.VARPREPPfield^;
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
                IF s^.ls^.cat<>NPVAR THEN
                  match:=FALSE;
                IF match THEN
                  NPVARREC1:=s^.ls^.NPVARfield^;
                IF match THEN
                  match:= matchcondI1;
              END{MatchNode};
                                                      BEGIN{MatchTree}
                            IF first THEN REL2:= Lfirst^.relation;match:=TRUE;
                  IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtreeVar0rels(Lfirst^.node,first
,match,matchnode,matchlist0items,lastmatchM1_2_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_REL2(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRfirst(L,match,item1,LfirstM1_2_2_1,LlastM1_2_2_1
,item2,LfirstM1_2_2_2,LlastM1_2_2_2
) ELSE match_REL2(LfirstM1_2_2_2,LfirstM1_2_2_2,FALSE,match) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,BYOBJREL
,match,matchnode,matchlist2items,lastmatchM1_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_BYOBJREL(Lfirst,Llast,TRUE,match);
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
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) ELSE BEGIN match_BYOBJREL(LfirstM1_2_2,LfirstM1_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,PREDREL
,BYOBJREL,match,matchnode,matchlist3items,lastmatchM1_2) END;
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
        PROCEDURE createMU5(VAR list:LSMRUQUO_ListOfStrees);
        BEGIN{MU5}
        copylist(MU5,list);
        END{MU5};
                                                            BEGIN{createitem12}
      createMU5(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist2items00(wholelist,createitem11,createitem12);
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
m:=MAKET_stree(CLAUSE);
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
                                                          END;
COMRVARPREPGENSUBST:=result
END;
{:RVARPREPGENSUBST}
{rule:}
{:RLOCADVSUBST}
 FUNCTION COMRLOCADVSUBST(LEVEL:INTEGER;
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
LinitM1_4,LrestM1_4,LfirstM1_4,LlastM1_4:LSSTREE_prelnode;
iM1_4:INTEGER;
nomoretreesM1_4,lastmatchM1_4:BOOLEAN;
LinitM1_5,LrestM1_5,LfirstM1_5,LlastM1_5:LSSTREE_prelnode;
iM1_5:INTEGER;
nomoretreesM1_5,lastmatchM1_5:BOOLEAN;
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
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
LlastM1_2_1:=L;WHILE LlastM1_2_1^.brother<>NIL DO
LlastM1_2_1:=LlastM1_2_1^.brother;
match_MU2(L,LlastM1_2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM1_2) END;
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
        LSMATCHES_matchtreeVarConVar(Lfirst,Llast,first,REL1,T1,match,matchcondI1,lastmatchM1_4);
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
LlastM1_5,LfirstM1_5,LrestM1_5,nomoretreesM1_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_REL1,matchlist1items,
LlastM1_4,LfirstM1_4,LrestM1_4,nomoretreesM1_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU3,matchlist2items,
LlastM1_3,LfirstM1_3,LrestM1_3,nomoretreesM1_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist3items,
LlastM1_2,LfirstM1_2,LrestM1_2,nomoretreesM1_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist4items,
LlastM1_1,LfirstM1_1,LrestM1_1,nomoretreesM1_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,PREDREL,match,matchnode,matchlist5items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
                                                      BEGIN{matchmodel}
T2:=s;
match:=first;
END;{matchmodel}
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
LSMATCHES_createitemVar(list,REL1,T3);
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
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createT3;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := PREPP;
      N^.ls^.PREPPfield^ := PREPPREC2;
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
                                                        BEGIN{T3}
  s:=MAKET_stree(PREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T3:=s;
  END{T3};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>PREPPVAR THEN
        match:=FALSE;
      IF match THEN
        PREPPVARREC1:=s^.ls^.PREPPVARfield^;
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
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>PREPP THEN
        match:=FALSE;
      IF match THEN
        PREPPREC1:=s^.ls^.PREPPfield^;
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
                                                      PROCEDURE ACTION3;
BEGIN
PREPPREC2:=PREPPREC1;                                 ;
PREPPREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result:=COPYX_PREPPTOVAR(
PREPPVARREC1,PREPPREC1);

;except1:=result
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
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF ((except1                                               )
                                                      )
THEN IF
          ((PREPPREC1.MOOD<>TOPICMOOD                             )
                                                      )
THEN IF
          (([LOC,
CAUS]                                                  *PREPPREC1.ACTSUBCEFS<>[]                                                    
)
                                                      )
THEN IF
          ((LSMRUQUO_DEIXISMAX(CLAUSEREC1
.DEIXIS
,CLAUSEREC1
.SUPERDEIXIS
,PREPPREC1
.SUPERDEIXIS
)                                                     )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPrec(PREPPREC2);
      MAKET_VARPREPPrec(VARPREPPREC2);
      MAKET_ADVPrec(ADVPREC2);
      action3;
      createT3;
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
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createT3;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := VARPREPP;
      N^.ls^.VARPREPPfield^ := VARPREPPREC2;
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
                                                        BEGIN{T3}
  s:=MAKET_stree(VARPREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T3:=s;
  END{T3};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>PREPPVAR THEN
        match:=FALSE;
      IF match THEN
        PREPPVARREC1:=s^.ls^.PREPPVARfield^;
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
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>VARPREPP THEN
        match:=FALSE;
      IF match THEN
        VARPREPPREC1:=s^.ls^.VARPREPPfield^;
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
                                                      PROCEDURE ACTION15;
BEGIN
VARPREPPREC2:=VARPREPPREC1;                           ;
VARPREPPREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result:=COPYX_PREPPTOVAR(
PREPPVARREC1,VARPREPPREC1);

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
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF ((except1                                               )
                                                      )
THEN IF
          ((VARPREPPREC1.MOOD<>TOPICMOOD                          )
                                                      )
THEN IF
          (([LOC,
CAUS]                                                  *PREPPREC1.ACTSUBCEFS<>[]                                                    
)
                                                      )
THEN IF
          ((LSMRUQUO_DEIXISMAX(CLAUSEREC1
.DEIXIS
,CLAUSEREC1
.SUPERDEIXIS
,VARPREPPREC1
.SUPERDEIXIS
)                                                     )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPrec(PREPPREC2);
      MAKET_VARPREPPrec(VARPREPPREC2);
      MAKET_ADVPrec(ADVPREC2);
      action15;
      createT3;
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
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createT3;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := ADVP;
      N^.ls^.ADVPfield^ := ADVPREC2;
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
                                                        BEGIN{T3}
  s:=MAKET_stree(ADVP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T3:=s;
  END{T3};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>ADVPVAR THEN
        match:=FALSE;
      IF match THEN
        ADVPVARREC1:=s^.ls^.ADVPVARfield^;
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
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>ADVP THEN
        match:=FALSE;
      IF match THEN
        ADVPREC1:=s^.ls^.ADVPfield^;
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
                                                      PROCEDURE ACTION27;
BEGIN
ADVPREC2:=ADVPREC1;                                   ;
ADVPREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result:=COPYX_ADVPTOVAR(
ADVPVARREC1,ADVPREC1);

;except1:=result
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
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF ((except1                                               )
                                                      )
THEN IF
          ((ADVPREC1.MOOD<>TOPICMOOD                              )
                                                      )
THEN IF
          ((LOCADV IN ADVPREC1.ACTSUBCEFS                         )
                                                      )
THEN IF
          ((LSMRUQUO_DEIXISMAX(CLAUSEREC1
.DEIXIS
,CLAUSEREC1
.SUPERDEIXIS
,ADVPREC1
.SUPERDEIXIS
)                                                     )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPrec(PREPPREC2);
      MAKET_VARPREPPrec(VARPREPPREC2);
      MAKET_ADVPrec(ADVPREC2);
      action27;
      createT3;
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
    WHILE match AND NOT matchcondM2 DO
    BEGIN
    MatchModel2(m2,FALSE,match);
    END;
    If match Then
    BEGIN
    LISTREE_mergesetsofstrees(subrule0X1,result);
    LISTREE_mergesetsofstrees(subrule0X2,result);
    LISTREE_mergesetsofstrees(subrule0X3,result);
 END;
    END;
COMRLOCADVSUBST:=result
END;
{:RLOCADVSUBST}
{rule:}
{:RSHIFTLOCADVSUBST}
 FUNCTION COMRSHIFTLOCADVSUBST(LEVEL:INTEGER;
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
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
LinitM1_4,LrestM1_4,LfirstM1_4,LlastM1_4:LSSTREE_prelnode;
iM1_4:INTEGER;
nomoretreesM1_4,lastmatchM1_4:BOOLEAN;
LinitM1_4_1,LrestM1_4_1,LfirstM1_4_1,LlastM1_4_1:LSSTREE_prelnode;
iM1_4_1:INTEGER;
nomoretreesM1_4_1,lastmatchM1_4_1:BOOLEAN;
LinitM1_5,LrestM1_5,LfirstM1_5,LlastM1_5:LSSTREE_prelnode;
iM1_5:INTEGER;
nomoretreesM1_5,lastmatchM1_5:BOOLEAN;
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
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
                                                      PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
        LSMATCHES_matchtreeConVar(Lfirst,Llast,first,SHIFTREL,T1,match,matchcondI1,lastmatchM1_2);
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
LlastM1_4_1:=L;WHILE LlastM1_4_1^.brother<>NIL DO
LlastM1_4_1:=LlastM1_4_1^.brother;
match_MU2(L,LlastM1_4_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM1_4) END;
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
LlastM1_5,LfirstM1_5,LrestM1_5,nomoretreesM1_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist1items,
LlastM1_4,LfirstM1_4,LrestM1_4,nomoretreesM1_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU3,matchlist2items,
LlastM1_3,LfirstM1_3,LrestM1_3,nomoretreesM1_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_SHIFTREL,matchlist3items,
LlastM1_2,LfirstM1_2,LrestM1_2,nomoretreesM1_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist4items,
LlastM1_1,LfirstM1_1,LrestM1_1,nomoretreesM1_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,SHIFTREL,PREDREL,match,matchnode,matchlist5items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
                                                      BEGIN{matchmodel}
T2:=s;
match:=first;
END;{matchmodel}
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
    PROCEDURE createSHIFTREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      BEGIN
      wholelist.first:=NIL;wholelist.last:=NIL;
      END;
                                                          BEGIN{SHIFTREL}
LSMATCHES_createitemVar(list,SHIFTREL,T3);
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
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createT3;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := PREPP;
      N^.ls^.PREPPfield^ := PREPPREC2;
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
                                                        BEGIN{T3}
  s:=MAKET_stree(PREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T3:=s;
  END{T3};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>PREPPVAR THEN
        match:=FALSE;
      IF match THEN
        PREPPVARREC1:=s^.ls^.PREPPVARfield^;
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
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>PREPP THEN
        match:=FALSE;
      IF match THEN
        PREPPREC1:=s^.ls^.PREPPfield^;
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
                                                      PROCEDURE ACTION1;
BEGIN
;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION2;
BEGIN
;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION5;
BEGIN
PREPPREC2:=PREPPREC1;                                 ;
PREPPREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
PREPPREC1loc:LSDOMAINT_PREPPVARrecord;
BEGIN
PREPPREC1loc:=COPYT_PREPPTOVAR(PREPPREC1);
result:=TRUE
AND
(PREPPVARREC1.req=PREPPREC1loc.req)AND
(PREPPVARREC1.env=PREPPREC1loc.env)AND
(PREPPVARREC1.actsubcefs=PREPPREC1loc.actsubcefs)AND
(PREPPVARREC1.synppefs=PREPPREC1loc.synppefs)AND
(PREPPVARREC1.thetapp=PREPPREC1loc.thetapp)AND
(PREPPVARREC1.headkey=PREPPREC1loc.headkey)AND
(PREPPVARREC1.class=PREPPREC1loc.class)AND
(PREPPVARREC1.deixis=PREPPREC1loc.deixis)AND
(PREPPVARREC1.aspect=PREPPREC1loc.aspect)AND
(PREPPVARREC1.retro=PREPPREC1loc.retro)AND
(PREPPVARREC1.superdeixis=PREPPREC1loc.superdeixis)AND
(PREPPVARREC1.specQ=PREPPREC1loc.specQ)AND
(PREPPVARREC1.stranded=PREPPREC1loc.stranded)AND
(PREPPVARREC1.coord=PREPPREC1loc.coord)
;except1:=result
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
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF ((except1                                               )
                                                      )
THEN IF
          (([LOC,
CAUS]                                                  *PREPPREC1.ACTSUBCEFS<>[]                                                    
)
                                                      )
THEN IF
          ((LSMRUQUO_DEIXISMAX(CLAUSEREC1
.DEIXIS
,CLAUSEREC1
.SUPERDEIXIS
,PREPPREC1
.SUPERDEIXIS
)                                                     )
                                                      )
                                                       THEN
      BEGIN
      IF ((PREPPVARREC1.MOOD =TOPICMOOD                          )
                                                      )
THEN IF
          ((PREPPREC1.MOOD =NOWH                                  )
                                                      )
                                                       THEN
        BEGIN
        MAKET_PREPPrec(PREPPREC2);
        MAKET_VARPREPPrec(VARPREPPREC2);
        MAKET_ADVPrec(ADVPREC2);
        action1;
        action5;
        createT3;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((PREPPVARREC1.MOOD =WH                                 )
                                                      )
THEN IF
          ((PREPPREC1.MOOD =WH                                    )
                                                      )
                                                       THEN
        BEGIN
        MAKET_PREPPrec(PREPPREC2);
        MAKET_VARPREPPrec(VARPREPPREC2);
        MAKET_ADVPrec(ADVPREC2);
        action2;
        action5;
        createT3;
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
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
 NPVARREC4:LSDOMAINT_NPVARrecord;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
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
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createT3;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := VARPREPP;
      N^.ls^.VARPREPPfield^ := VARPREPPREC2;
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
                                                        BEGIN{T3}
  s:=MAKET_stree(VARPREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T3:=s;
  END{T3};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>PREPPVAR THEN
        match:=FALSE;
      IF match THEN
        PREPPVARREC1:=s^.ls^.PREPPVARfield^;
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
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>VARPREPP THEN
        match:=FALSE;
      IF match THEN
        VARPREPPREC1:=s^.ls^.VARPREPPfield^;
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
                                                      PROCEDURE ACTION18;
BEGIN
VARPREPPREC2:=VARPREPPREC1;                           ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION21;
BEGIN
VARPREPPREC2:=VARPREPPREC1;                           ;
VARPREPPREC2.MOOD:=RELATIVEXPMOOD
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION23;
BEGIN
VARPREPPREC2:=VARPREPPREC1;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION24;
BEGIN
VARPREPPREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
VARPREPPREC1loc:LSDOMAINT_PREPPVARrecord;
BEGIN
VARPREPPREC1loc:=COPYT_PREPPTOVAR(VARPREPPREC1);
result:=TRUE
AND
(PREPPVARREC1.req=VARPREPPREC1loc.req)AND
(PREPPVARREC1.env=VARPREPPREC1loc.env)AND
(PREPPVARREC1.actsubcefs=VARPREPPREC1loc.actsubcefs)AND
(PREPPVARREC1.synppefs=VARPREPPREC1loc.synppefs)AND
(PREPPVARREC1.thetapp=VARPREPPREC1loc.thetapp)AND
(PREPPVARREC1.headkey=VARPREPPREC1loc.headkey)AND
(PREPPVARREC1.class=VARPREPPREC1loc.class)AND
(PREPPVARREC1.deixis=VARPREPPREC1loc.deixis)AND
(PREPPVARREC1.aspect=VARPREPPREC1loc.aspect)AND
(PREPPVARREC1.retro=VARPREPPREC1loc.retro)AND
(PREPPVARREC1.superdeixis=VARPREPPREC1loc.superdeixis)AND
(PREPPVARREC1.specQ=VARPREPPREC1loc.specQ)AND
(PREPPVARREC1.stranded=VARPREPPREC1loc.stranded)AND
(PREPPVARREC1.coord=VARPREPPREC1loc.coord)
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
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF ((except1                                               )
                                                      )
THEN IF
          (([LOC,
CAUS]                                                  *VARPREPPREC1.ACTSUBCEFS<>
[]                                                    )
                                                      )
THEN IF
          ((LSMRUQUO_DEIXISMAX(CLAUSEREC1
.DEIXIS
,CLAUSEREC1
.SUPERDEIXIS
,VARPREPPREC1
.SUPERDEIXIS
)                                                     )
                                                      )
                                                       THEN
      BEGIN
      IF ((PREPPVARREC1.MOOD =TOPICMOOD                          )
                                                      )
THEN IF
          ((VARPREPPREC1.MOOD =NOWH                               )
                                                      )
                                                       THEN
        BEGIN
        MAKET_PREPPrec(PREPPREC2);
        MAKET_VARPREPPrec(VARPREPPREC2);
        MAKET_ADVPrec(ADVPREC2);
        action18;
        action24;
        createT3;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((PREPPVARREC1.MOOD =RELATIVEXPMOOD                     )
                                                      )
THEN IF
          ((VARPREPPREC1.MOOD =NOWH                               )
                                                      )
                                                       THEN
        BEGIN
        MAKET_PREPPrec(PREPPREC2);
        MAKET_VARPREPPrec(VARPREPPREC2);
        MAKET_ADVPrec(ADVPREC2);
        action21;
        action24;
        createT3;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((PREPPVARREC1.MOOD =WH                                 )
                                                      )
THEN IF
          ((VARPREPPREC1.MOOD =WH                                 )
                                                      )
                                                       THEN
        BEGIN
        MAKET_PREPPrec(PREPPREC2);
        MAKET_VARPREPPrec(VARPREPPREC2);
        MAKET_ADVPrec(ADVPREC2);
        action23;
        action24;
        createT3;
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
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
 CNVARREC4:LSDOMAINT_CNVARrecord;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
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
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createT3;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := VARPREPP;
      N^.ls^.VARPREPPfield^ := VARPREPPREC2;
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
                                                        BEGIN{T3}
  s:=MAKET_stree(VARPREPP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T3:=s;
  END{T3};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>PREPPVAR THEN
        match:=FALSE;
      IF match THEN
        PREPPVARREC1:=s^.ls^.PREPPVARfield^;
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
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>VARPREPP THEN
        match:=FALSE;
      IF match THEN
        VARPREPPREC1:=s^.ls^.VARPREPPfield^;
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
                                                      PROCEDURE ACTION45;
BEGIN
VARPREPPREC2:=VARPREPPREC1;                           ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION46;
BEGIN
VARPREPPREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
VARPREPPREC1loc:LSDOMAINT_PREPPVARrecord;
BEGIN
VARPREPPREC1loc:=COPYT_PREPPTOVAR(VARPREPPREC1);
result:=TRUE
AND
(PREPPVARREC1.req=VARPREPPREC1loc.req)AND
(PREPPVARREC1.env=VARPREPPREC1loc.env)AND
(PREPPVARREC1.actsubcefs=VARPREPPREC1loc.actsubcefs)AND
(PREPPVARREC1.synppefs=VARPREPPREC1loc.synppefs)AND
(PREPPVARREC1.thetapp=VARPREPPREC1loc.thetapp)AND
(PREPPVARREC1.headkey=VARPREPPREC1loc.headkey)AND
(PREPPVARREC1.class=VARPREPPREC1loc.class)AND
(PREPPVARREC1.deixis=VARPREPPREC1loc.deixis)AND
(PREPPVARREC1.aspect=VARPREPPREC1loc.aspect)AND
(PREPPVARREC1.retro=VARPREPPREC1loc.retro)AND
(PREPPVARREC1.superdeixis=VARPREPPREC1loc.superdeixis)AND
(PREPPVARREC1.specQ=VARPREPPREC1loc.specQ)AND
(PREPPVARREC1.stranded=VARPREPPREC1loc.stranded)AND
(PREPPVARREC1.coord=VARPREPPREC1loc.coord)
;except1:=result
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
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF ((except1                                               )
                                                      )
THEN IF
          (([LOC,
CAUS]                                                  *VARPREPPREC1.ACTSUBCEFS<>
[]                                                    )
                                                      )
THEN IF
          ((LSMRUQUO_DEIXISMAX(CLAUSEREC1
.DEIXIS
,CLAUSEREC1
.SUPERDEIXIS
,VARPREPPREC1
.SUPERDEIXIS
)                                                     )
                                                      )
                                                       THEN
      BEGIN
      IF ((PREPPVARREC1.MOOD =RELATIVEXPMOOD                     )
                                                      )
THEN IF
          ((VARPREPPREC1.MOOD =RELATIVEXPMOOD                     )
                                                      )
                                                       THEN
        BEGIN
        MAKET_PREPPrec(PREPPREC2);
        MAKET_VARPREPPrec(VARPREPPREC2);
        MAKET_ADVPrec(ADVPREC2);
        action45;
        action46;
        createT3;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                       subrule0X3:=result
 END;
 FUNCTION subrule0X4 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
LinitT2_1,LrestT2_1,LfirstT2_1,LlastT2_1:LSSTREE_prelnode;
iT2_1:INTEGER;
nomoretreesT2_1,lastmatchT2_1:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createT3;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := ADVP;
      N^.ls^.ADVPfield^ := ADVPREC2;
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
                                                        BEGIN{T3}
  s:=MAKET_stree(ADVP);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T3:=s;
  END{T3};
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>ADVPVAR THEN
        match:=FALSE;
      IF match THEN
        ADVPVARREC1:=s^.ls^.ADVPVARfield^;
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
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>ADVP THEN
        match:=FALSE;
      IF match THEN
        ADVPREC1:=s^.ls^.ADVPfield^;
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
                                                      PROCEDURE ACTION56;
BEGIN
;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION57;
BEGIN
;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION60;
BEGIN
ADVPREC2:=ADVPREC1;                                   ;
ADVPREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      
END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
ADVPREC1loc:LSDOMAINT_ADVPVARrecord;
BEGIN
ADVPREC1loc:=COPYT_ADVPTOVAR(ADVPREC1);
result:=TRUE
AND
(ADVPVARREC1.req=ADVPREC1loc.req)AND
(ADVPVARREC1.env=ADVPREC1loc.env)AND
(ADVPVARREC1.class=ADVPREC1loc.class)AND
(ADVPVARREC1.deixis=ADVPREC1loc.deixis)AND
(ADVPVARREC1.aspect=ADVPREC1loc.aspect)AND
(ADVPVARREC1.retro=ADVPREC1loc.retro)AND
(ADVPVARREC1.thetaadv=ADVPREC1loc.thetaadv)AND
(ADVPVARREC1.superdeixis=ADVPREC1loc.superdeixis)AND
(ADVPVARREC1.actsubcefs=ADVPREC1loc.actsubcefs)AND
(ADVPVARREC1.advpatternefs=ADVPREC1loc.advpatternefs)AND
(ADVPVARREC1.position=ADVPREC1loc.position)AND
(ADVPVARREC1.possnietnp=ADVPREC1loc.possnietnp)AND
(ADVPVARREC1.thanas=ADVPREC1loc.thanas)AND
(ADVPVARREC1.thanascompl=ADVPREC1loc.thanascompl)AND
(ADVPVARREC1.temporal=ADVPREC1loc.temporal)AND
(ADVPVARREC1.coord=ADVPREC1loc.coord)
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
 IF match THEN matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
  IF match THEN
    BEGIN
    IF ((except1                                               )
                                                      )
THEN IF
          (([LOCADV,
SENTADV]                                               *ADVPREC1.ACTSUBCEFS<>[]                                                    )
                                                      )
THEN IF
          ((LSMRUQUO_DEIXISMAX(CLAUSEREC1
.DEIXIS
,CLAUSEREC1
.SUPERDEIXIS
,ADVPREC1
.SUPERDEIXIS
)                                                     )
                                                      )
                                                       THEN
      BEGIN
      IF ((ADVPVARREC1.MOOD =TOPICMOOD                           )
                                                      )
THEN IF
          ((ADVPREC1.MOOD =NOWH                                   )
                                                      )
                                                       THEN
        BEGIN
        MAKET_PREPPrec(PREPPREC2);
        MAKET_VARPREPPrec(VARPREPPREC2);
        MAKET_ADVPrec(ADVPREC2);
        action56;
        action60;
        createT3;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
      IF ((ADVPVARREC1.MOOD =WH                                  )
                                                      )
THEN IF
          ((ADVPREC1.MOOD =WH                                     )
                                                      )
                                                       THEN
        BEGIN
        MAKET_PREPPrec(PREPPREC2);
        MAKET_VARPREPPrec(VARPREPPREC2);
        MAKET_ADVPrec(ADVPREC2);
        action57;
        action60;
        createT3;
        previous1;
        Is:=loopholes.retype(m,LISTREE_pstree);
        LISTREE_appendstreebonus(Is,result,wbonus);
        END;
                                                            END;
                                                          END;
                                                       subrule0X4:=result
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
    WHILE match AND NOT matchcondM2 DO
    BEGIN
    MatchModel2(m2,FALSE,match);
    END;
    If match Then
    BEGIN
    LISTREE_mergesetsofstrees(subrule0X1,result);
    LISTREE_mergesetsofstrees(subrule0X2,result);
    LISTREE_mergesetsofstrees(subrule0X3,result);
    LISTREE_mergesetsofstrees(subrule0X4,result);
 END;
    END;
COMRSHIFTLOCADVSUBST:=result
END;
{:RSHIFTLOCADVSUBST}
{rule:}
{:RSENTADVSUBST}
 FUNCTION COMRSENTADVSUBST(LEVEL:INTEGER;
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
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
LinitM1_3_1,LrestM1_3_1,LfirstM1_3_1,LlastM1_3_1:LSSTREE_prelnode;
iM1_3_1:INTEGER;
nomoretreesM1_3_1,lastmatchM1_3_1:BOOLEAN;
LinitM1_4,LrestM1_4,LfirstM1_4,LlastM1_4:LSSTREE_prelnode;
iM1_4:INTEGER;
nomoretreesM1_4,lastmatchM1_4:BOOLEAN;
LinitM2_1,LrestM2_1,LfirstM2_1,LlastM2_1:LSSTREE_prelnode;
iM2_1:INTEGER;
nomoretreesM2_1,lastmatchM2_1:BOOLEAN;
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
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
                                                      PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
                                                      PROCEDURE MatchList4Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    PROCEDURE Match_LEFTDISLOCREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>ADVPVAR THEN
          match:=FALSE;
        IF match THEN
          ADVPVARREC1:=s^.ls^.ADVPVARfield^;
        IF match THEN
          match:= matchcondI3;
      END{MatchNode};
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,LEFTDISLOCREL
,match,matchnode,matchlist0items,lastmatchM1_1) END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_LEFTDISLOCREL(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_MU1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU1.first:=Lfirst;
        MU1.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
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
LlastM1_3_1:=L;WHILE LlastM1_3_1^.brother<>NIL DO
LlastM1_3_1:=LlastM1_3_1^.brother;
match_MU3(L,LlastM1_3_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM1_3) END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
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
                                                      PROCEDURE item4(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU4(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_RMUMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,item2,LfirstM1_2,LlastM1_2
,PREDREL,item3,LfirstM1_3,LlastM1_3
,item4,LfirstM1_4,LlastM1_4
) ELSE BEGIN match_LEFTDISLOCREL(LfirstM1_1,LfirstM1_1,FALSE,match);
IF NOT match THEN match_PREDREL(LfirstM1_3,LfirstM1_3,FALSE,match) END END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,LEFTDISLOCREL,PREDREL,match,matchnode,matchlist4items,lastmatch) END;
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
      match:= matchcondI1;
T3:=s;
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
LlastM2_1:=L;WHILE LlastM2_1^.brother<>NIL DO
LlastM2_1:=LlastM2_1^.brother;
match_MU5(L,LlastM2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist1items,lastmatch) END;
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
    PROCEDURE createLEFTDISLOCREL(VAR list:LSMRUQUO_ListOfStrees);
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
                                                          BEGIN{LEFTDISLOCREL}
LSMATCHES_createitem(list,LEFTDISLOCREL,ADVP,createnode,createlist1);
    END{LEFTDISLOCREL};
                                                        BEGIN{createitem11}
  createLEFTDISLOCREL(list);
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
    PROCEDURE createMU1(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU1}
    copylist(MU1,list);
    END{MU1};
                                                        BEGIN{createitem13}
  createMU1(list);
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
LSMATCHES_createlist4items1101(wholelist,createitem11,createitem12,createitem13,createitem14);
  createitem15(list);
  IF list.first<>NIL THEN
    BEGIN
    wholelist.last^.brother:=list.first;
    wholelist.last:=list.last;
    END;
  END{createlist1};
                                                      BEGIN{createM}
m:=MAKET_stree(CLAUSE);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION2;
BEGIN
ADVPREC2:=ADVPREC1;                                   ;
ADVPREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result:=COPYX_ADVPTOVAR(
ADVPVARREC1,ADVPREC1);

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
    WHILE match AND NOT matchcondM2 DO
    BEGIN
    MatchModel2(m2,FALSE,match);
    END;
    If match Then
    BEGIN
 END;
IF match THEN
  BEGIN
  IF ((except1                                               )
                                                      )
THEN IF
          ((LSMRUQUO_DEIXISMAX(CLAUSEREC1
.DEIXIS
,CLAUSEREC1
.SUPERDEIXIS
,ADVPREC1
.SUPERDEIXIS
)                                                     )
                                                      )
                                                       THEN
    BEGIN
    MAKET_ADVPrec(ADVPREC2);
    MAKET_PUNCrec(PUNCREC1);
    hulpstree:=LDBLEX_read(auxkey('COMMAPUNCKEY'));
    PUNCREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    PUNCREC1:=PUNCREC1tree^.ls^.PUNCfield^;
    action2;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                          END;
COMRSENTADVSUBST:=result
END;
{:RSENTADVSUBST}
{rule:}
{:RSENTPREPPSUBST}
 FUNCTION COMRSENTPREPPSUBST(LEVEL:INTEGER;
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
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
LinitM1_3_1,LrestM1_3_1,LfirstM1_3_1,LlastM1_3_1:LSSTREE_prelnode;
iM1_3_1:INTEGER;
nomoretreesM1_3_1,lastmatchM1_3_1:BOOLEAN;
LinitM1_4,LrestM1_4,LfirstM1_4,LlastM1_4:LSSTREE_prelnode;
iM1_4:INTEGER;
nomoretreesM1_4,lastmatchM1_4:BOOLEAN;
LinitM2_1,LrestM2_1,LfirstM2_1,LlastM2_1:LSSTREE_prelnode;
iM2_1:INTEGER;
nomoretreesM2_1,lastmatchM2_1:BOOLEAN;
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
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
                                                      PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
                                                      PROCEDURE MatchList4Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    PROCEDURE Match_LEFTDISLOCREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>PREPPVAR THEN
          match:=FALSE;
        IF match THEN
          PREPPVARREC1:=s^.ls^.PREPPVARfield^;
        IF match THEN
          match:= matchcondI3;
      END{MatchNode};
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,LEFTDISLOCREL
,match,matchnode,matchlist0items,lastmatchM1_1) END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_LEFTDISLOCREL(Lfirst,Llast,TRUE,match);
END;
    PROCEDURE Match_MU1(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU1.first:=Lfirst;
        MU1.last:=Llast;
        match:=TRUE;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
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
LlastM1_3_1:=L;WHILE LlastM1_3_1^.brother<>NIL DO
LlastM1_3_1:=LlastM1_3_1^.brother;
match_MU3(L,LlastM1_3_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM1_3) END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
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
                                                      PROCEDURE item4(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU4(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_RMUMfirst(L,match,item1,LfirstM1_1,LlastM1_1
,item2,LfirstM1_2,LlastM1_2
,PREDREL,item3,LfirstM1_3,LlastM1_3
,item4,LfirstM1_4,LlastM1_4
) ELSE BEGIN match_LEFTDISLOCREL(LfirstM1_1,LfirstM1_1,FALSE,match);
IF NOT match THEN match_PREDREL(LfirstM1_3,LfirstM1_3,FALSE,match) END END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,LEFTDISLOCREL,PREDREL,match,matchnode,matchlist4items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>PREPP THEN
      match:=FALSE;
    IF match THEN
      PREPPREC1:=s^.ls^.PREPPfield^;
    IF match THEN
      match:= matchcondI1;
T3:=s;
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
LlastM2_1:=L;WHILE LlastM2_1^.brother<>NIL DO
LlastM2_1:=LlastM2_1^.brother;
match_MU5(L,LlastM2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist1items,lastmatch) END;
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
    PROCEDURE createLEFTDISLOCREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := PREPP;
        N^.ls^.PREPPfield^ := PREPPREC2;
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
                                                          BEGIN{LEFTDISLOCREL}
LSMATCHES_createitem(list,LEFTDISLOCREL,PREPP,createnode,createlist1);
    END{LEFTDISLOCREL};
                                                        BEGIN{createitem11}
  createLEFTDISLOCREL(list);
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
    PROCEDURE createMU1(VAR list:LSMRUQUO_ListOfStrees);
    BEGIN{MU1}
    copylist(MU1,list);
    END{MU1};
                                                        BEGIN{createitem13}
  createMU1(list);
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
LSMATCHES_createlist4items1101(wholelist,createitem11,createitem12,createitem13,createitem14);
  createitem15(list);
  IF list.first<>NIL THEN
    BEGIN
    wholelist.last^.brother:=list.first;
    wholelist.last:=list.last;
    END;
  END{createlist1};
                                                      BEGIN{createM}
m:=MAKET_stree(CLAUSE);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION2;
BEGIN
PREPPREC2:=PREPPREC1;                                 ;
PREPPREC2.SUPERDEIXIS:=OMEGADEIXIS
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result:=COPYX_PREPPTOVAR(
PREPPVARREC1,PREPPREC1);

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
    WHILE match AND NOT matchcondM2 DO
    BEGIN
    MatchModel2(m2,FALSE,match);
    END;
    If match Then
    BEGIN
 END;
IF match THEN
  BEGIN
  IF ((except1                                               )
                                                      )
THEN IF
          ((LSMRUQUO_DEIXISMAX(CLAUSEREC1
.DEIXIS
,CLAUSEREC1
.SUPERDEIXIS
,PREPPREC1
.SUPERDEIXIS
)                                                     )
                                                      )
                                                       THEN
    BEGIN
    MAKET_PREPPrec(PREPPREC2);
    MAKET_PUNCrec(PUNCREC1);
    hulpstree:=LDBLEX_read(auxkey('COMMAPUNCKEY'));
    PUNCREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    PUNCREC1:=PUNCREC1tree^.ls^.PUNCfield^;
    action2;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                          END;
COMRSENTPREPPSUBST:=result
END;
{:RSENTPREPPSUBST}
{rule:}
{:RPROSENTSUBST}
 FUNCTION COMRPROSENTSUBST(LEVEL:INTEGER;
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
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
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
            match:= matchcondI1;
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
            IF s^.ls^.cat<>PROSENTVAR THEN
              match:=FALSE;
            IF match THEN
              PROSENTVARREC1:=s^.ls^.PROSENTVARfield^;
            IF match THEN
              match:= matchcondI3;
          END{MatchNode};
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,COMPLREL
,match,matchnode,matchlist0items,lastmatchM1_2_2) END;
                                                      PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_COMPLREL(Lfirst,Llast,TRUE,match);
END;
        PROCEDURE Match_MU3(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        BEGIN{match}
          IF first THEN BEGIN
            MU3.first:=Lfirst;
            MU3.last:=Llast;
            match:= matchcondI2;
          END
          ELSE match:=FALSE
        END;
                                                      PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU3(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) ELSE BEGIN match_COMPLREL(LfirstM1_2_2,LfirstM1_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,PREDREL
,COMPLREL,match,matchnode,matchlist3items,lastmatchM1_2) END;
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
    IF s^.ls^.cat<>PROSENT THEN
      match:=FALSE;
    IF match THEN
      PROSENTREC1:=s^.ls^.PROSENTfield^;
T1:=s;
    IF match THEN match:=(s^.ls^.PROSENTfield^.key=auxkey('PROSENTKEY'));
  END{MatchNode};
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}PROSENTREC1tree:=s;
IF first THEN match:= (s^.li^.n <=0)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist0items,lastmatch) END;
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
m:=MAKET_stree(CLAUSE);
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
m2:=loopholes.retype(Is2,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
  BEGIN
    MatchModel2(m2,TRUE,match);
    If match Then
    WHILE match AND NOT matchcondM2 DO
    BEGIN
    MatchModel2(m2,FALSE,match);
    END;
    If match Then
    BEGIN
 END;
IF match THEN
  BEGIN
  IF ((PROSENTVARREC1.SO =PROSENTREC1.SO                     )
                                                      )
                                                       THEN
    BEGIN
    action0;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                          END;
COMRPROSENTSUBST:=result
END;
{:RPROSENTSUBST}
{rule:}
{:RSOPROSENTSUBST}
 FUNCTION COMRSOPROSENTSUBST(LEVEL:INTEGER;
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
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
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
            IF s^.ls^.cat<>PROSENTVAR THEN
              match:=FALSE;
            IF match THEN
              PROSENTVARREC1:=s^.ls^.PROSENTVARfield^;
            IF match THEN
              match:= matchcondI3;
          END{MatchNode};
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,COMPLREL
,match,matchnode,matchlist0items,lastmatchM1_2_2) END;
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
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) ELSE BEGIN match_COMPLREL(LfirstM1_2_2,LfirstM1_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,PREDREL
,COMPLREL,match,matchnode,matchlist3items,lastmatchM1_2) END;
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
    IF s^.ls^.cat<>PROSENT THEN
      match:=FALSE;
    IF match THEN
      PROSENTREC1:=s^.ls^.PROSENTfield^;
    IF match THEN
      match:= matchcondI4;
T1:=s;
    IF match THEN match:=(s^.ls^.PROSENTfield^.key=auxkey('SOPROSENTKEY'));
  END{MatchNode};
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}PROSENTREC1tree:=s;
IF first THEN match:= (s^.li^.n <=0)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist0items,lastmatch) END;
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
            N^.ls^.cat := PROSENT;
            N^.ls^.PROSENTfield^ := PROSENTREC1;
          END{CreateNode};
                                                                PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          BEGIN
          wholelist.first:=NIL;wholelist.last:=NIL;
          END;
                                                              BEGIN{COMPLREL}
        LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
        list.first:=relnode;
        list.last:=relnode;
        relnode^.relation:=COMPLREL;
s:=PROSENTREC1tree;
        relnode^.node:=s;
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
m:=MAKET_stree(CLAUSE);
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
m2:=loopholes.retype(Is2,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
  BEGIN
    MatchModel2(m2,TRUE,match);
    If match Then
    WHILE match AND NOT matchcondM2 DO
    BEGIN
    MatchModel2(m2,FALSE,match);
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
    hulpstree:=LDBLEX_read(auxkey('SOPROSENTKEY'));
    PROSENTREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    PROSENTREC1:=PROSENTREC1tree^.ls^.PROSENTfield^;
    action0;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                          END;
COMRSOPROSENTSUBST:=result
END;
{:RSOPROSENTSUBST}
{rule:}
{:RNOTPROSENTSUBST}
 FUNCTION COMRNOTPROSENTSUBST(LEVEL:INTEGER;
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
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
LinitM1_4,LrestM1_4,LfirstM1_4,LlastM1_4:LSSTREE_prelnode;
iM1_4:INTEGER;
nomoretreesM1_4,lastmatchM1_4:BOOLEAN;
LinitM1_4_1,LrestM1_4_1,LfirstM1_4_1,LlastM1_4_1:LSSTREE_prelnode;
iM1_4_1:INTEGER;
nomoretreesM1_4_1,lastmatchM1_4_1:BOOLEAN;
LinitM1_4_2,LrestM1_4_2,LfirstM1_4_2,LlastM1_4_2:LSSTREE_prelnode;
iM1_4_2:INTEGER;
nomoretreesM1_4_2,lastmatchM1_4_2:BOOLEAN;
LinitM1_4_3,LrestM1_4_3,LfirstM1_4_3,LlastM1_4_3:LSSTREE_prelnode;
iM1_4_3:INTEGER;
nomoretreesM1_4_3,lastmatchM1_4_3:BOOLEAN;
LinitM1_5,LrestM1_5,LfirstM1_5,LlastM1_5:LSSTREE_prelnode;
iM1_5:INTEGER;
nomoretreesM1_5,lastmatchM1_5:BOOLEAN;
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
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
                                                      PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
        LSMATCHES_matchtreeVar(Lfirst,Llast,first,AUXREL,T1,match,lastmatchM1_2);
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
            IF s^.ls^.cat<>PROSENTVAR THEN
              match:=FALSE;
            IF match THEN
              PROSENTVARREC1:=s^.ls^.PROSENTVARfield^;
            IF match THEN
              match:= matchcondI3;
          END{MatchNode};
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,COMPLREL
,match,matchnode,matchlist0items,lastmatchM1_4_2) END;
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
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM1_4_1,LlastM1_4_1
,item2,LfirstM1_4_2,LlastM1_4_2
,item3,LfirstM1_4_3,LlastM1_4_3
) ELSE BEGIN match_COMPLREL(LfirstM1_4_2,LfirstM1_4_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM1_4_1,LlastM1_4_1
,item2,LfirstM1_4_2,LlastM1_4_2
,item3,LfirstM1_4_3,LlastM1_4_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,PREDREL
,COMPLREL,match,matchnode,matchlist3items,lastmatchM1_4) END;
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
LlastM1_5,LfirstM1_5,LrestM1_5,nomoretreesM1_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist1items,
LlastM1_4,LfirstM1_4,LrestM1_4,nomoretreesM1_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU6,matchlist2items,
LlastM1_3,LfirstM1_3,LrestM1_3,nomoretreesM1_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_AUXREL,matchlist3items,
LlastM1_2,LfirstM1_2,LrestM1_2,nomoretreesM1_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist4items,
LlastM1_1,LfirstM1_1,LrestM1_1,nomoretreesM1_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,AUXREL,PREDREL,match,matchnode,matchlist5items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>PROSENT THEN
      match:=FALSE;
    IF match THEN
      PROSENTREC1:=s^.ls^.PROSENTfield^;
    IF match THEN
      match:= matchcondI4;
T2:=s;
    IF match THEN match:=(s^.ls^.PROSENTfield^.key=auxkey('NOTPROSENTKEY'));
  END{MatchNode};
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}PROSENTREC1tree:=s;
IF first THEN match:= (s^.li^.n <=0)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist0items,lastmatch) END;
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
            N^.ls^.cat := PROSENT;
            N^.ls^.PROSENTfield^ := PROSENTREC1;
          END{CreateNode};
                                                                PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          BEGIN
          wholelist.first:=NIL;wholelist.last:=NIL;
          END;
                                                              BEGIN{COMPLREL}
        LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
        list.first:=relnode;
        list.last:=relnode;
        relnode^.relation:=COMPLREL;
s:=PROSENTREC1tree;
        relnode^.node:=s;
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
m:=MAKET_stree(CLAUSE);
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
m2:=loopholes.retype(Is2,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
  BEGIN
    MatchModel2(m2,TRUE,match);
    If match Then
    WHILE match AND NOT matchcondM2 DO
    BEGIN
    MatchModel2(m2,FALSE,match);
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
    hulpstree:=LDBLEX_read(auxkey('NOTPROSENTKEY'));
    PROSENTREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    PROSENTREC1:=PROSENTREC1tree^.ls^.PROSENTfield^;
    action0;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                          END;
COMRNOTPROSENTSUBST:=result
END;
{:RNOTPROSENTSUBST}
{rule:}
{:RPOSSUBST}
 FUNCTION COMRPOSSUBST(Is1:LISTREE_pStree;Is2:LISTREE_pStree
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
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
LinitM1_4,LrestM1_4,LfirstM1_4,LlastM1_4:LSSTREE_prelnode;
iM1_4:INTEGER;
nomoretreesM1_4,lastmatchM1_4:BOOLEAN;
LinitM1_4_1,LrestM1_4_1,LfirstM1_4_1,LlastM1_4_1:LSSTREE_prelnode;
iM1_4_1:INTEGER;
nomoretreesM1_4_1,lastmatchM1_4_1:BOOLEAN;
LinitM1_5,LrestM1_5,LfirstM1_5,LlastM1_5:LSSTREE_prelnode;
iM1_5:INTEGER;
nomoretreesM1_5,lastmatchM1_5:BOOLEAN;
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
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
                                                      PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
        IF s^.ls^.cat<>POSVAR THEN
          match:=FALSE;
        IF match THEN
          POSVARREC1:=s^.ls^.POSVARfield^;
      END{MatchNode};
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,POSREL
,match,matchnode,matchlist0items,lastmatchM1_2) END;
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
LlastM1_4_1:=L;WHILE LlastM1_4_1^.brother<>NIL DO
LlastM1_4_1:=LlastM1_4_1^.brother;
match_MU4(L,LlastM1_4_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM1_4) END;
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
LlastM1_5,LfirstM1_5,LrestM1_5,nomoretreesM1_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist1items,
LlastM1_4,LfirstM1_4,LrestM1_4,nomoretreesM1_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU3,matchlist2items,
LlastM1_3,LfirstM1_3,LrestM1_3,nomoretreesM1_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_POSREL,matchlist3items,
LlastM1_2,LfirstM1_2,LrestM1_2,nomoretreesM1_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist4items,
LlastM1_1,LfirstM1_1,LrestM1_1,nomoretreesM1_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,POSREL,PREDREL,match,matchnode,matchlist5items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>POS THEN
      match:=FALSE;
    IF match THEN
      POSREC1:=s^.ls^.POSfield^;
T1:=s;
    IF match THEN match:=(s^.ls^.POSfield^.key=auxkey('POSKEY'));
  END{MatchNode};
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}POSREC1tree:=s;
IF first THEN match:= (s^.li^.n <=0)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist0items,lastmatch) END;
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
    PROCEDURE createPOSREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := POS;
        N^.ls^.POSfield^ := POSREC1;
      END{CreateNode};
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      BEGIN
      wholelist.first:=NIL;wholelist.last:=NIL;
      END;
                                                          BEGIN{POSREL}
    LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
    list.first:=relnode;
    list.last:=relnode;
    relnode^.relation:=POSREL;
s:=POSREC1tree;
    relnode^.node:=s;
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
m:=MAKET_stree(CLAUSE);
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
m2:=loopholes.retype(Is2,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
  BEGIN
    MatchModel2(m2,TRUE,match);
    If match Then
    WHILE match AND NOT matchcondM2 DO
    BEGIN
    MatchModel2(m2,FALSE,match);
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
    hulpstree:=LDBLEX_read(auxkey('POSKEY'));
    POSREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    POSREC1:=POSREC1tree^.ls^.POSfield^;
    action0;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                          END;
COMRPOSSUBST:=result
END;
{:RPOSSUBST}
{rule:}
{:RSENTNEGSUBST}
 FUNCTION COMRSENTNEGSUBST(Is1:LISTREE_pStree;Is2:LISTREE_pStree
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
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
LinitM1_4,LrestM1_4,LfirstM1_4,LlastM1_4:LSSTREE_prelnode;
iM1_4:INTEGER;
nomoretreesM1_4,lastmatchM1_4:BOOLEAN;
LinitM1_4_1,LrestM1_4_1,LfirstM1_4_1,LlastM1_4_1:LSSTREE_prelnode;
iM1_4_1:INTEGER;
nomoretreesM1_4_1,lastmatchM1_4_1:BOOLEAN;
LinitM1_5,LrestM1_5,LfirstM1_5,LlastM1_5:LSSTREE_prelnode;
iM1_5:INTEGER;
nomoretreesM1_5,lastmatchM1_5:BOOLEAN;
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
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
PROCEDURE Matchlistreltree(L        : LSSTREE_prelNode;
                                                first    : BOOLEAN;
                                                VAR match: BOOLEAN;
                                             PROCEDURE itemfun(
                                                Lfirst,Llast:LSSTREE_prelNode;
                                                first       :BOOLEAN;
                                                VAR match   :BOOLEAN
                                                              );
                                             PROCEDURE listfun(
                                                Lrest        :LSSTREE_prelNode;
                                                first        :BOOLEAN;
                                                VAR listmatch:BOOLEAN
                                                              );
                                             VAR Llast,Lfirst,Lrest:LSSTREE_prelNode;
                                             VAR nomoretrees:BOOLEAN
                                              );
VAR itemmatch,listmatch:BOOLEAN;
BEGIN
match:=FALSE;
IF first THEN BEGIN
   nomoretrees:=FALSE;Lfirst:=NIL;
BEGIN{selectLfirstAndLlast}
  IF L=NIL THEN nomoretrees:=TRUE
  ELSE
    BEGIN
    IF Lfirst=NIL THEN
      BEGIN
      Lfirst:=L;
      Llast:=Lfirst;
      Lrest:=Llast^.brother;
      END
    ELSE
      IF Lrest=NIL THEN 
        NoMoreTrees:=TRUE
      ELSE
      BEGIN
        Llast:=Llast^.brother;
        Lrest:=Llast^.brother;
      END
    END
END;{SelectLfirstAndLlast}
   IF NOT nomoretrees THEN BEGIN
writeln('POSITION 1',clauserec1.prosubject);
      itemfun(Lfirst,Llast,TRUE,itemmatch);
writeln('POSITION 2');writeln(clauserec1.prosubject);
      IF itemmatch THEN 
        BEGIN 
writeln('POSITION 3');writeln(clauserec1.prosubject);
listfun(lrest,TRUE,listmatch);
writeln('POSITION 4');writeln(clauserec1.prosubject);
END;
      match:=(itemmatch AND listmatch)
      END;
   END
ELSE BEGIN
writeln('POSITION 1a',clauserec1.prosubject);
   itemfun(Lfirst,Llast,FALSE,match);
writeln('POSITION 2a',clauserec1.prosubject);
   IF NOT match THEN listfun(Lrest,FALSE,match);
writeln('POSITION 3a',clauserec1.prosubject);
   END;
END;

                                                      PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
writeln('0 ',clauserec1.prosubject);
drawstree_generatetree(loopholes.retype(s,listree_pstree));
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
writeln('NEGREL1 ',clauserec1.prosubject);
        IF s^.ls^.cat<>NEGVAR THEN
          match:=FALSE;
        IF match THEN
          NEGVARREC1:=s^.ls^.NEGVARfield^;
writeln('NEGREL2 ',clauserec1.prosubject);
      END{MatchNode};
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,NEGREL
,match,matchnode,matchlist0items,lastmatchM1_2);
 writeln('NEGREL3 ',clauserec1.prosubject);

END;
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
LlastM1_4_1:=L;WHILE LlastM1_4_1^.brother<>NIL DO
LlastM1_4_1:=LlastM1_4_1^.brother;
match_MU3(L,LlastM1_4_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM1_4) END;
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
LlastM1_5,LfirstM1_5,LrestM1_5,nomoretreesM1_5) END;
BEGIN writeln('0d ',clauserec1.prosubject);
LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist1items,
LlastM1_4,LfirstM1_4,LrestM1_4,nomoretreesM1_4) END;
BEGIN writeln('0c ',clauserec1.prosubject);
LSMATCHES_matchlistmu
(L,first,match,match_MU2,matchlist2items,
LlastM1_3,LfirstM1_3,LrestM1_3,nomoretreesM1_3) END;
BEGIN writeln('0b ',clauserec1.prosubject);
matchlistreltree
(L,first,match,match_NEGREL,matchlist3items,
LlastM1_2,LfirstM1_2,LrestM1_2,nomoretreesM1_2) END;
BEGIN writeln('0a ',clauserec1.prosubject);
LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist4items,
LlastM1_1,LfirstM1_1,LrestM1_1,nomoretreesM1_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,NEGREL,PREDREL,match,matchnode,matchlist5items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>NEG THEN
      match:=FALSE;
    IF match THEN
      NEGREC1:=s^.ls^.NEGfield^;
T1:=s;
    IF match THEN match:=(s^.ls^.NEGfield^.key=auxkey('NOTNEGKEY'));
  END{MatchNode};
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}NEGREC1tree:=s;
IF first THEN match:= (s^.li^.n <=0)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist0items,lastmatch) END;
                                                      PROCEDURE createM;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CLAUSE;
    N^.ls^.CLAUSEfield^ := CLAUSEREC2;
writeln('3',N^.ls^.CLAUSEfield^.prosubject);
DRAWSTREE_generatetree(loopholes.retype(N,LISTREE_pstree));
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
        N^.ls^.cat := NEG;
        N^.ls^.NEGfield^ := NEGREC1;
      END{CreateNode};
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      BEGIN
      wholelist.first:=NIL;wholelist.last:=NIL;
      END;
                                                          BEGIN{NEGREL}
    LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
    list.first:=relnode;
    list.last:=relnode;
    relnode^.relation:=NEGREL;
s:=NEGREC1tree;
    relnode^.node:=s;
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
m:=MAKET_stree(CLAUSE);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION2;
BEGIN
writeln('2a',clauserec1.prosubject);
CLAUSEREC2:=CLAUSEREC1;                               ;
CLAUSEREC2.AKTIONSARTS:=[STATIVE]                                             ;wbonus:=0;sbonus:=0;
writeln('2b',clauserec2.prosubject);

END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
m2:=loopholes.retype(Is2,LSSTREE_pStree);
match:= TRUE;
  MatchModel1(m1,TRUE,match);
writeln('1a',clauserec1.prosubject);
  If match Then
  BEGIN
    MatchModel2(m2,TRUE,match);
    If match Then
    WHILE match AND NOT matchcondM2 DO
    BEGIN
    MatchModel2(m2,FALSE,match);
    END;
    If match Then
    BEGIN
 END;
IF match THEN
  BEGIN
  IF ((CLAUSEREC1.AKTIONSARTS *[ACTIVITY,
ACCOMPLISHMENT,
STATIVE,
ACHIEVEMENT,
DYNSTATIVE]                                           <>[]                                                    )
                                                      )
                                                       THEN
    BEGIN
    MAKET_CLAUSErec(CLAUSEREC2);
writeln('1b',clauserec2.prosubject);
    hulpstree:=LDBLEX_read(auxkey('NOTNEGKEY'));
    NEGREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    NEGREC1:=NEGREC1tree^.ls^.NEGfield^;
    action2;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                          END;
COMRSENTNEGSUBST:=result
END;
{:RSENTNEGSUBST}
{rule:}
{:RSENTMELTNEGSUBST}
 FUNCTION COMRSENTMELTNEGSUBST(Is1:LISTREE_pStree;Is2:LISTREE_pStree
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
LinitM1_3,LrestM1_3,LfirstM1_3,LlastM1_3:LSSTREE_prelnode;
iM1_3:INTEGER;
nomoretreesM1_3,lastmatchM1_3:BOOLEAN;
LinitM1_4,LrestM1_4,LfirstM1_4,LlastM1_4:LSSTREE_prelnode;
iM1_4:INTEGER;
nomoretreesM1_4,lastmatchM1_4:BOOLEAN;
LinitM1_4_1,LrestM1_4_1,LfirstM1_4_1,LlastM1_4_1:LSSTREE_prelnode;
iM1_4_1:INTEGER;
nomoretreesM1_4_1,lastmatchM1_4_1:BOOLEAN;
LinitM1_5,LrestM1_5,LfirstM1_5,LlastM1_5:LSSTREE_prelnode;
iM1_5:INTEGER;
nomoretreesM1_5,lastmatchM1_5:BOOLEAN;
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
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
                                                      PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
    PROCEDURE Match_MELTNEGREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
      BEGIN{MatchNode}
        IF s^.ls^.cat<>NEGVAR THEN
          match:=FALSE;
        IF match THEN
          NEGVARREC1:=s^.ls^.NEGVARfield^;
      END{MatchNode};
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,MELTNEGREL
,match,matchnode,matchlist0items,lastmatchM1_2) END;
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
LlastM1_4_1:=L;WHILE LlastM1_4_1^.brother<>NIL DO
LlastM1_4_1:=LlastM1_4_1^.brother;
match_MU4(L,LlastM1_4_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM1_4) END;
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
LlastM1_5,LfirstM1_5,LrestM1_5,nomoretreesM1_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist1items,
LlastM1_4,LfirstM1_4,LrestM1_4,nomoretreesM1_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU2,matchlist2items,
LlastM1_3,LfirstM1_3,LrestM1_3,nomoretreesM1_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_MELTNEGREL,matchlist3items,
LlastM1_2,LfirstM1_2,LrestM1_2,nomoretreesM1_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist4items,
LlastM1_1,LfirstM1_1,LrestM1_1,nomoretreesM1_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,MELTNEGREL,PREDREL,match,matchnode,matchlist5items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>NEG THEN
      match:=FALSE;
    IF match THEN
      NEGREC1:=s^.ls^.NEGfield^;
T1:=s;
    IF match THEN match:=(s^.ls^.NEGfield^.key=auxkey('NOTNEGKEY'));
  END{MatchNode};
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}NEGREC1tree:=s;
IF first THEN match:= (s^.li^.n <=0)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist0items,lastmatch) END;
                                                      PROCEDURE createM;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CLAUSE;
    N^.ls^.CLAUSEfield^ := CLAUSEREC2;
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
        N^.ls^.cat := NEG;
        N^.ls^.NEGfield^ := NEGREC1;
      END{CreateNode};
                                                            PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
      BEGIN
      wholelist.first:=NIL;wholelist.last:=NIL;
      END;
                                                          BEGIN{MELTNEGREL}
    LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
    list.first:=relnode;
    list.last:=relnode;
    relnode^.relation:=MELTNEGREL;
s:=NEGREC1tree;
    relnode^.node:=s;
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
m:=MAKET_stree(CLAUSE);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION2;
BEGIN
CLAUSEREC2:=CLAUSEREC1;                               ;
CLAUSEREC2.AKTIONSARTS:=[STATIVE]                                             ;wbonus:=0;sbonus:=0

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
    WHILE match AND NOT matchcondM2 DO
    BEGIN
    MatchModel2(m2,FALSE,match);
    END;
    If match Then
    BEGIN
 END;
IF match THEN
  BEGIN
  IF ((CLAUSEREC1.AKTIONSARTS *[ACTIVITY,
ACCOMPLISHMENT,
STATIVE,
ACHIEVEMENT]                                          <>[]                                                    )
                                                      )
                                                       THEN
    BEGIN
    MAKET_CLAUSErec(CLAUSEREC2);
    hulpstree:=LDBLEX_read(auxkey('NOTNEGKEY'));
    NEGREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    NEGREC1:=NEGREC1tree^.ls^.NEGfield^;
    action2;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                          END;
COMRSENTMELTNEGSUBST:=result
END;
{:RSENTMELTNEGSUBST}
{rule:}
{:RVPMELTNEGSUBST}
 FUNCTION COMRVPMELTNEGSUBST(Is1:LISTREE_pStree;Is2:LISTREE_pStree
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
 m2:LSSTREE_pstree;
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
            IF s^.ls^.cat<>NEGVAR THEN
              match:=FALSE;
            IF match THEN
              NEGVARREC1:=s^.ls^.NEGVARfield^;
          END{MatchNode};
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,MELTNEGREL
,match,matchnode,matchlist0items,lastmatchM1_2_2) END;
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
BEGIN IF first THEN LSMATCHES_MRMfirst(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) ELSE BEGIN match_MELTNEGREL(LfirstM1_2_2,LfirstM1_2_2,FALSE,match);
IF NOT match THEN LSMATCHES_MRMnext(L,match,item1,LfirstM1_2_1,LlastM1_2_1
,item2,LfirstM1_2_2,LlastM1_2_2
,item3,LfirstM1_2_3,LlastM1_2_3
) END END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,PREDREL
,MELTNEGREL,match,matchnode,matchlist3items,lastmatchM1_2) END;
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
    IF s^.ls^.cat<>NEG THEN
      match:=FALSE;
    IF match THEN
      NEGREC1:=s^.ls^.NEGfield^;
T1:=s;
    IF match THEN match:=(s^.ls^.NEGfield^.key=auxkey('NOTNEGKEY'));
  END{MatchNode};
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}NEGREC1tree:=s;
IF first THEN match:= (s^.li^.n <=0)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist0items,lastmatch) END;
                                                      PROCEDURE createM;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := CLAUSE;
    N^.ls^.CLAUSEfield^ := CLAUSEREC2;
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
            N^.ls^.cat := NEG;
            N^.ls^.NEGfield^ := NEGREC1;
          END{CreateNode};
                                                                PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          BEGIN
          wholelist.first:=NIL;wholelist.last:=NIL;
          END;
                                                              BEGIN{MELTNEGREL}
        LISTREE_makerelnode(loopholes.retype(relnode,LISTREE_prelnode));
        list.first:=relnode;
        list.last:=relnode;
        relnode^.relation:=MELTNEGREL;
s:=NEGREC1tree;
        relnode^.node:=s;
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
m:=MAKET_stree(CLAUSE);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION2;
BEGIN
CLAUSEREC2:=CLAUSEREC1;                               ;
CLAUSEREC2.AKTIONSARTS:=[STATIVE]                                             ;wbonus:=0;sbonus:=0

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
    WHILE match AND NOT matchcondM2 DO
    BEGIN
    MatchModel2(m2,FALSE,match);
    END;
    If match Then
    BEGIN
 END;
IF match THEN
  BEGIN
  IF ((CLAUSEREC1.AKTIONSARTS *[ACTIVITY,
ACCOMPLISHMENT,
STATIVE,
ACHIEVEMENT]                                          <>[]                                                    )
                                                      )
                                                       THEN
    BEGIN
    MAKET_CLAUSErec(CLAUSEREC2);
    hulpstree:=LDBLEX_read(auxkey('NOTNEGKEY'));
    NEGREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    NEGREC1:=NEGREC1tree^.ls^.NEGfield^;
    action2;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                          END;
COMRVPMELTNEGSUBST:=result
END;
{:RVPMELTNEGSUBST}
{rule:}
{:RSHIFTPREPNPSUBST}
 FUNCTION COMRSHIFTPREPNPSUBST(LEVEL:INTEGER;
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
LinitM1_4,LrestM1_4,LfirstM1_4,LlastM1_4:LSSTREE_prelnode;
iM1_4:INTEGER;
nomoretreesM1_4,lastmatchM1_4:BOOLEAN;
LinitM1_4_1,LrestM1_4_1,LfirstM1_4_1,LlastM1_4_1:LSSTREE_prelnode;
iM1_4_1:INTEGER;
nomoretreesM1_4_1,lastmatchM1_4_1:BOOLEAN;
LinitM1_5,LrestM1_5,LfirstM1_5,LlastM1_5:LSSTREE_prelnode;
iM1_5:INTEGER;
nomoretreesM1_5,lastmatchM1_5:BOOLEAN;
LinitM2_1,LrestM2_1,LfirstM2_1,LlastM2_1:LSSTREE_prelnode;
iM2_1:INTEGER;
nomoretreesM2_1,lastmatchM2_1:BOOLEAN;
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
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
                                                      PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
            IF s^.ls^.cat<>NPVAR THEN
              match:=FALSE;
            IF match THEN
              NPVARREC1:=s^.ls^.NPVARfield^;
            IF match THEN
              match:= matchcondI1;
          END{MatchNode};
                                                      BEGIN{MatchTree}
                    IF first THEN REL2:= Lfirst^.relation;match:=TRUE;
              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtreeVar0rels(Lfirst^.node,first
,match,matchnode,matchlist0items,lastmatchM1_2_2) END;
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
LSMATCHES_matchtreeCon0rels(Lfirst,Llast,first,SHIFTREL
,match,matchnode,matchlist3items,lastmatchM1_2,matchcondI5) END;
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
LlastM1_4_1:=L;WHILE LlastM1_4_1^.brother<>NIL DO
LlastM1_4_1:=LlastM1_4_1^.brother;
match_MU5(L,LlastM1_4_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM1_4) END;
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
LlastM1_5,LfirstM1_5,LrestM1_5,nomoretreesM1_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist1items,
LlastM1_4,LfirstM1_4,LrestM1_4,nomoretreesM1_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU2,matchlist2items,
LlastM1_3,LfirstM1_3,LrestM1_3,nomoretreesM1_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_SHIFTREL,matchlist3items,
LlastM1_2,LfirstM1_2,LrestM1_2,nomoretreesM1_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist4items,
LlastM1_1,LfirstM1_1,LrestM1_1,nomoretreesM1_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,SHIFTREL,PREDREL,match,matchnode,matchlist5items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>NP THEN
      match:=FALSE;
    IF match THEN
      NPREC1:=s^.ls^.NPfield^;
    IF match THEN
      match:= matchcondI3;
T3:=s;
  END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    PROCEDURE Match_MU7(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU7.first:=Lfirst;
        MU7.last:=Llast;
        match:= matchcondI7;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU7(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU7(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM2_1:=L;WHILE LlastM2_1^.brother<>NIL DO
LlastM2_1:=LlastM2_1^.brother;
match_MU7(L,LlastM2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist1items,lastmatch) END;
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
    PROCEDURE createSHIFTREL(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := PREPP;
        N^.ls^.PREPPfield^ := PREPPREC2;
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
            PROCEDURE createMU8(VAR list:LSMRUQUO_ListOfStrees);
            BEGIN{MU8}
            copylist(MU8,list);
            END{MU8};
                                                                BEGIN{createitem21}
          createMU8(list);
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
m:=MAKET_stree(CLAUSE);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION5;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC1,MU7,NPREC2,MU8,NPVARREC1.
CASES)                                                ;
PREPPREC2:=PREPPREC1;                                 ;
PREPPREC2.MOOD:=NOWH
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION9;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC1,MU7,NPREC2,MU8,NPVARREC1.
CASES)                                                ;
PREPPREC2:=PREPPREC1;                                 ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION13;
BEGIN
NPREC2.GENERIC:=OMEGAGENERIC
                                                      ;
NPREC2.SUPERDEIXIS:=OMEGADEIXIS
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
(NPVARREC1.animate=NPREC1loc.animate)AND
(NPVARREC1.human=NPREC1loc.human)AND
(NPVARREC1.actcomas=NPREC1loc.actcomas)AND
(NPVARREC1.thetanp=NPREC1loc.thetanp)AND
(NPVARREC1.nounpatternefs=NPREC1loc.nounpatternefs)AND
(NPVARREC1.generic=NPREC1loc.generic)AND
(NPVARREC1.posspred=NPREC1loc.posspred)AND
(NPVARREC1.possnietnp=NPREC1loc.possnietnp)AND
(NPVARREC1.syntquant=NPREC1loc.syntquant)AND
(NPVARREC1.NPhead=NPREC1loc.NPhead)AND
(NPVARREC1.specQ=NPREC1loc.specQ)AND
(NPVARREC1.poss=NPREC1loc.poss)AND
(NPVARREC1.coord=NPREC1loc.coord)
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
    WHILE match AND NOT matchcondM2 DO
    BEGIN
    MatchModel2(m2,FALSE,match);
    END;
    If match Then
    BEGIN
 END;
IF match THEN
  BEGIN
  IF ((except1                                               )
                                                      )
THEN IF
          ((NPREC1.CASES =[]                                                    )
                                                      )
THEN IF
          ((NPREC1.GENERIC =NOGENERIC                             )
                                                      )
THEN IF
          ((LSMRUQUO_DEIXISMAX(CLAUSEREC1
.DEIXIS
,CLAUSEREC1
.SUPERDEIXIS
,NPREC1
.SUPERDEIXIS
)                                                     )
                                                      )
                                                       THEN
    BEGIN
    IF ((NPVARREC1.MOOD =TOPICMOOD                             )
                                                      )
THEN IF
          ((PREPPREC1.MOOD =TOPICMOOD                             )
                                                      )
THEN IF
          ((NPREC1.MOOD =NOWH                                     )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPrec(PREPPREC2);
      MAKET_NPrec(NPREC2);
      action5;
      action13;
      createM;
      Is:=loopholes.retype(m,LISTREE_pstree);
      LISTREE_appendstreebonus(Is,result,wbonus);
      END;
    IF ((NPVARREC1.MOOD =WH                                    )
                                                      )
THEN IF
          ((PREPPREC1.MOOD =WH                                    )
                                                      )
THEN IF
          ((NPREC1.MOOD =WH                                       )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPrec(PREPPREC2);
      MAKET_NPrec(NPREC2);
      action9;
      action13;
      createM;
      Is:=loopholes.retype(m,LISTREE_pstree);
      LISTREE_appendstreebonus(Is,result,wbonus);
      END;
                                                          END;
                                                        END;
                                                          END;
COMRSHIFTPREPNPSUBST:=result
END;
{:RSHIFTPREPNPSUBST}
{rule:}
{:RSHIFTVARPREPNPSUBST}
 FUNCTION COMRSHIFTVARPREPNPSUBST(LEVEL:INTEGER;
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
LinitM1_4,LrestM1_4,LfirstM1_4,LlastM1_4:LSSTREE_prelnode;
iM1_4:INTEGER;
nomoretreesM1_4,lastmatchM1_4:BOOLEAN;
LinitM1_4_1,LrestM1_4_1,LfirstM1_4_1,LlastM1_4_1:LSSTREE_prelnode;
iM1_4_1:INTEGER;
nomoretreesM1_4_1,lastmatchM1_4_1:BOOLEAN;
LinitM1_5,LrestM1_5,LfirstM1_5,LlastM1_5:LSSTREE_prelnode;
iM1_5:INTEGER;
nomoretreesM1_5,lastmatchM1_5:BOOLEAN;
LinitM2_1,LrestM2_1,LfirstM2_1,LlastM2_1:LSSTREE_prelnode;
iM2_1:INTEGER;
nomoretreesM2_1,lastmatchM2_1:BOOLEAN;
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
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
                                                      PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
        IF s^.ls^.cat<>VARPREPP THEN
          match:=FALSE;
        IF match THEN
          VARPREPPREC1:=s^.ls^.VARPREPPfield^;
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
              NPVARREC1:=s^.ls^.NPVARfield^;
            IF match THEN
              match:= matchcondI1;
          END{MatchNode};
                                                      BEGIN{MatchTree}
                    IF first THEN REL2:= Lfirst^.relation;match:=TRUE;
              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtreeVar0rels(Lfirst^.node,first
,match,matchnode,matchlist0items,lastmatchM1_2_2) END;
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
LSMATCHES_matchtree0rels(Lfirst,Llast,first,SHIFTREL
,match,matchnode,matchlist3items,lastmatchM1_2) END;
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
LlastM1_4_1:=L;WHILE LlastM1_4_1^.brother<>NIL DO
LlastM1_4_1:=LlastM1_4_1^.brother;
match_MU5(L,LlastM1_4_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,PREDREL
,match,matchnode,matchlist1items,lastmatchM1_4) END;
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
LlastM1_5,LfirstM1_5,LrestM1_5,nomoretreesM1_5) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist1items,
LlastM1_4,LfirstM1_4,LrestM1_4,nomoretreesM1_4) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU2,matchlist2items,
LlastM1_3,LfirstM1_3,LrestM1_3,nomoretreesM1_3) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_SHIFTREL,matchlist3items,
LlastM1_2,LfirstM1_2,LrestM1_2,nomoretreesM1_2) END;
BEGIN LSMATCHES_matchlistmu
(L,first,match,match_MU1,matchlist4items,
LlastM1_1,LfirstM1_1,LrestM1_1,nomoretreesM1_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,SHIFTREL,PREDREL,match,matchnode,matchlist5items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>NP THEN
      match:=FALSE;
    IF match THEN
      NPREC1:=s^.ls^.NPfield^;
    IF match THEN
      match:= matchcondI3;
T3:=s;
  END{MatchNode};
                                                      PROCEDURE MatchList1Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    PROCEDURE Match_MU7(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    BEGIN{match}
      IF first THEN BEGIN
        MU7.first:=Lfirst;
        MU7.last:=Llast;
        match:= matchcondI7;
      END
      ELSE match:=FALSE
    END;
                                                      PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);
BEGIN match_MU7(Lfirst,Llast,TRUE,match);
END;
BEGIN IF first THEN BEGIN IF L=NIL THEN
match_MU7(NIL,NIL,TRUE,match) ELSE BEGIN
LlastM2_1:=L;WHILE LlastM2_1^.brother<>NIL DO
LlastM2_1:=LlastM2_1^.brother;
match_MU7(L,LlastM2_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist1items,lastmatch) END;
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
            N^.ls^.cat := NP;
            N^.ls^.NPfield^ := NPREC2;
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
m:=MAKET_stree(CLAUSE);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION5;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC1,MU7,NPREC2,MU8,NPVARREC1.
CASES)                                                ;
PREPPREC1:=VARPREPPREC1;                              ;
PREPPREC1.MOOD:=NOWH
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION9;
BEGIN
LSMRUQUO_ASSIGNCASE(NPREC1,MU7,NPREC2,MU8,NPVARREC1.
CASES)                                                ;
PREPPREC1:=VARPREPPREC1;                              ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION13;
BEGIN
NPREC2.GENERIC:=OMEGAGENERIC
                                                      ;
NPREC2.SUPERDEIXIS:=OMEGADEIXIS
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
(NPVARREC1.animate=NPREC1loc.animate)AND
(NPVARREC1.human=NPREC1loc.human)AND
(NPVARREC1.actcomas=NPREC1loc.actcomas)AND
(NPVARREC1.thetanp=NPREC1loc.thetanp)AND
(NPVARREC1.nounpatternefs=NPREC1loc.nounpatternefs)AND
(NPVARREC1.generic=NPREC1loc.generic)AND
(NPVARREC1.posspred=NPREC1loc.posspred)AND
(NPVARREC1.possnietnp=NPREC1loc.possnietnp)AND
(NPVARREC1.syntquant=NPREC1loc.syntquant)AND
(NPVARREC1.NPhead=NPREC1loc.NPhead)AND
(NPVARREC1.specQ=NPREC1loc.specQ)AND
(NPVARREC1.poss=NPREC1loc.poss)AND
(NPVARREC1.coord=NPREC1loc.coord)
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
    WHILE match AND NOT matchcondM2 DO
    BEGIN
    MatchModel2(m2,FALSE,match);
    END;
    If match Then
    BEGIN
 END;
IF match THEN
  BEGIN
  IF ((except1                                               )
                                                      )
THEN IF
          ((NPREC1.CASES =[]                                                    )
                                                      )
THEN IF
          ((NPREC1.GENERIC =NOGENERIC                             )
                                                      )
THEN IF
          ((LSMRUQUO_DEIXISMAX(CLAUSEREC1
.DEIXIS
,CLAUSEREC1
.SUPERDEIXIS
,NPREC1
.SUPERDEIXIS
)                                                     )
                                                      )
                                                       THEN
    BEGIN
    IF ((NPVARREC1.MOOD =TOPICMOOD                             )
                                                      )
THEN IF
          ((VARPREPPREC1.MOOD =TOPICMOOD                          )
                                                      )
THEN IF
          ((NPREC1.MOOD =NOWH                                     )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPrec(PREPPREC1);
      MAKET_NPrec(NPREC2);
      action5;
      action13;
      createM;
      Is:=loopholes.retype(m,LISTREE_pstree);
      LISTREE_appendstreebonus(Is,result,wbonus);
      END;
    IF ((NPVARREC1.MOOD =WH                                    )
                                                      )
THEN IF
          ((VARPREPPREC1.MOOD =WH                                 )
                                                      )
THEN IF
          ((NPREC1.MOOD =WH                                       )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPrec(PREPPREC1);
      MAKET_NPrec(NPREC2);
      action9;
      action13;
      createM;
      Is:=loopholes.retype(m,LISTREE_pstree);
      LISTREE_appendstreebonus(Is,result,wbonus);
      END;
                                                          END;
                                                        END;
                                                          END;
COMRSHIFTVARPREPNPSUBST:=result
END;
{:RSHIFTVARPREPNPSUBST}
