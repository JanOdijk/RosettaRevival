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
FUNCTION UTTERANCE:LDMRULES_pCtrlExpr; 
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
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=406;
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
result^.R:=5;
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
result^.R:=6;
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
result^.R:=7;
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
                                                       FUNCTION ELEMGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
UTTERANCE:=GRAPH 
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
result^.T:=549;
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
result^.T:=391;
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
ELEMGRAPH2:=result; 
END; 
                                                       FUNCTION ELEMGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=548;
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
ELEMGRAPH3:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=547;
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
result^.R:=423;
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
result^.R:=424;
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
result^.R:=425;
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
result^.R:=426;
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
ELEMGRAPH5:=result; 
END; 
                                                       FUNCTION ELEMGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=333;
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
result^.T:=379;
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
result^.T:=380;
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
result^.T:=381;
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
result^.T:=382;
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
result^.T:=384;
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
result^.T:=383;
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
result^.T:=539;
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
result^.T:=372;
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
result^.T:=373;
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
result^.T:=537;
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
result^.T:=374;
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
result^.T:=375;
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
result^.T:=538;
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
ELEMGRAPH13:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH14:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=294;
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
result^.T:=295;
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
result^.T:=517;
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
ELEMGRAPH15:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH16:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=516;
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
ELEMGRAPH16:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH17:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=292;
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
result^.T:=293;
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
result^.T:=291;
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
result^.T:=515;
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
ELEMGRAPH18:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH19:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=296;
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
result^.T:=518;
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
result^.T:=305;
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
result^.T:=306;
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
result^.T:=307;
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
ELEMGRAPH21:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH22:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=541;
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
ELEMGRAPH22:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH23:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=376;
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
result^.T:=377;
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
result^.T:=378;
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
result^.T:=540;
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
result^.T:=446;
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
ELEMGRAPH25:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH26:LDMRULES_pCtrlExpr;
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
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=531;
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
ELEMGRAPH27:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH28:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=288;
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
result^.T:=286;
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
result^.T:=287;
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
result^.T:=289;
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
ELEMGRAPH28:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH29:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=543;
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
ELEMGRAPH29:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH30:LDMRULES_pCtrlExpr;
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
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
result^.T:=404;
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
ELEMGRAPH31:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH32:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=331;
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
ELEMGRAPH32:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH33:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
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
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
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
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
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
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=17;
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
result^.R:=18;
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
result^.R:=369;
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
result^.R:=373;
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
result^.R:=374;
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
result^.R:=25;
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
result^.R:=246;
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
result^.R:=370;
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
result^.R:=371;
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
result^.R:=372;
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
result^.R:=377;
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
result^.R:=378;
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
result^.R:=247;
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
result^.R:=375;
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
result^.R:=364;
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
result^.R:=9;
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
result^.R:=365;
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
result^.R:=376;
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
result^.R:=366;
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
result^.R:=367;
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
result^.R:=368;
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
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
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
result^.T:=298;
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
result^.T:=299;
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
ELEMGRAPH34:=result; 
END; 
                                                       FUNCTION ELEMGRAPH35:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=521;
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
ELEMGRAPH35:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH36:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=523;
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
ELEMGRAPH36:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH37:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=311;
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
result^.T:=312;
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
result^.T:=313;
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
result^.T:=314;
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
ELEMGRAPH37:=result; 
END; 
                                                       FUNCTION ELEMGRAPH38:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=522;
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
ELEMGRAPH38:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH39:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=362;
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
ELEMGRAPH39:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH40:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=355;
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
result^.T:=354;
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
result^.T:=356;
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
result^.T:=363;
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
ELEMGRAPH40:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH41:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=357;
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
result^.T:=358;
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
result^.T:=364;
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
ELEMGRAPH41:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH42:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=360;
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
result^.T:=359;
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
result^.T:=361;
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
result^.T:=365;
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
ELEMGRAPH42:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH43:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=500;
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
result^.R:=254;
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
result^.T:=532;
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
ELEMGRAPH45:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH46:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
result^.T:=426;
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
ELEMGRAPH47:=result; 
END; 
                                                       FUNCTION ELEMGRAPH48:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=444;
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
result^.T:=21;
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
ELEMGRAPH49:=result; 
END; 
                                                       FUNCTION ELEMGRAPH50:LDMRULES_pCtrlExpr;
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
ELEMGRAPH50:=result; 
END; 
                                                       FUNCTION ELEMGRAPH51:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=445;
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
ELEMGRAPH51:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH52:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
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
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
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
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=334;
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
result^.R:=335;
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
result^.R:=330;
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
result^.R:=331;
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
result^.R:=332;
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
result^.R:=341;
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
result^.R:=345;
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
result^.R:=342;
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
result^.R:=343;
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
result^.R:=344;
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
result^.R:=333;
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
result^.R:=340;
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
result^.R:=336;
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
result^.R:=346;
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
result^.R:=337;
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
result^.R:=338;
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
result^.R:=339;
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
result^.R:=347;
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
result^.R:=32;
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
result^.kind:=RULE;
result^.R:=413;
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
result^.R:=414;
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
result^.R:=415;
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
result^.R:=416;
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
result^.R:=417;
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
result^.R:=418;
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
result^.T:=334;
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
ELEMGRAPH55:=result; 
END; 
                                                       FUNCTION ELEMGRAPH56:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=508;
