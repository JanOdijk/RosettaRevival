EXPORT(HELPSUBGRAMMARS);
pragma C_include('helpsubgrammars.pf');pragma C_include('ldmrules.pf');pragma C_include('mem.pf');
PROGRAM HELPSUBGRAMMARS;
WITH ldmrules,mem;
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
FUNCTION NPFORMATION:LDMRULES_pCtrlExpr; 
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
result^.R:=230;
ELEMGRAPH1:=result; 
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
result^.R:=231;
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
result^.R:=232;
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
result^.R:=233;
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
result^.R:=234;
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
result^.R:=235;
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
result^.R:=441;
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
result^.R:=442;
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
result^.R:=443;
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
result^.R:=444;
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
result^.R:=236;
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
result^.R:=446;
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
result^.R:=237;
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
result^.R:=439;
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
result^.R:=440;
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
result^.R:=238;
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
result^.R:=445;
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
result^.R:=447;
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
result^.R:=448;
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
result^.R:=450;
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
result^.R:=5;
ELEMGRAPH1:=result; 
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
                                                       FUNCTION ELEMGRAPH3:LDMRULES_pCtrlExpr;
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
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
result^.R:=244;
ELEMGRAPH1:=result; 
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
result^.R:=245;
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
result^.R:=243;
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=319;
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
result^.T:=167;
ELEMGRAPH1:=result; 
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
ELEMGRAPH7:=result; 
END; 
                                                       FUNCTION ELEMGRAPH8:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=318;
ELEMGRAPH8:=result; 
END; 
                                                       FUNCTION ELEMGRAPH9:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=321;
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
result^.T:=164;
ELEMGRAPH1:=result; 
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
result^.T:=165;
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
result^.T:=166;
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
ELEMGRAPH10:=result; 
END; 
                                                       FUNCTION ELEMGRAPH11:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=320;
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
result^.T:=160;
ELEMGRAPH1:=result; 
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
ELEMGRAPH12:=result; 
END; 
                                                       FUNCTION ELEMGRAPH13:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=313;
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
result^.T:=161;
ELEMGRAPH1:=result; 
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
ELEMGRAPH14:=result; 
END; 
                                                       FUNCTION ELEMGRAPH15:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=312;
ELEMGRAPH15:=result; 
END; 
                                                       FUNCTION ELEMGRAPH16:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=315;
ELEMGRAPH16:=result; 
END; 
                                                       FUNCTION ELEMGRAPH17:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=162;
ELEMGRAPH1:=result; 
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
ELEMGRAPH17:=result; 
END; 
                                                       FUNCTION ELEMGRAPH18:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=314;
ELEMGRAPH18:=result; 
END; 
                                                       FUNCTION ELEMGRAPH19:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=316;
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
result^.T:=163;
ELEMGRAPH1:=result; 
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
result^.T:=317;
ELEMGRAPH21:=result; 
END; 
                                                       FUNCTION ELEMGRAPH22:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
ELEMGRAPH22:=result; 
END; 
                                                       FUNCTION ELEMGRAPH23:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=192;
ELEMGRAPH1:=result; 
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
result^.R:=193;
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
result^.T:=138;
ELEMGRAPH1:=result; 
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
result^.T:=301;
ELEMGRAPH25:=result; 
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
NPFORMATION:=GRAPH 
END; 
FUNCTION DETDERIVATION:LDMRULES_pCtrlExpr; 
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=210;
ELEMGRAPH1:=result; 
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
DETDERIVATION:=GRAPH 
END; 
FUNCTION DETPFORMATION:LDMRULES_pCtrlExpr; 
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
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
result^.R:=211;
ELEMGRAPH1:=result; 
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
result^.R:=212;
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
result^.R:=214;
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
result^.R:=217;
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
                                                       FUNCTION ELEMGRAPH2:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=215;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=213;
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
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=216;
ELEMGRAPH1:=result; 
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
DETPFORMATION:=GRAPH 
END; 
FUNCTION NPPROPFORMATION:LDMRULES_pCtrlExpr; 
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=178;
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
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=183;
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
result^.R:=184;
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
result^.R:=185;
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
ELEMGRAPH2:=result; 
END; 
                                                       FUNCTION ELEMGRAPH3:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=139;
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
NPPROPFORMATION:=GRAPH 
END; 
FUNCTION TONPPROP:LDMRULES_pCtrlExpr; 
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
result^.R:=194;
ELEMGRAPH1:=result; 
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
result^.kind:=TRANSFORMATION;
result^.T:=140;
ELEMGRAPH1:=result; 
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
result^.T:=141;
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
ELEMGRAPH2:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
result^.kind:=RULE;
result^.R:=186;
ELEMGRAPH1:=result; 
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
result^.R:=187;
ELEMGRAPH1:=result; 
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
result^.R:=188;
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
ELEMGRAPH5:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH6:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=189;
ELEMGRAPH6:=result; 
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
TONPPROP:=GRAPH 
END; 
FUNCTION DATUMFORMATION:LDMRULES_pCtrlExpr; 
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=203;
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
result^.R:=204;
ELEMGRAPH1:=result; 
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
                                                       FUNCTION ELEMGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=205;
