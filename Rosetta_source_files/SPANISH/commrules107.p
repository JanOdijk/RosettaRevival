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
pragma C_include('commrules107.pf');
END;
PROGRAM comMrules107;
WITH globsubst,listree,limatches,lsmatches,
lidomaint,liiddict,lsdomaint,maket,lsstree,
copyt,mem,lsparams,ldmrules,
gidderiv,hyperdtree,strtokey,lsmruquo,
lsauxdom,ldblex;
TYPE synrelset=SET OF LSDOMAINT_synrel;
VAR hulpstree:LISTREE_pstree;
 VPID:LSDOMAINT_synpatternsettype;
hulplsstree:LSSTREE_pstree;
dtreeRIDCN2:HYPERDTREE_pHYPERDTREE;
dtreeRIDCN1:HYPERDTREE_pHYPERDTREE;
dtreeRIDDERIV1:HYPERDTREE_pHYPERDTREE;
dtreeRIDDERIV6:HYPERDTREE_pHYPERDTREE;
dtreeRIDDERIV9:HYPERDTREE_pHYPERDTREE;
X1,X2,X3,X4,X5:INTEGER;
RIDCN2d1,RIDCN2d2,
RIDCN2d3,
RIDCN2d4,RIDCN2d5,
RIDCN2d6,
RIDCN2d7,RIDCN2d8,
RIDCN2d9,RIDCN2d10,RIDCN2d11,
RIDCN2d12,
RIDCN2d13,RIDCN2d14,
RIDCN2d15:HYPERDTREE_pHyperDtree;
RIDCN2delt1,RIDCN2delt2,
RIDCN2delt3,RIDCN2delt4,
RIDCN2delt5,RIDCN2delt6,
RIDCN2delt7,RIDCN2delt8,
RIDCN2delt9,RIDCN2delt10,
RIDCN2delt11,RIDCN2delt12,
RIDCN2delt13,RIDCN2delt14,
RIDCN2delt15,RIDCN2delt16,
RIDCN2delt17:HYPERDTREE_pHyperNodeElt;
RIDCN1d1,RIDCN1d2,
RIDCN1d3,
RIDCN1d4,RIDCN1d5,
RIDCN1d6,
RIDCN1d7,RIDCN1d8,
RIDCN1d9,RIDCN1d10,RIDCN1d11,
RIDCN1d12,
RIDCN1d13,RIDCN1d14,
RIDCN1d15:HYPERDTREE_pHyperDtree;
RIDCN1delt1,RIDCN1delt2,
RIDCN1delt3,RIDCN1delt4,
RIDCN1delt5,RIDCN1delt6,
RIDCN1delt7,RIDCN1delt8,
RIDCN1delt9,RIDCN1delt10,
RIDCN1delt11,RIDCN1delt12,
RIDCN1delt13,RIDCN1delt14,
RIDCN1delt15,RIDCN1delt16,
RIDCN1delt17:HYPERDTREE_pHyperNodeElt;
RIDDERIV1d1,RIDDERIV1d2,
RIDDERIV1d3,
RIDDERIV1d4,RIDDERIV1d5,
RIDDERIV1d6,
RIDDERIV1d7,RIDDERIV1d8,
RIDDERIV1d9,RIDDERIV1d10,RIDDERIV1d11,
RIDDERIV1d12,
RIDDERIV1d13,RIDDERIV1d14,
RIDDERIV1d15:HYPERDTREE_pHyperDtree;
RIDDERIV1delt1,RIDDERIV1delt2,
RIDDERIV1delt3,RIDDERIV1delt4,
RIDDERIV1delt5,RIDDERIV1delt6,
RIDDERIV1delt7,RIDDERIV1delt8,
RIDDERIV1delt9,RIDDERIV1delt10,
RIDDERIV1delt11,RIDDERIV1delt12,
RIDDERIV1delt13,RIDDERIV1delt14,
RIDDERIV1delt15,RIDDERIV1delt16,
RIDDERIV1delt17:HYPERDTREE_pHyperNodeElt;
RIDDERIV6d1,RIDDERIV6d2,
RIDDERIV6d3,
RIDDERIV6d4,RIDDERIV6d5,
RIDDERIV6d6,
RIDDERIV6d7,RIDDERIV6d8,
RIDDERIV6d9,RIDDERIV6d10,RIDDERIV6d11,
RIDDERIV6d12,
RIDDERIV6d13,RIDDERIV6d14,
RIDDERIV6d15:HYPERDTREE_pHyperDtree;
RIDDERIV6delt1,RIDDERIV6delt2,
RIDDERIV6delt3,RIDDERIV6delt4,
RIDDERIV6delt5,RIDDERIV6delt6,
RIDDERIV6delt7,RIDDERIV6delt8,
RIDDERIV6delt9,RIDDERIV6delt10,
RIDDERIV6delt11,RIDDERIV6delt12,
RIDDERIV6delt13,RIDDERIV6delt14,
RIDDERIV6delt15,RIDDERIV6delt16,
RIDDERIV6delt17:HYPERDTREE_pHyperNodeElt;
RIDDERIV9d1,RIDDERIV9d2,
RIDDERIV9d3,
RIDDERIV9d4,RIDDERIV9d5,
RIDDERIV9d6,
RIDDERIV9d7,RIDDERIV9d8,
RIDDERIV9d9,RIDDERIV9d10,RIDDERIV9d11,
RIDDERIV9d12,
RIDDERIV9d13,RIDDERIV9d14,
RIDDERIV9d15:HYPERDTREE_pHyperDtree;
RIDDERIV9delt1,RIDDERIV9delt2,
RIDDERIV9delt3,RIDDERIV9delt4,
RIDDERIV9delt5,RIDDERIV9delt6,
RIDDERIV9delt7,RIDDERIV9delt8,
RIDDERIV9delt9,RIDDERIV9delt10,
RIDDERIV9delt11,RIDDERIV9delt12,
RIDDERIV9delt13,RIDDERIV9delt14,
RIDDERIV9delt15,RIDDERIV9delt16,
RIDDERIV9delt17:HYPERDTREE_pHyperNodeElt;
FUNCTION crdtreeRIDCN2:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDCN1:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDDERIV1:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDDERIV6:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDDERIV9:HYPERDTREE_phyperdtree;FORWARD;
 PROCEDURE commrules107_init;
