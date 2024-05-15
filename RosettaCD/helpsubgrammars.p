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
result^.R:=85;
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
result^.R:=86;
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
result^.R:=87;
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
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
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
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
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
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
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
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
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
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
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
CONCGRAPH9:=result; 
END; 
                                                       FUNCTION CONCGRAPH10:LDMRULES_pCtrlExpr;
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
CONCGRAPH10:=result; 
END; 
                                                       FUNCTION CONCGRAPH11:LDMRULES_pCtrlExpr;
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
CONCGRAPH11:=result; 
END; 
                                                       FUNCTION CONCGRAPH12:LDMRULES_pCtrlExpr;
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
CONCGRAPH12:=result; 
END; 
                                                       FUNCTION CONCGRAPH13:LDMRULES_pCtrlExpr;
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
CONCGRAPH13:=result; 
END; 
                                                       FUNCTION CONCGRAPH14:LDMRULES_pCtrlExpr;
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
CONCGRAPH14:=result; 
END; 
                                                       FUNCTION CONCGRAPH15:LDMRULES_pCtrlExpr;
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
CONCGRAPH15:=result; 
END; 
                                                       FUNCTION CONCGRAPH16:LDMRULES_pCtrlExpr;
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
CONCGRAPH16:=result; 
END; 
                                                       FUNCTION CONCGRAPH17:LDMRULES_pCtrlExpr;
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
CONCGRAPH17:=result; 
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
result^.R:=76;
ELEMGRAPH1:=result; 
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
result^.R:=77;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
result^.R:=295;
ELEMGRAPH1:=result; 
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
result^.R:=296;
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
result^.R:=297;
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
result^.R:=91;
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
result^.R:=90;
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
result^.R:=208;
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
result^.R:=209;
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
result^.R:=210;
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
result^.R:=89;
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
result^.R:=88;
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=93;
ELEMGRAPH7:=result; 
END; 
                                                       FUNCTION ELEMGRAPH8:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=265;
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
result^.T:=122;
ELEMGRAPH1:=result; 
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
result^.T:=123;
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
result^.T:=124;
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
result^.T:=125;
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
result^.T:=126;
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
result^.T:=127;
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
result^.T:=135;
ELEMGRAPH1:=result; 
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
result^.T:=136;
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
ELEMGRAPH10:=result; 
END; 
                                                       FUNCTION ELEMGRAPH11:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=459;
ELEMGRAPH11:=result; 
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=461;
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
result^.R:=94;
ELEMGRAPH1:=result; 
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
result^.R:=97;
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
result^.R:=98;
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
ELEMGRAPH2:=result; 
END; 
                                                       FUNCTION ELEMGRAPH3:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=99;
ELEMGRAPH3:=result; 
END; 
                                                       FUNCTION ELEMGRAPH4:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=298;
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
result^.T:=270;
ELEMGRAPH1:=result; 
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
result^.T:=271;
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
result^.T:=272;
ELEMGRAPH1:=result; 
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
result^.T:=511;
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
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
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
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
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
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
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
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
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
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
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
result^.T:=151;
ELEMGRAPH1:=result; 
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
result^.T:=152;
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
result^.T:=158;
ELEMGRAPH1:=result; 
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
result^.T:=159;
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
result^.T:=160;
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
ELEMGRAPH11:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH12:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=462;
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
result^.R:=100;
ELEMGRAPH1:=result; 
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
result^.R:=101;
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
result^.R:=102;
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
result^.R:=103;
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
ELEMGRAPH13:=result; 
END; 
                                                       FUNCTION ELEMGRAPH14:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=466;
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
result^.T:=139;
ELEMGRAPH1:=result; 
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
result^.T:=463;
ELEMGRAPH16:=result; 
END; 
                                                       FUNCTION ELEMGRAPH17:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=467;
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
ELEMGRAPH18:=result; 
END; 
                                                       FUNCTION ELEMGRAPH19:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=464;
ELEMGRAPH19:=result; 
END; 
                                                       FUNCTION ELEMGRAPH20:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=468;
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
result^.T:=141;
ELEMGRAPH1:=result; 
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
ELEMGRAPH21:=result; 
END; 
                                                       FUNCTION ELEMGRAPH22:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=465;
