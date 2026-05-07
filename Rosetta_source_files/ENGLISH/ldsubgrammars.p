EXPORT(LDSUBGRAMMARS);
pragma C_include('ldsubgrammars.pf');
pragma C_include('helpsubgrammars.pf');
pragma C_include('ldmrules.pf');
pragma C_include('mem.pf');

PROGRAM LDSUBGRAMMARS;
WITH helpsubgrammars,ldmrules,mem,ldmrules;
VAR ctrlexpr:ARRAY[1..32] OF LDMRULES_pCtrlExpr;
 PROCEDURE LDsubgrammars_TheCtrlExpr(sg:LDMrules_SubgrammarIndex;VAR ce:LDMRULES_CtrlExpr);
BEGIN
ce:=ctrlexpr[sg]^
END;
PROCEDURE initctrlexprlst(VAR C:LDMRULES_pCtrlExpr);
BEGIN
C^.left:=NIL;C^.right:=NIL;
END;
PROCEDURE appendctrlexpr(C1:LDMRULES_pCtrlExpr;VAR C2:LDMRULES_pCtrlExpr);
VAR p:LDMRULES_pCTRlExprLst;
BEGIN
MEM_newdefault(loopholes.sizeof(LDMRULES_CtrlExprLst),loopholes.retype(p,MEM_ptr));
IF C2^.left=NIL THEN
  BEGIN
  C2^.left:=p;C2^.right:=p;p^.left:=NIL;p^.right:=NIL;p^.ce:=C1^;
  END
ELSE
  BEGIN
  C2^.right^.right:=p;
  p^.left:=C2^.right;
  C2^.right:=p;
  p^.right:=NIL;
  p^.ce:=C1^;
  END
END;
 PROCEDURE LDsubgrammars_Init;
FUNCTION VERBDERIVATION:LDMRULES_pCtrlExpr; 
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=6;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
BEGIN 
VERBDERIVATION:=GRAPH 
END; 
FUNCTION VERBPPROPFORMATION:LDMRULES_pCtrlExpr; 
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=268;
ELEMGRAPH1:=result; 
END; 
                                                       FUNCTION ELEMGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=151;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=152;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=153;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=154;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=155;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=156;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=157;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=158;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=149;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH9:=result; 
END; 
                                                       FUNCTION CONCGRAPH10:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=150;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH10:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