ELEMGRAPH56:=result; 
END; 
                                                       FUNCTION ELEMGRAPH57:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=510;
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
ELEMGRAPH57:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH58:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
ELEMGRAPH58:=result; 
END; 
                                                       FUNCTION ELEMGRAPH59:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=509;
ELEMGRAPH59:=result; 
END; 
                                                       FUNCTION ELEMGRAPH60:LDMRULES_pCtrlExpr;
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
ELEMGRAPH60:=result; 
END; 
                                                       FUNCTION ELEMGRAPH61:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=504;
ELEMGRAPH61:=result; 
END; 
                                                       FUNCTION ELEMGRAPH62:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=496;
ELEMGRAPH62:=result; 
END; 
                                                       FUNCTION ELEMGRAPH63:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
ELEMGRAPH63:=result; 
END; 
                                                       FUNCTION ELEMGRAPH64:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=495;
ELEMGRAPH64:=result; 
END; 
                                                       FUNCTION ELEMGRAPH65:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=494;
ELEMGRAPH65:=result; 
END; 
                                                       FUNCTION ELEMGRAPH66:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
ELEMGRAPH66:=result; 
END; 
                                                       FUNCTION ELEMGRAPH67:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=493;
ELEMGRAPH67:=result; 
END; 
                                                       FUNCTION ELEMGRAPH68:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=239;
ELEMGRAPH68:=result; 
END; 
                                                       FUNCTION ELEMGRAPH69:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=498;
ELEMGRAPH69:=result; 
END; 
                                                       FUNCTION ELEMGRAPH70:LDMRULES_pCtrlExpr;
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
ELEMGRAPH70:=result; 
END; 
                                                       FUNCTION ELEMGRAPH71:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=497;
ELEMGRAPH71:=result; 
END; 
                                                       FUNCTION ELEMGRAPH72:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=499;
ELEMGRAPH72:=result; 
END; 
                                                       FUNCTION ELEMGRAPH73:LDMRULES_pCtrlExpr;
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
ELEMGRAPH73:=result; 
END; 
                                                       FUNCTION ELEMGRAPH74:LDMRULES_pCtrlExpr;
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
ELEMGRAPH74:=result; 
END; 
                                                       FUNCTION ELEMGRAPH75:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=506;
