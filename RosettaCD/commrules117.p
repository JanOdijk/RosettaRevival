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
pragma C_include('lsparams.pf');
pragma C_include('ldmrules.pf');
pragma C_include('gidderiv.pf');
pragma C_include('hyperdtree.pf');
pragma C_include('strtokey.pf');
pragma C_include('lsmruquo.pf');
pragma C_include('lsauxdom.pf');
pragma C_include('ldblex.pf');
PACKAGE comMrules;
WITH listree,lsdomaint;
pragma C_include('commrules117.pf');
END;
PROGRAM comMrules117;
WITH globsubst,listree,limatches,lsmatches,
lidomaint,liiddict,lsdomaint,maket,lsstree,
copyt,mem,lsparams,ldmrules,
gidderiv,hyperdtree,strtokey,lsmruquo,
lsauxdom,ldblex;
TYPE synrelset=SET OF LSDOMAINT_synrel;
VAR hulpstree:LISTREE_pstree;
 VPID:LSDOMAINT_synpatternsettype;
hulplsstree:LSSTREE_pstree;
dtreeRIDALTPREPFORM_3_T2:HYPERDTREE_pHYPERDTREE;
dtreeRIDALTPREPFORM_8_T2:HYPERDTREE_pHYPERDTREE;
dtreeRIDDERIV15:HYPERDTREE_pHYPERDTREE;
dtreeRIDALTLOCDIRSUBST_3_T3:HYPERDTREE_pHYPERDTREE;
dtreeRIDALTLOCDIRSUBST_10_T3:HYPERDTREE_pHYPERDTREE;
dtreeRIDDERIV14:HYPERDTREE_pHYPERDTREE;
dtreeRIDDERIV7:HYPERDTREE_pHYPERDTREE;
dtreeRIDDERIV12:HYPERDTREE_pHYPERDTREE;
X1,X2,X3,X4,X5:INTEGER;
RIDALTPREPFORM_3_T2d1,RIDALTPREPFORM_3_T2d2,
RIDALTPREPFORM_3_T2d3,
RIDALTPREPFORM_3_T2d4,RIDALTPREPFORM_3_T2d5,
RIDALTPREPFORM_3_T2d6,
RIDALTPREPFORM_3_T2d7,RIDALTPREPFORM_3_T2d8,
RIDALTPREPFORM_3_T2d9,RIDALTPREPFORM_3_T2d10,RIDALTPREPFORM_3_T2d11,
RIDALTPREPFORM_3_T2d12,
RIDALTPREPFORM_3_T2d13,RIDALTPREPFORM_3_T2d14,
RIDALTPREPFORM_3_T2d15:HYPERDTREE_pHyperDtree;
RIDALTPREPFORM_3_T2delt1,RIDALTPREPFORM_3_T2delt2,
RIDALTPREPFORM_3_T2delt3,RIDALTPREPFORM_3_T2delt4,
RIDALTPREPFORM_3_T2delt5,RIDALTPREPFORM_3_T2delt6,
RIDALTPREPFORM_3_T2delt7,RIDALTPREPFORM_3_T2delt8,
RIDALTPREPFORM_3_T2delt9,RIDALTPREPFORM_3_T2delt10,
RIDALTPREPFORM_3_T2delt11,RIDALTPREPFORM_3_T2delt12,
RIDALTPREPFORM_3_T2delt13,RIDALTPREPFORM_3_T2delt14,
RIDALTPREPFORM_3_T2delt15,RIDALTPREPFORM_3_T2delt16,
RIDALTPREPFORM_3_T2delt17:HYPERDTREE_pHyperNodeElt;
RIDALTPREPFORM_8_T2d1,RIDALTPREPFORM_8_T2d2,
RIDALTPREPFORM_8_T2d3,
RIDALTPREPFORM_8_T2d4,RIDALTPREPFORM_8_T2d5,
RIDALTPREPFORM_8_T2d6,
RIDALTPREPFORM_8_T2d7,RIDALTPREPFORM_8_T2d8,
RIDALTPREPFORM_8_T2d9,RIDALTPREPFORM_8_T2d10,RIDALTPREPFORM_8_T2d11,
RIDALTPREPFORM_8_T2d12,
RIDALTPREPFORM_8_T2d13,RIDALTPREPFORM_8_T2d14,
RIDALTPREPFORM_8_T2d15:HYPERDTREE_pHyperDtree;
RIDALTPREPFORM_8_T2delt1,RIDALTPREPFORM_8_T2delt2,
RIDALTPREPFORM_8_T2delt3,RIDALTPREPFORM_8_T2delt4,
RIDALTPREPFORM_8_T2delt5,RIDALTPREPFORM_8_T2delt6,
RIDALTPREPFORM_8_T2delt7,RIDALTPREPFORM_8_T2delt8,
RIDALTPREPFORM_8_T2delt9,RIDALTPREPFORM_8_T2delt10,
RIDALTPREPFORM_8_T2delt11,RIDALTPREPFORM_8_T2delt12,
RIDALTPREPFORM_8_T2delt13,RIDALTPREPFORM_8_T2delt14,
RIDALTPREPFORM_8_T2delt15,RIDALTPREPFORM_8_T2delt16,
RIDALTPREPFORM_8_T2delt17:HYPERDTREE_pHyperNodeElt;
RIDDERIV15d1,RIDDERIV15d2,
RIDDERIV15d3,
RIDDERIV15d4,RIDDERIV15d5,
RIDDERIV15d6,
RIDDERIV15d7,RIDDERIV15d8,
RIDDERIV15d9,RIDDERIV15d10,RIDDERIV15d11,
RIDDERIV15d12,
RIDDERIV15d13,RIDDERIV15d14,
RIDDERIV15d15:HYPERDTREE_pHyperDtree;
RIDDERIV15delt1,RIDDERIV15delt2,
RIDDERIV15delt3,RIDDERIV15delt4,
RIDDERIV15delt5,RIDDERIV15delt6,
RIDDERIV15delt7,RIDDERIV15delt8,
RIDDERIV15delt9,RIDDERIV15delt10,
RIDDERIV15delt11,RIDDERIV15delt12,
RIDDERIV15delt13,RIDDERIV15delt14,
RIDDERIV15delt15,RIDDERIV15delt16,
RIDDERIV15delt17:HYPERDTREE_pHyperNodeElt;
RIDALTLOCDIRSUBST_3_T3d1,RIDALTLOCDIRSUBST_3_T3d2,
RIDALTLOCDIRSUBST_3_T3d3,
RIDALTLOCDIRSUBST_3_T3d4,RIDALTLOCDIRSUBST_3_T3d5,
RIDALTLOCDIRSUBST_3_T3d6,
RIDALTLOCDIRSUBST_3_T3d7,RIDALTLOCDIRSUBST_3_T3d8,
RIDALTLOCDIRSUBST_3_T3d9,RIDALTLOCDIRSUBST_3_T3d10,RIDALTLOCDIRSUBST_3_T3d11,
RIDALTLOCDIRSUBST_3_T3d12,
RIDALTLOCDIRSUBST_3_T3d13,RIDALTLOCDIRSUBST_3_T3d14,
RIDALTLOCDIRSUBST_3_T3d15:HYPERDTREE_pHyperDtree;
RIDALTLOCDIRSUBST_3_T3delt1,RIDALTLOCDIRSUBST_3_T3delt2,
RIDALTLOCDIRSUBST_3_T3delt3,RIDALTLOCDIRSUBST_3_T3delt4,
RIDALTLOCDIRSUBST_3_T3delt5,RIDALTLOCDIRSUBST_3_T3delt6,
RIDALTLOCDIRSUBST_3_T3delt7,RIDALTLOCDIRSUBST_3_T3delt8,
RIDALTLOCDIRSUBST_3_T3delt9,RIDALTLOCDIRSUBST_3_T3delt10,
RIDALTLOCDIRSUBST_3_T3delt11,RIDALTLOCDIRSUBST_3_T3delt12,
RIDALTLOCDIRSUBST_3_T3delt13,RIDALTLOCDIRSUBST_3_T3delt14,
RIDALTLOCDIRSUBST_3_T3delt15,RIDALTLOCDIRSUBST_3_T3delt16,
RIDALTLOCDIRSUBST_3_T3delt17:HYPERDTREE_pHyperNodeElt;
RIDALTLOCDIRSUBST_10_T3d1,RIDALTLOCDIRSUBST_10_T3d2,
RIDALTLOCDIRSUBST_10_T3d3,
RIDALTLOCDIRSUBST_10_T3d4,RIDALTLOCDIRSUBST_10_T3d5,
RIDALTLOCDIRSUBST_10_T3d6,
RIDALTLOCDIRSUBST_10_T3d7,RIDALTLOCDIRSUBST_10_T3d8,
RIDALTLOCDIRSUBST_10_T3d9,RIDALTLOCDIRSUBST_10_T3d10,RIDALTLOCDIRSUBST_10_T3d11,
RIDALTLOCDIRSUBST_10_T3d12,
RIDALTLOCDIRSUBST_10_T3d13,RIDALTLOCDIRSUBST_10_T3d14,
RIDALTLOCDIRSUBST_10_T3d15:HYPERDTREE_pHyperDtree;
RIDALTLOCDIRSUBST_10_T3delt1,RIDALTLOCDIRSUBST_10_T3delt2,
RIDALTLOCDIRSUBST_10_T3delt3,RIDALTLOCDIRSUBST_10_T3delt4,
RIDALTLOCDIRSUBST_10_T3delt5,RIDALTLOCDIRSUBST_10_T3delt6,
RIDALTLOCDIRSUBST_10_T3delt7,RIDALTLOCDIRSUBST_10_T3delt8,
RIDALTLOCDIRSUBST_10_T3delt9,RIDALTLOCDIRSUBST_10_T3delt10,
RIDALTLOCDIRSUBST_10_T3delt11,RIDALTLOCDIRSUBST_10_T3delt12,
RIDALTLOCDIRSUBST_10_T3delt13,RIDALTLOCDIRSUBST_10_T3delt14,
RIDALTLOCDIRSUBST_10_T3delt15,RIDALTLOCDIRSUBST_10_T3delt16,
RIDALTLOCDIRSUBST_10_T3delt17:HYPERDTREE_pHyperNodeElt;
RIDDERIV14d1,RIDDERIV14d2,
RIDDERIV14d3,
RIDDERIV14d4,RIDDERIV14d5,
RIDDERIV14d6,
RIDDERIV14d7,RIDDERIV14d8,
RIDDERIV14d9,RIDDERIV14d10,RIDDERIV14d11,
RIDDERIV14d12,
RIDDERIV14d13,RIDDERIV14d14,
RIDDERIV14d15:HYPERDTREE_pHyperDtree;
RIDDERIV14delt1,RIDDERIV14delt2,
RIDDERIV14delt3,RIDDERIV14delt4,
RIDDERIV14delt5,RIDDERIV14delt6,
RIDDERIV14delt7,RIDDERIV14delt8,
RIDDERIV14delt9,RIDDERIV14delt10,
RIDDERIV14delt11,RIDDERIV14delt12,
RIDDERIV14delt13,RIDDERIV14delt14,
RIDDERIV14delt15,RIDDERIV14delt16,
RIDDERIV14delt17:HYPERDTREE_pHyperNodeElt;
RIDDERIV7d1,RIDDERIV7d2,
RIDDERIV7d3,
RIDDERIV7d4,RIDDERIV7d5,
RIDDERIV7d6,
RIDDERIV7d7,RIDDERIV7d8,
RIDDERIV7d9,RIDDERIV7d10,RIDDERIV7d11,
RIDDERIV7d12,
RIDDERIV7d13,RIDDERIV7d14,
RIDDERIV7d15:HYPERDTREE_pHyperDtree;
RIDDERIV7delt1,RIDDERIV7delt2,
RIDDERIV7delt3,RIDDERIV7delt4,
RIDDERIV7delt5,RIDDERIV7delt6,
RIDDERIV7delt7,RIDDERIV7delt8,
RIDDERIV7delt9,RIDDERIV7delt10,
RIDDERIV7delt11,RIDDERIV7delt12,
RIDDERIV7delt13,RIDDERIV7delt14,
RIDDERIV7delt15,RIDDERIV7delt16,
RIDDERIV7delt17:HYPERDTREE_pHyperNodeElt;
RIDDERIV12d1,RIDDERIV12d2,
RIDDERIV12d3,
RIDDERIV12d4,RIDDERIV12d5,
RIDDERIV12d6,
RIDDERIV12d7,RIDDERIV12d8,
RIDDERIV12d9,RIDDERIV12d10,RIDDERIV12d11,
RIDDERIV12d12,
RIDDERIV12d13,RIDDERIV12d14,
RIDDERIV12d15:HYPERDTREE_pHyperDtree;
RIDDERIV12delt1,RIDDERIV12delt2,
RIDDERIV12delt3,RIDDERIV12delt4,
RIDDERIV12delt5,RIDDERIV12delt6,
RIDDERIV12delt7,RIDDERIV12delt8,
RIDDERIV12delt9,RIDDERIV12delt10,
RIDDERIV12delt11,RIDDERIV12delt12,
RIDDERIV12delt13,RIDDERIV12delt14,
RIDDERIV12delt15,RIDDERIV12delt16,
RIDDERIV12delt17:HYPERDTREE_pHyperNodeElt;
FUNCTION crdtreeRIDALTPREPFORM_3_T2:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDALTPREPFORM_8_T2:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDDERIV15:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDALTLOCDIRSUBST_3_T3:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDALTLOCDIRSUBST_10_T3:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDDERIV14:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDDERIV7:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDDERIV12:HYPERDTREE_phyperdtree;FORWARD;
 PROCEDURE commrules117_init;