BEGIN
dtreeRIDCN2:=crdtreeRIDCN2;
dtreeRIDCN1:=crdtreeRIDCN1;
dtreeRIDDERIV1:=crdtreeRIDDERIV1;
dtreeRIDDERIV6:=crdtreeRIDDERIV6;
dtreeRIDDERIV9:=crdtreeRIDDERIV9;
END;
{rule:}
{:RIDCN2}
function crdtreeRIDCN2;
function crdtree_12:HYPERDTREE_pHyperdtree;
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
RIDCN2d2:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree1:=d;
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
dson:=crdtree1;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_0:=d;
END;
                                                      function crdtree_11:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
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
RIDCN2d4:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY3:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=341;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtreeKEY3;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_1:=d;
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
RIDCN2d5:=d;
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
RIDCN2d6:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree3:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=344;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_1;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree2;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree3;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=3;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_2:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=-205;
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
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=348;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_3;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_4:=d;
END;
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
RIDCN2d7:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY4:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=300;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtreeKEY4;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_5:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=301;
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
number:=307;
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
number:=387;
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
number:=353;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.index:=-2-1;
params.index:=-2-1;
params.subst:=2;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDCN2delt3:=hypernodeelt;
dson:=crdtree_4;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree_8;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=2;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_9:=d;
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
number:=351;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_10;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_11:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=320;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.index:=-1-1;
params.index:=-1-1;
params.subst:=1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDCN2delt1:=hypernodeelt;
dson:=crdtree_0;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree_11;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=2;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_12:=d;
END;
                                                      BEGIN
crdtreeRIDCN2:=crdtree_12
END;
                                                       FUNCTION COMRIDCN2(Is1:LISTREE_pStree
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
LinitM1_1_1_1_1,LrestM1_1_1_1_1,LfirstM1_1_1_1_1,LlastM1_1_1_1_1:LSSTREE_prelnode;
iM1_1_1_1_1:INTEGER;
nomoretreesM1_1_1_1_1,lastmatchM1_1_1_1_1:BOOLEAN;
 m1:LSSTREE_pstree;
BNOUNREC1tree:LSSTREE_pStree;
BNOUNREC1:LSDOMAINT_BNOUNrecord;
SUBNOUNREC1:LSDOMAINT_SUBNOUNrecord;
NOUNREC1:LSDOMAINT_NOUNrecord;
CNVARREC1:LSDOMAINT_CNVARrecord;
NPVARREC1:LSDOMAINT_NPVARrecord;
PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>NOUN THEN
      match:=FALSE;
    IF match THEN
      NOUNREC1:=s^.ls^.NOUNfield^;
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
        IF s^.ls^.cat<>SUBNOUN THEN
          match:=FALSE;
        IF match THEN
          SUBNOUNREC1:=s^.ls^.SUBNOUNfield^;
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
            IF s^.ls^.cat<>BNOUN THEN
              match:=FALSE;
            IF match THEN
              BNOUNREC1:=s^.ls^.BNOUNfield^;
            IF match THEN KEY1:=s^.ls^.BNOUNfield^.key;
          END{MatchNode};
                                                      BEGIN{MatchTree}
                        BNOUNREC1tree:=Lfirst^.node;
              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchM1_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM1_1_1,LfirstM1_1_1,LrestM1_1_1,nomoretreesM1_1_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist1items,lastmatchM1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM1_1,LfirstM1_1,LrestM1_1,nomoretreesM1_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1) AND (s^.li^.n <=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist1items,lastmatch) END;
                                                      PROCEDURE createM;
