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
VERBPRULE_0(loopholes.retype(params,VERBPRULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
VERBPRULE_1(loopholes.retype(params,VERBPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
VERBPRULE_2(loopholes.retype(params,VERBPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
VERBPRULE_3(loopholes.retype(params,VERBPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
VERBPRULE_4(loopholes.retype(params,VERBPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
VERBPRULE_5(loopholes.retype(params,VERBPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
VERBPRULE_6(loopholes.retype(params,VERBPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
7:BEGIN LDSURFSWITCH_body:=
VERBPRULE_7(loopholes.retype(params,VERBPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
8:BEGIN LDSURFSWITCH_body:=
VERBPRULE_8(loopholes.retype(params,VERBPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
9:BEGIN LDSURFSWITCH_body:=
VERBPRULE_9(loopholes.retype(params,VERBPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
10:BEGIN LDSURFSWITCH_body:=
VERBPRULE_10(loopholes.retype(params,VERBPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
11:BEGIN LDSURFSWITCH_body:=
VERBPRULE_11(loopholes.retype(params,VERBPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
12:BEGIN LDSURFSWITCH_body:=
VERBPRULE_12(loopholes.retype(params,VERBPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
13:BEGIN LDSURFSWITCH_body:=
VERBPRULE_13(loopholes.retype(params,VERBPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
14:BEGIN LDSURFSWITCH_body:=
VERBPRULE_14(loopholes.retype(params,VERBPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
15:BEGIN LDSURFSWITCH_body:=
VERBPRULE_15(loopholes.retype(params,VERBPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
16:BEGIN LDSURFSWITCH_body:=
VERBPRULE_16(loopholes.retype(params,VERBPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
17:BEGIN LDSURFSWITCH_body:=
VERBPRULE_17(loopholes.retype(params,VERBPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
18:BEGIN LDSURFSWITCH_body:=
VERBPRULE_18(loopholes.retype(params,VERBPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
19:BEGIN LDSURFSWITCH_body:=
VERBPRULE_19(loopholes.retype(params,VERBPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
20:BEGIN LDSURFSWITCH_body:=
VERBPRULE_20(loopholes.retype(params,VERBPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
21:BEGIN LDSURFSWITCH_body:=
VERBPRULE_21(loopholes.retype(params,VERBPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
3:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
VERBNEGRULE_0(loopholes.retype(params,VERBNEGRULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
VERBNEGRULE_1(loopholes.retype(params,VERBNEGRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
VERBNEGRULE_2(loopholes.retype(params,VERBNEGRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
VERBNEGRULE_3(loopholes.retype(params,VERBNEGRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
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
7:BEGIN LDSURFSWITCH_body:=
NP1RULE_7(loopholes.retype(params,NP1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
5:CASE int2 OF
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
9:BEGIN LDSURFSWITCH_body:=
NP2RULE_9(loopholes.retype(params,NP2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
10:BEGIN LDSURFSWITCH_body:=
NP2RULE_10(loopholes.retype(params,NP2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
6:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
NP3RULE_0(loopholes.retype(params,NP3RULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
NP3RULE_1(loopholes.retype(params,NP3RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
NP3RULE_2(loopholes.retype(params,NP3RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
NP3RULE_3(loopholes.retype(params,NP3RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
7:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
NP4RULE_0(loopholes.retype(params,NP4RULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
NP4RULE_1(loopholes.retype(params,NP4RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
8:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
NP5RULE_0(loopholes.retype(params,NP5RULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
NP5RULE_1(loopholes.retype(params,NP5RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
9:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
CN1RULE_0(loopholes.retype(params,CN1RULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
CN1RULE_1(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
CN1RULE_5(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
16:BEGIN LDSURFSWITCH_body:=
CN1RULE_16(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
CN1RULE_2(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
CN1RULE_3(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
CN1RULE_4(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
14:BEGIN LDSURFSWITCH_body:=
CN1RULE_14(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
15:BEGIN LDSURFSWITCH_body:=
CN1RULE_15(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
13:BEGIN LDSURFSWITCH_body:=
CN1RULE_13(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
17:BEGIN LDSURFSWITCH_body:=
CN1RULE_17(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
18:BEGIN LDSURFSWITCH_body:=
CN1RULE_18(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
9:BEGIN LDSURFSWITCH_body:=
CN1RULE_9(loopholes.retype(params,CN1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
10:CASE int2 OF
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
11:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
PREPPRULE_0(loopholes.retype(params,PREPPRULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
PREPPRULE_1(loopholes.retype(params,PREPPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
PREPPRULE_2(loopholes.retype(params,PREPPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
PREPPRULE_3(loopholes.retype(params,PREPPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
PREPPRULE_4(loopholes.retype(params,PREPPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
PREPPRULE_5(loopholes.retype(params,PREPPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
PREPPRULE_6(loopholes.retype(params,PREPPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
7:BEGIN LDSURFSWITCH_body:=
PREPPRULE_7(loopholes.retype(params,PREPPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
8:BEGIN LDSURFSWITCH_body:=
PREPPRULE_8(loopholes.retype(params,PREPPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
12:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
ADVPRULE1_0(loopholes.retype(params,ADVPRULE1typ)); END;
1:BEGIN LDSURFSWITCH_body:=
ADVPRULE1_1(loopholes.retype(params,ADVPRULE1typ),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
ADVPRULE1_2(loopholes.retype(params,ADVPRULE1typ),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
ADVPRULE1_3(loopholes.retype(params,ADVPRULE1typ),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
ADVPRULE1_4(loopholes.retype(params,ADVPRULE1typ),loopholes.retype(stree,LSSTREE_pstree));
END;
44:BEGIN LDSURFSWITCH_body:=
ADVPRULE1_44(loopholes.retype(params,ADVPRULE1typ),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
ADVPRULE1_5(loopholes.retype(params,ADVPRULE1typ),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
ADVPRULE1_6(loopholes.retype(params,ADVPRULE1typ),loopholes.retype(stree,LSSTREE_pstree));
END;
7:BEGIN LDSURFSWITCH_body:=
ADVPRULE1_7(loopholes.retype(params,ADVPRULE1typ),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
13:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
NP6RULE_0(loopholes.retype(params,NP6RULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
NP6RULE_1(loopholes.retype(params,NP6RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
14:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
NP7RULE_0(loopholes.retype(params,NP7RULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
NP7RULE_1(loopholes.retype(params,NP7RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
NP7RULE_2(loopholes.retype(params,NP7RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
NP7RULE_3(loopholes.retype(params,NP7RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
NP7RULE_4(loopholes.retype(params,NP7RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
15:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
ADJP1SRULE_0(loopholes.retype(params,ADJP1SRULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
ADJP1SRULE_1(loopholes.retype(params,ADJP1SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
ADJP1SRULE_2(loopholes.retype(params,ADJP1SRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
16:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
ADJP2RULE_0(loopholes.retype(params,ADJP2RULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
ADJP2RULE_1(loopholes.retype(params,ADJP2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
ADJP2RULE_6(loopholes.retype(params,ADJP2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
7:BEGIN LDSURFSWITCH_body:=
ADJP2RULE_7(loopholes.retype(params,ADJP2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
8:BEGIN LDSURFSWITCH_body:=
ADJP2RULE_8(loopholes.retype(params,ADJP2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
88:BEGIN LDSURFSWITCH_body:=
ADJP2RULE_88(loopholes.retype(params,ADJP2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
9:BEGIN LDSURFSWITCH_body:=
ADJP2RULE_9(loopholes.retype(params,ADJP2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
25:BEGIN LDSURFSWITCH_body:=
ADJP2RULE_25(loopholes.retype(params,ADJP2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
14:BEGIN LDSURFSWITCH_body:=
ADJP2RULE_14(loopholes.retype(params,ADJP2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
27:BEGIN LDSURFSWITCH_body:=
ADJP2RULE_27(loopholes.retype(params,ADJP2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
11:BEGIN LDSURFSWITCH_body:=
ADJP2RULE_11(loopholes.retype(params,ADJP2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
18:BEGIN LDSURFSWITCH_body:=
ADJP2RULE_18(loopholes.retype(params,ADJP2RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
17:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
QP1RULE_0(loopholes.retype(params,QP1RULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
QP1RULE_1(loopholes.retype(params,QP1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
QP1RULE_2(loopholes.retype(params,QP1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
QP1RULE_3(loopholes.retype(params,QP1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
QP1RULE_4(loopholes.retype(params,QP1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
QP1RULE_5(loopholes.retype(params,QP1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
18:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
THANPRULE_0(loopholes.retype(params,THANPRULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
THANPRULE_1(loopholes.retype(params,THANPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
THANPRULE_2(loopholes.retype(params,THANPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
THANPRULE_3(loopholes.retype(params,THANPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
THANPRULE_4(loopholes.retype(params,THANPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
THANPRULE_5(loopholes.retype(params,THANPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
THANPRULE_6(loopholes.retype(params,THANPRULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END;
19:CASE int2 OF
LIPRIMS_Hinit:BEGIN LDSURFSWITCH_body:=TRUE;
SENTENCE1RULE_0(loopholes.retype(params,SENTENCE1RULEtyp)); END;
1:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_1(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
2:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_2(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
3:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_3(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
4:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_4(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
5:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_5(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
6:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_6(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
7:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_7(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
8:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_8(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
9:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_9(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
10:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_10(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
11:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_11(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
12:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_12(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
13:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_13(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
14:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_14(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
15:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_15(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
16:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_16(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
17:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_17(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
18:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_18(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
19:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_19(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
20:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_20(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
21:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_21(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
22:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_22(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
23:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_23(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
24:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_24(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
25:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_25(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
26:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_26(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
27:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_27(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
28:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_28(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
29:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_29(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
30:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_30(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
31:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_31(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
32:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_32(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
33:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_33(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
34:BEGIN LDSURFSWITCH_body:=
SENTENCE1RULE_34(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(stree,LSSTREE_pstree));
END;
END END END;
 PROCEDURE LDSURFSWITCH_make(int1:INTEGER;VAR params:ITEMS_params);
BEGIN CASE int1 OF
1:MEM_newdefault(loopholes.SIZEof(UTTrec),loopholes.retype(params,MEM_ptr));
2:MEM_newdefault(loopholes.SIZEof(VERBPRULErec),loopholes.retype(params,MEM_ptr));
3:MEM_newdefault(loopholes.SIZEof(VERBNEGRULErec),loopholes.retype(params,MEM_ptr));
4:MEM_newdefault(loopholes.SIZEof(NP1RULErec),loopholes.retype(params,MEM_ptr));
5:MEM_newdefault(loopholes.SIZEof(NP2RULErec),loopholes.retype(params,MEM_ptr));
6:MEM_newdefault(loopholes.SIZEof(NP3RULErec),loopholes.retype(params,MEM_ptr));
7:MEM_newdefault(loopholes.SIZEof(NP4RULErec),loopholes.retype(params,MEM_ptr));
8:MEM_newdefault(loopholes.SIZEof(NP5RULErec),loopholes.retype(params,MEM_ptr));
9:MEM_newdefault(loopholes.SIZEof(CN1RULErec),loopholes.retype(params,MEM_ptr));
10:MEM_newdefault(loopholes.SIZEof(DETPRULErec),loopholes.retype(params,MEM_ptr));
11:MEM_newdefault(loopholes.SIZEof(PREPPRULErec),loopholes.retype(params,MEM_ptr));
12:MEM_newdefault(loopholes.SIZEof(ADVPRULE1rec),loopholes.retype(params,MEM_ptr));
13:MEM_newdefault(loopholes.SIZEof(NP6RULErec),loopholes.retype(params,MEM_ptr));
14:MEM_newdefault(loopholes.SIZEof(NP7RULErec),loopholes.retype(params,MEM_ptr));
15:MEM_newdefault(loopholes.SIZEof(ADJP1SRULErec),loopholes.retype(params,MEM_ptr));
16:MEM_newdefault(loopholes.SIZEof(ADJP2RULErec),loopholes.retype(params,MEM_ptr));
17:MEM_newdefault(loopholes.SIZEof(QP1RULErec),loopholes.retype(params,MEM_ptr));
18:MEM_newdefault(loopholes.SIZEof(THANPRULErec),loopholes.retype(params,MEM_ptr));
19:MEM_newdefault(loopholes.SIZEof(SENTENCE1RULErec),loopholes.retype(params,MEM_ptr));
END END; FUNCTION LDSURFSWITCH_comp(int1:INTEGER;params,params1:ITEMS_params):BOOLEAN;
BEGIN CASE int1 OF
1:LDSURFSWITCH_comp:=comp_UTT(loopholes.retype(params,UTTtyp),loopholes.retype(params1,UTTtyp));
2:LDSURFSWITCH_comp:=comp_VERBPRULE(loopholes.retype(params,VERBPRULEtyp),loopholes.retype(params1,VERBPRULEtyp));
3:LDSURFSWITCH_comp:=comp_VERBNEGRULE(loopholes.retype(params,VERBNEGRULEtyp),loopholes.retype(params1,VERBNEGRULEtyp));
4:LDSURFSWITCH_comp:=comp_NP1RULE(loopholes.retype(params,NP1RULEtyp),loopholes.retype(params1,NP1RULEtyp));
5:LDSURFSWITCH_comp:=comp_NP2RULE(loopholes.retype(params,NP2RULEtyp),loopholes.retype(params1,NP2RULEtyp));
6:LDSURFSWITCH_comp:=comp_NP3RULE(loopholes.retype(params,NP3RULEtyp),loopholes.retype(params1,NP3RULEtyp));
7:LDSURFSWITCH_comp:=comp_NP4RULE(loopholes.retype(params,NP4RULEtyp),loopholes.retype(params1,NP4RULEtyp));
8:LDSURFSWITCH_comp:=comp_NP5RULE(loopholes.retype(params,NP5RULEtyp),loopholes.retype(params1,NP5RULEtyp));
9:LDSURFSWITCH_comp:=comp_CN1RULE(loopholes.retype(params,CN1RULEtyp),loopholes.retype(params1,CN1RULEtyp));
10:LDSURFSWITCH_comp:=comp_DETPRULE(loopholes.retype(params,DETPRULEtyp),loopholes.retype(params1,DETPRULEtyp));
11:LDSURFSWITCH_comp:=comp_PREPPRULE(loopholes.retype(params,PREPPRULEtyp),loopholes.retype(params1,PREPPRULEtyp));
12:LDSURFSWITCH_comp:=comp_ADVPRULE1(loopholes.retype(params,ADVPRULE1typ),loopholes.retype(params1,ADVPRULE1typ));
13:LDSURFSWITCH_comp:=comp_NP6RULE(loopholes.retype(params,NP6RULEtyp),loopholes.retype(params1,NP6RULEtyp));
14:LDSURFSWITCH_comp:=comp_NP7RULE(loopholes.retype(params,NP7RULEtyp),loopholes.retype(params1,NP7RULEtyp));
15:LDSURFSWITCH_comp:=comp_ADJP1SRULE(loopholes.retype(params,ADJP1SRULEtyp),loopholes.retype(params1,ADJP1SRULEtyp));
16:LDSURFSWITCH_comp:=comp_ADJP2RULE(loopholes.retype(params,ADJP2RULEtyp),loopholes.retype(params1,ADJP2RULEtyp));
17:LDSURFSWITCH_comp:=comp_QP1RULE(loopholes.retype(params,QP1RULEtyp),loopholes.retype(params1,QP1RULEtyp));
18:LDSURFSWITCH_comp:=comp_THANPRULE(loopholes.retype(params,THANPRULEtyp),loopholes.retype(params1,THANPRULEtyp));
19:LDSURFSWITCH_comp:=comp_SENTENCE1RULE(loopholes.retype(params,SENTENCE1RULEtyp),loopholes.retype(params1,SENTENCE1RULEtyp));
END END; PROCEDURE LDSURFSWITCH_copy(int1:INTEGER;params:ITEMS_params;VAR params1:ITEMS_params);
BEGIN CASE int1 OF
1:loopholes.retype(params1,UTTtyp)^:=loopholes.retype(params,UTTtyp)^;
2:loopholes.retype(params1,VERBPRULEtyp)^:=loopholes.retype(params,VERBPRULEtyp)^;
3:loopholes.retype(params1,VERBNEGRULEtyp)^:=loopholes.retype(params,VERBNEGRULEtyp)^;
4:loopholes.retype(params1,NP1RULEtyp)^:=loopholes.retype(params,NP1RULEtyp)^;
5:loopholes.retype(params1,NP2RULEtyp)^:=loopholes.retype(params,NP2RULEtyp)^;
6:loopholes.retype(params1,NP3RULEtyp)^:=loopholes.retype(params,NP3RULEtyp)^;
7:loopholes.retype(params1,NP4RULEtyp)^:=loopholes.retype(params,NP4RULEtyp)^;
8:loopholes.retype(params1,NP5RULEtyp)^:=loopholes.retype(params,NP5RULEtyp)^;
9:loopholes.retype(params1,CN1RULEtyp)^:=loopholes.retype(params,CN1RULEtyp)^;
10:loopholes.retype(params1,DETPRULEtyp)^:=loopholes.retype(params,DETPRULEtyp)^;
11:loopholes.retype(params1,PREPPRULEtyp)^:=loopholes.retype(params,PREPPRULEtyp)^;
12:loopholes.retype(params1,ADVPRULE1typ)^:=loopholes.retype(params,ADVPRULE1typ)^;
13:loopholes.retype(params1,NP6RULEtyp)^:=loopholes.retype(params,NP6RULEtyp)^;
14:loopholes.retype(params1,NP7RULEtyp)^:=loopholes.retype(params,NP7RULEtyp)^;
15:loopholes.retype(params1,ADJP1SRULEtyp)^:=loopholes.retype(params,ADJP1SRULEtyp)^;
16:loopholes.retype(params1,ADJP2RULEtyp)^:=loopholes.retype(params,ADJP2RULEtyp)^;
17:loopholes.retype(params1,QP1RULEtyp)^:=loopholes.retype(params,QP1RULEtyp)^;
18:loopholes.retype(params1,THANPRULEtyp)^:=loopholes.retype(params,THANPRULEtyp)^;
19:loopholes.retype(params1,SENTENCE1RULEtyp)^:=loopholes.retype(params,SENTENCE1RULEtyp)^;
END END;