BEGIN
dtreeRIDALTPREPFORM_3_T2:=crdtreeRIDALTPREPFORM_3_T2;
dtreeRIDALTPREPFORM_8_T2:=crdtreeRIDALTPREPFORM_8_T2;
dtreeRIDDERIV15:=crdtreeRIDDERIV15;
dtreeRIDALTLOCDIRSUBST_3_T3:=crdtreeRIDALTLOCDIRSUBST_3_T3;
dtreeRIDALTLOCDIRSUBST_10_T3:=crdtreeRIDALTLOCDIRSUBST_10_T3;
dtreeRIDDERIV14:=crdtreeRIDDERIV14;
dtreeRIDDERIV7:=crdtreeRIDDERIV7;
dtreeRIDDERIV12:=crdtreeRIDDERIV12;
END;
{rule:}
{:RIDALTPREPFORM}
function crdtreeRIDALTPREPFORM_3_T2;
function crdtree_0:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree1:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDALTPREPFORM_3_T2d1:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree1:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=-276;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree1;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_0:=d;
END;
                                                      BEGIN
crdtreeRIDALTPREPFORM_3_T2:=crdtree_0
END;
                                                      function crdtreeRIDALTPREPFORM_8_T2;
function crdtree_5:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree1:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDALTPREPFORM_8_T2d1:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree1:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=-275;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree1;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_5:=d;
END;
                                                      BEGIN
