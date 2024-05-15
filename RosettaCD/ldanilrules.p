
EXPORT(LDANILRULES);
pragma C_include('lsparams.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('ldanilrules.pf');
pragma C_include('hiltree.pf');
pragma C_include('liilrules.pf');
pragma C_include('ldmrules.pf');
PROGRAM LDANILRULES;

WITH lsparams,lsdomaint,hiltree,liilrules,ldmrules;
 FUNCTION LDAnIlrules_RuleTransFer(
 R:LDMrules_Ruleindex;ps:LDMrules_LiParameters):
 HILtree_SetOfHyperNodeElt;
 VAR resultelt:HILTREE_HyperNodeElt;
 p:HILTREE_pHyperNodeElt;
 result,result1,result2,helpresult1:HILTREE_SetOfHyperNodeElt;
 lsps:LSPARAMS_precord;
 lips:LIILRULES_ilparams;
 X1,X2,X3:INTEGER;
procedure appendresults(result1:HILTREE_SetOfHyperNodeElt;
 VAR result:HILTREE_SetOfHyperNodeElt);
VAR node:HILTREE_pHypernodeelt;listrec:HILTREE_LoHyperIltree;
BEGIN
IF HILTREE_Isemptynode(result) THEN result:=result1 ELSE BEGIN
WHILE NOT HILTREE_Isemptynode(result1) DO
 BEGIN
 HILTREE_Takefromnode(node,result1);
 HILTREE_Addtonode(node,result);
 END;
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
resultelt.nodeKind := Hiltree_RuleNode;
HILTREE_EmptyNode(result);
HILTREE_EmptyNode(result1);
IF R IN [0..254] THEN
CASE R OF
243 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=77;
 lips.rulenr:=77;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,77,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
242 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=166;
 lips.rulenr:=166;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,166,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
226 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=166;
 lips.rulenr:=166;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,166,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
233 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=166;
 lips.rulenr:=166;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,166,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
244 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=169;
 lips.rulenr:=169;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,169,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
239 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=33;
 lips.rulenr:=33;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,33,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
240 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=34;
 lips.rulenr:=34;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,34,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
241 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=35;
 lips.rulenr:=35;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,35,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
248 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=144;
 lips.rulenr:=144;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,144,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
251 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=144;
 lips.rulenr:=144;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,144,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
252 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=131;
 lips.rulenr:=131;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,131,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
253 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=131;
 lips.rulenr:=131;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,131,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
249 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=131;
 lips.rulenr:=131;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,131,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
250 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=131;
 lips.rulenr:=131;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,131,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
155 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=145;
 lips.rulenr:=145;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,145,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
134 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=145;
 lips.rulenr:=145;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,145,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
136 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=145;
 lips.rulenr:=145;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,145,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
122 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X122SUPER = PRESENTDEIXIS                             )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=145;
 lips.rulenr:=145;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,145,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X122SUPER = PASTDEIXIS                                )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=134;
 lips.rulenr:=134;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,134,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
112 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X112SUPER = PRESENTDEIXIS                             )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=145;
 lips.rulenr:=145;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,145,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X112SUPER = PASTDEIXIS                                )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=134;
 lips.rulenr:=134;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,134,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
156 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=134;
 lips.rulenr:=134;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,134,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
135 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=134;
 lips.rulenr:=134;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,134,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
137 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=134;
 lips.rulenr:=134;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,134,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
246 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=185;
 lips.rulenr:=185;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,185,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
247 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=185;
 lips.rulenr:=185;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,185,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
254 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=186;
 lips.rulenr:=186;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,186,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
235 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=5;
 lips.rulenr:=5;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,5,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
236 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=6;
 lips.rulenr:=6;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,6,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
107 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=44;
 lips.rulenr:=44;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,44,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
224 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=12;
 lips.rulenr:=12;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,12,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
221 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X221VOICEPAR = ACTIVE                                 )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=14;
 lips.rulenr:=14;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,14,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
223 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=76;
 lips.rulenr:=76;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,76,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
222 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X222VOICEPAR = PASSIVE                                )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=130;
 lips.rulenr:=130;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,130,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
81 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=41;
 lips.rulenr:=41;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,41,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
143 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=41;
 lips.rulenr:=41;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,41,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
147 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=41;
 lips.rulenr:=41;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,41,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
234 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=41;
 lips.rulenr:=41;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,41,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
53 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=45;
 lips.rulenr:=45;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,45,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
55 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=45;
 lips.rulenr:=45;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,45,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
63 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=45;
 lips.rulenr:=45;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,45,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
65 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=45;
 lips.rulenr:=45;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,45,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
59 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=45;
 lips.rulenr:=45;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,45,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
61 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=45;
 lips.rulenr:=45;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,45,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
57 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=45;
 lips.rulenr:=45;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,45,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
62 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=45;
 lips.rulenr:=45;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,45,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
58 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=128;
 lips.rulenr:=128;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,128,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
56 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=128;
 lips.rulenr:=128;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,128,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
64 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=128;
 lips.rulenr:=128;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,128,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
60 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=128;
 lips.rulenr:=128;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,128,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
52 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=128;
 lips.rulenr:=128;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,128,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
54 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=128;
 lips.rulenr:=128;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,128,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
45 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=46;
 lips.rulenr:=46;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,46,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
46 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=46;
 lips.rulenr:=46;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,46,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
47 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=46;
 lips.rulenr:=46;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,46,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
48 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=46;
 lips.rulenr:=46;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,46,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
49 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=46;
 lips.rulenr:=46;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,46,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
50 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=46;
 lips.rulenr:=46;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,46,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
51 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=46;
 lips.rulenr:=46;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,46,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
44 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=78;
 lips.rulenr:=78;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,78,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
34 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=78;
 lips.rulenr:=78;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,78,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
35 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=78;
 lips.rulenr:=78;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,78,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
36 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=78;
 lips.rulenr:=78;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,78,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
37 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=78;
 lips.rulenr:=78;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,78,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
39 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=78;
 lips.rulenr:=78;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,78,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
40 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=78;
 lips.rulenr:=78;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,78,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
41 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=78;
 lips.rulenr:=78;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,78,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
43 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=78;
 lips.rulenr:=78;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,78,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