ELEMGRAPH75:=result; 
END; 
                                                       FUNCTION ELEMGRAPH76:LDMRULES_pCtrlExpr;
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
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
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
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
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
ELEMGRAPH76:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH77:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
ELEMGRAPH77:=result; 
END; 
                                                       FUNCTION ELEMGRAPH78:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=304;
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
result^.T:=300;
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
result^.T:=301;
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
result^.T:=302;
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
result^.T:=303;
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
ELEMGRAPH78:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH79:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=328;
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
result^.T:=329;
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
result^.T:=330;
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
ELEMGRAPH79:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH80:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=571;
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
ELEMGRAPH80:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH81:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=432;
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
result^.T:=433;
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
ELEMGRAPH81:=result; 
END; 
                                                       FUNCTION ELEMGRAPH82:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=434;
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
ELEMGRAPH82:=result; 
END; 
                                                       FUNCTION ELEMGRAPH83:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=572;
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
ELEMGRAPH83:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH84:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=562;
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
ELEMGRAPH84:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH85:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=424;
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
ELEMGRAPH85:=result; 
END; 
                                                       FUNCTION ELEMGRAPH86:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=520;
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
ELEMGRAPH86:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH87:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=297;
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
ELEMGRAPH87:=result; 
END; 
                                                       FUNCTION ELEMGRAPH88:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=519;
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
ELEMGRAPH88:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH89:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=290;
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
ELEMGRAPH89:=result; 
END; 
                                                       FUNCTION ELEMGRAPH90:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=308;
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
result^.T:=309;
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
result^.T:=310;
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
ELEMGRAPH90:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH91:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
ELEMGRAPH91:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH92:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=536;
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
ELEMGRAPH92:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH93:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=411;
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
ELEMGRAPH93:=result; 
END; 
                                                       FUNCTION ELEMGRAPH94:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=407;
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
result^.R:=408;
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
result^.R:=409;
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
result^.R:=410;
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
ELEMGRAPH94:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH95:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=427;
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
ELEMGRAPH95:=result; 
END; 
                                                       FUNCTION ELEMGRAPH96:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=565;
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
ELEMGRAPH96:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH97:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=564;
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
ELEMGRAPH97:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH98:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=425;
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
ELEMGRAPH98:=result; 
END; 
                                                       FUNCTION ELEMGRAPH99:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=563;
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
ELEMGRAPH99:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH100:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=569;
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
ELEMGRAPH100:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH101:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=429;
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
ELEMGRAPH101:=result; 
END; 
                                                       FUNCTION ELEMGRAPH102:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=568;
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
ELEMGRAPH102:=GRAPH 
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
AppendCtrlExpr(ELEMGRAPH58,result); 
AppendCtrlExpr(ELEMGRAPH59,result); 
AppendCtrlExpr(ELEMGRAPH60,result); 
AppendCtrlExpr(ELEMGRAPH61,result); 
AppendCtrlExpr(ELEMGRAPH62,result); 
AppendCtrlExpr(ELEMGRAPH63,result); 
AppendCtrlExpr(ELEMGRAPH64,result); 
AppendCtrlExpr(ELEMGRAPH65,result); 
AppendCtrlExpr(ELEMGRAPH66,result); 
AppendCtrlExpr(ELEMGRAPH67,result); 
AppendCtrlExpr(ELEMGRAPH68,result); 
AppendCtrlExpr(ELEMGRAPH69,result); 
AppendCtrlExpr(ELEMGRAPH70,result); 
AppendCtrlExpr(ELEMGRAPH71,result); 
AppendCtrlExpr(ELEMGRAPH72,result); 
AppendCtrlExpr(ELEMGRAPH73,result); 
AppendCtrlExpr(ELEMGRAPH74,result); 
AppendCtrlExpr(ELEMGRAPH75,result); 
AppendCtrlExpr(ELEMGRAPH76,result); 
AppendCtrlExpr(ELEMGRAPH77,result); 
AppendCtrlExpr(ELEMGRAPH78,result); 
AppendCtrlExpr(ELEMGRAPH79,result); 
AppendCtrlExpr(ELEMGRAPH80,result); 
AppendCtrlExpr(ELEMGRAPH81,result); 
AppendCtrlExpr(ELEMGRAPH82,result); 
AppendCtrlExpr(ELEMGRAPH83,result); 
AppendCtrlExpr(ELEMGRAPH84,result); 
AppendCtrlExpr(ELEMGRAPH85,result); 
AppendCtrlExpr(ELEMGRAPH86,result); 
AppendCtrlExpr(ELEMGRAPH87,result); 
AppendCtrlExpr(ELEMGRAPH88,result); 
AppendCtrlExpr(ELEMGRAPH89,result); 
AppendCtrlExpr(ELEMGRAPH90,result); 
AppendCtrlExpr(ELEMGRAPH91,result); 
AppendCtrlExpr(ELEMGRAPH92,result); 
AppendCtrlExpr(ELEMGRAPH93,result); 
AppendCtrlExpr(ELEMGRAPH94,result); 
AppendCtrlExpr(ELEMGRAPH95,result); 
AppendCtrlExpr(ELEMGRAPH96,result); 
AppendCtrlExpr(ELEMGRAPH97,result); 
AppendCtrlExpr(ELEMGRAPH98,result); 
AppendCtrlExpr(ELEMGRAPH99,result); 
AppendCtrlExpr(ELEMGRAPH100,result); 
AppendCtrlExpr(ELEMGRAPH101,result); 
AppendCtrlExpr(ELEMGRAPH102,result); 
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
result^.R:=52;
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
result^.R:=53;
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
result^.R:=54;
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
result^.R:=55;
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
result^.R:=56;
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
result^.R:=57;
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
result^.R:=58;
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
result^.R:=59;
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
result^.R:=60;
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
result^.R:=256;
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
result^.R:=257;
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
result^.R:=258;
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
result^.R:=259;
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
result^.R:=260;
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
result^.R:=261;
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
result^.R:=262;
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
result^.R:=263;
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
result^.R:=264;
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
result^.R:=265;
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
result^.R:=62;
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
result^.R:=255;
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
result^.R:=64;
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
result^.R:=63;
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
result^.R:=266;
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
result^.R:=267;
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
result^.R:=269;
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
result^.R:=268;
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
result^.R:=270;
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
result^.R:=271;
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
result^.R:=65;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
result^.R:=45;
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
result^.R:=46;
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
result^.R:=47;
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
result^.R:=48;
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
result^.R:=49;
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
result^.R:=50;
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
result^.R:=51;
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
ELEMGRAPH3:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH4:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=337;
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
result^.R:=239;
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
result^.R:=240;
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
result^.R:=241;
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
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
result^.kind:=TRANSFORMATION;
result^.T:=525;
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
result^.T:=237;
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
result^.T:=238;
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
result^.R:=248;
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
result^.R:=249;
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
result^.R:=250;
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
result^.R:=272;
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
result^.R:=273;
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
result^.R:=278;
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
result^.R:=279;
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
result^.R:=280;
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
result^.R:=294;
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
result^.R:=290;
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
result^.R:=291;
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
result^.R:=292;
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
result^.R:=274;
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
result^.R:=275;
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
result^.R:=293;
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
result^.R:=251;
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
result^.R:=252;
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
result^.R:=253;
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
result^.R:=276;
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
result^.R:=277;
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
result^.R:=281;
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
result^.R:=282;
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
result^.R:=283;
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
result^.R:=284;
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
result^.R:=285;
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
result^.R:=287;
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
result^.R:=286;
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
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH9:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH10:LDMRULES_pCtrlExpr;
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
ELEMGRAPH10:=result; 
END; 
                                                       FUNCTION ELEMGRAPH11:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=507;
