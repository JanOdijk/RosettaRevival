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
result^.R:=98;
ELEMGRAPH1:=result; 
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
result^.R:=117;
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
result^.R:=99;
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
result^.R:=100;
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
result^.R:=101;
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
result^.R:=102;
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
result^.R:=103;
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
result^.R:=104;
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
result^.R:=105;
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
result^.R:=106;
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
result^.R:=107;
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
result^.R:=108;
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
result^.R:=109;
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
result^.R:=110;
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
result^.R:=111;
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
result^.R:=112;
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
result^.R:=113;
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
result^.R:=114;
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
result^.R:=115;
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
result^.R:=116;
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
result^.R:=366;
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
result^.R:=367;
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
result^.R:=168;
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
result^.R:=368;
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
result^.R:=369;
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
result^.R:=370;
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
result^.T:=4;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.T:=8;
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
result^.T:=9;
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
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
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
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
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
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
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
CONCGRAPH9:=result; 
END; 
                                                       FUNCTION CONCGRAPH10:LDMRULES_pCtrlExpr;
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
CONCGRAPH10:=result; 
END; 
                                                       FUNCTION CONCGRAPH11:LDMRULES_pCtrlExpr;
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
CONCGRAPH11:=result; 
END; 
                                                       FUNCTION CONCGRAPH12:LDMRULES_pCtrlExpr;
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
CONCGRAPH12:=result; 
END; 
                                                       FUNCTION CONCGRAPH13:LDMRULES_pCtrlExpr;
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
CONCGRAPH13:=result; 
END; 
                                                       FUNCTION CONCGRAPH14:LDMRULES_pCtrlExpr;
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
CONCGRAPH14:=result; 
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
result^.R:=89;
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
result^.R:=90;
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
result^.R:=91;
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
result^.R:=92;
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
result^.R:=93;
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
result^.R:=95;
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
result^.R:=96;
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
result^.R:=182;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.R:=181;
ELEMGRAPH1:=result; 
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
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
result^.T:=119;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.T:=120;
ELEMGRAPH1:=result; 
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
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
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
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
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
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
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
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
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
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
                                                       FUNCTION CONCGRAPH11:LDMRULES_pCtrlExpr;
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
CONCGRAPH11:=result; 
END; 
                                                       FUNCTION CONCGRAPH12:LDMRULES_pCtrlExpr;
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
CONCGRAPH12:=result; 
END; 
                                                       FUNCTION CONCGRAPH13:LDMRULES_pCtrlExpr;
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
CONCGRAPH13:=result; 
END; 
                                                       FUNCTION CONCGRAPH14:LDMRULES_pCtrlExpr;
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
CONCGRAPH14:=result; 
END; 
                                                       FUNCTION CONCGRAPH15:LDMRULES_pCtrlExpr;
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
CONCGRAPH15:=result; 
END; 
                                                       FUNCTION CONCGRAPH16:LDMRULES_pCtrlExpr;
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
CONCGRAPH16:=result; 
END; 
                                                       FUNCTION CONCGRAPH17:LDMRULES_pCtrlExpr;
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
CONCGRAPH17:=result; 
END; 
                                                       FUNCTION CONCGRAPH18:LDMRULES_pCtrlExpr;
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
CONCGRAPH18:=result; 
END; 
                                                       FUNCTION CONCGRAPH19:LDMRULES_pCtrlExpr;
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
result^.T:=125;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.T:=126;
ELEMGRAPH1:=result; 
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
result^.T:=127;
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
result^.T:=128;
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
result^.T:=161;
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
result^.T:=162;
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
result^.T:=129;
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
result^.T:=163;
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
result^.T:=165;
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=288;
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
result^.T:=130;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.T:=287;
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
result^.T:=166;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.T:=78;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.T:=79;
ELEMGRAPH1:=result; 
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
result^.T:=80;
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
result^.T:=81;
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
result^.T:=82;
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
result^.T:=84;
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
ELEMGRAPH14:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH15:LDMRULES_pCtrlExpr;
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
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
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
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
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
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
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
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
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
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
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
CONCGRAPH9:=result; 
END; 
                                                       FUNCTION CONCGRAPH10:LDMRULES_pCtrlExpr;
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
CONCGRAPH10:=result; 
END; 
                                                       FUNCTION CONCGRAPH11:LDMRULES_pCtrlExpr;
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
CONCGRAPH11:=result; 
END; 
                                                       FUNCTION CONCGRAPH12:LDMRULES_pCtrlExpr;
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
CONCGRAPH12:=result; 
END; 
                                                       FUNCTION CONCGRAPH13:LDMRULES_pCtrlExpr;
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
CONCGRAPH13:=result; 
END; 
                                                       FUNCTION CONCGRAPH14:LDMRULES_pCtrlExpr;
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
CONCGRAPH14:=result; 
END; 
                                                       FUNCTION CONCGRAPH15:LDMRULES_pCtrlExpr;
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
CONCGRAPH15:=result; 
END; 
                                                       FUNCTION CONCGRAPH16:LDMRULES_pCtrlExpr;
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
CONCGRAPH16:=result; 
END; 
                                                       FUNCTION CONCGRAPH17:LDMRULES_pCtrlExpr;
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
CONCGRAPH17:=result; 
END; 
                                                       FUNCTION CONCGRAPH18:LDMRULES_pCtrlExpr;
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
CONCGRAPH18:=result; 
END; 
                                                       FUNCTION CONCGRAPH19:LDMRULES_pCtrlExpr;
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
CONCGRAPH19:=result; 
END; 
                                                       FUNCTION CONCGRAPH20:LDMRULES_pCtrlExpr;
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
CONCGRAPH20:=result; 
END; 
                                                       FUNCTION CONCGRAPH21:LDMRULES_pCtrlExpr;
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
CONCGRAPH21:=result; 
END; 
                                                       FUNCTION CONCGRAPH22:LDMRULES_pCtrlExpr;
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
CONCGRAPH22:=result; 
END; 
                                                       FUNCTION CONCGRAPH23:LDMRULES_pCtrlExpr;
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
CONCGRAPH23:=result; 
END; 
                                                       FUNCTION CONCGRAPH24:LDMRULES_pCtrlExpr;
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
CONCGRAPH24:=result; 
END; 
                                                       FUNCTION CONCGRAPH25:LDMRULES_pCtrlExpr;
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
CONCGRAPH25:=result; 
END; 
                                                       FUNCTION CONCGRAPH26:LDMRULES_pCtrlExpr;
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
CONCGRAPH26:=result; 
END; 
                                                       FUNCTION CONCGRAPH27:LDMRULES_pCtrlExpr;
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
result^.T:=237;
ELEMGRAPH1:=result; 
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
result^.T:=239;
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
result^.T:=240;
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
ELEMGRAPH16:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH17:LDMRULES_pCtrlExpr;
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
ELEMGRAPH17:=result; 
END; 
                                                       FUNCTION ELEMGRAPH18:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
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
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
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
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
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
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
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
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
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
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
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
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
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
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
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
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
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
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
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
CONCGRAPH9:=result; 
END; 
                                                       FUNCTION CONCGRAPH10:LDMRULES_pCtrlExpr;
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
CONCGRAPH10:=result; 
END; 
                                                       FUNCTION CONCGRAPH11:LDMRULES_pCtrlExpr;
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
CONCGRAPH11:=result; 
END; 
                                                       FUNCTION CONCGRAPH12:LDMRULES_pCtrlExpr;
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
CONCGRAPH12:=result; 
END; 
                                                       FUNCTION CONCGRAPH13:LDMRULES_pCtrlExpr;
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
CONCGRAPH13:=result; 
END; 
                                                       FUNCTION CONCGRAPH14:LDMRULES_pCtrlExpr;
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
CONCGRAPH14:=result; 
END; 
                                                       FUNCTION CONCGRAPH15:LDMRULES_pCtrlExpr;
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
CONCGRAPH15:=result; 
END; 
                                                       FUNCTION CONCGRAPH16:LDMRULES_pCtrlExpr;
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
CONCGRAPH16:=result; 
END; 
                                                       FUNCTION CONCGRAPH17:LDMRULES_pCtrlExpr;
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
CONCGRAPH17:=result; 
END; 
                                                       FUNCTION CONCGRAPH18:LDMRULES_pCtrlExpr;
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
CONCGRAPH18:=result; 
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
ELEMGRAPH20:=result; 
END; 
                                                       FUNCTION ELEMGRAPH21:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=357;
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
result^.T:=356;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
result^.T:=68;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
ELEMGRAPH25:=result; 
END; 
                                                       FUNCTION ELEMGRAPH26:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=264;
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
result^.T:=69;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
ELEMGRAPH27:=result; 
END; 
                                                       FUNCTION ELEMGRAPH28:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=265;
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
result^.T:=70;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
ELEMGRAPH29:=result; 
END; 
                                                       FUNCTION ELEMGRAPH30:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=266;
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
result^.T:=71;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
ELEMGRAPH31:=result; 
END; 
                                                       FUNCTION ELEMGRAPH32:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=267;
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
result^.T:=72;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
ELEMGRAPH33:=result; 
END; 
                                                       FUNCTION ELEMGRAPH34:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=268;
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
                                                       FUNCTION ELEMGRAPH36:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=269;
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
ELEMGRAPH37:=result; 
END; 
                                                       FUNCTION ELEMGRAPH38:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=315;
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
result^.T:=245;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.T:=359;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
ELEMGRAPH40:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH41:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
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
ELEMGRAPH42:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH43:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
ELEMGRAPH43:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH44:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=261;
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
result^.T:=39;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=262;
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
result^.T:=40;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
ELEMGRAPH48:=result; 
END; 
                                                       FUNCTION ELEMGRAPH49:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=263;
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
result^.T:=156;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.T:=307;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
CONCGRAPH1:=result; 
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
result^.T:=222;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.T:=213;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
result^.R:=149;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.R:=153;
ELEMGRAPH1:=result; 
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
result^.R:=151;
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
result^.R:=152;
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
result^.R:=154;
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
result^.R:=156;
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
result^.R:=157;
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
result^.R:=158;
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
result^.R:=159;
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
result^.R:=166;
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
result^.R:=167;
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
result^.R:=148;
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
result^.R:=161;
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
result^.R:=162;
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
result^.R:=169;
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
result^.R:=170;
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
result^.R:=155;
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
result^.R:=163;
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
result^.R:=164;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=327;
ELEMGRAPH6:=result; 
END; 
                                                       FUNCTION ELEMGRAPH7:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=328;