33 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=135;
 lips.rulenr:=135;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,135,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
26 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=71;
 lips.rulenr:=71;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,71,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
28 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=200;
 lips.rulenr:=200;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,200,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
29 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=203;
 lips.rulenr:=203;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,203,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
31 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=201;
 lips.rulenr:=201;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,201,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
27 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=72;
 lips.rulenr:=72;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,72,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
30 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=204;
 lips.rulenr:=204;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,204,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
32 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=187;
 lips.rulenr:=187;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,187,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
171 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=127;
 lips.rulenr:=127;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,127,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
170 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=50;
 lips.rulenr:=50;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,50,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
172 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=148;
 lips.rulenr:=148;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,148,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
227 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=84;
 lips.rulenr:=84;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,84,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
228 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=84;
 lips.rulenr:=84;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,84,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
229 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=85;
 lips.rulenr:=85;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,85,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
230 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=86;
 lips.rulenr:=86;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,86,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
231 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=87;
 lips.rulenr:=87;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,87,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
232 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=87;
 lips.rulenr:=87;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,87,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
82 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=29;
 lips.rulenr:=29;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,29,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
237 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=27;
 lips.rulenr:=27;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,27,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
238 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=28;
 lips.rulenr:=28;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,28,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
83 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=173;
 lips.rulenr:=173;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,173,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
68 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=173;
 lips.rulenr:=173;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,173,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
84 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=174;
 lips.rulenr:=174;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,174,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
70 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=174;
 lips.rulenr:=174;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,174,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
71 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=174;
 lips.rulenr:=174;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,174,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
69 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=174;
 lips.rulenr:=174;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,174,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
85 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=175;
 lips.rulenr:=175;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,175,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
87 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=175;
 lips.rulenr:=175;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,175,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
73 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=175;
 lips.rulenr:=175;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,175,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
72 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=175;
 lips.rulenr:=175;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,175,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
86 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=176;
 lips.rulenr:=176;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,176,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
74 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=176;
 lips.rulenr:=176;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,176,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
225 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=181;
 lips.rulenr:=181;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,181,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
66 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=171;
 lips.rulenr:=171;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,171,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
67 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=172;
 lips.rulenr:=172;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,172,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
10 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
11 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
12 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
9 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
14 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=31;
 lips.rulenr:=31;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,31,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
15 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=31;
 lips.rulenr:=31;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,31,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
16 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=31;
 lips.rulenr:=31;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,31,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
17 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=31;
 lips.rulenr:=31;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,31,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
18 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=31;
 lips.rulenr:=31;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,31,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
19 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=31;
 lips.rulenr:=31;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,31,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
20 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=31;
 lips.rulenr:=31;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,31,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
21 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=147;
 lips.rulenr:=147;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,147,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
22 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=136;
 lips.rulenr:=136;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,136,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
23 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=95;
 lips.rulenr:=95;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,95,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
24 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=95;
 lips.rulenr:=95;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,95,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
25 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=95;
 lips.rulenr:=95;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,95,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
213 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=170;
 lips.rulenr:=170;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,170,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
214 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=170;
 lips.rulenr:=170;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,170,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
211 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=170;
 lips.rulenr:=170;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,170,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
212 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=170;
 lips.rulenr:=170;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,170,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
215 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=170;
 lips.rulenr:=170;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,170,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
216 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=170;
 lips.rulenr:=170;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,170,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
219 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=170;
 lips.rulenr:=170;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,170,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
220 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=170;
 lips.rulenr:=170;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,170,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
217 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=170;
 lips.rulenr:=170;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,170,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
218 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=170;
 lips.rulenr:=170;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,170,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
91 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=170;
 lips.rulenr:=170;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,170,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
90 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=170;
 lips.rulenr:=170;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,170,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
177 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=170;
 lips.rulenr:=170;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,170,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
178 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=170;
 lips.rulenr:=170;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,170,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
193 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=70;
 lips.rulenr:=70;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,70,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
194 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=70;
 lips.rulenr:=70;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,70,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
195 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=70;
 lips.rulenr:=70;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,70,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
196 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=70;
 lips.rulenr:=70;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,70,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
197 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=70;
 lips.rulenr:=70;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,70,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
198 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=70;
 lips.rulenr:=70;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,70,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
199 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=70;
 lips.rulenr:=70;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,70,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
200 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=70;
 lips.rulenr:=70;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,70,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
201 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=70;
 lips.rulenr:=70;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,70,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
202 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=70;
 lips.rulenr:=70;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,70,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
203 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=70;
 lips.rulenr:=70;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,70,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
204 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=70;
 lips.rulenr:=70;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,70,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
205 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=70;
 lips.rulenr:=70;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,70,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
206 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=70;
 lips.rulenr:=70;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,70,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
207 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=70;
 lips.rulenr:=70;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,70,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
208 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=70;
 lips.rulenr:=70;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,70,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
209 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=70;
 lips.rulenr:=70;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,70,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
210 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=70;
 lips.rulenr:=70;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,70,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
182 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=70;
 lips.rulenr:=70;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,70,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
181 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=70;
 lips.rulenr:=70;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,70,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
180 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=70;
 lips.rulenr:=70;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,70,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
179 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=199;
 lips.rulenr:=199;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,199,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
2 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=191;
 lips.rulenr:=191;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,191,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
4 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=192;
 lips.rulenr:=192;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,192,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
5 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=192;
 lips.rulenr:=192;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,192,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
3 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X3CASESPAR = [NOMINATIVE]                                          )                                                     
 THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=193;
 lips.rulenr:=193;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,193,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X3CASESPAR = [DATIVE]                                              )                                                     
 THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=195;
 lips.rulenr:=195;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,195,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                      lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X3CASESPAR = [ACCUSATIVE]                                          )                                                     
 THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=194;
 lips.rulenr:=194;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,194,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
7 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=196;
 lips.rulenr:=196;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,196,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
8 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=197;
 lips.rulenr:=197;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,197,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
175 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=94;
 lips.rulenr:=94;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,94,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
176 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=94;
 lips.rulenr:=94;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,94,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
183 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=94;
 lips.rulenr:=94;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,94,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
186 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=94;
 lips.rulenr:=94;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,94,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