AppendCtrlExpr(CONCGRAPH6,result); 
AppendCtrlExpr(CONCGRAPH7,result); 
AppendCtrlExpr(CONCGRAPH8,result); 
AppendCtrlExpr(CONCGRAPH9,result); 
AppendCtrlExpr(CONCGRAPH10,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH2:=GRAPH 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
AppendCtrlExpr(ELEMGRAPH2,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH1:=GRAPH 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=267;
ELEMGRAPH1:=result; 
END; 
                                                       FUNCTION ELEMGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=434;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=426;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=427;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=428;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=429;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=430;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=431;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=432;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH8:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
AppendCtrlExpr(CONCGRAPH6,result); 
AppendCtrlExpr(CONCGRAPH7,result); 
AppendCtrlExpr(CONCGRAPH8,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH2:=GRAPH 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
AppendCtrlExpr(ELEMGRAPH2,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH1:=GRAPH 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH1:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=128;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=129;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=130;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=127;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=125;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=121;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=122;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=116;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=117;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH9:=result; 
END; 
                                                       FUNCTION CONCGRAPH10:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=118;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH10:=result; 
END; 
                                                       FUNCTION CONCGRAPH11:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=119;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH11:=result; 
END; 
                                                       FUNCTION CONCGRAPH12:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=126;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH12:=result; 
END; 
                                                       FUNCTION CONCGRAPH13:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=120;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH13:=result; 
END; 
                                                       FUNCTION CONCGRAPH14:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=123;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH14:=result; 
END; 
                                                       FUNCTION CONCGRAPH15:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=124;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH15:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
AppendCtrlExpr(CONCGRAPH6,result); 
AppendCtrlExpr(CONCGRAPH7,result); 
AppendCtrlExpr(CONCGRAPH8,result); 
AppendCtrlExpr(CONCGRAPH9,result); 
AppendCtrlExpr(CONCGRAPH10,result); 
AppendCtrlExpr(CONCGRAPH11,result); 
AppendCtrlExpr(CONCGRAPH12,result); 
AppendCtrlExpr(CONCGRAPH13,result); 
AppendCtrlExpr(CONCGRAPH14,result); 
AppendCtrlExpr(CONCGRAPH15,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH2:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=419;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=420;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=421;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH3:=result; 
END; 
                                                       FUNCTION ELEMGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=114;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=115;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH4:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=383;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH5:=result; 
END; 
                                                       FUNCTION ELEMGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=87;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=88;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=86;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=379;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=380;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=377;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=378;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=381;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=382;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH9:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
AppendCtrlExpr(CONCGRAPH6,result); 
AppendCtrlExpr(CONCGRAPH7,result); 
AppendCtrlExpr(CONCGRAPH8,result); 
AppendCtrlExpr(CONCGRAPH9,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH6:=result; 
END; 
                                                       FUNCTION ELEMGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=146;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=147;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=148;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH7:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH8:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=109;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=110;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=111;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=112;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=113;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=107;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH6:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
AppendCtrlExpr(CONCGRAPH6,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH8:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH9:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=108;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH9:=result; 
END; 
                                                       FUNCTION ELEMGRAPH10:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=299;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH10:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH11:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=300;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH11:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH12:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=188;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=189;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=190;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=191;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=192;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=194;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=195;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=196;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=197;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH9:=result; 
END; 
                                                       FUNCTION CONCGRAPH10:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=198;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH10:=result; 
END; 
                                                       FUNCTION CONCGRAPH11:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=193;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH11:=result; 
END; 
                                                       FUNCTION CONCGRAPH12:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=199;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH12:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
AppendCtrlExpr(CONCGRAPH6,result); 
AppendCtrlExpr(CONCGRAPH7,result); 
AppendCtrlExpr(CONCGRAPH8,result); 
AppendCtrlExpr(CONCGRAPH9,result); 
AppendCtrlExpr(CONCGRAPH10,result); 
AppendCtrlExpr(CONCGRAPH11,result); 
AppendCtrlExpr(CONCGRAPH12,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH12:=GRAPH 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
AppendCtrlExpr(ELEMGRAPH2,result); 
AppendCtrlExpr(ELEMGRAPH3,result); 
AppendCtrlExpr(ELEMGRAPH4,result); 
AppendCtrlExpr(ELEMGRAPH5,result); 
AppendCtrlExpr(ELEMGRAPH6,result); 
AppendCtrlExpr(ELEMGRAPH7,result); 
AppendCtrlExpr(ELEMGRAPH8,result); 
AppendCtrlExpr(ELEMGRAPH9,result); 
AppendCtrlExpr(ELEMGRAPH10,result); 
AppendCtrlExpr(ELEMGRAPH11,result); 
AppendCtrlExpr(ELEMGRAPH12,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
BEGIN 
VERBPPROPFORMATION:=GRAPH 
END; 
FUNCTION XPPROPTOCLAUSE:LDMRULES_pCtrlExpr; 
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=106;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=107;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=108;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=109;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=110;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=129;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=130;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=131;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=132;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH9:=result; 
END; 
                                                       FUNCTION CONCGRAPH10:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=133;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH10:=result; 
END; 
                                                       FUNCTION CONCGRAPH11:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=134;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH11:=result; 
END; 
                                                       FUNCTION CONCGRAPH12:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=111;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH12:=result; 
END; 
                                                       FUNCTION CONCGRAPH13:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=112;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH13:=result; 
END; 
                                                       FUNCTION CONCGRAPH14:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=141;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH14:=result; 
END; 
                                                       FUNCTION CONCGRAPH15:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=142;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH15:=result; 
END; 
                                                       FUNCTION CONCGRAPH16:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=143;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH16:=result; 
END; 
                                                       FUNCTION CONCGRAPH17:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=144;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH17:=result; 
END; 
                                                       FUNCTION CONCGRAPH18:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=145;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH18:=result; 
END; 
                                                       FUNCTION CONCGRAPH19:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=113;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH19:=result; 
END; 
                                                       FUNCTION CONCGRAPH20:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=114;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH20:=result; 
END; 
                                                       FUNCTION CONCGRAPH21:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=115;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH21:=result; 
END; 
                                                       FUNCTION CONCGRAPH22:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=116;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH22:=result; 
END; 
                                                       FUNCTION CONCGRAPH23:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=117;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH23:=result; 
END; 
                                                       FUNCTION CONCGRAPH24:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=118;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH24:=result; 
END; 
                                                       FUNCTION CONCGRAPH25:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=119;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH25:=result; 
END; 
                                                       FUNCTION CONCGRAPH26:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=135;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH26:=result; 
END; 
                                                       FUNCTION CONCGRAPH27:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=136;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH27:=result; 
END; 
                                                       FUNCTION CONCGRAPH28:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=137;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH28:=result; 
END; 
                                                       FUNCTION CONCGRAPH29:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=138;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH29:=result; 
END; 
                                                       FUNCTION CONCGRAPH30:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=139;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH30:=result; 
END; 
                                                       FUNCTION CONCGRAPH31:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=140;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH31:=result; 
END; 
                                                       FUNCTION CONCGRAPH32:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=120;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH32:=result; 
END; 
                                                       FUNCTION CONCGRAPH33:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=121;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH33:=result; 
END; 
                                                       FUNCTION CONCGRAPH34:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=122;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH34:=result; 
END; 
                                                       FUNCTION CONCGRAPH35:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=94;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH35:=result; 
END; 
                                                       FUNCTION CONCGRAPH36:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=123;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH36:=result; 
END; 
                                                       FUNCTION CONCGRAPH37:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=124;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH37:=result; 
END; 
                                                       FUNCTION CONCGRAPH38:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=125;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH38:=result; 
END; 
                                                       FUNCTION CONCGRAPH39:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=126;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH39:=result; 
END; 
                                                       FUNCTION CONCGRAPH40:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=127;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH40:=result; 
END; 
                                                       FUNCTION CONCGRAPH41:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=128;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH41:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
AppendCtrlExpr(CONCGRAPH6,result); 
AppendCtrlExpr(CONCGRAPH7,result); 
AppendCtrlExpr(CONCGRAPH8,result); 
AppendCtrlExpr(CONCGRAPH9,result); 
AppendCtrlExpr(CONCGRAPH10,result); 
AppendCtrlExpr(CONCGRAPH11,result); 
AppendCtrlExpr(CONCGRAPH12,result); 
AppendCtrlExpr(CONCGRAPH13,result); 
AppendCtrlExpr(CONCGRAPH14,result); 
AppendCtrlExpr(CONCGRAPH15,result); 
AppendCtrlExpr(CONCGRAPH16,result); 
AppendCtrlExpr(CONCGRAPH17,result); 
AppendCtrlExpr(CONCGRAPH18,result); 
AppendCtrlExpr(CONCGRAPH19,result); 
AppendCtrlExpr(CONCGRAPH20,result); 
AppendCtrlExpr(CONCGRAPH21,result); 
AppendCtrlExpr(CONCGRAPH22,result); 
AppendCtrlExpr(CONCGRAPH23,result); 
AppendCtrlExpr(CONCGRAPH24,result); 
AppendCtrlExpr(CONCGRAPH25,result); 
AppendCtrlExpr(CONCGRAPH26,result); 
AppendCtrlExpr(CONCGRAPH27,result); 
AppendCtrlExpr(CONCGRAPH28,result); 
AppendCtrlExpr(CONCGRAPH29,result); 
AppendCtrlExpr(CONCGRAPH30,result); 
AppendCtrlExpr(CONCGRAPH31,result); 
AppendCtrlExpr(CONCGRAPH32,result); 
AppendCtrlExpr(CONCGRAPH33,result); 
AppendCtrlExpr(CONCGRAPH34,result); 
AppendCtrlExpr(CONCGRAPH35,result); 
AppendCtrlExpr(CONCGRAPH36,result); 
AppendCtrlExpr(CONCGRAPH37,result); 
AppendCtrlExpr(CONCGRAPH38,result); 
AppendCtrlExpr(CONCGRAPH39,result); 
AppendCtrlExpr(CONCGRAPH40,result); 
AppendCtrlExpr(CONCGRAPH41,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH1:=result; 
END; 
                                                       FUNCTION ELEMGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=99;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=100;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=101;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=102;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=105;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=103;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=104;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH7:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
AppendCtrlExpr(CONCGRAPH6,result); 
AppendCtrlExpr(CONCGRAPH7,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH2:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=97;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=95;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=96;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=98;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH3:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=292;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=293;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH4:=result; 
END; 
                                                       FUNCTION ELEMGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=104;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=105;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=106;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH5:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=83;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=84;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=284;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=285;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=287;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=288;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=289;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=294;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=295;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH9:=result; 
END; 
                                                       FUNCTION CONCGRAPH10:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=296;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH10:=result; 
END; 
                                                       FUNCTION CONCGRAPH11:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=85;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH11:=result; 
END; 
                                                       FUNCTION CONCGRAPH12:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=290;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH12:=result; 
END; 
                                                       FUNCTION CONCGRAPH13:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=291;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH13:=result; 
END; 
                                                       FUNCTION CONCGRAPH14:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=286;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH14:=result; 
END; 
                                                       FUNCTION CONCGRAPH15:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=297;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH15:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
AppendCtrlExpr(CONCGRAPH6,result); 
AppendCtrlExpr(CONCGRAPH7,result); 
AppendCtrlExpr(CONCGRAPH8,result); 
AppendCtrlExpr(CONCGRAPH9,result); 
AppendCtrlExpr(CONCGRAPH10,result); 
AppendCtrlExpr(CONCGRAPH11,result); 
AppendCtrlExpr(CONCGRAPH12,result); 
AppendCtrlExpr(CONCGRAPH13,result); 
AppendCtrlExpr(CONCGRAPH14,result); 
AppendCtrlExpr(CONCGRAPH15,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH6:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=178;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH7:=result; 
END; 
                                                       FUNCTION ELEMGRAPH8:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=327;
ELEMGRAPH8:=result; 
END; 
                                                       FUNCTION ELEMGRAPH9:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=170;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=171;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=172;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=224;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=169;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=225;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=173;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=226;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=227;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH9:=result; 
END; 
                                                       FUNCTION CONCGRAPH10:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=228;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH10:=result; 
END; 
                                                       FUNCTION CONCGRAPH11:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=174;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH11:=result; 
END; 
                                                       FUNCTION CONCGRAPH12:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=230;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH12:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
AppendCtrlExpr(CONCGRAPH6,result); 
AppendCtrlExpr(CONCGRAPH7,result); 
AppendCtrlExpr(CONCGRAPH8,result); 
AppendCtrlExpr(CONCGRAPH9,result); 
AppendCtrlExpr(CONCGRAPH10,result); 
AppendCtrlExpr(CONCGRAPH11,result); 
AppendCtrlExpr(CONCGRAPH12,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH9:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH10:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=229;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH10:=result; 
END; 
                                                       FUNCTION ELEMGRAPH11:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=335;
ELEMGRAPH11:=result; 
END; 
                                                       FUNCTION ELEMGRAPH12:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=324;
ELEMGRAPH12:=result; 
END; 
                                                       FUNCTION ELEMGRAPH13:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=175;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH13:=result; 
END; 
                                                       FUNCTION ELEMGRAPH14:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=323;
ELEMGRAPH14:=result; 
END; 
                                                       FUNCTION ELEMGRAPH15:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=176;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH15:=result; 
END; 
                                                       FUNCTION ELEMGRAPH16:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=325;
ELEMGRAPH16:=result; 
END; 
                                                       FUNCTION ELEMGRAPH17:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=339;
ELEMGRAPH17:=result; 
END; 
                                                       FUNCTION ELEMGRAPH18:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=242;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH18:=result; 
END; 
                                                       FUNCTION ELEMGRAPH19:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=338;
ELEMGRAPH19:=result; 
END; 
                                                       FUNCTION ELEMGRAPH20:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=243;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=244;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=245;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=246;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH20:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH21:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=41;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=42;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH21:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH22:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=293;
ELEMGRAPH22:=result; 
END; 
                                                       FUNCTION ELEMGRAPH23:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=91;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=92;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=93;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=94;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=95;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH23:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH24:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=77;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=78;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=79;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=80;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=81;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=82;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=83;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=84;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=85;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH9:=result; 
END; 
                                                       FUNCTION CONCGRAPH10:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=86;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH10:=result; 
END; 
                                                       FUNCTION CONCGRAPH11:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=88;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH11:=result; 
END; 
                                                       FUNCTION CONCGRAPH12:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=89;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH12:=result; 
END; 
                                                       FUNCTION CONCGRAPH13:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=90;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH13:=result; 
END; 
                                                       FUNCTION CONCGRAPH14:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=65;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH14:=result; 
END; 
                                                       FUNCTION CONCGRAPH15:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=66;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH15:=result; 
END; 
                                                       FUNCTION CONCGRAPH16:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=67;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH16:=result; 
END; 
                                                       FUNCTION CONCGRAPH17:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=68;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH17:=result; 
END; 
                                                       FUNCTION CONCGRAPH18:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=69;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH18:=result; 
END; 
                                                       FUNCTION CONCGRAPH19:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=70;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH19:=result; 
END; 
                                                       FUNCTION CONCGRAPH20:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=71;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH20:=result; 
END; 
                                                       FUNCTION CONCGRAPH21:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=72;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH21:=result; 
END; 
                                                       FUNCTION CONCGRAPH22:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=73;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH22:=result; 
END; 
                                                       FUNCTION CONCGRAPH23:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=74;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH23:=result; 
END; 
                                                       FUNCTION CONCGRAPH24:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=75;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH24:=result; 
END; 
                                                       FUNCTION CONCGRAPH25:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=76;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH25:=result; 
END; 
                                                       FUNCTION CONCGRAPH26:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=33;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH26:=result; 
END; 
                                                       FUNCTION CONCGRAPH27:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=34;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH27:=result; 
END; 
                                                       FUNCTION CONCGRAPH28:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=35;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH28:=result; 
END; 
                                                       FUNCTION CONCGRAPH29:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=36;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH29:=result; 
END; 
                                                       FUNCTION CONCGRAPH30:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=37;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH30:=result; 
END; 
                                                       FUNCTION CONCGRAPH31:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=87;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH31:=result; 
END; 
                                                       FUNCTION CONCGRAPH32:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=38;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH32:=result; 
END; 
                                                       FUNCTION CONCGRAPH33:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=39;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH33:=result; 
END; 
                                                       FUNCTION CONCGRAPH34:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=40;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH34:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
AppendCtrlExpr(CONCGRAPH6,result); 
AppendCtrlExpr(CONCGRAPH7,result); 
AppendCtrlExpr(CONCGRAPH8,result); 
AppendCtrlExpr(CONCGRAPH9,result); 
AppendCtrlExpr(CONCGRAPH10,result); 
AppendCtrlExpr(CONCGRAPH11,result); 
AppendCtrlExpr(CONCGRAPH12,result); 
AppendCtrlExpr(CONCGRAPH13,result); 
AppendCtrlExpr(CONCGRAPH14,result); 
AppendCtrlExpr(CONCGRAPH15,result); 
AppendCtrlExpr(CONCGRAPH16,result); 
AppendCtrlExpr(CONCGRAPH17,result); 
AppendCtrlExpr(CONCGRAPH18,result); 
AppendCtrlExpr(CONCGRAPH19,result); 
AppendCtrlExpr(CONCGRAPH20,result); 
AppendCtrlExpr(CONCGRAPH21,result); 
AppendCtrlExpr(CONCGRAPH22,result); 
AppendCtrlExpr(CONCGRAPH23,result); 
AppendCtrlExpr(CONCGRAPH24,result); 
AppendCtrlExpr(CONCGRAPH25,result); 
AppendCtrlExpr(CONCGRAPH26,result); 
AppendCtrlExpr(CONCGRAPH27,result); 
AppendCtrlExpr(CONCGRAPH28,result); 
AppendCtrlExpr(CONCGRAPH29,result); 
AppendCtrlExpr(CONCGRAPH30,result); 
AppendCtrlExpr(CONCGRAPH31,result); 
AppendCtrlExpr(CONCGRAPH32,result); 
AppendCtrlExpr(CONCGRAPH33,result); 
AppendCtrlExpr(CONCGRAPH34,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH24:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH25:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=257;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=258;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=259;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=260;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=261;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH1:=GRAPH 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH25:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH26:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=237;
ELEMGRAPH26:=result; 
END; 
                                                       FUNCTION ELEMGRAPH27:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=389;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=390;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=391;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=392;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH27:=result; 
END; 
                                                       FUNCTION ELEMGRAPH28:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=75;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=78;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=79;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=80;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=76;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=77;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=81;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH7:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
AppendCtrlExpr(CONCGRAPH6,result); 
AppendCtrlExpr(CONCGRAPH7,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH28:=result; 
END; 
                                                       FUNCTION ELEMGRAPH29:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=58;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=59;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=60;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=61;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=62;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=63;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=64;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH7:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
AppendCtrlExpr(CONCGRAPH6,result); 
AppendCtrlExpr(CONCGRAPH7,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH29:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH30:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=337;
ELEMGRAPH30:=result; 
END; 
                                                       FUNCTION ELEMGRAPH31:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=238;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=239;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=240;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=241;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH31:=result; 
END; 
                                                       FUNCTION ELEMGRAPH32:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=336;
ELEMGRAPH32:=result; 
END; 
                                                       FUNCTION ELEMGRAPH33:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=54;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=55;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH33:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH34:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=56;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=57;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH34:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH35:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=279;
ELEMGRAPH1:=result; 
END; 
                                                       FUNCTION ELEMGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=46;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=47;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH2:=result; 
END; 
                                                       FUNCTION ELEMGRAPH3:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=286;
ELEMGRAPH3:=result; 
END; 
                                                       FUNCTION ELEMGRAPH4:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=280;
ELEMGRAPH4:=result; 
END; 
                                                       FUNCTION ELEMGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=48;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH5:=result; 
END; 
                                                       FUNCTION ELEMGRAPH6:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=287;
ELEMGRAPH6:=result; 
END; 
                                                       FUNCTION ELEMGRAPH7:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=281;
ELEMGRAPH7:=result; 
END; 
                                                       FUNCTION ELEMGRAPH8:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=49;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH8:=result; 
END; 
                                                       FUNCTION ELEMGRAPH9:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=288;
ELEMGRAPH9:=result; 
END; 
                                                       FUNCTION ELEMGRAPH10:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=282;
ELEMGRAPH10:=result; 
END; 
                                                       FUNCTION ELEMGRAPH11:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=50;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH11:=result; 
END; 
                                                       FUNCTION ELEMGRAPH12:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=289;
ELEMGRAPH12:=result; 
END; 
                                                       FUNCTION ELEMGRAPH13:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=283;
ELEMGRAPH13:=result; 
END; 
                                                       FUNCTION ELEMGRAPH14:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=51;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH14:=result; 
END; 
                                                       FUNCTION ELEMGRAPH15:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=290;
ELEMGRAPH15:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
AppendCtrlExpr(ELEMGRAPH2,result); 
AppendCtrlExpr(ELEMGRAPH3,result); 
AppendCtrlExpr(ELEMGRAPH4,result); 
AppendCtrlExpr(ELEMGRAPH5,result); 
AppendCtrlExpr(ELEMGRAPH6,result); 
AppendCtrlExpr(ELEMGRAPH7,result); 
AppendCtrlExpr(ELEMGRAPH8,result); 
AppendCtrlExpr(ELEMGRAPH9,result); 
AppendCtrlExpr(ELEMGRAPH10,result); 
AppendCtrlExpr(ELEMGRAPH11,result); 
AppendCtrlExpr(ELEMGRAPH12,result); 
AppendCtrlExpr(ELEMGRAPH13,result); 
AppendCtrlExpr(ELEMGRAPH14,result); 
AppendCtrlExpr(ELEMGRAPH15,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH35:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH36:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=284;
ELEMGRAPH36:=result; 
END; 
                                                       FUNCTION ELEMGRAPH37:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=52;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH37:=result; 
END; 
                                                       FUNCTION ELEMGRAPH38:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=291;
ELEMGRAPH38:=result; 
END; 
                                                       FUNCTION ELEMGRAPH39:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=285;
ELEMGRAPH39:=result; 
END; 
                                                       FUNCTION ELEMGRAPH40:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=53;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH40:=result; 
END; 
                                                       FUNCTION ELEMGRAPH41:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=292;
ELEMGRAPH41:=result; 
END; 
                                                       FUNCTION ELEMGRAPH42:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=344;
ELEMGRAPH1:=result; 
END; 
                                                       FUNCTION ELEMGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=15;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=16;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=17;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=18;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=19;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=20;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=21;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=22;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=23;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH9:=result; 
END; 
                                                       FUNCTION CONCGRAPH10:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=24;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH10:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
AppendCtrlExpr(CONCGRAPH6,result); 
AppendCtrlExpr(CONCGRAPH7,result); 
AppendCtrlExpr(CONCGRAPH8,result); 
AppendCtrlExpr(CONCGRAPH9,result); 
AppendCtrlExpr(CONCGRAPH10,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH2:=result; 
END; 
                                                       FUNCTION ELEMGRAPH3:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=345;
ELEMGRAPH3:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
AppendCtrlExpr(ELEMGRAPH2,result); 
AppendCtrlExpr(ELEMGRAPH3,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH42:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH43:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=278;
ELEMGRAPH43:=result; 
END; 
                                                       FUNCTION ELEMGRAPH44:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=74;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH44:=result; 
END; 
                                                       FUNCTION ELEMGRAPH45:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=43;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=44;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=45;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH45:=GRAPH 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
AppendCtrlExpr(ELEMGRAPH2,result); 
AppendCtrlExpr(ELEMGRAPH3,result); 
AppendCtrlExpr(ELEMGRAPH4,result); 
AppendCtrlExpr(ELEMGRAPH5,result); 
AppendCtrlExpr(ELEMGRAPH6,result); 
AppendCtrlExpr(ELEMGRAPH7,result); 
AppendCtrlExpr(ELEMGRAPH8,result); 
AppendCtrlExpr(ELEMGRAPH9,result); 
AppendCtrlExpr(ELEMGRAPH10,result); 
AppendCtrlExpr(ELEMGRAPH11,result); 
AppendCtrlExpr(ELEMGRAPH12,result); 
AppendCtrlExpr(ELEMGRAPH13,result); 
AppendCtrlExpr(ELEMGRAPH14,result); 
AppendCtrlExpr(ELEMGRAPH15,result); 
AppendCtrlExpr(ELEMGRAPH16,result); 
AppendCtrlExpr(ELEMGRAPH17,result); 
AppendCtrlExpr(ELEMGRAPH18,result); 
AppendCtrlExpr(ELEMGRAPH19,result); 
AppendCtrlExpr(ELEMGRAPH20,result); 
AppendCtrlExpr(ELEMGRAPH21,result); 
AppendCtrlExpr(ELEMGRAPH22,result); 
AppendCtrlExpr(ELEMGRAPH23,result); 
AppendCtrlExpr(ELEMGRAPH24,result); 
AppendCtrlExpr(ELEMGRAPH25,result); 
AppendCtrlExpr(ELEMGRAPH26,result); 
AppendCtrlExpr(ELEMGRAPH27,result); 
AppendCtrlExpr(ELEMGRAPH28,result); 
AppendCtrlExpr(ELEMGRAPH29,result); 
AppendCtrlExpr(ELEMGRAPH30,result); 
AppendCtrlExpr(ELEMGRAPH31,result); 
AppendCtrlExpr(ELEMGRAPH32,result); 
AppendCtrlExpr(ELEMGRAPH33,result); 
AppendCtrlExpr(ELEMGRAPH34,result); 
AppendCtrlExpr(ELEMGRAPH35,result); 
AppendCtrlExpr(ELEMGRAPH36,result); 
AppendCtrlExpr(ELEMGRAPH37,result); 
AppendCtrlExpr(ELEMGRAPH38,result); 
AppendCtrlExpr(ELEMGRAPH39,result); 
AppendCtrlExpr(ELEMGRAPH40,result); 
AppendCtrlExpr(ELEMGRAPH41,result); 
AppendCtrlExpr(ELEMGRAPH42,result); 
AppendCtrlExpr(ELEMGRAPH43,result); 
AppendCtrlExpr(ELEMGRAPH44,result); 
AppendCtrlExpr(ELEMGRAPH45,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
BEGIN 
XPPROPTOCLAUSE:=GRAPH 
END; 
FUNCTION CLAUSETOSENTENCE:LDMRULES_pCtrlExpr; 
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=31;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=32;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH1:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH2:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=334;
ELEMGRAPH2:=result; 
END; 
                                                       FUNCTION ELEMGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=337;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=338;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=340;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=342;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=339;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=341;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=343;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH7:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
AppendCtrlExpr(CONCGRAPH6,result); 
AppendCtrlExpr(CONCGRAPH7,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH3:=result; 
END; 
                                                       FUNCTION ELEMGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=16;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH4:=result; 
END; 
                                                       FUNCTION ELEMGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=26;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=25;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=28;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=29;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=27;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=30;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH6:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
AppendCtrlExpr(CONCGRAPH6,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH5:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=304;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=305;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=306;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=307;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH6:=result; 
END; 
                                                       FUNCTION ELEMGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=103;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH7:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH8:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=14;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH8:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH9:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=90;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=92;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=91;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=93;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=55;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=56;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=57;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=58;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=59;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH9:=result; 
END; 
                                                       FUNCTION CONCGRAPH10:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=61;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH10:=result; 
END; 
                                                       FUNCTION CONCGRAPH11:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=62;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH11:=result; 
END; 
                                                       FUNCTION CONCGRAPH12:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=44;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH12:=result; 
END; 
                                                       FUNCTION CONCGRAPH13:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=45;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH13:=result; 
END; 
                                                       FUNCTION CONCGRAPH14:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=46;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH14:=result; 
END; 
                                                       FUNCTION CONCGRAPH15:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=63;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH15:=result; 
END; 
                                                       FUNCTION CONCGRAPH16:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=64;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH16:=result; 
END; 
                                                       FUNCTION CONCGRAPH17:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=65;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH17:=result; 
END; 
                                                       FUNCTION CONCGRAPH18:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=66;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH18:=result; 
END; 
                                                       FUNCTION CONCGRAPH19:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=67;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH19:=result; 
END; 
                                                       FUNCTION CONCGRAPH20:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=68;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH20:=result; 
END; 
                                                       FUNCTION CONCGRAPH21:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=69;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH21:=result; 
END; 
                                                       FUNCTION CONCGRAPH22:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=70;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH22:=result; 
END; 
                                                       FUNCTION CONCGRAPH23:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=71;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH23:=result; 
END; 
                                                       FUNCTION CONCGRAPH24:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=72;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH24:=result; 
END; 
                                                       FUNCTION CONCGRAPH25:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=73;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH25:=result; 
END; 
                                                       FUNCTION CONCGRAPH26:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=48;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH26:=result; 
END; 
                                                       FUNCTION CONCGRAPH27:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=47;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH27:=result; 
END; 
                                                       FUNCTION CONCGRAPH28:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=49;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH28:=result; 
END; 
                                                       FUNCTION CONCGRAPH29:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=50;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH29:=result; 
END; 
                                                       FUNCTION CONCGRAPH30:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=51;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH30:=result; 
END; 
                                                       FUNCTION CONCGRAPH31:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=52;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH31:=result; 
END; 
                                                       FUNCTION CONCGRAPH32:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=53;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH32:=result; 
END; 
                                                       FUNCTION CONCGRAPH33:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=54;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH33:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
AppendCtrlExpr(CONCGRAPH6,result); 
AppendCtrlExpr(CONCGRAPH7,result); 
AppendCtrlExpr(CONCGRAPH8,result); 
AppendCtrlExpr(CONCGRAPH9,result); 
AppendCtrlExpr(CONCGRAPH10,result); 
AppendCtrlExpr(CONCGRAPH11,result); 
AppendCtrlExpr(CONCGRAPH12,result); 
AppendCtrlExpr(CONCGRAPH13,result); 
AppendCtrlExpr(CONCGRAPH14,result); 
AppendCtrlExpr(CONCGRAPH15,result); 
AppendCtrlExpr(CONCGRAPH16,result); 
AppendCtrlExpr(CONCGRAPH17,result); 
AppendCtrlExpr(CONCGRAPH18,result); 
AppendCtrlExpr(CONCGRAPH19,result); 
AppendCtrlExpr(CONCGRAPH20,result); 
AppendCtrlExpr(CONCGRAPH21,result); 
AppendCtrlExpr(CONCGRAPH22,result); 
AppendCtrlExpr(CONCGRAPH23,result); 
AppendCtrlExpr(CONCGRAPH24,result); 
AppendCtrlExpr(CONCGRAPH25,result); 
AppendCtrlExpr(CONCGRAPH26,result); 
AppendCtrlExpr(CONCGRAPH27,result); 
AppendCtrlExpr(CONCGRAPH28,result); 
AppendCtrlExpr(CONCGRAPH29,result); 
AppendCtrlExpr(CONCGRAPH30,result); 
AppendCtrlExpr(CONCGRAPH31,result); 
AppendCtrlExpr(CONCGRAPH32,result); 
AppendCtrlExpr(CONCGRAPH33,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH9:=result; 
END; 
                                                       FUNCTION ELEMGRAPH10:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=271;
ELEMGRAPH10:=result; 
END; 
                                                       FUNCTION ELEMGRAPH11:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=1;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=2;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=3;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=4;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH11:=result; 
END; 
                                                       FUNCTION ELEMGRAPH12:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=270;
ELEMGRAPH12:=result; 
END; 
                                                       FUNCTION ELEMGRAPH13:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=269;
ELEMGRAPH13:=result; 
END; 
                                                       FUNCTION ELEMGRAPH14:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=247;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=248;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH14:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH15:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=298;
ELEMGRAPH15:=result; 
END; 
                                                       FUNCTION ELEMGRAPH16:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=82;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH16:=result; 
END; 
                                                       FUNCTION ELEMGRAPH17:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=33;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=34;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=35;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=36;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH1:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH2:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=13;
ELEMGRAPH2:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
AppendCtrlExpr(ELEMGRAPH2,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH1:=GRAPH 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=37;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=38;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=39;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=40;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=41;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=18;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=42;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH9:=result; 
END; 
                                                       FUNCTION CONCGRAPH10:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=43;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH10:=result; 
END; 
                                                       FUNCTION CONCGRAPH11:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=19;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH11:=result; 
END; 
                                                       FUNCTION CONCGRAPH12:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=20;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH12:=result; 
END; 
                                                       FUNCTION CONCGRAPH13:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=21;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH13:=result; 
END; 
                                                       FUNCTION CONCGRAPH14:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=22;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH14:=result; 
END; 
                                                       FUNCTION CONCGRAPH15:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=23;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH15:=result; 
END; 
                                                       FUNCTION CONCGRAPH16:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=24;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH16:=result; 
END; 
                                                       FUNCTION CONCGRAPH17:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=25;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH17:=result; 
END; 
                                                       FUNCTION CONCGRAPH18:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=26;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH18:=result; 
END; 
                                                       FUNCTION CONCGRAPH19:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=27;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH19:=result; 
END; 
                                                       FUNCTION CONCGRAPH20:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=28;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH20:=result; 
END; 
                                                       FUNCTION CONCGRAPH21:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=29;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH21:=result; 
END; 
                                                       FUNCTION CONCGRAPH22:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=30;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH22:=result; 
END; 
                                                       FUNCTION CONCGRAPH23:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=31;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH23:=result; 
END; 
                                                       FUNCTION CONCGRAPH24:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=32;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH24:=result; 
END; 
                                                       FUNCTION CONCGRAPH25:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=13;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH25:=result; 
END; 
                                                       FUNCTION CONCGRAPH26:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=12;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH26:=result; 
END; 
                                                       FUNCTION CONCGRAPH27:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=14;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH27:=result; 
END; 
                                                       FUNCTION CONCGRAPH28:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=15;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH28:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
AppendCtrlExpr(CONCGRAPH6,result); 
AppendCtrlExpr(CONCGRAPH7,result); 
AppendCtrlExpr(CONCGRAPH8,result); 
AppendCtrlExpr(CONCGRAPH9,result); 
AppendCtrlExpr(CONCGRAPH10,result); 
AppendCtrlExpr(CONCGRAPH11,result); 
AppendCtrlExpr(CONCGRAPH12,result); 
AppendCtrlExpr(CONCGRAPH13,result); 
AppendCtrlExpr(CONCGRAPH14,result); 
AppendCtrlExpr(CONCGRAPH15,result); 
AppendCtrlExpr(CONCGRAPH16,result); 
AppendCtrlExpr(CONCGRAPH17,result); 
AppendCtrlExpr(CONCGRAPH18,result); 
AppendCtrlExpr(CONCGRAPH19,result); 
AppendCtrlExpr(CONCGRAPH20,result); 
AppendCtrlExpr(CONCGRAPH21,result); 
AppendCtrlExpr(CONCGRAPH22,result); 
AppendCtrlExpr(CONCGRAPH23,result); 
AppendCtrlExpr(CONCGRAPH24,result); 
AppendCtrlExpr(CONCGRAPH25,result); 
AppendCtrlExpr(CONCGRAPH26,result); 
AppendCtrlExpr(CONCGRAPH27,result); 
AppendCtrlExpr(CONCGRAPH28,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH17:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH18:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=384;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=385;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=387;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=388;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=386;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH18:=result; 
END; 
                                                       FUNCTION ELEMGRAPH19:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=182;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH19:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH20:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=179;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH20:=result; 
END; 
                                                       FUNCTION ELEMGRAPH21:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=328;
ELEMGRAPH21:=result; 
END; 
                                                       FUNCTION ELEMGRAPH22:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=180;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH22:=result; 
END; 
                                                       FUNCTION ELEMGRAPH23:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=329;
ELEMGRAPH23:=result; 
END; 
                                                       FUNCTION ELEMGRAPH24:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=181;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH24:=result; 
END; 
                                                       FUNCTION ELEMGRAPH25:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=330;
ELEMGRAPH25:=result; 
END; 
                                                       FUNCTION ELEMGRAPH26:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=177;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH26:=result; 
END; 
                                                       FUNCTION ELEMGRAPH27:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=326;
ELEMGRAPH27:=result; 
END; 
                                                       FUNCTION ELEMGRAPH28:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=100;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH28:=result; 
END; 
                                                       FUNCTION ELEMGRAPH29:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=294;
ELEMGRAPH29:=result; 
END; 
                                                       FUNCTION ELEMGRAPH30:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=101;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH30:=result; 
END; 
                                                       FUNCTION ELEMGRAPH31:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=295;
ELEMGRAPH31:=result; 
END; 
                                                       FUNCTION ELEMGRAPH32:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=96;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=97;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=98;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=99;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH32:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH33:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=297;
ELEMGRAPH33:=result; 
END; 
                                                       FUNCTION ELEMGRAPH34:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=102;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH34:=result; 
END; 
                                                       FUNCTION ELEMGRAPH35:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=296;
ELEMGRAPH35:=result; 
END; 
                                                       FUNCTION ELEMGRAPH36:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=249;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=250;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=251;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=252;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=253;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=254;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=255;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH7:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
AppendCtrlExpr(CONCGRAPH6,result); 
AppendCtrlExpr(CONCGRAPH7,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH36:=result; 
END; 
                                                       FUNCTION ELEMGRAPH37:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=256;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH37:=result; 
END; 
                                                       FUNCTION ELEMGRAPH38:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=340;
ELEMGRAPH38:=result; 
END; 
                                                       FUNCTION ELEMGRAPH39:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=200;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=201;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=202;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH39:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH40:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=332;
ELEMGRAPH40:=result; 
END; 
                                                       FUNCTION ELEMGRAPH41:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=207;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH41:=result; 
END; 
                                                       FUNCTION ELEMGRAPH42:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=275;
ELEMGRAPH42:=result; 
END; 
                                                       FUNCTION ELEMGRAPH43:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=8;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH43:=result; 
END; 
                                                       FUNCTION ELEMGRAPH44:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=9;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=10;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=11;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH44:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH45:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=276;
ELEMGRAPH45:=result; 
END; 
                                                       FUNCTION ELEMGRAPH46:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=12;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH46:=result; 
END; 
                                                       FUNCTION ELEMGRAPH47:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=277;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH47:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH48:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=203;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=204;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=205;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=206;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH48:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH49:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=6;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=7;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH49:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH50:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=274;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH50:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH51:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=11;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH51:=result; 
END; 
                                                       FUNCTION ELEMGRAPH52:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=7;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=8;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=9;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=10;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH52:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH53:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=263;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=264;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH53:=result; 
END; 
                                                       FUNCTION ELEMGRAPH54:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=343;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH54:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH55:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=273;
ELEMGRAPH55:=result; 
END; 
                                                       FUNCTION ELEMGRAPH56:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=5;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH56:=result; 
END; 
                                                       FUNCTION ELEMGRAPH57:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=272;
ELEMGRAPH57:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
AppendCtrlExpr(ELEMGRAPH2,result); 
AppendCtrlExpr(ELEMGRAPH3,result); 
AppendCtrlExpr(ELEMGRAPH4,result); 
AppendCtrlExpr(ELEMGRAPH5,result); 
AppendCtrlExpr(ELEMGRAPH6,result); 
AppendCtrlExpr(ELEMGRAPH7,result); 
AppendCtrlExpr(ELEMGRAPH8,result); 
AppendCtrlExpr(ELEMGRAPH9,result); 
AppendCtrlExpr(ELEMGRAPH10,result); 
AppendCtrlExpr(ELEMGRAPH11,result); 
AppendCtrlExpr(ELEMGRAPH12,result); 
AppendCtrlExpr(ELEMGRAPH13,result); 
AppendCtrlExpr(ELEMGRAPH14,result); 
AppendCtrlExpr(ELEMGRAPH15,result); 
AppendCtrlExpr(ELEMGRAPH16,result); 
AppendCtrlExpr(ELEMGRAPH17,result); 
AppendCtrlExpr(ELEMGRAPH18,result); 
AppendCtrlExpr(ELEMGRAPH19,result); 
AppendCtrlExpr(ELEMGRAPH20,result); 
AppendCtrlExpr(ELEMGRAPH21,result); 
AppendCtrlExpr(ELEMGRAPH22,result); 
AppendCtrlExpr(ELEMGRAPH23,result); 
AppendCtrlExpr(ELEMGRAPH24,result); 
AppendCtrlExpr(ELEMGRAPH25,result); 
AppendCtrlExpr(ELEMGRAPH26,result); 
AppendCtrlExpr(ELEMGRAPH27,result); 
AppendCtrlExpr(ELEMGRAPH28,result); 
AppendCtrlExpr(ELEMGRAPH29,result); 
AppendCtrlExpr(ELEMGRAPH30,result); 
AppendCtrlExpr(ELEMGRAPH31,result); 
AppendCtrlExpr(ELEMGRAPH32,result); 
AppendCtrlExpr(ELEMGRAPH33,result); 
AppendCtrlExpr(ELEMGRAPH34,result); 
AppendCtrlExpr(ELEMGRAPH35,result); 
AppendCtrlExpr(ELEMGRAPH36,result); 
AppendCtrlExpr(ELEMGRAPH37,result); 
AppendCtrlExpr(ELEMGRAPH38,result); 
AppendCtrlExpr(ELEMGRAPH39,result); 
AppendCtrlExpr(ELEMGRAPH40,result); 
AppendCtrlExpr(ELEMGRAPH41,result); 
AppendCtrlExpr(ELEMGRAPH42,result); 
AppendCtrlExpr(ELEMGRAPH43,result); 
AppendCtrlExpr(ELEMGRAPH44,result); 
AppendCtrlExpr(ELEMGRAPH45,result); 
AppendCtrlExpr(ELEMGRAPH46,result); 
AppendCtrlExpr(ELEMGRAPH47,result); 
AppendCtrlExpr(ELEMGRAPH48,result); 
AppendCtrlExpr(ELEMGRAPH49,result); 
AppendCtrlExpr(ELEMGRAPH50,result); 
AppendCtrlExpr(ELEMGRAPH51,result); 
AppendCtrlExpr(ELEMGRAPH52,result); 
AppendCtrlExpr(ELEMGRAPH53,result); 
AppendCtrlExpr(ELEMGRAPH54,result); 
AppendCtrlExpr(ELEMGRAPH55,result); 
AppendCtrlExpr(ELEMGRAPH56,result); 
AppendCtrlExpr(ELEMGRAPH57,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
BEGIN 
CLAUSETOSENTENCE:=GRAPH 
END; 
FUNCTION NPDERIVATION:LDMRULES_pCtrlExpr; 
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=249;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=256;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=257;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=253;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=255;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=254;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=449;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH7:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
AppendCtrlExpr(CONCGRAPH6,result); 
AppendCtrlExpr(CONCGRAPH7,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH1:=GRAPH 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
BEGIN 
NPDERIVATION:=GRAPH 
END; 
FUNCTION CNFORMATION:LDMRULES_pCtrlExpr; 
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=250;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=251;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=252;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH1:=GRAPH 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH1:=result; 
END; 
                                                       FUNCTION ELEMGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=258;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=259;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=260;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=261;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=422;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH2:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=262;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=263;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH3:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=2;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=3;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH4:=result; 
END; 
                                                       FUNCTION ELEMGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=190;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=191;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH5:=result; 
END; 
                                                       FUNCTION ELEMGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=272;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH6:=result; 
END; 
                                                       FUNCTION ELEMGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=273;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=274;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH7:=result; 
END; 
                                                       FUNCTION ELEMGRAPH8:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=264;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=265;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=266;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=270;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=437;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=271;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=267;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=268;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=269;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH9:=result; 
END; 
                                                       FUNCTION CONCGRAPH10:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=435;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH10:=result; 
END; 
                                                       FUNCTION CONCGRAPH11:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=436;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH11:=result; 
END; 
                                                       FUNCTION CONCGRAPH12:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=438;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH12:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
AppendCtrlExpr(CONCGRAPH2,result); 
AppendCtrlExpr(CONCGRAPH3,result); 
AppendCtrlExpr(CONCGRAPH4,result); 
AppendCtrlExpr(CONCGRAPH5,result); 
AppendCtrlExpr(CONCGRAPH6,result); 
AppendCtrlExpr(CONCGRAPH7,result); 
AppendCtrlExpr(CONCGRAPH8,result); 
AppendCtrlExpr(CONCGRAPH9,result); 
AppendCtrlExpr(CONCGRAPH10,result); 
AppendCtrlExpr(CONCGRAPH11,result); 
AppendCtrlExpr(CONCGRAPH12,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH8:=result; 
END; 
                                                       FUNCTION ELEMGRAPH9:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=342;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH9:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH10:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=262;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH10:=result; 
END; 
                                                       FUNCTION ELEMGRAPH11:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=341;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH11:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH12:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=322;
ELEMGRAPH12:=result; 
END; 
                                                       FUNCTION ELEMGRAPH13:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=4;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH13:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
AppendCtrlExpr(ELEMGRAPH2,result); 
AppendCtrlExpr(ELEMGRAPH3,result); 
AppendCtrlExpr(ELEMGRAPH4,result); 
AppendCtrlExpr(ELEMGRAPH5,result); 
AppendCtrlExpr(ELEMGRAPH6,result); 
AppendCtrlExpr(ELEMGRAPH7,result); 
AppendCtrlExpr(ELEMGRAPH8,result); 
AppendCtrlExpr(ELEMGRAPH9,result); 
AppendCtrlExpr(ELEMGRAPH10,result); 
AppendCtrlExpr(ELEMGRAPH11,result); 
AppendCtrlExpr(ELEMGRAPH12,result); 
AppendCtrlExpr(ELEMGRAPH13,result); 
CONCGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
BEGIN 
CNFORMATION:=GRAPH 
END; 
BEGIN
  CtrlExpr[1]:=VERBDERIVATION;
  CtrlExpr[2]:=VERBPPROPFORMATION;
  CtrlExpr[3]:=XPPROPTOCLAUSE;
  CtrlExpr[4]:=CLAUSETOSENTENCE;
  CtrlExpr[5]:=NPDERIVATION;
  CtrlExpr[6]:=CNFORMATION;
  CtrlExpr[7]:=NPFORMATION;
  CtrlExpr[8]:=DETDERIVATION;
  CtrlExpr[9]:=DETPFORMATION;
  CtrlExpr[10]:=NPPROPFORMATION;
  CtrlExpr[11]:=TONPPROP;
  CtrlExpr[12]:=DATUMFORMATION;
  CtrlExpr[13]:=CARDINALFORMATION;
  CtrlExpr[14]:=QPFORMATION;
  CtrlExpr[15]:=ADJDERIVATION;
  CtrlExpr[16]:=ADJPPROPFORMATION;
  CtrlExpr[17]:=ADJPPROPTOADJPFORMULA;
  CtrlExpr[18]:=ADJPFORMULATOADJPPROP;
  CtrlExpr[19]:=ADVDERIVATION;
  CtrlExpr[20]:=ADVPFORMATION;
  CtrlExpr[21]:=ADVPPROPFORMATION;
  CtrlExpr[22]:=ADVPPROPTOFORMULA;
  CtrlExpr[23]:=ADVPFORMULATOPROP;
  CtrlExpr[24]:=PREPDERIVATION;
  CtrlExpr[25]:=PREPPPROPFORMATION;
  CtrlExpr[26]:=PREPPPROPTOFORMULA;
  CtrlExpr[27]:=PREPPFORMULATOPROP;
  CtrlExpr[28]:=PREPPFORMATION;
  CtrlExpr[29]:=IDENTPROPFORMATION;
  CtrlExpr[30]:=EXISTPROPFORMATION;
  CtrlExpr[31]:=UTTERANCE;
  CtrlExpr[32]:=COORDINATION;
END;