ELEMGRAPH7:=result; 
END; 
                                                       FUNCTION ELEMGRAPH8:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=326;
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
result^.T:=329;
ELEMGRAPH10:=result; 
END; 
                                                       FUNCTION ELEMGRAPH11:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=330;
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
result^.T:=227;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.T:=249;
ELEMGRAPH1:=result; 
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
ELEMGRAPH12:=result; 
END; 
                                                       FUNCTION ELEMGRAPH13:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=346;
ELEMGRAPH13:=result; 
END; 
                                                       FUNCTION ELEMGRAPH14:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=348;
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
result^.T:=347;
ELEMGRAPH16:=result; 
END; 
                                                       FUNCTION ELEMGRAPH17:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=349;
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
result^.T:=230;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.T:=351;
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
result^.T:=353;
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
result^.T:=317;
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
result^.T:=318;
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
result^.R:=127;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.R:=128;
ELEMGRAPH1:=result; 
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
result^.R:=129;
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
result^.R:=130;
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
result^.R:=131;
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
result^.R:=132;
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
result^.R:=137;
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
result^.R:=133;
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
result^.R:=134;
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
result^.R:=135;
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
result^.R:=145;
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
result^.R:=146;
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
result^.R:=138;
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
result^.R:=139;
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
result^.R:=140;
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
result^.R:=136;
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
result^.R:=141;
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
result^.R:=142;
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
result^.R:=143;
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
result^.R:=144;
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
result^.R:=375;
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
result^.R:=147;
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
result^.R:=376;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
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
result^.T:=132;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
ELEMGRAPH29:=result; 
END; 
                                                       FUNCTION ELEMGRAPH30:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=290;
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
result^.T:=133;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
ELEMGRAPH31:=result; 
END; 
                                                       FUNCTION ELEMGRAPH32:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=291;
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=289;
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
ELEMGRAPH35:=result; 
END; 
                                                       FUNCTION ELEMGRAPH36:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=282;