184 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=94;
 lips.rulenr:=94;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,94,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
187 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=94;
 lips.rulenr:=94;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,94,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
185 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=94;
 lips.rulenr:=94;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,94,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
188 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=94;
 lips.rulenr:=94;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,94,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
189 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=94;
 lips.rulenr:=94;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,94,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
190 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=94;
 lips.rulenr:=94;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,94,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
191 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=94;
 lips.rulenr:=94;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,94,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
192 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=94;
 lips.rulenr:=94;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,94,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
88 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=94;
 lips.rulenr:=94;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,94,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
89 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=94;
 lips.rulenr:=94;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,94,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
75 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=30;
 lips.rulenr:=30;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,30,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
76 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=24;
 lips.rulenr:=24;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,24,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
77 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=25;
 lips.rulenr:=25;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,25,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
78 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=18;
 lips.rulenr:=18;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,18,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
79 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=18;
 lips.rulenr:=18;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,18,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
80 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=18;
 lips.rulenr:=18;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,18,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
93 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=14;
 lips.rulenr:=14;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,14,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
94 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=45;
 lips.rulenr:=45;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,45,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
95 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=45;
 lips.rulenr:=45;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,45,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
96 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=45;
 lips.rulenr:=45;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,45,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
97 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=45;
 lips.rulenr:=45;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,45,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
98 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=45;
 lips.rulenr:=45;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,45,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
99 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=46;
 lips.rulenr:=46;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,46,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
100 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=78;
 lips.rulenr:=78;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,78,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
101 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=78;
 lips.rulenr:=78;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,78,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
102 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=78;
 lips.rulenr:=78;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,78,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
103 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=78;
 lips.rulenr:=78;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,78,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
166 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
167 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
168 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
169 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=31;
 lips.rulenr:=31;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,31,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
174 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=23;
 lips.rulenr:=23;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,23,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
173 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=22;
 lips.rulenr:=22;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,22,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
115 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=163;
 lips.rulenr:=163;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,163,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
116 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=163;
 lips.rulenr:=163;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,163,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
121 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=159;
 lips.rulenr:=159;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,159,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
114 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=158;
 lips.rulenr:=158;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,158,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
120 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=158;
 lips.rulenr:=158;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,158,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
124 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=162;
 lips.rulenr:=162;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,162,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
117 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=155;
 lips.rulenr:=155;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,155,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
118 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=156;
 lips.rulenr:=156;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,156,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
113 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=153;
 lips.rulenr:=153;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,153,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
119 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=157;
 lips.rulenr:=157;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,157,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
123 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=161;
 lips.rulenr:=161;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,161,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
149 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=38;
 lips.rulenr:=38;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,38,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
148 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=38;
 lips.rulenr:=38;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,38,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
150 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=38;
 lips.rulenr:=38;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,38,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
146 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=39;
 lips.rulenr:=39;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,39,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
144 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=182;
 lips.rulenr:=182;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,182,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
145 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=183;
 lips.rulenr:=183;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,183,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
helpresult1:=result1;
HILTREE_emptyNode(result1);
 IF X145NUMBERPAR=SINGULAR THEN BEGIN
result2:=helpresult1;
WHILE NOT(HILTREE_IsEmptyNode(result2)) DO
 BEGIN
 HILTREE_TakeFromNode(p,result2);
 HILTREE_LoadHypernodeelt(p,resultelt);
lips:=resultelt.parameters.params;
lips.X183NUMBERPAR:=ILSINGULAR;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,183,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
HILTREE_addtoNode(p,result1);
 END;
END;
 IF X145NUMBERPAR=PLURAL THEN BEGIN
result2:=helpresult1;
WHILE NOT(HILTREE_IsEmptyNode(result2)) DO
 BEGIN
 HILTREE_TakeFromNode(p,result2);
 HILTREE_LoadHypernodeelt(p,resultelt);
lips:=resultelt.parameters.params;
lips.X183NUMBERPAR:=ILPLURAL;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,183,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
HILTREE_addtoNode(p,result1);
 END;
END;
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
151 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=51;
 lips.rulenr:=51;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,51,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
153 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=52;
 lips.rulenr:=52;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,52,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
152 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=53;
 lips.rulenr:=53;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,53,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
154 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=53;
 lips.rulenr:=53;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,53,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
164 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=59;
 lips.rulenr:=59;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,59,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
157 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=59;
 lips.rulenr:=59;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,59,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
162 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=59;
 lips.rulenr:=59;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,59,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
163 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=61;
 lips.rulenr:=61;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,61,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
158 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=62;
 lips.rulenr:=62;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,62,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
159 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=63;
 lips.rulenr:=63;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,63,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
160 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=63;
 lips.rulenr:=63;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,63,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
161 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=63;
 lips.rulenr:=63;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,63,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
165 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=64;
 lips.rulenr:=64;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,64,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
125 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=103;
 lips.rulenr:=103;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,103,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
126 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=104;
 lips.rulenr:=104;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,104,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
127 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=105;
 lips.rulenr:=105;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,105,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
128 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=105;
 lips.rulenr:=105;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,105,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
130 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=106;
 lips.rulenr:=106;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,106,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
132 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=106;
 lips.rulenr:=106;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,106,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
129 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=107;
 lips.rulenr:=107;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,107,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
131 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=107;
 lips.rulenr:=107;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,107,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
133 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=114;
 lips.rulenr:=114;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,114,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
142 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=121;
 lips.rulenr:=121;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,121,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
139 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=58;
 lips.rulenr:=58;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,58,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
140 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=58;
 lips.rulenr:=58;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,58,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
138 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=58;
 lips.rulenr:=58;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,58,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
141 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=122;
 lips.rulenr:=122;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,122,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
104 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=74;
 lips.rulenr:=74;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,74,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
105 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=75;
 lips.rulenr:=75;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,75,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
106 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=75;
 lips.rulenr:=75;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,75,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
108 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=75;
 lips.rulenr:=75;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,75,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
109 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=75;
 lips.rulenr:=75;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,75,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
110 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=75;
 lips.rulenr:=75;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,75,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
111 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=129;
 lips.rulenr:=129;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,129,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