crdtreeRIDALTPREPFORM_8_T2:=crdtree_5
END;
                                                       FUNCTION COMRIDALTPREPFORM(VPID:LSDOMAINT_SYNPATTERNSETTYPE;
Is1:LISTREE_pStree
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
 m1:LSSTREE_pstree;
T1:LSSTREE_pStree;
T3:LSSTREE_pStree;
T2:LSSTREE_pStree;
PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
                                                      BEGIN{matchmodel}
T1:=s;
match:=first;
END;{matchmodel}
                                                      PROCEDURE createM;
VAR list:LSMRUQUO_ListOfStrees;
PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
BEGIN
wholelist.first:=NIL;wholelist.last:=NIL;
END;
                                                      BEGIN{createM}
m:=T2;
END{createM};
                                                       FUNCTION subrule0X1 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
PROCEDURE createT2;
VAR result:LISTREE_setofstrees;
PROCEDURE matchtree1(s:LSSTREE_pstree;VAR match:BOOLEAN);
                                                      BEGIN
T3:=s;
match:=TRUE;
END;
PROCEDURE createtree1(VAR s:LSSTREE_pstree);
VAR list:LSMRUQUO_listofstrees;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                      BEGIN
s:=T3;
END;
                                                      BEGIN
dtree:=dtreeRIDALTPREPFORM_3_T2;
createtree1(hulplsstree);
RIDALTPREPFORM_3_T2d1^.li^.stree:=loopholes.retype(hulplsstree,hyperdtree_pstree);
                                                      result:=GIDDERIV_generate(dtree);
LISTREE_takestree(loopholes.retype(T2,LISTREE_pstree),result);
END;
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                          BEGIN
    s:= T1;
    match:=first;
    T3:=s;
    END;
                                                      PROCEDURE ACTION3;
BEGIN
;wbonus:=0;sbonus:=0

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
    IF ((VPID *[VPID30]                                              <>[]                                                    )
                                                      )
                                                       THEN
      BEGIN
      action3;
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
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
PROCEDURE createT2;
VAR result:LISTREE_setofstrees;
PROCEDURE matchtree1(s:LSSTREE_pstree;VAR match:BOOLEAN);
                                                      BEGIN
T3:=s;
match:=TRUE;
END;
PROCEDURE createtree1(VAR s:LSSTREE_pstree);
VAR list:LSMRUQUO_listofstrees;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                      BEGIN
s:=T3;
END;
                                                      BEGIN
dtree:=dtreeRIDALTPREPFORM_8_T2;
createtree1(hulplsstree);
RIDALTPREPFORM_8_T2d1^.li^.stree:=loopholes.retype(hulplsstree,hyperdtree_pstree);
                                                      result:=GIDDERIV_generate(dtree);
LISTREE_takestree(loopholes.retype(T2,LISTREE_pstree),result);
END;
                                                          PROCEDURE matchtreeT1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                          BEGIN
    s:= T1;
    match:=first;
    T3:=s;
    END;
                                                      PROCEDURE ACTION8;
BEGIN
;wbonus:=0;sbonus:=0

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
    IF ((VPID *[VPID87]                                              <>[]                                                    )
                                                      )
                                                       THEN
      BEGIN
      action8;
      createT2;
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
match:= TRUE;
  MatchModel1(m1,TRUE,match);
  If match Then
  BEGIN
  LISTREE_mergesetsofstrees(subrule0X1,result);
  LISTREE_mergesetsofstrees(subrule0X2,result);
 END;
COMRIDALTPREPFORM:=result
END;
{:RIDALTPREPFORM}
{rule:}
{:RIDDERIV15}
function crdtreeRIDDERIV15;
function crdtree_15:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_2:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_1:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_0:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtreeKEY2:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
d^.Isrulenode:=FALSE;
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV15d3:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY2:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=234;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtreeKEY2;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_0:=d;
END;
                                                      function crdtree1:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV15d4:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree1:=d;
END;
                                                      function crdtree2:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeVar(hypernodeelt,0,LICAT0);
d^.basicnodekind:=HYPERDTREE_varnode;
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV15d5:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree2:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=73;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_0;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree1;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree2;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=3;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_1:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=-209;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_1;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_2:=d;
END;
                                                      function crdtree_13:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_12:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_11:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_6:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_5:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_4:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_3:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtreeKEY3:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
d^.Isrulenode:=FALSE;
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV15d8:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY3:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=307;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtreeKEY3;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_3:=d;
END;
                                                      function crdtree3:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV15d9:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree3:=d;
END;
                                                      function crdtree4:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeVar(hypernodeelt,0,LICAT0);
d^.basicnodekind:=HYPERDTREE_varnode;
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV15d10:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree4:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=310;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_3;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree3;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree4;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=3;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_4:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=475;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV15delt7:=hypernodeelt;
dson:=crdtree_4;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_5:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=317;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_5;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_6:=d;
END;
                                                      function crdtree_10:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_9:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_8:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_7:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtreeKEY4:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
d^.Isrulenode:=FALSE;
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV15d11:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY4:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=143;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtreeKEY4;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_7:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=144;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_7;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_8:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=151;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_8;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_9:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=129;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_9;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_10:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=322;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.index:=-2-1;
params.index:=-2-1;
params.subst:=2;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV15delt6:=hypernodeelt;
dson:=crdtree_6;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree_10;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=2;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_11:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=-284;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_11;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_12:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=320;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_12;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_13:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=56;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.index:=-1-1;
params.index:=-1-1;
params.subst:=2;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV15delt1:=hypernodeelt;
number:=58;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.index:=-1-1;
params.index:=-1-1;
params.subst:=2;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV15delt2:=hypernodeelt;
dson:=crdtree_2;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree_13;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=2;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_15:=d;
END;
                                                      BEGIN
crdtreeRIDDERIV15:=crdtree_15
END;
                                                       FUNCTION COMRIDDERIV15(Is1:LISTREE_pStree;Is2:LISTREE_pStree
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
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
BVERBREC1tree:LSSTREE_pStree;
T1:LSSTREE_pStree;
T2:LSSTREE_pStree;
CNVARREC1:LSDOMAINT_CNVARrecord;
NPVARREC2:LSDOMAINT_NPVARrecord;
BVERBREC1:LSDOMAINT_BVERBrecord;
SUBVERBREC1:LSDOMAINT_SUBVERBrecord;
PREPPPROPVARREC1:LSDOMAINT_PREPPPROPVARrecord;
NPVARREC1:LSDOMAINT_NPVARrecord;
NPVARREC3:LSDOMAINT_NPVARrecord;
CNVARREC2:LSDOMAINT_CNVARrecord;
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
(((T1^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
(((T1^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
((SUBVERBREC1.THETAVP =VP012                            )
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
    IF s^.ls^.cat<>SUBVERB THEN
      match:=FALSE;
    IF match THEN
      SUBVERBREC1:=s^.ls^.SUBVERBfield^;
    IF match THEN
      match:= matchcondI1;
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
        IF match THEN KEY1:=s^.ls^.BVERBfield^.key;
      END{MatchNode};
                                                      BEGIN{MatchTree}
                BVERBREC1tree:=Lfirst^.node;
          IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchM1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM1_1,LfirstM1_1,LrestM1_1,nomoretreesM1_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1) AND (s^.li^.n <=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist1items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
                                                      BEGIN{matchmodel}
T1:=s;
match:=first;
END;{matchmodel}
                                                      PROCEDURE createM;
PROCEDURE matchtree1(s:LSSTREE_pstree;VAR match:BOOLEAN);
                                                      BEGIN
T1:=s;
match:=TRUE;
IF match THEN match:= matchcondI2;
END;
PROCEDURE createtree1(VAR s:LSSTREE_pstree);
  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN
s:=T1;
END;
                                                      PROCEDURE matchtree2(s:LSSTREE_pstree;VAR match:BOOLEAN);
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>PREPPPROPVAR THEN
      match:=FALSE;
    IF match THEN
      PREPPPROPVARREC1:=s^.ls^.PREPPPROPVARfield^;
    IF match THEN match:=(s^.ls^.PREPPPROPVARfield^.index=X1);
  END{MatchNode};
                                                      BEGIN
matchnode(s,match);
match:=match AND (s^.sons=NIL);
END;
PROCEDURE createtree2(VAR s:LSSTREE_pstree);
VAR list:LSMRUQUO_listofstrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := PREPPPROPVAR;
    N^.ls^.PREPPPROPVARfield^ := PREPPPROPVARREC1;
  N^.ls^.PREPPPROPVARfield^.index:=-1-1;
END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN
s:=MAKET_stree(PREPPPROPVAR);
createnode(s);
createlist1(list);s^.sons:=list.first;
IF list.first<>NIL THEN list.last^.brother:=NIL;
END;
                                                      PROCEDURE matchtree3(s:LSSTREE_pstree;VAR match:BOOLEAN);
                                                      BEGIN
T2:=s;
match:=TRUE;
END;
PROCEDURE createtree3(VAR s:LSSTREE_pstree);
VAR list:LSMRUQUO_listofstrees;
  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN
s:=T2;
END;
                                                      PROCEDURE matchtree4(s:LSSTREE_pstree;VAR match:BOOLEAN);
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>NPVAR THEN
      match:=FALSE;
    IF match THEN
      NPVARREC1:=s^.ls^.NPVARfield^;
    IF match THEN match:=(s^.ls^.NPVARfield^.index=X2);
  END{MatchNode};
                                                      BEGIN
matchnode(s,match);
match:=match AND (s^.sons=NIL);
END;
PROCEDURE createtree4(VAR s:LSSTREE_pstree);
VAR list:LSMRUQUO_listofstrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := NPVAR;
    N^.ls^.NPVARfield^ := NPVARREC1;
  N^.ls^.NPVARfield^.index:=-1-2;
END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN
s:=MAKET_stree(NPVAR);
createnode(s);
createlist1(list);s^.sons:=list.first;
IF list.first<>NIL THEN list.last^.brother:=NIL;
END;
                                                      BEGIN
dtree:=dtreeRIDDERIV15;
hulpstree:=LDBLEX_read(KEY2);
RIDDERIV15d3^.li^.stree:=loopholes.retype(hulpstree,HYPERDTREE_pstree);
                                                      createtree1(hulplsstree);
RIDDERIV15d4^.li^.stree:=loopholes.retype(hulplsstree,Hyperdtree_pstree);
                                                      createtree2(hulplsstree);
RIDDERIV15d5^.li^.stree:=loopholes.retype(hulplsstree,hyperdtree_pstree);
                                                      loopholes.retype(RIDDERIV15delt7
^.parameters.ls,LSPARAMS_precord)^.X475vpid:=VPID;
hulpstree:=LDBLEX_read(KEY3);
RIDDERIV15d8^.li^.stree:=loopholes.retype(hulpstree,HYPERDTREE_pstree);
                                                      createtree3(hulplsstree);
RIDDERIV15d9^.li^.stree:=loopholes.retype(hulplsstree,hyperdtree_pstree);
                                                      createtree4(hulplsstree);
RIDDERIV15d10^.li^.stree:=loopholes.retype(hulplsstree,hyperdtree_pstree);
                                                      hulpstree:=LDBLEX_read(KEY4);
RIDDERIV15d11^.li^.stree:=loopholes.retype(hulpstree,HYPERDTREE_pstree);
                                                      m:=NIL;
result:=GIDDERIV_generate(dtree);
END;
                                                       FUNCTION subrule0X1 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createT1;
  BEGIN{T1}
  END{T1};
  PROCEDURE createT2;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := NPVAR;
      N^.ls^.NPVARfield^ := NPVARREC3;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T2}
  s:=MAKET_stree(NPVAR);
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
      IF s^.ls^.cat<>NPVAR THEN
        match:=FALSE;
      IF match THEN
        NPVARREC2:=s^.ls^.NPVARfield^;
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
                                                      PROCEDURE ACTION20;
BEGIN
idargs:=LIMATCHES_COMPGETIDDICT(KEY1,ORD(VPID30));VPID:=[VPID30];KEY2:=idargs.argkeys[1];
KEY3:=idargs.argkeys[2];
KEY4:=idargs.argkeys[3];
                                                      ;
NPVARREC3:=NPVARREC2;                                 ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION24;
BEGIN
idargs:=LIMATCHES_COMPGETIDDICT(KEY1,ORD(VPID87));VPID:=[VPID87];KEY2:=idargs.argkeys[1];
KEY3:=idargs.argkeys[2];
KEY4:=idargs.argkeys[3];
                                                      ;
NPVARREC3:=NPVARREC2;                                 ;
                                                      ;wbonus:=0;sbonus:=0

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
    IF ((LIMATCHES_COMPINIDDICT(KEY1,ORD(VPID30))              )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPPROPVARrec(PREPPPROPVARREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_NPVARrec(NPVARREC3);
      MAKET_CNVARrec(CNVARREC2);
      action20;
      createT1;
      createT2;
      previous1;
      Is:=loopholes.retype(m,LISTREE_pstree);
      IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
      END;
    IF ((LIMATCHES_COMPINIDDICT(KEY1,ORD(VPID87))              )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPPROPVARrec(PREPPPROPVARREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_NPVARrec(NPVARREC3);
      MAKET_CNVARrec(CNVARREC2);
      action24;
      createT1;
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
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createT1;
  BEGIN{T1}
  END{T1};
  PROCEDURE createT2;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := CNVAR;
      N^.ls^.CNVARfield^ := CNVARREC2;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T2}
  s:=MAKET_stree(CNVAR);
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
                                                      PROCEDURE ACTION37;
BEGIN
idargs:=LIMATCHES_COMPGETIDDICT(KEY1,ORD(VPID30));VPID:=[VPID30];KEY2:=idargs.argkeys[1];
KEY3:=idargs.argkeys[2];
KEY4:=idargs.argkeys[3];
                                                      ;
CNVARREC2:=CNVARREC1;                                 ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION41;
BEGIN
idargs:=LIMATCHES_COMPGETIDDICT(KEY1,ORD(VPID87));VPID:=[VPID87];KEY2:=idargs.argkeys[1];
KEY3:=idargs.argkeys[2];
KEY4:=idargs.argkeys[3];
                                                      ;
CNVARREC2:=CNVARREC1;                                 ;
                                                      ;wbonus:=0;sbonus:=0

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
    IF ((LIMATCHES_COMPINIDDICT(KEY1,ORD(VPID30))              )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPPROPVARrec(PREPPPROPVARREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_NPVARrec(NPVARREC3);
      MAKET_CNVARrec(CNVARREC2);
      action37;
      createT1;
      createT2;
      previous1;
      Is:=loopholes.retype(m,LISTREE_pstree);
      IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
      END;
    IF ((LIMATCHES_COMPINIDDICT(KEY1,ORD(VPID87))              )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPPROPVARrec(PREPPPROPVARREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_NPVARrec(NPVARREC3);
      MAKET_CNVARrec(CNVARREC2);
      action41;
      createT1;
      createT2;
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
    WHILE match AND NOT matchcondM2 DO
    BEGIN
    MatchModel2(m2,FALSE,match);
    END;
    If match Then
    BEGIN
    LISTREE_mergesetsofstrees(subrule0X1,result);
    LISTREE_mergesetsofstrees(subrule0X2,result);
 END;
    END;
COMRIDDERIV15:=result
END;
{:RIDDERIV15}
{rule:}
{:RIDALTLOCDIRSUBST}
function crdtreeRIDALTLOCDIRSUBST_3_T3;
function crdtree_0:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree1:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDALTLOCDIRSUBST_3_T3d2:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree1:=d;
END;
                                                      function crdtree2:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDALTLOCDIRSUBST_3_T3d3:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree2:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=58;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.index:=-1-1;
params.index:=-1-1;
params.subst:=2;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDALTLOCDIRSUBST_3_T3delt1:=hypernodeelt;
dson:=crdtree1;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree2;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=2;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_0:=d;
END;
                                                      BEGIN
crdtreeRIDALTLOCDIRSUBST_3_T3:=crdtree_0
END;
                                                      function crdtreeRIDALTLOCDIRSUBST_10_T3;
function crdtree_7:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree1:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDALTLOCDIRSUBST_10_T3d2:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree1:=d;
END;
                                                      function crdtree2:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDALTLOCDIRSUBST_10_T3d3:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree2:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=56;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.index:=-1-1;
params.index:=-1-1;
params.subst:=2;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDALTLOCDIRSUBST_10_T3delt1:=hypernodeelt;
dson:=crdtree1;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree2;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=2;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_7:=d;
END;
                                                      BEGIN
crdtreeRIDALTLOCDIRSUBST_10_T3:=crdtree_7
END;
                                                       FUNCTION COMRIDALTLOCDIRSUBST(VPID:LSDOMAINT_SYNPATTERNSETTYPE;
LEVEL:INTEGER;
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
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
T1:LSSTREE_pStree;
T2:LSSTREE_pStree;
T3:LSSTREE_pStree;
PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
    PROCEDURE matchtreeM1(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                          BEGIN
    s:= M1;
    match:=first;
    T1:=s;
    END;
                                                      BEGIN{matchmodel}
T1:=s;
match:=first;
END;{matchmodel}
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
    PROCEDURE matchtreeM2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                          BEGIN
    s:= M2;
    match:=first;
    T2:=s;
    END;
                                                      BEGIN{matchmodel}
T2:=s;
match:=first;
END;{matchmodel}
                                                      PROCEDURE createM;
VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                      BEGIN{createM}
m:=T3;
END{createM};
                                                       FUNCTION subrule0X1 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
PROCEDURE createT3;
VAR result:LISTREE_setofstrees;
PROCEDURE matchtree1(s:LSSTREE_pstree;VAR match:BOOLEAN);
                                                      BEGIN
T1:=s;
match:=TRUE;
END;
PROCEDURE createtree1(VAR s:LSSTREE_pstree);
VAR list:LSMRUQUO_listofstrees;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                      BEGIN
s:=T1;
END;
                                                      PROCEDURE matchtree2(s:LSSTREE_pstree;VAR match:BOOLEAN);
                                                      BEGIN
T2:=s;
match:=TRUE;
END;
PROCEDURE createtree2(VAR s:LSSTREE_pstree);
VAR list:LSMRUQUO_listofstrees;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                      BEGIN
s:=T2;
END;
                                                      BEGIN
dtree:=dtreeRIDALTLOCDIRSUBST_3_T3;
createtree1(hulplsstree);
RIDALTLOCDIRSUBST_3_T3d2^.li^.stree:=loopholes.retype(hulplsstree,hyperdtree_pstree);
                                                      createtree2(hulplsstree);
RIDALTLOCDIRSUBST_3_T3d3^.li^.stree:=loopholes.retype(hulplsstree,hyperdtree_pstree);
                                                      result:=GIDDERIV_generate(dtree);
LISTREE_takestree(loopholes.retype(T3,LISTREE_pstree),result);
END;
                                                      PROCEDURE ACTION3;
BEGIN
;wbonus:=0;sbonus:=0

END;
                                                       BEGIN{01}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
  IF match THEN
    BEGIN
    IF ((VPID *[VPID16]                                              <>[]                                                    )
                                                      )
                                                       THEN
      BEGIN
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
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
PROCEDURE createT3;
VAR result:LISTREE_setofstrees;
PROCEDURE matchtree1(s:LSSTREE_pstree;VAR match:BOOLEAN);
                                                      BEGIN
T1:=s;
match:=TRUE;
END;
PROCEDURE createtree1(VAR s:LSSTREE_pstree);
VAR list:LSMRUQUO_listofstrees;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                      BEGIN
s:=T1;
END;
                                                      PROCEDURE matchtree2(s:LSSTREE_pstree;VAR match:BOOLEAN);
                                                      BEGIN
T2:=s;
match:=TRUE;
END;
PROCEDURE createtree2(VAR s:LSSTREE_pstree);
VAR list:LSMRUQUO_listofstrees;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                      BEGIN
s:=T2;
END;
                                                      BEGIN
dtree:=dtreeRIDALTLOCDIRSUBST_10_T3;
createtree1(hulplsstree);
RIDALTLOCDIRSUBST_10_T3d2^.li^.stree:=loopholes.retype(hulplsstree,hyperdtree_pstree);
                                                      createtree2(hulplsstree);
RIDALTLOCDIRSUBST_10_T3d3^.li^.stree:=loopholes.retype(hulplsstree,hyperdtree_pstree);
                                                      result:=GIDDERIV_generate(dtree);
LISTREE_takestree(loopholes.retype(T3,LISTREE_pstree),result);
END;
                                                      PROCEDURE ACTION10;
BEGIN
;wbonus:=0;sbonus:=0

END;
                                                       BEGIN{02}
 match:= TRUE;
 LISTREE_INITsetOFstrees(result);
  IF match THEN
    BEGIN
    IF ((VPID *[VPID7]                                               <>[]                                                    )
                                                      )
                                                       THEN
      BEGIN
      action10;
      createT3;
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
    LISTREE_mergesetsofstrees(subrule0X1,result);
    LISTREE_mergesetsofstrees(subrule0X2,result);
 END;
    END;
COMRIDALTLOCDIRSUBST:=result
END;
{:RIDALTLOCDIRSUBST}
{rule:}
{:RIDDERIV14}
function crdtreeRIDDERIV14;
function crdtree_9:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_8:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_3:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_2:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_1:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_0:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtreeKEY2:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
d^.Isrulenode:=FALSE;
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV14d2:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY2:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=234;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtreeKEY2;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_0:=d;
END;
                                                      function crdtree1:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV14d3:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree1:=d;
END;
                                                      function crdtree2:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV14d4:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree2:=d;
END;
                                                      function crdtree3:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeVar(hypernodeelt,0,LICAT0);
d^.basicnodekind:=HYPERDTREE_varnode;
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV14d5:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree3:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=74;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_0;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree1;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree2;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree3;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=4;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_1:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=-369;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_1;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_2:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=-395;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_2;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_3:=d;
END;
                                                      function crdtree_7:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_6:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_5:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_4:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtreeKEY3:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
d^.Isrulenode:=FALSE;
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV14d6:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY3:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=143;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtreeKEY3;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_4:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=144;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_4;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_5:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=151;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_5;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_6:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=129;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_6;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_7:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=12;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.index:=-1-1;
params.index:=-1-1;
params.subst:=2;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV14delt1:=hypernodeelt;
dson:=crdtree_3;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree_7;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=2;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_8:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=-394;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_8;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_9:=d;
END;
                                                      BEGIN
crdtreeRIDDERIV14:=crdtree_9
END;
                                                       FUNCTION COMRIDDERIV14(Is1:LISTREE_pStree;Is2:LISTREE_pStree;Is3
:LISTREE_pStree
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
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
 m3:LSSTREE_pstree;
BVERBREC1tree:LSSTREE_pStree;
T1:LSSTREE_pStree;
T2:LSSTREE_pStree;
BVERBREC1:LSDOMAINT_BVERBrecord;
SUBVERBREC1:LSDOMAINT_SUBVERBrecord;
NPVARREC1:LSDOMAINT_NPVARrecord;
FUNCTION matchcondM3:BOOLEAN;
                                                      BEGIN
matchcondM3:=FALSE;
  IF
(((T2^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     )
                                                      )
                                                      THEN 
matchcondM3:=TRUE;

END;{matchcondM3}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
(((T1^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
FUNCTION matchcondI3:BOOLEAN;
                                                      BEGIN
matchcondI3:=FALSE;
  IF
(((T2^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
(((T1^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
((SUBVERBREC1.THETAVP =VP123                            )
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
    IF s^.ls^.cat<>SUBVERB THEN
      match:=FALSE;
    IF match THEN
      SUBVERBREC1:=s^.ls^.SUBVERBfield^;
    IF match THEN
      match:= matchcondI1;
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
        IF match THEN KEY1:=s^.ls^.BVERBfield^.key;
      END{MatchNode};
                                                      BEGIN{MatchTree}
                BVERBREC1tree:=Lfirst^.node;
          IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchM1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM1_1,LfirstM1_1,LrestM1_1,nomoretreesM1_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1) AND (s^.li^.n <=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist1items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
                                                      BEGIN{matchmodel}
T1:=s;
match:=first;
END;{matchmodel}
PROCEDURE MatchModel3(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
                                                      BEGIN{matchmodel}
T2:=s;
match:=first;
END;{matchmodel}
                                                      PROCEDURE createM;
PROCEDURE matchtree1(s:LSSTREE_pstree;VAR match:BOOLEAN);
                                                      BEGIN
T1:=s;
match:=TRUE;
IF match THEN match:= matchcondI2;
END;
PROCEDURE createtree1(VAR s:LSSTREE_pstree);
  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN
s:=T1;
END;
                                                      PROCEDURE matchtree2(s:LSSTREE_pstree;VAR match:BOOLEAN);
                                                      BEGIN
T2:=s;
match:=TRUE;
IF match THEN match:= matchcondI3;
END;
PROCEDURE createtree2(VAR s:LSSTREE_pstree);
  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN
s:=T2;
END;
                                                      PROCEDURE matchtree3(s:LSSTREE_pstree;VAR match:BOOLEAN);
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>NPVAR THEN
      match:=FALSE;
    IF match THEN
      NPVARREC1:=s^.ls^.NPVARfield^;
    IF match THEN match:=(s^.ls^.NPVARfield^.index=X1);
  END{MatchNode};
                                                      BEGIN
matchnode(s,match);
match:=match AND (s^.sons=NIL);
END;
PROCEDURE createtree3(VAR s:LSSTREE_pstree);
VAR list:LSMRUQUO_listofstrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := NPVAR;
    N^.ls^.NPVARfield^ := NPVARREC1;
  N^.ls^.NPVARfield^.index:=-1-1;
END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN
s:=MAKET_stree(NPVAR);
createnode(s);
createlist1(list);s^.sons:=list.first;
IF list.first<>NIL THEN list.last^.brother:=NIL;
END;
                                                      BEGIN
dtree:=dtreeRIDDERIV14;
hulpstree:=LDBLEX_read(KEY2);
RIDDERIV14d2^.li^.stree:=loopholes.retype(hulpstree,HYPERDTREE_pstree);
                                                      createtree1(hulplsstree);
RIDDERIV14d3^.li^.stree:=loopholes.retype(hulplsstree,Hyperdtree_pstree);
                                                      createtree2(hulplsstree);
RIDDERIV14d4^.li^.stree:=loopholes.retype(hulplsstree,Hyperdtree_pstree);
                                                      createtree3(hulplsstree);
RIDDERIV14d5^.li^.stree:=loopholes.retype(hulplsstree,hyperdtree_pstree);
                                                      hulpstree:=LDBLEX_read(KEY3);
RIDDERIV14d6^.li^.stree:=loopholes.retype(hulpstree,HYPERDTREE_pstree);
                                                      m:=NIL;
result:=GIDDERIV_generate(dtree);
END;
                                                      PROCEDURE ACTION11;
BEGIN
idargs:=LIMATCHES_COMPGETIDDICT(KEY1,ORD(VPID22));VPID:=[VPID22];KEY2:=idargs.argkeys[1];
KEY3:=idargs.argkeys[2];
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
m2:=loopholes.retype(Is2,LSSTREE_pStree);
m3:=loopholes.retype(Is3,LSSTREE_pStree);
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
      MatchModel3(m3,TRUE,match);
      If match Then
      WHILE match AND NOT matchcondM3 DO
      BEGIN
      MatchModel3(m3,FALSE,match);
      END;
      If match Then
      BEGIN
 END;
IF match THEN
  BEGIN
  IF ((LIMATCHES_COMPINIDDICT(KEY1,ORD(VPID22))              )
                                                      )
                                                       THEN
    BEGIN
    MAKET_NPVARrec(NPVARREC1);
    action11;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                            END;
    END;
COMRIDDERIV14:=result
END;
{:RIDDERIV14}
{rule:}
{:RIDDERIV7}
function crdtreeRIDDERIV7;
function crdtree_14:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_2:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_1:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_0:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtreeKEY2:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
d^.Isrulenode:=FALSE;
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV7d2:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY2:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=234;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtreeKEY2;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_0:=d;
END;
                                                      function crdtree1:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV7d3:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree1:=d;
END;
                                                      function crdtree2:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV7d4:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree2:=d;
END;
                                                      function crdtree3:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeVar(hypernodeelt,0,LICAT0);
d^.basicnodekind:=HYPERDTREE_varnode;
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV7d5:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree3:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=74;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_0;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree1;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree2;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree3;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=4;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_1:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=-209;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_1;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_2:=d;
END;
                                                      function crdtree_13:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_12:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_11:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_6:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_5:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_4:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_3:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtreeKEY4:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
d^.Isrulenode:=FALSE;
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV7d7:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY4:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=307;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtreeKEY4;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_3:=d;
END;
                                                      function crdtree4:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV7d8:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree4:=d;
END;
                                                      function crdtree5:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeVar(hypernodeelt,0,LICAT0);
d^.basicnodekind:=HYPERDTREE_varnode;
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV7d9:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree5:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=310;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_3;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree4;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree5;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=3;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_4:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=-275;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_4;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_5:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=317;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_5;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_6:=d;
END;
                                                      function crdtree_10:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_9:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_8:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_7:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtreeKEY3:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
d^.Isrulenode:=FALSE;
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV7d10:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY3:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=143;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtreeKEY3;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_7:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=144;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_7;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_8:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=151;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_8;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_9:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=129;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_9;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_10:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=322;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.index:=-2-1;
params.index:=-2-1;
params.subst:=2;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV7delt6:=hypernodeelt;
dson:=crdtree_6;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree_10;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=2;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_11:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=-284;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_11;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_12:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=320;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_12;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_13:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=477;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.index:=-1-1;
params.index:=-1-1;
params.subst:=2;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV7delt1:=hypernodeelt;
dson:=crdtree_2;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree_13;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=2;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_14:=d;
END;
                                                      BEGIN
crdtreeRIDDERIV7:=crdtree_14
END;
                                                       FUNCTION COMRIDDERIV7(Is1:LISTREE_pStree;Is2:LISTREE_pStree;Is3
:LISTREE_pStree
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
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
 m3:LSSTREE_pstree;
BVERBREC1tree:LSSTREE_pStree;
T1:LSSTREE_pStree;
T2:LSSTREE_pStree;
T3:LSSTREE_pStree;
CNVARREC1:LSDOMAINT_CNVARrecord;
NPVARREC2:LSDOMAINT_NPVARrecord;
BVERBREC1:LSDOMAINT_BVERBrecord;
SUBVERBREC1:LSDOMAINT_SUBVERBrecord;
PREPPPROPVARREC1:LSDOMAINT_PREPPPROPVARrecord;
NPVARREC1:LSDOMAINT_NPVARrecord;
NPVARREC3:LSDOMAINT_NPVARrecord;
CNVARREC2:LSDOMAINT_CNVARrecord;
FUNCTION matchcondM3:BOOLEAN;
                                                      BEGIN
matchcondM3:=FALSE;
  IF
(((T2^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     )
                                                      )
                                                      THEN 
matchcondM3:=TRUE;

END;{matchcondM3}
FUNCTION matchcondI3:BOOLEAN;
                                                      BEGIN
matchcondI3:=FALSE;
  IF
(((T2^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
(((T1^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
(((T1^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
((SUBVERBREC1.THETAVP =VP123                            )
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
    IF s^.ls^.cat<>SUBVERB THEN
      match:=FALSE;
    IF match THEN
      SUBVERBREC1:=s^.ls^.SUBVERBfield^;
    IF match THEN
      match:= matchcondI1;
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
        IF match THEN KEY1:=s^.ls^.BVERBfield^.key;
      END{MatchNode};
                                                      BEGIN{MatchTree}
                BVERBREC1tree:=Lfirst^.node;
          IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchM1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM1_1,LfirstM1_1,LrestM1_1,nomoretreesM1_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1) AND (s^.li^.n <=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist1items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
                                                      BEGIN{matchmodel}
T1:=s;
match:=first;
END;{matchmodel}
PROCEDURE MatchModel3(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
                                                      BEGIN{matchmodel}
T2:=s;
match:=first;
END;{matchmodel}
                                                      PROCEDURE createM;
PROCEDURE matchtree1(s:LSSTREE_pstree;VAR match:BOOLEAN);
                                                      BEGIN
T1:=s;
match:=TRUE;
IF match THEN match:= matchcondI2;
END;
PROCEDURE createtree1(VAR s:LSSTREE_pstree);
  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN
s:=T1;
END;
                                                      PROCEDURE matchtree2(s:LSSTREE_pstree;VAR match:BOOLEAN);
                                                      BEGIN
T2:=s;
match:=TRUE;
IF match THEN match:= matchcondI3;
END;
PROCEDURE createtree2(VAR s:LSSTREE_pstree);
  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN
s:=T2;
END;
                                                      PROCEDURE matchtree3(s:LSSTREE_pstree;VAR match:BOOLEAN);
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>PREPPPROPVAR THEN
      match:=FALSE;
    IF match THEN
      PREPPPROPVARREC1:=s^.ls^.PREPPPROPVARfield^;
    IF match THEN match:=(s^.ls^.PREPPPROPVARfield^.index=X1);
  END{MatchNode};
                                                      BEGIN
matchnode(s,match);
match:=match AND (s^.sons=NIL);
END;
PROCEDURE createtree3(VAR s:LSSTREE_pstree);
VAR list:LSMRUQUO_listofstrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := PREPPPROPVAR;
    N^.ls^.PREPPPROPVARfield^ := PREPPPROPVARREC1;
  N^.ls^.PREPPPROPVARfield^.index:=-1-1;
END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN
s:=MAKET_stree(PREPPPROPVAR);
createnode(s);
createlist1(list);s^.sons:=list.first;
IF list.first<>NIL THEN list.last^.brother:=NIL;
END;
                                                      PROCEDURE matchtree4(s:LSSTREE_pstree;VAR match:BOOLEAN);
                                                      BEGIN
T3:=s;
match:=TRUE;
END;
PROCEDURE createtree4(VAR s:LSSTREE_pstree);
VAR list:LSMRUQUO_listofstrees;
  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN
s:=T3;
END;
                                                      PROCEDURE matchtree5(s:LSSTREE_pstree;VAR match:BOOLEAN);
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>NPVAR THEN
      match:=FALSE;
    IF match THEN
      NPVARREC1:=s^.ls^.NPVARfield^;
    IF match THEN match:=(s^.ls^.NPVARfield^.index=X2);
  END{MatchNode};
                                                      BEGIN
matchnode(s,match);
match:=match AND (s^.sons=NIL);
END;
PROCEDURE createtree5(VAR s:LSSTREE_pstree);
VAR list:LSMRUQUO_listofstrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := NPVAR;
    N^.ls^.NPVARfield^ := NPVARREC1;
  N^.ls^.NPVARfield^.index:=-1-2;
END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN
s:=MAKET_stree(NPVAR);
createnode(s);
createlist1(list);s^.sons:=list.first;
IF list.first<>NIL THEN list.last^.brother:=NIL;
END;
                                                      BEGIN
dtree:=dtreeRIDDERIV7;
loopholes.retype(RIDDERIV7delt1^.parameters.ls,LSPARAMS_precord)^.X477vpid:=VPID;
hulpstree:=LDBLEX_read(KEY2);
RIDDERIV7d2^.li^.stree:=loopholes.retype(hulpstree,HYPERDTREE_pstree);
                                                      createtree1(hulplsstree);
RIDDERIV7d3^.li^.stree:=loopholes.retype(hulplsstree,Hyperdtree_pstree);
                                                      createtree2(hulplsstree);
RIDDERIV7d4^.li^.stree:=loopholes.retype(hulplsstree,Hyperdtree_pstree);
                                                      createtree3(hulplsstree);
RIDDERIV7d5^.li^.stree:=loopholes.retype(hulplsstree,hyperdtree_pstree);
                                                      hulpstree:=LDBLEX_read(KEY4);
RIDDERIV7d7^.li^.stree:=loopholes.retype(hulpstree,HYPERDTREE_pstree);
                                                      createtree4(hulplsstree);
RIDDERIV7d8^.li^.stree:=loopholes.retype(hulplsstree,hyperdtree_pstree);
                                                      createtree5(hulplsstree);
RIDDERIV7d9^.li^.stree:=loopholes.retype(hulplsstree,hyperdtree_pstree);
                                                      hulpstree:=LDBLEX_read(KEY3);
RIDDERIV7d10^.li^.stree:=loopholes.retype(hulpstree,HYPERDTREE_pstree);
                                                      m:=NIL;
result:=GIDDERIV_generate(dtree);
END;
                                                       FUNCTION subrule0X1 :LISTREE_SetOfStrees;
 VAR result:LISTREE_SetOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
  PROCEDURE createT3;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := NPVAR;
      N^.ls^.NPVARfield^ := NPVARREC3;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T3}
  s:=MAKET_stree(NPVAR);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T3:=s;
  END{T3};
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>NPVAR THEN
        match:=FALSE;
      IF match THEN
        NPVARREC2:=s^.ls^.NPVARfield^;
    END{MatchNode};
                                                          BEGIN
    s:= T2;
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
idargs:=LIMATCHES_COMPGETIDDICT(KEY1,ORD(VPID16));VPID:=[VPID16];KEY2:=idargs.argkeys[1];
KEY4:=idargs.argkeys[2];
KEY3:=idargs.argkeys[3];
                                                      ;
NPVARREC3:=NPVARREC2;                                 ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION23;
BEGIN
idargs:=LIMATCHES_COMPGETIDDICT(KEY1,ORD(VPID7));VPID:=[VPID7];KEY2:=idargs.argkeys[1];
KEY4:=idargs.argkeys[2];
KEY3:=idargs.argkeys[3];
                                                      ;
NPVARREC3:=NPVARREC2;                                 ;
                                                      ;wbonus:=0;sbonus:=0

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
  IF match THEN
    BEGIN
    IF ((LIMATCHES_COMPINIDDICT(KEY1,ORD(VPID16))              )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPPROPVARrec(PREPPPROPVARREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_NPVARrec(NPVARREC3);
      MAKET_CNVARrec(CNVARREC2);
      action19;
      createT2;
      createT3;
      previous1;
      Is:=loopholes.retype(m,LISTREE_pstree);
      IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
      END;
    IF ((LIMATCHES_COMPINIDDICT(KEY1,ORD(VPID7))               )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPPROPVARrec(PREPPPROPVARREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_NPVARrec(NPVARREC3);
      MAKET_CNVARrec(CNVARREC2);
      action23;
      createT2;
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
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                        PROCEDURE previous1;
  BEGIN
  createM;
  END;
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
  PROCEDURE createT3;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
    BEGIN{CreateNode}
      N^.ls^.cat := CNVAR;
      N^.ls^.CNVARfield^ := CNVARREC2;
    END{CreateNode};
                                                          PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T3}
  s:=MAKET_stree(CNVAR);
  createnode(s);
  createlist1(list);
  IF list.first<>NIL THEN list.last^.brother:=NIL;
  s^.li^.n:=numberofelements(list);
  s^.sons:=list.first;
  T3:=s;
  END{T3};
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
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
    s:= T2;
    matchnode(s,match);
        IF match THEN
          match:= (s^.li^.n <=0);
        IF match THEN
          BEGIN
          END;
IF match THEN matchlist0items(s^.sons,first,match);
    END;
                                                      PROCEDURE ACTION36;
BEGIN
idargs:=LIMATCHES_COMPGETIDDICT(KEY1,ORD(VPID16));VPID:=[VPID16];KEY2:=idargs.argkeys[1];
KEY4:=idargs.argkeys[2];
KEY3:=idargs.argkeys[3];
                                                      ;
CNVARREC2:=CNVARREC1;                                 ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION40;
BEGIN
idargs:=LIMATCHES_COMPGETIDDICT(KEY1,ORD(VPID7));VPID:=[VPID7];KEY2:=idargs.argkeys[1];
KEY4:=idargs.argkeys[2];
KEY3:=idargs.argkeys[3];
                                                      ;
CNVARREC2:=CNVARREC1;                                 ;
                                                      ;wbonus:=0;sbonus:=0

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
  IF match THEN
    BEGIN
    IF ((LIMATCHES_COMPINIDDICT(KEY1,ORD(VPID16))              )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPPROPVARrec(PREPPPROPVARREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_NPVARrec(NPVARREC3);
      MAKET_CNVARrec(CNVARREC2);
      action36;
      createT2;
      createT3;
      previous1;
      Is:=loopholes.retype(m,LISTREE_pstree);
      IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
      END;
    IF ((LIMATCHES_COMPINIDDICT(KEY1,ORD(VPID7))               )
                                                      )
                                                       THEN
      BEGIN
      MAKET_PREPPPROPVARrec(PREPPPROPVARREC1);
      MAKET_NPVARrec(NPVARREC1);
      MAKET_NPVARrec(NPVARREC3);
      MAKET_CNVARrec(CNVARREC2);
      action40;
      createT2;
      createT3;
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
m3:=loopholes.retype(Is3,LSSTREE_pStree);
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
      MatchModel3(m3,TRUE,match);
      If match Then
      WHILE match AND NOT matchcondM3 DO
      BEGIN
      MatchModel3(m3,FALSE,match);
      END;
      If match Then
      BEGIN
      LISTREE_mergesetsofstrees(subrule0X1,result);
      LISTREE_mergesetsofstrees(subrule0X2,result);
 END;
      END;
    END;
COMRIDDERIV7:=result
END;
{:RIDDERIV7}
{rule:}
{:RIDDERIV12}
function crdtreeRIDDERIV12;
function crdtree_14:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_2:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_1:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_0:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtreeKEY2:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
d^.Isrulenode:=FALSE;
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV12d2:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY2:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=234;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtreeKEY2;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_0:=d;
END;
                                                      function crdtree1:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV12d3:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree1:=d;
END;
                                                      function crdtree2:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeVar(hypernodeelt,0,LICAT0);
d^.basicnodekind:=HYPERDTREE_varnode;
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV12d4:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree2:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=72;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_0;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree1;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree2;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=3;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_1:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=-103;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_1;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_2:=d;
END;
                                                      function crdtree_13:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_12:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_11:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_6:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_5:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_4:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_3:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtreeKEY3:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
d^.Isrulenode:=FALSE;
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV12d6:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY3:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=307;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtreeKEY3;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_3:=d;
END;
                                                      function crdtree3:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV12d7:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree3:=d;
END;
                                                      function crdtree4:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeVar(hypernodeelt,0,LICAT0);
d^.basicnodekind:=HYPERDTREE_varnode;
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV12d8:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree4:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=310;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_3;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree3;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree4;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=3;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_4:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=-275;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_4;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_5:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=317;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_5;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_6:=d;
END;
                                                      function crdtree_10:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_9:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_8:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_7:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtreeKEY4:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtreeLeave(d);
d^.basicnodekind:=HYPERDTREE_basicnode;
d^.Isrulenode:=FALSE;
d^.basicnodekind:=HYPERDTREE_basicnode;
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV12d11:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY4:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=143;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtreeKEY4;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_7:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=437;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV12delt10:=hypernodeelt;
dson:=crdtree_7;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_8:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=151;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_8;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_9:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=438;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV12delt9:=hypernodeelt;
dson:=crdtree_9;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_10:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=322;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.index:=-2-1;
params.index:=-2-1;
params.subst:=2;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV12delt5:=hypernodeelt;
dson:=crdtree_6;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree_10;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=2;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_11:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=-513;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_11;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_12:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=321;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_12;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_13:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=57;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.index:=-1-1;
params.index:=-1-1;
params.subst:=2;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV12delt1:=hypernodeelt;
dson:=crdtree_2;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree_13;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=2;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_14:=d;
END;
                                                      BEGIN
crdtreeRIDDERIV12:=crdtree_14
END;
                                                       FUNCTION COMRIDDERIV12(Is1:LISTREE_pStree;Is2:LISTREE_pStree;Is3
:LISTREE_pStree
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
 m1:LSSTREE_pstree;
 m2:LSSTREE_pstree;
 m3:LSSTREE_pstree;
BVERBREC1tree:LSSTREE_pStree;
T1:LSSTREE_pStree;
T2:LSSTREE_pStree;
BVERBREC1:LSDOMAINT_BVERBrecord;
SUBVERBREC1:LSDOMAINT_SUBVERBrecord;
PREPPPROPVARREC1:LSDOMAINT_PREPPPROPVARrecord;
NPVARREC1:LSDOMAINT_NPVARrecord;
FUNCTION matchcondM3:BOOLEAN;
                                                      BEGIN
matchcondM3:=FALSE;
  IF
(((T2^.CAT IN [NPVAR,
CNVAR]                                                )                                                     )
                                                      )
                                                      THEN 
matchcondM3:=TRUE;

END;{matchcondM3}
FUNCTION matchcondI3:BOOLEAN;
                                                      BEGIN
matchcondI3:=FALSE;
  IF
(((T2^.CAT IN [NPVAR,
CNVAR]                                                )                                                     )
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
(((T1^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
(((T1^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     )
                                                      )
                                                      THEN 
matchcondI2:=TRUE;

END;{matchcondI2}
FUNCTION matchcondI1:BOOLEAN;
                                                      BEGIN
matchcondI1:=FALSE;
  IF
((SUBVERBREC1.THETAVP =VP120                            )
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
    IF s^.ls^.cat<>SUBVERB THEN
      match:=FALSE;
    IF match THEN
      SUBVERBREC1:=s^.ls^.SUBVERBfield^;
    IF match THEN
      match:= matchcondI1;
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
        IF match THEN KEY1:=s^.ls^.BVERBfield^.key;
      END{MatchNode};
                                                      BEGIN{MatchTree}
                BVERBREC1tree:=Lfirst^.node;
          IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchM1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM1_1,LfirstM1_1,LrestM1_1,nomoretreesM1_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1) AND (s^.li^.n <=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist1items,lastmatch) END;
PROCEDURE MatchModel2(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
                                                      BEGIN{matchmodel}
T1:=s;
match:=first;
END;{matchmodel}
PROCEDURE MatchModel3(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
                                                      BEGIN{matchmodel}
T2:=s;
match:=first;
END;{matchmodel}
                                                      PROCEDURE createM;
PROCEDURE matchtree1(s:LSSTREE_pstree;VAR match:BOOLEAN);
                                                      BEGIN
T1:=s;
match:=TRUE;
IF match THEN match:= matchcondI2;
END;
PROCEDURE createtree1(VAR s:LSSTREE_pstree);
  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN
s:=T1;
END;
                                                      PROCEDURE matchtree2(s:LSSTREE_pstree;VAR match:BOOLEAN);
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>PREPPPROPVAR THEN
      match:=FALSE;
    IF match THEN
      PREPPPROPVARREC1:=s^.ls^.PREPPPROPVARfield^;
    IF match THEN match:=(s^.ls^.PREPPPROPVARfield^.index=X1);
  END{MatchNode};
                                                      BEGIN
matchnode(s,match);
match:=match AND (s^.sons=NIL);
END;
PROCEDURE createtree2(VAR s:LSSTREE_pstree);
VAR list:LSMRUQUO_listofstrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := PREPPPROPVAR;
    N^.ls^.PREPPPROPVARfield^ := PREPPPROPVARREC1;
  N^.ls^.PREPPPROPVARfield^.index:=-1-1;
END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN
s:=MAKET_stree(PREPPPROPVAR);
createnode(s);
createlist1(list);s^.sons:=list.first;
IF list.first<>NIL THEN list.last^.brother:=NIL;
END;
                                                      PROCEDURE matchtree3(s:LSSTREE_pstree;VAR match:BOOLEAN);
                                                      BEGIN
T2:=s;
match:=TRUE;
IF match THEN match:= matchcondI3;
END;
PROCEDURE createtree3(VAR s:LSSTREE_pstree);
  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN
s:=T2;
END;
                                                      PROCEDURE matchtree4(s:LSSTREE_pstree;VAR match:BOOLEAN);
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>NPVAR THEN
      match:=FALSE;
    IF match THEN
      NPVARREC1:=s^.ls^.NPVARfield^;
    IF match THEN match:=(s^.ls^.NPVARfield^.index=X2);
  END{MatchNode};
                                                      BEGIN
matchnode(s,match);
match:=match AND (s^.sons=NIL);
END;
PROCEDURE createtree4(VAR s:LSSTREE_pstree);
VAR list:LSMRUQUO_listofstrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := NPVAR;
    N^.ls^.NPVARfield^ := NPVARREC1;
  N^.ls^.NPVARfield^.index:=-1-2;
END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN
s:=MAKET_stree(NPVAR);
createnode(s);
createlist1(list);s^.sons:=list.first;
IF list.first<>NIL THEN list.last^.brother:=NIL;
END;
                                                      BEGIN
dtree:=dtreeRIDDERIV12;
hulpstree:=LDBLEX_read(KEY2);
RIDDERIV12d2^.li^.stree:=loopholes.retype(hulpstree,HYPERDTREE_pstree);
                                                      createtree1(hulplsstree);
RIDDERIV12d3^.li^.stree:=loopholes.retype(hulplsstree,Hyperdtree_pstree);
                                                      createtree2(hulplsstree);
RIDDERIV12d4^.li^.stree:=loopholes.retype(hulplsstree,hyperdtree_pstree);
                                                      hulpstree:=LDBLEX_read(KEY3);
RIDDERIV12d6^.li^.stree:=loopholes.retype(hulpstree,HYPERDTREE_pstree);
                                                      createtree3(hulplsstree);
RIDDERIV12d7^.li^.stree:=loopholes.retype(hulplsstree,Hyperdtree_pstree);
                                                      createtree4(hulplsstree);
RIDDERIV12d8^.li^.stree:=loopholes.retype(hulplsstree,hyperdtree_pstree);
                                                      loopholes.retype(RIDDERIV12delt9
^.parameters.ls,LSPARAMS_precord)^.X438vpid:=VPID;
loopholes.retype(RIDDERIV12delt10^.parameters.ls,LSPARAMS_precord)^.X437vpid:=VPID;
hulpstree:=LDBLEX_read(KEY4);
RIDDERIV12d11^.li^.stree:=loopholes.retype(hulpstree,HYPERDTREE_pstree);
                                                      m:=NIL;
result:=GIDDERIV_generate(dtree);
END;
                                                      PROCEDURE ACTION16;
BEGIN
idargs:=LIMATCHES_COMPGETIDDICT(KEY1,ORD(VPID14));VPID:=[VPID14];KEY2:=idargs.argkeys[1];
KEY3:=idargs.argkeys[2];
KEY4:=idargs.argkeys[3];
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION18;
BEGIN
idargs:=LIMATCHES_COMPGETIDDICT(KEY1,ORD(VPID15));VPID:=[VPID15];KEY2:=idargs.argkeys[1];
KEY3:=idargs.argkeys[2];
KEY4:=idargs.argkeys[3];
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
m2:=loopholes.retype(Is2,LSSTREE_pStree);
m3:=loopholes.retype(Is3,LSSTREE_pStree);
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
      MatchModel3(m3,TRUE,match);
      If match Then
      WHILE match AND NOT matchcondM3 DO
      BEGIN
      MatchModel3(m3,FALSE,match);
      END;
      If match Then
      BEGIN
 END;
IF match THEN
  BEGIN
  IF ((LIMATCHES_COMPINIDDICT(KEY1,ORD(VPID14))              )
                                                      )
                                                       THEN
    BEGIN
    MAKET_PREPPPROPVARrec(PREPPPROPVARREC1);
    MAKET_NPVARrec(NPVARREC1);
    action16;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
  IF ((LIMATCHES_COMPINIDDICT(KEY1,ORD(VPID15))              )
                                                      )
                                                       THEN
    BEGIN
    MAKET_PREPPPROPVARrec(PREPPPROPVARREC1);
    MAKET_NPVARrec(NPVARREC1);
    action18;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                            END;
    END;
COMRIDDERIV12:=result
END;
{:RIDDERIV12}