ELEMGRAPH11:=result; 
END; 
                                                       FUNCTION ELEMGRAPH12:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=385;
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
result^.T:=251;
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
result^.T:=386;
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
result^.T:=389;
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
result^.T:=387;
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
ELEMGRAPH12:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH13:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=388;
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
result^.T:=544;
ELEMGRAPH14:=result; 
END; 
                                                       FUNCTION ELEMGRAPH15:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=502;
ELEMGRAPH15:=result; 
END; 
                                                       FUNCTION ELEMGRAPH16:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
ELEMGRAPH16:=result; 
END; 
                                                       FUNCTION ELEMGRAPH17:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=501;
ELEMGRAPH17:=result; 
END; 
                                                       FUNCTION ELEMGRAPH18:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=546;
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
result^.T:=390;
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
ELEMGRAPH19:=result; 
END; 
                                                       FUNCTION ELEMGRAPH20:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=545;
ELEMGRAPH20:=result; 
END; 
                                                       FUNCTION ELEMGRAPH21:LDMRULES_pCtrlExpr;
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
ELEMGRAPH21:=result; 
END; 
                                                       FUNCTION ELEMGRAPH22:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=503;
ELEMGRAPH22:=result; 
END; 
                                                       FUNCTION ELEMGRAPH23:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=557;
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
result^.T:=413;
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
result^.T:=556;
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
result^.T:=418;
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
result^.T:=419;
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
result^.T:=420;
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
result^.T:=421;
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
result^.T:=422;
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
result^.T:=423;
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
ELEMGRAPH26:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH27:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
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
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
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
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=414;
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
result^.T:=415;
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
ELEMGRAPH27:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH28:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
ELEMGRAPH28:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH29:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=456;
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
ELEMGRAPH29:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH30:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=455;
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
ELEMGRAPH31:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH32:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
result^.T:=64;
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
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
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
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
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
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
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
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
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
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
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
CONCGRAPH9:=result; 
END; 
                                                       FUNCTION CONCGRAPH10:LDMRULES_pCtrlExpr;
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
CONCGRAPH10:=result; 
END; 
                                                       FUNCTION CONCGRAPH11:LDMRULES_pCtrlExpr;
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
CONCGRAPH11:=result; 
END; 
                                                       FUNCTION CONCGRAPH12:LDMRULES_pCtrlExpr;
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
CONCGRAPH12:=result; 
END; 
                                                       FUNCTION CONCGRAPH13:LDMRULES_pCtrlExpr;
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
CONCGRAPH13:=result; 
END; 
                                                       FUNCTION CONCGRAPH14:LDMRULES_pCtrlExpr;
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
CONCGRAPH14:=result; 
END; 
                                                       FUNCTION CONCGRAPH15:LDMRULES_pCtrlExpr;
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
CONCGRAPH15:=result; 
END; 
                                                       FUNCTION CONCGRAPH16:LDMRULES_pCtrlExpr;
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
CONCGRAPH16:=result; 
END; 
                                                       FUNCTION CONCGRAPH17:LDMRULES_pCtrlExpr;
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
CONCGRAPH17:=result; 
END; 
                                                       FUNCTION CONCGRAPH18:LDMRULES_pCtrlExpr;
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
CONCGRAPH18:=result; 
END; 
                                                       FUNCTION CONCGRAPH19:LDMRULES_pCtrlExpr;
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
CONCGRAPH19:=result; 
END; 
                                                       FUNCTION CONCGRAPH20:LDMRULES_pCtrlExpr;
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
CONCGRAPH20:=result; 
END; 
                                                       FUNCTION CONCGRAPH21:LDMRULES_pCtrlExpr;
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
CONCGRAPH21:=result; 
END; 
                                                       FUNCTION CONCGRAPH22:LDMRULES_pCtrlExpr;
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
CONCGRAPH22:=result; 
END; 
                                                       FUNCTION CONCGRAPH23:LDMRULES_pCtrlExpr;
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
CONCGRAPH23:=result; 
END; 
                                                       FUNCTION CONCGRAPH24:LDMRULES_pCtrlExpr;
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
CONCGRAPH24:=result; 
END; 
                                                       FUNCTION CONCGRAPH25:LDMRULES_pCtrlExpr;
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
CONCGRAPH25:=result; 
END; 
                                                       FUNCTION CONCGRAPH26:LDMRULES_pCtrlExpr;
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
CONCGRAPH26:=result; 
END; 
                                                       FUNCTION CONCGRAPH27:LDMRULES_pCtrlExpr;
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
CONCGRAPH27:=result; 
END; 
                                                       FUNCTION CONCGRAPH28:LDMRULES_pCtrlExpr;
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
CONCGRAPH28:=result; 
END; 
                                                       FUNCTION CONCGRAPH29:LDMRULES_pCtrlExpr;
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
CONCGRAPH29:=result; 
END; 
                                                       FUNCTION CONCGRAPH30:LDMRULES_pCtrlExpr;
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
CONCGRAPH30:=result; 
END; 
                                                       FUNCTION CONCGRAPH31:LDMRULES_pCtrlExpr;
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
CONCGRAPH31:=result; 
END; 
                                                       FUNCTION CONCGRAPH32:LDMRULES_pCtrlExpr;
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
CONCGRAPH32:=result; 
END; 
                                                       FUNCTION CONCGRAPH33:LDMRULES_pCtrlExpr;
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
result^.T:=408;
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
result^.T:=409;
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
ELEMGRAPH35:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH36:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=393;
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
result^.T:=392;
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
ELEMGRAPH36:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH37:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=431;
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
ELEMGRAPH37:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH38:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=471;
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
result^.R:=472;
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
result^.R:=473;
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
result^.R:=474;
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
result^.T:=336;
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
ELEMGRAPH39:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH40:LDMRULES_pCtrlExpr;
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
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
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
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
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
result^.R:=42;
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
result^.R:=43;
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
result^.R:=44;
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
result^.R:=40;
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
result^.T:=527;
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
result^.T:=11;
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
result^.T:=73;
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
result^.T:=74;
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
ELEMGRAPH43:=result; 
END; 
                                                       FUNCTION ELEMGRAPH44:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=457;
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
result^.T:=34;
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
result^.T:=35;
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
result^.T:=36;
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
result^.T:=37;
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
result^.T:=38;
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
result^.T:=39;
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
result^.T:=40;
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
result^.T:=41;
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
ELEMGRAPH45:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH46:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=553;
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
ELEMGRAPH46:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH47:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=410;
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
result^.T:=411;
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
ELEMGRAPH47:=result; 
END; 
                                                       FUNCTION ELEMGRAPH48:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=552;
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
result^.T:=32;
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
result^.T:=33;
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=447;
ELEMGRAPH50:=result; 
END; 
                                                       FUNCTION ELEMGRAPH51:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
