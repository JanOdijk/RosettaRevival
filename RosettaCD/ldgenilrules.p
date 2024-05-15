
EXPORT(LDGENILRULES);
pragma C_include('lsparams.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('ldgenilrules.pf');
pragma C_include('hiltree.pf');
pragma C_include('liilrules.pf');
pragma C_include('ldmrules.pf');
pragma C_include('hyperdtree.pf');
pragma C_include('mem.pf');
PROGRAM LDGENILRULES;

WITH lsparams,lsdomaint,hiltree,liilrules,ldmrules,hyperdtree,mem;
 FUNCTION LDGenIlrules_RuleTransFer(
 R:LIILrules_Ruleindex;ps:LIILrules_LiParameters):
 HyperDtree_SetOfHNECluster;
 VAR resultelt:HYPERDTREE_HyperNodeElt;
 p:HYPERDTREE_pHyperNodeElt;
 result:HYPERDTREE_setofHNECluster;
 result1,result2,helpresult1:HYPERDTREE_SetOfHyperNodeElt;
 lsps,lsps1:LSPARAMS_precord;
 X1,X2,X3:INTEGER;
procedure appendresults(sg:INTEGER;result1:HYPERDTREE_SetOfHyperNodeElt;
 VAR result:HYPERDTREE_SetOfHNECluster);
VAR helpset1,helpset2:HYPERDTREE_SetOfHNECluster;
 cluster:HYPERDTREE_setofhypernodeelt;
 found:BOOLEAN;
procedure appendresults(result1:HYPERDTREE_SetOfHyperNodeElt;
 VAR result:HYPERDTREE_SetOfHyperNodeElt);
VAR node:HYPERDTREE_pHypernodeelt;
BEGIN
IF HYPERDTREE_Isemptynode(result) THEN result:=result1 ELSE BEGIN
IF NOT(HYPERDTREE_Isemptynode(result1)) THEN BEGIN
result.last^.next:=result1.first;
result.last:=result1.last END END;
END;
BEGIN
helpset1:=result;
found:=FALSE;
WHILE NOT(HYPERDTREE_isemptyclusterset(helpset1)) AND NOT(found) DO
 BEGIN
 helpset2:=helpset1;
 HYPERDTREE_takeCluster(cluster,helpset1);
 IF cluster.sg=sg THEN
 BEGIN
 found:=TRUE;
 appendresults(result1,helpset2.first^.elts);
 END;
 END;
IF NOT found THEN
 BEGIN
 cluster:=result1;
 cluster.sg:=sg;
 HYPERDTREE_Addcluster(cluster,result)
 END;
END;
function intequals1(param:INTEGER):BOOLEAN;
begin
X1:=param;
intequals1:=TRUE
end;
                                                      function intequals2(param:INTEGER):BOOLEAN;
begin
X1:=param;
intequals2:=TRUE
end;
                                                      function intequals3(param:INTEGER):BOOLEAN;
begin
X1:=param;
intequals3:=TRUE
end;
                                                      function intequals4(param:INTEGER):BOOLEAN;
begin
X1:=param;
intequals4:=TRUE
end;
                                                      function intequals5(param:INTEGER):BOOLEAN;
begin
X1:=param;
intequals5:=TRUE
end;
                                                      function intequals6(param:INTEGER):BOOLEAN;
begin
X1:=param;
intequals6:=TRUE
end;
                                                      function intequals7(param:INTEGER):BOOLEAN;
begin
X1:=param;
intequals7:=TRUE
end;
                                                      function intequals8(param:INTEGER):BOOLEAN;
begin
X1:=param;
intequals8:=TRUE
end;
                                                      function intequals9(param:INTEGER):BOOLEAN;
begin
X1:=param;
intequals9:=TRUE
end;
                                                      function intequals10(param:INTEGER):BOOLEAN;
begin
X1:=param;
intequals10:=TRUE
end;
                                                      function intequals11(param:INTEGER):BOOLEAN;
begin
X1:=param;
intequals11:=TRUE
end;
                                                      function intequals12(param:INTEGER):BOOLEAN;
begin
X1:=param;
intequals12:=TRUE
end;
                                                      function intequals13(param:INTEGER):BOOLEAN;
begin
X1:=param;
intequals13:=TRUE
end;
                                                      function intequals14(param:INTEGER):BOOLEAN;
begin
X1:=param;
intequals14:=TRUE
end;
                                                      function intequals15(param:INTEGER):BOOLEAN;
begin
X1:=param;
intequals15:=TRUE
end;
                                                      BEGIN
resultelt.nodeKind := HyperDtree_RuleNode;
HYPERDTREE_EmptyClusterSet(result);
HYPERDTREE_EmptyNode(result1);
IF R IN [0..254] THEN
CASE R OF
77 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=21;
 resultelt.R:=312;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=312;
 resultelt.parameters.rulenr:=312;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(21,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=243;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=243;
 resultelt.parameters.rulenr:=243;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=7;
 resultelt.R:=296;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=296;
 resultelt.parameters.rulenr:=296;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(7,result1,result);
 END;
 END{WITH};
                                                       END;
166 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=242;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=242;
 resultelt.parameters.rulenr:=242;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=10;
 resultelt.R:=226;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=226;
 resultelt.parameters.rulenr:=226;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(10,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=11;
 resultelt.R:=233;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=233;
 resultelt.parameters.rulenr:=233;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(11,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=27;
 resultelt.R:=397;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=397;
 resultelt.parameters.rulenr:=397;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(27,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=7;
 resultelt.R:=295;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=295;
 resultelt.parameters.rulenr:=295;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(7,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=21;
 resultelt.R:=311;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=311;
 resultelt.parameters.rulenr:=311;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(21,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=18;
 resultelt.R:=508;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=508;
 resultelt.parameters.rulenr:=508;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(18,result1,result);
 END;
 END{WITH};
                                                       END;
169 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=244;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=244;
 resultelt.parameters.rulenr:=244;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=21;
 resultelt.R:=313;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=313;
 resultelt.parameters.rulenr:=313;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(21,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=7;
 resultelt.R:=297;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=297;
 resultelt.parameters.rulenr:=297;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(7,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=18;
 resultelt.R:=509;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=509;
 resultelt.parameters.rulenr:=509;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(18,result1,result);
 END;
 END{WITH};
                                                       END;
33 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=239;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=239;
 resultelt.parameters.rulenr:=239;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=8;
 resultelt.R:=298;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=298;
 resultelt.parameters.rulenr:=298;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(8,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=28;
 resultelt.R:=400;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=400;
 resultelt.parameters.rulenr:=400;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(28,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=22;
 resultelt.R:=318;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=318;
 resultelt.parameters.rulenr:=318;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(22,result1,result);
 END;
 END{WITH};
                                                       END;
34 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=240;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=240;
 resultelt.parameters.rulenr:=240;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       END;
35 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=241;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=241;
 resultelt.parameters.rulenr:=241;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       END;
168 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=288;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=288;
 resultelt.parameters.rulenr:=288;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=289;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=289;
 resultelt.parameters.rulenr:=289;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       END;
92 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=275;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=275;
 resultelt.parameters.rulenr:=275;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       END;
93 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=293;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=293;
 resultelt.parameters.rulenr:=293;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       END;
144 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=248;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=248;
 resultelt.parameters.rulenr:=248;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=272;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=272;
 resultelt.parameters.rulenr:=272;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=276;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=276;
 resultelt.parameters.rulenr:=276;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=251;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=251;
 resultelt.parameters.rulenr:=251;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       END;
131 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=252;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=252;
 resultelt.parameters.rulenr:=252;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=253;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=253;
 resultelt.parameters.rulenr:=253;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=277;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=277;
 resultelt.parameters.rulenr:=277;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=249;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=249;
 resultelt.parameters.rulenr:=249;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=250;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=250;
 resultelt.parameters.rulenr:=250;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=273;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=273;
 resultelt.parameters.rulenr:=273;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       END;
145 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=281;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=281;
 resultelt.parameters.rulenr:=281;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=284;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=284;
 resultelt.parameters.rulenr:=284;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=278;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=278;
 resultelt.parameters.rulenr:=278;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=290;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=290;
 resultelt.parameters.rulenr:=290;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=155;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=155;
 resultelt.parameters.rulenr:=155;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=134;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=134;
 resultelt.parameters.rulenr:=134;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=136;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=136;
 resultelt.parameters.rulenr:=136;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=19;
 resultelt.R:=518;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=518;
 resultelt.parameters.rulenr:=518;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X518SUPER:=PRESENTDEIXIS                                         ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(19,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=8;
 resultelt.R:=304;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=304;
 resultelt.parameters.rulenr:=304;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(8,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=28;
 resultelt.R:=401;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=401;
 resultelt.parameters.rulenr:=401;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X401SUPER:=PRESENTDEIXIS                                         ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(28,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=22;
 resultelt.R:=319;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=319;
 resultelt.parameters.rulenr:=319;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X319SUPER:=PRESENTDEIXIS                                         ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(22,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=24;
 resultelt.R:=362;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=362;
 resultelt.parameters.rulenr:=362;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X362SUPER:=PRESENTDEIXIS                                         ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(24,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=26;
 resultelt.R:=392;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=392;
 resultelt.parameters.rulenr:=392;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X392SUPER:=PRESENTDEIXIS                                         ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(26,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=5;
 resultelt.R:=122;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=122;
 resultelt.parameters.rulenr:=122;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X122SUPER:=PRESENTDEIXIS                                         ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(5,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=17;
 resultelt.R:=112;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=112;
 resultelt.parameters.rulenr:=112;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X112SUPER:=PRESENTDEIXIS                                         ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(17,result1,result);
 END;
 END{WITH};
                                                       END;
134 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=282;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=282;
 resultelt.parameters.rulenr:=282;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=285;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=285;
 resultelt.parameters.rulenr:=285;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=279;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=279;
 resultelt.parameters.rulenr:=279;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=291;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=291;
 resultelt.parameters.rulenr:=291;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=156;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=156;
 resultelt.parameters.rulenr:=156;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=135;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=135;
 resultelt.parameters.rulenr:=135;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=137;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=137;
 resultelt.parameters.rulenr:=137;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=19;
 resultelt.R:=518;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=518;
 resultelt.parameters.rulenr:=518;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X518SUPER:=PASTDEIXIS                                            ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(19,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=8;
 resultelt.R:=305;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=305;
 resultelt.parameters.rulenr:=305;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(8,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=28;
 resultelt.R:=401;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=401;
 resultelt.parameters.rulenr:=401;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X401SUPER:=PASTDEIXIS                                            ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(28,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=22;
 resultelt.R:=319;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=319;
 resultelt.parameters.rulenr:=319;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X319SUPER:=PASTDEIXIS                                            ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(22,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=24;
 resultelt.R:=362;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=362;
 resultelt.parameters.rulenr:=362;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X362SUPER:=PASTDEIXIS                                            ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(24,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=26;
 resultelt.R:=392;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=392;
 resultelt.parameters.rulenr:=392;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X392SUPER:=PASTDEIXIS                                            ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(26,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=17;
 resultelt.R:=112;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=112;
 resultelt.parameters.rulenr:=112;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X112SUPER:=PASTDEIXIS                                            ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(17,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=5;
 resultelt.R:=122;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=122;
 resultelt.parameters.rulenr:=122;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X122SUPER:=PASTDEIXIS                                            ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(5,result1,result);
 END;
 END{WITH};
                                                       END;
133 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=283;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=283;
 resultelt.parameters.rulenr:=283;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=287;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=287;
 resultelt.parameters.rulenr:=287;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=286;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=286;
 resultelt.parameters.rulenr:=286;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=280;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=280;
 resultelt.parameters.rulenr:=280;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=294;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=294;
 resultelt.parameters.rulenr:=294;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=292;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=292;
 resultelt.parameters.rulenr:=292;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       END;
88 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=274;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=274;
 resultelt.parameters.rulenr:=274;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       END;
185 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=246;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=246;
 resultelt.parameters.rulenr:=246;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=247;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=247;
 resultelt.parameters.rulenr:=247;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=266;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=266;
 resultelt.parameters.rulenr:=266;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       END;
186 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=254;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=254;
 resultelt.parameters.rulenr:=254;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
7 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=411;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=411;
 resultelt.parameters.rulenr:=411;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
8 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (X8CATPAR = ILPP                                       )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=32;
 resultelt.R:=494;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=494;
 resultelt.parameters.rulenr:=494;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(32,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (X8CATPAR = ILADVP                                     )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=32;
 resultelt.R:=495;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=495;
 resultelt.parameters.rulenr:=495;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(32,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (X8CATPAR = ILOPPP                                     )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=32;
 resultelt.R:=492;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=492;
 resultelt.parameters.rulenr:=492;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(32,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (X8CATPAR = ILOADVPP                                   )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=32;
 resultelt.R:=490;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=490;
 resultelt.parameters.rulenr:=490;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(32,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (X8CATPAR = ILOADJPP                                   )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=32;
 resultelt.R:=487;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=487;
 resultelt.parameters.rulenr:=487;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(32,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (X8CATPAR = ILNP                                       )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=32;
 resultelt.R:=496;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=496;
 resultelt.parameters.rulenr:=496;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(32,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (X8CATPAR = ILCADVPP                                   )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=32;
 resultelt.R:=491;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=491;
 resultelt.parameters.rulenr:=491;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(32,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (X8CATPAR = ILADJPP                                    )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=32;
 resultelt.R:=489;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=489;
 resultelt.parameters.rulenr:=489;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(32,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (X8CATPAR = ILCADJPP                                   )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=32;
 resultelt.R:=488;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=488;
 resultelt.parameters.rulenr:=488;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(32,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (X8CATPAR = ILSENTENCE                                 )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=32;
 resultelt.R:=499;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=499;
 resultelt.parameters.rulenr:=499;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(32,result1,result);
 END;
 END{WITH};
                                                       END;
11 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (X11CATPAR = ILPP                                      ) AND (
X11KOMMAPAR = YES                                     )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=32;
 resultelt.R:=497;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=497;
 resultelt.parameters.rulenr:=497;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(32,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (X11CATPAR = ILPP                                      ) AND (
X11KOMMAPAR = NO                                      )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=32;
 resultelt.R:=498;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=498;
 resultelt.parameters.rulenr:=498;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(32,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (X11CATPAR = ILSENTENCE                                ) AND (
X11KOMMAPAR = YES                                     )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=32;
 resultelt.R:=500;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=500;
 resultelt.parameters.rulenr:=500;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(32,result1,result);
 END;
 END{WITH};
                                                       END;
9 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (X9CATPAR = ILPP                                       )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=32;
 resultelt.R:=501;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=501;
 resultelt.parameters.rulenr:=501;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(32,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (X9CATPAR = ILOADJPP                                   )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=32;
 resultelt.R:=502;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=502;
 resultelt.parameters.rulenr:=502;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(32,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (X9CATPAR = ILCADJPP                                   )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=32;
 resultelt.R:=503;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=503;
 resultelt.parameters.rulenr:=503;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(32,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (X9CATPAR = ILADJPP                                    )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=32;
 resultelt.R:=504;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=504;
 resultelt.parameters.rulenr:=504;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(32,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (X9CATPAR = ILOADVPP                                   )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=32;
 resultelt.R:=505;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=505;
 resultelt.parameters.rulenr:=505;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(32,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (X9CATPAR = ILNP                                       )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=32;
 resultelt.R:=506;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=506;
 resultelt.parameters.rulenr:=506;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(32,result1,result);
 END;
 END{WITH};
                                                       END;
5 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=235;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=235;
 resultelt.parameters.rulenr:=235;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       END;
6 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=236;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=236;
 resultelt.parameters.rulenr:=236;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       END;
1 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=348;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=348;
 resultelt.parameters.rulenr:=348;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
helpresult1:=result1;
HYPERDTREE_emptyNode(result1);
 IF X1ADJUNCTPAR=ILRESAP THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X348ADJUNCTPAR:=RESAP;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
 IF X1ADJUNCTPAR=ILRESPP THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X348ADJUNCTPAR:=RESPP;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
 IF X1ADJUNCTPAR=ILCOMIT THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X348ADJUNCTPAR:=SUBJCOMIT;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
 IF X1ADJUNCTPAR=ILCOMIT THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X348ADJUNCTPAR:=OBJCOMIT;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
 IF X1ADJUNCTPAR=ILBENFACTNP THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X348ADJUNCTPAR:=BENFACTNP;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
 IF X1ADJUNCTPAR=ILBENFACTPP THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X348ADJUNCTPAR:=BENFACTPP;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
 IF X1ADJUNCTPAR=ILBENFACTNP THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X348ADJUNCTPAR:=BENFACTPP;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
 IF X1ADJUNCTPAR=ILLOCADJUNCT THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X348ADJUNCTPAR:=LOCADJUNCT;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
 IF X1ADJUNCTPAR=ILDIRADJUNCT THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X348ADJUNCTPAR:=DIRADJUNCT;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
 IF X1ADJUNCTPAR=ILRESNP THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X348ADJUNCTPAR:=RESNP;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       END;
2 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=349;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=349;
 resultelt.parameters.rulenr:=349;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
helpresult1:=result1;
HYPERDTREE_emptyNode(result1);
 IF X2ADJUNCTPAR=ILRESAP THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X349ADJUNCTPAR:=RESAP;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
 IF X2ADJUNCTPAR=ILRESPP THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X349ADJUNCTPAR:=RESPP;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
 IF X2ADJUNCTPAR=ILCOMIT THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X349ADJUNCTPAR:=SUBJCOMIT;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
 IF X2ADJUNCTPAR=ILCOMIT THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X349ADJUNCTPAR:=OBJCOMIT;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
 IF X2ADJUNCTPAR=ILBENFACTNP THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X349ADJUNCTPAR:=BENFACTNP;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
 IF X2ADJUNCTPAR=ILBENFACTPP THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X349ADJUNCTPAR:=BENFACTPP;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
 IF X2ADJUNCTPAR=ILBENFACTNP THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X349ADJUNCTPAR:=BENFACTPP;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
 IF X2ADJUNCTPAR=ILLOCADJUNCT THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X349ADJUNCTPAR:=LOCADJUNCT;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
 IF X2ADJUNCTPAR=ILDIRADJUNCT THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X349ADJUNCTPAR:=DIRADJUNCT;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
 IF X2ADJUNCTPAR=ILRESNP THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X349ADJUNCTPAR:=RESNP;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
appendresults(4,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=350;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=350;
 resultelt.parameters.rulenr:=350;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       END;
3 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=4;
 resultelt.R:=349;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=349;
 resultelt.parameters.rulenr:=349;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X349ADJUNCTPAR:=BENFACTNP                                             ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=350;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=350;
 resultelt.parameters.rulenr:=350;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       END;
44 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=17;
 resultelt.R:=107;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=107;
 resultelt.parameters.rulenr:=107;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(17,result1,result);
 END;
 END{WITH};
                                                       END;
42 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=30;
 resultelt.R:=481;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=481;
 resultelt.parameters.rulenr:=481;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(30,result1,result);
 END;
 END{WITH};
                                                       END;
43 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=30;
 resultelt.R:=482;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=482;
 resultelt.parameters.rulenr:=482;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(30,result1,result);
 END;
 END{WITH};
                                                       END;
109 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=460;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=460;
 resultelt.parameters.rulenr:=460;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       END;
12 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=224;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=224;
 resultelt.parameters.rulenr:=224;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=4;
 resultelt.R:=221;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=221;
 resultelt.parameters.rulenr:=221;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X221VOICEPAR:=ACTIVE                                                ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       END;
14 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=221;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=221;
 resultelt.parameters.rulenr:=221;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X221VOICEPAR:=ACTIVE                                                ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=4;
 resultelt.R:=222;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=222;
 resultelt.parameters.rulenr:=222;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X222VOICEPAR:=ACTIVE                                                ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=21;
 resultelt.R:=314;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=314;
 resultelt.parameters.rulenr:=314;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(21,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=27;
 resultelt.R:=398;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=398;
 resultelt.parameters.rulenr:=398;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(27,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=7;
 resultelt.R:=93;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=93;
 resultelt.parameters.rulenr:=93;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(7,result1,result);
 END;
 END{WITH};
                                                       END;
76 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=4;
 resultelt.R:=221;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=221;
 resultelt.parameters.rulenr:=221;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X221VOICEPAR:=ACTIVE                                                ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=223;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=223;
 resultelt.parameters.rulenr:=223;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=4;
 resultelt.R:=222;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=222;
 resultelt.parameters.rulenr:=222;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X222VOICEPAR:=ACTIVE                                                ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       END;
130 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=4;
 resultelt.R:=221;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=221;
 resultelt.parameters.rulenr:=221;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X221VOICEPAR:=PASSIVE                                               ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=222;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=222;
 resultelt.parameters.rulenr:=222;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X222VOICEPAR:=PASSIVE                                               ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=4;
 resultelt.R:=223;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=223;
 resultelt.parameters.rulenr:=223;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=4;
 resultelt.R:=224;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=224;
 resultelt.parameters.rulenr:=224;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       END;
41 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=6;
 resultelt.R:=81;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=81;
 resultelt.parameters.rulenr:=81;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(6,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=13;
 resultelt.R:=143;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=143;
 resultelt.parameters.rulenr:=143;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(13,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=13;
 resultelt.R:=147;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=147;
 resultelt.parameters.rulenr:=147;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(13,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=25;
 resultelt.R:=379;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=379;
 resultelt.parameters.rulenr:=379;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(25,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=25;
 resultelt.R:=380;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=380;
 resultelt.parameters.rulenr:=380;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(25,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=20;
 resultelt.R:=307;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=307;
 resultelt.parameters.rulenr:=307;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(20,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=12;
 resultelt.R:=234;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=234;
 resultelt.parameters.rulenr:=234;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(12,result1,result);
 END;
 END{WITH};
                                                       END;
45 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=259;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=259;
 resultelt.parameters.rulenr:=259;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=53;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=53;
 resultelt.parameters.rulenr:=53;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=261;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=261;
 resultelt.parameters.rulenr:=261;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=55;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=55;
 resultelt.parameters.rulenr:=55;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=63;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=63;
 resultelt.parameters.rulenr:=63;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=65;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=65;
 resultelt.parameters.rulenr:=65;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=59;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=59;
 resultelt.parameters.rulenr:=59;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=61;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=61;
 resultelt.parameters.rulenr:=61;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=57;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=57;
 resultelt.parameters.rulenr:=57;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=62;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=62;
 resultelt.parameters.rulenr:=62;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=255;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=255;
 resultelt.parameters.rulenr:=255;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=256;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=256;
 resultelt.parameters.rulenr:=256;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=257;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=257;
 resultelt.parameters.rulenr:=257;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=264;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=264;
 resultelt.parameters.rulenr:=264;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=262;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=262;
 resultelt.parameters.rulenr:=262;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=268;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=268;
 resultelt.parameters.rulenr:=268;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=263;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=263;
 resultelt.parameters.rulenr:=263;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=8;
 resultelt.R:=94;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=94;
 resultelt.parameters.rulenr:=94;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(8,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=8;
 resultelt.R:=95;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=95;
 resultelt.parameters.rulenr:=95;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(8,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=8;
 resultelt.R:=96;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=96;
 resultelt.parameters.rulenr:=96;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(8,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=8;
 resultelt.R:=97;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=97;
 resultelt.parameters.rulenr:=97;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(8,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=8;
 resultelt.R:=98;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=98;
 resultelt.parameters.rulenr:=98;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(8,result1,result);
 END;
 END{WITH};
                                                       END;
146 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=265;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=265;
 resultelt.parameters.rulenr:=265;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=268;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=268;
 resultelt.parameters.rulenr:=268;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=256;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=256;
 resultelt.parameters.rulenr:=256;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=257;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=257;
 resultelt.parameters.rulenr:=257;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=264;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=264;
 resultelt.parameters.rulenr:=264;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=262;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=262;
 resultelt.parameters.rulenr:=262;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=263;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=263;
 resultelt.parameters.rulenr:=263;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       END;
128 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=58;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=58;
 resultelt.parameters.rulenr:=58;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=56;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=56;
 resultelt.parameters.rulenr:=56;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=64;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=64;
 resultelt.parameters.rulenr:=64;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=60;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=60;
 resultelt.parameters.rulenr:=60;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=258;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=258;
 resultelt.parameters.rulenr:=258;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=52;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=52;
 resultelt.parameters.rulenr:=52;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=260;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=260;
 resultelt.parameters.rulenr:=260;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=54;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=54;
 resultelt.parameters.rulenr:=54;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       END;
46 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=28;
 resultelt.R:=399;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=399;
 resultelt.parameters.rulenr:=399;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(28,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=22;
 resultelt.R:=317;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=317;
 resultelt.parameters.rulenr:=317;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(22,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=45;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=45;
 resultelt.parameters.rulenr:=45;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=46;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=46;
 resultelt.parameters.rulenr:=46;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=47;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=47;
 resultelt.parameters.rulenr:=47;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=48;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=48;
 resultelt.parameters.rulenr:=48;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=49;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=49;
 resultelt.parameters.rulenr:=49;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=50;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=50;
 resultelt.parameters.rulenr:=50;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=51;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=51;
 resultelt.parameters.rulenr:=51;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=8;
 resultelt.R:=99;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=99;
 resultelt.parameters.rulenr:=99;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(8,result1,result);
 END;
 END{WITH};
                                                       END;
78 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=44;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=44;
 resultelt.parameters.rulenr:=44;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=34;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=34;
 resultelt.parameters.rulenr:=34;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=35;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=35;
 resultelt.parameters.rulenr:=35;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=36;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=36;
 resultelt.parameters.rulenr:=36;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=37;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=37;
 resultelt.parameters.rulenr:=37;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=39;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=39;
 resultelt.parameters.rulenr:=39;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=40;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=40;
 resultelt.parameters.rulenr:=40;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=41;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=41;
 resultelt.parameters.rulenr:=41;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=43;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=43;
 resultelt.parameters.rulenr:=43;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=38;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=38;
 resultelt.parameters.rulenr:=38;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=42;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=42;
 resultelt.parameters.rulenr:=42;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=8;
 resultelt.R:=100;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=100;
 resultelt.parameters.rulenr:=100;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(8,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=8;
 resultelt.R:=101;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=101;
 resultelt.parameters.rulenr:=101;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(8,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=8;
 resultelt.R:=102;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=102;
 resultelt.parameters.rulenr:=102;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(8,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=8;
 resultelt.R:=103;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=103;
 resultelt.parameters.rulenr:=103;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(8,result1,result);
 END;
 END{WITH};
                                                       END;
135 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=33;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=33;
 resultelt.parameters.rulenr:=33;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
71 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=26;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=26;
 resultelt.parameters.rulenr:=26;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
200 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=28;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=28;
 resultelt.parameters.rulenr:=28;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
203 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=29;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=29;
 resultelt.parameters.rulenr:=29;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
201 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=31;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=31;
 resultelt.parameters.rulenr:=31;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
89 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=334;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=334;
 resultelt.parameters.rulenr:=334;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=335;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=335;
 resultelt.parameters.rulenr:=335;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=336;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=336;
 resultelt.parameters.rulenr:=336;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
90 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=337;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=337;
 resultelt.parameters.rulenr:=337;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=338;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=338;
 resultelt.parameters.rulenr:=338;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=339;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=339;
 resultelt.parameters.rulenr:=339;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
73 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=347;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=347;
 resultelt.parameters.rulenr:=347;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X347GELIEVEPAR:=GELIEVE                                               ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=347;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=347;
 resultelt.parameters.rulenr:=347;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X347GELIEVEPAR:=UGELIEVE                                              ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
15 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=340;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=340;
 resultelt.parameters.rulenr:=340;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
47 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=344;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=344;
 resultelt.parameters.rulenr:=344;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=333;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=333;
 resultelt.parameters.rulenr:=333;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=9;
 resultelt.R:=170;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=170;
 resultelt.parameters.rulenr:=170;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(9,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=2;
 resultelt.R:=27;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=27;
 resultelt.parameters.rulenr:=27;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=19;
 resultelt.R:=512;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=512;
 resultelt.parameters.rulenr:=512;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(19,result1,result);
 END;
 END{WITH};
                                                       END;
72 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=2;
 resultelt.R:=344;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=344;
 resultelt.parameters.rulenr:=344;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=2;
 resultelt.R:=333;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=333;
 resultelt.parameters.rulenr:=333;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=2;
 resultelt.R:=342;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=342;
 resultelt.parameters.rulenr:=342;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=27;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=27;
 resultelt.parameters.rulenr:=27;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=9;
 resultelt.R:=170;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=170;
 resultelt.parameters.rulenr:=170;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(9,result1,result);
 END;
 END{WITH};
                                                       END;
137 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=2;
 resultelt.R:=344;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=344;
 resultelt.parameters.rulenr:=344;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=2;
 resultelt.R:=333;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=333;
 resultelt.parameters.rulenr:=333;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=2;
 resultelt.R:=27;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=27;
 resultelt.parameters.rulenr:=27;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
13 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=2;
 resultelt.R:=344;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=344;
 resultelt.parameters.rulenr:=344;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=2;
 resultelt.R:=333;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=333;
 resultelt.parameters.rulenr:=333;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=2;
 resultelt.R:=27;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=27;
 resultelt.parameters.rulenr:=27;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
124 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=342;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=342;
 resultelt.parameters.rulenr:=342;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=2;
 resultelt.R:=27;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=27;
 resultelt.parameters.rulenr:=27;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=332;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=332;
 resultelt.parameters.rulenr:=332;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=2;
 resultelt.R:=343;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=343;
 resultelt.parameters.rulenr:=343;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=19;
 resultelt.R:=511;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=511;
 resultelt.parameters.rulenr:=511;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(19,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=19;
 resultelt.R:=512;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=512;
 resultelt.parameters.rulenr:=512;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(19,result1,result);
 END;
 END{WITH};
                                                       END;
125 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=2;
 resultelt.R:=342;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=342;
 resultelt.parameters.rulenr:=342;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=2;
 resultelt.R:=332;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=332;
 resultelt.parameters.rulenr:=332;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
204 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=30;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=30;
 resultelt.parameters.rulenr:=30;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
79 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=9;
 resultelt.R:=171;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=171;
 resultelt.parameters.rulenr:=171;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(9,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=330;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=330;
 resultelt.parameters.rulenr:=330;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
187 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=32;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=32;
 resultelt.parameters.rulenr:=32;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
80 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=331;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=331;
 resultelt.parameters.rulenr:=331;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
91 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=343;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=343;
 resultelt.parameters.rulenr:=343;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
49 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=333;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=333;
 resultelt.parameters.rulenr:=333;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=346;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=346;
 resultelt.parameters.rulenr:=346;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
132 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=345;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=345;
 resultelt.parameters.rulenr:=345;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=330;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=330;
 resultelt.parameters.rulenr:=330;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
143 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=341;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=341;
 resultelt.parameters.rulenr:=341;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=330;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=330;
 resultelt.parameters.rulenr:=330;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
126 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=19;
 resultelt.R:=511;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=511;
 resultelt.parameters.rulenr:=511;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(19,result1,result);
 END;
 END{WITH};
                                                       END;
48 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=19;
 resultelt.R:=512;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=512;
 resultelt.parameters.rulenr:=512;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(19,result1,result);
 END;
 END{WITH};
                                                       END;
127 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=9;
 resultelt.R:=171;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=171;
 resultelt.parameters.rulenr:=171;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(9,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=23;
 resultelt.R:=320;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=320;
 resultelt.parameters.rulenr:=320;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(23,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=29;
 resultelt.R:=403;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=403;
 resultelt.parameters.rulenr:=403;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(29,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=2;
 resultelt.R:=330;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=330;
 resultelt.parameters.rulenr:=330;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
50 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=9;
 resultelt.R:=170;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=170;
 resultelt.parameters.rulenr:=170;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(9,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=23;
 resultelt.R:=321;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=321;
 resultelt.parameters.rulenr:=321;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(23,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=29;
 resultelt.R:=404;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=404;
 resultelt.parameters.rulenr:=404;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(29,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=2;
 resultelt.R:=27;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=27;
 resultelt.parameters.rulenr:=27;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=-1;
 resultelt.sg:=2;
 resultelt.R:=344;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=344;
 resultelt.parameters.rulenr:=344;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
142 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=21;
 resultelt.R:=315;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=315;
 resultelt.parameters.rulenr:=315;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(21,result1,result);
 END;
 END{WITH};
                                                       END;
141 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=21;
 resultelt.R:=316;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=316;
 resultelt.parameters.rulenr:=316;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(21,result1,result);
 END;
 END{WITH};
                                                       END;
140 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=24;
 resultelt.R:=353;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=353;
 resultelt.parameters.rulenr:=353;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(24,result1,result);
 END;
 END{WITH};
                                                       END;
139 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=24;
 resultelt.R:=354;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=354;
 resultelt.parameters.rulenr:=354;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(24,result1,result);
 END;
 END{WITH};
                                                       END;
65 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=413;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=413;
 resultelt.parameters.rulenr:=413;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=414;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=414;
 resultelt.parameters.rulenr:=414;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=415;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=415;
 resultelt.parameters.rulenr:=415;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=416;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=416;
 resultelt.parameters.rulenr:=416;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=418;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=418;
 resultelt.parameters.rulenr:=418;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=417;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=417;
 resultelt.parameters.rulenr:=417;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
148 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=9;
 resultelt.R:=172;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=172;
 resultelt.parameters.rulenr:=172;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(9,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=23;
 resultelt.R:=329;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=329;
 resultelt.parameters.rulenr:=329;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(23,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=29;
 resultelt.R:=405;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=405;
 resultelt.parameters.rulenr:=405;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(29,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=19;
 resultelt.R:=513;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=513;
 resultelt.parameters.rulenr:=513;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(19,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=407;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=407;
 resultelt.parameters.rulenr:=407;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
151 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=408;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=408;
 resultelt.parameters.rulenr:=408;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
150 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=409;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=409;
 resultelt.parameters.rulenr:=409;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
149 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=410;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=410;
 resultelt.parameters.rulenr:=410;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
84 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=11;
 resultelt.R:=227;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=227;
 resultelt.parameters.rulenr:=227;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(11,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=11;
 resultelt.R:=228;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=228;
 resultelt.parameters.rulenr:=228;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(11,result1,result);
 END;
 END{WITH};
                                                       END;
85 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=11;
 resultelt.R:=229;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=229;
 resultelt.parameters.rulenr:=229;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(11,result1,result);
 END;
 END{WITH};
                                                       END;
86 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=11;
 resultelt.R:=230;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=230;
 resultelt.parameters.rulenr:=230;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(11,result1,result);
 END;
 END{WITH};
                                                       END;
87 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=11;
 resultelt.R:=231;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=231;
 resultelt.parameters.rulenr:=231;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(11,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=11;
 resultelt.R:=232;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=232;
 resultelt.parameters.rulenr:=232;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(11,result1,result);
 END;
 END{WITH};
                                                       END;
164 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (intequals2(X164ANTECEDENT)                            )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=412;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=412;
 resultelt.parameters.rulenr:=412;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 lsps^.X412ANTECEDENT:=X1                                                    ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       END;
165 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (intequals3(X165ANTECEDENT)                            )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=412;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=412;
 resultelt.parameters.rulenr:=412;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 lsps^.X412ANTECEDENT:=X1                                                    ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       END;
167 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (intequals8(X167INDEXPAR)                              )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=423;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=423;
 resultelt.parameters.rulenr:=423;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X423INDEXPAR:=X1                                                    ;
 lsps^.X423XPMOODPAR:=RELATIVEXPMOOD                                        ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (intequals8(X167INDEXPAR)                              )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=424;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=424;
 resultelt.parameters.rulenr:=424;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X424INDEXPAR:=X1                                                    ;
 lsps^.X424XPMOODPAR:=RELATIVEXPMOOD                                        ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (intequals8(X167INDEXPAR)                              )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=425;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=425;
 resultelt.parameters.rulenr:=425;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X425INDEXPAR:=X1                                                    ;
 lsps^.X425XPMOODPAR:=RELATIVEXPMOOD                                        ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (intequals8(X167INDEXPAR)                              )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=426;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=426;
 resultelt.parameters.rulenr:=426;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X426INDEXPAR:=X1                                                    ;
 lsps^.X426XPMOODPAR:=RELATIVEXPMOOD                                        ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
189 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (intequals13(X189INDEXPAR)                             )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=423;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=423;
 resultelt.parameters.rulenr:=423;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X423INDEXPAR:=X1                                                    ;
 lsps^.X423XPMOODPAR:=TOPICXPMOOD                                           ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (intequals13(X189INDEXPAR)                             )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=424;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=424;
 resultelt.parameters.rulenr:=424;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X424INDEXPAR:=X1                                                    ;
 lsps^.X424XPMOODPAR:=TOPICXPMOOD                                           ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (intequals13(X189INDEXPAR)                             )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=425;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=425;
 resultelt.parameters.rulenr:=425;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X425INDEXPAR:=X1                                                    ;
 lsps^.X425XPMOODPAR:=TOPICXPMOOD                                           ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (intequals13(X189INDEXPAR)                             )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=426;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=426;
 resultelt.parameters.rulenr:=426;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X426INDEXPAR:=X1                                                    ;
 lsps^.X426XPMOODPAR:=TOPICXPMOOD                                           ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
177 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=18;
 resultelt.R:=507;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=507;
 resultelt.parameters.rulenr:=507;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(18,result1,result);
 END;
 END{WITH};
                                                       END;
26 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=25;
 resultelt.R:=381;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=381;
 resultelt.parameters.rulenr:=381;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(25,result1,result);
 END;
 END{WITH};
                                                       END;
29 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=6;
 resultelt.R:=82;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=82;
 resultelt.parameters.rulenr:=82;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(6,result1,result);
 END;
 END{WITH};
                                                       END;
27 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=237;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=237;
 resultelt.parameters.rulenr:=237;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       END;
28 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=238;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=238;
 resultelt.parameters.rulenr:=238;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       END;
179 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=26;
 resultelt.R:=382;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=382;
 resultelt.parameters.rulenr:=382;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(26,result1,result);
 END;
 END{WITH};
                                                       END;
180 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=26;
 resultelt.R:=383;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=383;
 resultelt.parameters.rulenr:=383;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(26,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=24;
 resultelt.R:=352;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=352;
 resultelt.parameters.rulenr:=352;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(24,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=24;
 resultelt.R:=431;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=431;
 resultelt.parameters.rulenr:=431;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(24,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=24;
 resultelt.R:=434;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=434;
 resultelt.parameters.rulenr:=434;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(24,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=24;
 resultelt.R:=432;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=432;
 resultelt.parameters.rulenr:=432;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(24,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=24;
 resultelt.R:=433;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=433;
 resultelt.parameters.rulenr:=433;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(24,result1,result);
 END;
 END{WITH};
                                                       END;
173 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=7;
 resultelt.R:=83;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=83;
 resultelt.parameters.rulenr:=83;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(7,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=21;
 resultelt.R:=308;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=308;
 resultelt.parameters.rulenr:=308;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(21,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=68;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=68;
 resultelt.parameters.rulenr:=68;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       END;
174 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=7;
 resultelt.R:=84;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=84;
 resultelt.parameters.rulenr:=84;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(7,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=435;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=435;
 resultelt.parameters.rulenr:=435;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=436;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=436;
 resultelt.parameters.rulenr:=436;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=439;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=439;
 resultelt.parameters.rulenr:=439;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=440;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=440;
 resultelt.parameters.rulenr:=440;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=476;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=476;
 resultelt.parameters.rulenr:=476;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=21;
 resultelt.R:=309;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=309;
 resultelt.parameters.rulenr:=309;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(21,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=70;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=70;
 resultelt.parameters.rulenr:=70;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=71;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=71;
 resultelt.parameters.rulenr:=71;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=69;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=69;
 resultelt.parameters.rulenr:=69;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=27;
 resultelt.R:=394;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=394;
 resultelt.parameters.rulenr:=394;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(27,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=27;
 resultelt.R:=395;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=395;
 resultelt.parameters.rulenr:=395;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(27,result1,result);
 END;
 END{WITH};
                                                       END;
175 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=7;
 resultelt.R:=85;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=85;
 resultelt.parameters.rulenr:=85;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(7,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=7;
 resultelt.R:=87;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=87;
 resultelt.parameters.rulenr:=87;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(7,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=21;
 resultelt.R:=310;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=310;
 resultelt.parameters.rulenr:=310;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(21,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=73;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=73;
 resultelt.parameters.rulenr:=73;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=72;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=72;
 resultelt.parameters.rulenr:=72;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=27;
 resultelt.R:=396;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=396;
 resultelt.parameters.rulenr:=396;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(27,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=441;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=441;
 resultelt.parameters.rulenr:=441;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=479;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=479;
 resultelt.parameters.rulenr:=479;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=443;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=443;
 resultelt.parameters.rulenr:=443;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=444;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=444;
 resultelt.parameters.rulenr:=444;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=480;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=480;
 resultelt.parameters.rulenr:=480;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=427;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=427;
 resultelt.parameters.rulenr:=427;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=478;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=478;
 resultelt.parameters.rulenr:=478;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=21;
 resultelt.R:=429;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=429;
 resultelt.parameters.rulenr:=429;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(21,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=21;
 resultelt.R:=430;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=430;
 resultelt.parameters.rulenr:=430;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(21,result1,result);
 END;
 END{WITH};
                                                       END;
176 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=7;
 resultelt.R:=86;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=86;
 resultelt.parameters.rulenr:=86;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(7,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=74;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=74;
 resultelt.parameters.rulenr:=74;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=442;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=442;
 resultelt.parameters.rulenr:=442;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=445;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=445;
 resultelt.parameters.rulenr:=445;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=446;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=446;
 resultelt.parameters.rulenr:=446;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       END;
181 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=10;
 resultelt.R:=225;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=225;
 resultelt.parameters.rulenr:=225;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(10,result1,result);
 END;
 END{WITH};
                                                       END;
171 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=66;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=66;
 resultelt.parameters.rulenr:=66;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       END;
172 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=67;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=67;
 resultelt.parameters.rulenr:=67;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       END;
32 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=23;
 resultelt.R:=322;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=322;
 resultelt.parameters.rulenr:=322;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(23,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=23;
 resultelt.R:=324;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=324;
 resultelt.parameters.rulenr:=324;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(23,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=10;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=10;
 resultelt.parameters.rulenr:=10;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=11;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=11;
 resultelt.parameters.rulenr:=11;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=12;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=12;
 resultelt.parameters.rulenr:=12;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=370;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=370;
 resultelt.parameters.rulenr:=370;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=371;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=371;
 resultelt.parameters.rulenr:=371;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=372;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=372;
 resultelt.parameters.rulenr:=372;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=364;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=364;
 resultelt.parameters.rulenr:=364;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=9;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=9;
 resultelt.parameters.rulenr:=9;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=365;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=365;
 resultelt.parameters.rulenr:=365;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=366;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=366;
 resultelt.parameters.rulenr:=366;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=367;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=367;
 resultelt.parameters.rulenr:=367;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=368;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=368;
 resultelt.parameters.rulenr:=368;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=373;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=373;
 resultelt.parameters.rulenr:=373;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=374;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=374;
 resultelt.parameters.rulenr:=374;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=376;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=376;
 resultelt.parameters.rulenr:=376;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=375;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=375;
 resultelt.parameters.rulenr:=375;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=23;
 resultelt.R:=323;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=323;
 resultelt.parameters.rulenr:=323;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(23,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=23;
 resultelt.R:=325;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=325;
 resultelt.parameters.rulenr:=325;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(23,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=19;
 resultelt.R:=510;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=510;
 resultelt.parameters.rulenr:=510;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(19,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=23;
 resultelt.R:=328;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=328;
 resultelt.parameters.rulenr:=328;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(23,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=29;
 resultelt.R:=402;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=402;
 resultelt.parameters.rulenr:=402;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(29,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=9;
 resultelt.R:=166;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=166;
 resultelt.parameters.rulenr:=166;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(9,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=9;
 resultelt.R:=167;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=167;
 resultelt.parameters.rulenr:=167;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(9,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=9;
 resultelt.R:=168;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=168;
 resultelt.parameters.rulenr:=168;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(9,result1,result);
 END;
 END{WITH};
                                                       END;
31 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=14;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=14;
 resultelt.parameters.rulenr:=14;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=15;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=15;
 resultelt.parameters.rulenr:=15;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=16;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=16;
 resultelt.parameters.rulenr:=16;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=369;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=369;
 resultelt.parameters.rulenr:=369;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=23;
 resultelt.R:=326;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=326;
 resultelt.parameters.rulenr:=326;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(23,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=23;
 resultelt.R:=327;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=327;
 resultelt.parameters.rulenr:=327;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(23,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=17;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=17;
 resultelt.parameters.rulenr:=17;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=18;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=18;
 resultelt.parameters.rulenr:=18;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=19;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=19;
 resultelt.parameters.rulenr:=19;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=20;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=20;
 resultelt.parameters.rulenr:=20;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=9;
 resultelt.R:=169;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=169;
 resultelt.parameters.rulenr:=169;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(9,result1,result);
 END;
 END{WITH};
                                                       END;
147 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=378;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=378;
 resultelt.parameters.rulenr:=378;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=377;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=377;
 resultelt.parameters.rulenr:=377;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=21;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=21;
 resultelt.parameters.rulenr:=21;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
138 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=419;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=419;
 resultelt.parameters.rulenr:=419;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
96 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=420;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=420;
 resultelt.parameters.rulenr:=420;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=421;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=421;
 resultelt.parameters.rulenr:=421;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X421RELPAR:=OBJREL                                                ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=421;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=421;
 resultelt.parameters.rulenr:=421;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X421RELPAR:=INDOBJREL                                             ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=421;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=421;
 resultelt.parameters.rulenr:=421;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X421RELPAR:=PREPOBJREL                                            ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=421;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=421;
 resultelt.parameters.rulenr:=421;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X421RELPAR:=PREDREL                                               ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=421;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=421;
 resultelt.parameters.rulenr:=421;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X421RELPAR:=LOCARGREL                                             ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=421;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=421;
 resultelt.parameters.rulenr:=421;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X421RELPAR:=DIRARGREL                                             ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=421;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=421;
 resultelt.parameters.rulenr:=421;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X421RELPAR:=VPADVREL                                              ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=421;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=421;
 resultelt.parameters.rulenr:=421;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X421RELPAR:=AGVPADVREL                                            ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=421;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=421;
 resultelt.parameters.rulenr:=421;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X421RELPAR:=BYOBJREL                                              ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=422;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=422;
 resultelt.parameters.rulenr:=422;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X422RELPAR:=TEMPADVREL                                            ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=422;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=422;
 resultelt.parameters.rulenr:=422;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X422RELPAR:=PREADVREL                                             ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=422;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=422;
 resultelt.parameters.rulenr:=422;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X422RELPAR:=POSTSUBJREL                                           ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=422;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=422;
 resultelt.parameters.rulenr:=422;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X422RELPAR:=LOCADVREL                                             ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=422;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=422;
 resultelt.parameters.rulenr:=422;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X422RELPAR:=ERPOSREL                                              ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=422;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=422;
 resultelt.parameters.rulenr:=422;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X422RELPAR:=SUBJREL                                               ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=422;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=422;
 resultelt.parameters.rulenr:=422;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X422RELPAR:=SHIFTREL                                              ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
136 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=22;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=22;
 resultelt.parameters.rulenr:=22;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
95 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=23;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=23;
 resultelt.parameters.rulenr:=23;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=24;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=24;
 resultelt.parameters.rulenr:=24;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=2;
 resultelt.R:=25;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=25;
 resultelt.parameters.rulenr:=25;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(2,result1,result);
 END;
 END{WITH};
                                                       END;
170 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=11;
 resultelt.R:=213;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=213;
 resultelt.parameters.rulenr:=213;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(11,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=11;
 resultelt.R:=214;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=214;
 resultelt.parameters.rulenr:=214;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(11,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=10;
 resultelt.R:=211;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=211;
 resultelt.parameters.rulenr:=211;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(10,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=10;
 resultelt.R:=212;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=212;
 resultelt.parameters.rulenr:=212;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(10,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=18;
 resultelt.R:=215;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=215;
 resultelt.parameters.rulenr:=215;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(18,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=18;
 resultelt.R:=216;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=216;
 resultelt.parameters.rulenr:=216;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(18,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=21;
 resultelt.R:=219;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=219;
 resultelt.parameters.rulenr:=219;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(21,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=21;
 resultelt.R:=220;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=220;
 resultelt.parameters.rulenr:=220;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(21,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=27;
 resultelt.R:=217;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=217;
 resultelt.parameters.rulenr:=217;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(27,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=27;
 resultelt.R:=218;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=218;
 resultelt.parameters.rulenr:=218;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(27,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=7;
 resultelt.R:=91;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=91;
 resultelt.parameters.rulenr:=91;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(7,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=7;
 resultelt.R:=90;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=90;
 resultelt.parameters.rulenr:=90;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(7,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=177;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=177;
 resultelt.parameters.rulenr:=177;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=178;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=178;
 resultelt.parameters.rulenr:=178;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       END;
70 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=11;
 resultelt.R:=193;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=193;
 resultelt.parameters.rulenr:=193;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(11,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=11;
 resultelt.R:=194;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=194;
 resultelt.parameters.rulenr:=194;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(11,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=11;
 resultelt.R:=195;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=195;
 resultelt.parameters.rulenr:=195;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(11,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=10;
 resultelt.R:=196;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=196;
 resultelt.parameters.rulenr:=196;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(10,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=10;
 resultelt.R:=197;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=197;
 resultelt.parameters.rulenr:=197;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(10,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=10;
 resultelt.R:=198;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=198;
 resultelt.parameters.rulenr:=198;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(10,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=18;
 resultelt.R:=199;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=199;
 resultelt.parameters.rulenr:=199;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(18,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=18;
 resultelt.R:=200;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=200;
 resultelt.parameters.rulenr:=200;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(18,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=18;
 resultelt.R:=201;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=201;
 resultelt.parameters.rulenr:=201;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(18,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=21;
 resultelt.R:=202;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=202;
 resultelt.parameters.rulenr:=202;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(21,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=21;
 resultelt.R:=203;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=203;
 resultelt.parameters.rulenr:=203;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(21,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=21;
 resultelt.R:=204;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=204;
 resultelt.parameters.rulenr:=204;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(21,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=27;
 resultelt.R:=205;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=205;
 resultelt.parameters.rulenr:=205;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(27,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=27;
 resultelt.R:=206;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=206;
 resultelt.parameters.rulenr:=206;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(27,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=27;
 resultelt.R:=207;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=207;
 resultelt.parameters.rulenr:=207;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(27,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=7;
 resultelt.R:=208;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=208;
 resultelt.parameters.rulenr:=208;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(7,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=7;
 resultelt.R:=209;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=209;
 resultelt.parameters.rulenr:=209;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(7,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=7;
 resultelt.R:=210;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=210;
 resultelt.parameters.rulenr:=210;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(7,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=182;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=182;
 resultelt.parameters.rulenr:=182;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=181;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=181;
 resultelt.parameters.rulenr:=181;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=180;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=180;
 resultelt.parameters.rulenr:=180;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       END;
68 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=267;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=267;
 resultelt.parameters.rulenr:=267;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       END;
67 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=269;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=269;
 resultelt.parameters.rulenr:=269;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=271;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=271;
 resultelt.parameters.rulenr:=271;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       END;
69 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=270;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=270;
 resultelt.parameters.rulenr:=270;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       END;
198 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=471;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=471;
 resultelt.parameters.rulenr:=471;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       END;
16 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=472;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=472;
 resultelt.parameters.rulenr:=472;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=473;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=473;
 resultelt.parameters.rulenr:=473;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=3;
 resultelt.R:=474;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=474;
 resultelt.parameters.rulenr:=474;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(3,result1,result);
 END;
 END{WITH};
                                                       END;
199 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=179;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=179;
 resultelt.parameters.rulenr:=179;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       END;
118 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=26;
 resultelt.R:=388;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=388;
 resultelt.parameters.rulenr:=388;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(26,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=26;
 resultelt.R:=389;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=389;
 resultelt.parameters.rulenr:=389;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(26,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=24;
 resultelt.R:=355;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=355;
 resultelt.parameters.rulenr:=355;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(24,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=24;
 resultelt.R:=358;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=358;
 resultelt.parameters.rulenr:=358;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(24,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=24;
 resultelt.R:=356;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=356;
 resultelt.parameters.rulenr:=356;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(24,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=24;
 resultelt.R:=359;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=359;
 resultelt.parameters.rulenr:=359;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(24,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=24;
 resultelt.R:=357;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=357;
 resultelt.parameters.rulenr:=357;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(24,result1,result);
 END;
 END{WITH};
                                                       END;
120 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=24;
 resultelt.R:=360;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=360;
 resultelt.parameters.rulenr:=360;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(24,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=24;
 resultelt.R:=361;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=361;
 resultelt.parameters.rulenr:=361;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(24,result1,result);
 END;
 END{WITH};
                                                       END;
191 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=1;
 resultelt.R:=2;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=2;
 resultelt.parameters.rulenr:=2;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(1,result1,result);
 END;
 END{WITH};
                                                       END;
192 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=1;
 resultelt.R:=406;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=406;
 resultelt.parameters.rulenr:=406;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(1,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=1;
 resultelt.R:=4;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=4;
 resultelt.parameters.rulenr:=4;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(1,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=1;
 resultelt.R:=5;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=5;
 resultelt.parameters.rulenr:=5;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(1,result1,result);
 END;
 END{WITH};
                                                       END;
193 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=1;
 resultelt.R:=3;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=3;
 resultelt.parameters.rulenr:=3;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X3CASESPAR:=[NOMINATIVE]                                          ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(1,result1,result);
 END;
 END{WITH};
                                                       END;
195 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=1;
 resultelt.R:=3;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=3;
 resultelt.parameters.rulenr:=3;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X3CASESPAR:=[DATIVE]                                              ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(1,result1,result);
 END;
 END{WITH};
                                                       END;
194 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=1;
 resultelt.R:=3;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=3;
 resultelt.parameters.rulenr:=3;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X3CASESPAR:=[ACCUSATIVE]                                          ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(1,result1,result);
 END;
 END{WITH};
                                                       END;
196 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=1;
 resultelt.R:=7;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=7;
 resultelt.parameters.rulenr:=7;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(1,result1,result);
 END;
 END{WITH};
                                                       END;
197 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=1;
 resultelt.R:=8;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=8;
 resultelt.parameters.rulenr:=8;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(1,result1,result);
 END;
 END{WITH};
                                                       END;
94 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=175;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=175;
 resultelt.parameters.rulenr:=175;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=4;
 resultelt.R:=176;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=176;
 resultelt.parameters.rulenr:=176;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(4,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=11;
 resultelt.R:=183;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=183;
 resultelt.parameters.rulenr:=183;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(11,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=11;
 resultelt.R:=186;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=186;
 resultelt.parameters.rulenr:=186;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(11,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=10;
 resultelt.R:=184;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=184;
 resultelt.parameters.rulenr:=184;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(10,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=10;
 resultelt.R:=187;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=187;
 resultelt.parameters.rulenr:=187;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(10,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=21;
 resultelt.R:=185;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=185;
 resultelt.parameters.rulenr:=185;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(21,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=21;
 resultelt.R:=188;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=188;
 resultelt.parameters.rulenr:=188;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(21,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=18;
 resultelt.R:=189;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=189;
 resultelt.parameters.rulenr:=189;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(18,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=18;
 resultelt.R:=190;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=190;
 resultelt.parameters.rulenr:=190;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(18,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=27;
 resultelt.R:=191;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=191;
 resultelt.parameters.rulenr:=191;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(27,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=27;
 resultelt.R:=192;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=192;
 resultelt.parameters.rulenr:=192;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(27,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=7;
 resultelt.R:=88;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=88;
 resultelt.parameters.rulenr:=88;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(7,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=7;
 resultelt.R:=89;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=89;
 resultelt.parameters.rulenr:=89;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(7,result1,result);
 END;
 END{WITH};
                                                       END;
30 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=7;
 resultelt.R:=75;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=75;
 resultelt.parameters.rulenr:=75;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(7,result1,result);
 END;
 END{WITH};
                                                       END;
24 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=7;
 resultelt.R:=76;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=76;
 resultelt.parameters.rulenr:=76;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(7,result1,result);
 END;
 END{WITH};
                                                       END;
25 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=7;
 resultelt.R:=77;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=77;
 resultelt.parameters.rulenr:=77;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(7,result1,result);
 END;
 END{WITH};
                                                       END;
18 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=7;
 resultelt.R:=78;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=78;
 resultelt.parameters.rulenr:=78;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(7,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=7;
 resultelt.R:=79;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=79;
 resultelt.parameters.rulenr:=79;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(7,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=7;
 resultelt.R:=80;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=80;
 resultelt.parameters.rulenr:=80;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(7,result1,result);
 END;
 END{WITH};
                                                       END;
23 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=9;
 resultelt.R:=174;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=174;
 resultelt.parameters.rulenr:=174;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(9,result1,result);
 END;
 END{WITH};
                                                       END;
22 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=9;
 resultelt.R:=173;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=173;
 resultelt.parameters.rulenr:=173;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(9,result1,result);
 END;
 END{WITH};
                                                       END;
163 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=5;
 resultelt.R:=115;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=115;
 resultelt.parameters.rulenr:=115;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(5,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=5;
 resultelt.R:=116;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=116;
 resultelt.parameters.rulenr:=116;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(5,result1,result);
 END;
 END{WITH};
                                                       END;
152 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=26;
 resultelt.R:=384;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=384;
 resultelt.parameters.rulenr:=384;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(26,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=26;
 resultelt.R:=385;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=385;
 resultelt.parameters.rulenr:=385;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(26,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=26;
 resultelt.R:=386;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=386;
 resultelt.parameters.rulenr:=386;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(26,result1,result);
 END;
 END{WITH};
                                                       END;
159 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=26;
 resultelt.R:=387;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=387;
 resultelt.parameters.rulenr:=387;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(26,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=5;
 resultelt.R:=121;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=121;
 resultelt.parameters.rulenr:=121;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(5,result1,result);
 END;
 END{WITH};
                                                       END;
158 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=26;
 resultelt.R:=114;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=114;
 resultelt.parameters.rulenr:=114;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(26,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=5;
 resultelt.R:=120;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=120;
 resultelt.parameters.rulenr:=120;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(5,result1,result);
 END;
 END{WITH};
                                                       END;
162 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=26;
 resultelt.R:=390;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=390;
 resultelt.parameters.rulenr:=390;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(26,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=5;
 resultelt.R:=124;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=124;
 resultelt.parameters.rulenr:=124;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(5,result1,result);
 END;
 END{WITH};
                                                       END;
154 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=26;
 resultelt.R:=393;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=393;
 resultelt.parameters.rulenr:=393;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(26,result1,result);
 END;
 END{WITH};
                                                       END;
155 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=5;
 resultelt.R:=117;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=117;
 resultelt.parameters.rulenr:=117;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(5,result1,result);
 END;
 END{WITH};
                                                       END;
156 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=5;
 resultelt.R:=118;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=118;
 resultelt.parameters.rulenr:=118;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(5,result1,result);
 END;
 END{WITH};
                                                       END;
153 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=26;
 resultelt.R:=113;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=113;
 resultelt.parameters.rulenr:=113;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(26,result1,result);
 END;
 END{WITH};
                                                       END;
157 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=5;
 resultelt.R:=119;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=119;
 resultelt.parameters.rulenr:=119;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(5,result1,result);
 END;
 END{WITH};
                                                       END;
161 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=26;
 resultelt.R:=391;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=391;
 resultelt.parameters.rulenr:=391;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(26,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=5;
 resultelt.R:=123;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=123;
 resultelt.parameters.rulenr:=123;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(5,result1,result);
 END;
 END{WITH};
                                                       END;
38 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=13;
 resultelt.R:=149;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=149;
 resultelt.parameters.rulenr:=149;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(13,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=13;
 resultelt.R:=148;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=148;
 resultelt.parameters.rulenr:=148;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(13,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=13;
 resultelt.R:=150;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=150;
 resultelt.parameters.rulenr:=150;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(13,result1,result);
 END;
 END{WITH};
                                                       END;
40 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=13;
 resultelt.R:=470;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=470;
 resultelt.parameters.rulenr:=470;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(13,result1,result);
 END;
 END{WITH};
                                                       END;
39 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=13;
 resultelt.R:=146;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=146;
 resultelt.parameters.rulenr:=146;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(13,result1,result);
 END;
 END{WITH};
                                                       END;
182 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=144;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=144;
 resultelt.parameters.rulenr:=144;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       END;
183 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=145;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=145;
 resultelt.parameters.rulenr:=145;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
helpresult1:=result1;
HYPERDTREE_emptyNode(result1);
 IF X183NUMBERPAR=ILSINGULAR THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X145NUMBERPAR:=SINGULAR;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
 IF X183NUMBERPAR=ILPLURAL THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X145NUMBERPAR:=PLURAL;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       END;
51 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=151;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=151;
 resultelt.parameters.rulenr:=151;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       END;
52 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=153;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=153;
 resultelt.parameters.rulenr:=153;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       END;
53 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=152;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=152;
 resultelt.parameters.rulenr:=152;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=154;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=154;
 resultelt.parameters.rulenr:=154;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       END;
54 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=514;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=514;
 resultelt.parameters.rulenr:=514;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       END;
55 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=515;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=515;
 resultelt.parameters.rulenr:=515;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       END;
56 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=516;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=516;
 resultelt.parameters.rulenr:=516;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       END;
57 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=517;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=517;
 resultelt.parameters.rulenr:=517;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       END;
59 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=455;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=455;
 resultelt.parameters.rulenr:=455;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=164;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=164;
 resultelt.parameters.rulenr:=164;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=157;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=157;
 resultelt.parameters.rulenr:=157;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=452;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=452;
 resultelt.parameters.rulenr:=452;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=453;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=453;
 resultelt.parameters.rulenr:=453;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=162;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=162;
 resultelt.parameters.rulenr:=162;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       END;
60 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=457;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=457;
 resultelt.parameters.rulenr:=457;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       END;
61 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=163;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=163;
 resultelt.parameters.rulenr:=163;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       END;
62 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=158;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=158;
 resultelt.parameters.rulenr:=158;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       END;
97 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=456;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=456;
 resultelt.parameters.rulenr:=456;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       END;
63 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=159;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=159;
 resultelt.parameters.rulenr:=159;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=160;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=160;
 resultelt.parameters.rulenr:=160;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=161;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=161;
 resultelt.parameters.rulenr:=161;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       END;
64 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=14;
 resultelt.R:=165;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=165;
 resultelt.parameters.rulenr:=165;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(14,result1,result);
 END;
 END{WITH};
                                                       END;
98 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=31;
 resultelt.R:=483;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=483;
 resultelt.parameters.rulenr:=483;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
helpresult1:=result1;
HYPERDTREE_emptyNode(result1);
 IF X98SUPERPAR=ILPRESENTDEIXIS THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X483SUPERPAR:=PRESENTDEIXIS;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
 IF X98SUPERPAR=ILPASTDEIXIS THEN BEGIN
result2:=helpresult1;
WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO
 BEGIN
 HYPERDTREE_TakeFromNode(p,result2);
 resultelt:=p^;
lsps1:=loopholes.retype(resultelt.parameters.ls,LSPARAMS_precord);
MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;
lsps^.X483SUPERPAR:=PASTDEIXIS;
resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
p^:=resultelt;
HYPERDTREE_addtoNode(p,result1);
END;
END;
appendresults(31,result1,result);
 END;
 END{WITH};
                                                       END;
99 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=31;
 resultelt.R:=485;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=485;
 resultelt.parameters.rulenr:=485;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(31,result1,result);
 END;
 END{WITH};
                                                       END;
100 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=31;
 resultelt.R:=484;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=484;
 resultelt.parameters.rulenr:=484;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(31,result1,result);
 END;
 END{WITH};
                                                       END;
101 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=31;
 resultelt.R:=486;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=486;
 resultelt.parameters.rulenr:=486;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(31,result1,result);
 END;
 END{WITH};
                                                       END;
103 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=125;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=125;
 resultelt.parameters.rulenr:=125;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       END;
104 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=126;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=126;
 resultelt.parameters.rulenr:=126;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       END;
105 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=127;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=127;
 resultelt.parameters.rulenr:=127;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=128;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=128;
 resultelt.parameters.rulenr:=128;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       END;
106 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=130;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=130;
 resultelt.parameters.rulenr:=130;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=132;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=132;
 resultelt.parameters.rulenr:=132;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       END;
107 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=129;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=129;
 resultelt.parameters.rulenr:=129;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=131;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=131;
 resultelt.parameters.rulenr:=131;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       END;
108 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=461;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=461;
 resultelt.parameters.rulenr:=461;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       END;
110 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=462;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=462;
 resultelt.parameters.rulenr:=462;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=463;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=463;
 resultelt.parameters.rulenr:=463;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       END;
111 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=464;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=464;
 resultelt.parameters.rulenr:=464;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       END;
113 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=465;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=465;
 resultelt.parameters.rulenr:=465;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=466;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=466;
 resultelt.parameters.rulenr:=466;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       END;
114 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=133;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=133;
 resultelt.parameters.rulenr:=133;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       END;
115 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=467;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=467;
 resultelt.parameters.rulenr:=467;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       END;
116 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=468;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=468;
 resultelt.parameters.rulenr:=468;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       END;
117 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF (intequals15(X117CONTROLLERPAR)                        )                                                      THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=469;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=469;
 resultelt.parameters.rulenr:=469;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 lsps^.X469CONTROLLERPAR:=X1                                                    ;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       END;
123 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=458;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=458;
 resultelt.parameters.rulenr:=458;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=459;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=459;
 resultelt.parameters.rulenr:=459;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       END;
121 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=142;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=142;
 resultelt.parameters.rulenr:=142;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       END;
58 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=139;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=139;
 resultelt.parameters.rulenr:=139;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=140;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=140;
 resultelt.parameters.rulenr:=140;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=138;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=138;
 resultelt.parameters.rulenr:=138;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       END;
122 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=15;
 resultelt.R:=141;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=141;
 resultelt.parameters.rulenr:=141;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(15,result1,result);
 END;
 END{WITH};
                                                       END;
74 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=16;
 resultelt.R:=104;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=104;
 resultelt.parameters.rulenr:=104;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(16,result1,result);
 END;
 END{WITH};
                                                       END;
75 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=17;
 resultelt.R:=105;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=105;
 resultelt.parameters.rulenr:=105;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(17,result1,result);
 END;
 END{WITH};
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=17;
 resultelt.R:=106;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=106;
 resultelt.parameters.rulenr:=106;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(17,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=17;
 resultelt.R:=108;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=108;
 resultelt.parameters.rulenr:=108;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(17,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=17;
 resultelt.R:=109;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=109;
 resultelt.parameters.rulenr:=109;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(17,result1,result);
 END;
 END{WITH};
                                                       HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=17;
 resultelt.R:=110;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=110;
 resultelt.parameters.rulenr:=110;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(17,result1,result);
 END;
 END{WITH};
                                                       END;
129 :BEGIN
 HYPERDTREE_emptyNode(result1);
 WITH ps.params DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.bonus:=0;
 resultelt.sg:=17;
 resultelt.R:=111;
 MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));
 lsps^.rulenr:=111;
 resultelt.parameters.rulenr:=111;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=-1;
 resultelt.parameters.ls:=loopholes.retype(lsps,LDMRULES_lsparams);
 MEM_newdefault(loopholes.sizeof(HYPERDTREE_hypernodeelt),loopholes.retype(p,MEM_ptr));
 p^:=resultelt;
 HYPERDTREE_AddToNode(p,result1);
appendresults(17,result1,result);
 END;
 END{WITH};
                                                       END;
END;{CASE}
R:=R-254;
IF R >0 THEN IF R<=254 THEN
CASE R OF
0: BEGIN END;
END;{CASE}
R:=R-254;
IF R >0 THEN
CASE R OF
0: BEGIN END;
END;{CASE}
LDGENILRULES_RuleTransfer:=result;
END;
