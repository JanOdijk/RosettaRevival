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
pragma C_include('decommrules107.pf');
END;
PROGRAM decomMrules107;
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
dtreeRIDCN1:HYPERDTREE_pHYPERDTREE;
dtreeRIDALTNPFORMATION1_3_T2:HYPERDTREE_pHYPERDTREE;
dtreeRIDALTNPFORMATION1_8_T2:HYPERDTREE_pHYPERDTREE;
dtreeRIDALTNPFORMATION1_13_T2:HYPERDTREE_pHYPERDTREE;
dtreeRIDALTNPFORMATION1_18_T2:HYPERDTREE_pHYPERDTREE;
dtreeRIDSUBNOUNTONOUN_3_T2:HYPERDTREE_pHYPERDTREE;
dtreeRIDSUBNOUNTONOUN_8_T2:HYPERDTREE_pHYPERDTREE;
dtreeRIDSUBNOUNTONOUN_13_T2:HYPERDTREE_pHYPERDTREE;
dtreeRIDDERIV1:HYPERDTREE_pHYPERDTREE;
dtreeRIDDERIV3:HYPERDTREE_pHYPERDTREE;
dtreeRIDDERIV7:HYPERDTREE_pHYPERDTREE;
dtreeRIDDERIV8:HYPERDTREE_pHYPERDTREE;
dtreeRIDDERIV9:HYPERDTREE_pHYPERDTREE;
dtreeRIDDERIV10:HYPERDTREE_pHYPERDTREE;
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
RIDALTNPFORMATION1_3_T2d1,RIDALTNPFORMATION1_3_T2d2,
RIDALTNPFORMATION1_3_T2d3,
RIDALTNPFORMATION1_3_T2d4,RIDALTNPFORMATION1_3_T2d5,
RIDALTNPFORMATION1_3_T2d6,
RIDALTNPFORMATION1_3_T2d7,RIDALTNPFORMATION1_3_T2d8,
RIDALTNPFORMATION1_3_T2d9,RIDALTNPFORMATION1_3_T2d10,RIDALTNPFORMATION1_3_T2d11,
RIDALTNPFORMATION1_3_T2d12,
RIDALTNPFORMATION1_3_T2d13,RIDALTNPFORMATION1_3_T2d14,
RIDALTNPFORMATION1_3_T2d15:HYPERDTREE_pHyperDtree;
RIDALTNPFORMATION1_3_T2delt1,RIDALTNPFORMATION1_3_T2delt2,
RIDALTNPFORMATION1_3_T2delt3,RIDALTNPFORMATION1_3_T2delt4,
RIDALTNPFORMATION1_3_T2delt5,RIDALTNPFORMATION1_3_T2delt6,
RIDALTNPFORMATION1_3_T2delt7,RIDALTNPFORMATION1_3_T2delt8,
RIDALTNPFORMATION1_3_T2delt9,RIDALTNPFORMATION1_3_T2delt10,
RIDALTNPFORMATION1_3_T2delt11,RIDALTNPFORMATION1_3_T2delt12,
RIDALTNPFORMATION1_3_T2delt13,RIDALTNPFORMATION1_3_T2delt14,
RIDALTNPFORMATION1_3_T2delt15,RIDALTNPFORMATION1_3_T2delt16,
RIDALTNPFORMATION1_3_T2delt17:HYPERDTREE_pHyperNodeElt;
RIDALTNPFORMATION1_8_T2d1,RIDALTNPFORMATION1_8_T2d2,
RIDALTNPFORMATION1_8_T2d3,
RIDALTNPFORMATION1_8_T2d4,RIDALTNPFORMATION1_8_T2d5,
RIDALTNPFORMATION1_8_T2d6,
RIDALTNPFORMATION1_8_T2d7,RIDALTNPFORMATION1_8_T2d8,
RIDALTNPFORMATION1_8_T2d9,RIDALTNPFORMATION1_8_T2d10,RIDALTNPFORMATION1_8_T2d11,
RIDALTNPFORMATION1_8_T2d12,
RIDALTNPFORMATION1_8_T2d13,RIDALTNPFORMATION1_8_T2d14,
RIDALTNPFORMATION1_8_T2d15:HYPERDTREE_pHyperDtree;
RIDALTNPFORMATION1_8_T2delt1,RIDALTNPFORMATION1_8_T2delt2,
RIDALTNPFORMATION1_8_T2delt3,RIDALTNPFORMATION1_8_T2delt4,
RIDALTNPFORMATION1_8_T2delt5,RIDALTNPFORMATION1_8_T2delt6,
RIDALTNPFORMATION1_8_T2delt7,RIDALTNPFORMATION1_8_T2delt8,
RIDALTNPFORMATION1_8_T2delt9,RIDALTNPFORMATION1_8_T2delt10,
RIDALTNPFORMATION1_8_T2delt11,RIDALTNPFORMATION1_8_T2delt12,
RIDALTNPFORMATION1_8_T2delt13,RIDALTNPFORMATION1_8_T2delt14,
RIDALTNPFORMATION1_8_T2delt15,RIDALTNPFORMATION1_8_T2delt16,
RIDALTNPFORMATION1_8_T2delt17:HYPERDTREE_pHyperNodeElt;
RIDALTNPFORMATION1_13_T2d1,RIDALTNPFORMATION1_13_T2d2,
RIDALTNPFORMATION1_13_T2d3,
RIDALTNPFORMATION1_13_T2d4,RIDALTNPFORMATION1_13_T2d5,
RIDALTNPFORMATION1_13_T2d6,
RIDALTNPFORMATION1_13_T2d7,RIDALTNPFORMATION1_13_T2d8,
RIDALTNPFORMATION1_13_T2d9,RIDALTNPFORMATION1_13_T2d10,RIDALTNPFORMATION1_13_T2d11,
RIDALTNPFORMATION1_13_T2d12,
RIDALTNPFORMATION1_13_T2d13,RIDALTNPFORMATION1_13_T2d14,
RIDALTNPFORMATION1_13_T2d15:HYPERDTREE_pHyperDtree;
RIDALTNPFORMATION1_13_T2delt1,RIDALTNPFORMATION1_13_T2delt2,
RIDALTNPFORMATION1_13_T2delt3,RIDALTNPFORMATION1_13_T2delt4,
RIDALTNPFORMATION1_13_T2delt5,RIDALTNPFORMATION1_13_T2delt6,
RIDALTNPFORMATION1_13_T2delt7,RIDALTNPFORMATION1_13_T2delt8,
RIDALTNPFORMATION1_13_T2delt9,RIDALTNPFORMATION1_13_T2delt10,
RIDALTNPFORMATION1_13_T2delt11,RIDALTNPFORMATION1_13_T2delt12,
RIDALTNPFORMATION1_13_T2delt13,RIDALTNPFORMATION1_13_T2delt14,
RIDALTNPFORMATION1_13_T2delt15,RIDALTNPFORMATION1_13_T2delt16,
RIDALTNPFORMATION1_13_T2delt17:HYPERDTREE_pHyperNodeElt;
RIDALTNPFORMATION1_18_T2d1,RIDALTNPFORMATION1_18_T2d2,
RIDALTNPFORMATION1_18_T2d3,
RIDALTNPFORMATION1_18_T2d4,RIDALTNPFORMATION1_18_T2d5,
RIDALTNPFORMATION1_18_T2d6,
RIDALTNPFORMATION1_18_T2d7,RIDALTNPFORMATION1_18_T2d8,
RIDALTNPFORMATION1_18_T2d9,RIDALTNPFORMATION1_18_T2d10,RIDALTNPFORMATION1_18_T2d11,
RIDALTNPFORMATION1_18_T2d12,
RIDALTNPFORMATION1_18_T2d13,RIDALTNPFORMATION1_18_T2d14,
RIDALTNPFORMATION1_18_T2d15:HYPERDTREE_pHyperDtree;
RIDALTNPFORMATION1_18_T2delt1,RIDALTNPFORMATION1_18_T2delt2,
RIDALTNPFORMATION1_18_T2delt3,RIDALTNPFORMATION1_18_T2delt4,
RIDALTNPFORMATION1_18_T2delt5,RIDALTNPFORMATION1_18_T2delt6,
RIDALTNPFORMATION1_18_T2delt7,RIDALTNPFORMATION1_18_T2delt8,
RIDALTNPFORMATION1_18_T2delt9,RIDALTNPFORMATION1_18_T2delt10,
RIDALTNPFORMATION1_18_T2delt11,RIDALTNPFORMATION1_18_T2delt12,
RIDALTNPFORMATION1_18_T2delt13,RIDALTNPFORMATION1_18_T2delt14,
RIDALTNPFORMATION1_18_T2delt15,RIDALTNPFORMATION1_18_T2delt16,
RIDALTNPFORMATION1_18_T2delt17:HYPERDTREE_pHyperNodeElt;
RIDSUBNOUNTONOUN_3_T2d1,RIDSUBNOUNTONOUN_3_T2d2,
RIDSUBNOUNTONOUN_3_T2d3,
RIDSUBNOUNTONOUN_3_T2d4,RIDSUBNOUNTONOUN_3_T2d5,
RIDSUBNOUNTONOUN_3_T2d6,
RIDSUBNOUNTONOUN_3_T2d7,RIDSUBNOUNTONOUN_3_T2d8,
RIDSUBNOUNTONOUN_3_T2d9,RIDSUBNOUNTONOUN_3_T2d10,RIDSUBNOUNTONOUN_3_T2d11,
RIDSUBNOUNTONOUN_3_T2d12,
RIDSUBNOUNTONOUN_3_T2d13,RIDSUBNOUNTONOUN_3_T2d14,
RIDSUBNOUNTONOUN_3_T2d15:HYPERDTREE_pHyperDtree;
RIDSUBNOUNTONOUN_3_T2delt1,RIDSUBNOUNTONOUN_3_T2delt2,
RIDSUBNOUNTONOUN_3_T2delt3,RIDSUBNOUNTONOUN_3_T2delt4,
RIDSUBNOUNTONOUN_3_T2delt5,RIDSUBNOUNTONOUN_3_T2delt6,
RIDSUBNOUNTONOUN_3_T2delt7,RIDSUBNOUNTONOUN_3_T2delt8,
RIDSUBNOUNTONOUN_3_T2delt9,RIDSUBNOUNTONOUN_3_T2delt10,
RIDSUBNOUNTONOUN_3_T2delt11,RIDSUBNOUNTONOUN_3_T2delt12,
RIDSUBNOUNTONOUN_3_T2delt13,RIDSUBNOUNTONOUN_3_T2delt14,
RIDSUBNOUNTONOUN_3_T2delt15,RIDSUBNOUNTONOUN_3_T2delt16,
RIDSUBNOUNTONOUN_3_T2delt17:HYPERDTREE_pHyperNodeElt;
RIDSUBNOUNTONOUN_8_T2d1,RIDSUBNOUNTONOUN_8_T2d2,
RIDSUBNOUNTONOUN_8_T2d3,
RIDSUBNOUNTONOUN_8_T2d4,RIDSUBNOUNTONOUN_8_T2d5,
RIDSUBNOUNTONOUN_8_T2d6,
RIDSUBNOUNTONOUN_8_T2d7,RIDSUBNOUNTONOUN_8_T2d8,
RIDSUBNOUNTONOUN_8_T2d9,RIDSUBNOUNTONOUN_8_T2d10,RIDSUBNOUNTONOUN_8_T2d11,
RIDSUBNOUNTONOUN_8_T2d12,
RIDSUBNOUNTONOUN_8_T2d13,RIDSUBNOUNTONOUN_8_T2d14,
RIDSUBNOUNTONOUN_8_T2d15:HYPERDTREE_pHyperDtree;
RIDSUBNOUNTONOUN_8_T2delt1,RIDSUBNOUNTONOUN_8_T2delt2,
RIDSUBNOUNTONOUN_8_T2delt3,RIDSUBNOUNTONOUN_8_T2delt4,
RIDSUBNOUNTONOUN_8_T2delt5,RIDSUBNOUNTONOUN_8_T2delt6,
RIDSUBNOUNTONOUN_8_T2delt7,RIDSUBNOUNTONOUN_8_T2delt8,
RIDSUBNOUNTONOUN_8_T2delt9,RIDSUBNOUNTONOUN_8_T2delt10,
RIDSUBNOUNTONOUN_8_T2delt11,RIDSUBNOUNTONOUN_8_T2delt12,
RIDSUBNOUNTONOUN_8_T2delt13,RIDSUBNOUNTONOUN_8_T2delt14,
RIDSUBNOUNTONOUN_8_T2delt15,RIDSUBNOUNTONOUN_8_T2delt16,
RIDSUBNOUNTONOUN_8_T2delt17:HYPERDTREE_pHyperNodeElt;
RIDSUBNOUNTONOUN_13_T2d1,RIDSUBNOUNTONOUN_13_T2d2,
RIDSUBNOUNTONOUN_13_T2d3,
RIDSUBNOUNTONOUN_13_T2d4,RIDSUBNOUNTONOUN_13_T2d5,
RIDSUBNOUNTONOUN_13_T2d6,
RIDSUBNOUNTONOUN_13_T2d7,RIDSUBNOUNTONOUN_13_T2d8,
RIDSUBNOUNTONOUN_13_T2d9,RIDSUBNOUNTONOUN_13_T2d10,RIDSUBNOUNTONOUN_13_T2d11,
RIDSUBNOUNTONOUN_13_T2d12,
RIDSUBNOUNTONOUN_13_T2d13,RIDSUBNOUNTONOUN_13_T2d14,
RIDSUBNOUNTONOUN_13_T2d15:HYPERDTREE_pHyperDtree;
RIDSUBNOUNTONOUN_13_T2delt1,RIDSUBNOUNTONOUN_13_T2delt2,
RIDSUBNOUNTONOUN_13_T2delt3,RIDSUBNOUNTONOUN_13_T2delt4,
RIDSUBNOUNTONOUN_13_T2delt5,RIDSUBNOUNTONOUN_13_T2delt6,
RIDSUBNOUNTONOUN_13_T2delt7,RIDSUBNOUNTONOUN_13_T2delt8,
RIDSUBNOUNTONOUN_13_T2delt9,RIDSUBNOUNTONOUN_13_T2delt10,
RIDSUBNOUNTONOUN_13_T2delt11,RIDSUBNOUNTONOUN_13_T2delt12,
RIDSUBNOUNTONOUN_13_T2delt13,RIDSUBNOUNTONOUN_13_T2delt14,
RIDSUBNOUNTONOUN_13_T2delt15,RIDSUBNOUNTONOUN_13_T2delt16,
RIDSUBNOUNTONOUN_13_T2delt17:HYPERDTREE_pHyperNodeElt;
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
RIDDERIV3d1,RIDDERIV3d2,
RIDDERIV3d3,
RIDDERIV3d4,RIDDERIV3d5,
RIDDERIV3d6,
RIDDERIV3d7,RIDDERIV3d8,
RIDDERIV3d9,RIDDERIV3d10,RIDDERIV3d11,
RIDDERIV3d12,
RIDDERIV3d13,RIDDERIV3d14,
RIDDERIV3d15:HYPERDTREE_pHyperDtree;
RIDDERIV3delt1,RIDDERIV3delt2,
RIDDERIV3delt3,RIDDERIV3delt4,
RIDDERIV3delt5,RIDDERIV3delt6,
RIDDERIV3delt7,RIDDERIV3delt8,
RIDDERIV3delt9,RIDDERIV3delt10,
RIDDERIV3delt11,RIDDERIV3delt12,
RIDDERIV3delt13,RIDDERIV3delt14,
RIDDERIV3delt15,RIDDERIV3delt16,
RIDDERIV3delt17:HYPERDTREE_pHyperNodeElt;
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
RIDDERIV8d1,RIDDERIV8d2,
RIDDERIV8d3,
RIDDERIV8d4,RIDDERIV8d5,
RIDDERIV8d6,
RIDDERIV8d7,RIDDERIV8d8,
RIDDERIV8d9,RIDDERIV8d10,RIDDERIV8d11,
RIDDERIV8d12,
RIDDERIV8d13,RIDDERIV8d14,
RIDDERIV8d15:HYPERDTREE_pHyperDtree;
RIDDERIV8delt1,RIDDERIV8delt2,
RIDDERIV8delt3,RIDDERIV8delt4,
RIDDERIV8delt5,RIDDERIV8delt6,
RIDDERIV8delt7,RIDDERIV8delt8,
RIDDERIV8delt9,RIDDERIV8delt10,
RIDDERIV8delt11,RIDDERIV8delt12,
RIDDERIV8delt13,RIDDERIV8delt14,
RIDDERIV8delt15,RIDDERIV8delt16,
RIDDERIV8delt17:HYPERDTREE_pHyperNodeElt;
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
RIDDERIV10d1,RIDDERIV10d2,
RIDDERIV10d3,
RIDDERIV10d4,RIDDERIV10d5,
RIDDERIV10d6,
RIDDERIV10d7,RIDDERIV10d8,
RIDDERIV10d9,RIDDERIV10d10,RIDDERIV10d11,
RIDDERIV10d12,
RIDDERIV10d13,RIDDERIV10d14,
RIDDERIV10d15:HYPERDTREE_pHyperDtree;
RIDDERIV10delt1,RIDDERIV10delt2,
RIDDERIV10delt3,RIDDERIV10delt4,
RIDDERIV10delt5,RIDDERIV10delt6,
RIDDERIV10delt7,RIDDERIV10delt8,
RIDDERIV10delt9,RIDDERIV10delt10,
RIDDERIV10delt11,RIDDERIV10delt12,
RIDDERIV10delt13,RIDDERIV10delt14,
RIDDERIV10delt15,RIDDERIV10delt16,
RIDDERIV10delt17:HYPERDTREE_pHyperNodeElt;
X1,X2,X3,X4,X5:INTEGER;
FUNCTION crdtreeRIDCN1:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDALTNPFORMATION1_3_T2:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDALTNPFORMATION1_8_T2:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDALTNPFORMATION1_13_T2:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDALTNPFORMATION1_18_T2:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDSUBNOUNTONOUN_3_T2:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDSUBNOUNTONOUN_8_T2:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDSUBNOUNTONOUN_13_T2:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDDERIV1:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDDERIV3:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDDERIV7:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDDERIV8:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDDERIV9:HYPERDTREE_phyperdtree;FORWARD;
FUNCTION crdtreeRIDDERIV10:HYPERDTREE_phyperdtree;FORWARD;
 PROCEDURE decommrules107_init;