ELEMGRAPH1:=result; 
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
result^.R:=207;
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
result^.R:=206;
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
result^.R:=208;
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
result^.R:=209;
ELEMGRAPH1:=result; 
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
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
AppendCtrlExpr(ELEMGRAPH2,result); 
AppendCtrlExpr(ELEMGRAPH3,result); 
AppendCtrlExpr(ELEMGRAPH4,result); 
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
DATUMFORMATION:=GRAPH 
END; 
FUNCTION CARDINALFORMATION:LDMRULES_pCtrlExpr; 
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=201;
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
result^.R:=202;
ELEMGRAPH1:=result; 
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
CARDINALFORMATION:=GRAPH 
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
result^.R:=228;
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
result^.R:=225;
ELEMGRAPH1:=result; 
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
result^.R:=223;
ELEMGRAPH1:=result; 
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
result^.R:=224;
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
result^.R:=226;
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
result^.T:=159;
ELEMGRAPH1:=result; 
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
result^.T:=158;
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
result^.R:=227;
ELEMGRAPH1:=result; 
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
result^.R:=229;
ELEMGRAPH1:=result; 
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
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=165;
ELEMGRAPH1:=result; 
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
result^.R:=166;
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
BEGIN 
ADJDERIVATION:=GRAPH 
END; 
FUNCTION ADJPPROPFORMATION:LDMRULES_pCtrlExpr; 
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
result^.R:=167;
ELEMGRAPH1:=result; 
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
result^.R:=168;
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
result^.R:=169;
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
result^.R:=170;
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
result^.R:=172;
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
result^.R:=171;
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
result^.T:=131;
ELEMGRAPH1:=result; 
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
result^.T:=132;
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
result^.T:=133;
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
result^.T:=134;
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
result^.T:=135;
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
result^.T:=136;
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
result^.T:=137;
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
result^.R:=159;
ELEMGRAPH1:=result; 
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
result^.R:=160;
ELEMGRAPH1:=result; 
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
result^.kind:=RULE;
result^.R:=162;
ELEMGRAPH1:=result; 
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
result^.R:=163;
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
result^.R:=164;
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
result^.R:=298;
ELEMGRAPH1:=result; 
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
result^.R:=299;
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
result^.R:=300;
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
result^.R:=173;
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
result^.R:=175;
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
result^.R:=174;
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
result^.R:=177;
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
result^.R:=176;
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
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH6:=result; 
END; 
                                                       FUNCTION ELEMGRAPH7:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=195;
ELEMGRAPH7:=result; 
END; 
                                                       FUNCTION ELEMGRAPH8:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=183;
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
result^.T:=142;
ELEMGRAPH1:=result; 
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
result^.T:=143;
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
ELEMGRAPH9:=result; 
END; 
                                                       FUNCTION ELEMGRAPH10:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=303;
ELEMGRAPH10:=result; 
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
ADJPPROPFORMATION:=GRAPH 
END; 
FUNCTION ADJPPROPTOADJPFORMULA:LDMRULES_pCtrlExpr; 
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
result^.R:=196;
ELEMGRAPH1:=result; 
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
ELEMGRAPH1:=result; 
END; 
                                                       FUNCTION ELEMGRAPH2:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=197;
ELEMGRAPH2:=result; 
END; 
                                                       FUNCTION ELEMGRAPH3:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=301;
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
result^.R:=302;
ELEMGRAPH1:=result; 
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
result^.R:=303;
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
result^.kind:=TRANSFORMATION;
result^.T:=185;
ELEMGRAPH1:=result; 
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
result^.T:=187;
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
ELEMGRAPH5:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH6:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=186;
ELEMGRAPH1:=result; 
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
ELEMGRAPH6:=result; 
END; 
                                                       FUNCTION ELEMGRAPH7:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=331;
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
result^.T:=155;
ELEMGRAPH1:=result; 
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
result^.T:=156;
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
result^.T:=157;
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=305;
ELEMGRAPH9:=result; 
END; 
                                                       FUNCTION ELEMGRAPH10:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=198;
