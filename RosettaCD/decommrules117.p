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
pragma C_include('lsparams.pf');
pragma C_include('ldmrules.pf');
pragma C_include('aidderiv.pf');
pragma C_include('hyperdtree.pf');
pragma C_include('strtokey.pf');
pragma C_include('lsmruquo.pf');
pragma C_include('lsauxdom.pf');
pragma C_include('ldblex.pf');
PACKAGE decommrules;
WITH listree,lsdomaint;
pragma C_include('decommrules117.pf');
END;
PROGRAM decomMrules117;
WITH globsubst,listree,limatches,lsmatches,
lidomaint,liiddict,lsdomaint,maket,lsstree,
copyt,mem,lsparams,ldmrules,
aidderiv,hyperdtree,strtokey,lsmruquo,
lsauxdom,ldblex;
TYPE synrelset=SET OF LSDOMAINT_synrel;
VAR hulpstree:LISTREE_pstree;
 VPID:LSDOMAINT_synpatternsettype;
hulplsstree:LSSTREE_pstree;
 lsps:LSPARAMS_precord;
dtreeRIDALTPREPFORM_3_T2:HYPERDTREE_pHYPERDTREE;
dtreeRIDALTPREPFORM_8_T2:HYPERDTREE_pHYPERDTREE;
dtreeRIDDERIV15:HYPERDTREE_pHYPERDTREE;
dtreeRIDALTLOCDIRSUBST_3_T3:HYPERDTREE_pHYPERDTREE;
dtreeRIDALTLOCDIRSUBST_10_T3:HYPERDTREE_pHYPERDTREE;
dtreeRIDDERIV14:HYPERDTREE_pHYPERDTREE;
dtreeRIDDERIV7:HYPERDTREE_pHYPERDTREE;
dtreeRIDDERIV12:HYPERDTREE_pHYPERDTREE;
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
X1,X2,X3,X4,X5:INTEGER;
FUNCTION crdtreeRIDALTPREPFORM_3_T2:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDALTPREPFORM_8_T2:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDDERIV15:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDALTLOCDIRSUBST_3_T3:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDALTLOCDIRSUBST_10_T3:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDDERIV14:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDDERIV7:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDDERIV12:HYPERDTREE_phyperdtree;FORWARD;
 PROCEDURE decommrules117_init;
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
                                                       FUNCTION DECRIDALTPREPFORM(VAR VPID:LSDOMAINT_SYNPATTERNSETTYPE;
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
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
T1:LSSTREE_pStree;
T3:LSSTREE_pStree;
T2:LSSTREE_pStree;
PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
BEGIN
wholelist.first:=NIL;wholelist.last:=NIL;
END;
                                                      BEGIN{createM}
m1:=T1;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
                                                      BEGIN{matchmodel}
T2:=s;
match:=first;
END;{matchmodel}
                                                       FUNCTION subrule0X1 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                      PROCEDURE MatchtreeT2(VAR match:BOOLEAN;first:Boolean);
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
match:=AIDDERIV_analyse(dtree,loopholes.retype(T2,LISTREE_pstree));
hulplsstree:=loopholes.retype(
RIDALTPREPFORM_3_T2d1^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree1(hulplsstree,match);
                                                      END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  END;
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T1}
  s:=T3;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION4;
BEGIN
VPID:=[VPID30]                                              ;wbonus:=0;sbonus:=0

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
  IF ((TRUE                                                  )
                                                      )
                                                       THEN
    BEGIN
    action4;
    createT1;
    previous1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
    END;
                                                          END;
                                                       subrule0X1:=result
 END;
 FUNCTION subrule0X2 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
                                                      PROCEDURE MatchtreeT2(VAR match:BOOLEAN;first:Boolean);
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
match:=AIDDERIV_analyse(dtree,loopholes.retype(T2,LISTREE_pstree));
hulplsstree:=loopholes.retype(
RIDALTPREPFORM_8_T2d1^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree1(hulplsstree,match);
                                                      END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  END;
  PROCEDURE createT1;
  VAR s:LSSTREE_pstree;
      list:LSMRUQUO_ListOfStrees;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                        BEGIN{T1}
  s:=T3;
  T1:=s;
  END{T1};
                                                      PROCEDURE ACTION9;
BEGIN
VPID:=[VPID87]                                              ;wbonus:=0;sbonus:=0

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
  IF ((TRUE                                                  )
                                                      )
                                                       THEN
    BEGIN
    action9;
    createT1;
    previous1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
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
DECRIDALTPREPFORM:=result
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
                                                       FUNCTION DECRIDDERIV15(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
VAR result:LISTREE_SetOfTupleOfStrees;
 wbonus,sbonus:INTEGER;
 m:LSSTREE_pstree;
 tuple:LISTREE_TupleOfStrees;
 first:BOOLEAN;
 match:BOOLEAN;
 idargs:LIIDDICT_idargs;
dtree:HYPERDTREE_phyperdtree;
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
BVERBREC1tree:LSSTREE_pStree;
T1:LSSTREE_pStree;
T2:LSSTREE_pStree;
BVERBREC1:LSDOMAINT_BVERBrecord;
SUBVERBREC1:LSDOMAINT_SUBVERBrecord;
CNVARREC2:LSDOMAINT_CNVARrecord;
CNVARREC1:LSDOMAINT_CNVARrecord;
NPVARREC3:LSDOMAINT_NPVARrecord;
NPVARREC2:LSDOMAINT_NPVARrecord;
NPVARREC1:LSDOMAINT_NPVARrecord;
PREPPPROPVARREC1:LSDOMAINT_PREPPPROPVARrecord;
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
          (((T1^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     
)
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
          (((T1^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     
)
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
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := SUBVERB;
    N^.ls^.SUBVERBfield^ := SUBVERBREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := BVERB;
        N^.ls^.BVERBfield^ := BVERBREC1;
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
s:=BVERBREC1tree;
    relnode^.node:=s;
    END{HEAD};
                                                        BEGIN{createitem11}
  createHEAD(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(SUBVERB);
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
m2:=T1;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
match:=AIDDERIV_analyse(dtree,loopholes.retype(m,LISTREE_pstree));
X1:=RIDDERIV15delt1^.parameters.index;
X1:=RIDDERIV15delt2^.parameters.index;
hulplsstree:=loopholes.retype(
RIDDERIV15d3^.li^.stree,LSSTREE_pstree);
IF match THEN KEY2:=hulplsstree^.ls^.BVERBfield^.key;
                                                      hulplsstree:=loopholes.retype(
RIDDERIV15d4^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree1(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV15d5^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree2(hulplsstree,match);
                                                      X2:=RIDDERIV15delt6^.parameters.index;
VPID:=loopholes.retype(RIDDERIV15delt7^.parameters.ls,LSPARAMS_precord)^.X475vpid;
hulplsstree:=loopholes.retype(
RIDDERIV15d8^.li^.stree,LSSTREE_pstree);
IF match THEN KEY3:=hulplsstree^.ls^.PREPfield^.key;
                                                      hulplsstree:=loopholes.retype(
RIDDERIV15d9^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree3(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV15d10^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree4(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV15d11^.li^.stree,LSSTREE_pstree);
IF match THEN KEY4:=hulplsstree^.ls^.BNOUNfield^.key;
                                                      END;
                                                       FUNCTION subrule0X1 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
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
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>NPVAR THEN
        match:=FALSE;
      IF match THEN
        NPVARREC3:=s^.ls^.NPVARfield^;
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
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT1;
  BEGIN{T1}
  END{T1};
                                                      PROCEDURE ACTION28;
BEGIN
wbonus:=5;
                                                      idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.argkeys[3]:=KEY4;
idargs.nrargs:=3;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID30))   ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      
END;
                                                      PROCEDURE ACTION32;
BEGIN
wbonus:=5;
                                                      idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.argkeys[3]:=KEY4;
idargs.nrargs:=3;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID87))   ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      
END;
                                                      FUNCTION idargs1:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.argkeys[3]:=KEY4;
                                                      idargs.nrargs:=3;
idargs1:=
LIMATCHES_decompiniddict(idargs,ORD(VPID30))          END;
                                                      FUNCTION idargs2:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.argkeys[3]:=KEY4;
                                                      idargs.nrargs:=3;
idargs2:=
LIMATCHES_decompiniddict(idargs,ORD(VPID87))          END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
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
  IF ((idargs1                                               )
                                                      )
THEN IF
          ((NPVARREC3.INDEX =NPVARREC2.INDEX                      )
                                                      )
                                                       THEN
    BEGIN
    MAKET_SUBVERBrec(SUBVERBREC1);
    MAKET_BVERBrec(BVERBREC1);
    action28;
    hulpstree:=LDBLEX_read(KEY1);
    BVERBREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    BVERBREC1:=BVERBREC1tree^.ls^.BVERBfield^;
    action28;
    createT1;
    previous1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(m2,LISTREE_pstree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
    END;
  IF ((idargs2                                               )
                                                      )
THEN IF
          ((NPVARREC3.INDEX =NPVARREC2.INDEX                      )
                                                      )
                                                       THEN
    BEGIN
    MAKET_SUBVERBrec(SUBVERBREC1);
    MAKET_BVERBrec(BVERBREC1);
    action32;
    hulpstree:=LDBLEX_read(KEY1);
    BVERBREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    BVERBREC1:=BVERBREC1tree^.ls^.BVERBfield^;
    action32;
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
FUNCTION MATCHCONDT1:BOOLEAN;
BEGIN MATCHCONDT1:=TRUE END;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
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
                                                          PROCEDURE matchtreeT2(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>CNVAR THEN
        match:=FALSE;
      IF match THEN
        CNVARREC2:=s^.ls^.CNVARfield^;
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
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
  PROCEDURE createT1;
  BEGIN{T1}
  END{T1};
                                                      PROCEDURE ACTION45;
BEGIN
wbonus:=5;
                                                      idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.argkeys[3]:=KEY4;
idargs.nrargs:=3;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID30))   ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      
END;
                                                      PROCEDURE ACTION49;
BEGIN
wbonus:=5;
                                                      idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.argkeys[3]:=KEY4;
idargs.nrargs:=3;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID87))   ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      
END;
                                                      FUNCTION idargs1:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.argkeys[3]:=KEY4;
                                                      idargs.nrargs:=3;
idargs1:=
LIMATCHES_decompiniddict(idargs,ORD(VPID30))          END;
                                                      FUNCTION idargs2:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.argkeys[3]:=KEY4;
                                                      idargs.nrargs:=3;
idargs2:=
LIMATCHES_decompiniddict(idargs,ORD(VPID87))          END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
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
  IF ((idargs1                                               )
                                                      )
THEN IF
          ((CNVARREC2.INDEX =CNVARREC1.INDEX                      )
                                                      )
                                                       THEN
    BEGIN
    MAKET_SUBVERBrec(SUBVERBREC1);
    MAKET_BVERBrec(BVERBREC1);
    action45;
    hulpstree:=LDBLEX_read(KEY1);
    BVERBREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    BVERBREC1:=BVERBREC1tree^.ls^.BVERBfield^;
    action45;
    createT1;
    previous1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(m2,LISTREE_pstree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
    END;
  IF ((idargs2                                               )
                                                      )
THEN IF
          ((CNVARREC2.INDEX =CNVARREC1.INDEX                      )
                                                      )
                                                       THEN
    BEGIN
    MAKET_SUBVERBrec(SUBVERBREC1);
    MAKET_BVERBrec(BVERBREC1);
    action49;
    hulpstree:=LDBLEX_read(KEY1);
    BVERBREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    BVERBREC1:=BVERBREC1tree^.ls^.BVERBfield^;
    action49;
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
DECRIDDERIV15:=result
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
                                                       FUNCTION DECRIDALTLOCDIRSUBST(VAR VPID:LSDOMAINT_SYNPATTERNSETTYPE;
VAR LEVEL,subst:INTEGER;
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
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
T1:LSSTREE_pStree;
T2:LSSTREE_pStree;
T3:LSSTREE_pStree;
PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
    BEGIN
    wholelist.first:=NIL;wholelist.last:=NIL;
    END;
                                                      BEGIN{createM}
m1:=T1;
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
                                                      BEGIN{matchmodel}
T3:=s;
match:=first;
END;{matchmodel}
                                                       FUNCTION subrule0X1 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDT3:BOOLEAN;
BEGIN MATCHCONDT3:=TRUE END;
                                                      PROCEDURE MatchtreeT3(VAR match:BOOLEAN;first:Boolean);
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
match:=AIDDERIV_analyse(dtree,loopholes.retype(T3,LISTREE_pstree));
X1:=RIDALTLOCDIRSUBST_3_T3delt1^.parameters.index;
hulplsstree:=loopholes.retype(
RIDALTLOCDIRSUBST_3_T3d2^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree1(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDALTLOCDIRSUBST_3_T3d3^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree2(hulplsstree,match);
                                                      END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
                                                      PROCEDURE ACTION6;
BEGIN
VPID:=[VPID16]                                              ;
LEVEL:=X1
                                                      ;wbonus:=0;sbonus:=0

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
  IF ((TRUE                                                  )
                                                      )
                                                       THEN
    BEGIN
    action6;
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
FUNCTION MATCHCONDT3:BOOLEAN;
BEGIN MATCHCONDT3:=TRUE END;
                                                      PROCEDURE MatchtreeT3(VAR match:BOOLEAN;first:Boolean);
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
match:=AIDDERIV_analyse(dtree,loopholes.retype(T3,LISTREE_pstree));
X1:=RIDALTLOCDIRSUBST_10_T3delt1^.parameters.index;
hulplsstree:=loopholes.retype(
RIDALTLOCDIRSUBST_10_T3d2^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree1(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDALTLOCDIRSUBST_10_T3d3^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree2(hulplsstree,match);
                                                      END;
                                                        PROCEDURE previous1;
  BEGIN
  createM1;
  createM2;
  END;
                                                      PROCEDURE ACTION13;
BEGIN
VPID:=[VPID7]                                               ;
LEVEL:=X1
                                                      ;wbonus:=0;sbonus:=0

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
  IF ((TRUE                                                  )
                                                      )
                                                       THEN
    BEGIN
    action13;
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
 level:=LIMATCHES_newlevel;
 subst:=2;
  LISTREE_mergesetsoftuplestrees(subrule0X1,result);
  LISTREE_mergesetsoftuplestrees(subrule0X2,result);
 END;
DECRIDALTLOCDIRSUBST:=result
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
                                                       FUNCTION DECRIDDERIV14(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
VAR result:LISTREE_SetOfTupleOfStrees;
 wbonus,sbonus:INTEGER;
 m:LSSTREE_pstree;
 tuple:LISTREE_TupleOfStrees;
 first:BOOLEAN;
 match:BOOLEAN;
 idargs:LIIDDICT_idargs;
dtree:HYPERDTREE_phyperdtree;
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
 m3:LSSTREE_pstree;
 Is3:LISTREE_pstree;
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
          (((T2^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     
)
                                                      )
                                                      THEN 
matchcondM3:=TRUE;

END;{matchcondM3}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
          (((T1^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     
)
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
FUNCTION matchcondI3:BOOLEAN;
                                                      BEGIN
matchcondI3:=FALSE;
  IF
          (((T2^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     
)
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
          (((T1^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     
)
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
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := SUBVERB;
    N^.ls^.SUBVERBfield^ := SUBVERBREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := BVERB;
        N^.ls^.BVERBfield^ := BVERBREC1;
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
s:=BVERBREC1tree;
    relnode^.node:=s;
    END{HEAD};
                                                        BEGIN{createitem11}
  createHEAD(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(SUBVERB);
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
m2:=T1;
END{createM};
PROCEDURE createM3;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN{createM}
m3:=T2;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
match:=AIDDERIV_analyse(dtree,loopholes.retype(m,LISTREE_pstree));
X1:=RIDDERIV14delt1^.parameters.index;
hulplsstree:=loopholes.retype(
RIDDERIV14d2^.li^.stree,LSSTREE_pstree);
IF match THEN KEY2:=hulplsstree^.ls^.BVERBfield^.key;
                                                      hulplsstree:=loopholes.retype(
RIDDERIV14d3^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree1(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV14d4^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree2(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV14d5^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree3(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV14d6^.li^.stree,LSSTREE_pstree);
IF match THEN KEY3:=hulplsstree^.ls^.BNOUNfield^.key;
                                                      END;
                                                      PROCEDURE ACTION15;
BEGIN
wbonus:=5;
                                                      idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.nrargs:=2;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID22))   ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      
END;
                                                      FUNCTION idargs1:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
                                                      idargs.nrargs:=2;
idargs1:=
LIMATCHES_decompiniddict(idargs,ORD(VPID22))          END;
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
IF ((idargs1                                               )
                                                      )
                                                       THEN
  BEGIN
  MAKET_SUBVERBrec(SUBVERBREC1);
  MAKET_BVERBrec(BVERBREC1);
  action15;
  hulpstree:=LDBLEX_read(KEY1);
  BVERBREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
  BVERBREC1:=BVERBREC1tree^.ls^.BVERBfield^;
  action15;
  createM1;
  createM2;
  createM3;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  Is2:=loopholes.retype(m2,LISTREE_pstree);
  LISTREE_addtotuple(Is2,tuple);
  Is3:=loopholes.retype(m3,LISTREE_pstree);
  LISTREE_addtotuple(Is3,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
                                                        END;
                                                      DECRIDDERIV14:=result
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
                                                       FUNCTION DECRIDDERIV7(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
VAR result:LISTREE_SetOfTupleOfStrees;
 wbonus,sbonus:INTEGER;
 m:LSSTREE_pstree;
 tuple:LISTREE_TupleOfStrees;
 first:BOOLEAN;
 match:BOOLEAN;
 idargs:LIIDDICT_idargs;
dtree:HYPERDTREE_phyperdtree;
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
 m3:LSSTREE_pstree;
 Is3:LISTREE_pstree;
BVERBREC1tree:LSSTREE_pStree;
T1:LSSTREE_pStree;
T2:LSSTREE_pStree;
T3:LSSTREE_pStree;
BVERBREC1:LSDOMAINT_BVERBrecord;
SUBVERBREC1:LSDOMAINT_SUBVERBrecord;
CNVARREC2:LSDOMAINT_CNVARrecord;
CNVARREC1:LSDOMAINT_CNVARrecord;
NPVARREC3:LSDOMAINT_NPVARrecord;
NPVARREC2:LSDOMAINT_NPVARrecord;
NPVARREC1:LSDOMAINT_NPVARrecord;
PREPPPROPVARREC1:LSDOMAINT_PREPPPROPVARrecord;
FUNCTION matchcondM3:BOOLEAN;
                                                      BEGIN
matchcondM3:=FALSE;
  IF
          (((T2^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     
)
                                                      )
                                                      THEN 
matchcondM3:=TRUE;

END;{matchcondM3}
FUNCTION matchcondI3:BOOLEAN;
                                                      BEGIN
matchcondI3:=FALSE;
  IF
          (((T2^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     
)
                                                      )
                                                      THEN 
matchcondI3:=TRUE;

END;{matchcondI3}
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
          (((T1^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     
)
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
          (((T1^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     
)
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
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := SUBVERB;
    N^.ls^.SUBVERBfield^ := SUBVERBREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := BVERB;
        N^.ls^.BVERBfield^ := BVERBREC1;
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
s:=BVERBREC1tree;
    relnode^.node:=s;
    END{HEAD};
                                                        BEGIN{createitem11}
  createHEAD(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(SUBVERB);
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
m2:=T1;
END{createM};
PROCEDURE createM3;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN{createM}
m3:=T2;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
match:=AIDDERIV_analyse(dtree,loopholes.retype(m,LISTREE_pstree));
VPID:=loopholes.retype(RIDDERIV7delt1^.parameters.ls,LSPARAMS_precord)^.X477vpid;
X1:=RIDDERIV7delt1^.parameters.index;
hulplsstree:=loopholes.retype(
RIDDERIV7d2^.li^.stree,LSSTREE_pstree);
IF match THEN KEY2:=hulplsstree^.ls^.BVERBfield^.key;
                                                      hulplsstree:=loopholes.retype(
RIDDERIV7d3^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree1(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV7d4^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree2(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV7d5^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree3(hulplsstree,match);
                                                      X2:=RIDDERIV7delt6^.parameters.index;
hulplsstree:=loopholes.retype(
RIDDERIV7d7^.li^.stree,LSSTREE_pstree);
IF match THEN KEY4:=hulplsstree^.ls^.PREPfield^.key;
                                                      hulplsstree:=loopholes.retype(
RIDDERIV7d8^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree4(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV7d9^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree5(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV7d10^.li^.stree,LSSTREE_pstree);
IF match THEN KEY3:=hulplsstree^.ls^.BNOUNfield^.key;
                                                      END;
                                                       FUNCTION subrule0X1 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
FUNCTION MATCHCONDT3:BOOLEAN;
BEGIN MATCHCONDT3:=TRUE END;
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
                                                          PROCEDURE matchtreeT3(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>NPVAR THEN
        match:=FALSE;
      IF match THEN
        NPVARREC3:=s^.ls^.NPVARfield^;
    END{MatchNode};
                                                          BEGIN
    s:= T3;
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
  createM3;
  END;
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
                                                      PROCEDURE ACTION27;
BEGIN
wbonus:=5;
                                                      idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY4;
idargs.argkeys[3]:=KEY3;
idargs.nrargs:=3;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID16))   ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      
END;
                                                      PROCEDURE ACTION31;
BEGIN
wbonus:=5;
                                                      idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY4;
idargs.argkeys[3]:=KEY3;
idargs.nrargs:=3;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID7))    ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      
END;
                                                      FUNCTION idargs1:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY4;
idargs.argkeys[3]:=KEY3;
                                                      idargs.nrargs:=3;
idargs1:=
LIMATCHES_decompiniddict(idargs,ORD(VPID16))          END;
                                                      FUNCTION idargs2:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY4;
idargs.argkeys[3]:=KEY3;
                                                      idargs.nrargs:=3;
idargs2:=
LIMATCHES_decompiniddict(idargs,ORD(VPID7))           END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT3(match,TRUE);
If match Then
WHILE match AND NOT matchcondT3 DO
BEGIN
MatchtreeT3(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((idargs1                                               )
                                                      )
THEN IF
          ((NPVARREC3.INDEX =NPVARREC2.INDEX                      )
                                                      )
                                                       THEN
    BEGIN
    MAKET_SUBVERBrec(SUBVERBREC1);
    MAKET_BVERBrec(BVERBREC1);
    action27;
    hulpstree:=LDBLEX_read(KEY1);
    BVERBREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    BVERBREC1:=BVERBREC1tree^.ls^.BVERBfield^;
    action27;
    createT2;
    previous1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(m2,LISTREE_pstree);
    LISTREE_addtotuple(Is2,tuple);
    Is3:=loopholes.retype(m3,LISTREE_pstree);
    LISTREE_addtotuple(Is3,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
    END;
  IF ((idargs2                                               )
                                                      )
THEN IF
          ((NPVARREC3.INDEX =NPVARREC2.INDEX                      )
                                                      )
                                                       THEN
    BEGIN
    MAKET_SUBVERBrec(SUBVERBREC1);
    MAKET_BVERBrec(BVERBREC1);
    action31;
    hulpstree:=LDBLEX_read(KEY1);
    BVERBREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    BVERBREC1:=BVERBREC1tree^.ls^.BVERBfield^;
    action31;
    createT2;
    previous1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(m2,LISTREE_pstree);
    LISTREE_addtotuple(Is2,tuple);
    Is3:=loopholes.retype(m3,LISTREE_pstree);
    LISTREE_addtotuple(Is3,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
    END;
                                                          END;
                                                       subrule0X1:=result
 END;
 FUNCTION subrule0X2 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
FUNCTION MATCHCONDT3:BOOLEAN;
BEGIN MATCHCONDT3:=TRUE END;
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
                                                          PROCEDURE matchtreeT3(VAR match:BOOLEAN;first:BOOLEAN);
    VAR s:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
    PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
    BEGIN{MatchNode}
      IF s^.ls^.cat<>CNVAR THEN
        match:=FALSE;
      IF match THEN
        CNVARREC2:=s^.ls^.CNVARfield^;
    END{MatchNode};
                                                          BEGIN
    s:= T3;
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
  createM3;
  END;
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
                                                      PROCEDURE ACTION44;
BEGIN
wbonus:=5;
                                                      idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY4;
idargs.argkeys[3]:=KEY3;
idargs.nrargs:=3;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID7))    ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      
END;
                                                      FUNCTION idargs1:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY4;
idargs.argkeys[3]:=KEY3;
                                                      idargs.nrargs:=3;
idargs1:=
LIMATCHES_decompiniddict(idargs,ORD(VPID7))           END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT3(match,TRUE);
If match Then
WHILE match AND NOT matchcondT3 DO
BEGIN
MatchtreeT3(match,FALSE);
END;
  IF match THEN
    BEGIN
  IF ((idargs1                                               )
                                                      )
THEN IF
          ((CNVARREC2.INDEX =CNVARREC1.INDEX                      )
                                                      )
                                                       THEN
    BEGIN
    MAKET_SUBVERBrec(SUBVERBREC1);
    MAKET_BVERBrec(BVERBREC1);
    action44;
    hulpstree:=LDBLEX_read(KEY1);
    BVERBREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    BVERBREC1:=BVERBREC1tree^.ls^.BVERBfield^;
    action44;
    createT2;
    previous1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(m2,LISTREE_pstree);
    LISTREE_addtotuple(Is2,tuple);
    Is3:=loopholes.retype(m3,LISTREE_pstree);
    LISTREE_addtotuple(Is3,tuple);
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
DECRIDDERIV7:=result
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
                                                       FUNCTION DECRIDDERIV12(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
VAR result:LISTREE_SetOfTupleOfStrees;
 wbonus,sbonus:INTEGER;
 m:LSSTREE_pstree;
 tuple:LISTREE_TupleOfStrees;
 first:BOOLEAN;
 match:BOOLEAN;
 idargs:LIIDDICT_idargs;
dtree:HYPERDTREE_phyperdtree;
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
 m3:LSSTREE_pstree;
 Is3:LISTREE_pstree;
BVERBREC1tree:LSSTREE_pStree;
T1:LSSTREE_pStree;
T2:LSSTREE_pStree;
BVERBREC1:LSDOMAINT_BVERBrecord;
SUBVERBREC1:LSDOMAINT_SUBVERBrecord;
NPVARREC1:LSDOMAINT_NPVARrecord;
PREPPPROPVARREC1:LSDOMAINT_PREPPPROPVARrecord;
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
          (((T1^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     
)
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
          (((T1^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     
)
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
                                                      PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := SUBVERB;
    N^.ls^.SUBVERBfield^ := SUBVERBREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
    PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
    VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
     list1:LSMRUQUO_ListOfStrees;
      PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
      BEGIN{CreateNode}
        N^.ls^.cat := BVERB;
        N^.ls^.BVERBfield^ := BVERBREC1;
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
s:=BVERBREC1tree;
    relnode^.node:=s;
    END{HEAD};
                                                        BEGIN{createitem11}
  createHEAD(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(SUBVERB);
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
m2:=T1;
END{createM};
PROCEDURE createM3;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN{createM}
m3:=T2;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
match:=AIDDERIV_analyse(dtree,loopholes.retype(m,LISTREE_pstree));
X1:=RIDDERIV12delt1^.parameters.index;
hulplsstree:=loopholes.retype(
RIDDERIV12d2^.li^.stree,LSSTREE_pstree);
IF match THEN KEY2:=hulplsstree^.ls^.BVERBfield^.key;
                                                      hulplsstree:=loopholes.retype(
RIDDERIV12d3^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree1(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV12d4^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree2(hulplsstree,match);
                                                      X2:=RIDDERIV12delt5^.parameters.index;
hulplsstree:=loopholes.retype(
RIDDERIV12d6^.li^.stree,LSSTREE_pstree);
IF match THEN KEY3:=hulplsstree^.ls^.PREPfield^.key;
                                                      hulplsstree:=loopholes.retype(
RIDDERIV12d7^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree3(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV12d8^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree4(hulplsstree,match);
                                                      VPID:=loopholes.retype(RIDDERIV12delt9
^.parameters.ls,LSPARAMS_precord)^.X438vpid;
VPID:=loopholes.retype(RIDDERIV12delt10^.parameters.ls,LSPARAMS_precord)^.X437vpid;
hulplsstree:=loopholes.retype(
RIDDERIV12d11^.li^.stree,LSSTREE_pstree);
IF match THEN KEY4:=hulplsstree^.ls^.BNOUNfield^.key;
                                                      END;
                                                      PROCEDURE ACTION22;
BEGIN
wbonus:=5;
                                                      idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.argkeys[3]:=KEY4;
idargs.nrargs:=3;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID14))   ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      
END;
                                                      PROCEDURE ACTION26;
BEGIN
wbonus:=5;
                                                      idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.argkeys[3]:=KEY4;
idargs.nrargs:=3;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID15))   ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      
END;
                                                      FUNCTION idargs1:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.argkeys[3]:=KEY4;
                                                      idargs.nrargs:=3;
idargs1:=
LIMATCHES_decompiniddict(idargs,ORD(VPID14))          END;
                                                      FUNCTION idargs2:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.argkeys[3]:=KEY4;
                                                      idargs.nrargs:=3;
idargs2:=
LIMATCHES_decompiniddict(idargs,ORD(VPID15))          END;
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
IF ((idargs1                                               )
                                                      )
                                                       THEN
  BEGIN
  MAKET_SUBVERBrec(SUBVERBREC1);
  MAKET_BVERBrec(BVERBREC1);
  action22;
  hulpstree:=LDBLEX_read(KEY1);
  BVERBREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
  BVERBREC1:=BVERBREC1tree^.ls^.BVERBfield^;
  action22;
  createM1;
  createM2;
  createM3;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  Is2:=loopholes.retype(m2,LISTREE_pstree);
  LISTREE_addtotuple(Is2,tuple);
  Is3:=loopholes.retype(m3,LISTREE_pstree);
  LISTREE_addtotuple(Is3,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
IF ((idargs2                                               )
                                                      )
                                                       THEN
  BEGIN
  MAKET_SUBVERBrec(SUBVERBREC1);
  MAKET_BVERBrec(BVERBREC1);
  action26;
  hulpstree:=LDBLEX_read(KEY1);
  BVERBREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
  BVERBREC1:=BVERBREC1tree^.ls^.BVERBfield^;
  action26;
  createM1;
  createM2;
  createM3;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  Is2:=loopholes.retype(m2,LISTREE_pstree);
  LISTREE_addtotuple(Is2,tuple);
  Is3:=loopholes.retype(m3,LISTREE_pstree);
  LISTREE_addtotuple(Is3,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
                                                        END;
                                                      DECRIDDERIV12:=result
END;
{:RIDDERIV12}