BEGIN
dtreeRIDCN1:=crdtreeRIDCN1;
dtreeRIDALTNPFORMATION1_3_T2:=crdtreeRIDALTNPFORMATION1_3_T2;
dtreeRIDALTNPFORMATION1_8_T2:=crdtreeRIDALTNPFORMATION1_8_T2;
dtreeRIDALTNPFORMATION1_13_T2:=crdtreeRIDALTNPFORMATION1_13_T2;
dtreeRIDALTNPFORMATION1_18_T2:=crdtreeRIDALTNPFORMATION1_18_T2;
dtreeRIDSUBNOUNTONOUN_3_T2:=crdtreeRIDSUBNOUNTONOUN_3_T2;
dtreeRIDSUBNOUNTONOUN_8_T2:=crdtreeRIDSUBNOUNTONOUN_8_T2;
dtreeRIDSUBNOUNTONOUN_13_T2:=crdtreeRIDSUBNOUNTONOUN_13_T2;
dtreeRIDDERIV1:=crdtreeRIDDERIV1;
dtreeRIDDERIV3:=crdtreeRIDDERIV3;
dtreeRIDDERIV7:=crdtreeRIDDERIV7;
dtreeRIDDERIV8:=crdtreeRIDDERIV8;
dtreeRIDDERIV9:=crdtreeRIDDERIV9;
dtreeRIDDERIV10:=crdtreeRIDDERIV10;
END;
{rule:}
{:RIDCN1}
function crdtreeRIDCN1;
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
RIDCN1d2:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree1:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=258;
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
RIDCN1d4:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY3:=d;
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
RIDCN1d5:=d;
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
RIDCN1d6:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree3:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=347;
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
number:=-218;
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
number:=359;
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
RIDCN1d7:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY4:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=249;
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
number:=250;
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
number:=258;
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
number:=423;
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
number:=363;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.index:=-2-1;
params.index:=-2-1;
params.subst:=2;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDCN1delt3:=hypernodeelt;
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
number:=-222;
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
number:=366;
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
number:=270;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.index:=-1-1;
params.index:=-1-1;
params.subst:=1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDCN1delt1:=hypernodeelt;
dson:=crdtree_0;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree_11;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=2;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_12:=d;
END;
                                                      BEGIN