ELEMGRAPH22:=result; 
END; 
                                                       FUNCTION ELEMGRAPH23:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=470;
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
result^.T:=153;
ELEMGRAPH1:=result; 
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
result^.T:=469;
ELEMGRAPH25:=result; 
END; 
                                                       FUNCTION ELEMGRAPH26:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=472;
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
result^.T:=154;
ELEMGRAPH1:=result; 
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
ELEMGRAPH27:=result; 
END; 
                                                       FUNCTION ELEMGRAPH28:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=471;
ELEMGRAPH28:=result; 
END; 
                                                       FUNCTION ELEMGRAPH29:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=473;
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
result^.T:=157;
ELEMGRAPH1:=result; 
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
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
ELEMGRAPH34:=GRAPH 
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=486;
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
result^.R:=166;
ELEMGRAPH1:=result; 
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
result^.R:=167;
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
result^.R:=168;
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
result^.R:=169;
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
ELEMGRAPH3:=result; 
END; 
                                                       FUNCTION ELEMGRAPH4:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=266;
ELEMGRAPH4:=result; 
END; 
                                                       FUNCTION ELEMGRAPH5:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=487;
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
result^.T:=194;
ELEMGRAPH1:=result; 
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
result^.R:=170;
ELEMGRAPH1:=result; 
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
result^.R:=171;
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
                                                       FUNCTION ELEMGRAPH8:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=172;
ELEMGRAPH8:=result; 
END; 
                                                       FUNCTION ELEMGRAPH9:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
ADJPFORMULATOADJPPROP:=GRAPH 
END; 
FUNCTION EXISTENTIAL:LDMRULES_pCtrlExpr; 
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
                                                       FUNCTION ELEMGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=197;
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
result^.R:=198;
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
result^.R:=184;
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
result^.R:=187;
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
EXISTENTIAL:=GRAPH 
END; 
FUNCTION IDENTIFICATIONAL:LDMRULES_pCtrlExpr; 
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
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=228;
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
result^.R:=229;
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
result^.R:=230;
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
result^.R:=231;
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
result^.R:=232;
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
result^.R:=233;
ELEMGRAPH1:=result; 
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
result^.R:=193;
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
result^.R:=194;
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
result^.R:=195;
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
result^.R:=183;
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
result^.R:=186;
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
IDENTIFICATIONAL:=GRAPH 
END; 
FUNCTION VERBDERIVATION:LDMRULES_pCtrlExpr; 
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=234;
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
result^.T:=224;
ELEMGRAPH1:=result; 
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
result^.T:=225;
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
VERBDERIVATION:=GRAPH 
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
result^.R:=143;
ELEMGRAPH1:=result; 
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
result^.R:=148;
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
result^.R:=150;
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
result^.R:=146;
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
result^.R:=149;
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
result^.R:=470;
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
result^.R:=147;
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
result^.R:=144;
ELEMGRAPH1:=result; 
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
result^.R:=145;
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
result^.R:=155;
ELEMGRAPH1:=result; 
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
result^.R:=156;
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
result^.R:=235;
ELEMGRAPH1:=result; 
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
result^.R:=236;
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
result^.R:=514;
ELEMGRAPH1:=result; 
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
result^.R:=515;
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
result^.R:=163;
ELEMGRAPH1:=result; 
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
result^.R:=157;
ELEMGRAPH1:=result; 
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
result^.R:=158;
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
result^.R:=162;
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
result^.R:=452;
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
result^.R:=453;
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
result^.R:=455;
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
result^.R:=159;
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
result^.R:=160;
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
result^.R:=161;
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
result^.R:=164;
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
result^.R:=457;
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
ELEMGRAPH8:=result; 
END; 
                                                       FUNCTION ELEMGRAPH9:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=576;
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
result^.T:=440;
ELEMGRAPH1:=result; 
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
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=555;
ELEMGRAPH1:=result; 
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
result^.T:=412;
ELEMGRAPH1:=result; 
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
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=554;
ELEMGRAPH1:=result; 
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=485;
ELEMGRAPH14:=result; 
END; 
                                                       FUNCTION ELEMGRAPH15:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CNFORMATION:=GRAPH 
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
result^.R:=125;
ELEMGRAPH1:=result; 
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
result^.R:=126;
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
result^.R:=127;
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
result^.R:=128;
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
result^.R:=130;
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
result^.R:=131;
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
result^.R:=461;
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
result^.R:=462;
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
result^.R:=463;
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
result^.R:=464;
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
result^.R:=132;
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
result^.R:=465;
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
result^.R:=466;
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
result^.R:=133;
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
result^.R:=467;
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
result^.R:=458;
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
result^.R:=459;
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
result^.R:=468;
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
result^.R:=469;
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
result^.R:=460;
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
result^.R:=238;
ELEMGRAPH1:=result; 
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=474;
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
result^.R:=134;
ELEMGRAPH1:=result; 
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
result^.R:=135;
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
result^.R:=136;
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
result^.R:=137;
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
result^.R:=139;
ELEMGRAPH1:=result; 
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
result^.R:=140;
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
result^.R:=138;
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
result^.R:=456;
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
result^.T:=477;
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
result^.T:=478;
ELEMGRAPH10:=result; 
END; 
                                                       FUNCTION ELEMGRAPH11:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=578;
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
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=183;
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
result^.T:=184;
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
ELEMGRAPH12:=result; 
END; 
                                                       FUNCTION ELEMGRAPH13:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=579;
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
result^.T:=407;
ELEMGRAPH1:=result; 
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
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=551;
ELEMGRAPH1:=result; 
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=482;
ELEMGRAPH16:=result; 
END; 
                                                       FUNCTION ELEMGRAPH17:LDMRULES_pCtrlExpr;
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
result^.T:=186;
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
                                                       
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=iteration; 
result^.ce:=GRAPH; 
ELEMGRAPH17:=result; 
END; 
                                                       FUNCTION ELEMGRAPH18:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=481;
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
result^.T:=187;
ELEMGRAPH1:=result; 
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
result^.T:=483;
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
ELEMGRAPH21:=result; 
END; 
                                                       FUNCTION ELEMGRAPH22:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=484;
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
ELEMGRAPH23:=result; 
END; 
                                                       FUNCTION ELEMGRAPH24:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=476;
