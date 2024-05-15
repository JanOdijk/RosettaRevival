EXPORT(ldsurfswitch);pragma C_include('items.pf');
pragma C_include('mem.pf');
pragma C_include('ldsurfswitch.pf');
pragma C_include('lsrulepars.pf');
pragma C_include('liprims.pf');
pragma C_include('listree.pf');
pragma C_include('lsstree.pf');
pragma C_include('surfrulesblocks.pf');
PROGRAM LDSURFSWITCH;
WITH items,mem,lsrulepars,liprims,listree,lsstree,surfrulesblocks;
 FUNCTION LDSURFSWITCH_body(int1,int2:INTEGER;params:ITEMS_params;stree:LISTREE_pstree):BOOLEAN;
BEGIN CASE int1 OF
1:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
UTT_0(loopholes.retype(params,UTTtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
UTT_1(loopholes.retype(params,UTTtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
UTT_2(loopholes.retype(params,UTTtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
UTT_3(loopholes.retype(params,UTTtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
UTT_4(loopholes.retype(params,UTTtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
2:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
VCOMPLEX_0(loopholes.retype(params,VCOMPLEXtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_1(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_2(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_3(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_4(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_5(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_6(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
7:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_7(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
8:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_8(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
9:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_9(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
10:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_10(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
11:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_11(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
12:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_12(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
13:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_13(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
14:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_14(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
15:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_15(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
16:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_16(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
17:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_17(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
18:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_18(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
19:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_19(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
20:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_20(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
21:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_21(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
22:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_22(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
23:BEGIN LDSURFSWITCH_body:=
VCOMPLEX_23(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
3:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
VP_0(loopholes.retype(params,VPtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
VP_1(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
VP_2(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
VP_3(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
VP_4(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
VP_5(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
VP_6(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
7:BEGIN LDSURFSWITCH_body:=
VP_7(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
8:BEGIN LDSURFSWITCH_body:=
VP_8(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
9:BEGIN LDSURFSWITCH_body:=
VP_9(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
10:BEGIN LDSURFSWITCH_body:=
VP_10(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
11:BEGIN LDSURFSWITCH_body:=
VP_11(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
12:BEGIN LDSURFSWITCH_body:=
VP_12(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
13:BEGIN LDSURFSWITCH_body:=
VP_13(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
14:BEGIN LDSURFSWITCH_body:=
VP_14(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
15:BEGIN LDSURFSWITCH_body:=
VP_15(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
16:BEGIN LDSURFSWITCH_body:=
VP_16(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
17:BEGIN LDSURFSWITCH_body:=
VP_17(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
18:BEGIN LDSURFSWITCH_body:=
VP_18(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
19:BEGIN LDSURFSWITCH_body:=
VP_19(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
20:BEGIN LDSURFSWITCH_body:=
VP_20(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
21:BEGIN LDSURFSWITCH_body:=
VP_21(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
22:BEGIN LDSURFSWITCH_body:=
VP_22(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
23:BEGIN LDSURFSWITCH_body:=
VP_23(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
24:BEGIN LDSURFSWITCH_body:=
VP_24(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
25:BEGIN LDSURFSWITCH_body:=
VP_25(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
26:BEGIN LDSURFSWITCH_body:=
VP_26(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
27:BEGIN LDSURFSWITCH_body:=
VP_27(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
28:BEGIN LDSURFSWITCH_body:=
VP_28(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
29:BEGIN LDSURFSWITCH_body:=
VP_29(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
30:BEGIN LDSURFSWITCH_body:=
VP_30(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
31:BEGIN LDSURFSWITCH_body:=
VP_31(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
32:BEGIN LDSURFSWITCH_body:=
VP_32(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
33:BEGIN LDSURFSWITCH_body:=
VP_33(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
34:BEGIN LDSURFSWITCH_body:=
VP_34(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
35:BEGIN LDSURFSWITCH_body:=
VP_35(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
36:BEGIN LDSURFSWITCH_body:=
VP_36(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
37:BEGIN LDSURFSWITCH_body:=
VP_37(loopholes.retype(params,VPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
4:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
NP1RULE_0(loopholes.retype(params,NP1RULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
NP1RULE_1(loopholes.retype(params,NP1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
NP1RULE_2(loopholes.retype(params,NP1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
NP1RULE_3(loopholes.retype(params,NP1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
NP1RULE_4(loopholes.retype(params,NP1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
NP1RULE_5(loopholes.retype(params,NP1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
NP1RULE_6(loopholes.retype(params,NP1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
5:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
NP1ARULE_0(loopholes.retype(params,NP1ARULEtyp)); END;
2:BEGIN LDSURFSWITCH_body:=
NP1ARULE_2(loopholes.retype(params,NP1ARULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
NP1ARULE_4(loopholes.retype(params,NP1ARULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
6:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
NP2RULE_0(loopholes.retype(params,NP2RULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
NP2RULE_1(loopholes.retype(params,NP2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
NP2RULE_2(loopholes.retype(params,NP2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
NP2RULE_3(loopholes.retype(params,NP2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
NP2RULE_4(loopholes.retype(params,NP2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
NP2RULE_5(loopholes.retype(params,NP2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
NP2RULE_6(loopholes.retype(params,NP2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
7:BEGIN LDSURFSWITCH_body:=
NP2RULE_7(loopholes.retype(params,NP2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
8:BEGIN LDSURFSWITCH_body:=
NP2RULE_8(loopholes.retype(params,NP2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
7:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
NP3RULE_0(loopholes.retype(params,NP3RULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
NP3RULE_1(loopholes.retype(params,NP3RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
NP3RULE_2(loopholes.retype(params,NP3RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
8:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
NP4RULE_0(loopholes.retype(params,NP4RULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
NP4RULE_1(loopholes.retype(params,NP4RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
9:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
NP5RULE_0(loopholes.retype(params,NP5RULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
NP5RULE_1(loopholes.retype(params,NP5RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
10:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
NP6RULE_0(loopholes.retype(params,NP6RULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
NP6RULE_1(loopholes.retype(params,NP6RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
NP6RULE_2(loopholes.retype(params,NP6RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
NP6RULE_3(loopholes.retype(params,NP6RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
NP6RULE_4(loopholes.retype(params,NP6RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
11:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
NP7RULE_0(loopholes.retype(params,NP7RULEtyp)); END;
2:BEGIN LDSURFSWITCH_body:=
NP7RULE_2(loopholes.retype(params,NP7RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
NP7RULE_4(loopholes.retype(params,NP7RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
12:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
DETPRULE_0(loopholes.retype(params,DETPRULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
DETPRULE_1(loopholes.retype(params,DETPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
DETPRULE_2(loopholes.retype(params,DETPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
DETPRULE_3(loopholes.retype(params,DETPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
12:BEGIN LDSURFSWITCH_body:=
DETPRULE_12(loopholes.retype(params,DETPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
DETPRULE_4(loopholes.retype(params,DETPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
DETPRULE_5(loopholes.retype(params,DETPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
DETPRULE_6(loopholes.retype(params,DETPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
7:BEGIN LDSURFSWITCH_body:=
DETPRULE_7(loopholes.retype(params,DETPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
8:BEGIN LDSURFSWITCH_body:=
DETPRULE_8(loopholes.retype(params,DETPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
9:BEGIN LDSURFSWITCH_body:=
DETPRULE_9(loopholes.retype(params,DETPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
10:BEGIN LDSURFSWITCH_body:=
DETPRULE_10(loopholes.retype(params,DETPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
11:BEGIN LDSURFSWITCH_body:=
DETPRULE_11(loopholes.retype(params,DETPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
13:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
DETP2RULE_0(loopholes.retype(params,DETP2RULEtyp)); END;
2:BEGIN LDSURFSWITCH_body:=
DETP2RULE_2(loopholes.retype(params,DETP2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
14:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
CN1RULE_0(loopholes.retype(params,CN1RULEtyp)); END;
2:BEGIN LDSURFSWITCH_body:=
CN1RULE_2(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
CN1RULE_3(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
CN1RULE_4(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
CN1RULE_5(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
12:BEGIN LDSURFSWITCH_body:=
CN1RULE_12(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
14:BEGIN LDSURFSWITCH_body:=
CN1RULE_14(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
15:BEGIN LDSURFSWITCH_body:=
CN1RULE_15(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
CN1RULE_6(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
13:BEGIN LDSURFSWITCH_body:=
CN1RULE_13(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
8:BEGIN LDSURFSWITCH_body:=
CN1RULE_8(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
9:BEGIN LDSURFSWITCH_body:=
CN1RULE_9(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
11:BEGIN LDSURFSWITCH_body:=
CN1RULE_11(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
15:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
CN2RULE_0(loopholes.retype(params,CN2RULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
CN2RULE_1(loopholes.retype(params,CN2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
CN2RULE_2(loopholes.retype(params,CN2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
CN2RULE_3(loopholes.retype(params,CN2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
CN2RULE_4(loopholes.retype(params,CN2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
CN2RULE_6(loopholes.retype(params,CN2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
16:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
PREPP_0(loopholes.retype(params,PREPPtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
PREPP_1(loopholes.retype(params,PREPPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
PREPP_2(loopholes.retype(params,PREPPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
PREPP_3(loopholes.retype(params,PREPPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
PREPP_4(loopholes.retype(params,PREPPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
PREPP_5(loopholes.retype(params,PREPPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
PREPP_6(loopholes.retype(params,PREPPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
7:BEGIN LDSURFSWITCH_body:=
PREPP_7(loopholes.retype(params,PREPPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
8:BEGIN LDSURFSWITCH_body:=
PREPP_8(loopholes.retype(params,PREPPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
9:BEGIN LDSURFSWITCH_body:=
PREPP_9(loopholes.retype(params,PREPPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
10:BEGIN LDSURFSWITCH_body:=
PREPP_10(loopholes.retype(params,PREPPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
11:BEGIN LDSURFSWITCH_body:=
PREPP_11(loopholes.retype(params,PREPPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
12:BEGIN LDSURFSWITCH_body:=
PREPP_12(loopholes.retype(params,PREPPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
13:BEGIN LDSURFSWITCH_body:=
PREPP_13(loopholes.retype(params,PREPPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
17:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
RADVP_0(loopholes.retype(params,RADVPtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
RADVP_1(loopholes.retype(params,RADVPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
18:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
ADVP_0(loopholes.retype(params,ADVPtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
ADVP_1(loopholes.retype(params,ADVPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
ADVP_2(loopholes.retype(params,ADVPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
ADVP_3(loopholes.retype(params,ADVPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
ADVP_4(loopholes.retype(params,ADVPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
44:BEGIN LDSURFSWITCH_body:=
ADVP_44(loopholes.retype(params,ADVPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
ADVP_5(loopholes.retype(params,ADVPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
ADVP_6(loopholes.retype(params,ADVPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
7:BEGIN LDSURFSWITCH_body:=
ADVP_7(loopholes.retype(params,ADVPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
8:BEGIN LDSURFSWITCH_body:=
ADVP_8(loopholes.retype(params,ADVPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
9:BEGIN LDSURFSWITCH_body:=
ADVP_9(loopholes.retype(params,ADVPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
19:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
DATUMNP_0(loopholes.retype(params,DATUMNPtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
DATUMNP_1(loopholes.retype(params,DATUMNPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
DATUMNP_2(loopholes.retype(params,DATUMNPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
DATUMNP_3(loopholes.retype(params,DATUMNPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
DATUMNP_4(loopholes.retype(params,DATUMNPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
DATUMNP_5(loopholes.retype(params,DATUMNPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
DATUMNP_6(loopholes.retype(params,DATUMNPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
7:BEGIN LDSURFSWITCH_body:=
DATUMNP_7(loopholes.retype(params,DATUMNPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
8:BEGIN LDSURFSWITCH_body:=
DATUMNP_8(loopholes.retype(params,DATUMNPtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
20:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
NPCARDRULE_0(loopholes.retype(params,NPCARDRULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
NPCARDRULE_1(loopholes.retype(params,NPCARDRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
21:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
ADJP1SRULE_0(loopholes.retype(params,ADJP1SRULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
ADJP1SRULE_1(loopholes.retype(params,ADJP1SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
ADJP1SRULE_2(loopholes.retype(params,ADJP1SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
22:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
ADJP2SRULE_0(loopholes.retype(params,ADJP2SRULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_1(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_2(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_3(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
22:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_22(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_4(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_5(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_6(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
7:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_7(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
77:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_77(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
8:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_8(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
88:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_88(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
9:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_9(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
25:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_25(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
10:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_10(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
11:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_11(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
12:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_12(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
13:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_13(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
14:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_14(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
21:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_21(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
15:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_15(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
23:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_23(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
24:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_24(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
27:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_27(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
17:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_17(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
18:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_18(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
19:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_19(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
20:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_20(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
26:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_26(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
31:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_31(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
32:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_32(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
33:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_33(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
34:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_34(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
35:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_35(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
36:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_36(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
37:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_37(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
38:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_38(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
39:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_39(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
40:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_40(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
41:BEGIN LDSURFSWITCH_body:=
ADJP2SRULE_41(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
23:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
THANASPSRULE_0(loopholes.retype(params,THANASPSRULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
THANASPSRULE_1(loopholes.retype(params,THANASPSRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
THANASPSRULE_2(loopholes.retype(params,THANASPSRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
THANASPSRULE_3(loopholes.retype(params,THANASPSRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
THANASPSRULE_4(loopholes.retype(params,THANASPSRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
THANASPSRULE_5(loopholes.retype(params,THANASPSRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
THANASPSRULE_6(loopholes.retype(params,THANASPSRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
24:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
QPSRULE_0(loopholes.retype(params,QPSRULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
QPSRULE_1(loopholes.retype(params,QPSRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
QPSRULE_2(loopholes.retype(params,QPSRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
QPSRULE_3(loopholes.retype(params,QPSRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
QPSRULE_4(loopholes.retype(params,QPSRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
QPSRULE_5(loopholes.retype(params,QPSRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
25:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
PPCOORD_0(loopholes.retype(params,PPCOORDtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
PPCOORD_1(loopholes.retype(params,PPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
PPCOORD_2(loopholes.retype(params,PPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
PPCOORD_3(loopholes.retype(params,PPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
PPCOORD_4(loopholes.retype(params,PPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
PPCOORD_5(loopholes.retype(params,PPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
PPCOORD_6(loopholes.retype(params,PPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
7:BEGIN LDSURFSWITCH_body:=
PPCOORD_7(loopholes.retype(params,PPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
26:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
ADVPCOORD_0(loopholes.retype(params,ADVPCOORDtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
ADVPCOORD_1(loopholes.retype(params,ADVPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
ADVPCOORD_2(loopholes.retype(params,ADVPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
ADVPCOORD_3(loopholes.retype(params,ADVPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
ADVPCOORD_4(loopholes.retype(params,ADVPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
ADVPCOORD_5(loopholes.retype(params,ADVPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
ADVPCOORD_6(loopholes.retype(params,ADVPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
7:BEGIN LDSURFSWITCH_body:=
ADVPCOORD_7(loopholes.retype(params,ADVPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
27:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
ADJPCOORD_0(loopholes.retype(params,ADJPCOORDtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
ADJPCOORD_1(loopholes.retype(params,ADJPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
ADJPCOORD_2(loopholes.retype(params,ADJPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
ADJPCOORD_3(loopholes.retype(params,ADJPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
ADJPCOORD_4(loopholes.retype(params,ADJPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
ADJPCOORD_5(loopholes.retype(params,ADJPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
ADJPCOORD_6(loopholes.retype(params,ADJPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
7:BEGIN LDSURFSWITCH_body:=
ADJPCOORD_7(loopholes.retype(params,ADJPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
28:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
NPCOORD_0(loopholes.retype(params,NPCOORDtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
NPCOORD_1(loopholes.retype(params,NPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
NPCOORD_2(loopholes.retype(params,NPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
NPCOORD_3(loopholes.retype(params,NPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
NPCOORD_4(loopholes.retype(params,NPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
NPCOORD_5(loopholes.retype(params,NPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
NPCOORD_6(loopholes.retype(params,NPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
7:BEGIN LDSURFSWITCH_body:=
NPCOORD_7(loopholes.retype(params,NPCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
29:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
SCOORD_0(loopholes.retype(params,SCOORDtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
SCOORD_1(loopholes.retype(params,SCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
SCOORD_2(loopholes.retype(params,SCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
SCOORD_3(loopholes.retype(params,SCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
SCOORD_4(loopholes.retype(params,SCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
SCOORD_5(loopholes.retype(params,SCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
SCOORD_6(loopholes.retype(params,SCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
7:BEGIN LDSURFSWITCH_body:=
SCOORD_7(loopholes.retype(params,SCOORDtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
30:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
SENTENCESRULE_0(loopholes.retype(params,SENTENCESRULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_1(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_2(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_3(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_4(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_5(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_6(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
7:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_7(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
8:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_8(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
9:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_9(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
10:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_10(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
11:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_11(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
12:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_12(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
13:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_13(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
14:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_14(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
15:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_15(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
16:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_16(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
17:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_17(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
18:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_18(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
19:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_19(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
20:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_20(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
21:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_21(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
22:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_22(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
23:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_23(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
24:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_24(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
25:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_25(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
26:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_26(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
27:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_27(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
28:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_28(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
29:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_29(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
30:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_30(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
31:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_31(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
32:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_32(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
33:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_33(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
34:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_34(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
35:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_35(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
36:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_36(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
37:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_37(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
38:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_38(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
39:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_39(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
40:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_40(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
41:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_41(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
42:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_42(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
43:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_43(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
44:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_44(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
45:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_45(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
46:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_46(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
47:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_47(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
48:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_48(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
49:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_49(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
50:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_50(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
51:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_51(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
52:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_52(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
53:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_53(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
54:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_54(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
55:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_55(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
56:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_56(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
57:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_57(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
58:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_58(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
59:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_59(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
60:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_60(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
61:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_61(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
62:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_62(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
63:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_63(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
64:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_64(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
65:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_65(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
66:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_66(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
67:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_67(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
68:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_68(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
69:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_69(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
70:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_70(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
71:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_71(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
72:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_72(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
73:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_73(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
74:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_74(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
75:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_75(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
76:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_76(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
77:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_77(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
78:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_78(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
79:BEGIN LDSURFSWITCH_body:=
SENTENCESRULE_79(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END END END;
 PROCEDURE LDSURFSWITCH_make(int1:INTEGER;VAR params:ITEMS_params);
BEGIN CASE int1 OF
1:MEM_newdefault(loopholes.SIZEof(UTTrec),loopholes.retype(params,MEM_ptr));
2:MEM_newdefault(loopholes.SIZEof(VCOMPLEXrec),loopholes.retype(params,MEM_ptr));
3:MEM_newdefault(loopholes.SIZEof(VPrec),loopholes.retype(params,MEM_ptr));
4:MEM_newdefault(loopholes.SIZEof(NP1RULErec),loopholes.retype(params,MEM_ptr));
5:MEM_newdefault(loopholes.SIZEof(NP1ARULErec),loopholes.retype(params,MEM_ptr));
6:MEM_newdefault(loopholes.SIZEof(NP2RULErec),loopholes.retype(params,MEM_ptr));
7:MEM_newdefault(loopholes.SIZEof(NP3RULErec),loopholes.retype(params,MEM_ptr));
8:MEM_newdefault(loopholes.SIZEof(NP4RULErec),loopholes.retype(params,MEM_ptr));
9:MEM_newdefault(loopholes.SIZEof(NP5RULErec),loopholes.retype(params,MEM_ptr));
10:MEM_newdefault(loopholes.SIZEof(NP6RULErec),loopholes.retype(params,MEM_ptr));
11:MEM_newdefault(loopholes.SIZEof(NP7RULErec),loopholes.retype(params,MEM_ptr));
12:MEM_newdefault(loopholes.SIZEof(DETPRULErec),loopholes.retype(params,MEM_ptr));
13:MEM_newdefault(loopholes.SIZEof(DETP2RULErec),loopholes.retype(params,MEM_ptr));
14:MEM_newdefault(loopholes.SIZEof(CN1RULErec),loopholes.retype(params,MEM_ptr));
15:MEM_newdefault(loopholes.SIZEof(CN2RULErec),loopholes.retype(params,MEM_ptr));
16:MEM_newdefault(loopholes.SIZEof(PREPPrec),loopholes.retype(params,MEM_ptr));
17:MEM_newdefault(loopholes.SIZEof(RADVPrec),loopholes.retype(params,MEM_ptr));
18:MEM_newdefault(loopholes.SIZEof(ADVPrec),loopholes.retype(params,MEM_ptr));
19:MEM_newdefault(loopholes.SIZEof(DATUMNPrec),loopholes.retype(params,MEM_ptr));
20:MEM_newdefault(loopholes.SIZEof(NPCARDRULErec),loopholes.retype(params,MEM_ptr));
21:MEM_newdefault(loopholes.SIZEof(ADJP1SRULErec),loopholes.retype(params,MEM_ptr));
22:MEM_newdefault(loopholes.SIZEof(ADJP2SRULErec),loopholes.retype(params,MEM_ptr));
23:MEM_newdefault(loopholes.SIZEof(THANASPSRULErec),loopholes.retype(params,MEM_ptr));
24:MEM_newdefault(loopholes.SIZEof(QPSRULErec),loopholes.retype(params,MEM_ptr));
25:MEM_newdefault(loopholes.SIZEof(PPCOORDrec),loopholes.retype(params,MEM_ptr));
26:MEM_newdefault(loopholes.SIZEof(ADVPCOORDrec),loopholes.retype(params,MEM_ptr));
27:MEM_newdefault(loopholes.SIZEof(ADJPCOORDrec),loopholes.retype(params,MEM_ptr));
28:MEM_newdefault(loopholes.SIZEof(NPCOORDrec),loopholes.retype(params,MEM_ptr));
29:MEM_newdefault(loopholes.SIZEof(SCOORDrec),loopholes.retype(params,MEM_ptr));
30:MEM_newdefault(loopholes.SIZEof(SENTENCESRULErec),loopholes.retype(params,MEM_ptr));
END END; FUNCTION LDSURFSWITCH_comp(int1:INTEGER;params,params1:ITEMS_params):BOOLEAN;
BEGIN CASE int1 OF
1:LDSURFSWITCH_comp:=comp_UTT(loopholes.retype(params,UTTtyp),loopholes.retype(params1,UTTtyp));
2:LDSURFSWITCH_comp:=comp_VCOMPLEX(loopholes.retype(params,VCOMPLEXtyp),loopholes.retype(params1,VCOMPLEXtyp));
3:LDSURFSWITCH_comp:=comp_VP(loopholes.retype(params,VPtyp),loopholes.retype(params1,VPtyp));
4:LDSURFSWITCH_comp:=comp_NP1RULE(loopholes.retype(params,NP1RULEtyp),loopholes.retype(params1,NP1RULEtyp));
5:LDSURFSWITCH_comp:=comp_NP1ARULE(loopholes.retype(params,NP1ARULEtyp),loopholes.retype(params1,NP1ARULEtyp));
6:LDSURFSWITCH_comp:=comp_NP2RULE(loopholes.retype(params,NP2RULEtyp),loopholes.retype(params1,NP2RULEtyp));
7:LDSURFSWITCH_comp:=comp_NP3RULE(loopholes.retype(params,NP3RULEtyp),loopholes.retype(params1,NP3RULEtyp));
8:LDSURFSWITCH_comp:=comp_NP4RULE(loopholes.retype(params,NP4RULEtyp),loopholes.retype(params1,NP4RULEtyp));
9:LDSURFSWITCH_comp:=comp_NP5RULE(loopholes.retype(params,NP5RULEtyp),loopholes.retype(params1,NP5RULEtyp));
10:LDSURFSWITCH_comp:=comp_NP6RULE(loopholes.retype(params,NP6RULEtyp),loopholes.retype(params1,NP6RULEtyp));
11:LDSURFSWITCH_comp:=comp_NP7RULE(loopholes.retype(params,NP7RULEtyp),loopholes.retype(params1,NP7RULEtyp));
12:LDSURFSWITCH_comp:=comp_DETPRULE(loopholes.retype(params,DETPRULEtyp),loopholes.retype(params1,DETPRULEtyp));
13:LDSURFSWITCH_comp:=comp_DETP2RULE(loopholes.retype(params,DETP2RULEtyp),loopholes.retype(params1,DETP2RULEtyp));
14:LDSURFSWITCH_comp:=comp_CN1RULE(loopholes.retype(params,CN1RULEtyp),loopholes.retype(params1,CN1RULEtyp));
15:LDSURFSWITCH_comp:=comp_CN2RULE(loopholes.retype(params,CN2RULEtyp),loopholes.retype(params1,CN2RULEtyp));
16:LDSURFSWITCH_comp:=comp_PREPP(loopholes.retype(params,PREPPtyp),loopholes.retype(params1,PREPPtyp));
17:LDSURFSWITCH_comp:=comp_RADVP(loopholes.retype(params,RADVPtyp),loopholes.retype(params1,RADVPtyp));
18:LDSURFSWITCH_comp:=comp_ADVP(loopholes.retype(params,ADVPtyp),loopholes.retype(params1,ADVPtyp));
19:LDSURFSWITCH_comp:=comp_DATUMNP(loopholes.retype(params,DATUMNPtyp),loopholes.retype(params1,DATUMNPtyp));
20:LDSURFSWITCH_comp:=comp_NPCARDRULE(loopholes.retype(params,NPCARDRULEtyp),loopholes.retype(params1,NPCARDRULEtyp));
21:LDSURFSWITCH_comp:=comp_ADJP1SRULE(loopholes.retype(params,ADJP1SRULEtyp),loopholes.retype(params1,ADJP1SRULEtyp));
22:LDSURFSWITCH_comp:=comp_ADJP2SRULE(loopholes.retype(params,ADJP2SRULEtyp),loopholes.retype(params1,ADJP2SRULEtyp));
23:LDSURFSWITCH_comp:=comp_THANASPSRULE(loopholes.retype(params,THANASPSRULEtyp),loopholes.retype(params1,THANASPSRULEtyp));
24:LDSURFSWITCH_comp:=comp_QPSRULE(loopholes.retype(params,QPSRULEtyp),loopholes.retype(params1,QPSRULEtyp));
25:LDSURFSWITCH_comp:=comp_PPCOORD(loopholes.retype(params,PPCOORDtyp),loopholes.retype(params1,PPCOORDtyp));
26:LDSURFSWITCH_comp:=comp_ADVPCOORD(loopholes.retype(params,ADVPCOORDtyp),loopholes.retype(params1,ADVPCOORDtyp));
27:LDSURFSWITCH_comp:=comp_ADJPCOORD(loopholes.retype(params,ADJPCOORDtyp),loopholes.retype(params1,ADJPCOORDtyp));
28:LDSURFSWITCH_comp:=comp_NPCOORD(loopholes.retype(params,NPCOORDtyp),loopholes.retype(params1,NPCOORDtyp));
29:LDSURFSWITCH_comp:=comp_SCOORD(loopholes.retype(params,SCOORDtyp),loopholes.retype(params1,SCOORDtyp));
30:LDSURFSWITCH_comp:=comp_SENTENCESRULE(loopholes.retype(params,SENTENCESRULEtyp),loopholes.retype(params1,SENTENCESRULEtyp));
END END; PROCEDURE LDSURFSWITCH_copy(int1:INTEGER;params:ITEMS_params;VAR params1:ITEMS_params);
BEGIN CASE int1 OF
1:loopholes.retype(params1,UTTtyp)^:=loopholes.retype(params,UTTtyp)^;
2:loopholes.retype(params1,VCOMPLEXtyp)^:=loopholes.retype(params,VCOMPLEXtyp)^;
3:loopholes.retype(params1,VPtyp)^:=loopholes.retype(params,VPtyp)^;
4:loopholes.retype(params1,NP1RULEtyp)^:=loopholes.retype(params,NP1RULEtyp)^;
5:loopholes.retype(params1,NP1ARULEtyp)^:=loopholes.retype(params,NP1ARULEtyp)^;
6:loopholes.retype(params1,NP2RULEtyp)^:=loopholes.retype(params,NP2RULEtyp)^;
7:loopholes.retype(params1,NP3RULEtyp)^:=loopholes.retype(params,NP3RULEtyp)^;
8:loopholes.retype(params1,NP4RULEtyp)^:=loopholes.retype(params,NP4RULEtyp)^;
9:loopholes.retype(params1,NP5RULEtyp)^:=loopholes.retype(params,NP5RULEtyp)^;
10:loopholes.retype(params1,NP6RULEtyp)^:=loopholes.retype(params,NP6RULEtyp)^;
11:loopholes.retype(params1,NP7RULEtyp)^:=loopholes.retype(params,NP7RULEtyp)^;
12:loopholes.retype(params1,DETPRULEtyp)^:=loopholes.retype(params,DETPRULEtyp)^;
13:loopholes.retype(params1,DETP2RULEtyp)^:=loopholes.retype(params,DETP2RULEtyp)^;
14:loopholes.retype(params1,CN1RULEtyp)^:=loopholes.retype(params,CN1RULEtyp)^;
15:loopholes.retype(params1,CN2RULEtyp)^:=loopholes.retype(params,CN2RULEtyp)^;
16:loopholes.retype(params1,PREPPtyp)^:=loopholes.retype(params,PREPPtyp)^;
17:loopholes.retype(params1,RADVPtyp)^:=loopholes.retype(params,RADVPtyp)^;
18:loopholes.retype(params1,ADVPtyp)^:=loopholes.retype(params,ADVPtyp)^;
19:loopholes.retype(params1,DATUMNPtyp)^:=loopholes.retype(params,DATUMNPtyp)^;
20:loopholes.retype(params1,NPCARDRULEtyp)^:=loopholes.retype(params,NPCARDRULEtyp)^;
21:loopholes.retype(params1,ADJP1SRULEtyp)^:=loopholes.retype(params,ADJP1SRULEtyp)^;
22:loopholes.retype(params1,ADJP2SRULEtyp)^:=loopholes.retype(params,ADJP2SRULEtyp)^;
23:loopholes.retype(params1,THANASPSRULEtyp)^:=loopholes.retype(params,THANASPSRULEtyp)^;
24:loopholes.retype(params1,QPSRULEtyp)^:=loopholes.retype(params,QPSRULEtyp)^;
25:loopholes.retype(params1,PPCOORDtyp)^:=loopholes.retype(params,PPCOORDtyp)^;
26:loopholes.retype(params1,ADVPCOORDtyp)^:=loopholes.retype(params,ADVPCOORDtyp)^;
27:loopholes.retype(params1,ADJPCOORDtyp)^:=loopholes.retype(params,ADJPCOORDtyp)^;
28:loopholes.retype(params1,NPCOORDtyp)^:=loopholes.retype(params,NPCOORDtyp)^;
29:loopholes.retype(params1,SCOORDtyp)^:=loopholes.retype(params,SCOORDtyp)^;
30:loopholes.retype(params1,SENTENCESRULEtyp)^:=loopholes.retype(params,SENTENCESRULEtyp)^;
END END;