ELEMGRAPH51:=result; 
END; 
                                                       FUNCTION ELEMGRAPH52:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=451;
ELEMGRAPH52:=result; 
END; 
                                                       FUNCTION ELEMGRAPH53:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=454;
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
result^.T:=28;
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
ELEMGRAPH54:=result; 
END; 
                                                       FUNCTION ELEMGRAPH55:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=448;
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
result^.T:=29;
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
ELEMGRAPH56:=result; 
END; 
                                                       FUNCTION ELEMGRAPH57:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=449;
ELEMGRAPH57:=result; 
END; 
                                                       FUNCTION ELEMGRAPH58:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
ELEMGRAPH58:=result; 
END; 
                                                       FUNCTION ELEMGRAPH59:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=452;
ELEMGRAPH59:=result; 
END; 
                                                       FUNCTION ELEMGRAPH60:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=450;
ELEMGRAPH60:=result; 
END; 
                                                       FUNCTION ELEMGRAPH61:LDMRULES_pCtrlExpr;
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
ELEMGRAPH61:=result; 
END; 
                                                       FUNCTION ELEMGRAPH62:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=453;
ELEMGRAPH62:=result; 
END; 
                                                       FUNCTION ELEMGRAPH63:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=560;
ELEMGRAPH63:=result; 
END; 
                                                       FUNCTION ELEMGRAPH64:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=416;
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
ELEMGRAPH64:=result; 
END; 
                                                       FUNCTION ELEMGRAPH65:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=558;