ELEMGRAPH24:=result; 
END; 
                                                       FUNCTION ELEMGRAPH25:LDMRULES_pCtrlExpr;
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
ELEMGRAPH25:=result; 
END; 
                                                       FUNCTION ELEMGRAPH26:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=475;
ELEMGRAPH26:=result; 
END; 
                                                       FUNCTION ELEMGRAPH27:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=479;
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
ELEMGRAPH28:=result; 
END; 
                                                       FUNCTION ELEMGRAPH29:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=480;
ELEMGRAPH29:=result; 
END; 
                                                       FUNCTION ELEMGRAPH30:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
result^.kind:=RULE;
result^.R:=516;
ELEMGRAPH1:=result; 
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
result^.R:=517;
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
result^.T:=441;
ELEMGRAPH1:=result; 
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
ELEMGRAPH32:=result; 
END; 
                                                       FUNCTION ELEMGRAPH33:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=577;
ELEMGRAPH33:=result; 
END; 
                                                       FUNCTION ELEMGRAPH34:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=574;
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
result^.T:=437;
ELEMGRAPH1:=result; 
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
ELEMGRAPH35:=result; 
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
result^.R:=104;
ELEMGRAPH1:=result; 
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
result^.R:=105;
ELEMGRAPH1:=result; 
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
result^.R:=106;
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
result^.R:=110;
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
result^.R:=107;
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
result^.R:=112;
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
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
result^.R:=111;
ELEMGRAPH1:=result; 
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
result^.R:=507;
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
result^.R:=508;
ELEMGRAPH1:=result; 
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
result^.R:=509;
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
result^.R:=215;
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
result^.R:=216;
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
result^.R:=199;
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
result^.R:=200;
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
result^.R:=201;
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
result^.R:=189;
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
result^.R:=190;
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
result^.R:=518;
ELEMGRAPH1:=result; 
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
result^.T:=439;
ELEMGRAPH1:=result; 
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
result^.T:=438;
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
result^.T:=575;
ELEMGRAPH1:=result; 
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
result^.R:=510;
ELEMGRAPH1:=result; 
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
result^.R:=511;
ELEMGRAPH1:=result; 
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
result^.R:=512;
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
result^.R:=513;
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
FUNCTION PREPDERIVATION:LDMRULES_pCtrlExpr; 
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=402;
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
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
result^.T:=399;
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
result^.R:=429;
ELEMGRAPH1:=result; 
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
result^.R:=430;
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
result^.T:=273;
ELEMGRAPH1:=result; 
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
result^.T:=275;
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
result^.T:=276;
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
result^.T:=274;
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
result^.R:=311;
ELEMGRAPH1:=result; 
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
result^.R:=312;
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
result^.R:=313;
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
result^.R:=219;
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
result^.R:=220;
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
result^.R:=202;
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
result^.R:=203;
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
result^.R:=204;
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
result^.R:=185;
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
result^.R:=188;
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
result^.R:=314;
ELEMGRAPH1:=result; 
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
result^.R:=315;
ELEMGRAPH1:=result; 
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
result^.R:=316;
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
result^.kind:=TRANSFORMATION;
result^.T:=512;
ELEMGRAPH1:=result; 
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
PREPPPROPFORMATION:=GRAPH 
END; 
FUNCTION PREPPPROPTOPREPPFORMULA:LDMRULES_pCtrlExpr; 
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
result^.R:=317;
ELEMGRAPH1:=result; 
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
result^.R:=318;
ELEMGRAPH1:=result; 
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
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=278;
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
result^.T:=281;
ELEMGRAPH1:=result; 
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
result^.T:=279;
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
result^.T:=282;
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
result^.T:=280;
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
result^.T:=283;
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
ELEMGRAPH5:=GRAPH 
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
PREPPPROPTOPREPPFORMULA:=GRAPH 
END; 
FUNCTION PREPPFORMULATOPREPPPROP:LDMRULES_pCtrlExpr; 
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
result^.T:=513;
ELEMGRAPH1:=result; 
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
result^.T:=284;
ELEMGRAPH1:=result; 
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
result^.R:=322;
ELEMGRAPH1:=result; 
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
result^.R:=324;
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
result^.R:=326;
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
result^.R:=327;
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
result^.R:=328;
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
result^.R:=323;
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
result^.R:=325;
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
result^.T:=514;
ELEMGRAPH1:=result; 
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=285;
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
result^.R:=320;
ELEMGRAPH1:=result; 
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
result^.R:=321;
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
ELEMGRAPH6:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH7:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=573;
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
result^.T:=436;
ELEMGRAPH1:=result; 
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
result^.kind:=RULE;
result^.R:=329;
ELEMGRAPH9:=result; 
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
PREPPFORMULATOPREPPPROP:=GRAPH 
END; 
FUNCTION PREPPFORMATION:LDMRULES_pCtrlExpr; 
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
result^.T:=401;
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
result^.R:=351;
ELEMGRAPH1:=result; 
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
result^.R:=352;
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
result^.T:=398;
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
result^.R:=431;
ELEMGRAPH1:=result; 
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
result^.R:=434;
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
result^.R:=432;
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
result^.R:=433;
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
result^.T:=315;
ELEMGRAPH1:=result; 
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
result^.T:=317;
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
result^.T:=318;
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
result^.T:=316;
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=362;
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
result^.T:=524;
ELEMGRAPH1:=result; 
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
result^.T:=319;
ELEMGRAPH1:=result; 
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
result^.T:=320;
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
result^.T:=323;
ELEMGRAPH1:=result; 
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
result^.T:=321;
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
result^.T:=324;
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
result^.T:=322;
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
result^.T:=325;
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
ELEMGRAPH7:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH8:LDMRULES_pCtrlExpr;
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
result^.R:=358;
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
result^.R:=360;
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
result^.R:=361;
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
result^.R:=356;
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
result^.R:=359;
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
result^.R:=357;
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
ELEMGRAPH8:=result; 
END; 
                                                       FUNCTION ELEMGRAPH9:LDMRULES_pCtrlExpr;
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
result^.T:=326;
ELEMGRAPH1:=result; 
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
result^.T:=327;
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
ELEMGRAPH10:=GRAPH 
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
PREPPFORMATION:=GRAPH 
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
result^.R:=379;
ELEMGRAPH1:=result; 
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
result^.R:=380;
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
result^.R:=381;
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
result^.R:=382;
ELEMGRAPH1:=result; 
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
result^.R:=383;
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
result^.T:=338;
ELEMGRAPH1:=result; 
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
result^.T:=339;
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
result^.T:=340;
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
result^.T:=341;
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=392;
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
result^.R:=386;
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
result^.R:=114;
ELEMGRAPH1:=result; 
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
result^.R:=387;
ELEMGRAPH1:=result; 
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
result^.R:=113;
ELEMGRAPH1:=result; 
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
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=347;
ELEMGRAPH1:=result; 
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
result^.T:=348;
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
result^.T:=349;
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
result^.T:=350;
ELEMGRAPH1:=result; 
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
result^.T:=351;
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
result^.T:=352;
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
ELEMGRAPH12:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH13:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=535;
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
result^.T:=353;
ELEMGRAPH1:=result; 
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
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
ELEMGRAPH15:=result; 
END; 
                                                       FUNCTION ELEMGRAPH16:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=460;