ELEMGRAPH1:=result; 
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
result^.R:=199;
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
result^.R:=200;
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
ELEMGRAPH10:=result; 
END; 
                                                       FUNCTION ELEMGRAPH11:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=308;
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
result^.T:=146;
ELEMGRAPH1:=result; 
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
ELEMGRAPH12:=result; 
END; 
                                                       FUNCTION ELEMGRAPH13:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=306;
ELEMGRAPH13:=result; 
END; 
                                                       FUNCTION ELEMGRAPH14:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=309;
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
result^.T:=147;
ELEMGRAPH1:=result; 
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
ELEMGRAPH15:=result; 
END; 
                                                       FUNCTION ELEMGRAPH16:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=307;
ELEMGRAPH16:=result; 
END; 
                                                       FUNCTION ELEMGRAPH17:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=311;
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
result^.T:=148;
ELEMGRAPH1:=result; 
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
result^.T:=310;
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
result^.T:=149;
ELEMGRAPH1:=result; 
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
result^.T:=150;
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
result^.T:=151;
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
result^.T:=152;
ELEMGRAPH1:=result; 
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
result^.T:=153;
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
result^.T:=154;
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
ADJPPROPTOADJPFORMULA:=GRAPH 
END; 
FUNCTION ADJPFORMULATOADJPPROP:LDMRULES_pCtrlExpr; 
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
result^.R:=275;
ELEMGRAPH1:=result; 
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
result^.R:=276;
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
result^.R:=277;
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
result^.R:=278;
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
ELEMGRAPH1:=result; 
END; 
                                                       FUNCTION ELEMGRAPH2:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=184;
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
result^.T:=168;
ELEMGRAPH1:=result; 
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
result^.R:=279;
ELEMGRAPH1:=result; 
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
result^.R:=280;
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=281;
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
result^.R:=283;
ELEMGRAPH1:=result; 
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
result^.R:=282;
ELEMGRAPH1:=result; 
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
ADJPFORMULATOADJPPROP:=GRAPH 
END; 
FUNCTION ADVDERIVATION:LDMRULES_pCtrlExpr; 
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
result^.R:=308;
ELEMGRAPH1:=result; 
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
result^.R:=309;
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
BEGIN 
ADVDERIVATION:=GRAPH 
END; 
FUNCTION ADVPFORMATION:LDMRULES_pCtrlExpr; 
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
result^.R:=310;
ELEMGRAPH1:=result; 
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
result^.R:=311;
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
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
result^.R:=312;
ELEMGRAPH1:=result; 
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
result^.R:=336;
ELEMGRAPH1:=result; 
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
result^.R:=220;
ELEMGRAPH1:=result; 
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
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=219;
ELEMGRAPH1:=result; 
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
result^.T:=216;
ELEMGRAPH1:=result; 
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
ELEMGRAPH9:=result; 
END; 
                                                       FUNCTION ELEMGRAPH10:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=333;
ELEMGRAPH10:=result; 
END; 
                                                       FUNCTION ELEMGRAPH11:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=313;
ELEMGRAPH1:=result; 
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
result^.R:=314;
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
result^.R:=315;
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
ELEMGRAPH11:=result; 
END; 
                                                       FUNCTION ELEMGRAPH12:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=218;
ELEMGRAPH1:=result; 
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
result^.T:=144;
ELEMGRAPH1:=result; 
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
result^.T:=145;
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
ELEMGRAPH13:=result; 
END; 
                                                       FUNCTION ELEMGRAPH14:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=304;
ELEMGRAPH14:=result; 
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
ADVPFORMATION:=GRAPH 
END; 
FUNCTION ADVPPROPFORMATION:LDMRULES_pCtrlExpr; 
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
result^.R:=316;
ELEMGRAPH1:=result; 
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
result^.R:=317;
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
result^.R:=318;
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
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
result^.R:=319;
ELEMGRAPH1:=result; 
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
result^.R:=320;
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
result^.R:=321;
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
result^.R:=322;
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
result^.R:=323;
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
result^.R:=324;
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
result^.kind:=RULE;
result^.R:=325;
ELEMGRAPH1:=result; 
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
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
AppendCtrlExpr(ELEMGRAPH2,result); 
AppendCtrlExpr(ELEMGRAPH3,result); 
AppendCtrlExpr(ELEMGRAPH4,result); 
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
ADVPPROPFORMATION:=GRAPH 
END; 
FUNCTION ADVPPROPTOFORMULA:LDMRULES_pCtrlExpr; 
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=326;
ELEMGRAPH1:=result; 
END; 
                                                       FUNCTION ELEMGRAPH2:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=327;