ELEMGRAPH36:=result; 
END; 
                                                       FUNCTION ELEMGRAPH37:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=121;
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
result^.T:=124;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
ELEMGRAPH38:=result; 
END; 
                                                       FUNCTION ELEMGRAPH39:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=284;
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
result^.T:=244;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.T:=358;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH42:=result; 
END; 
                                                       FUNCTION ELEMGRAPH43:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=314;
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
result^.T:=254;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=364;
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
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH46:=result; 
END; 
                                                       FUNCTION ELEMGRAPH47:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=365;
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
ELEMGRAPH48:=result; 
END; 
                                                       FUNCTION ELEMGRAPH49:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=366;
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
ELEMGRAPH50:=result; 
END; 
                                                       FUNCTION ELEMGRAPH51:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=367;
ELEMGRAPH51:=result; 
END; 
                                                       FUNCTION ELEMGRAPH52:LDMRULES_pCtrlExpr;
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
ELEMGRAPH52:=result; 
END; 
                                                       FUNCTION ELEMGRAPH53:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=368;
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
result^.T:=259;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
ELEMGRAPH54:=result; 
END; 
                                                       FUNCTION ELEMGRAPH55:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=369;
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
result^.T:=260;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.T:=370;
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
ELEMGRAPH58:=result; 
END; 
                                                       FUNCTION ELEMGRAPH59:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=308;
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
result^.T:=309;
ELEMGRAPH61:=result; 
END; 
                                                       FUNCTION ELEMGRAPH62:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
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
ELEMGRAPH62:=result; 
END; 
                                                       FUNCTION ELEMGRAPH63:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=344;
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
ELEMGRAPH64:=result; 
END; 
                                                       FUNCTION ELEMGRAPH65:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=310;
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
result^.T:=223;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.T:=360;
ELEMGRAPH67:=result; 
END; 
                                                       FUNCTION ELEMGRAPH68:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
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
ELEMGRAPH68:=result; 
END; 
                                                       FUNCTION ELEMGRAPH69:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=362;
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
result^.T:=361;
ELEMGRAPH71:=result; 
END; 
                                                       FUNCTION ELEMGRAPH72:LDMRULES_pCtrlExpr;
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
ELEMGRAPH72:=result; 
END; 
                                                       FUNCTION ELEMGRAPH73:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=363;
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
ELEMGRAPH74:=result; 
END; 
                                                       FUNCTION ELEMGRAPH75:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=311;
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
ELEMGRAPH76:=result; 
END; 
                                                       FUNCTION ELEMGRAPH77:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=273;
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
result^.T:=88;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
ELEMGRAPH78:=result; 
END; 
                                                       FUNCTION ELEMGRAPH79:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=274;