ELEMGRAPH65:=result; 
END; 
                                                       FUNCTION ELEMGRAPH66:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=561;
ELEMGRAPH66:=result; 
END; 
                                                       FUNCTION ELEMGRAPH67:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=417;
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
ELEMGRAPH67:=result; 
END; 
                                                       FUNCTION ELEMGRAPH68:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=559;
ELEMGRAPH68:=result; 
END; 
                                                       FUNCTION ELEMGRAPH69:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=430;
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
ELEMGRAPH69:=result; 
END; 
                                                       FUNCTION ELEMGRAPH70:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=570;
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
ELEMGRAPH70:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH71:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=490;
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
ELEMGRAPH71:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH72:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
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
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
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
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
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
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
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
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
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
CONCGRAPH9:=result; 
END; 
                                                       FUNCTION CONCGRAPH10:LDMRULES_pCtrlExpr;
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
CONCGRAPH10:=result; 
END; 
                                                       FUNCTION CONCGRAPH11:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=435;
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
GRAPH:=result; 
END; 
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH72:=result; 
END; 
                                                       FUNCTION ELEMGRAPH73:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=489;
ELEMGRAPH73:=result; 
END; 
                                                       FUNCTION ELEMGRAPH74:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=488;
ELEMGRAPH74:=result; 
END; 
                                                       FUNCTION ELEMGRAPH75:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=542;
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
ELEMGRAPH75:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH76:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=412;
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
ELEMGRAPH76:=result; 
END; 
                                                       FUNCTION ELEMGRAPH77:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=567;
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
ELEMGRAPH77:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH78:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=428;
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
ELEMGRAPH78:=result; 
END; 
                                                       FUNCTION ELEMGRAPH79:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=566;
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
ELEMGRAPH79:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH80:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=533;
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
ELEMGRAPH80:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH81:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=530;
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
ELEMGRAPH81:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH82:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=529;
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
ELEMGRAPH82:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH83:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=528;
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
ELEMGRAPH83:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH84:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=458;
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
ELEMGRAPH84:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH85:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
ELEMGRAPH85:=result; 
END; 
                                                       FUNCTION ELEMGRAPH86:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