END;{CASE}
R:=R-254;
IF R >0 THEN IF R<=254 THEN
CASE R OF
0: BEGIN END;
58 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=77;
 lips.rulenr:=77;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,77,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
42 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=77;
 lips.rulenr:=77;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,77,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
143 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=166;
 lips.rulenr:=166;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,166,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
41 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=166;
 lips.rulenr:=166;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,166,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
57 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=166;
 lips.rulenr:=166;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,166,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
254 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=166;
 lips.rulenr:=166;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,166,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
59 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=169;
 lips.rulenr:=169;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,169,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
43 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=169;
 lips.rulenr:=169;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,169,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
44 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=33;
 lips.rulenr:=33;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,33,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
146 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=33;
 lips.rulenr:=33;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,33,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
64 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=33;
 lips.rulenr:=33;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,33,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
34 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=168;
 lips.rulenr:=168;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,168,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
35 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=168;
 lips.rulenr:=168;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,168,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
21 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=92;
 lips.rulenr:=92;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,92,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
39 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=93;
 lips.rulenr:=93;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,93,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
18 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=144;
 lips.rulenr:=144;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,144,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
22 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=144;
 lips.rulenr:=144;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,144,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
23 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=131;
 lips.rulenr:=131;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,131,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
19 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=131;
 lips.rulenr:=131;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,131,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
27 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=145;
 lips.rulenr:=145;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,145,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
30 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=145;
 lips.rulenr:=145;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,145,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
24 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=145;
 lips.rulenr:=145;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,145,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
36 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=145;
 lips.rulenr:=145;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,145,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
50 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=145;
 lips.rulenr:=145;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,145,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
147 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X401SUPER = PRESENTDEIXIS                             )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=145;
 lips.rulenr:=145;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,145,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X401SUPER = PASTDEIXIS                                )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=134;
 lips.rulenr:=134;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,134,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
65 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X319SUPER = PRESENTDEIXIS                             )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=145;
 lips.rulenr:=145;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,145,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X319SUPER = PASTDEIXIS                                )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=134;
 lips.rulenr:=134;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,134,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
108 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X362SUPER = PRESENTDEIXIS                             )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=145;
 lips.rulenr:=145;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,145,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X362SUPER = PASTDEIXIS                                )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=134;
 lips.rulenr:=134;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,134,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
138 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X392SUPER = PRESENTDEIXIS                             )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=145;
 lips.rulenr:=145;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,145,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X392SUPER = PASTDEIXIS                                )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=134;
 lips.rulenr:=134;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,134,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
28 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=134;
 lips.rulenr:=134;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,134,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
31 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=134;
 lips.rulenr:=134;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,134,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
25 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=134;
 lips.rulenr:=134;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,134,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
37 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=134;
 lips.rulenr:=134;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,134,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
51 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=134;
 lips.rulenr:=134;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,134,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
29 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=133;
 lips.rulenr:=133;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,133,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
33 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=133;
 lips.rulenr:=133;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,133,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
32 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=133;
 lips.rulenr:=133;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,133,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
26 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=133;
 lips.rulenr:=133;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,133,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
40 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=133;
 lips.rulenr:=133;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,133,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
38 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=133;
 lips.rulenr:=133;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,133,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
20 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=88;
 lips.rulenr:=88;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,88,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
12 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=185;
 lips.rulenr:=185;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,185,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
157 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=7;
 lips.rulenr:=7;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,7,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
240 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=8;
 lips.rulenr:=8;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X8CATPAR:=ILPP                                                  ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,8,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
241 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=8;
 lips.rulenr:=8;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X8CATPAR:=ILADVP                                                ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,8,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
238 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=8;
 lips.rulenr:=8;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X8CATPAR:=ILOPPP                                                ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,8,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
236 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=8;
 lips.rulenr:=8;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X8CATPAR:=ILOADVPP                                              ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,8,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
233 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=8;
 lips.rulenr:=8;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X8CATPAR:=ILOADJPP                                              ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,8,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
242 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=8;
 lips.rulenr:=8;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X8CATPAR:=ILNP                                                  ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,8,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
237 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=8;
 lips.rulenr:=8;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X8CATPAR:=ILCADVPP                                              ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,8,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
235 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=8;
 lips.rulenr:=8;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X8CATPAR:=ILADJPP                                               ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,8,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
234 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=8;
 lips.rulenr:=8;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X8CATPAR:=ILCADJPP                                              ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,8,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
245 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=8;
 lips.rulenr:=8;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X8CATPAR:=ILSENTENCE                                            ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,8,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
243 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=11;
 lips.rulenr:=11;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X11CATPAR:=ILPP                                                  ;
 lips.X11KOMMAPAR:=YES                                                   ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,11,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
244 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=11;
 lips.rulenr:=11;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X11CATPAR:=ILPP                                                  ;
 lips.X11KOMMAPAR:=NO                                                    ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,11,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
246 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=11;
 lips.rulenr:=11;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X11CATPAR:=ILSENTENCE                                            ;
 lips.X11KOMMAPAR:=YES                                                   ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,11,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
247 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=9;
 lips.rulenr:=9;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X9CATPAR:=ILPP                                                  ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,9,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
248 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=9;
 lips.rulenr:=9;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X9CATPAR:=ILOADJPP                                              ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,9,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
249 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=9;
 lips.rulenr:=9;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X9CATPAR:=ILCADJPP                                              ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,9,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
250 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=9;
 lips.rulenr:=9;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X9CATPAR:=ILADJPP                                               ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,9,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
251 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=9;
 lips.rulenr:=9;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X9CATPAR:=ILOADVPP                                              ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,9,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
252 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=9;
 lips.rulenr:=9;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X9CATPAR:=ILNP                                                  ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,9,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
94 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=1;
 lips.rulenr:=1;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,1,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
helpresult1:=result1;
HILTREE_emptyNode(result1);
 IF X348ADJUNCTPAR=RESAP THEN BEGIN
result2:=helpresult1;
WHILE NOT(HILTREE_IsEmptyNode(result2)) DO
 BEGIN
 HILTREE_TakeFromNode(p,result2);
 HILTREE_LoadHypernodeelt(p,resultelt);
lips:=resultelt.parameters.params;
lips.X1ADJUNCTPAR:=ILRESAP;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,1,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
HILTREE_addtoNode(p,result1);
 END;