ELEMGRAPH79:=result; 
END; 
                                                       FUNCTION ELEMGRAPH80:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
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
ELEMGRAPH80:=result; 
END; 
                                                       FUNCTION ELEMGRAPH81:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
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
ELEMGRAPH81:=result; 
END; 
                                                       FUNCTION ELEMGRAPH82:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=270;
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
result^.T:=90;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
ELEMGRAPH83:=result; 
END; 
                                                       FUNCTION ELEMGRAPH84:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=276;
ELEMGRAPH84:=result; 
END; 
                                                       FUNCTION ELEMGRAPH85:LDMRULES_pCtrlExpr;
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=277;
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
result^.T:=92;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
ELEMGRAPH87:=result; 
END; 
                                                       FUNCTION ELEMGRAPH88:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=278;
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
result^.T:=93;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
ELEMGRAPH89:=result; 
END; 
                                                       FUNCTION ELEMGRAPH90:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=279;
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
result^.T:=94;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
ELEMGRAPH91:=result; 
END; 
                                                       FUNCTION ELEMGRAPH92:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=280;
ELEMGRAPH92:=result; 
END; 
                                                       FUNCTION ELEMGRAPH93:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
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
ELEMGRAPH93:=result; 
END; 
                                                       FUNCTION ELEMGRAPH94:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=281;