PROCEDURE matchtree1(s:LSSTREE_pstree;VAR match:BOOLEAN);
          PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
          BEGIN{MatchNode}
            IF s^.ls^.cat<>NOUN THEN
              match:=FALSE;
            IF match THEN
              NOUNREC1:=s^.ls^.NOUNfield^;
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
                IF s^.ls^.cat<>SUBNOUN THEN
                  match:=FALSE;
                IF match THEN
                  SUBNOUNREC1:=s^.ls^.SUBNOUNfield^;
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
                    IF s^.ls^.cat<>BNOUN THEN
                      match:=FALSE;
                    IF match THEN
                      BNOUNREC1:=s^.ls^.BNOUNfield^;
                    IF match THEN KEY2:=s^.ls^.BNOUNfield^.key;
                  END{MatchNode};
                                                      BEGIN{MatchTree}
                                        BNOUNREC1tree:=Lfirst^.node;
                      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchM1_1_1_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM1_1_1_1_1,LfirstM1_1_1_1_1,LrestM1_1_1_1_1,nomoretreesM1_1_1_1_1) END;
                                                      BEGIN{MatchTree}
                                  IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)
ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist1items,lastmatchM1_1_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM1_1_1_1,LfirstM1_1_1_1,LrestM1_1_1_1,nomoretreesM1_1_1_1) END;
                                                      BEGIN
matchnode(s,match);
IF match THEN matchlist1items(s^.sons,TRUE,match);
END;
PROCEDURE createtree1(VAR s:LSSTREE_pstree);
VAR list:LSMRUQUO_listofstrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := NOUN;
            N^.ls^.NOUNfield^ := NOUNREC1;
          END{CreateNode};
                                                                PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          VAR list:LSMRUQUO_ListOfStrees;
          PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
            VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
             list1:LSMRUQUO_ListOfStrees;
              PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
              BEGIN{CreateNode}
                N^.ls^.cat := SUBNOUN;
                N^.ls^.SUBNOUNfield^ := SUBNOUNREC1;
              END{CreateNode};
                                                                    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
              VAR list:LSMRUQUO_ListOfStrees;
              PROCEDURE createitem31(VAR list:LSMRUQUO_ListOfStrees);
                PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
                VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
                 list1:LSMRUQUO_ListOfStrees;
                  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
                  BEGIN{CreateNode}
                    N^.ls^.cat := BNOUN;
                    N^.ls^.BNOUNfield^ := BNOUNREC1;
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
s:=BNOUNREC1tree;
                relnode^.node:=s;
                END{HEAD};
                                                                    BEGIN{createitem31}
              createHEAD(list);
              END;
              BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem31);
              END{createlist1};
                                                                  BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,SUBNOUN,createnode,createlist1);
            END{HEAD};
                                                                BEGIN{createitem21}
          createHEAD(list);
          END;
          BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem21);
          END{createlist1};
                                                      BEGIN
s:=MAKET_stree(NOUN);
createnode(s);
createlist1(list);s^.sons:=list.first;
IF list.first<>NIL THEN list.last^.brother:=NIL;
END;
                                                      PROCEDURE matchtree2(s:LSSTREE_pstree;VAR match:BOOLEAN);
                  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
                  BEGIN{MatchNode}
                    IF s^.ls^.cat<>CNVAR THEN
                      match:=FALSE;
                    IF match THEN
                      CNVARREC1:=s^.ls^.CNVARfield^;
                    IF match THEN match:=(s^.ls^.CNVARfield^.index=X1);
                  END{MatchNode};
                                                      BEGIN
matchnode(s,match);
match:=match AND (s^.sons=NIL);
END;
PROCEDURE createtree2(VAR s:LSSTREE_pstree);
VAR list:LSMRUQUO_listofstrees;
                  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
                  BEGIN{CreateNode}
                    N^.ls^.cat := CNVAR;
                    N^.ls^.CNVARfield^ := CNVARREC1;
                  N^.ls^.CNVARfield^.index:=-1-1;
END{CreateNode};
                                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
                  BEGIN
                  wholelist.first:=NIL;wholelist.last:=NIL;
                  END;
                                                      BEGIN
s:=MAKET_stree(CNVAR);
createnode(s);
createlist1(list);s^.sons:=list.first;
IF list.first<>NIL THEN list.last^.brother:=NIL;
END;
                                                      PROCEDURE matchtree3(s:LSSTREE_pstree;VAR match:BOOLEAN);
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
PROCEDURE createtree3(VAR s:LSSTREE_pstree);
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
dtree:=dtreeRIDCN2;
createtree1(hulplsstree);
RIDCN2d2^.li^.stree:=loopholes.retype(hulplsstree,hyperdtree_pstree);
                                                      hulpstree:=LDBLEX_read(KEY3);
RIDCN2d4^.li^.stree:=loopholes.retype(hulpstree,HYPERDTREE_pstree);
                                                      createtree2(hulplsstree);
RIDCN2d5^.li^.stree:=loopholes.retype(hulplsstree,hyperdtree_pstree);
                                                      createtree3(hulplsstree);
RIDCN2d6^.li^.stree:=loopholes.retype(hulplsstree,hyperdtree_pstree);
                                                      hulpstree:=LDBLEX_read(KEY4);
RIDCN2d7^.li^.stree:=loopholes.retype(hulpstree,HYPERDTREE_pstree);
                                                      m:=NIL;
result:=GIDDERIV_generate(dtree);
END;
                                                      PROCEDURE ACTION14;