END;
 IF X348ADJUNCTPAR=RESPP THEN BEGIN
result2:=helpresult1;
WHILE NOT(HILTREE_IsEmptyNode(result2)) DO
 BEGIN
 HILTREE_TakeFromNode(p,result2);
 HILTREE_LoadHypernodeelt(p,resultelt);
lips:=resultelt.parameters.params;
lips.X1ADJUNCTPAR:=ILRESPP;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,1,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
HILTREE_addtoNode(p,result1);
 END;
END;
 IF X348ADJUNCTPAR=SUBJCOMIT THEN BEGIN
result2:=helpresult1;
WHILE NOT(HILTREE_IsEmptyNode(result2)) DO
 BEGIN
 HILTREE_TakeFromNode(p,result2);
 HILTREE_LoadHypernodeelt(p,resultelt);
lips:=resultelt.parameters.params;
lips.X1ADJUNCTPAR:=ILCOMIT;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,1,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
HILTREE_addtoNode(p,result1);
 END;
END;
 IF X348ADJUNCTPAR=OBJCOMIT THEN BEGIN
result2:=helpresult1;
WHILE NOT(HILTREE_IsEmptyNode(result2)) DO
 BEGIN
 HILTREE_TakeFromNode(p,result2);
 HILTREE_LoadHypernodeelt(p,resultelt);
lips:=resultelt.parameters.params;
lips.X1ADJUNCTPAR:=ILCOMIT;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,1,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
HILTREE_addtoNode(p,result1);
 END;
END;
 IF X348ADJUNCTPAR=BENFACTNP THEN BEGIN
result2:=helpresult1;
WHILE NOT(HILTREE_IsEmptyNode(result2)) DO
 BEGIN
 HILTREE_TakeFromNode(p,result2);
 HILTREE_LoadHypernodeelt(p,resultelt);
lips:=resultelt.parameters.params;
lips.X1ADJUNCTPAR:=ILBENFACTNP;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,1,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
HILTREE_addtoNode(p,result1);
 END;
END;
 IF X348ADJUNCTPAR=BENFACTPP THEN BEGIN
result2:=helpresult1;
WHILE NOT(HILTREE_IsEmptyNode(result2)) DO
 BEGIN
 HILTREE_TakeFromNode(p,result2);
 HILTREE_LoadHypernodeelt(p,resultelt);
lips:=resultelt.parameters.params;
lips.X1ADJUNCTPAR:=ILBENFACTPP;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,1,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
HILTREE_addtoNode(p,result1);
 END;
END;
 IF X348ADJUNCTPAR=LOCADJUNCT THEN BEGIN
result2:=helpresult1;
WHILE NOT(HILTREE_IsEmptyNode(result2)) DO
 BEGIN
 HILTREE_TakeFromNode(p,result2);
 HILTREE_LoadHypernodeelt(p,resultelt);
lips:=resultelt.parameters.params;
lips.X1ADJUNCTPAR:=ILLOCADJUNCT;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,1,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
HILTREE_addtoNode(p,result1);
 END;
END;
 IF X348ADJUNCTPAR=DIRADJUNCT THEN BEGIN
result2:=helpresult1;
WHILE NOT(HILTREE_IsEmptyNode(result2)) DO
 BEGIN
 HILTREE_TakeFromNode(p,result2);
 HILTREE_LoadHypernodeelt(p,resultelt);
lips:=resultelt.parameters.params;
lips.X1ADJUNCTPAR:=ILDIRADJUNCT;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,1,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
HILTREE_addtoNode(p,result1);
 END;
END;
 IF X348ADJUNCTPAR=RESNP THEN BEGIN
result2:=helpresult1;
WHILE NOT(HILTREE_IsEmptyNode(result2)) DO
 BEGIN
 HILTREE_TakeFromNode(p,result2);
 HILTREE_LoadHypernodeelt(p,resultelt);
lips:=resultelt.parameters.params;
lips.X1ADJUNCTPAR:=ILRESNP;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,1,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
HILTREE_addtoNode(p,result1);
 END;
END;
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
95 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=2;
 lips.rulenr:=2;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,2,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
helpresult1:=result1;
HILTREE_emptyNode(result1);
 IF X349ADJUNCTPAR=RESAP THEN BEGIN
result2:=helpresult1;
WHILE NOT(HILTREE_IsEmptyNode(result2)) DO
 BEGIN
 HILTREE_TakeFromNode(p,result2);
 HILTREE_LoadHypernodeelt(p,resultelt);
lips:=resultelt.parameters.params;
lips.X2ADJUNCTPAR:=ILRESAP;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,2,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
HILTREE_addtoNode(p,result1);
 END;
END;
 IF X349ADJUNCTPAR=RESPP THEN BEGIN
result2:=helpresult1;
WHILE NOT(HILTREE_IsEmptyNode(result2)) DO
 BEGIN
 HILTREE_TakeFromNode(p,result2);
 HILTREE_LoadHypernodeelt(p,resultelt);
lips:=resultelt.parameters.params;
lips.X2ADJUNCTPAR:=ILRESPP;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,2,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
HILTREE_addtoNode(p,result1);
 END;
END;
 IF X349ADJUNCTPAR=SUBJCOMIT THEN BEGIN
result2:=helpresult1;
WHILE NOT(HILTREE_IsEmptyNode(result2)) DO
 BEGIN
 HILTREE_TakeFromNode(p,result2);
 HILTREE_LoadHypernodeelt(p,resultelt);
lips:=resultelt.parameters.params;
lips.X2ADJUNCTPAR:=ILCOMIT;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,2,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
HILTREE_addtoNode(p,result1);
 END;
END;
 IF X349ADJUNCTPAR=OBJCOMIT THEN BEGIN
result2:=helpresult1;
WHILE NOT(HILTREE_IsEmptyNode(result2)) DO
 BEGIN
 HILTREE_TakeFromNode(p,result2);
 HILTREE_LoadHypernodeelt(p,resultelt);
lips:=resultelt.parameters.params;
lips.X2ADJUNCTPAR:=ILCOMIT;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,2,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
HILTREE_addtoNode(p,result1);
 END;
END;
 IF X349ADJUNCTPAR=BENFACTNP THEN BEGIN