ELEMGRAPH94:=result; 
END; 
                                                       FUNCTION ELEMGRAPH95:LDMRULES_pCtrlExpr;
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
ELEMGRAPH95:=result; 
END; 
                                                       FUNCTION ELEMGRAPH96:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=295;
ELEMGRAPH96:=result; 
END; 
                                                       FUNCTION ELEMGRAPH97:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
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
ELEMGRAPH97:=result; 
END; 
                                                       FUNCTION ELEMGRAPH98:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=296;
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
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH99:=result; 
END; 
                                                       FUNCTION ELEMGRAPH100:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=297;
ELEMGRAPH100:=result; 
END; 
                                                       FUNCTION ELEMGRAPH101:LDMRULES_pCtrlExpr;
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
ELEMGRAPH101:=result; 
END; 
                                                       FUNCTION ELEMGRAPH102:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=299;
ELEMGRAPH102:=result; 
END; 
                                                       FUNCTION ELEMGRAPH103:LDMRULES_pCtrlExpr;
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
ELEMGRAPH103:=result; 
END; 
                                                       FUNCTION ELEMGRAPH104:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=300;
ELEMGRAPH104:=result; 
END; 
                                                       FUNCTION ELEMGRAPH105:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
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
ELEMGRAPH105:=result; 
END; 
                                                       FUNCTION ELEMGRAPH106:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=301;
ELEMGRAPH106:=result; 
END; 
                                                       FUNCTION ELEMGRAPH107:LDMRULES_pCtrlExpr;
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
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH107:=result; 
END; 
                                                       FUNCTION ELEMGRAPH108:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=298;
ELEMGRAPH108:=result; 
END; 
                                                       FUNCTION ELEMGRAPH109:LDMRULES_pCtrlExpr;
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
ELEMGRAPH109:=result; 
END; 
                                                       FUNCTION ELEMGRAPH110:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=302;
ELEMGRAPH110:=result; 
END; 
                                                       FUNCTION ELEMGRAPH111:LDMRULES_pCtrlExpr;
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
ELEMGRAPH111:=result; 
END; 
                                                       FUNCTION ELEMGRAPH112:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=303;
ELEMGRAPH112:=result; 
END; 
                                                       FUNCTION ELEMGRAPH113:LDMRULES_pCtrlExpr;
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
ELEMGRAPH113:=result; 
END; 
                                                       FUNCTION ELEMGRAPH114:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=304;
ELEMGRAPH114:=result; 
END; 
                                                       FUNCTION ELEMGRAPH115:LDMRULES_pCtrlExpr;
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
ELEMGRAPH115:=result; 
END; 
                                                       FUNCTION ELEMGRAPH116:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=305;
ELEMGRAPH116:=result; 
END; 
                                                       FUNCTION ELEMGRAPH117:LDMRULES_pCtrlExpr;
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
ELEMGRAPH117:=result; 
END; 
                                                       FUNCTION ELEMGRAPH118:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=306;
ELEMGRAPH118:=result; 
END; 
                                                       FUNCTION ELEMGRAPH119:LDMRULES_pCtrlExpr;
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
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
ELEMGRAPH119:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH120:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
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
ELEMGRAPH120:=result; 
END; 
                                                       FUNCTION ELEMGRAPH121:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=283;