BEGIN
idargs:=LIMATCHES_COMPGETIDDICT(KEY1,ORD(VPID39));VPID:=[VPID39];KEY2:=idargs.argkeys[1];
KEY3:=idargs.argkeys[2];
KEY4:=idargs.argkeys[3];
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
  IF ((LIMATCHES_COMPINIDDICT(KEY1,ORD(VPID39))              )
                                                      )
                                                       THEN
    BEGIN
    MAKET_CNVARrec(CNVARREC1);
    MAKET_NPVARrec(NPVARREC1);
    action14;
    hulpstree:=LDBLEX_read(KEY2);
    BNOUNREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    BNOUNREC1:=BNOUNREC1tree^.ls^.BNOUNfield^;
    action14;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                      COMRIDCN2:=result
END;
{:RIDCN2}
{rule:}
{:RIDNPFORMATION2}
 FUNCTION COMRIDNPFORMATION2(Is1:LISTREE_pStree
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
MU1:LSMRUQUO_ListOfStrees;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
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
                                                          BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,CN,createnode,createlist1);
    END{HEAD};
                                                        BEGIN{createitem11}
  createHEAD(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
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
NPREC1.NUMERO:=SINGULAR;
NPREC1.NOUNPATTERNEFS:=CNREC1.NOUNPATTERNEFS;
NPREC1.THETANP:=CNREC1.THETANP;
NPREC1.ACTCOMAS:=CNREC1.POSSCOMAS;
NPREC1.HUMAN:=CNREC1.HUMAN;
NPREC1.ANIMATE:=CNREC1.ANIMATE;
NPREC1.TEMPORAL:=CNREC1.TEMPORAL;
NPREC1.ACTSUBCS:=CNREC1.ACTSUBCS;
NPREC1.GENERO:=OMEGAGENERO;
NPREC1.SPECQ:=YESSPEC;
NPREC1.SYNTQUANT:=OMEGAQUANT;
NPREC1.GENERIC:=NOGENERIC;
NPREC1.SUPERTIEMPO:=OMEGATIEMPO;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION1;
BEGIN
NPREC1.NUMERO:=PLURAL;
NPREC1.NOUNPATTERNEFS:=CNREC1.NOUNPATTERNEFS;
NPREC1.THETANP:=CNREC1.THETANP;
NPREC1.ACTCOMAS:=CNREC1.POSSCOMAS;
NPREC1.HUMAN:=CNREC1.HUMAN;
NPREC1.ANIMATE:=CNREC1.ANIMATE;
NPREC1.TEMPORAL:=CNREC1.TEMPORAL;
NPREC1.ACTSUBCS:=CNREC1.ACTSUBCS;
NPREC1.GENERO:=OMEGAGENERO;
NPREC1.SPECQ:=YESSPEC;
NPREC1.SYNTQUANT:=OMEGAQUANT;
NPREC1.GENERIC:=NOGENERIC;
NPREC1.SUPERTIEMPO:=OMEGATIEMPO;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION7;
BEGIN
NPREC1.DEFINITE:=INDEF
                                                      ;
NPREC1.POSSPRED:=TRUE
                                                      ;
NPREC1.POSSNIETNP:=TRUE
                                                      ;
                                                      
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
    IF ((CNREC1.NUMERO =SINGULAR                               )
                                                      )
                                                       THEN
      BEGIN
      MAKET_NPrec(NPREC1);
      action0;
      action7;
      createM;
      Is:=loopholes.retype(m,LISTREE_pstree);
      LISTREE_appendstreebonus(Is,result,wbonus);
      END;
    IF ((CNREC1.NUMERO =PLURAL                                 )
                                                      )
                                                       THEN
      BEGIN
      MAKET_NPrec(NPREC1);
      action1;
      action7;
      createM;
      Is:=loopholes.retype(m,LISTREE_pstree);
      LISTREE_appendstreebonus(Is,result,wbonus);
      END;
                                                          END;
                                                        END;
                                                      COMRIDNPFORMATION2:=result
END;
{:RIDNPFORMATION2}
{rule:}
{:RIDCN1}
function crdtreeRIDCN1;
function crdtree_5:HYPERDTREE_pHyperdtree;
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
RIDCN1d1:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree1:=d;
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
dson:=crdtree1;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_0:=d;
END;
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
RIDCN1d2:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY3:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=300;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtreeKEY3;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_1:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=301;
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
number:=307;
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
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=266;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_3;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_4:=d;
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
dson:=crdtree_0;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree_4;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=2;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_5:=d;
END;
                                                      BEGIN
crdtreeRIDCN1:=crdtree_5
END;
                                                       FUNCTION COMRIDCN1(Is1:LISTREE_pStree
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
LinitM1_1_1_1_1,LrestM1_1_1_1_1,LfirstM1_1_1_1_1,LlastM1_1_1_1_1:LSSTREE_prelnode;
iM1_1_1_1_1:INTEGER;
nomoretreesM1_1_1_1_1,lastmatchM1_1_1_1_1:BOOLEAN;
 m1:LSSTREE_pstree;
BNOUNREC1tree:LSSTREE_pStree;
BNOUNREC1:LSDOMAINT_BNOUNrecord;
SUBNOUNREC1:LSDOMAINT_SUBNOUNrecord;
NOUNREC1:LSDOMAINT_NOUNrecord;
PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>NOUN THEN
      match:=FALSE;
    IF match THEN
      NOUNREC1:=s^.ls^.NOUNfield^;
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
        IF s^.ls^.cat<>SUBNOUN THEN
          match:=FALSE;
        IF match THEN
          SUBNOUNREC1:=s^.ls^.SUBNOUNfield^;
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
            IF s^.ls^.cat<>BNOUN THEN
              match:=FALSE;
            IF match THEN
              BNOUNREC1:=s^.ls^.BNOUNfield^;
            IF match THEN KEY1:=s^.ls^.BNOUNfield^.key;
          END{MatchNode};
                                                      BEGIN{MatchTree}
                        BNOUNREC1tree:=Lfirst^.node;
              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchM1_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM1_1_1,LfirstM1_1_1,LrestM1_1_1,nomoretreesM1_1_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist1items,lastmatchM1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM1_1,LfirstM1_1,LrestM1_1,nomoretreesM1_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}IF first THEN match:= (s^.li^.n >=1) AND (s^.li^.n <=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist1items,lastmatch) END;
                                                      PROCEDURE createM;
PROCEDURE matchtree1(s:LSSTREE_pstree;VAR match:BOOLEAN);
          PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
          BEGIN{MatchNode}
            IF s^.ls^.cat<>NOUN THEN
              match:=FALSE;
            IF match THEN
              NOUNREC1:=s^.ls^.NOUNfield^;
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
                IF s^.ls^.cat<>SUBNOUN THEN
                  match:=FALSE;
                IF match THEN
                  SUBNOUNREC1:=s^.ls^.SUBNOUNfield^;
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
                    IF s^.ls^.cat<>BNOUN THEN
                      match:=FALSE;
                    IF match THEN
                      BNOUNREC1:=s^.ls^.BNOUNfield^;
                    IF match THEN KEY2:=s^.ls^.BNOUNfield^.key;
                  END{MatchNode};
                                                      BEGIN{MatchTree}
                                        BNOUNREC1tree:=Lfirst^.node;
                      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchM1_1_1_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM1_1_1_1_1,LfirstM1_1_1_1_1,LrestM1_1_1_1_1,nomoretreesM1_1_1_1_1) END;
                                                      BEGIN{MatchTree}
                                  IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)
ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist1items,lastmatchM1_1_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM1_1_1_1,LfirstM1_1_1_1,LrestM1_1_1_1,nomoretreesM1_1_1_1) END;
                                                      BEGIN