result2:=helpresult1;
WHILE NOT(HILTREE_IsEmptyNode(result2)) DO
 BEGIN
 HILTREE_TakeFromNode(p,result2);
 HILTREE_LoadHypernodeelt(p,resultelt);
lips:=resultelt.parameters.params;
lips.X2ADJUNCTPAR:=ILBENFACTNP;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,2,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
HILTREE_addtoNode(p,result1);
 END;
END;
 IF X349ADJUNCTPAR=BENFACTPP THEN BEGIN
result2:=helpresult1;
WHILE NOT(HILTREE_IsEmptyNode(result2)) DO
 BEGIN
 HILTREE_TakeFromNode(p,result2);
 HILTREE_LoadHypernodeelt(p,resultelt);
lips:=resultelt.parameters.params;
lips.X2ADJUNCTPAR:=ILBENFACTPP;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,2,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
HILTREE_addtoNode(p,result1);
 END;
END;
 IF X349ADJUNCTPAR=LOCADJUNCT THEN BEGIN
result2:=helpresult1;
WHILE NOT(HILTREE_IsEmptyNode(result2)) DO
 BEGIN
 HILTREE_TakeFromNode(p,result2);
 HILTREE_LoadHypernodeelt(p,resultelt);
lips:=resultelt.parameters.params;
lips.X2ADJUNCTPAR:=ILLOCADJUNCT;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,2,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
HILTREE_addtoNode(p,result1);
 END;
END;
 IF X349ADJUNCTPAR=DIRADJUNCT THEN BEGIN
result2:=helpresult1;
WHILE NOT(HILTREE_IsEmptyNode(result2)) DO
 BEGIN
 HILTREE_TakeFromNode(p,result2);
 HILTREE_LoadHypernodeelt(p,resultelt);
lips:=resultelt.parameters.params;
lips.X2ADJUNCTPAR:=ILDIRADJUNCT;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,2,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
HILTREE_addtoNode(p,result1);
 END;
END;
 IF X349ADJUNCTPAR=RESNP THEN BEGIN
result2:=helpresult1;
WHILE NOT(HILTREE_IsEmptyNode(result2)) DO
 BEGIN
 HILTREE_TakeFromNode(p,result2);
 HILTREE_LoadHypernodeelt(p,resultelt);
lips:=resultelt.parameters.params;
lips.X2ADJUNCTPAR:=ILRESNP;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,2,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
HILTREE_addtoNode(p,result1);
 END;
END;
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
96 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=3;
 lips.rulenr:=3;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,3,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
227 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=42;
 lips.rulenr:=42;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,42,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
228 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=43;
 lips.rulenr:=43;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,43,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
206 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=109;
 lips.rulenr:=109;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,109,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
60 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=14;
 lips.rulenr:=14;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,14,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
144 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=14;
 lips.rulenr:=14;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,14,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
125 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=41;
 lips.rulenr:=41;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,41,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
126 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=41;
 lips.rulenr:=41;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,41,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
53 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=41;
 lips.rulenr:=41;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,41,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
5 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=45;
 lips.rulenr:=45;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,45,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
7 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=45;
 lips.rulenr:=45;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,45,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
1 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=45;
 lips.rulenr:=45;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,45,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
2 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=45;
 lips.rulenr:=45;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,45,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
3 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=45;
 lips.rulenr:=45;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,45,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
10 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=45;
 lips.rulenr:=45;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,45,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
8 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=45;
 lips.rulenr:=45;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,45,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
14 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=45;
 lips.rulenr:=45;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,45,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
9 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=45;
 lips.rulenr:=45;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,45,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
11 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=146;
 lips.rulenr:=146;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,146,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
4 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=128;
 lips.rulenr:=128;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,128,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
6 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=128;
 lips.rulenr:=128;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,128,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
145 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=46;
 lips.rulenr:=46;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,46,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
63 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=46;
 lips.rulenr:=46;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,46,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
80 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=89;
 lips.rulenr:=89;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,89,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
81 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=89;
 lips.rulenr:=89;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,89,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
82 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=89;
 lips.rulenr:=89;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,89,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
83 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=90;
 lips.rulenr:=90;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,90,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
84 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=90;
 lips.rulenr:=90;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,90,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
85 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=90;
 lips.rulenr:=90;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,90,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
93 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X347GELIEVEPAR = GELIEVE                              )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=73;
 lips.rulenr:=73;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,73,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X347GELIEVEPAR = UGELIEVE                             )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=73;
 lips.rulenr:=73;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,73,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
86 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=15;
 lips.rulenr:=15;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,15,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
90 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=47;
 lips.rulenr:=47;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,47,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
79 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=47;
 lips.rulenr:=47;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,47,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
88 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=124;
 lips.rulenr:=124;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,124,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
76 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=79;
 lips.rulenr:=79;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,79,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
77 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=80;
 lips.rulenr:=80;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,80,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
89 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=91;
 lips.rulenr:=91;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,91,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
78 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=124;
 lips.rulenr:=124;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,124,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
91 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=132;
 lips.rulenr:=132;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,132,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
87 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=143;
 lips.rulenr:=143;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,143,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
66 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=127;
 lips.rulenr:=127;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,127,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
149 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=127;
 lips.rulenr:=127;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,127,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
92 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=49;
 lips.rulenr:=49;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,49,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
67 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=50;
 lips.rulenr:=50;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,50,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
150 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=50;
 lips.rulenr:=50;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,50,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
61 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=142;
 lips.rulenr:=142;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,142,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
62 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=141;
 lips.rulenr:=141;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,141,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
99 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=140;
 lips.rulenr:=140;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,140,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
100 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=139;
 lips.rulenr:=139;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,139,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
159 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=65;
 lips.rulenr:=65;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,65,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
160 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=65;
 lips.rulenr:=65;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,65,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
161 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=65;
 lips.rulenr:=65;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,65,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
162 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=65;
 lips.rulenr:=65;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,65,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
164 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=65;
 lips.rulenr:=65;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,65,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
163 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=65;
 lips.rulenr:=65;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,65,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
75 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=148;
 lips.rulenr:=148;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,148,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
151 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=148;
 lips.rulenr:=148;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,148,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
153 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=148;
 lips.rulenr:=148;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,148,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