ELEMGRAPH121:=result; 
END; 
                                                       FUNCTION ELEMGRAPH122:LDMRULES_pCtrlExpr;
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
ELEMGRAPH122:=result; 
END; 
                                                       FUNCTION ELEMGRAPH123:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=272;
ELEMGRAPH123:=result; 
END; 
                                                       FUNCTION ELEMGRAPH124:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
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
ELEMGRAPH124:=result; 
END; 
                                                       FUNCTION ELEMGRAPH125:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=275;
ELEMGRAPH125:=result; 
END; 
                                                       FUNCTION ELEMGRAPH126:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
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
ELEMGRAPH126:=result; 
END; 
                                                       FUNCTION ELEMGRAPH127:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=271;
ELEMGRAPH127:=result; 
END; 
                                                       FUNCTION ELEMGRAPH128:LDMRULES_pCtrlExpr;
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
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=alternative; 
InitCtrlExprLst(result); 
AppendCtrlExpr(CONCGRAPH1,result); 
GRAPH:=result; 
END; 
                                                       BEGIN
ELEMGRAPH128:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH129:LDMRULES_pCtrlExpr;
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
ELEMGRAPH129:=result; 
END; 
                                                       FUNCTION ELEMGRAPH130:LDMRULES_pCtrlExpr;
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
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.R:=235;
ELEMGRAPH1:=result; 
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
result^.R:=236;
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
result^.R:=237;
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
ELEMGRAPH130:=GRAPH 
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
AppendCtrlExpr(ELEMGRAPH103,result); 
AppendCtrlExpr(ELEMGRAPH104,result); 
AppendCtrlExpr(ELEMGRAPH105,result); 
AppendCtrlExpr(ELEMGRAPH106,result); 
AppendCtrlExpr(ELEMGRAPH107,result); 
AppendCtrlExpr(ELEMGRAPH108,result); 
AppendCtrlExpr(ELEMGRAPH109,result); 
AppendCtrlExpr(ELEMGRAPH110,result); 
AppendCtrlExpr(ELEMGRAPH111,result); 
AppendCtrlExpr(ELEMGRAPH112,result); 
AppendCtrlExpr(ELEMGRAPH113,result); 
AppendCtrlExpr(ELEMGRAPH114,result); 
AppendCtrlExpr(ELEMGRAPH115,result); 
AppendCtrlExpr(ELEMGRAPH116,result); 
AppendCtrlExpr(ELEMGRAPH117,result); 
AppendCtrlExpr(ELEMGRAPH118,result); 
AppendCtrlExpr(ELEMGRAPH119,result); 
AppendCtrlExpr(ELEMGRAPH120,result); 
AppendCtrlExpr(ELEMGRAPH121,result); 
AppendCtrlExpr(ELEMGRAPH122,result); 
AppendCtrlExpr(ELEMGRAPH123,result); 
AppendCtrlExpr(ELEMGRAPH124,result); 
AppendCtrlExpr(ELEMGRAPH125,result); 
AppendCtrlExpr(ELEMGRAPH126,result); 
AppendCtrlExpr(ELEMGRAPH127,result); 
AppendCtrlExpr(ELEMGRAPH128,result); 
AppendCtrlExpr(ELEMGRAPH129,result); 
AppendCtrlExpr(ELEMGRAPH130,result); 
CONCGRAPH1:=result; 
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
FUNCTION TESTNP:LDMRULES_pCtrlExpr; 
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
BEGIN 
TESTNP:=GRAPH 
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
result^.R:=213;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.R:=214;
ELEMGRAPH1:=result; 
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=215;
ELEMGRAPH1:=result; 
END; 
                                                       FUNCTION ELEMGRAPH2:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=216;
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
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
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
result^.T:=143;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.R:=217;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.R:=218;
ELEMGRAPH1:=result; 
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
result^.R:=219;
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
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
result^.R:=55;
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
result^.R:=57;
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
result^.R:=59;
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
result^.R:=66;
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
result^.R:=67;
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
result^.R:=222;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.R:=224;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.T:=293;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.T:=142;
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
result^.R:=227;
ELEMGRAPH1:=result; 
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
result^.R:=228;
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
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
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
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
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
result^.R:=245;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
                                                       BEGIN
