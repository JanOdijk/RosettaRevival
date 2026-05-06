(*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LSMATCHES
 *  Creation date   :  07-APR-1987
 *  Author          : rene leermakers
 *
 *  Copyright (c) 1987, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : Contains matching procedures for use in translated
 *                    Mrules
 *
 *EMP:::===================================================================*)

Export(LSMATCHES);
pragma C_include('maket.pf');
pragma C_include('string.pf');
pragma C_include('lsmruquo.pf');
pragma C_include('strtokey.pf');
pragma C_include('listree.pf');
pragma C_include('lidomaint.pf');
pragma C_include('lsstree.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('limatches.pf');
pragma C_include('lsmatches.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM LSMATCHES;
WITH MAKET, STRNG, LSMRUQUO, STRTOKEY, LISTREE, LIDOMAINT, 
     LSSTREE, LSDOMAINT, LIMATCHES;

FUNCTION NEGCAND(bool:BOOLEAN;FUNCTION boolfun:BOOLEAN):BOOLEAN;
BEGIN
IF bool THEN NEGCAND:=NOT(boolfun) ELSE NEGCAND:=FALSE
END;
FUNCTION store(VAR vpid1:LSDOMAINT_synpatterntype;vpid2:LSDOMAINT_synpatterntype):LSDOMAINT_synpatterntype;
BEGIN
vpid1:=vpid2;
store:=vpid2
END;
FUNCTION auxkey(strkey:STRING_string):INTEGER;
VAR int:INTEGER;
BEGIN
 STRTOKEY_getSkeyHash(strkey,int); auxkey:=int;
END;
PROCEDURE MatchList0Items(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
BEGIN
  IF first THEN match := (L=NIL) ELSE match:=FALSE
END;
FUNCTION numberofelements(L:LSMRUQUO_Listofstrees):INTEGER;
VAR result:INTEGER;
BEGIN
result:=0;
WHILE L.first<>NIL DO
 BEGIN
 result:=result+1;
 L.first:=L.first^.brother
 END;
numberofelements:=result
END;
PROCEDURE copylist(L1:LSMRUQUO_Listofstrees;VAR L2:LSMRUQUO_Listofstrees);
VAR p,p1:LSSTREE_prelnode;
BEGIN
IF L1.first=NIL THEN L2:=L1
ELSE
 BEGIN
 LISTREE_makerelnode(Loopholes.Retype(p1,LISTREE_prelnode));
 p:=p1;
 p1^:=L1.first^;
 p1^.brother:=NIL;
 L2.first:=p1;
 WHILE L1.first<>L1.last DO
 BEGIN
 L1.first:=L1.first^.brother;
 LISTREE_makerelnode(Loopholes.Retype(p1,LISTREE_prelnode));
 p^.brother:=p1;
 p:=p1;
 p1^:=L1.first^;
 p1^.brother:=NIL;
 END;
 L2.last:=p
 END;
END;
PROCEDURE TcelesLfirstAndLlast(VAR Lfirst,Llast,Lrest:LSSTREE_pRelNode;
          VAR NoMoreTrees:BOOLEAN;
          L:LSSTREE_pRelNode);
BEGIN
IF (L=NIL) OR (Lrest=NIL) THEN nomoretrees:=TRUE
ELSE
  BEGIN
  IF Lfirst=NIL THEN
    BEGIN
    Llast:=Lrest;
    Lfirst:=Lrest
    END
  ELSE
    BEGIN
    Lfirst:=Lrest
    END;
  IF Lfirst=L THEN Lrest:=NIL
  ELSE
    BEGIN
    Lrest:=L;
    WHILE Lrest^.brother<>Lfirst DO
      BEGIN
      Lrest:=Lrest^.brother
      END
    END
  END
END;{TcelesLfirstAndLlast}
PROCEDURE SelectLfirstAndLlast(VAR Lfirst,Llast,Lrest:LSSTREE_pRelNode;
          VAR NoMoreTrees:BOOLEAN;
          L:LSSTREE_pRelNode);
BEGIN
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


PROCEDURE LSMATCHES_Matchlistsigma( L        : LSSTREE_prelNode;
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
                                             VAR nomoretrees:BOOLEAN;
                                             VAR i:INTEGER
                                            );
VAR itemmatch,listmatch:BOOLEAN;
BEGIN
match:=FALSE;
IF first THEN BEGIN
   nomoretrees:=FALSE;Llast:=NIL;Lfirst:=NIL;Lrest:=L
   END
ELSE BEGIN
   itemfun(Lfirst,Llast,FALSE,match);
   IF NOT match THEN listfun(Lrest,FALSE,match)
   END;
IF NOT(first OR nomoretrees OR match) THEN 
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
IF first THEN i:=0;
WHILE (NOT match) AND (NOT nomoretrees) AND (i<=1) DO BEGIN
   i:=i+1;
   itemfun(Lfirst,llast,TRUE,itemmatch);
   IF itemmatch THEN listfun(lrest,TRUE,listmatch);
   match:=(itemmatch AND listmatch);
   IF NOT match THEN
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
   END;
END;


PROCEDURE LSMATCHES_Matchlistmu(L        : LSSTREE_prelNode;
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
   nomoretrees:=FALSE;Llast:=NIL;Lfirst:=NIL;Lrest:=L
   END
ELSE BEGIN
   itemfun(Lfirst,Llast,FALSE,match);
   IF NOT match THEN listfun(Lrest,FALSE,match)
   END;
IF NOT(first OR nomoretrees OR match) THEN 
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
WHILE (NOT match) AND (NOT nomoretrees) DO BEGIN
   itemfun(Lfirst,llast,TRUE,itemmatch);
   IF itemmatch THEN listfun(lrest,TRUE,listmatch);
   match:=(itemmatch AND listmatch);
   IF NOT match THEN
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
   END;
END;

PROCEDURE LSMATCHES_Matchlistreltree(L        : LSSTREE_prelNode;
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
      itemfun(Lfirst,Llast,TRUE,itemmatch);
      IF itemmatch THEN listfun(lrest,TRUE,listmatch);
      match:=(itemmatch AND listmatch)
      END;
   END
ELSE BEGIN
   itemfun(Lfirst,Llast,FALSE,match);
   IF NOT match THEN listfun(Lrest,FALSE,match)
   END;
END;


PROCEDURE LSMATCHES_Matchtree0rels(Lfirst,Llast     : LSSTREE_prelNode;
                                         first          : BOOLEAN;
                                         relation       : LSDOMAINT_synrel;
                                         VAR match: BOOLEAN;
                                         PROCEDURE nodefun(
                                                stree:LSSTREE_pstree;
                                                VAR match   :BOOLEAN
                                                          );
                                         PROCEDURE listfun(
                                                list         :LSSTREE_prelNode;
                                                first        :BOOLEAN;
                                                VAR listmatch:BOOLEAN
                                                              );
                                         VAR lastmatch: BOOLEAN
                                              );
VAR stree:LSSTREE_pstree;
BEGIN
IF first THEN BEGIN
   match:=(Lfirst^.relation=relation);
   IF match THEN BEGIN
      stree:=Lfirst^.node;
      nodefun(stree,match);
      IF match THEN listfun(stree^.sons,TRUE,match)
      END;
   END
ELSE BEGIN
   If lastmatch THEN listfun(Lfirst^.node^.sons,FALSE,match) ELSE match:=FALSE
   END;
lastmatch:=match
END;

PROCEDURE LSMATCHES_Matchtree1rels(Lfirst,Llast     : LSSTREE_prelNode;
                                         first          : BOOLEAN;
                                         relation,rel1  : LSDOMAINT_synrel;
                                         VAR match: BOOLEAN;
                                         PROCEDURE nodefun(
                                                stree:LSSTREE_pstree;
                                                VAR match   :BOOLEAN
                                                          );
                                         PROCEDURE listfun(
                                                list         :LSSTREE_prelNode;
                                                first        :BOOLEAN;
                                                VAR listmatch:BOOLEAN
                                                              );
                                         VAR lastmatch: BOOLEAN
                                              );
VAR stree:LSSTREE_pstree;
BEGIN
IF first THEN BEGIN
   match:=(Lfirst^.relation=relation);
   IF match THEN BEGIN
      stree:=Lfirst^.node;
      nodefun(stree,match);
      IF match THEN 
         match:=LImatches_TEST1rels(Loopholes.Retype(rel1,LIDOMAINT_synrel),
                     Loopholes.Retype(stree^.sons,LISTREE_prelnode),FALSE);
      IF match THEN listfun(stree^.sons,TRUE,match)
      END;
   END
ELSE BEGIN
   If lastmatch THEN listfun(Lfirst^.node^.sons,FALSE,match) ELSE match:=FALSE
   END;
lastmatch:=match
END;

PROCEDURE LSMATCHES_Matchtree2rels(Lfirst,Llast     : LSSTREE_prelNode;
                                         first          : BOOLEAN;
                                         relation,rel1,rel2  : LSDOMAINT_synrel;
                                         VAR match: BOOLEAN;
                                         PROCEDURE nodefun(
                                                stree:LSSTREE_pstree;
                                                VAR match   :BOOLEAN
                                                          );
                                         PROCEDURE listfun(
                                                list         :LSSTREE_prelNode;
                                                first        :BOOLEAN;
                                                VAR listmatch:BOOLEAN
                                                              );
                                         VAR lastmatch: BOOLEAN
                                              );
VAR stree:LSSTREE_pstree;
BEGIN
IF first THEN BEGIN
   match:=(Lfirst^.relation=relation);
   IF match THEN BEGIN
      stree:=Lfirst^.node;
      nodefun(stree,match);
      IF match THEN match:=LImatches_TEST2rels(Loopholes.Retype(rel1,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel2,LIDOMAINT_synrel),
                                               Loopholes.Retype(stree^.sons,LISTREE_prelnode),FALSE);
      IF match THEN listfun(stree^.sons,TRUE,match)
      END;
   END
ELSE BEGIN
   If lastmatch THEN listfun(Lfirst^.node^.sons,FALSE,match) ELSE match:=FALSE
   END;
lastmatch:=match
END;

PROCEDURE LSMATCHES_Matchtree3rels(Lfirst,Llast     : LSSTREE_prelNode;
                                         first          : BOOLEAN;
                                         relation,rel1,rel2,rel3: LSDOMAINT_synrel;
                                         VAR match: BOOLEAN;
                                         PROCEDURE nodefun(
                                                stree:LSSTREE_pstree;
                                                VAR match   :BOOLEAN
                                                          );
                                         PROCEDURE listfun(
                                                list         :LSSTREE_prelNode;
                                                first        :BOOLEAN;
                                                VAR listmatch:BOOLEAN
                                                              );
                                         VAR lastmatch: BOOLEAN
                                              );
VAR stree:LSSTREE_pstree;
BEGIN
IF first THEN BEGIN
   match:=(Lfirst^.relation=relation);
   IF match THEN BEGIN
      stree:=Lfirst^.node;
      nodefun(stree,match);
      IF match THEN match:=LImatches_TEST3rels(Loopholes.Retype(rel1,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel2,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel3,LIDOMAINT_synrel),
                                               Loopholes.Retype(stree^.sons,LISTREE_prelnode),FALSE);
      IF match THEN listfun(stree^.sons,TRUE,match)
      END;
   END
ELSE BEGIN
   If lastmatch THEN listfun(Lfirst^.node^.sons,FALSE,match) ELSE match:=FALSE
   END;
lastmatch:=match
END;

PROCEDURE LSMATCHES_Matchtree4rels(Lfirst,Llast     : LSSTREE_prelNode;
                                         first          : BOOLEAN;
                                         relation,rel1,rel2,rel3,rel4: LSDOMAINT_synrel;
                                         VAR match: BOOLEAN;
                                         PROCEDURE nodefun(
                                                stree:LSSTREE_pstree;
                                                VAR match   :BOOLEAN
                                                          );
                                         PROCEDURE listfun(
                                                list         :LSSTREE_prelNode;
                                                first        :BOOLEAN;
                                                VAR listmatch:BOOLEAN
                                                              );
                                         VAR lastmatch: BOOLEAN
                                              );
VAR stree:LSSTREE_pstree;
BEGIN
IF first THEN BEGIN
   match:=(Lfirst^.relation=relation);
   IF match THEN BEGIN
      stree:=Lfirst^.node;
      nodefun(stree,match);
      IF match THEN match:=LImatches_TEST4rels(Loopholes.Retype(rel1,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel2,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel3,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel4,LIDOMAINT_synrel),
                                               Loopholes.Retype(stree^.sons,LISTREE_prelnode),FALSE);
      IF match THEN listfun(stree^.sons,TRUE,match)
      END;
   END
ELSE BEGIN
   If lastmatch THEN listfun(Lfirst^.node^.sons,FALSE,match) ELSE match:=FALSE
   END;
lastmatch:=match
END;

PROCEDURE LSMATCHES_MatchtreeVar0rels(stree:LSSTREE_pstree;
                                         first          : BOOLEAN;
                                         VAR match: BOOLEAN;
                                         PROCEDURE nodefun(
                                                stree:LSSTREE_pstree;
                                                VAR match   :BOOLEAN
                                                          );
                                         PROCEDURE listfun(
                                                list         :LSSTREE_prelNode;
                                                first        :BOOLEAN;
                                                VAR listmatch:BOOLEAN
                                                              );
                                         VAR lastmatch: BOOLEAN
                                              );
BEGIN
IF first THEN BEGIN
   match:=TRUE;
   nodefun(stree,match);
   IF match THEN listfun(stree^.sons,TRUE,match)
   END
ELSE BEGIN
   If lastmatch THEN listfun(stree^.sons,FALSE,match) ELSE match:=FALSE
   END;
lastmatch:=match
END;

PROCEDURE LSMATCHES_MatchtreeVar1rels(stree:LSSTREE_pstree;
                                         first          : BOOLEAN;
                                         rel1  : LSDOMAINT_synrel;
                                         VAR match: BOOLEAN;
                                         PROCEDURE nodefun(
                                                stree:LSSTREE_pstree;
                                                VAR match   :BOOLEAN
                                                          );
                                         PROCEDURE listfun(
                                                list         :LSSTREE_prelNode;
                                                first        :BOOLEAN;
                                                VAR listmatch:BOOLEAN
                                                              );
                                         VAR lastmatch: BOOLEAN
                                              );
BEGIN
IF first THEN BEGIN
   match:=TRUE;
   nodefun(stree,match);
   IF match THEN 
         match:=LImatches_TEST1rels(Loopholes.Retype(rel1,LIDOMAINT_synrel),
                                    Loopholes.Retype(stree^.sons,LISTREE_prelnode),FALSE);
   IF match THEN listfun(stree^.sons,TRUE,match)
   END
ELSE BEGIN
   If lastmatch THEN listfun(stree^.sons,FALSE,match) ELSE match:=FALSE
   END;
lastmatch:=match
END;

PROCEDURE LSMATCHES_MatchtreeVar2rels(stree:LSSTREE_pstree;
                                         first          : BOOLEAN;
                                         rel1,rel2  : LSDOMAINT_synrel;
                                         VAR match: BOOLEAN;
                                         PROCEDURE nodefun(
                                                stree:LSSTREE_pstree;
                                                VAR match   :BOOLEAN
                                                          );
                                         PROCEDURE listfun(
                                                list         :LSSTREE_prelNode;
                                                first        :BOOLEAN;
                                                VAR listmatch:BOOLEAN
                                                              );
                                         VAR lastmatch: BOOLEAN
                                              );
BEGIN
IF first THEN BEGIN
   match:=TRUE;
   nodefun(stree,match);
   IF match THEN match:=LImatches_TEST2rels(Loopholes.Retype(rel1,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel2,LIDOMAINT_synrel),
                                               Loopholes.Retype(stree^.sons,LISTREE_prelnode),FALSE);
   IF match THEN listfun(stree^.sons,TRUE,match)
   END
ELSE BEGIN
   If lastmatch THEN listfun(stree^.sons,FALSE,match) ELSE match:=FALSE
   END;
lastmatch:=match
END;

PROCEDURE LSMATCHES_MatchtreeVar3rels(stree:LSSTREE_pstree;
                                         first          : BOOLEAN;
                                         rel1,rel2,rel3: LSDOMAINT_synrel;
                                         VAR match: BOOLEAN;
                                         PROCEDURE nodefun(
                                                stree:LSSTREE_pstree;
                                                VAR match   :BOOLEAN
                                                          );
                                         PROCEDURE listfun(
                                                list         :LSSTREE_prelNode;
                                                first        :BOOLEAN;
                                                VAR listmatch:BOOLEAN
                                                              );
                                         VAR lastmatch: BOOLEAN
                                              );
BEGIN
IF first THEN BEGIN
   match:=TRUE;
   nodefun(stree,match);
   IF match THEN match:=LImatches_TEST3rels(Loopholes.Retype(rel1,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel2,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel3,LIDOMAINT_synrel),
                                               Loopholes.Retype(stree^.sons,LISTREE_prelnode),FALSE);
   IF match THEN listfun(stree^.sons,TRUE,match)
   END
ELSE BEGIN
   If lastmatch THEN listfun(stree^.sons,FALSE,match) ELSE match:=FALSE
   END;
lastmatch:=match
END;

PROCEDURE LSMATCHES_MatchtreeVar4rels(stree:LSSTREE_pstree;
                                         first          : BOOLEAN;
                                         rel1,rel2,rel3,rel4: LSDOMAINT_synrel;
                                         VAR match: BOOLEAN;
                                         PROCEDURE nodefun(
                                                stree:LSSTREE_pstree;
                                                VAR match   :BOOLEAN
                                                          );
                                         PROCEDURE listfun(
                                                list         :LSSTREE_prelNode;
                                                first        :BOOLEAN;
                                                VAR listmatch:BOOLEAN
                                                              );
                                         VAR lastmatch: BOOLEAN
                                              );
BEGIN
IF first THEN BEGIN
   match:=TRUE;
   nodefun(stree,match);
   IF match THEN match:=LImatches_TEST4rels(Loopholes.Retype(rel1,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel2,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel3,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel4,LIDOMAINT_synrel),
                                               Loopholes.Retype(stree^.sons,LISTREE_prelnode),FALSE);
   IF match THEN listfun(stree^.sons,TRUE,match)
   END
ELSE BEGIN
   If lastmatch THEN listfun(stree^.sons,FALSE,match) ELSE match:=FALSE
   END;
lastmatch:=match
END;

PROCEDURE LSMATCHES_matchtreeCon0rels(Lfirst,Llast     : LSSTREE_prelNode;
                                         first          : BOOLEAN;
                                         relation       : LSDOMAINT_synrel;
                                         VAR match: BOOLEAN;
                                         PROCEDURE nodefun(
                                                stree:LSSTREE_pstree;
                                                VAR match   :BOOLEAN
                                                          );
                                         PROCEDURE listfun(
                                                list         :LSSTREE_prelNode;
                                                first        :BOOLEAN;
                                                VAR listmatch:BOOLEAN
                                                              );
                                         VAR lastmatch: BOOLEAN;
                                         FUNCTION matchcondition:BOOLEAN
                                              );
VAR stree:LSSTREE_pstree;
BEGIN
IF first THEN BEGIN
   match:=(Lfirst^.relation=relation);
   IF match THEN BEGIN
      stree:=Lfirst^.node;
      nodefun(stree,match);
      IF match THEN listfun(stree^.sons,TRUE,match);
      WHILE NEGCAND(match,matchcondition) DO listfun(stree^.sons,FALSE,match);
      END;
   END
ELSE BEGIN
   IF lastmatch THEN listfun(Lfirst^.node^.sons,FALSE,match) ELSE match:=FALSE;
   WHILE NEGCAND(match,matchcondition) DO listfun(Lfirst^.node^.sons,FALSE,match);
   END;
lastmatch:=match
END;

PROCEDURE LSMATCHES_matchtreeCon1rels(Lfirst,Llast     : LSSTREE_prelNode;
                                         first          : BOOLEAN;
                                         relation,rel1  : LSDOMAINT_synrel;
                                         VAR match: BOOLEAN;
                                         PROCEDURE nodefun(
                                                stree:LSSTREE_pstree;
                                                VAR match   :BOOLEAN
                                                          );
                                         PROCEDURE listfun(
                                                list         :LSSTREE_prelNode;
                                                first        :BOOLEAN;
                                                VAR listmatch:BOOLEAN
                                                              );
                                         VAR lastmatch: BOOLEAN;FUNCTION matchcondition:BOOLEAN
                                              );
VAR stree:LSSTREE_pstree;
BEGIN
IF first THEN BEGIN
   match:=(Lfirst^.relation=relation);
   IF match THEN BEGIN
      stree:=Lfirst^.node;
      nodefun(stree,match);
      IF match THEN 
         match:=LImatches_TEST1rels(Loopholes.Retype(rel1,LIDOMAINT_synrel),
             Loopholes.Retype(stree^.sons,LISTREE_prelnode),FALSE);
      IF match THEN listfun(stree^.sons,TRUE,match);
      WHILE NEGCAND(match,matchcondition) DO listfun(stree^.sons,FALSE,match);
      END;
   END
ELSE BEGIN
   If lastmatch THEN listfun(Lfirst^.node^.sons,FALSE,match) ELSE match:=FALSE;
   WHILE NEGCAND(match,matchcondition) DO listfun(Lfirst^.node^.sons,FALSE,match);
   END;
lastmatch:=match
END;

PROCEDURE LSMATCHES_matchtreeCon2rels(Lfirst,Llast     : LSSTREE_prelNode;
                                         first          : BOOLEAN;
                                         relation,rel1,rel2  : LSDOMAINT_synrel;
                                         VAR match: BOOLEAN;
                                         PROCEDURE nodefun(
                                                stree:LSSTREE_pstree;
                                                VAR match   :BOOLEAN
                                                          );
                                         PROCEDURE listfun(
                                                list         :LSSTREE_prelNode;
                                                first        :BOOLEAN;
                                                VAR listmatch:BOOLEAN
                                                              );
                                         VAR lastmatch: BOOLEAN;
                                         FUNCTION matchcondition:BOOLEAN
                                              );
VAR stree:LSSTREE_pstree;
BEGIN
IF first THEN BEGIN
   match:=(Lfirst^.relation=relation);
   IF match THEN BEGIN
      stree:=Lfirst^.node;
      nodefun(stree,match);
      IF match THEN match:=LImatches_TEST2rels(Loopholes.Retype(rel1,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel2,LIDOMAINT_synrel),
                                               Loopholes.Retype(stree^.sons,LISTREE_prelnode),FALSE);
      IF match THEN listfun(stree^.sons,TRUE,match);
      WHILE NEGCAND(match,matchcondition) DO listfun(stree^.sons,FALSE,match);
      END;
   END
ELSE BEGIN
   If lastmatch THEN listfun(Lfirst^.node^.sons,FALSE,match) ELSE match:=FALSE;
   WHILE NEGCAND(match,matchcondition) DO listfun(Lfirst^.node^.sons,FALSE,match);
   END;
lastmatch:=match
END;

PROCEDURE LSMATCHES_matchtreeCon3rels(Lfirst,Llast     : LSSTREE_prelNode;
                                         first          : BOOLEAN;
                                         relation,rel1,rel2,rel3: LSDOMAINT_synrel;
                                         VAR match: BOOLEAN;
                                         PROCEDURE nodefun(
                                                stree:LSSTREE_pstree;
                                                VAR match   :BOOLEAN
                                                          );
                                         PROCEDURE listfun(
                                                list         :LSSTREE_prelNode;
                                                first        :BOOLEAN;
                                                VAR listmatch:BOOLEAN
                                                              );
                                         VAR lastmatch: BOOLEAN;
                                         FUNCTION matchcondition:BOOLEAN
                                              );
VAR stree:LSSTREE_pstree;
BEGIN
IF first THEN BEGIN
   match:=(Lfirst^.relation=relation);
   IF match THEN BEGIN
      stree:=Lfirst^.node;
      nodefun(stree,match);
      IF match THEN match:=LImatches_TEST3rels(Loopholes.Retype(rel1,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel2,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel3,LIDOMAINT_synrel),
                                               Loopholes.Retype(stree^.sons,LISTREE_prelnode),FALSE);
      IF match THEN listfun(stree^.sons,TRUE,match);
      WHILE NEGCAND(match,matchcondition) DO listfun(stree^.sons,FALSE,match);
      END;
   END
ELSE BEGIN
   If lastmatch THEN listfun(Lfirst^.node^.sons,FALSE,match) ELSE match:=FALSE;
   WHILE NEGCAND(match,matchcondition) DO listfun(Lfirst^.node^.sons,FALSE,match);
   END;
lastmatch:=match
END;

PROCEDURE LSMATCHES_matchtreeCon4rels(Lfirst,Llast     : LSSTREE_prelNode;
                                         first          : BOOLEAN;
                                         relation,rel1,rel2,rel3,rel4: LSDOMAINT_synrel;
                                         VAR match: BOOLEAN;
                                         PROCEDURE nodefun(
                                                stree:LSSTREE_pstree;
                                                VAR match   :BOOLEAN
                                                          );
                                         PROCEDURE listfun(
                                                list         :LSSTREE_prelNode;
                                                first        :BOOLEAN;
                                                VAR listmatch:BOOLEAN
                                                              );
                                         VAR lastmatch: BOOLEAN;
                                         FUNCTION matchcondition:BOOLEAN
                                              );
VAR stree:LSSTREE_pstree;
BEGIN
IF first THEN BEGIN
   match:=(Lfirst^.relation=relation);
   IF match THEN BEGIN
      stree:=Lfirst^.node;
      nodefun(stree,match);
      IF match THEN match:=LImatches_TEST4rels(Loopholes.Retype(rel1,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel2,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel3,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel4,LIDOMAINT_synrel),
                                               Loopholes.Retype(stree^.sons,LISTREE_prelnode),FALSE);
      IF match THEN listfun(stree^.sons,TRUE,match);
      WHILE NEGCAND(match,matchcondition) DO listfun(stree^.sons,FALSE,match);
      END;
   END
ELSE BEGIN
   IF lastmatch THEN listfun(Lfirst^.node^.sons,FALSE,match) ELSE match:=FALSE;
   WHILE NEGCAND(match,matchcondition) DO listfun(Lfirst^.node^.sons,FALSE,match);
   END;
lastmatch:=match
END;

PROCEDURE LSMATCHES_matchtreeConVar0rels(stree:LSSTREE_pstree;
                                         first          : BOOLEAN;
                                         VAR match: BOOLEAN;
                                         PROCEDURE nodefun(
                                                stree:LSSTREE_pstree;
                                                VAR match   :BOOLEAN
                                                          );
                                         PROCEDURE listfun(
                                                list         :LSSTREE_prelNode;
                                                first        :BOOLEAN;
                                                VAR listmatch:BOOLEAN
                                                              );
                                         VAR lastmatch: BOOLEAN;
                                         FUNCTION matchcondition:BOOLEAN
                                              );
BEGIN
IF first THEN BEGIN
   match:=TRUE;
   nodefun(stree,match);
   IF match THEN listfun(stree^.sons,TRUE,match);
   WHILE NEGCAND(match,matchcondition) DO listfun(stree^.sons,FALSE,match);
   END
ELSE BEGIN
   If lastmatch THEN listfun(stree^.sons,FALSE,match) ELSE match:=FALSE;
   WHILE NEGCAND(match,matchcondition) DO listfun(stree^.sons,FALSE,match);
   END;
lastmatch:=match
END;

PROCEDURE LSMATCHES_matchtreeConVar1rels(stree:LSSTREE_pstree;
                                         first          : BOOLEAN;
                                         rel1  : LSDOMAINT_synrel;
                                         VAR match: BOOLEAN;
                                         PROCEDURE nodefun(
                                                stree:LSSTREE_pstree;
                                                VAR match   :BOOLEAN
                                                          );
                                         PROCEDURE listfun(
                                                list         :LSSTREE_prelNode;
                                                first        :BOOLEAN;
                                                VAR listmatch:BOOLEAN
                                                              );
                                         VAR lastmatch: BOOLEAN;
                                         FUNCTION matchcondition:BOOLEAN
                                              );
BEGIN
IF first THEN BEGIN
   match:=TRUE;
   nodefun(stree,match);
   IF match THEN 
         match:=LImatches_TEST1rels(Loopholes.Retype(rel1,LIDOMAINT_synrel),
                               Loopholes.Retype(stree^.sons,LISTREE_prelnode),FALSE);
   IF match THEN listfun(stree^.sons,TRUE,match);
   WHILE NEGCAND(match,matchcondition) DO listfun(stree^.sons,FALSE,match);
   END
ELSE BEGIN
   If lastmatch THEN listfun(stree^.sons,FALSE,match) ELSE match:=FALSE;
   WHILE NEGCAND(match,matchcondition) DO listfun(stree^.sons,FALSE,match);
   END;
lastmatch:=match
END;

PROCEDURE LSMATCHES_matchtreeConVar2rels(stree:LSSTREE_pstree;
                                         first          : BOOLEAN;
                                         rel1,rel2  : LSDOMAINT_synrel;
                                         VAR match: BOOLEAN;
                                         PROCEDURE nodefun(
                                                stree:LSSTREE_pstree;
                                                VAR match   :BOOLEAN
                                                          );
                                         PROCEDURE listfun(
                                                list         :LSSTREE_prelNode;
                                                first        :BOOLEAN;
                                                VAR listmatch:BOOLEAN
                                                              );
                                         VAR lastmatch: BOOLEAN;
                                         FUNCTION matchcondition:BOOLEAN
                                              );
BEGIN
IF first THEN BEGIN
   match:=TRUE;
   nodefun(stree,match);
   IF match THEN match:=LImatches_TEST2rels(Loopholes.Retype(rel1,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel2,LIDOMAINT_synrel),
                                               Loopholes.Retype(stree^.sons,LISTREE_prelnode),FALSE);
   IF match THEN listfun(stree^.sons,TRUE,match);
   WHILE NEGCAND(match,matchcondition) DO listfun(stree^.sons,FALSE,match);
   END
ELSE BEGIN
   If lastmatch THEN listfun(stree^.sons,FALSE,match) ELSE match:=FALSE;
   WHILE NEGCAND(match,matchcondition) DO listfun(stree^.sons,FALSE,match);
   END;
lastmatch:=match
END;

PROCEDURE LSMATCHES_matchtreeConVar3rels(stree:LSSTREE_pstree;
                                         first          : BOOLEAN;
                                         rel1,rel2,rel3: LSDOMAINT_synrel;
                                         VAR match: BOOLEAN;
                                         PROCEDURE nodefun(
                                                stree:LSSTREE_pstree;
                                                VAR match   :BOOLEAN
                                                          );
                                         PROCEDURE listfun(
                                                list         :LSSTREE_prelNode;
                                                first        :BOOLEAN;
                                                VAR listmatch:BOOLEAN
                                                              );
                                         VAR lastmatch: BOOLEAN;
                                         FUNCTION matchcondition:BOOLEAN
                                              );
BEGIN
IF first THEN BEGIN
   match:=TRUE;
   nodefun(stree,match);
   IF match THEN match:=LImatches_TEST3rels(Loopholes.Retype(rel1,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel2,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel3,LIDOMAINT_synrel),
                                               Loopholes.Retype(stree^.sons,LISTREE_prelnode),FALSE);
   IF match THEN listfun(stree^.sons,TRUE,match);
   WHILE NEGCAND(match,matchcondition) DO listfun(stree^.sons,FALSE,match);
   END
ELSE BEGIN
   If lastmatch THEN listfun(stree^.sons,FALSE,match) ELSE match:=FALSE;
   WHILE NEGCAND(match,matchcondition) DO listfun(stree^.sons,FALSE,match);
   END;
lastmatch:=match
END;

PROCEDURE LSMATCHES_matchtreeConVar4rels(stree:LSSTREE_pstree;
                                         first          : BOOLEAN;
                                         rel1,rel2,rel3,rel4: LSDOMAINT_synrel;
                                         VAR match: BOOLEAN;
                                         PROCEDURE nodefun(
                                                stree:LSSTREE_pstree;
                                                VAR match   :BOOLEAN
                                                          );
                                         PROCEDURE listfun(
                                                list         :LSSTREE_prelNode;
                                                first        :BOOLEAN;
                                                VAR listmatch:BOOLEAN
                                                              );
                                         VAR lastmatch: BOOLEAN;
                                         FUNCTION matchcondition:BOOLEAN
                                              );
BEGIN
IF first THEN BEGIN
   match:=TRUE;
   nodefun(stree,match);
   IF match THEN match:=LImatches_TEST4rels(Loopholes.Retype(rel1,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel2,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel3,LIDOMAINT_synrel),
                                               Loopholes.Retype(rel4,LIDOMAINT_synrel),
                                               Loopholes.Retype(stree^.sons,LISTREE_prelnode),FALSE);
   IF match THEN listfun(stree^.sons,TRUE,match);
   WHILE NEGCAND(match,matchcondition) DO listfun(stree^.sons,FALSE,match);
   END
ELSE BEGIN
   If lastmatch THEN listfun(stree^.sons,FALSE,match) ELSE match:=FALSE;
   WHILE NEGCAND(match,matchcondition) DO listfun(stree^.sons,FALSE,match);
   END;
lastmatch:=match
END;

PROCEDURE LSMATCHES_MatchtreeVar(Lfirst,Llast     : LSSTREE_prelNode;
                                         first            : BOOLEAN;
                                         relation:LSDOMAINT_synrel;
                                         VAR stree:LSSTREE_pstree;
                                         VAR match: BOOLEAN;
                                         VAR lastmatch:BOOLEAN
                                              );
BEGIN
IF first THEN BEGIN
   match:=(Lfirst^.relation=relation);
   IF match THEN stree:=Lfirst^.node;
   END
ELSE match:=FALSE;
END;

PROCEDURE LSMATCHES_MatchtreeConVar(Lfirst,Llast     : LSSTREE_prelNode;
                                         first            : BOOLEAN;
                                         relation:LSDOMAINT_synrel;
                                         VAR stree:LSSTREE_pstree;
                                         VAR match: BOOLEAN;
                                         FUNCTION matchcondition:BOOLEAN;
                                         VAR lastmatch:BOOLEAN
                                              );
BEGIN 
IF first THEN BEGIN
   match:=(Lfirst^.relation=relation);
   IF match THEN BEGIN
      stree:=Lfirst^.node;
      match:=matchcondition;
      END;
   END
ELSE match:=FALSE;
END;

PROCEDURE LSMATCHES_MatchtreeVarVar(Lfirst,Llast     : LSSTREE_prelNode;
                                         first            : BOOLEAN;
                                         VAR rel:LSDOMAINT_synrel;
                                         VAR stree:LSSTREE_pstree;
                                         VAR match: BOOLEAN;
                                         VAR lastmatch:BOOLEAN
                                              );
BEGIN 
IF first THEN BEGIN
   match:=TRUE;
   rel:=Lfirst^.relation;
   stree:=Lfirst^.node;
   END
ELSE match:=FALSE;
END;

PROCEDURE LSMATCHES_MatchtreeVarConVar(Lfirst,Llast     : LSSTREE_prelNode;
                                         first            : BOOLEAN;
                                         VAR rel:LSDOMAINT_synrel;
                                         VAR stree:LSSTREE_pstree;
                                         VAR match: BOOLEAN;
                                         FUNCTION matchcondition:BOOLEAN;
                                         VAR lastmatch:BOOLEAN
                                              );
BEGIN 
IF first THEN BEGIN
   match:=TRUE;
   rel:=Lfirst^.relation;
   stree:=Lfirst^.node;
   match:=matchcondition;
   END
ELSE match:=FALSE;
END;


PROCEDURE LSMATCHES_MatchtreeEmp(Lfirst,Llast     : LSSTREE_prelNode;
                                         first            : BOOLEAN;
                                         relation:LSDOMAINT_synrel;
                                         VAR match: BOOLEAN;
                                         VAR lastmatch:BOOLEAN
                                              );
BEGIN 
IF first THEN BEGIN
   match:=(Lfirst^.relation=relation);
   END
ELSE match:=FALSE;
END;

PROCEDURE LSMATCHES_MatchtreeConEmp(Lfirst,Llast     : LSSTREE_prelNode;
                                         first            : BOOLEAN;
                                         relation:LSDOMAINT_synrel;
                                         VAR match: BOOLEAN;
                                         FUNCTION matchcondition:BOOLEAN;
                                         VAR lastmatch:BOOLEAN
                                              );
BEGIN 
IF first THEN BEGIN
   match:=(Lfirst^.relation=relation);
   match:=matchcondition;
   END
ELSE match:=FALSE;
END;

PROCEDURE LSMATCHES_MatchtreeVarEmp(Lfirst,Llast     : LSSTREE_prelNode;
                                         first            : BOOLEAN;
                                         VAR rel:LSDOMAINT_synrel;
                                         VAR match: BOOLEAN;
                                         VAR lastmatch:BOOLEAN
                                              );
BEGIN 
IF first THEN BEGIN
   match:=TRUE;
   rel:=Lfirst^.relation;
   END
ELSE match:=FALSE;
END;

PROCEDURE LSMATCHES_MatchtreeVarConEmp(Lfirst,Llast     : LSSTREE_prelNode;
                                         first            : BOOLEAN;
                                         VAR rel:LSDOMAINT_synrel;
                                         VAR match: BOOLEAN;
                                         FUNCTION matchcondition:BOOLEAN;
                                         VAR lastmatch:BOOLEAN
                                              );
BEGIN 
IF first THEN BEGIN
   match:=TRUE;
   rel:=Lfirst^.relation;
   match:=matchcondition;
   END
ELSE match:=FALSE;
END;


PROCEDURE LSMATCHES_MatchtreeEmpVar(Lfirst,Llast     : LSSTREE_prelNode;
                                         first            : BOOLEAN;
                                         VAR stree:LSSTREE_pstree;
                                         VAR match: BOOLEAN;
                                         VAR lastmatch:BOOLEAN
                                              );
BEGIN 
IF first THEN BEGIN
   match:=TRUE;
   stree:=Lfirst^.node;
   END
ELSE match:=FALSE;
END;

PROCEDURE LSMATCHES_MatchtreeEmpConVar(Lfirst,Llast     : LSSTREE_prelNode;
                                         first            : BOOLEAN;
                                         VAR stree:LSSTREE_pstree;
                                         VAR match: BOOLEAN;
                                         FUNCTION matchcondition:BOOLEAN;
                                         VAR lastmatch:BOOLEAN
                                              );
BEGIN 
IF first THEN BEGIN
   match:=TRUE;
   stree:=Lfirst^.node;
   match:=matchcondition;
   END
ELSE match:=FALSE;
END;

PROCEDURE LSMATCHES_createlist1items0(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees)
                                             );
BEGIN
createitem1(wholelist);
END;

PROCEDURE LSMATCHES_createlist1items1(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees)
                                             );
BEGIN
createitem1(wholelist);
END;
PROCEDURE LSMATCHES_createlist2items00(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
IF wholelist.first=NIL THEN BEGIN
   wholelist:=list
   END 
ELSE IF list.first<>NIL THEN
   BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
END;

PROCEDURE LSMATCHES_createlist2items10(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
END;
PROCEDURE LSMATCHES_createlist2items01(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
IF wholelist.first=NIL THEN BEGIN
   wholelist:=list
   END 
ELSE
   BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
END;

PROCEDURE LSMATCHES_createlist2items11(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
END;


PROCEDURE LSMATCHES_createlist3items000(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
IF wholelist.first=NIL THEN BEGIN
   wholelist:=list
   END 
ELSE IF list.first<>NIL THEN
   BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem3(list);
IF wholelist.first=NIL THEN BEGIN
   wholelist:=list
   END 
ELSE IF list.first<>NIL THEN
   BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
END;

PROCEDURE LSMATCHES_createlist3items100(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem3(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
END;
PROCEDURE LSMATCHES_createlist3items010(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
IF wholelist.first=NIL THEN BEGIN
   wholelist:=list
   END 
ELSE
   BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem3(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
END;

PROCEDURE LSMATCHES_createlist3items110(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
createitem3(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
END;

PROCEDURE LSMATCHES_createlist3items001(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
IF wholelist.first=NIL THEN BEGIN
   wholelist:=list
   END 
ELSE IF list.first<>NIL THEN
   BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem3(list);
IF wholelist.first=NIL THEN BEGIN
   wholelist:=list
   END 
ELSE
   BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
END;

PROCEDURE LSMATCHES_createlist3items101(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem3(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
END;
PROCEDURE LSMATCHES_createlist3items011(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
IF wholelist.first=NIL THEN BEGIN
   wholelist:=list
   END 
ELSE
   BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem3(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
END;

PROCEDURE LSMATCHES_createlist3items111(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
createitem3(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
END;

PROCEDURE LSMATCHES_createlist4items0000(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem4(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
IF wholelist.first=NIL THEN BEGIN
   wholelist:=list
   END 
ELSE IF list.first<>NIL THEN
   BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem3(list);
IF wholelist.first=NIL THEN BEGIN
   wholelist:=list
   END 
ELSE IF list.first<>NIL THEN
   BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem4(list);
IF wholelist.first=NIL THEN BEGIN
   wholelist:=list
   END 
ELSE IF list.first<>NIL THEN
   BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
END;

PROCEDURE LSMATCHES_createlist4items1000(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem4(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem3(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem4(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
END;
PROCEDURE LSMATCHES_createlist4items0100(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem4(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
IF wholelist.first=NIL THEN BEGIN
   wholelist:=list
   END 
ELSE
   BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem3(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem4(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
END;

PROCEDURE LSMATCHES_createlist4items1100(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem4(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
createitem3(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem4(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
END;

PROCEDURE LSMATCHES_createlist4items0010(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem4(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
IF wholelist.first=NIL THEN BEGIN
   wholelist:=list
   END 
ELSE IF list.first<>NIL THEN
   BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem3(list);
IF wholelist.first=NIL THEN BEGIN
   wholelist:=list
   END 
ELSE
   BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem4(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
END;

PROCEDURE LSMATCHES_createlist4items1010(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem4(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem3(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
createitem4(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
END;
PROCEDURE LSMATCHES_createlist4items0110(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem4(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
IF wholelist.first=NIL THEN BEGIN
   wholelist:=list
   END 
ELSE
   BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem3(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
createitem4(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
END;

PROCEDURE LSMATCHES_createlist4items1110(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem4(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
createitem3(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
createitem4(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
END;

PROCEDURE LSMATCHES_createlist4items0001(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem4(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
IF wholelist.first=NIL THEN BEGIN
   wholelist:=list
   END 
ELSE IF list.first<>NIL THEN
   BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem3(list);
IF wholelist.first=NIL THEN BEGIN
   wholelist:=list
   END 
ELSE IF list.first<>NIL THEN
   BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem4(list);
IF wholelist.first=NIL THEN BEGIN
   wholelist:=list
   END 
ELSE
   BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
END;

PROCEDURE LSMATCHES_createlist4items1001(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem4(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem3(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem4(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
END;
PROCEDURE LSMATCHES_createlist4items0101(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem4(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
IF wholelist.first=NIL THEN BEGIN
   wholelist:=list
   END 
ELSE
   BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem3(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem4(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
END;

PROCEDURE LSMATCHES_createlist4items1101(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem4(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
createitem3(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem4(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
END;

PROCEDURE LSMATCHES_createlist4items0011(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem4(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
IF wholelist.first=NIL THEN BEGIN
   wholelist:=list
   END 
ELSE IF list.first<>NIL THEN
   BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem3(list);
IF wholelist.first=NIL THEN BEGIN
   wholelist:=list
   END 
ELSE
   BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem4(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
END;

PROCEDURE LSMATCHES_createlist4items1011(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem4(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
IF list.first<>NIL THEN BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem3(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
createitem4(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
END;
PROCEDURE LSMATCHES_createlist4items0111(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem4(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
IF wholelist.first=NIL THEN BEGIN
   wholelist:=list
   END 
ELSE
   BEGIN
   wholelist.last^.brother:=list.first;
   wholelist.last:=list.last;
   END;
createitem3(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
createitem4(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
END;

PROCEDURE LSMATCHES_createlist4items1111(VAR wholelist:LSMRUQUO_ListOfStrees;
                                   PROCEDURE createitem1(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem2(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem3(VAR list:LSMRUQUO_ListOfStrees);
                                   PROCEDURE createitem4(VAR list:LSMRUQUO_ListOfStrees)
                                             );
VAR list:LSMRUQUO_ListOfStrees;
BEGIN
createitem1(wholelist);
createitem2(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
createitem3(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
createitem4(list);
wholelist.last^.brother:=list.first;
wholelist.last:=list.last;
END;

PROCEDURE LSMATCHES_createitem(VAR list:LSMRUQUO_ListOfStrees;
                                        relation:LSDOMAINT_synrel;
                                        category:LSDOMAINT_syntcat;
                                        PROCEDURE nodefun(VAR stree:LSSTREE_pstree);
                                        PROCEDURE listfun(
                                                VAR list:LSMRUQUO_ListOfStrees
                                                         )
                                       );
VAR relnode:LSSTREE_prelnode;
    list1:LSMRUQUO_ListOfStrees;
    s:LSSTREE_pstree;
BEGIN
LISTREE_makerelnode(LoopHoles.Retype(relnode,LISTREE_prelnode));
list.first:=relnode;
list.last:=relnode;
relnode^.relation:=relation;
s:=MAKET_stree(category);
nodefun(s);
listfun(list1);
IF (list1.first<>NIL) THEN list1.last^.brother:=NIL;
s^.li^.n:=numberofelements(list1);
s^.sons:=list1.first;
relnode^.node:=s;
END;

PROCEDURE LSMATCHES_createitemVar(VAR list:LSMRUQUO_ListOfStrees;
                                           relation:LSDOMAINT_synrel;
                                           stree:LSSTREE_pstree
                                          );
VAR relnode:LSSTREE_prelnode;
BEGIN
LISTREE_makerelnode(Loopholes.Retype(relnode,LISTREE_prelnode));
list.first:=relnode;
list.last:=relnode;
relnode^.relation:=relation;
relnode^.node:=stree;
END;

PROCEDURE LSMATCHES_MUMfirst(List:LSSTREE_prelnode;
                                 VAR match:BOOLEAN;
                                 PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match:BOOLEAN
                                                );
                                 VAR Lfirst1,Llast1:LSSTREE_prelNode;
                                 relation:LSDOMAINT_synrel;
                                 PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match:BOOLEAN
                                                );
                                 VAR Lfirst2,Llast2:LSSTREE_prelNode;
                                 PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match:BOOLEAN
                                                );
                                 VAR Lfirst3,Llast3:LSSTREE_prelNode
                                );
VAR relseen:BOOLEAN;
BEGIN
Lfirst2:=List;
Llast1:=NIL;
relseen:=FALSE;
IF Lfirst2^.relation=relation THEN BEGIN
   item2(Lfirst2,Lfirst2,match);
   relseen:=TRUE;
   END
ELSE match:=FALSE;
WHILE (NOT relseen) AND (Lfirst2^.brother<>NIL) DO BEGIN
   Llast1:=Lfirst2;
   Lfirst2:=Lfirst2^.brother;
   IF Lfirst2^.relation=relation THEN BEGIN
      item2(Lfirst2,Lfirst2,match);
      relseen:=TRUE;
      END
   ELSE match:=FALSE;
   END;
IF match THEN BEGIN
   IF Llast1<>NIL THEN item1(List,Llast1,match) ELSE item1(NIL,NIL,match);
   IF match THEN BEGIN
      Lfirst3:=Lfirst2^.brother;
      Llast3:=Lfirst3;
      IF Lfirst3<>NIL THEN BEGIN
         WHILE Llast3^.brother<>NIL DO BEGIN
            Llast3:=Llast3^.brother
         END;
         item3(Lfirst3, Llast3, match)
         END
      ELSE item3(NIL,NIL,match)
      END;
   END;
END;


PROCEDURE LSMATCHES_MUMUMfirst(
                                 List               :LSSTREE_prelnode;
                                 VAR match          :BOOLEAN;
                                 PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst1,Llast1 :LSSTREE_prelNode;
                                 relation1          :LSDOMAINT_synrel;
                                 PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst2,Llast2 :LSSTREE_prelNode;
                                 PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst3,Llast3 :LSSTREE_prelNode;
                                 relation2          :LSDOMAINT_synrel;
                                 PROCEDURE item4(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst4,Llast4:LSSTREE_prelNode;
                                 PROCEDURE item5(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst5,Llast5 :LSSTREE_prelNode
                                );
VAR rel1seen:BOOLEAN;
    rel2seen:BOOLEAN;
BEGIN
   Lfirst2 := List;
   Llast1 := NIL;
   rel1seen := FALSE;
   match := FALSE;

   (*----------------------------------------------------------------------*
    * find unique relation relation1
    *----------------------------------------------------------------------*)

   IF Lfirst2^.relation=relation1 THEN BEGIN
      item2(Lfirst2,Lfirst2,match);
      rel1seen := TRUE;
   END;
   WHILE (NOT rel1seen) AND (Lfirst2^.brother<>NIL) DO BEGIN
      Llast1 := Lfirst2;
      Lfirst2 := Lfirst2^.brother;
      IF Lfirst2^.relation = relation1 THEN BEGIN
         item2(Lfirst2,Lfirst2,match);
         rel1seen:=TRUE;
      END;
   END;
   IF match AND (Lfirst2^.brother <> NIL) THEN BEGIN

      (*-------------------------------------------------------------------*
       * Now, try to match first itemlist
       *-------------------------------------------------------------------*)

      IF Llast1<>NIL THEN item1(List,Llast1,match) ELSE item1(NIL,NIL,match);
      IF match THEN BEGIN

         (*----------------------------------------------------------------*
          * Try to find relation relation2
          *----------------------------------------------------------------*)
          Lfirst4 := Lfirst2^.brother;
          Llast3  := Lfirst2;
          rel2seen := FALSE;

          IF Lfirst4^.relation=relation2 THEN BEGIN
             item4(Lfirst4,Lfirst4,match);
             rel2seen := TRUE;
          END;
          WHILE (NOT rel2seen) AND (Lfirst4^.brother<>NIL) DO BEGIN
             Llast3 := Lfirst4;
             Lfirst4 := Lfirst4^.brother;
             IF Lfirst4^.relation = relation2 THEN BEGIN
                item4(Lfirst4,Lfirst4,match);
                rel2seen:=TRUE;
             END;
          END;

          IF match THEN BEGIN

          (*-------------------------------------------------------------------*
           * Now, try to match itemlist 3
           *-------------------------------------------------------------------*)

             IF LFirst2^.brother = Lfirst4 THEN item3(NIL, NIL, match)
             ELSE item3(Lfirst2^.brother,Llast3,match);

             IF match THEN BEGIN

                Lfirst5:=Lfirst4^.brother;
                Llast5:=Lfirst5;
                IF Lfirst5<>NIL THEN BEGIN
                   WHILE Llast5^.brother<>NIL DO BEGIN
                      Llast5:=Llast5^.brother
                   END;
                   item5(Lfirst5, Llast5, match)
                   END
                ELSE item5(NIL,NIL,match)
            END
         END;
      END
      END
   ELSE match := FALSE
END {LSMATCHES_MUMUMfirst};


PROCEDURE LSMATCHES_MUMRfirst(
                                 List               :LSSTREE_prelnode;
                                 VAR match          :BOOLEAN;
                                 PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst1,Llast1 :LSSTREE_prelNode;
                                 relation1          :LSDOMAINT_synrel;
                                 PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst2,Llast2 :LSSTREE_prelNode;
                                 PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst3,Llast3 :LSSTREE_prelNode;
                                 PROCEDURE item4(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst4,Llast4:LSSTREE_prelNode
                                );
VAR rel1seen:BOOLEAN;
BEGIN
   Lfirst2 := List;
   Llast1 := NIL;
   rel1seen := FALSE;
   match := FALSE;

   (*----------------------------------------------------------------------*
    * find unique relation relation1
    *----------------------------------------------------------------------*)

   IF Lfirst2^.relation=relation1 THEN BEGIN
      item2(Lfirst2,Lfirst2,match);
      rel1seen := TRUE;
   END;
   WHILE (NOT rel1seen) AND (Lfirst2^.brother<>NIL) DO BEGIN
      Llast1 := Lfirst2;
      Lfirst2 := Lfirst2^.brother;
      IF Lfirst2^.relation = relation1 THEN BEGIN
         item2(Lfirst2,Lfirst2,match);
         rel1seen:=TRUE;
      END;
   END;
   IF match AND (Lfirst2^.brother <> NIL) THEN BEGIN

      (*-------------------------------------------------------------------*
       * Now, try to match last relation
       *-------------------------------------------------------------------*)
      Lfirst4 := Lfirst2^.brother;
      Lfirst3 := Lfirst4;
      Llast3 := Lfirst3;
      IF Lfirst4 = NIL THEN match := FALSE
      ELSE BEGIN
         WHILE Lfirst4^.brother <> NIL DO BEGIN
            Llast3 := Lfirst4;
            Lfirst4 := Lfirst4^.brother
         END;
         item4(Lfirst4,Lfirst4, match)
      END;

      IF match THEN BEGIN

         (*----------------------------------------------------------------*
          * Try to find match itemilist 1
          *----------------------------------------------------------------*)

          IF Llast1<>NIL THEN item1(List,Llast1,match) 
          ELSE item1(NIL,NIL,match);


          IF match THEN BEGIN

          (*-------------------------------------------------------------------*
           * Now, try to match itemlist 3
           *-------------------------------------------------------------------*)
             IF Lfirst2^.brother = Lfirst4 THEN item3(NIL,NIL,match)
             ELSE item3(Lfirst3,Llast3,match);
          END;
      END
      END
   ELSE match := FALSE
END {LSMATCHES_MUMRfirst};

PROCEDURE LSMATCHES_RMUMfirst(
                                 List               :LSSTREE_prelnode;
                                 VAR match          :BOOLEAN;
                                 PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst1,Llast1 :LSSTREE_prelNode;
                                 PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst2,Llast2 :LSSTREE_prelNode;
                                 relation2          :LSDOMAINT_synrel;
                                 PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst3,Llast3 :LSSTREE_prelNode;
                                 PROCEDURE item4(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst4,Llast4:LSSTREE_prelNode
                                );
VAR rel1seen:BOOLEAN;
BEGIN
   Lfirst1 := List;
   rel1seen := FALSE;
   match := FALSE;

   (*----------------------------------------------------------------------*
    * find relation relation1
    *----------------------------------------------------------------------*)

   item1(Lfirst1,Lfirst1,match);
   IF match AND (Lfirst1^.brother <> NIL) THEN BEGIN

      (*-------------------------------------------------------------------*
       * Now, try to match unique relation relation2
       *-------------------------------------------------------------------*)

      Lfirst3 := Lfirst1^.brother;
      Lfirst2 := Lfirst3;
      Llast2 := Lfirst2;
      IF Lfirst3 = NIL THEN match := FALSE
      ELSE BEGIN
         IF Lfirst3^.relation = relation2 THEN BEGIN
            item3(Lfirst3,Lfirst3, match);
            rel1seen := TRUE;
         END;
         WHILE ( NOT rel1seen ) AND (Lfirst3^.brother <> NIL) DO BEGIN
            Llast2 := Lfirst3;
            Lfirst3 := Lfirst3^.brother;
            IF Lfirst3^.relation = relation2 THEN BEGIN
               item3(Lfirst3,Lfirst3, match);
               rel1seen := TRUE;
            END
         END;
         IF NOT rel1seen THEN match := FALSE
      END;

      IF match THEN BEGIN

         (*----------------------------------------------------------------*
          * Try to find match itemlist 2
          *----------------------------------------------------------------*)

          IF Lfirst1^.brother<>Lfirst3 THEN item2(Lfirst2,Llast2,match) 
          ELSE item2(NIL,NIL,match);


          IF match THEN BEGIN

          (*-------------------------------------------------------------------*
           * Now, try to match itemlist 4
           *-------------------------------------------------------------------*)
             Lfirst4 := Lfirst3^.brother;
             Llast4 := Lfirst4;
             IF Lfirst4 <> NIL THEN BEGIN
                WHILE Llast4^.brother <> NIL DO Llast4 := Llast4^.brother;
                item4(Lfirst4,Llast4,match);
                END
             ELSE item4(NIL, NIL, match)
          END;
      END
      END
   ELSE match := FALSE
END {LSMATCHES_RMUMfirst};


PROCEDURE LSMATCHES_MMUMfirst(
                                 List               :LSSTREE_prelnode;
                                 VAR match          :BOOLEAN;
                                 PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst1,Llast1 :LSSTREE_prelNode;
                                 PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst2,Llast2 :LSSTREE_prelNode;
                                 relation1          :LSDOMAINT_synrel;
                                 PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst3,Llast3 :LSSTREE_prelNode;
                                 PROCEDURE item4(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst4,Llast4:LSSTREE_prelNode
                                );
VAR
   rel1seen : BOOLEAN;
BEGIN
   Lfirst3 := List;
   LFirst1 := NIL;
   Llast1 := NIL;
   LFirst2 := NIL;
   Llast2 := NIL;

   rel1seen := FALSE;
   match := FALSE;

   (*----------------------------------------------------------------------*
    * find unique relation relation1
    *----------------------------------------------------------------------*)

   IF Lfirst3^.relation=relation1 THEN BEGIN
      item3(Lfirst3,Lfirst3,match);
      rel1seen := TRUE;
   END;
   WHILE (NOT rel1seen) AND (Lfirst3^.brother<>NIL) DO BEGIN
      Llast2 := Lfirst3;
      LFirst3 := Lfirst3^.brother;
      IF Lfirst3^.relation = relation1 THEN BEGIN
         item3(Lfirst3,Lfirst3,match);
         rel1seen:=TRUE;
      END;
   END;

   { LLast2 and Lfirst3 have their final values }

   IF match THEN BEGIN

      (*-------------------------------------------------------------------*
       * Now try to match item4
       *-------------------------------------------------------------------*)

      Lfirst4 := Lfirst3^.brother;
      Llast4 := Lfirst4;
      IF Lfirst4 <> NIL THEN BEGIN
         WHILE Llast4^.brother <> NIL DO Llast4 := Llast4^.brother;
         item4(Lfirst4,Llast4,match);
         END
      ELSE item4(NIL, NIL, match);

      { Lfirst4, Llast4 have their final values }

      IF match THEN BEGIN

         (*----------------------------------------------------------------*
          * Match itemlist1 and itemlist2
          *----------------------------------------------------------------*)

         LFirst1 := NIL; LLast1 := NIL;
         item1(LFirst1, Llast1, match);
         IF match THEN BEGIN
            IF LFirst3 = List THEN LFirst2 := NIL ELSE LFirst2 := List;
            item2(lFirst2, Llast2, match);
         END;
         IF NOT match AND ( Lfirst2 <> NIL ) THEN BEGIN
            LFirst1 := List; Llast1 := Lfirst1;
            LFirst2 := LFirst1;
            WHILE NOT match AND (Lfirst2 <> Llast2) DO BEGIN
               Llast1 := LFirst2;
               LFirst2 := LFirst2^.brother;
               item1(LFirst1, Llast1, match);
               IF match THEN item2(LFirst2, LLast2, match);  
            END;
            IF NOT match THEN BEGIN
               Llast1 := LFirst2;
               item1(LFirst1, Llast1, match);
               IF match THEN item2(NIL, NIL, match);  
            END
         END
      END;
   END;
END {LSMATCHES_MMUMfirst};


PROCEDURE LSMATCHES_MMUMnext(
                                 List               :LSSTREE_prelnode;
                                 VAR match          :BOOLEAN;
                                 PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst1,Llast1 :LSSTREE_prelNode;
                                 PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst2,Llast2 :LSSTREE_prelNode;
                                 relation1          :LSDOMAINT_synrel;
                                 PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst3,Llast3 :LSSTREE_prelNode;
                                 PROCEDURE item4(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst4,Llast4:LSSTREE_prelNode
                                );
BEGIN

   (*----------------------------------------------------------------------*
    * Lfirst3, Lfirst4, Llast4 have their final values
    *----------------------------------------------------------------------*)
   match := FALSE;
   IF Lfirst2 <> NIL THEN BEGIN
      IF Lfirst1 = NIL THEN BEGIN
         LFirst1 := List; Llast1 := Lfirst1;
      END;
      WHILE NOT match AND (Lfirst2 <> Llast2) DO BEGIN
         Llast1 := LFirst2;
         LFirst2 := LFirst2^.brother;
         item1(LFirst1, Llast1, match);
         IF match THEN item2(LFirst2, LLast2, match);  
      END;
      IF NOT match THEN BEGIN
         Llast1 := LFirst2;
         LFirst2:=NIL;
         item1(LFirst1, Llast1, match);
         IF match THEN item2(NIL, NIL, match);  
      END
   END;
END {LSMATCHES_MMUMnext};


PROCEDURE LSMATCHES_RMfirst(
                                 List               :LSSTREE_prelnode;
                                 VAR match          :BOOLEAN;
                                 PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst1,Llast1 :LSSTREE_prelNode;
                                 PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst2,Llast2 :LSSTREE_prelNode
                                );
BEGIN
   Lfirst1 := List;
   match := FALSE;

   item1(Lfirst1,Lfirst1,match);
   IF match THEN BEGIN

      IF Lfirst1^.brother = NIL THEN item2(NIL, NIL, match)
      ELSE BEGIN
         Llast2 := Lfirst1^.brother;
         WHILE Llast2^.brother <> NIL DO Llast2 := Llast2^.brother;
         item2(Lfirst1^.brother, Llast2, match)
      END;
   END;

END {LSMATCHES_RMfirst};


PROCEDURE LSMATCHES_MRfirst(
                                 List               :LSSTREE_prelnode;
                                 VAR match          :BOOLEAN;
                                 PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst1,Llast1 :LSSTREE_prelNode;
                                 PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst2,Llast2 :LSSTREE_prelNode
                                );
BEGIN
   Lfirst1 := List;
   match := FALSE;

   Lfirst2 := List;
   LLast1 := Lfirst2;
   WHILE Lfirst2^.brother <> NIL DO BEGIN
      Llast1 := Lfirst2;
      Lfirst2 := Lfirst2^.brother;
   END;

   item2(Lfirst2, Lfirst2, match);
   IF match THEN BEGIN
      IF Lfirst2 = List THEN item1(NIL, NIL, match)
      ELSE item1(Lfirst1, Llast1, match)
   END;

END {LSMATCHES_MRfirst};


PROCEDURE LSMATCHES_MRMfirst(
                                 List               :LSSTREE_prelnode;
                                 VAR match          :BOOLEAN;
                                 PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst1,Llast1 :LSSTREE_prelNode;
                                 PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst2,Llast2 :LSSTREE_prelNode;
                                 PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst3,Llast3 :LSSTREE_prelNode
                                );
BEGIN
   match := FALSE;

   Lfirst1 := NIL;
   Llast1  := NIL;
   Lfirst2 := List;
   IF Lfirst2^.brother = NIL THEN BEGIN

      (*-------------------------------------------------------------------*
       * list format:  eps, rel, eps
       *-------------------------------------------------------------------*)

      Lfirst3 := NIL; Llast3 := NIL;
      END
   ELSE BEGIN

      (*-------------------------------------------------------------------*
       * list format: eps, rel, mu2
       *-------------------------------------------------------------------*)

      LFirst3 := Lfirst2^.brother;
      Llast3 := Lfirst3;
      WHILE Llast3^.brother <> NIL DO Llast3 := Llast3^.brother
   END;

   item2(Lfirst2, LFirst2, match);
   IF match THEN item1(LFirst1, Llast1, match);
   IF match THEN item3(Lfirst3, llast3, match);

   IF NOT match THEN BEGIN
      WHILE NOT match AND ( Lfirst2^.brother <> NIL) DO BEGIN
         IF Lfirst1 = NIL THEN BEGIN
            Lfirst1 := List;
         END;
         Llast1 := Lfirst2;
         Lfirst2 := Lfirst2^.brother;
         Lfirst3 := Lfirst2^.brother;
         IF Lfirst3 = NIL THEN Llast3 := NIL;
         item2(Lfirst2, LFirst2, match);
         IF match THEN item1(LFirst1, Llast1, match);
         IF match THEN item3(Lfirst3, llast3, match);
      END;
   END;

END {LSMATCHES_MRMfirst};


PROCEDURE LSMATCHES_MRMnext(
                                 List               :LSSTREE_prelnode;
                                 VAR match          :BOOLEAN;
                                 PROCEDURE item1(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst1,Llast1 :LSSTREE_prelNode;
                                 PROCEDURE item2(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst2,Llast2 :LSSTREE_prelNode;
                                 PROCEDURE item3(Lfirst,Llast:LSSTREE_prelnode;
                                                 VAR match   :BOOLEAN
                                                );
                                 VAR Lfirst3,Llast3 :LSSTREE_prelNode
                                );
BEGIN
   match := FALSE;

   WHILE NOT match AND ( Lfirst2^.brother <> NIL) DO BEGIN
      IF Lfirst1 = NIL THEN BEGIN
         Lfirst1 := List;
      END;
      Llast1 := Lfirst2;
      Lfirst2 := Lfirst2^.brother;
      Lfirst3 := Lfirst2^.brother;
      IF Lfirst3 = NIL THEN Llast3 := NIL;
      item2(Lfirst2, LFirst2, match);
      IF match THEN item1(LFirst1, Llast1, match);
      IF match THEN item3(Lfirst3, llast3, match);
   END;

END {LSMATCHES_MRMnext};