ELEMGRAPH2:=result; 
END; 
                                                       FUNCTION ELEMGRAPH3:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=328;
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
ADVPPROPTOFORMULA:=GRAPH 
END; 
FUNCTION ADVPFORMULATOPROP:LDMRULES_pCtrlExpr; 
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
result^.T:=212;
ELEMGRAPH1:=result; 
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
result^.T:=213;
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
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=329;
ELEMGRAPH1:=result; 
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=214;
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
result^.R:=330;
ELEMGRAPH1:=result; 
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
result^.R:=331;
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=332;
ELEMGRAPH5:=result; 
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
ADVPFORMULATOPROP:=GRAPH 
END; 
FUNCTION PREPDERIVATION:LDMRULES_pCtrlExpr; 
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
PREPDERIVATION:=GRAPH 
END; 
FUNCTION PREPPPROPFORMATION:LDMRULES_pCtrlExpr; 
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
result^.R:=345;
ELEMGRAPH1:=result; 
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
result^.R:=346;
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
result^.R:=347;
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
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
result^.R:=355;
ELEMGRAPH1:=result; 
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
result^.R:=356;
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
result^.R:=357;
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
result^.R:=348;
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
result^.R:=349;
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
result^.R:=350;
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
result^.R:=351;
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
result^.R:=352;
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
result^.kind:=RULE;
result^.R:=353;
ELEMGRAPH1:=result; 
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
result^.R:=358;
ELEMGRAPH1:=result; 
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
result^.R:=354;
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
PREPPPROPFORMATION:=GRAPH 
END; 
FUNCTION PREPPPROPTOFORMULA:LDMRULES_pCtrlExpr; 
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=359;
ELEMGRAPH1:=result; 
END; 
                                                       FUNCTION ELEMGRAPH2:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=360;
ELEMGRAPH2:=result; 
END; 
                                                       FUNCTION ELEMGRAPH3:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=361;
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
result^.T:=219;
ELEMGRAPH1:=result; 
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
result^.T:=220;
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
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
AppendCtrlExpr(ELEMGRAPH2,result); 
AppendCtrlExpr(ELEMGRAPH3,result); 
AppendCtrlExpr(ELEMGRAPH4,result); 
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
PREPPPROPTOFORMULA:=GRAPH 
END; 
FUNCTION PREPPFORMULATOPROP:LDMRULES_pCtrlExpr; 
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
result^.T:=221;
ELEMGRAPH1:=result; 
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
result^.T:=222;
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
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=363;
ELEMGRAPH1:=result; 
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
result^.R:=364;
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
result^.R:=365;
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
result^.R:=362;
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
ELEMGRAPH2:=result; 
END; 
                                                       FUNCTION ELEMGRAPH3:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=223;
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
result^.R:=366;
ELEMGRAPH1:=result; 
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
result^.R:=367;
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=368;
ELEMGRAPH5:=result; 
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
PREPPFORMULATOPROP:=GRAPH 
END; 
FUNCTION PREPPFORMATION:LDMRULES_pCtrlExpr; 
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
result^.R:=369;
ELEMGRAPH1:=result; 
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
result^.R:=370;
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
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
result^.R:=371;
ELEMGRAPH1:=result; 
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
result^.T:=233;
ELEMGRAPH1:=result; 
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
result^.T:=234;
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
result^.R:=374;
ELEMGRAPH1:=result; 
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
result^.R:=375;
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
result^.R:=376;
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
result^.T:=235;
ELEMGRAPH1:=result; 
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
result^.T:=236;
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
ELEMGRAPH7:=GRAPH 
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
PREPPFORMATION:=GRAPH 
END; 
FUNCTION IDENTPROPFORMATION:LDMRULES_pCtrlExpr; 
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
result^.R:=393;
ELEMGRAPH1:=result; 
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
result^.R:=394;
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
result^.R:=395;
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
result^.R:=396;
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
result^.R:=397;
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
result^.R:=398;
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
result^.R:=399;
ELEMGRAPH1:=result; 
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
result^.R:=400;
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
result^.R:=401;
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
result^.R:=402;
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
result^.R:=403;
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
result^.R:=404;
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
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
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
IDENTPROPFORMATION:=GRAPH 
END; 
FUNCTION EXISTPROPFORMATION:LDMRULES_pCtrlExpr; 
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
result^.R:=405;
ELEMGRAPH1:=result; 
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
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
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
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
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
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
EXISTPROPFORMATION:=GRAPH 
END; 
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
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
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
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
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
result^.R:=418;
ELEMGRAPH1:=result; 
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
FUNCTION COORDINATION:LDMRULES_pCtrlExpr; 
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
result^.R:=454;
ELEMGRAPH1:=result; 
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
result^.R:=452;
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
result^.R:=451;
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
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=455;
ELEMGRAPH1:=result; 
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
result^.R:=453;
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
COORDINATION:=GRAPH 
END; 