ELEMGRAPH1:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH2:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=294;
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
result^.T:=194;
ELEMGRAPH1:=result; 
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
result^.R:=299;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
ELEMGRAPH7:=result; 
END; 
                                                       FUNCTION ELEMGRAPH8:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=337;
ELEMGRAPH8:=result; 
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
CONCGRAPH1:=result; 
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
result^.R:=300;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.R:=304;
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
result^.R:=305;
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
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.R:=301;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.R:=302;
ELEMGRAPH1:=result; 
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
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
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
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
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
result^.R:=392;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.R:=393;
ELEMGRAPH1:=result; 
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
result^.R:=321;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
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
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
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
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
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
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
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
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
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
result^.T:=196;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=338;
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
result^.T:=340;
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
result^.T:=201;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.T:=341;
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
result^.T:=199;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.T:=339;
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
result^.R:=263;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.R:=264;
ELEMGRAPH1:=result; 
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
result^.R:=265;
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
result^.R:=266;
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
result^.R:=267;
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
result^.R:=268;
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
result^.R:=269;
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
result^.R:=270;
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
result^.R:=271;
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
result^.R:=272;
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
result^.R:=273;
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
result^.R:=396;
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
result^.R:=399;
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
result^.R:=397;
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
result^.R:=398;
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
result^.R:=76;
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
result^.R:=276;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.R:=277;
ELEMGRAPH1:=result; 
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
result^.R:=278;
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
result^.R:=279;
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
result^.R:=281;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=336;
ELEMGRAPH4:=result; 
END; 
                                                       FUNCTION ELEMGRAPH5:LDMRULES_pCtrlExpr;
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
result^.T:=191;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.T:=192;
ELEMGRAPH1:=result; 
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
ELEMGRAPH5:=result; 
END; 
                                                       FUNCTION ELEMGRAPH6:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=335;
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
ELEMGRAPH7:=result; 
END; 
                                                       FUNCTION ELEMGRAPH8:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=331;
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
result^.T:=189;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.T:=332;
ELEMGRAPH10:=result; 
END; 
                                                       FUNCTION ELEMGRAPH11:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=333;
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
result^.T:=190;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.T:=334;
ELEMGRAPH13:=result; 
END; 
                                                       FUNCTION ELEMGRAPH14:LDMRULES_pCtrlExpr;
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
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
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=290;
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
result^.R:=285;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.R:=288;
ELEMGRAPH1:=result; 
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
result^.R:=289;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.R:=323;
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
result^.R:=324;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.R:=325;
ELEMGRAPH1:=result; 
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
result^.R:=68;
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
result^.R:=69;
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
result^.R:=70;
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
result^.R:=71;
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
result^.R:=72;
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
result^.R:=73;
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
result^.R:=331;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.T:=197;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.T:=198;
ELEMGRAPH1:=result; 
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
result^.R:=326;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.R:=327;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.R:=328;
ELEMGRAPH1:=result; 
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
result^.R:=329;
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
FUNCTION ADJDERIVATION:LDMRULES_pCtrlExpr; 
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
result^.R:=253;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.R:=254;
ELEMGRAPH1:=result; 
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
result^.R:=255;
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
result^.T:=173;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.T:=174;
ELEMGRAPH1:=result; 
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
result^.T:=175;
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
result^.T:=176;
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
result^.T:=177;
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
result^.T:=178;
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
result^.T:=179;
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
CONCGRAPH1:=result; 
END; 
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
CONCGRAPH2:=result; 
END; 
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
CONCGRAPH4:=result; 
END; 
                                                       FUNCTION CONCGRAPH5:LDMRULES_pCtrlExpr;
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
CONCGRAPH5:=result; 
END; 
                                                       FUNCTION CONCGRAPH6:LDMRULES_pCtrlExpr;
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
CONCGRAPH6:=result; 
END; 
                                                       FUNCTION CONCGRAPH7:LDMRULES_pCtrlExpr;
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
CONCGRAPH7:=result; 
END; 
                                                       FUNCTION CONCGRAPH8:LDMRULES_pCtrlExpr;
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
CONCGRAPH8:=result; 
END; 
                                                       FUNCTION CONCGRAPH9:LDMRULES_pCtrlExpr;
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
ELEMGRAPH4:=result; 
END; 
                                                       FUNCTION ELEMGRAPH5:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=258;