crdtreeRIDCN1:=crdtree_12
END;
                                                       FUNCTION DECRIDCN1(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
VAR result:LISTREE_SetOfTupleOfStrees;
 wbonus,sbonus:INTEGER;
 m:LSSTREE_pstree;
 tuple:LISTREE_TupleOfStrees;
 first:BOOLEAN;
 match:BOOLEAN;
 idargs:LIIDDICT_idargs;
dtree:HYPERDTREE_phyperdtree;
 key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;
LinitM1_1_1_1,LrestM1_1_1_1,LfirstM1_1_1_1,LlastM1_1_1_1:LSSTREE_prelnode;
iM1_1_1_1:INTEGER;
nomoretreesM1_1_1_1,lastmatchM1_1_1_1:BOOLEAN;
LinitM1_1_1_1_1,LrestM1_1_1_1_1,LfirstM1_1_1_1_1,LlastM1_1_1_1_1:LSSTREE_prelnode;
iM1_1_1_1_1:INTEGER;
nomoretreesM1_1_1_1_1,lastmatchM1_1_1_1_1:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
BNOUNREC1tree:LSSTREE_pStree;
NPVARREC1:LSDOMAINT_NPVARrecord;
CNVARREC1:LSDOMAINT_CNVARrecord;
BNOUNREC1:LSDOMAINT_BNOUNrecord;
SUBNOUNREC1:LSDOMAINT_SUBNOUNrecord;
NOUNREC1:LSDOMAINT_NOUNrecord;
PROCEDURE createM1;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE CreateNode(VAR N:LSSTREE_pStree);
  BEGIN{CreateNode}
    N^.ls^.cat := NOUN;
    N^.ls^.NOUNfield^ := NOUNREC1;
  END{CreateNode};
                                                        PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
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
      PROCEDURE createitem11(VAR list:LSMRUQUO_ListOfStrees);
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
                                                            BEGIN{createitem11}
      createHEAD(list);
      END;
      BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
      END{createlist1};
                                                          BEGIN{HEAD}
LSMATCHES_createitem(list,HEAD,SUBNOUN,createnode,createlist1);
    END{HEAD};
                                                        BEGIN{createitem11}
  createHEAD(list);
  END;
  BEGIN{createlist1}
LSMATCHES_createlist1items1(wholelist,createitem11);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(NOUN);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
dtree:=dtreeRIDCN1;
match:=AIDDERIV_analyse(dtree,loopholes.retype(m,LISTREE_pstree));
X1:=RIDCN1delt1^.parameters.index;
hulplsstree:=loopholes.retype(
RIDCN1d2^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree1(hulplsstree,match);
                                                      X2:=RIDCN1delt3^.parameters.index;
hulplsstree:=loopholes.retype(
RIDCN1d4^.li^.stree,LSSTREE_pstree);
IF match THEN KEY3:=hulplsstree^.ls^.PREPfield^.key;
                                                      hulplsstree:=loopholes.retype(
RIDCN1d5^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree2(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDCN1d6^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree3(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDCN1d7^.li^.stree,LSSTREE_pstree);
IF match THEN KEY4:=hulplsstree^.ls^.BNOUNfield^.key;
                                                      END;
                                                      PROCEDURE ACTION16;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.argkeys[3]:=KEY4;
idargs.nrargs:=3;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID150))  ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      FUNCTION idargs1:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.argkeys[3]:=KEY4;
                                                      idargs.nrargs:=3;
idargs1:=
LIMATCHES_decompiniddict(idargs,ORD(VPID150))         END;
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
  action16;
  hulpstree:=LDBLEX_read(KEY1);
  BNOUNREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
  BNOUNREC1:=BNOUNREC1tree^.ls^.BNOUNfield^;
  action16;
  createM1;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
                                                        END;
                                                      DECRIDCN1:=result
END;
{:RIDCN1}
{rule:}
{:RIDNPFORMATION2}
 FUNCTION DECRIDNPFORMATION2(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
MU1:LSMRUQUO_ListOfStrees;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
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
LlastM_1_1:=L;WHILE LlastM_1_1^.brother<>NIL DO
LlastM_1_1:=LlastM_1_1^.brother;
match_MU1(L,LlastM_1_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist1items,lastmatchM_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=1) AND (s^.li^.n <=1)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar1rels(s,first,HEAD,match,matchnode,matchlist1items,lastmatch) END;
                                                      PROCEDURE ACTION8;
BEGIN
;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION9;
BEGIN
;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION10;
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
IF ((((NPREC1.DEFINITE =INDEF                                )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((NPREC1.POSSPRED =TRUE                                 )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((NPREC1.POSSNIETNP =TRUE                               )
                                                      )
                                                      )
                                                      )
THEN IF
          ((((NPREC1.CASES =[NOMINATIVE]                                          )
                                                      )
                                                      )
                                                      )
                                                       THEN
  BEGIN
  IF (((NPREC1.NUMBER=SINGULAR) AND 
          (NPREC1.NOUNPATTERNEFS=CNREC1.NOUNPATTERNEFS) AND 
                    (NPREC1.THETANP=CNREC1.THETANP) AND 
                    (NPREC1.ACTCOMAS=CNREC1.POSSCOMAS) AND 
                    (NPREC1.HUMAN=CNREC1.HUMAN) AND 
                    (NPREC1.ANIMATE=CNREC1.ANIMATE) AND 
                    (NPREC1.TEMPORAL=CNREC1.TEMPORAL) AND 
                    (NPREC1.ACTSUBCS=CNREC1.ACTSUBCS) AND 
                    (NPREC1.SEXES=CNREC1.SEXES) AND 
                    (NPREC1.GENDERS=CNREC1.GENDERS) AND 
                    (NPREC1.SPECQ=YESSPEC) AND 
          (NPREC1.SYNTQUANT=OMEGAQUANT) AND 
          (NPREC1.GENERIC=NOGENERIC) AND 
          (NPREC1.SUPERDEIXIS=OMEGADEIXIS) AND 
          TRUE
                                                      )
                                                      )
                                                       THEN
    BEGIN
    action8;
    action10;
    createM1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
    END;
  IF (((NPREC1.NUMBER=PLURAL) AND 
          (NPREC1.NOUNPATTERNEFS=CNREC1.NOUNPATTERNEFS) AND 
                    (NPREC1.THETANP=CNREC1.THETANP) AND 
                    (NPREC1.ACTCOMAS=CNREC1.POSSCOMAS) AND 
                    (NPREC1.HUMAN=CNREC1.HUMAN) AND 
                    (NPREC1.ANIMATE=CNREC1.ANIMATE) AND 
                    (NPREC1.TEMPORAL=CNREC1.TEMPORAL) AND 
                    (NPREC1.ACTSUBCS=CNREC1.ACTSUBCS) AND 
                    (NPREC1.SEXES=CNREC1.SEXES) AND 
                    (NPREC1.GENDERS=CNREC1.GENDERS) AND 
                    (NPREC1.SPECQ=YESSPEC) AND 
          (NPREC1.SYNTQUANT=OMEGAQUANT) AND 
          (NPREC1.GENERIC=NOGENERIC) AND 
          (NPREC1.SUPERDEIXIS=OMEGADEIXIS) AND 
          TRUE
                                                      )
                                                      )
                                                       THEN
    BEGIN
    action9;
    action10;
    createM1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
    END;
                                                        END;
                                                        END;
                                                      DECRIDNPFORMATION2:=result
END;
{:RIDNPFORMATION2}
{rule:}
{:RIDALTNPFORMATION1}
function crdtreeRIDALTNPFORMATION1_3_T2;
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
RIDALTNPFORMATION1_3_T2d1:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree1:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=423;
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
crdtreeRIDALTNPFORMATION1_3_T2:=crdtree_0
END;
                                                      function crdtreeRIDALTNPFORMATION1_8_T2;
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
RIDALTNPFORMATION1_8_T2d1:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree1:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=233;
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
crdtreeRIDALTNPFORMATION1_8_T2:=crdtree_5
END;
                                                      function crdtreeRIDALTNPFORMATION1_13_T2;
function crdtree_10:HYPERDTREE_pHyperdtree;
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
RIDALTNPFORMATION1_13_T2d1:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree1:=d;
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
dson:=crdtree1;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_10:=d;
END;
                                                      BEGIN
crdtreeRIDALTNPFORMATION1_13_T2:=crdtree_10
END;
                                                      function crdtreeRIDALTNPFORMATION1_18_T2;
function crdtree_15:HYPERDTREE_pHyperdtree;
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
RIDALTNPFORMATION1_18_T2d1:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree1:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=236;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree1;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_15:=d;
END;
                                                      BEGIN
crdtreeRIDALTNPFORMATION1_18_T2:=crdtree_15
END;
                                                       FUNCTION DECRIDALTNPFORMATION1(VAR VPID:LSDOMAINT_SYNPATTERNSETTYPE;
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
dtree:=dtreeRIDALTNPFORMATION1_3_T2;
match:=AIDDERIV_analyse(dtree,loopholes.retype(T2,LISTREE_pstree));
hulplsstree:=loopholes.retype(
RIDALTNPFORMATION1_3_T2d1^.li^.stree,LSSTREE_pstree);
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
VPID:=[VPID21]                                              ;wbonus:=0;sbonus:=0

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
dtree:=dtreeRIDALTNPFORMATION1_8_T2;
match:=AIDDERIV_analyse(dtree,loopholes.retype(T2,LISTREE_pstree));
hulplsstree:=loopholes.retype(
RIDALTNPFORMATION1_8_T2d1^.li^.stree,LSSTREE_pstree);
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
VPID:=[VPID1]                                               ;wbonus:=0;sbonus:=0

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
 FUNCTION subrule0X3 :LISTREE_SetOfTupleOfStrees;
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
dtree:=dtreeRIDALTNPFORMATION1_13_T2;
match:=AIDDERIV_analyse(dtree,loopholes.retype(T2,LISTREE_pstree));
hulplsstree:=loopholes.retype(
RIDALTNPFORMATION1_13_T2d1^.li^.stree,LSSTREE_pstree);
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
                                                      PROCEDURE ACTION14;
BEGIN
VPID:=[VPID33]                                              ;wbonus:=0;sbonus:=0

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
    action14;
    createT1;
    previous1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
    END;
                                                          END;
                                                       subrule0X3:=result
 END;
 FUNCTION subrule0X4 :LISTREE_SetOfTupleOfStrees;
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
dtree:=dtreeRIDALTNPFORMATION1_18_T2;
match:=AIDDERIV_analyse(dtree,loopholes.retype(T2,LISTREE_pstree));
hulplsstree:=loopholes.retype(
RIDALTNPFORMATION1_18_T2d1^.li^.stree,LSSTREE_pstree);
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
                                                      PROCEDURE ACTION19;
BEGIN
VPID:=[VPID27]                                              ;wbonus:=0;sbonus:=0

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
    action19;
    createT1;
    previous1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
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
IF match THEN
 BEGIN
  LISTREE_mergesetsoftuplestrees(subrule0X1,result);
  LISTREE_mergesetsoftuplestrees(subrule0X2,result);
  LISTREE_mergesetsoftuplestrees(subrule0X3,result);
  LISTREE_mergesetsoftuplestrees(subrule0X4,result);
 END;
DECRIDALTNPFORMATION1:=result
END;
{:RIDALTNPFORMATION1}
{rule:}
{:RIDSUBNOUNTONOUN}
function crdtreeRIDSUBNOUNTONOUN_3_T2;
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
RIDSUBNOUNTONOUN_3_T2d1:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree1:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=250;
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
crdtreeRIDSUBNOUNTONOUN_3_T2:=crdtree_0
END;
                                                      function crdtreeRIDSUBNOUNTONOUN_8_T2;
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
RIDSUBNOUNTONOUN_8_T2d2:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree1:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=252;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
lsps^.X252NUMBERPAR:=SINGULAR;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDSUBNOUNTONOUN_8_T2delt1:=hypernodeelt;
dson:=crdtree1;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_5:=d;
END;
                                                      BEGIN
crdtreeRIDSUBNOUNTONOUN_8_T2:=crdtree_5
END;
                                                      function crdtreeRIDSUBNOUNTONOUN_13_T2;
function crdtree_10:HYPERDTREE_pHyperdtree;
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
RIDSUBNOUNTONOUN_13_T2d2:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree1:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=251;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
lsps^.X251NUMBERPAR:=PLURAL;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDSUBNOUNTONOUN_13_T2delt1:=hypernodeelt;
dson:=crdtree1;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=1;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_10:=d;
END;
                                                      BEGIN
crdtreeRIDSUBNOUNTONOUN_13_T2:=crdtree_10
END;
                                                       FUNCTION DECRIDSUBNOUNTONOUN(VAR VPID:LSDOMAINT_SYNPATTERNSETTYPE;
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
dtree:=dtreeRIDSUBNOUNTONOUN_3_T2;
match:=AIDDERIV_analyse(dtree,loopholes.retype(T2,LISTREE_pstree));
hulplsstree:=loopholes.retype(
RIDSUBNOUNTONOUN_3_T2d1^.li^.stree,LSSTREE_pstree);
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
VPID:=LSAUXDOM_COUNTNOUNVPS                                 ;wbonus:=0;sbonus:=0

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
dtree:=dtreeRIDSUBNOUNTONOUN_8_T2;
match:=AIDDERIV_analyse(dtree,loopholes.retype(T2,LISTREE_pstree));
lsps:=loopholes.retype(RIDSUBNOUNTONOUN_8_T2delt1^.parameters.ls,LSPARAMS_precord);
match:=match AND (SINGULAR=
lsps^.X252NUMBERPAR);
hulplsstree:=loopholes.retype(
RIDSUBNOUNTONOUN_8_T2d2^.li^.stree,LSSTREE_pstree);
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
VPID:=LSAUXDOM_MASSNOUNVPS                                  ;wbonus:=0;sbonus:=0

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
 FUNCTION subrule0X3 :LISTREE_SetOfTupleOfStrees;
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
dtree:=dtreeRIDSUBNOUNTONOUN_13_T2;
match:=AIDDERIV_analyse(dtree,loopholes.retype(T2,LISTREE_pstree));
lsps:=loopholes.retype(RIDSUBNOUNTONOUN_13_T2delt1^.parameters.ls,LSPARAMS_precord);
match:=match AND (PLURAL=
lsps^.X251NUMBERPAR);
hulplsstree:=loopholes.retype(
RIDSUBNOUNTONOUN_13_T2d2^.li^.stree,LSSTREE_pstree);
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
                                                      PROCEDURE ACTION14;
BEGIN
VPID:=LSAUXDOM_PLURALNOUNVPS                                ;wbonus:=0;sbonus:=0

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
    action14;
    createT1;
    previous1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
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
DECRIDSUBNOUNTONOUN:=result
END;
{:RIDSUBNOUNTONOUN}
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
number:=6;
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
number:=155;
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
number:=-129;
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
number:=-266;
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
RIDDERIV1d7:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY3:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=249;
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
number:=425;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV1delt6:=hypernodeelt;
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
number:=258;
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
number:=424;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV1delt5:=hypernodeelt;
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
number:=55;
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
number:=-265;
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
                                                       FUNCTION DECRIDDERIV1(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
BVERBREC1:LSDOMAINT_BVERBrecord;
SUBVERBREC1:LSDOMAINT_SUBVERBrecord;
NPVARREC1:LSDOMAINT_NPVARrecord;
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
match:=AIDDERIV_analyse(dtree,loopholes.retype(m,LISTREE_pstree));
X1:=RIDDERIV1delt1^.parameters.index;
hulplsstree:=loopholes.retype(
RIDDERIV1d2^.li^.stree,LSSTREE_pstree);
IF match THEN KEY2:=hulplsstree^.ls^.BVERBfield^.key;
                                                      hulplsstree:=loopholes.retype(
RIDDERIV1d3^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree1(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV1d4^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree2(hulplsstree,match);
                                                      VPID:=loopholes.retype(RIDDERIV1delt5
^.parameters.ls,LSPARAMS_precord)^.X424vpid;
VPID:=loopholes.retype(RIDDERIV1delt6^.parameters.ls,LSPARAMS_precord)^.X425vpid;
hulplsstree:=loopholes.retype(
RIDDERIV1d7^.li^.stree,LSSTREE_pstree);
IF match THEN KEY3:=hulplsstree^.ls^.BNOUNfield^.key;
                                                      END;
                                                      PROCEDURE ACTION23;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.nrargs:=2;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID1))    ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION27;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.nrargs:=2;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID21))   ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION31;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.nrargs:=2;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID33))   ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION35;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.nrargs:=2;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID27))   ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION39;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.nrargs:=2;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID40))   ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      FUNCTION idargs1:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
                                                      idargs.nrargs:=2;