154 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=151;
 lips.rulenr:=151;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,151,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
155 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=150;
 lips.rulenr:=150;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,150,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
156 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=149;
 lips.rulenr:=149;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,149,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
158 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (intequals1(X412ANTECEDENT)                            )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=164;
 lips.rulenr:=164;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X164ANTECEDENT:=X1                                                    ;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,164,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (intequals1(X412ANTECEDENT)                            )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=165;
 lips.rulenr:=165;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X165ANTECEDENT:=X1                                                    ;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,165,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
169 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (intequals4(X423INDEXPAR)                              ) AND (
X423XPMOODPAR = RELATIVEXPMOOD                        )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=167;
 lips.rulenr:=167;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X167INDEXPAR:=X1                                                    ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,167,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (intequals9(X423INDEXPAR)                              ) AND (
X423XPMOODPAR = TOPICXPMOOD                           )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=189;
 lips.rulenr:=189;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X189INDEXPAR:=X1                                                    ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,189,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
170 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (intequals5(X424INDEXPAR)                              ) AND (
X424XPMOODPAR = RELATIVEXPMOOD                        )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=167;
 lips.rulenr:=167;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X167INDEXPAR:=X1                                                    ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,167,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (intequals10(X424INDEXPAR)                             ) AND (
X424XPMOODPAR = TOPICXPMOOD                           )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=189;
 lips.rulenr:=189;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X189INDEXPAR:=X1                                                    ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,189,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
171 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (intequals6(X425INDEXPAR)                              ) AND (
X425XPMOODPAR = RELATIVEXPMOOD                        )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=167;
 lips.rulenr:=167;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X167INDEXPAR:=X1                                                    ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,167,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (intequals11(X425INDEXPAR)                             ) AND (
X425XPMOODPAR = TOPICXPMOOD                           )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=189;
 lips.rulenr:=189;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X189INDEXPAR:=X1                                                    ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,189,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
172 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (intequals7(X426INDEXPAR)                              ) AND (
X426XPMOODPAR = RELATIVEXPMOOD                        )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=167;
 lips.rulenr:=167;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X167INDEXPAR:=X1                                                    ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,167,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (intequals12(X426INDEXPAR)                             ) AND (
X426XPMOODPAR = TOPICXPMOOD                           )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=189;
 lips.rulenr:=189;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X189INDEXPAR:=X1                                                    ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,189,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
253 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=177;
 lips.rulenr:=177;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,177,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
127 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=26;
 lips.rulenr:=26;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,26,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
128 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=179;
 lips.rulenr:=179;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,179,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
129 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=180;
 lips.rulenr:=180;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,180,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
98 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=180;
 lips.rulenr:=180;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,180,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
177 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=180;
 lips.rulenr:=180;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,180,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
180 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=180;
 lips.rulenr:=180;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,180,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
178 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=180;
 lips.rulenr:=180;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,180,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
179 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=180;
 lips.rulenr:=180;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,180,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
54 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=173;
 lips.rulenr:=173;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,173,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
181 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=174;
 lips.rulenr:=174;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,174,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
182 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=174;
 lips.rulenr:=174;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,174,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
185 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=174;
 lips.rulenr:=174;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,174,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
186 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=174;
 lips.rulenr:=174;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,174,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
222 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=174;
 lips.rulenr:=174;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,174,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
55 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=174;
 lips.rulenr:=174;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,174,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
140 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=174;
 lips.rulenr:=174;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,174,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
141 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=174;
 lips.rulenr:=174;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,174,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
56 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=175;
 lips.rulenr:=175;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,175,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
142 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=175;
 lips.rulenr:=175;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,175,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
187 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=175;
 lips.rulenr:=175;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,175,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
225 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=175;
 lips.rulenr:=175;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,175,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
189 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=175;
 lips.rulenr:=175;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,175,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
190 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=175;
 lips.rulenr:=175;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,175,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
226 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=175;
 lips.rulenr:=175;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,175,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
173 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=175;
 lips.rulenr:=175;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,175,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
224 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=175;
 lips.rulenr:=175;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,175,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
175 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=175;
 lips.rulenr:=175;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,175,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
176 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=175;
 lips.rulenr:=175;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,175,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
188 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=176;
 lips.rulenr:=176;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,176,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
191 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=176;
 lips.rulenr:=176;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,176,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
192 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=176;
 lips.rulenr:=176;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,176,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
68 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
70 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
116 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
117 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
118 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
110 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
111 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
112 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
113 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
114 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
119 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
120 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
122 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
121 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
69 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
71 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
115 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=31;
 lips.rulenr:=31;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,31,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
72 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=31;
 lips.rulenr:=31;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,31,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
73 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=31;
 lips.rulenr:=31;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,31,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
124 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=147;
 lips.rulenr:=147;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,147,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
123 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=147;
 lips.rulenr:=147;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,147,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
165 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=138;
 lips.rulenr:=138;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,138,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
166 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=96;
 lips.rulenr:=96;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,96,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
167 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X421RELPAR = OBJREL                                   )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=96;
 lips.rulenr:=96;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,96,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X421RELPAR = INDOBJREL                                )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=96;
 lips.rulenr:=96;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,96,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                      lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X421RELPAR = PREPOBJREL                               )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=96;
 lips.rulenr:=96;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,96,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                      lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X421RELPAR = PREDREL                                  )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=96;
 lips.rulenr:=96;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,96,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                      lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X421RELPAR = LOCARGREL                                )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=96;
 lips.rulenr:=96;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,96,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                      lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X421RELPAR = DIRARGREL                                )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=96;
 lips.rulenr:=96;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,96,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                      lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X421RELPAR = VPADVREL                                 )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=96;
 lips.rulenr:=96;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,96,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                      lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X421RELPAR = AGVPADVREL                               )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=96;
 lips.rulenr:=96;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,96,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                      lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X421RELPAR = BYOBJREL                                 )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=96;
 lips.rulenr:=96;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,96,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