ELEMGRAPH86:=result; 
END; 
                                                       FUNCTION ELEMGRAPH87:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
ELEMGRAPH87:=result; 
END; 
                                                       FUNCTION ELEMGRAPH88:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
ELEMGRAPH88:=result; 
END; 
                                                       FUNCTION ELEMGRAPH89:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=405;
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
result^.T:=406;
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
ELEMGRAPH89:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH90:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
ELEMGRAPH90:=result; 
END; 
                                                       FUNCTION ELEMGRAPH91:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
ELEMGRAPH91:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH92:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=443;
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
ELEMGRAPH92:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH93:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=13;
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
result^.T:=14;
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
result^.T:=15;
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
result^.T:=16;
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
result^.T:=17;
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
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH93:=result; 
END; 
                                                       FUNCTION ELEMGRAPH94:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=442;
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
ELEMGRAPH94:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH95:LDMRULES_pCtrlExpr;
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
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH95:=result; 
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
AppendCtrlExpr(ELEMGRAPH58,result); 
AppendCtrlExpr(ELEMGRAPH59,result); 
AppendCtrlExpr(ELEMGRAPH60,result); 
AppendCtrlExpr(ELEMGRAPH61,result); 
AppendCtrlExpr(ELEMGRAPH62,result); 
AppendCtrlExpr(ELEMGRAPH63,result); 
AppendCtrlExpr(ELEMGRAPH64,result); 
AppendCtrlExpr(ELEMGRAPH65,result); 
AppendCtrlExpr(ELEMGRAPH66,result); 
AppendCtrlExpr(ELEMGRAPH67,result); 
AppendCtrlExpr(ELEMGRAPH68,result); 
AppendCtrlExpr(ELEMGRAPH69,result); 
AppendCtrlExpr(ELEMGRAPH70,result); 
AppendCtrlExpr(ELEMGRAPH71,result); 
AppendCtrlExpr(ELEMGRAPH72,result); 
AppendCtrlExpr(ELEMGRAPH73,result); 
AppendCtrlExpr(ELEMGRAPH74,result); 
AppendCtrlExpr(ELEMGRAPH75,result); 
AppendCtrlExpr(ELEMGRAPH76,result); 
AppendCtrlExpr(ELEMGRAPH77,result); 
AppendCtrlExpr(ELEMGRAPH78,result); 
AppendCtrlExpr(ELEMGRAPH79,result); 
AppendCtrlExpr(ELEMGRAPH80,result); 
AppendCtrlExpr(ELEMGRAPH81,result); 
AppendCtrlExpr(ELEMGRAPH82,result); 
AppendCtrlExpr(ELEMGRAPH83,result); 
AppendCtrlExpr(ELEMGRAPH84,result); 
AppendCtrlExpr(ELEMGRAPH85,result); 
AppendCtrlExpr(ELEMGRAPH86,result); 
AppendCtrlExpr(ELEMGRAPH87,result); 
AppendCtrlExpr(ELEMGRAPH88,result); 
AppendCtrlExpr(ELEMGRAPH89,result); 
AppendCtrlExpr(ELEMGRAPH90,result); 
AppendCtrlExpr(ELEMGRAPH91,result); 
AppendCtrlExpr(ELEMGRAPH92,result); 
AppendCtrlExpr(ELEMGRAPH93,result); 
AppendCtrlExpr(ELEMGRAPH94,result); 
AppendCtrlExpr(ELEMGRAPH95,result); 
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
result^.T:=400;
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
result^.R:=68;
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
result^.R:=69;
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
result^.R:=70;
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
result^.R:=71;
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
result^.R:=72;
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
result^.R:=73;
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
result^.R:=74;
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
result^.R:=66;
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
result^.R:=67;
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
result^.T:=397;
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
result^.R:=435;
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
result^.R:=436;
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
result^.R:=439;
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
result^.R:=440;
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
result^.R:=441;
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
result^.R:=442;
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
result^.R:=479;
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
result^.R:=443;
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
result^.R:=444;
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
result^.R:=445;
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
result^.R:=446;
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
result^.R:=480;
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
result^.R:=427;
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
result^.R:=478;
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
result^.R:=476;
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
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
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
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=209;
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
result^.T:=210;
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
result^.T:=212;
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
result^.T:=213;
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
result^.T:=366;
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
result^.T:=367;
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
result^.T:=368;
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
result^.T:=369;
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
result^.T:=245;
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
result^.T:=205;
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
result^.T:=370;
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
result^.T:=211;
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
result^.T:=371;
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
result^.T:=208;
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
result^.R:=348;
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
result^.R:=349;
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
result^.R:=350;
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
result^.T:=332;
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
result^.R:=179;
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
result^.R:=243;
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
result^.R:=242;
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
result^.R:=244;
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
result^.R:=177;
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
result^.R:=178;
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
result^.R:=180;
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
result^.R:=181;
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
result^.R:=182;
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
result^.R:=175;
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
result^.R:=176;
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
result^.R:=221;
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
result^.R:=222;
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
result^.R:=223;
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
result^.R:=224;
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
result^.T:=215;
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
result^.T:=216;
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
result^.T:=217;
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
result^.T:=218;
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
result^.T:=219;
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
result^.T:=220;
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
result^.T:=221;
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
result^.T:=222;
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
result^.T:=223;
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
result^.T:=214;
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
result^.T:=491;
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
result^.T:=492;
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
result^.T:=226;
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
result^.T:=227;
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
result^.T:=228;
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
result^.T:=229;
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
result^.T:=230;
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
result^.T:=232;
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
result^.T:=233;
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
result^.T:=234;
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
result^.T:=236;
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
result^.T:=235;
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
result^.T:=231;
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
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH12:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH13:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=335;
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
ELEMGRAPH13:=GRAPH 
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
VERBPPROPFORMATION:=GRAPH 
END; 
FUNCTION QPFORMATION:LDMRULES_pCtrlExpr; 
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
result^.R:=115;
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
result^.R:=116;
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
result^.kind:=RULE;
result^.R:=122;
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
result^.R:=117;
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
result^.R:=118;
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
result^.R:=120;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
result^.R:=121;
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
result^.R:=119;
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
result^.R:=123;
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
result^.R:=124;
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
ELEMGRAPH7:=result; 
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
QPFORMATION:=GRAPH 
END; 
FUNCTION ADJDERIVATION:LDMRULES_pCtrlExpr; 
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
ADJDERIVATION:=GRAPH 
END; 
BEGIN
  CtrlExpr[1]:=UTTERANCE;
  CtrlExpr[2]:=CLAUSETOSENTENCE;
  CtrlExpr[3]:=XPPROPTOCLAUSE;
  CtrlExpr[4]:=VERBPPROPFORMATION;
  CtrlExpr[5]:=QPFORMATION;
  CtrlExpr[6]:=ADJDERIVATION;
  CtrlExpr[7]:=ADJPPROPFORMATION;
  CtrlExpr[8]:=ADJPPROPTOADJPFORMULA;
  CtrlExpr[9]:=ADJPFORMULATOADJPPROP;
  CtrlExpr[10]:=EXISTENTIAL;
  CtrlExpr[11]:=IDENTIFICATIONAL;
  CtrlExpr[12]:=VERBDERIVATION;
  CtrlExpr[13]:=NPDERIVATION;
  CtrlExpr[14]:=CNFORMATION;
  CtrlExpr[15]:=NPFORMATION;
  CtrlExpr[16]:=DETDERIVATION;
  CtrlExpr[17]:=DETPFORMATION;
  CtrlExpr[18]:=NPPROPFORMATION;
  CtrlExpr[19]:=TONPPROP;
  CtrlExpr[20]:=PREPDERIVATION;
  CtrlExpr[21]:=PREPPPROPFORMATION;
  CtrlExpr[22]:=PREPPPROPTOPREPPFORMULA;
  CtrlExpr[23]:=PREPPFORMULATOPREPPPROP;
  CtrlExpr[24]:=PREPPFORMATION;
  CtrlExpr[25]:=ADVDERIVATION;
  CtrlExpr[26]:=ADVPFORMATION;
  CtrlExpr[27]:=ADVPPROPFORMATION;
  CtrlExpr[28]:=ADVPPROPTOADVPFORMULA;
  CtrlExpr[29]:=ADVPFORMULATOADVPPROP;
  CtrlExpr[30]:=CARDINALS;
  CtrlExpr[31]:=DATUMFORMATION;
  CtrlExpr[32]:=COORDINATION;
END;