idargs1:=
LIMATCHES_decompiniddict(idargs,ORD(VPID1))           END;
                                                      FUNCTION idargs2:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
                                                      idargs.nrargs:=2;
idargs2:=
LIMATCHES_decompiniddict(idargs,ORD(VPID21))          END;
                                                      FUNCTION idargs3:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
                                                      idargs.nrargs:=2;
idargs3:=
LIMATCHES_decompiniddict(idargs,ORD(VPID33))          END;
                                                      FUNCTION idargs4:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
                                                      idargs.nrargs:=2;
idargs4:=
LIMATCHES_decompiniddict(idargs,ORD(VPID27))          END;
                                                      FUNCTION idargs5:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
                                                      idargs.nrargs:=2;
idargs5:=
LIMATCHES_decompiniddict(idargs,ORD(VPID40))          END;
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
  action23;
  hulpstree:=LDBLEX_read(KEY1);
  BVERBREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
  BVERBREC1:=BVERBREC1tree^.ls^.BVERBfield^;
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
IF ((idargs2                                               )
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
  createM1;
  createM2;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  Is2:=loopholes.retype(m2,LISTREE_pstree);
  LISTREE_addtotuple(Is2,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
IF ((idargs3                                               )
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
  createM1;
  createM2;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  Is2:=loopholes.retype(m2,LISTREE_pstree);
  LISTREE_addtotuple(Is2,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
IF ((idargs4                                               )
                                                      )
                                                       THEN
  BEGIN
  MAKET_SUBVERBrec(SUBVERBREC1);
  MAKET_BVERBrec(BVERBREC1);
  action35;
  hulpstree:=LDBLEX_read(KEY1);
  BVERBREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
  BVERBREC1:=BVERBREC1tree^.ls^.BVERBfield^;
  action35;
  createM1;
  createM2;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  Is2:=loopholes.retype(m2,LISTREE_pstree);
  LISTREE_addtotuple(Is2,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
IF ((idargs5                                               )
                                                      )
                                                       THEN
  BEGIN
  MAKET_SUBVERBrec(SUBVERBREC1);
  MAKET_BVERBrec(BVERBREC1);
  action39;
  hulpstree:=LDBLEX_read(KEY1);
  BVERBREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
  BVERBREC1:=BVERBREC1tree^.ls^.BVERBfield^;
  action39;
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
                                                      DECRIDDERIV1:=result
END;
{:RIDDERIV1}
{rule:}
{:RIDDERIV3}
function crdtreeRIDDERIV3;
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
RIDDERIV3d2:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY2:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=6;
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
RIDDERIV3d3:=d;
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
RIDDERIV3d4:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree2:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=155;
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
number:=-129;
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
number:=-266;
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
RIDDERIV3d6:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY3:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=249;
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
number:=425;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV3delt5:=hypernodeelt;
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
number:=258;
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
RIDDERIV3d7:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree3:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=433;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_6;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree3;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=2;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_7:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=55;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.index:=-1-1;
params.index:=-1-1;
params.subst:=2;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV3delt1:=hypernodeelt;
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
number:=-265;
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
crdtreeRIDDERIV3:=crdtree_9
END;
                                                       FUNCTION DECRIDDERIV3(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
                                                      BEGIN
dtree:=dtreeRIDDERIV3;
match:=AIDDERIV_analyse(dtree,loopholes.retype(m,LISTREE_pstree));
X1:=RIDDERIV3delt1^.parameters.index;
hulplsstree:=loopholes.retype(
RIDDERIV3d2^.li^.stree,LSSTREE_pstree);
IF match THEN KEY2:=hulplsstree^.ls^.BVERBfield^.key;
                                                      hulplsstree:=loopholes.retype(
RIDDERIV3d3^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree1(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV3d4^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree2(hulplsstree,match);
                                                      VPID:=loopholes.retype(RIDDERIV3delt5
^.parameters.ls,LSPARAMS_precord)^.X425vpid;
hulplsstree:=loopholes.retype(
RIDDERIV3d6^.li^.stree,LSSTREE_pstree);
IF match THEN KEY3:=hulplsstree^.ls^.BNOUNfield^.key;
                                                      hulplsstree:=loopholes.retype(
RIDDERIV3d7^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree3(hulplsstree,match);
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
                                                      PROCEDURE ACTION22;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.nrargs:=2;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID4))    ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION26;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.nrargs:=2;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID6))    ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      FUNCTION idargs1:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
                                                      idargs.nrargs:=2;
idargs1:=
LIMATCHES_decompiniddict(idargs,ORD(VPID4))           END;
                                                      FUNCTION idargs2:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
                                                      idargs.nrargs:=2;
idargs2:=
LIMATCHES_decompiniddict(idargs,ORD(VPID6))           END;
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
    action22;
    hulpstree:=LDBLEX_read(KEY1);
    BVERBREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    BVERBREC1:=BVERBREC1tree^.ls^.BVERBfield^;
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
  IF ((idargs2                                               )
                                                      )
THEN IF
          ((NPVARREC3.INDEX =NPVARREC2.INDEX                      )
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
                                                      PROCEDURE ACTION39;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.nrargs:=2;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID4))    ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION43;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.nrargs:=2;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID6))    ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      FUNCTION idargs1:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
                                                      idargs.nrargs:=2;
idargs1:=
LIMATCHES_decompiniddict(idargs,ORD(VPID4))           END;
                                                      FUNCTION idargs2:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
                                                      idargs.nrargs:=2;
idargs2:=
LIMATCHES_decompiniddict(idargs,ORD(VPID6))           END;
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
    action39;
    hulpstree:=LDBLEX_read(KEY1);
    BVERBREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    BVERBREC1:=BVERBREC1tree^.ls^.BVERBfield^;
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
  IF ((idargs2                                               )
                                                      )
THEN IF
          ((CNVARREC2.INDEX =CNVARREC1.INDEX                      )
                                                      )
                                                       THEN
    BEGIN
    MAKET_SUBVERBrec(SUBVERBREC1);
    MAKET_BVERBrec(BVERBREC1);
    action43;
    hulpstree:=LDBLEX_read(KEY1);
    BVERBREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    BVERBREC1:=BVERBREC1tree^.ls^.BVERBfield^;
    action43;
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
DECRIDDERIV3:=result
END;
{:RIDDERIV3}
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
number:=6;
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
number:=157;
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
number:=-121;
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
number:=344;
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
number:=347;
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
number:=-218;
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
number:=359;
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
number:=249;
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
number:=250;
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
number:=258;
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
number:=233;
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
number:=363;
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
number:=-222;
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
number:=366;
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
number:=130;
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
                                                      PROCEDURE ACTION23;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY4;
idargs.argkeys[3]:=KEY3;
idargs.nrargs:=3;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID3))    ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      FUNCTION idargs1:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY4;
idargs.argkeys[3]:=KEY3;
                                                      idargs.nrargs:=3;