168 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X422RELPAR = TEMPADVREL                               )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=96;
 lips.rulenr:=96;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,96,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X422RELPAR = PREADVREL                                )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=96;
 lips.rulenr:=96;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,96,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                      lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X422RELPAR = POSTSUBJREL                              )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=96;
 lips.rulenr:=96;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,96,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                      lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X422RELPAR = LOCADVREL                                )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=96;
 lips.rulenr:=96;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,96,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                      lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X422RELPAR = ERPOSREL                                 )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=96;
 lips.rulenr:=96;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,96,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                      lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X422RELPAR = SUBJREL                                  )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=96;
 lips.rulenr:=96;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,96,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                      lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X422RELPAR = SHIFTREL                                 )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=96;
 lips.rulenr:=96;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,96,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
13 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=68;
 lips.rulenr:=68;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,68,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
15 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=67;
 lips.rulenr:=67;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,67,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
17 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=67;
 lips.rulenr:=67;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,67,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
16 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=69;
 lips.rulenr:=69;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,69,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
217 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=198;
 lips.rulenr:=198;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,198,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
218 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=16;
 lips.rulenr:=16;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,16,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
219 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=16;
 lips.rulenr:=16;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,16,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
220 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=16;
 lips.rulenr:=16;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,16,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
134 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=118;
 lips.rulenr:=118;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,118,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
135 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=118;
 lips.rulenr:=118;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,118,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
101 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=118;
 lips.rulenr:=118;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,118,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
104 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=118;
 lips.rulenr:=118;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,118,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
102 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=118;
 lips.rulenr:=118;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,118,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
105 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=118;
 lips.rulenr:=118;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,118,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
103 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=118;
 lips.rulenr:=118;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,118,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
106 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=120;
 lips.rulenr:=120;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,120,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
107 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=120;
 lips.rulenr:=120;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,120,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
152 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=192;
 lips.rulenr:=192;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,192,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
74 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
148 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
130 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=152;
 lips.rulenr:=152;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,152,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
131 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=152;
 lips.rulenr:=152;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,152,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
132 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=152;
 lips.rulenr:=152;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,152,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
133 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=159;
 lips.rulenr:=159;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,159,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
136 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=162;
 lips.rulenr:=162;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,162,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
139 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=154;
 lips.rulenr:=154;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,154,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
137 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=161;
 lips.rulenr:=161;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,161,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
216 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=40;
 lips.rulenr:=40;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,40,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
201 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=59;
 lips.rulenr:=59;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,59,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
198 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=59;
 lips.rulenr:=59;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,59,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
199 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=59;
 lips.rulenr:=59;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,59,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
203 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=60;
 lips.rulenr:=60;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,60,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
202 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=97;
 lips.rulenr:=97;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,97,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
229 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=98;
 lips.rulenr:=98;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,98,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
helpresult1:=result1;
HILTREE_emptyNode(result1);
 IF X483SUPERPAR=PRESENTDEIXIS THEN BEGIN
result2:=helpresult1;
WHILE NOT(HILTREE_IsEmptyNode(result2)) DO
 BEGIN
 HILTREE_TakeFromNode(p,result2);
 HILTREE_LoadHypernodeelt(p,resultelt);
lips:=resultelt.parameters.params;
lips.X98SUPERPAR:=ILPRESENTDEIXIS;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,98,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
HILTREE_addtoNode(p,result1);
 END;
END;
 IF X483SUPERPAR=PASTDEIXIS THEN BEGIN
result2:=helpresult1;
WHILE NOT(HILTREE_IsEmptyNode(result2)) DO
 BEGIN
 HILTREE_TakeFromNode(p,result2);
 HILTREE_LoadHypernodeelt(p,resultelt);
lips:=resultelt.parameters.params;
lips.X98SUPERPAR:=ILPASTDEIXIS;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,98,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
HILTREE_addtoNode(p,result1);
 END;
END;
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
231 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=99;
 lips.rulenr:=99;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,99,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
230 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=100;
 lips.rulenr:=100;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,100,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
232 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=101;
 lips.rulenr:=101;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,101,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
207 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=108;
 lips.rulenr:=108;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,108,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
208 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=110;
 lips.rulenr:=110;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,110,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
209 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=110;
 lips.rulenr:=110;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,110,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
210 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=111;
 lips.rulenr:=111;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,111,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
211 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=113;
 lips.rulenr:=113;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,113,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
212 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=113;
 lips.rulenr:=113;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,113,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
213 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=115;
 lips.rulenr:=115;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,115,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
214 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=116;
 lips.rulenr:=116;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,116,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
215 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (intequals14(X469CONTROLLERPAR)                        )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=117;
 lips.rulenr:=117;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 lips.X117CONTROLLERPAR:=X1                                                    ;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,117,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
204 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=123;
 lips.rulenr:=123;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,123,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
205 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=123;
 lips.rulenr:=123;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,123,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
END;{CASE}
R:=R-254;
IF R >0 THEN
CASE R OF
0: BEGIN END;
1 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=169;
 lips.rulenr:=169;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,169,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
10 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X518SUPER = PRESENTDEIXIS                             )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=145;
 lips.rulenr:=145;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,145,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF (X518SUPER = PASTDEIXIS                                )                                                      THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=134;
 lips.rulenr:=134;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,134,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
3 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=126;
 lips.rulenr:=126;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,126,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
4 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=48;
 lips.rulenr:=48;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,48,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
5 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=148;
 lips.rulenr:=148;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,148,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
2 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=32;
 lips.rulenr:=32;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,32,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
6 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=54;
 lips.rulenr:=54;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,54,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
7 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=55;
 lips.rulenr:=55;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,55,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
8 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=56;
 lips.rulenr:=56;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,56,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
9 :BEGIN
lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);
HILTREE_emptyNode(result1);
WITH lsps^ DO BEGIN
IF  TRUE 
                                                       THEN BEGIN
resultelt.sembonus:=0;
 resultelt.R:=57;
 lips.rulenr:=57;
 resultelt.parameters.index:=-1;
 resultelt.parameters.subst:=ps.subst;
 resultelt.parameters.index:=ps.index;
 resultelt.parameters.params:=lips;
 HILTREE_newhyperiltreerule(p,57,resultelt.parameters);
 HILTREE_storehypernodeelt(p,resultelt);
 HILTREE_AddToNode(p,result1);
appendresults(result1,result);
 END;
 END{WITH};
                                                       END;
END;{CASE}
LDANILRULES_RuleTransfer:=result;
END;