matchnode(s,match);
IF match THEN matchlist1items(s^.sons,TRUE,match);
END;
PROCEDURE createtree1(VAR s:LSSTREE_pstree);
VAR list:LSMRUQUO_listofstrees;
          PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
          BEGIN{CreateNode}
            N^.ls^.cat := NOUN;
            N^.ls^.NOUNfield^ := NOUNREC1;
          END{CreateNode};
                                                                PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
          VAR list:LSMRUQUO_ListOfStrees;
          PROCEDURE createitem21(VAR list:LSMRUQUO_ListOfStrees);
            PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
            VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
             list1:LSMRUQUO_ListOfStrees;
              PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
              BEGIN{CreateNode}
                N^.ls^.cat := SUBNOUN;
                N^.ls^.SUBNOUNfield^ := SUBNOUNREC1;
              END{CreateNode};
                                                                    PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
              VAR list:LSMRUQUO_ListOfStrees;
              PROCEDURE createitem31(VAR list:LSMRUQUO_ListOfStrees);
                PROCEDURE createHEAD(VAR list:LSMRUQUO_ListOfStrees);
                VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;
                 list1:LSMRUQUO_ListOfStrees;
                  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
                  BEGIN{CreateNode}
                    N^.ls^.cat := BNOUN;
                    N^.ls^.BNOUNfield^ := BNOUNREC1;
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
s:=BNOUNREC1tree;
                relnode^.node:=s;
                END{HEAD};
                                                                    BEGIN{createitem31}
              createHEAD(list);
              END;
              BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem31);
              END{createlist1};
                                                                  BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,SUBNOUN,createnode,createlist1);
            END{HEAD};
                                                                BEGIN{createitem21}
          createHEAD(list);
          END;
          BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem21);
          END{createlist1};
                                                      BEGIN
s:=MAKET_stree(NOUN);
createnode(s);
createlist1(list);s^.sons:=list.first;
IF list.first<>NIL THEN list.last^.brother:=NIL;
END;
                                                      BEGIN
dtree:=dtreeRIDCN1;
createtree1(hulplsstree);
RIDCN1d1^.li^.stree:=loopholes.retype(hulplsstree,hyperdtree_pstree);
                                                      hulpstree:=LDBLEX_read(KEY3);
RIDCN1d2^.li^.stree:=loopholes.retype(hulpstree,HYPERDTREE_pstree);
                                                      m:=NIL;
result:=GIDDERIV_generate(dtree);
END;
                                                      PROCEDURE ACTION7;
BEGIN
idargs:=LIMATCHES_COMPGETIDDICT(KEY1,ORD(VPID40));VPID:=[VPID40];KEY2:=idargs.argkeys[1];
KEY3:=idargs.argkeys[2];
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
  IF ((LIMATCHES_COMPINIDDICT(KEY1,ORD(VPID40))              )
                                                      )
                                                       THEN
    BEGIN
    action7;
    hulpstree:=LDBLEX_read(KEY2);
    BNOUNREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    BNOUNREC1:=BNOUNREC1tree^.ls^.BNOUNfield^;
    action7;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                      COMRIDCN1:=result