ELEMGRAPH16:=result; 
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
result^.R:=394;
ELEMGRAPH1:=result; 
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
result^.R:=395;
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
result^.R:=396;
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
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
FUNCTION  ELEMGRAPH1:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=344;
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
result^.R:=397;
ELEMGRAPH1:=result; 
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
result^.R:=217;
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
result^.R:=218;
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
result^.R:=205;
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
result^.R:=206;
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
result^.R:=207;
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
result^.R:=191;
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
result^.R:=192;
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
result^.R:=398;
ELEMGRAPH1:=result; 
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
FUNCTION ADVPPROPTOADVPFORMULA:LDMRULES_pCtrlExpr; 
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
result^.R:=400;
ELEMGRAPH1:=result; 
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
result^.R:=401;
ELEMGRAPH1:=result; 
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
ADVPPROPTOADVPFORMULA:=GRAPH 
END; 
FUNCTION ADVPFORMULATOADVPPROP:LDMRULES_pCtrlExpr; 
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
result^.T:=534;
ELEMGRAPH1:=result; 
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
result^.T:=346;
ELEMGRAPH1:=result; 
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
result^.R:=402;
ELEMGRAPH1:=result; 
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
ELEMGRAPH3:=result; 
END; 
                                                       FUNCTION ELEMGRAPH4:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=345;
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
result^.R:=403;
ELEMGRAPH1:=result; 
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
result^.R:=404;
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
result^.R:=405;
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
ADVPFORMULATOADVPPROP:=GRAPH 
END; 
FUNCTION CARDINALS:LDMRULES_pCtrlExpr; 
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
result^.R:=481;
ELEMGRAPH1:=result; 
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
result^.R:=482;
ELEMGRAPH1:=result; 
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
CARDINALS:=GRAPH 
END; 
FUNCTION DATUMFORMATION:LDMRULES_pCtrlExpr; 
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
result^.R:=483;
ELEMGRAPH1:=result; 
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
result^.R:=485;
ELEMGRAPH1:=result; 
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
result^.R:=484;
ELEMGRAPH1:=result; 
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
result^.R:=486;
ELEMGRAPH1:=result; 
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
result^.R:=499;
ELEMGRAPH1:=result; 
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
result^.R:=494;
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
result^.R:=501;
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
result^.R:=502;
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
result^.R:=503;
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
result^.R:=504;
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
result^.R:=506;
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
result^.R:=505;
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
result^.R:=492;
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
result^.R:=495;
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
result^.R:=490;
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
result^.R:=491;
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
result^.R:=487;
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
result^.R:=489;
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
result^.R:=488;
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
result^.R:=496;
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
result^.R:=500;
ELEMGRAPH1:=result; 
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
result^.R:=497;
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
result^.R:=498;
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