idargs1:=
LIMATCHES_decompiniddict(idargs,ORD(VPID3))           END;
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
    action23;
    hulpstree:=LDBLEX_read(KEY1);
    BVERBREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    BVERBREC1:=BVERBREC1tree^.ls^.BVERBfield^;
    action23;
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
                                                      PROCEDURE ACTION32;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY4;
idargs.argkeys[3]:=KEY3;
idargs.nrargs:=3;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID3))    ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      FUNCTION idargs1:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY4;
idargs.argkeys[3]:=KEY3;
                                                      idargs.nrargs:=3;
idargs1:=
LIMATCHES_decompiniddict(idargs,ORD(VPID3))           END;
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
    action32;
    hulpstree:=LDBLEX_read(KEY1);
    BVERBREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    BVERBREC1:=BVERBREC1tree^.ls^.BVERBfield^;
    action32;
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
{:RIDDERIV8}
function crdtreeRIDDERIV8;
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
RIDDERIV8d2:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY2:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=6;
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
RIDDERIV8d3:=d;
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
RIDDERIV8d4:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree2:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=155;
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
number:=-129;
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
number:=-266;
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
RIDDERIV8d5:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY3:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=249;
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
number:=250;
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
number:=258;
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
RIDDERIV8d6:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree3:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=433;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_6;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree3;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=2;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_7:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=55;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.index:=-1-1;
params.index:=-1-1;
params.subst:=2;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV8delt1:=hypernodeelt;
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
number:=-265;
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
crdtreeRIDDERIV8:=crdtree_9
END;
                                                       FUNCTION DECRIDDERIV8(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
dtree:=dtreeRIDDERIV8;
match:=AIDDERIV_analyse(dtree,loopholes.retype(m,LISTREE_pstree));
X1:=RIDDERIV8delt1^.parameters.index;
hulplsstree:=loopholes.retype(
RIDDERIV8d2^.li^.stree,LSSTREE_pstree);
IF match THEN KEY2:=hulplsstree^.ls^.BVERBfield^.key;
                                                      hulplsstree:=loopholes.retype(
RIDDERIV8d3^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree1(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV8d4^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree2(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV8d5^.li^.stree,LSSTREE_pstree);
IF match THEN KEY3:=hulplsstree^.ls^.BNOUNfield^.key;
                                                      hulplsstree:=loopholes.retype(
RIDDERIV8d6^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree3(hulplsstree,match);
                                                      END;
                                                      PROCEDURE ACTION15;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.nrargs:=2;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID5))    ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      FUNCTION idargs1:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
                                                      idargs.nrargs:=2;
idargs1:=
LIMATCHES_decompiniddict(idargs,ORD(VPID5))           END;
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
                                                      DECRIDDERIV8:=result
END;
{:RIDDERIV8}
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
number:=6;
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
number:=157;
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
number:=-125;
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
number:=-266;
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
RIDDERIV9d6:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY3:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=249;
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
number:=250;
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
number:=258;
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
number:=233;
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
number:=55;
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
number:=-265;
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
                                                       FUNCTION DECRIDDERIV9(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
match:=AIDDERIV_analyse(dtree,loopholes.retype(m,LISTREE_pstree));
X1:=RIDDERIV9delt1^.parameters.index;
hulplsstree:=loopholes.retype(
RIDDERIV9d2^.li^.stree,LSSTREE_pstree);
IF match THEN KEY2:=hulplsstree^.ls^.BVERBfield^.key;
                                                      hulplsstree:=loopholes.retype(
RIDDERIV9d3^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree1(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV9d4^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree2(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV9d5^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree3(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV9d6^.li^.stree,LSSTREE_pstree);
IF match THEN KEY3:=hulplsstree^.ls^.BNOUNfield^.key;
                                                      END;
                                                      PROCEDURE ACTION13;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.nrargs:=2;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID2))    ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      FUNCTION idargs1:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
                                                      idargs.nrargs:=2;
idargs1:=
LIMATCHES_decompiniddict(idargs,ORD(VPID2))           END;
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
  action13;
  hulpstree:=LDBLEX_read(KEY1);
  BVERBREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
  BVERBREC1:=BVERBREC1tree^.ls^.BVERBfield^;
  action13;
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
                                                      DECRIDDERIV9:=result
END;
{:RIDDERIV9}
{rule:}
{:RIDDERIV10}
function crdtreeRIDDERIV10;
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
RIDDERIV10d3:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY2:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=6;
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
RIDDERIV10d4:=d;
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
RIDDERIV10d5:=d;
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
RIDDERIV10d6:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree3:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=157;
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
number:=-121;
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
RIDDERIV10d8:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY3:=d;
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
RIDDERIV10d9:=d;
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
RIDDERIV10d10:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree5:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=347;
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
number:=-218;
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
number:=359;
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
RIDDERIV10d11:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtreeKEY4:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=249;
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
number:=250;
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
number:=258;
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
                                                      function crdtree6:HYPERDTREE_pHyperdtree;
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
RIDDERIV10d12:=d;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree6:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=433;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
dson:=crdtree_9;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree6;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=2;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_10:=d;
END;
                                                      BEGIN
HYPERDTREE_emptynode(elts);
lsps:=NIL;
HYPERDTREE_NewHyperDtree(d);
number:=363;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.index:=-2-1;
params.index:=-2-1;
params.subst:=2;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV10delt7:=hypernodeelt;
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
number:=-222;
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
number:=366;
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
number:=130;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.index:=-1-1;
params.index:=-1-1;
params.subst:=2;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV10delt1:=hypernodeelt;
number:=132;
MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
params.index:=-1;params.subst:=-1;
params.index:=-1-1;
params.index:=-1-1;
params.subst:=2;
params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
HYPERDTREE_NewHyperDtreeRule(hypernodeelt,0,number,params);
HYPERDTREE_AddToNode(hypernodeelt,elts);
RIDDERIV10delt2:=hypernodeelt;
dson:=crdtree_2;
HYPERDTREE_AddToTuple(dson,d^.args);
dson:=crdtree_13;
HYPERDTREE_AddToTuple(dson,d^.args);
d^.nrofargs:=2;
HYPERDTREE_addcluster(elts,d^.elts);
crdtree_15:=d;
END;
                                                      BEGIN
crdtreeRIDDERIV10:=crdtree_15
END;
                                                       FUNCTION DECRIDDERIV10(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
 m4:LSSTREE_pstree;
 Is4:LISTREE_pstree;
BVERBREC1tree:LSSTREE_pStree;
T1:LSSTREE_pStree;
T2:LSSTREE_pStree;
T3:LSSTREE_pStree;
T4:LSSTREE_pStree;
BVERBREC1:LSDOMAINT_BVERBrecord;
SUBVERBREC1:LSDOMAINT_SUBVERBrecord;
CNVARREC2:LSDOMAINT_CNVARrecord;
CNVARREC1:LSDOMAINT_CNVARrecord;
NPVARREC3:LSDOMAINT_NPVARrecord;
NPVARREC2:LSDOMAINT_NPVARrecord;
NPVARREC1:LSDOMAINT_NPVARrecord;
PREPPPROPVARREC1:LSDOMAINT_PREPPPROPVARrecord;
FUNCTION matchcondM4:BOOLEAN;
                                                      BEGIN
matchcondM4:=FALSE;
  IF
          (((T3^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     
)
                                                      )
                                                      THEN 
matchcondM4:=TRUE;

END;{matchcondM4}
FUNCTION matchcondI4:BOOLEAN;
                                                      BEGIN
matchcondI4:=FALSE;
  IF
          (((T3^.CAT IN LSAUXDOM_VARCATSET                                    )                                                     
)
                                                      )
                                                      THEN 
matchcondI4:=TRUE;

END;{matchcondI4}
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
PROCEDURE createM4;
VAR list:LSMRUQUO_ListOfStrees;
  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN{createM}
m4:=T3;
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
T4:=s;
match:=TRUE;
END;
PROCEDURE createtree4(VAR s:LSSTREE_pstree);
VAR list:LSMRUQUO_listofstrees;
  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN
s:=T4;
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
                                                      PROCEDURE matchtree6(s:LSSTREE_pstree;VAR match:BOOLEAN);
                                                      BEGIN
T3:=s;
match:=TRUE;
IF match THEN match:= matchcondI4;
END;
PROCEDURE createtree6(VAR s:LSSTREE_pstree);
  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN
s:=T3;
END;
                                                      BEGIN
dtree:=dtreeRIDDERIV10;
match:=AIDDERIV_analyse(dtree,loopholes.retype(m,LISTREE_pstree));
X1:=RIDDERIV10delt1^.parameters.index;
X1:=RIDDERIV10delt2^.parameters.index;
hulplsstree:=loopholes.retype(
RIDDERIV10d3^.li^.stree,LSSTREE_pstree);
IF match THEN KEY2:=hulplsstree^.ls^.BVERBfield^.key;
                                                      hulplsstree:=loopholes.retype(
RIDDERIV10d4^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree1(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV10d5^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree2(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV10d6^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree3(hulplsstree,match);
                                                      X2:=RIDDERIV10delt7^.parameters.index;
hulplsstree:=loopholes.retype(
RIDDERIV10d8^.li^.stree,LSSTREE_pstree);
IF match THEN KEY3:=hulplsstree^.ls^.PREPfield^.key;
                                                      hulplsstree:=loopholes.retype(
RIDDERIV10d9^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree4(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV10d10^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree5(hulplsstree,match);
                                                      hulplsstree:=loopholes.retype(
RIDDERIV10d11^.li^.stree,LSSTREE_pstree);
IF match THEN KEY4:=hulplsstree^.ls^.BNOUNfield^.key;
                                                      hulplsstree:=loopholes.retype(
RIDDERIV10d12^.li^.stree,LSSTREE_pstree);
IF match THEN matchtree6(hulplsstree,match);
                                                      END;
                                                       FUNCTION subrule0X1 :LISTREE_SetOfTupleOfStrees;
 VAR result:LISTREE_SetOfTupleOfStrees;
 match,first:BOOLEAN;
FUNCTION MATCHCONDT2:BOOLEAN;
BEGIN MATCHCONDT2:=TRUE END;
FUNCTION MATCHCONDT4:BOOLEAN;
BEGIN MATCHCONDT4:=TRUE END;
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
                                                          PROCEDURE matchtreeT4(VAR match:BOOLEAN;first:BOOLEAN);
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
    s:= T4;
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
  createM4;
  END;
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
                                                      PROCEDURE ACTION24;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.argkeys[3]:=KEY4;
idargs.nrargs:=3;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID11))   ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      FUNCTION idargs1:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.argkeys[3]:=KEY4;
                                                      idargs.nrargs:=3;
idargs1:=
LIMATCHES_decompiniddict(idargs,ORD(VPID11))          END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT4(match,TRUE);
If match Then
WHILE match AND NOT matchcondT4 DO
BEGIN
MatchtreeT4(match,FALSE);
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
    action24;
    hulpstree:=LDBLEX_read(KEY1);
    BVERBREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    BVERBREC1:=BVERBREC1tree^.ls^.BVERBfield^;
    action24;
    createT2;
    previous1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(m2,LISTREE_pstree);
    LISTREE_addtotuple(Is2,tuple);
    Is3:=loopholes.retype(m3,LISTREE_pstree);
    LISTREE_addtotuple(Is3,tuple);
    Is4:=loopholes.retype(m4,LISTREE_pstree);
    LISTREE_addtotuple(Is4,tuple);
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
FUNCTION MATCHCONDT4:BOOLEAN;
BEGIN MATCHCONDT4:=TRUE END;
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
                                                          PROCEDURE matchtreeT4(VAR match:BOOLEAN;first:BOOLEAN);
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
    s:= T4;
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
  createM4;
  END;
  PROCEDURE createT2;
  BEGIN{T2}
  END{T2};
                                                      PROCEDURE ACTION33;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.argkeys[3]:=KEY4;
idargs.nrargs:=3;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID11))   ;
SUBVERBREC1:=COPYT_BVERBTOSUBVERB(BVERBREC1);         ;
                                                      ;wbonus:=0;sbonus:=0

END;
                                                      FUNCTION idargs1:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY2;
idargs.argkeys[2]:=KEY3;
idargs.argkeys[3]:=KEY4;
                                                      idargs.nrargs:=3;
idargs1:=
LIMATCHES_decompiniddict(idargs,ORD(VPID11))          END;
                                                       BEGIN
match:=TRUE;
 LISTREE_INITsetOFtupleOFstrees(result);
 matchtreeT2(match,TRUE);
If match Then
WHILE match AND NOT matchcondT2 DO
BEGIN
MatchtreeT2(match,FALSE);
END;
 IF match THEN matchtreeT4(match,TRUE);
If match Then
WHILE match AND NOT matchcondT4 DO
BEGIN
MatchtreeT4(match,FALSE);
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
    action33;
    hulpstree:=LDBLEX_read(KEY1);
    BVERBREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    BVERBREC1:=BVERBREC1tree^.ls^.BVERBfield^;
    action33;
    createT2;
    previous1;
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(m1,LISTREE_pstree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(m2,LISTREE_pstree);
    LISTREE_addtotuple(Is2,tuple);
    Is3:=loopholes.retype(m3,LISTREE_pstree);
    LISTREE_addtotuple(Is3,tuple);
    Is4:=loopholes.retype(m4,LISTREE_pstree);
    LISTREE_addtotuple(Is4,tuple);
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
DECRIDDERIV10:=result
END;
{:RIDDERIV10}
{rule:}
{:RIDDERIV12}
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
T1:LSSTREE_pStree;
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
T1:=s;
match:=first;
END;{matchmodel}
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
IF ((T1^.CAT<>T1^.CAT                                      )
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
                                                      DECRIDDERIV12:=result
END;
{:RIDDERIV12}
{rule:}
{:RIDNPFORMATION}
 FUNCTION DECRIDNPFORMATION(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
T1:LSSTREE_pStree;
MU1:LSMRUQUO_ListOfStrees;
CNREC1:LSDOMAINT_CNrecord;
NPREC1:LSDOMAINT_NPrecord;
FUNCTION matchcondM2:BOOLEAN;
                                                      BEGIN
matchcondM2:=FALSE;
  IF
          (((T1^.CAT IN [NPVAR,
CNVAR]                                                )                                                     )
                                                      )
                                                      THEN 
matchcondM2:=TRUE;

END;{matchcondM2}
FUNCTION matchcondI2:BOOLEAN;
                                                      BEGIN
matchcondI2:=FALSE;
  IF
          (((T1^.CAT IN [NPVAR,
CNVAR]                                                )                                                     )
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
  PROCEDURE createlist1(VAR wholelist:LSMRUQUO_ListOfStrees);
  BEGIN
  wholelist.first:=NIL;wholelist.last:=NIL;
  END;
                                                      BEGIN{createM}
m2:=T1;
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
    PROCEDURE Match_DETREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeConVar(Lfirst,Llast,first,DETREL,T1,match,matchcondI2,lastmatchM_1);
END;
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
(L,first,match,match_DETREL,matchlist1items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2) AND (s^.li^.n <=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,DETREL,HEAD,match,matchnode,matchlist2items,lastmatch) END;
                                                      PROCEDURE ACTION34;
BEGIN
;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION35;
BEGIN
;wbonus:=0;sbonus:=0

END;
                                                      FUNCTION except1:BOOLEAN;
VAR result:BOOLEAN;
CNREC1loc:LSDOMAINT_NPrecord;
BEGIN
CNREC1loc:=COPYT_CNTONP(CNREC1);
result:=TRUE
AND
(NPREC1.req=CNREC1loc.req)AND
(NPREC1.env=CNREC1loc.env)AND
(NPREC1.superdeixis=CNREC1loc.superdeixis)AND
(NPREC1.class=CNREC1loc.class)AND
(NPREC1.deixis=CNREC1loc.deixis)AND
(NPREC1.aspect=CNREC1loc.aspect)AND
(NPREC1.retro=CNREC1loc.retro)AND
(NPREC1.person=CNREC1loc.person)AND
(NPREC1.number=CNREC1loc.number)AND
(NPREC1.cases=CNREC1loc.cases)AND
(NPREC1.genders=CNREC1loc.genders)AND
(NPREC1.sexes=CNREC1loc.sexes)AND
(NPREC1.actsubcs=CNREC1loc.actsubcs)AND
(NPREC1.temporal=CNREC1loc.temporal)AND
(NPREC1.animate=CNREC1loc.animate)AND
(NPREC1.human=CNREC1loc.human)AND
(NPREC1.thetanp=CNREC1loc.thetanp)AND
(NPREC1.nounpatternefs=CNREC1loc.nounpatternefs)AND
(NPREC1.poss=CNREC1loc.poss)AND
(NPREC1.coord=CNREC1loc.coord)
;except1:=result
END;
                                                      FUNCTION casefile2:BOOLEAN;
BEGIN IF
T1^.cat IN [
NPVAR,CNVAR] THEN CASE T1^.cat OF
NPVAR:casefile2:=(NPREC1.DEFINITE =                                     T1^.ls^.NPVARfield^.DEFINITE);
CNVAR:casefile2:=(NPREC1.DEFINITE =                                     T1^.ls^.CNVARfield^.DEFINITE);
END
END;
                                                      FUNCTION casefile3:BOOLEAN;
BEGIN IF
T1^.cat IN [
NPVAR] THEN CASE T1^.cat OF
NPVAR:casefile3:=(T1^.ls^.NPVARfield^.MOOD =NPREC1.MOOD                                         );
END
END;
                                                      FUNCTION except4:BOOLEAN;
VAR result:BOOLEAN;
CNREC1loc:LSDOMAINT_NPrecord;
BEGIN
CNREC1loc:=COPYT_CNTONP(CNREC1);
result:=TRUE
AND
(NPREC1.req=CNREC1loc.req)AND
(NPREC1.env=CNREC1loc.env)AND
(NPREC1.superdeixis=CNREC1loc.superdeixis)AND
(NPREC1.class=CNREC1loc.class)AND
(NPREC1.deixis=CNREC1loc.deixis)AND
(NPREC1.aspect=CNREC1loc.aspect)AND
(NPREC1.retro=CNREC1loc.retro)AND
(NPREC1.person=CNREC1loc.person)AND
(NPREC1.number=CNREC1loc.number)AND
(NPREC1.cases=CNREC1loc.cases)AND
(NPREC1.genders=CNREC1loc.genders)AND
(NPREC1.sexes=CNREC1loc.sexes)AND
(NPREC1.actsubcs=CNREC1loc.actsubcs)AND
(NPREC1.temporal=CNREC1loc.temporal)AND
(NPREC1.animate=CNREC1loc.animate)AND
(NPREC1.human=CNREC1loc.human)AND
(NPREC1.thetanp=CNREC1loc.thetanp)AND
(NPREC1.nounpatternefs=CNREC1loc.nounpatternefs)AND
(NPREC1.poss=CNREC1loc.poss)AND
(NPREC1.coord=CNREC1loc.coord)
;except4:=result
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
IF ((except1                                               )
                                                      )
THEN IF
          ((NPREC1.ACTCOMAS =CNREC1.POSSCOMAS                     )
                                                      )
THEN IF
          ((casefile2                                             )
                                                      )
THEN IF
          ((NPREC1.POSSPRED =TRUE                                 )
                                                      )
THEN IF
          ((NPREC1.GENERIC =NOGENERIC                             )
                                                      )
THEN IF
          ((NPREC1.CASES =[]                                                    )
                                                      )
THEN IF
          ((NPREC1.SPECQ =YESSPEC                                 )
                                                      )
THEN IF
          (((T1^.cat IN [NPVAR]                                               ) AND 
((casefile3                                             )
                                                      )
                                                      )
                                                      )
                                                       THEN
  BEGIN
  action34;
  createM1;
  createM2;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  Is2:=loopholes.retype(m2,LISTREE_pstree);
  LISTREE_addtotuple(Is2,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
IF (((T1^.CAT IN [CNVAR]                                               )                                                     )
                                                      )
THEN IF
          ((except4                                               )
                                                      )
THEN IF
          ((NPREC1.ACTCOMAS =CNREC1.POSSCOMAS                     )
                                                      )
THEN IF
          ((NPREC1.DEFINITE =DEF                                  )
                                                      )
THEN IF
          ((NPREC1.POSSPRED =TRUE                                 )
                                                      )
THEN IF
          ((NPREC1.GENERIC =NOGENERIC                             )
                                                      )
THEN IF
          ((NPREC1.CASES =[]                                                    )
                                                      )
THEN IF
          ((NPREC1.SPECQ =YESSPEC                                 )
                                                      )
THEN IF
          ((NPREC1.MOOD =NOWH                                     )
                                                      )
                                                       THEN
  BEGIN
  action35;
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
                                                      DECRIDNPFORMATION:=result
END;
{:RIDNPFORMATION}
{rule:}
{:TIDCLAUSETOVPPROP}
 FUNCTION DECTIDCLAUSETOVPPROP(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
MU1:LSMRUQUO_ListOfStrees;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
VERBPPROPREC1:LSDOMAINT_VERBPPROPrecord;
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
  BEGIN{createlist1}
LSMATCHES_createlist1items0(wholelist,createitem11);
  END{createlist1};
                                                      BEGIN{createM}
m1:=MAKET_stree(CLAUSE);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
LlastM_1:=L;WHILE LlastM_1^.brother<>NIL DO
LlastM_1:=LlastM_1^.brother;
match_MU1(L,LlastM_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist1items,lastmatch) END;
                                                      PROCEDURE ACTION3;
BEGIN
CLAUSEREC1:=COPYT_VERBPPROPTOCLAUSE(VERBPPROPREC1);   ;
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
  MAKET_CLAUSErec(CLAUSEREC1);
  action3;
  createM1;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
                                                        END;
                                                      DECTIDCLAUSETOVPPROP:=result
END;
{:TIDCLAUSETOVPPROP}
{rule:}
{:TIDVPPROPTOCLAUSE}
 FUNCTION DECTIDVPPROPTOCLAUSE(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
MU1:LSMRUQUO_ListOfStrees;
VERBPPROPREC1:LSDOMAINT_VERBPPROPrecord;
CLAUSEREC1:LSDOMAINT_CLAUSErecord;
PROCEDURE createM1;
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
m1:=MAKET_stree(VERBPPROP);
createnode(m1);
createlist1(list);
IF list.first<>NIL THEN list.last^.brother:=NIL;
m1^.li^.n:=numberofelements(list);
m1^.sons:=list.first;
END{createM};
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
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
LlastM_1:=L;WHILE LlastM_1^.brother<>NIL DO
LlastM_1:=LlastM_1^.brother;
match_MU1(L,LlastM_1,TRUE,match) END END ELSE match:=FALSE END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
LSMATCHES_matchtreeVar0rels(s,first,match,matchnode,matchlist1items,lastmatch) END;
                                                      PROCEDURE ACTION3;
BEGIN
VERBPPROPREC1:=COPYT_CLAUSETOVERBPPROP(CLAUSEREC1);   ;
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
  MAKET_VERBPPROPrec(VERBPPROPREC1);
  action3;
  createM1;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
                                                        END;
                                                      DECTIDVPPROPTOCLAUSE:=result
END;
{:TIDVPPROPTOCLAUSE}
{rule:}
{:RIDSTARTVPPROP1VAR2ID0}
 FUNCTION DECRIDSTARTVPPROP1VAR2ID0(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
LinitM_2_1_1_1,LrestM_2_1_1_1,LfirstM_2_1_1_1,LlastM_2_1_1_1:LSSTREE_prelnode;
iM_2_1_1_1:INTEGER;
nomoretreesM_2_1_1_1,lastmatchM_2_1_1_1:BOOLEAN;
LinitM_2_2,LrestM_2_2,LfirstM_2_2,LlastM_2_2:LSSTREE_prelnode;
iM_2_2:INTEGER;
nomoretreesM_2_2,lastmatchM_2_2:BOOLEAN;
LinitM_2_2_1,LrestM_2_2_1,LfirstM_2_2_1,LlastM_2_2_1:LSSTREE_prelnode;
iM_2_2_1:INTEGER;
nomoretreesM_2_2_1,lastmatchM_2_2_1:BOOLEAN;
LinitM_2_2_1_1,LrestM_2_2_1_1,LfirstM_2_2_1_1,LlastM_2_2_1_1:LSSTREE_prelnode;
iM_2_2_1_1:INTEGER;
nomoretreesM_2_2_1_1,lastmatchM_2_2_1_1:BOOLEAN;
LinitM_2_2_2,LrestM_2_2_2,LfirstM_2_2_2,LlastM_2_2_2:LSSTREE_prelnode;
iM_2_2_2:INTEGER;
nomoretreesM_2_2_2,lastmatchM_2_2_2:BOOLEAN;
LinitM_2_2_2_1,LrestM_2_2_2_1,LfirstM_2_2_2_1,LlastM_2_2_2_1:LSSTREE_prelnode;
iM_2_2_2_1:INTEGER;
nomoretreesM_2_2_2_1,lastmatchM_2_2_2_1:BOOLEAN;
LinitM_2_2_2_1_1,LrestM_2_2_2_1_1,LfirstM_2_2_2_1_1,LlastM_2_2_2_1_1:LSSTREE_prelnode;
iM_2_2_2_1_1:INTEGER;
nomoretreesM_2_2_2_1_1,lastmatchM_2_2_2_1_1:BOOLEAN;
LinitM_2_2_2_1_1_1,LrestM_2_2_2_1_1_1,LfirstM_2_2_2_1_1_1,LlastM_2_2_2_1_1_1:LSSTREE_prelnode;
iM_2_2_2_1_1_1:INTEGER;
nomoretreesM_2_2_2_1_1_1,lastmatchM_2_2_2_1_1_1:BOOLEAN;
 m1:LSSTREE_pstree;
 Is1:LISTREE_pstree;
 m2:LSSTREE_pstree;
 Is2:LISTREE_pstree;
BVERBREC1tree:LSSTREE_pStree;
T1:LSSTREE_pStree;
BVERBREC2tree:LSSTREE_pStree;
ARTREC1tree:LSSTREE_pStree;
BNOUNREC1tree:LSSTREE_pStree;
BVERBREC1:LSDOMAINT_BVERBrecord;
BNOUNREC1:LSDOMAINT_BNOUNrecord;
SUBNOUNREC1:LSDOMAINT_SUBNOUNrecord;
NOUNREC1:LSDOMAINT_NOUNrecord;
CNREC1:LSDOMAINT_CNrecord;
ARTREC1:LSDOMAINT_ARTrecord;
DETPREC1:LSDOMAINT_DETPrecord;
NPREC1:LSDOMAINT_NPrecord;
BVERBREC2:LSDOMAINT_BVERBrecord;
SUBVERBREC1:LSDOMAINT_SUBVERBrecord;
VERBREC1:LSDOMAINT_VERBrecord;
VERBPREC1:LSDOMAINT_VERBPrecord;
VERBPPROPREC1:LSDOMAINT_VERBPPROPrecord;
FUNCTION matchcondI5:BOOLEAN;
                                                      BEGIN
matchcondI5:=FALSE;
  IF
          (((VERBREC1.THETAVP=VP120) AND 
          (VERBREC1.NUMBERS=[]                                                    ) AND 
                    (VERBREC1.PERSONS=[]                                                    ) AND 
                    (VERBREC1.MODUS=OMEGAMODUS) AND 
          (VERBREC1.TENSE=OMEGATENSE) AND 
          TRUE
                                                      )
                                                      )
                                                      THEN 
matchcondI5:=TRUE;

END;{matchcondI5}
FUNCTION matchcondI4:BOOLEAN;
                                                      BEGIN
matchcondI4:=FALSE;
  IF
          (((VERBPPROPREC1.THETAVP=VP120) AND 
          (VERBPPROPREC1.REQ=[POSPOL,
NEGPOL,
OMEGAPOL]                                             ) AND 
                    (VERBPPROPREC1.ENV=[POSPOL,
NEGPOL,
OMEGAPOL]                                             ) AND 
                    (VERBPPROPREC1.SUPERDEIXIS=OMEGADEIXIS) AND 
          (VERBPPROPREC1.PROSUBJECT=FALSE) AND 
          (VERBPPROPREC1.VOICE=OMEGAVOICE) AND 
          (VERBPPROPREC1.SYNVPEFS=[SYNNP]                                               ) AND 
                    (VERBPPROPREC1.AKTIONSARTS=[]                                                    ) AND 
                    TRUE
                                                      )
                                                      )
                                                      THEN 
matchcondI4:=TRUE;

END;{matchcondI4}
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
                                                      PROCEDURE MatchModel(VAR s:LSSTREE_pStree;first:BOOLEAN;VAR match:Boolean);
VAR
  lisons:LISTREE_pRelnode;
  lirel1:LIDOMAINT_synrel;
  lsrel1:LSDOMAINT_synrel;
  lirel2:LIDOMAINT_synrel;
  lsrel2:LSDOMAINT_synrel;
  PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
  BEGIN{MatchNode}
    IF s^.ls^.cat<>VERBPPROP THEN
      match:=FALSE;
    IF match THEN
      VERBPPROPREC1:=s^.ls^.VERBPPROPfield^;
    IF match THEN
      match:= matchcondI4;
  END{MatchNode};
                                                        PROCEDURE MatchList2Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
  VAR
    itemmatch,listmatch:Boolean;
    PROCEDURE Match_SUBJREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
                                                      BEGIN{MatchTree}
        LSMATCHES_matchtreeConVar(Lfirst,Llast,first,SUBJREL,T1,match,matchcondI2,lastmatchM_1);
END;
                                                          PROCEDURE MatchList1Items
(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR
      itemmatch,listmatch:Boolean;
    PROCEDURE Match_PREDREL(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
    VAR matchcond:BOOLEAN;
      Stree:LSSTREE_pStree;
      lisons:LISTREE_pRelnode;
      lirel1:LIDOMAINT_synrel;
      lsrel1:LSDOMAINT_synrel;
      lirel2:LIDOMAINT_synrel;
      lsrel2:LSDOMAINT_synrel;
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
        PROCEDURE Match_HEAD(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);
        VAR matchcond:BOOLEAN;
          Stree:LSSTREE_pStree;
          lisons:LISTREE_pRelnode;
          lirel1:LIDOMAINT_synrel;
          lsrel1:LSDOMAINT_synrel;
          PROCEDURE MatchNode(s:LSSTREE_pStree;VAR match:Boolean);
          BEGIN{MatchNode}
            IF s^.ls^.cat<>VERB THEN
              match:=FALSE;
            IF match THEN
              VERBREC1:=s^.ls^.VERBfield^;
            IF match THEN
              match:= matchcondI5;
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
                      BVERBREC2:=s^.ls^.BVERBfield^;
                    IF match THEN KEY3:=s^.ls^.BVERBfield^.key;
                  END{MatchNode};
                                                      BEGIN{MatchTree}
                                        BVERBREC2tree:=Lfirst^.node;
                      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchM_2_1_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM_2_1_1_1,LfirstM_2_1_1_1,LrestM_2_1_1_1,nomoretreesM_2_1_1_1) END;
                                                      BEGIN{MatchTree}
                                  IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)
ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist1items,lastmatchM_2_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM_2_1_1,LfirstM_2_1_1,LrestM_2_1_1,nomoretreesM_2_1_1) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1
)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist1items,lastmatchM_2_1) END;
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
                    IF s^.ls^.cat<>ART THEN
                      match:=FALSE;
                    IF match THEN
                      ARTREC1:=s^.ls^.ARTfield^;
                    IF match THEN KEY4:=s^.ls^.ARTfield^.key;
                  END{MatchNode};
                                                      BEGIN{MatchTree}
                                        ARTREC1tree:=Lfirst^.node;
                      IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchM_2_2_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM_2_2_1_1,LfirstM_2_2_1_1,LrestM_2_2_1_1,nomoretreesM_2_2_1_1) END;
                                                      BEGIN{MatchTree}
                                  IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)
ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,DETREL
,HEAD,match,matchnode,matchlist1items,lastmatchM_2_2_1) END;
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
                            IF match THEN KEY2:=s^.ls^.BNOUNfield^.key;
                          END{MatchNode};
                                                      BEGIN{MatchTree}
                                                        BNOUNREC1tree:=Lfirst^.node;
                              IF first THEN match:= (Lfirst^.node^.li^.n <=0)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree0rels(Lfirst,Llast,first,HEAD
,match,matchnode,matchlist0items,lastmatchM_2_2_2_1_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM_2_2_2_1_1_1,LfirstM_2_2_2_1_1_1,LrestM_2_2_2_1_1_1,nomoretreesM_2_2_2_1_1_1) END;
                                                      BEGIN{MatchTree}
                                                  IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)
ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist1items,lastmatchM_2_2_2_1_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM_2_2_2_1_1,LfirstM_2_2_2_1_1,LrestM_2_2_2_1_1,nomoretreesM_2_2_2_1_1) END;
                                                      BEGIN{MatchTree}
                                          IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)
ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist1items,lastmatchM_2_2_2_1) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM_2_2_2_1,LfirstM_2_2_2_1,LrestM_2_2_2_1,nomoretreesM_2_2_2_1) END;
                                                      BEGIN{MatchTree}
                                  IF first THEN match:= (Lfirst^.node^.li^.n >=1) AND (Lfirst^.node^.li^.n <=1)
ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree1rels(Lfirst,Llast,first,HEAD
,HEAD,match,matchnode,matchlist1items,lastmatchM_2_2_2) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist0items,
LlastM_2_2_2,LfirstM_2_2_2,LrestM_2_2_2,nomoretreesM_2_2_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_DETREL,matchlist1items,
LlastM_2_2_1,LfirstM_2_2_1,LrestM_2_2_1,nomoretreesM_2_2_1) END;
                                                      BEGIN{MatchTree}
                          IF first THEN match:= (Lfirst^.node^.li^.n >=2) AND (Lfirst^.node^.li^.n <=2
)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree2rels(Lfirst,Llast,first,OBJREL
,DETREL,HEAD,match,matchnode,matchlist2items,lastmatchM_2_2) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_OBJREL,matchlist0items,
LlastM_2_2,LfirstM_2_2,LrestM_2_2,nomoretreesM_2_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_HEAD,matchlist1items,
LlastM_2_1,LfirstM_2_1,LrestM_2_1,nomoretreesM_2_1) END;
                                                      BEGIN{MatchTree}
                  IF first THEN match:= (Lfirst^.node^.li^.n >=2) AND (Lfirst^.node^.li^.n <=2)ELSE match:=TRUE;IF match THEN
LSMATCHES_matchtree2rels(Lfirst,Llast,first,PREDREL
,HEAD,OBJREL,match,matchnode,matchlist2items,lastmatchM_2) END;
                                                      BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_PREDREL,matchlist0items,
LlastM_2,LfirstM_2,LrestM_2,nomoretreesM_2) END;
BEGIN LSMATCHES_matchlistreltree
(L,first,match,match_SUBJREL,matchlist1items,
LlastM_1,LfirstM_1,LrestM_1,nomoretreesM_1) END;
                                                      VAR lastmatch:BOOLEAN;
BEGIN{matchmodel}
IF first THEN match:= (s^.li^.n >=2) AND (s^.li^.n <=2)ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;
IF match THEN
LSMATCHES_matchtreeVar2rels(s,first,SUBJREL,PREDREL,match,matchnode,matchlist2items,lastmatch) END;
                                                      PROCEDURE ACTION26;
BEGIN
;wbonus:=0;sbonus:=0

END;
                                                      PROCEDURE ACTION27;
BEGIN
idargs.argkeys[1]:=KEY3;
idargs.argkeys[2]:=KEY4;
idargs.argkeys[3]:=KEY2;
idargs.nrargs:=3;
KEY1:=LIMATCHES_DECOMPGETIDDICT(idargs,ORD(VPID2))    
END;
                                                      FUNCTION idargs1:BOOLEAN;
BEGIN
idargs.argkeys[1]:=KEY3;
idargs.argkeys[2]:=KEY4;
idargs.argkeys[3]:=KEY2;
                                                      idargs.nrargs:=3;
idargs1:=
LIMATCHES_decompiniddict(idargs,ORD(VPID2))           END;
                                                      FUNCTION except2:BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result:=COPYX_BVERBTOSUBVERB(
SUBVERBREC1,BVERBREC2);

;except2:=result
END;
                                                      FUNCTION except3:BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result:=COPYX_SUBVERBTOVERB(
VERBREC1,SUBVERBREC1);

;except3:=result
END;
                                                      FUNCTION except4:BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result:=COPYX_BNOUNTOSUBNOUN(
SUBNOUNREC1,BNOUNREC1);

;except4:=result
END;
                                                      FUNCTION except5:BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result:=COPYX_SUBNOUNTONOUN(
NOUNREC1,SUBNOUNREC1);

;except5:=result
END;
                                                      FUNCTION except6:BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result:=COPYX_NOUNTOCN(
CNREC1,NOUNREC1);

;except6:=result
END;
                                                      FUNCTION except7:BOOLEAN;
VAR result:BOOLEAN;
CNREC1loc:LSDOMAINT_NPrecord;
BEGIN
CNREC1loc:=COPYT_CNTONP(CNREC1);
result:=TRUE
AND
(NPREC1.req=CNREC1loc.req)AND
(NPREC1.env=CNREC1loc.env)AND
(NPREC1.superdeixis=CNREC1loc.superdeixis)AND
(NPREC1.class=CNREC1loc.class)AND
(NPREC1.deixis=CNREC1loc.deixis)AND
(NPREC1.aspect=CNREC1loc.aspect)AND
(NPREC1.retro=CNREC1loc.retro)AND
(NPREC1.cases=CNREC1loc.cases)AND
(NPREC1.genders=CNREC1loc.genders)AND
(NPREC1.sexes=CNREC1loc.sexes)AND
(NPREC1.actsubcs=CNREC1loc.actsubcs)AND
(NPREC1.temporal=CNREC1loc.temporal)AND
(NPREC1.animate=CNREC1loc.animate)AND
(NPREC1.human=CNREC1loc.human)AND
(NPREC1.thetanp=CNREC1loc.thetanp)AND
(NPREC1.nounpatternefs=CNREC1loc.nounpatternefs)AND
(NPREC1.poss=CNREC1loc.poss)AND
(NPREC1.coord=CNREC1loc.coord)
;except7:=result
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
IF ((idargs1                                               )
                                                      )
                                                       THEN
  BEGIN
  IF ((except2                                               )
                                                      )
THEN IF
          ((except3                                               )
                                                      )
THEN IF
          ((except4                                               )
                                                      )
THEN IF
          ((except5                                               )
                                                      )
THEN IF
          ((except6                                               )
                                                      )
THEN IF
          ((except7                                               )
                                                      )
THEN IF
          ((NPREC1.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
THEN IF
          ((NPREC1.GENERIC =OMEGAGENERIC                          )
                                                      )
THEN IF
          ((CNREC1.SUPERDEIXIS =OMEGADEIXIS                       )
                                                      )
                                                       THEN
    BEGIN
    MAKET_BVERBrec(BVERBREC1);
    action26;
    action27;
    hulpstree:=LDBLEX_read(KEY1);
    BVERBREC1tree:=loopholes.retype(hulpstree,LSSTREE_pstree);
    BVERBREC1:=BVERBREC1tree^.ls^.BVERBfield^;
    action26;
    action27;
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
                                                      DECRIDSTARTVPPROP1VAR2ID0:=result
END;
{:RIDSTARTVPPROP1VAR2ID0}
{rule:}
{:TISIDIOM}
 FUNCTION DECTISIDIOM(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
T1:=s;
match:=first;
END;{matchmodel}
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
  action1;
  createM1;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
                                                        END;
                                                      DECTISIDIOM:=result
END;
{:TISIDIOM}
{rule:}
{:TISNOTIDIOM}
 FUNCTION DECTISNOTIDIOM(Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;
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
T1:=s;
match:=first;
END;{matchmodel}
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
  action1;
  createM1;
  LISTREE_emptytuple(tuple);
  Is1:=loopholes.retype(m1,LISTREE_pstree);
  LISTREE_addtotuple(Is1,tuple);
  LISTREE_appendtupleofstreesbon(tuple,result,wbonus);
  END;
                                                        END;
                                                      DECTISNOTIDIOM:=result
END;
{:TISNOTIDIOM}