END;
{:RIDCN1}
{rule:}
{:RIDDERIV1}
function crdtreeRIDDERIV1;
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
RIDDERIV1d2:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY2:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=2;
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
RIDDERIV1d3:=d;
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
RIDDERIV1d4:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree2:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=9;
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
number:=-97;
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
number:=-251;
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
RIDDERIV1d5:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY3:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=300;
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
number:=301;
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
number:=307;
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
number:=266;
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
number:=150;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.index:=-1-1;
params.index:=-1-1;
params.subst:=2;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV1delt1:=hypernodeelt;
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
number:=-250;
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
crdtreeRIDDERIV1:=crdtree_9
END;
                                                       FUNCTION COMRIDDERIV1(Is1:LISTREE_pStree;Is2:LISTREE_pStree
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
BVERBREC1:LSDOMAINT_BVERBrecord;
SUBVERBREC1:LSDOMAINT_SUBVERBrecord;
NPVARREC1:LSDOMAINT_NPVARrecord;
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
PROCEDURE createtree2(VAR s:LSSTREE_pstree);
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
dtree:=dtreeRIDDERIV1;
hulpstree:=LDBLEX_read(KEY2);
RIDDERIV1d2^.li^.stree:=loopholes.retype(hulpstree,HYPERDTREE_pstree);
                                                      createtree1(hulplsstree);
RIDDERIV1d3^.li^.stree:=loopholes.retype(hulplsstree,Hyperdtree_pstree);
                                                      createtree2(hulplsstree);
RIDDERIV1d4^.li^.stree:=loopholes.retype(hulplsstree,hyperdtree_pstree);
                                                      hulpstree:=LDBLEX_read(KEY3);
RIDDERIV1d5^.li^.stree:=loopholes.retype(hulpstree,HYPERDTREE_pstree);
                                                      m:=NIL;
result:=GIDDERIV_generate(dtree);
END;
                                                      PROCEDURE ACTION11;
BEGIN
idargs:=LIMATCHES_COMPGETIDDICT(KEY1,ORD(VPID1));VPID:=[VPID1];KEY2:=idargs.argkeys[1];
KEY3:=idargs.argkeys[2];
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
    WHILE match AND NOT matchcondM2 DO
    BEGIN
    MatchModel2(m2,FALSE,match);
    END;
    If match Then
    BEGIN
 END;
IF match THEN
  BEGIN
  IF ((LIMATCHES_COMPINIDDICT(KEY1,ORD(VPID1))               )
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
COMRIDDERIV1:=result
END;
{:RIDDERIV1}
{rule:}
{:RIDDERIV6}
function crdtreeRIDDERIV6;
function crdtree_21:HYPERDTREE_pHyperdtree;
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
RIDDERIV6d2:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY2:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=2;
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
RIDDERIV6d3:=d;
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
RIDDERIV6d4:=d;
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
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV6d5:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree3:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=12;
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
number:=-102;
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
                                                      function crdtree_20:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_19:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_18:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_17:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_16:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_15:HYPERDTREE_pHyperdtree;
VAR d,dson:HYPERDTREE_pHyperDtree;
 number:INTEGER;
 hypernodeelt:HYPERDTREE_phypernodeelt;
 params:LDMRULES_LiParameters;
 lsps:LSPARAMS_precord;
 elts:HYPERDTREE_SetOfHyperNodeElt;
function crdtree_14:HYPERDTREE_pHyperdtree;
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
RIDDERIV6d6:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY3:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=2;
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
RIDDERIV6d7:=d;
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
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV6d8:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree5:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=9;
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
number:=-97;
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
number:=39;
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
number:=-118;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
number:=-108;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
number:=-109;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
number:=-110;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
number:=-111;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
number:=-112;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
number:=-113;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
number:=-114;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_6;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_14:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=87;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_14;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_15:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=-120;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_15;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_16:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=-68;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_16;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_17:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=-222;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_17;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_18:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=135;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_18;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_19:=d;
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
dson:=crdtree_19;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_20:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=108;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.index:=-1-1;
params.index:=-1-1;
params.subst:=2;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV6delt1:=hypernodeelt;
dson:=crdtree_2;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree_20;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=2;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_21:=d;
END;
                                                      BEGIN
crdtreeRIDDERIV6:=crdtree_21
END;
                                                       FUNCTION COMRIDDERIV6(Is1:LISTREE_pStree;Is2:LISTREE_pStree;Is3
:LISTREE_pStree;Is4:LISTREE_pStree
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
 m4:LSSTREE_pstree;
BVERBREC1tree:LSSTREE_pStree;
T1:LSSTREE_pStree;
T2:LSSTREE_pStree;
T3:LSSTREE_pStree;
BVERBREC1:LSDOMAINT_BVERBrecord;
SUBVERBREC1:LSDOMAINT_SUBVERBrecord;
SENTENCEVARREC1:LSDOMAINT_SENTENCEVARrecord;
FUNCTION matchcondM4:BOOLEAN;
                                                      BEGIN
matchcondM4:=FALSE;
  IF
(((T3^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     )
                                                      )
                                                      THEN 
matchcondM4:=TRUE;

END;{matchcondM4}
FUNCTION matchcondI4:BOOLEAN;
                                                      BEGIN
matchcondI4:=FALSE;
  IF
(((T3^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     )
                                                      )
                                                      THEN 
matchcondI4:=TRUE;

END;{matchcondI4}
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
PROCEDURE MatchModel4(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
                                                      BEGIN{matchmodel}
T3:=s;
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
    IF s^.ls^.cat<>SENTENCEVAR THEN
      match:=FALSE;
    IF match THEN
      SENTENCEVARREC1:=s^.ls^.SENTENCEVARfield^;
    IF match THEN match:=(s^.ls^.SENTENCEVARfield^.index=X1);
  END{MatchNode};
                                                      BEGIN
matchnode(s,match);
match:=match AND (s^.sons=NIL);
END;
PROCEDURE createtree2(VAR s:LSSTREE_pstree);
VAR list:LSMRUQUO_listofstrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := SENTENCEVAR;
    N^.ls^.SENTENCEVARfield^ := SENTENCEVARREC1;
  N^.ls^.SENTENCEVARfield^.index:=-1-1;
END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN
s:=MAKET_stree(SENTENCEVAR);
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
                                                      BEGIN
T2:=s;
match:=TRUE;
IF match THEN match:= matchcondI3;
END;
PROCEDURE createtree4(VAR s:LSSTREE_pstree);
  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN
s:=T2;
END;
                                                      PROCEDURE matchtree5(s:LSSTREE_pstree;VAR match:BOOLEAN);
                                                      BEGIN
T3:=s;
match:=TRUE;
IF match THEN match:= matchcondI4;
END;
PROCEDURE createtree5(VAR s:LSSTREE_pstree);
  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN
s:=T3;
END;
                                                      BEGIN
dtree:=dtreeRIDDERIV6;
hulpstree:=LDBLEX_read(KEY2);
RIDDERIV6d2^.li^.stree:=loopholes.retype(hulpstree,HYPERDTREE_pstree);
                                                      createtree1(hulplsstree);
RIDDERIV6d3^.li^.stree:=loopholes.retype(hulplsstree,Hyperdtree_pstree);
                                                      createtree2(hulplsstree);
RIDDERIV6d4^.li^.stree:=loopholes.retype(hulplsstree,hyperdtree_pstree);
                                                      createtree3(hulplsstree);
RIDDERIV6d5^.li^.stree:=loopholes.retype(hulplsstree,Hyperdtree_pstree);
                                                      hulpstree:=LDBLEX_read(KEY3);
RIDDERIV6d6^.li^.stree:=loopholes.retype(hulpstree,HYPERDTREE_pstree);
                                                      createtree4(hulplsstree);
RIDDERIV6d7^.li^.stree:=loopholes.retype(hulplsstree,Hyperdtree_pstree);
                                                      createtree5(hulplsstree);
RIDDERIV6d8^.li^.stree:=loopholes.retype(hulplsstree,Hyperdtree_pstree);
                                                      m:=NIL;
result:=GIDDERIV_generate(dtree);
END;
                                                      PROCEDURE ACTION23;
BEGIN
idargs:=LIMATCHES_COMPGETIDDICT(KEY1,ORD(VPID7));VPID:=[VPID7];KEY2:=idargs.argkeys[1];
KEY3:=idargs.argkeys[2];
                                                      ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      BEGIN
LISTREE_InitSetOfStrees(result);
m1:=loopholes.retype(Is1,LSSTREE_pStree);
m2:=loopholes.retype(Is2,LSSTREE_pStree);
m3:=loopholes.retype(Is3,LSSTREE_pStree);
m4:=loopholes.retype(Is4,LSSTREE_pStree);
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
        MatchModel4(m4,TRUE,match);
        If match Then
        WHILE match AND NOT matchcondM4 DO
        BEGIN
        MatchModel4(m4,FALSE,match);
        END;
        If match Then
        BEGIN
 END;
IF match THEN
  BEGIN
  IF ((LIMATCHES_COMPINIDDICT(KEY1,ORD(VPID7))               )
                                                      )
                                                       THEN
    BEGIN
    MAKET_SENTENCEVARrec(SENTENCEVARREC1);
    action23;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                              END;
      END;
    END;
COMRIDDERIV6:=result
END;
{:RIDDERIV6}
{rule:}
{:RIDDERIV9}
function crdtreeRIDDERIV9;
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
RIDDERIV9d2:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY2:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=2;
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
RIDDERIV9d3:=d;
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
RIDDERIV9d4:=d;
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
HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV9d5:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree3:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=12;
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
number:=-102;
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
number:=-251;
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
RIDDERIV9d7:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY3:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=300;
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
number:=302;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
lsps^.X302NUMBERPAR:=SINGULAR;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV9delt6:=hypernodeelt;
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
number:=307;
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
number:=273;
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
number:=150;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.index:=-1-1;
params.index:=-1-1;
params.subst:=2;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV9delt1:=hypernodeelt;
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
number:=-250;
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
crdtreeRIDDERIV9:=crdtree_9
END;
                                                       FUNCTION COMRIDDERIV9(Is1:LISTREE_pStree;Is2:LISTREE_pStree;Is3
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
PROCEDURE createtree2(VAR s:LSSTREE_pstree);
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
                                                      BEGIN
dtree:=dtreeRIDDERIV9;
hulpstree:=LDBLEX_read(KEY2);
RIDDERIV9d2^.li^.stree:=loopholes.retype(hulpstree,HYPERDTREE_pstree);
                                                      createtree1(hulplsstree);
RIDDERIV9d3^.li^.stree:=loopholes.retype(hulplsstree,Hyperdtree_pstree);
                                                      createtree2(hulplsstree);
RIDDERIV9d4^.li^.stree:=loopholes.retype(hulplsstree,hyperdtree_pstree);
                                                      createtree3(hulplsstree);
RIDDERIV9d5^.li^.stree:=loopholes.retype(hulplsstree,Hyperdtree_pstree);
                                                      hulpstree:=LDBLEX_read(KEY3);
RIDDERIV9d7^.li^.stree:=loopholes.retype(hulpstree,HYPERDTREE_pstree);
                                                      m:=NIL;
result:=GIDDERIV_generate(dtree);
END;
                                                      PROCEDURE ACTION11;
BEGIN
idargs:=LIMATCHES_COMPGETIDDICT(KEY1,ORD(VPID6));VPID:=[VPID6];KEY2:=idargs.argkeys[1];
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
  IF ((LIMATCHES_COMPINIDDICT(KEY1,ORD(VPID6))               )
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
COMRIDDERIV9:=result
END;
{:RIDDERIV9}
{rule:}
{:TIDCLAUSETOVPPROP}
 FUNCTION COMTIDCLAUSETOVPPROP(Is1:LISTREE_pStree
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
MU1:LSMRUQUO_ListOfStrees;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
VERBPPROPREC1:LSDOMAINT_VERBPPROPrecord;
PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>CLAUSE THEN
      match:=FALSE;
    IF match THEN
      CLAUSEREC1:=s^.ls^.CLAUSEfield^;
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
                                                      PROCEDURE createM;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := VERBPPROP;
    N^.ls^.VERBPPROPfield^ := VERBPPROPREC1;
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
m:=MAKET_stree(VERBPPROP);
createnode(m);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m^.li^.n:=numberofelements(list);
m^.sons:=list.first;
END{createM};
                                                      PROCEDURE ACTION1;
BEGIN
VERBPPROPREC1:=COPYT_CLAUSETOVERBPPROP(CLAUSEREC1);   ;
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
    MAKET_VERBPPROPrec(VERBPPROPREC1);
    action1;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                      COMTIDCLAUSETOVPPROP:=result
END;
{:TIDCLAUSETOVPPROP}
{rule:}
{:TIDVPPROPTOCLAUSE}
 FUNCTION COMTIDVPPROPTOCLAUSE(Is1:LISTREE_pStree
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
MU1:LSMRUQUO_ListOfStrees;
VERBPPROPREC1:LSDOMAINT_VERBPPROPrecord;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
PROCEDURE MatchModel1(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>VERBPPROP THEN
      match:=FALSE;
    IF match THEN
      VERBPPROPREC1:=s^.ls^.VERBPPROPfield^;
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
  BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem11);
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
CLAUSEREC1:=COPYT_VERBPPROPTOCLAUSE(VERBPPROPREC1);   ;
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
    MAKET_CLAUSErec(CLAUSEREC1);
    action1;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                      COMTIDVPPROPTOCLAUSE:=result
END;
{:TIDVPPROPTOCLAUSE}
{rule:}
{:TISIDIOM}
 FUNCTION COMTISIDIOM(Is1:LISTREE_pStree
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
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
((LSMRUQUO_ISIDIOM(T1
)                                                     )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM1:BOOLEAN;
                                                      BEGIN
matchcondM1:=FALSE;
  IF
((LSMRUQUO_ISIDIOM(T1
)                                                     )
                                                      )
                                                      THEN 
matchcondM1:=TRUE;

END;{matchcondM1}
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
m:=T1;
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
    action0;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                      COMTISIDIOM:=result
END;
{:TISIDIOM}
{rule:}
{:TISNOTIDIOM}
 FUNCTION COMTISNOTIDIOM(Is1:LISTREE_pStree
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
FUNCTION matchcondM:BOOLEAN;
                                                      BEGIN
matchcondM:=FALSE;
  IF
((NOT(LSMRUQUO_ISIDIOM(T1
))                                                    )
                                                      )
                                                      THEN 
matchcondM:=TRUE;

END;{matchcondM}
FUNCTION matchcondM1:BOOLEAN;
                                                      BEGIN
matchcondM1:=FALSE;
  IF
((NOT(LSMRUQUO_ISIDIOM(T1
))                                                    )
                                                      )
                                                      THEN 
matchcondM1:=TRUE;

END;{matchcondM1}
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
m:=T1;
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
    action0;
    createM;
    Is:=loopholes.retype(m,LISTREE_pstree);
    IF Is<>NIL THEN LISTREE_appendstreebonus(Is,result,wbonus);
    END;
                                                        END;
                                                      COMTISNOTIDIOM:=result
END;
{:TISNOTIDIOM}