ELEMGRAPH5:=result; 
END; 
                                                       FUNCTION ELEMGRAPH6:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=134;
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
result^.R:=259;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.R:=260;
ELEMGRAPH2:=result; 
END; 
                                                       FUNCTION ELEMGRAPH3:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=210;
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
result^.T:=136;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.R:=261;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.R:=262;
ELEMGRAPH1:=result; 
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
result^.T:=172;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.T:=319;
ELEMGRAPH8:=result; 
END; 
                                                       FUNCTION ELEMGRAPH9:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=322;
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
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=323;
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
result^.T:=321;
ELEMGRAPH14:=result; 
END; 
                                                       FUNCTION ELEMGRAPH15:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=325;
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
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=option; 
result^.ce:=GRAPH; 
ELEMGRAPH16:=result; 
END; 
                                                       FUNCTION ELEMGRAPH17:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=TRANSFORMATION;
result^.T:=324;
ELEMGRAPH17:=result; 
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
CONCGRAPH1:=result; 
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
result^.T:=202;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.R:=332;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.R:=333;
ELEMGRAPH1:=result; 
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
result^.R:=334;
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
result^.R:=335;
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
result^.T:=135;
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
                                                       FUNCTION CONCGRAPH2:LDMRULES_pCtrlExpr;
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
result^.T:=343;
ELEMGRAPH6:=result; 
END; 
                                                       FUNCTION ELEMGRAPH7:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=338;
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
result^.R:=339;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
CONCGRAPH1:=result; 
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
FUNCTION PREPDERIVATION:LDMRULES_pCtrlExpr; 
FUNCTION  GRAPH:LDMRULES_pCtrlExpr;
FUNCTION  CONCGRAPH1:LDMRULES_pCtrlExpr;
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
CONCGRAPH1:=result; 
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
result^.R:=342;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.R:=343;
ELEMGRAPH1:=result; 
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
result^.R:=344;
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
result^.T:=204;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.T:=205;
ELEMGRAPH1:=result; 
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
result^.R:=54;
ELEMGRAPH1:=result; 
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
result^.R:=56;
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
result^.R:=58;
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
result^.R:=176;
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
result^.R:=64;
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
result^.R:=65;
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
result^.R:=347;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.R:=349;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.R:=350;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.T:=206;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.T:=207;
ELEMGRAPH1:=result; 
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
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
CONCGRAPH3:=result; 
END; 
                                                       FUNCTION CONCGRAPH4:LDMRULES_pCtrlExpr;
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
result^.T:=210;
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
ELEMGRAPH4:=GRAPH 
END; 
                                                       FUNCTION ELEMGRAPH5:LDMRULES_pCtrlExpr;
VAR  result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=RULE;
result^.R:=357;
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
PREPPFORMULATOPREPPPROP:=GRAPH 
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
result^.R:=359;
ELEMGRAPH1:=result; 
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
result^.R:=362;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
InitCtrlExprLst(result); 
AppendCtrlExpr(ELEMGRAPH1,result); 
CONCGRAPH1:=result; 
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
result^.R:=361;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.R:=360;
ELEMGRAPH1:=result; 
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
                                                       FUNCTION CONCGRAPH3:LDMRULES_pCtrlExpr;
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
result^.T:=220;
ELEMGRAPH1:=result; 
END; 
                                                       VAR result:LDMRULES_pCtrlExpr;
BEGIN 
LDMRULES_makectrlexpr(result); 
result^.kind:=concatenation; 
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
result^.T:=221;
ELEMGRAPH1:=result; 
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
