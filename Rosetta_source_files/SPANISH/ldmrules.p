EXPORT(LDMRULES);
pragma C_include('ldmrules.pf');
pragma C_include('limatches.pf');
pragma C_include('ldconvrec.pf');
pragma C_include('lsparams.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('mem.pf');
pragma C_include('str.pf');
pragma C_include('lirectoscreen.pf');
pragma C_include('ldsubgrammars.pf');
pragma C_include('lstypetostr.pf');
pragma C_include('lsmruquo.pf');
pragma C_include('windows.pf');
PROGRAM LDMRULES;
WITH limatches,ldconvrec,lsparams,lsdomaint,mem,str,lirectoscreen,ldsubgrammars,lstypetostr,
lsmruquo,windows;
 PROCEDURE LDMRULES_MakeCtrlExpr(VAR p:LDMRULES_pCtrlExpr);
BEGIN
MEM_newdefault(loopholes.sizeof(LDMRULES_CtrlExpr),loopholes.retype(p,MEM_ptr));
END;
 PROCEDURE LDMRULES_MakeParamlist(VAR p:LDMRULES_paramlist);
BEGIN
MEM_newdefault(loopholes.sizeof(LDMRULES_aramlist),loopholes.retype(p,MEM_ptr));
END;
 PROCEDURE LDMRULES_PrintParameters(w:WINDOWS_device;parameters:LDMRULES_liparameters);
VAR convlen:INTEGER;lsps:LSPARAMS_precord;
    p,attrstruct:LDCONVREC_pattrstruct;
    q:LDCONVREC_psetvaluetype;
val240X1:LSDOMAINT_casetype;
val259X1:LSDOMAINT_casetype;
val261X1:LSDOMAINT_casetype;
val262X1:LSDOMAINT_casetype;
BEGIN
attrstruct:=NIL;
lsps:=loopholes.retype(parameters.ls,LSPARAMS_precord);
IF lsps<>NIL THEN
BEGIN
IF parameters.rulenr<0 THEN BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='TRANSFORMATION';
 p^.fieldname.len:=14;
LDMRULES_transformationname(1,-parameters.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
END;
CASE parameters.rulenr OF
1
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
2
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
3
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
4
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
5
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
6
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
7
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
8
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
9
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
10
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
11
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
12
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
13
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
14
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
15
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
16
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
17
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
18
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
19
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
20
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
21
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
22
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
23
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
24
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
25
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
26
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
27
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
28
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
29
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
30
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
31
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
32
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
33
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
34
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
35
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
36
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
37
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
38
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
39
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
40
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
41
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
42
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
43
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
44
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
45
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
46
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
47
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
48
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
49
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
50
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
51
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
52
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
53
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
54
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
55
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
56
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
57
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
58
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
59
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
60
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
61
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
62
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
63
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
64
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
65
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
66
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
67
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
68
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
69
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
70
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
71
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
72
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
73
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
74
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
75
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
76
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
77
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
78
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='SUPERPAR' ; p^.fieldname.len:=8;
  LSTYPETOSTR_TIEMPOTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X78SUPERPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
79
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
80
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
81
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
82
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
83
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
84
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
85
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
86
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
87
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
88
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
89
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
90
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
91
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
92
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
93
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
94
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
95
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
96
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
97
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
98
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
99
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
100
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
101
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
102
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
103
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
104
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
105
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
106
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
107
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
108
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
109
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
110
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
111
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
112
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
113
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
114
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
115
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
116
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
117
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
118
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
119
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
120
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
121
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
122
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
123
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
124
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
125
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
126
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
127
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
128
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='MODOPAR' ; p^.fieldname.len:=7;
  LSTYPETOSTR_MODOTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X128MODOPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
129
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
130
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
131
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
132
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
133
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
134
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
135
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
136
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
137
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
138
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
139
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
140
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
141
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='GENEROPAR' ; p^.fieldname.len:=9;
  LSTYPETOSTR_GENEROTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X141GENEROPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='NUMEROPAR' ; p^.fieldname.len:=9;
  LSTYPETOSTR_NUMEROTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X141NUMEROPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
142
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
143
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
144
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
145
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
146
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
147
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
148
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
149
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
150
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
151
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
152
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
153
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
154
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
155
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
156
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
157
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
158
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
159
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
160
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
161
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
162
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
163
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
164
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
165
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
166
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
167
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
168
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
169
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
170
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
171
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
172
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
173
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
174
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
175
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
176
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
177
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
178
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
179
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
180
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
181
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
182
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
183
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
184
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
185
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
186
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
187
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
188
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
189
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
190
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
191
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
192
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
193
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
194
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
195
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
196
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
197
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
198
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
199
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
200
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
201
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
202
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
203
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
204
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
205
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
206
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
207
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
208
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
209
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
210
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
211
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
212
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
213
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
214
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
215
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
216
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='SUPER' ; p^.fieldname.len:=5;
  LSTYPETOSTR_TIEMPOTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X216SUPER);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
217
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
218
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
219
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
220
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
221
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
222
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
223
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
224
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='SUPER' ; p^.fieldname.len:=5;
  LSTYPETOSTR_TIEMPOTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X224SUPER);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
225
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
226
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
227
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
228
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
229
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
230
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
231
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
232
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
233
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
234
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
235
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
236
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
237
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
238
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
239
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
240
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='CASESPAR' ; p^.fieldname.len:=8;
p^.typeindicator:=enumset;
FOR val240X1 := nominative TO prepositive DO
  BEGIN
  IF val240X1 IN lsps^.X240CASESPAR THEN
    BEGIN
    new(q);
    q^.nextvalue:=p^.setvalue;
    p^.setvalue:=q;
    LSTYPETOSTR_casetype(p^.setvalue^.eltvalue.str,p^.setvalue^.eltvalue.len,val240X1);
    END;
  END;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
241
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
242
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
243
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
244
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
245
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
246
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
247
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
248
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
249
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
250
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
251
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
252
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
253
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
254
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
255
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
256
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
257
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
258
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
259
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
260
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
261
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
262
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
263
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
264
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
265
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
266
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
267
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
268
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
269
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
270
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
271
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
272
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
273
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
274
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
275
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
276
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
277
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
278
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
279
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
280
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
281
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
282
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
283
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
284
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
285
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
286
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
287
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
288
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
289
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
290
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='SUPER' ; p^.fieldname.len:=5;
  LSTYPETOSTR_TIEMPOTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X290SUPER);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
291
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
292
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
293
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
294
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='SUPER' ; p^.fieldname.len:=5;
  LSTYPETOSTR_TIEMPOTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X294SUPER);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
295
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
296
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
297
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
298
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
299
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
300
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
301
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
302
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='NUMBERPAR' ; p^.fieldname.len:=9;
  LSTYPETOSTR_NUMEROTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X302NUMBERPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
303
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
304
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
305
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
306
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
307
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
308
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
309
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
310
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
311
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
312
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
313
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
314
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
315
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
316
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
317
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
318
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
319
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
320
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
321
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
322
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
323
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
324
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
325
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
326
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
327
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
328
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
329
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
330
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
331
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='SUPER' ; p^.fieldname.len:=5;
  LSTYPETOSTR_TIEMPOTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X331SUPER);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
332
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
333
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
334
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
335
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
336
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
337
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
338
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
339
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
340
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
341
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
342
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
343
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
344
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
345
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
346
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
347
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
348
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
349
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
350
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='SUPER' ; p^.fieldname.len:=5;
  LSTYPETOSTR_TIEMPOTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X350SUPER);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
351
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
352
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
353
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
354
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
355
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
356
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
357
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
358
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
359
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
360
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
361
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
362
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='SUPER' ; p^.fieldname.len:=5;
  LSTYPETOSTR_TIEMPOTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X362SUPER);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
363
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
364
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
365
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
366
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
367
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
368
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
369
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
370
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
371
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
372
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
373
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
374
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
375
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
376
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
377
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='ANTECEDENT' ; p^.fieldname.len:=10;
  STR_integertostr(lsps^.X377ANTECEDENT,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='NUMEROPAR' ; p^.fieldname.len:=9;
  LSTYPETOSTR_NUMEROTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X377NUMEROPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
378
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
379
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
380
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
381
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
382
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
383
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='ADJUNCTPAR' ; p^.fieldname.len:=10;
  LSTYPETOSTR_ADJUNCTTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X383ADJUNCTPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
384
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='ADJUNCTPAR' ; p^.fieldname.len:=10;
  LSTYPETOSTR_ADJUNCTTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X384ADJUNCTPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
385
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
386
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
387
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
388
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
389
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
390
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
391
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
392
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
393
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
394
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
395
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
396
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
397
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
398
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
399
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
END;
END;
LIRECTOSCREEN_write(w,attrstruct);
END;
 PROCEDURE LDMrules_Rulenumber(VAR R:LDMrules_ruleindex;
const name:string;length:INTEGER);
BEGIN
IF STR_compare(name,length,'ERRORRULE',9)=0 THEN
  R:=1;
IF STR_compare(name,length,'RBVERBTOSUB',11)=0 THEN
  R:=2;
IF STR_compare(name,length,'RSIDSTARTVPPROP120',18)=0 THEN
  R:=3;
IF STR_compare(name,length,'RSIDSTARTVPPROP123',18)=0 THEN
  R:=4;
IF STR_compare(name,length,'RSTARTVPPROP000',15)=0 THEN
  R:=5;
IF STR_compare(name,length,'RSTARTVPPROP100',15)=0 THEN
  R:=6;
IF STR_compare(name,length,'RSTARTVPPROP010A',16)=0 THEN
  R:=7;
IF STR_compare(name,length,'RSTARTVPPROP010B',16)=0 THEN
  R:=8;
IF STR_compare(name,length,'RSTARTVPPROP120',15)=0 THEN
  R:=9;
IF STR_compare(name,length,'RSTARTVPPROP012',15)=0 THEN
  R:=10;
IF STR_compare(name,length,'RSTARTVPPROP021',15)=0 THEN
  R:=11;
IF STR_compare(name,length,'RSTARTVPPROP123',15)=0 THEN
  R:=12;
IF STR_compare(name,length,'RSTARTVPPROP312',15)=0 THEN
  R:=13;
IF STR_compare(name,length,'RSTARTVPPROP321',15)=0 THEN
  R:=14;
IF STR_compare(name,length,'RSTARTVPPROP210',15)=0 THEN
  R:=15;
IF STR_compare(name,length,'RSTARTVPPROP132',15)=0 THEN
  R:=16;
IF STR_compare(name,length,'RIDENTFORMATIONESTO',19)=0 THEN
  R:=17;
IF STR_compare(name,length,'RIDENTFORMATIONESO1',19)=0 THEN
  R:=18;
IF STR_compare(name,length,'RIDENTFORMATIONESO2',19)=0 THEN
  R:=19;
IF STR_compare(name,length,'RPERSPROIDENT',13)=0 THEN
  R:=20;
IF STR_compare(name,length,'RSENTIDENT',10)=0 THEN
  R:=21;
IF STR_compare(name,length,'RDEMPROWHIDENTSG',16)=0 THEN
  R:=22;
IF STR_compare(name,length,'RDEMPROWHIDENTPL',16)=0 THEN
  R:=23;
IF STR_compare(name,length,'RIDENTREFVARINSERT',18)=0 THEN
  R:=24;
IF STR_compare(name,length,'RIDENTCONJSENTVAR',17)=0 THEN
  R:=25;
IF STR_compare(name,length,'RIDENTFINALCONJSENTVAR',22)=0 THEN
  R:=26;
IF STR_compare(name,length,'RIDENTLOCADVVAR',15)=0 THEN
  R:=27;
IF STR_compare(name,length,'RIDENTLOCPREPPVAR',17)=0 THEN
  R:=28;
IF STR_compare(name,length,'RIDENTSADVVAR',13)=0 THEN
  R:=29;
IF STR_compare(name,length,'RIDENTSPREPPVAR',15)=0 THEN
  R:=30;
IF STR_compare(name,length,'RSTARTEXISTENTIAL1',18)=0 THEN
  R:=31;
IF STR_compare(name,length,'REXISTREFVARINSERTION',21)=0 THEN
  R:=32;
IF STR_compare(name,length,'REXISTCONJSENTVAR',17)=0 THEN
  R:=33;
IF STR_compare(name,length,'REXISTFINALCONJSENTVAR',22)=0 THEN
  R:=34;
IF STR_compare(name,length,'REXISTLOCADVVAR',15)=0 THEN
  R:=35;
IF STR_compare(name,length,'REXISTLOCPREPPVAR',17)=0 THEN
  R:=36;
IF STR_compare(name,length,'REXISTSADVVAR',13)=0 THEN
  R:=37;
IF STR_compare(name,length,'REXISTSPREPPVAR',15)=0 THEN
  R:=38;
IF STR_compare(name,length,'RACTIVE',7)=0 THEN
  R:=39;
IF STR_compare(name,length,'RSEACTIVE1',10)=0 THEN
  R:=40;
IF STR_compare(name,length,'RSEACTIVE2',10)=0 THEN
  R:=41;
IF STR_compare(name,length,'RSEACTIVE3',10)=0 THEN
  R:=42;
IF STR_compare(name,length,'RSEPASSIVE',10)=0 THEN
  R:=43;
IF STR_compare(name,length,'RPASSIVE',8)=0 THEN
  R:=44;
IF STR_compare(name,length,'RPREPPVARINVP',13)=0 THEN
  R:=45;
IF STR_compare(name,length,'RLOCADVVAR',10)=0 THEN
  R:=46;
IF STR_compare(name,length,'RLOCPREPPVAR',12)=0 THEN
  R:=47;
IF STR_compare(name,length,'RSADVVAR',8)=0 THEN
  R:=48;
IF STR_compare(name,length,'RSPREPPVAR',10)=0 THEN
  R:=49;
IF STR_compare(name,length,'RCONJSVAR',9)=0 THEN
  R:=50;
IF STR_compare(name,length,'RFINCONJSVAR',12)=0 THEN
  R:=51;
IF STR_compare(name,length,'RPPPLOCADVVAR',13)=0 THEN
  R:=52;
IF STR_compare(name,length,'RADVPPLOCADVVAR',15)=0 THEN
  R:=53;
IF STR_compare(name,length,'RPPPLOCPREPPVAR',15)=0 THEN
  R:=54;
IF STR_compare(name,length,'RADVPPLOCPREPPVAR',17)=0 THEN
  R:=55;
IF STR_compare(name,length,'RPPPSADVVAR',11)=0 THEN
  R:=56;
IF STR_compare(name,length,'RADVPPSADVVAR',13)=0 THEN
  R:=57;
IF STR_compare(name,length,'RPPPSPREPPVAR',13)=0 THEN
  R:=58;
IF STR_compare(name,length,'RADVPPSPREPPVAR',15)=0 THEN
  R:=59;
IF STR_compare(name,length,'RADJLOCADVVAR',13)=0 THEN
  R:=60;
IF STR_compare(name,length,'RADJLOCPREPPVAR',15)=0 THEN
  R:=61;
IF STR_compare(name,length,'RADJSADVVAR',11)=0 THEN
  R:=62;
IF STR_compare(name,length,'RADJSPREPPVAR',13)=0 THEN
  R:=63;
IF STR_compare(name,length,'RPPPCONJSVAR',12)=0 THEN
  R:=64;
IF STR_compare(name,length,'RPPPFINCONJSVAR',15)=0 THEN
  R:=65;
IF STR_compare(name,length,'RADVPPCONJSVAR',14)=0 THEN
  R:=66;
IF STR_compare(name,length,'RADVPPFINCONJSVAR',17)=0 THEN
  R:=67;
IF STR_compare(name,length,'RNPPLOCADVVAR',13)=0 THEN
  R:=68;
IF STR_compare(name,length,'RNPPLOCPREPPVAR',15)=0 THEN
  R:=69;
IF STR_compare(name,length,'RNPPSADVVAR',11)=0 THEN
  R:=70;
IF STR_compare(name,length,'RNPPSPREPPVAR',13)=0 THEN
  R:=71;
IF STR_compare(name,length,'RNPPCONJSVAR',12)=0 THEN
  R:=72;
IF STR_compare(name,length,'RNPPFINCONJSVAR',15)=0 THEN
  R:=73;
IF STR_compare(name,length,'RSINGLECARD',11)=0 THEN
  R:=74;
IF STR_compare(name,length,'RCOMPOSEDCARD',13)=0 THEN
  R:=75;
IF STR_compare(name,length,'RCARDTONP',9)=0 THEN
  R:=76;
IF STR_compare(name,length,'RCARDTODETP',11)=0 THEN
  R:=77;
IF STR_compare(name,length,'RPRNTONP',8)=0 THEN
  R:=78;
IF STR_compare(name,length,'RMONTHYEAR',10)=0 THEN
  R:=79;
IF STR_compare(name,length,'RDAYMONTH',9)=0 THEN
  R:=80;
IF STR_compare(name,length,'RWEEKDATUM',10)=0 THEN
  R:=81;
IF STR_compare(name,length,'RDAYNUMBER',10)=0 THEN
  R:=82;
IF STR_compare(name,length,'RVPADV',6)=0 THEN
  R:=83;
IF STR_compare(name,length,'RAGVPADV1',9)=0 THEN
  R:=84;
IF STR_compare(name,length,'RAGVPADV2',9)=0 THEN
  R:=85;
IF STR_compare(name,length,'RAGVPADV3',9)=0 THEN
  R:=86;
IF STR_compare(name,length,'RCLAUSEFORMATION1',17)=0 THEN
  R:=87;
IF STR_compare(name,length,'RCLAUSEFORMATION2',17)=0 THEN
  R:=88;
IF STR_compare(name,length,'RCLAUSEFORMATION3A',18)=0 THEN
  R:=89;
IF STR_compare(name,length,'RCLAUSEFORMATION3B',18)=0 THEN
  R:=90;
IF STR_compare(name,length,'RCLAUSEFORMATION4',17)=0 THEN
  R:=91;
IF STR_compare(name,length,'RCLAUSEFORMATION5',17)=0 THEN
  R:=92;
IF STR_compare(name,length,'RCLAUSEFORMATION6A',18)=0 THEN
  R:=93;
IF STR_compare(name,length,'RCLAUSEFORMATION6B',18)=0 THEN
  R:=94;
IF STR_compare(name,length,'RCLAUSEFORMATION7A',18)=0 THEN
  R:=95;
IF STR_compare(name,length,'RCLAUSEFORMATION7B',18)=0 THEN
  R:=96;
IF STR_compare(name,length,'ROPENADJPPROPSUBSTITUTION',25)=0 THEN
  R:=97;
IF STR_compare(name,length,'RCLOSEDADJPPROPSUBSTITUTION',27)=0 THEN
  R:=98;
IF STR_compare(name,length,'ROPENADVPPROPSUBSTITUTION',25)=0 THEN
  R:=99;
IF STR_compare(name,length,'RCLOSEDADVPPROPSUBSTITUTION',27)=0 THEN
  R:=100;
IF STR_compare(name,length,'ROPENNPPROPSUBSTITUTION',23)=0 THEN
  R:=101;
IF STR_compare(name,length,'RCLOSEDNPPROPSUBSTITUTION',25)=0 THEN
  R:=102;
IF STR_compare(name,length,'RLOPREPPPROPSUBSTITUTION',24)=0 THEN
  R:=103;
IF STR_compare(name,length,'RLCPREPPPROPSUBSTITUTION',24)=0 THEN
  R:=104;
IF STR_compare(name,length,'RDOPREPPPROPSUBSTITUTION',24)=0 THEN
  R:=105;
IF STR_compare(name,length,'RDCPREPPPROPSUBSTITUTION',24)=0 THEN
  R:=106;
IF STR_compare(name,length,'ROCPREPPPROPSUBSTITUTION',24)=0 THEN
  R:=107;
IF STR_compare(name,length,'RSENTENCECOMPL',14)=0 THEN
  R:=108;
IF STR_compare(name,length,'ROPENADJPPROPPREPOBJ',20)=0 THEN
  R:=109;
IF STR_compare(name,length,'RCLOSEDADJPPROPPREPOBJ',22)=0 THEN
  R:=110;
IF STR_compare(name,length,'ROPENNPPROPPREPOBJ',18)=0 THEN
  R:=111;
IF STR_compare(name,length,'RCLOSEDNPPROPPREPOBJ',20)=0 THEN
  R:=112;
IF STR_compare(name,length,'RSENTENCEPREPOBJ',16)=0 THEN
  R:=113;
IF STR_compare(name,length,'RSENTENCESUBJ',13)=0 THEN
  R:=114;
IF STR_compare(name,length,'RSENTENCEEXTRAPOS',17)=0 THEN
  R:=115;
IF STR_compare(name,length,'RSENTENCELDISLOC',16)=0 THEN
  R:=116;
IF STR_compare(name,length,'ROPENADJPPROPSENTENCESUBST',26)=0 THEN
  R:=117;
IF STR_compare(name,length,'REMPTYSUBSTITUTION1',19)=0 THEN
  R:=118;
IF STR_compare(name,length,'REMPTYSUBSTITUTION2',19)=0 THEN
  R:=119;
IF STR_compare(name,length,'REMPTYSUBSTITUTION3',19)=0 THEN
  R:=120;
IF STR_compare(name,length,'REMPTYSUBSTITUTION4',19)=0 THEN
  R:=121;
IF STR_compare(name,length,'REMPTYSUBSTITUTION5',19)=0 THEN
  R:=122;
IF STR_compare(name,length,'REMPTYSUBSTITUTION8',19)=0 THEN
  R:=123;
IF STR_compare(name,length,'REMPTYSUBSTITUTION10',20)=0 THEN
  R:=124;
IF STR_compare(name,length,'RPREPEMPTYSUBST1',16)=0 THEN
  R:=125;
IF STR_compare(name,length,'RDIREMPTYSUBST1',15)=0 THEN
  R:=126;
IF STR_compare(name,length,'RMOODDETERMINATION',18)=0 THEN
  R:=127;
IF STR_compare(name,length,'RMOOD2',6)=0 THEN
  R:=128;
IF STR_compare(name,length,'RMOOD3',6)=0 THEN
  R:=129;
IF STR_compare(name,length,'RMOOD4',6)=0 THEN
  R:=130;
IF STR_compare(name,length,'RMOOD5',6)=0 THEN
  R:=131;
IF STR_compare(name,length,'RMOOD6',6)=0 THEN
  R:=132;
IF STR_compare(name,length,'RMOODFINREL',11)=0 THEN
  R:=133;
IF STR_compare(name,length,'RMOODFINWHMOD',13)=0 THEN
  R:=134;
IF STR_compare(name,length,'RMOODOPENINF',12)=0 THEN
  R:=135;
IF STR_compare(name,length,'RMOODCLOSEDINF',14)=0 THEN
  R:=136;
IF STR_compare(name,length,'RMOOD7A',7)=0 THEN
  R:=137;
IF STR_compare(name,length,'RMOOD7B',7)=0 THEN
  R:=138;
IF STR_compare(name,length,'RMOOD8A',7)=0 THEN
  R:=139;
IF STR_compare(name,length,'RMOOD8B',7)=0 THEN
  R:=140;
IF STR_compare(name,length,'RMOODPOLITEIMP',14)=0 THEN
  R:=141;
IF STR_compare(name,length,'RMOODADHORT1',12)=0 THEN
  R:=142;
IF STR_compare(name,length,'RMOODADHORT2',12)=0 THEN
  R:=143;
IF STR_compare(name,length,'RMOODGERUNDIO',13)=0 THEN
  R:=144;
IF STR_compare(name,length,'RMOODPTCPAS1',12)=0 THEN
  R:=145;
IF STR_compare(name,length,'RMOODPTCPAS2',12)=0 THEN
  R:=146;
IF STR_compare(name,length,'RMOOD9',6)=0 THEN
  R:=147;
IF STR_compare(name,length,'RIDSUBSTITUTION1',16)=0 THEN
  R:=148;
IF STR_compare(name,length,'RSUBSTITUTION1',14)=0 THEN
  R:=149;
IF STR_compare(name,length,'RSUBSTITUTION2',14)=0 THEN
  R:=150;
IF STR_compare(name,length,'RSUBSTITUTION3',14)=0 THEN
  R:=151;
IF STR_compare(name,length,'RSUBSTITUTION4',14)=0 THEN
  R:=152;
IF STR_compare(name,length,'RPREPSUBSTVP',12)=0 THEN
  R:=153;
IF STR_compare(name,length,'RSUBSTITUTION5',14)=0 THEN
  R:=154;
IF STR_compare(name,length,'RSUBSTITUTION5A',15)=0 THEN
  R:=155;
IF STR_compare(name,length,'RSUBSTITUTION6',14)=0 THEN
  R:=156;
IF STR_compare(name,length,'RSUBSTITUTION8',14)=0 THEN
  R:=157;
IF STR_compare(name,length,'RSUBSTITUTION9',14)=0 THEN
  R:=158;
IF STR_compare(name,length,'RSUBSTITUTION10',15)=0 THEN
  R:=159;
IF STR_compare(name,length,'RSUBSTITUTION7',14)=0 THEN
  R:=160;
IF STR_compare(name,length,'RSUBSTENNP1',11)=0 THEN
  R:=161;
IF STR_compare(name,length,'RSUBSTENNP2',11)=0 THEN
  R:=162;
IF STR_compare(name,length,'RDEEPSUBST1',11)=0 THEN
  R:=163;
IF STR_compare(name,length,'RDEEPSUBST2',11)=0 THEN
  R:=164;
IF STR_compare(name,length,'RBPERSPRO',9)=0 THEN
  R:=165;
IF STR_compare(name,length,'RTEMPADVSUBSTITUTION1',21)=0 THEN
  R:=166;
IF STR_compare(name,length,'RTEMPADVSUBSTITUTION2',21)=0 THEN
  R:=167;
IF STR_compare(name,length,'RTEMPADVSENTSUBSTITUTION',24)=0 THEN
  R:=168;
IF STR_compare(name,length,'RTEMPADVSUBSTITUTION3',21)=0 THEN
  R:=169;
IF STR_compare(name,length,'RTEMPADVSUBSTITUTION4',21)=0 THEN
  R:=170;
IF STR_compare(name,length,'RREFVARINSERTION',16)=0 THEN
  R:=171;
IF STR_compare(name,length,'RDURVARINSERTION',16)=0 THEN
  R:=172;
IF STR_compare(name,length,'RRETROVARINSERTION',18)=0 THEN
  R:=173;
IF STR_compare(name,length,'RFREQVARINSERTION',17)=0 THEN
  R:=174;
IF STR_compare(name,length,'RPPPREFVARINSERTION',19)=0 THEN
  R:=175;
IF STR_compare(name,length,'RPPPDURVARINSERTION',19)=0 THEN
  R:=176;
IF STR_compare(name,length,'RPPPRETROVARINSERTION',21)=0 THEN
  R:=177;
IF STR_compare(name,length,'RADVPPREFVARINSERTION',21)=0 THEN
  R:=178;
IF STR_compare(name,length,'RADVPPDURVARINSERTION',21)=0 THEN
  R:=179;
IF STR_compare(name,length,'RADVPPRETROVARINSERTION',23)=0 THEN
  R:=180;
IF STR_compare(name,length,'RASPECTIMPERFECTIVE',19)=0 THEN
  R:=181;
IF STR_compare(name,length,'RASPECTPERFECTIVE',17)=0 THEN
  R:=182;
IF STR_compare(name,length,'RASPECTHABITUAL',15)=0 THEN
  R:=183;
IF STR_compare(name,length,'RFINPRESENTDEIXIS',17)=0 THEN
  R:=184;
IF STR_compare(name,length,'RFINPASTDEIXIS',14)=0 THEN
  R:=185;
IF STR_compare(name,length,'RTEMPCONJSENTMOVETOLEFT',23)=0 THEN
  R:=186;
IF STR_compare(name,length,'RINFINPASTDEIXISSPEC',20)=0 THEN
  R:=187;
IF STR_compare(name,length,'RIMPDEIXIS',10)=0 THEN
  R:=188;
IF STR_compare(name,length,'RFINIRRMODALDEIXIS',18)=0 THEN
  R:=189;
IF STR_compare(name,length,'RFINPRESENTSUPERDEIXIS',22)=0 THEN
  R:=190;
IF STR_compare(name,length,'RFINPASTSUPERDEIXIS1',20)=0 THEN
  R:=191;
IF STR_compare(name,length,'RFINPASTSUPERDEIXIS2',20)=0 THEN
  R:=192;
IF STR_compare(name,length,'RFINPRESFUTDEIXIS',17)=0 THEN
  R:=193;
IF STR_compare(name,length,'RFINFUTPASTDEIXIS',17)=0 THEN
  R:=194;
IF STR_compare(name,length,'RFINFUTPRESDEIXIS',17)=0 THEN
  R:=195;
IF STR_compare(name,length,'RFINPRESFUTSUPERDEIXIS',22)=0 THEN
  R:=196;
IF STR_compare(name,length,'RFINPASTFUTSUPERDEIXIS',22)=0 THEN
  R:=197;
IF STR_compare(name,length,'RFINFUTPRESSUPERDEIXIS',22)=0 THEN
  R:=198;
IF STR_compare(name,length,'RFINFUTPASTSUPERDEIXIS',22)=0 THEN
  R:=199;
IF STR_compare(name,length,'RRETROIMPERFECTIVE1',19)=0 THEN
  R:=200;
IF STR_compare(name,length,'RRETROIMPERFECTIVE2',19)=0 THEN
  R:=201;
IF STR_compare(name,length,'RRETROPERFECTIVE',16)=0 THEN
  R:=202;
IF STR_compare(name,length,'RINFINPRESENTSUPERDEIXIS',24)=0 THEN
  R:=203;
IF STR_compare(name,length,'RINFINPASTSUPERDEIXIS',21)=0 THEN
  R:=204;
IF STR_compare(name,length,'RINFINPASTSUPERDEIXISSPEC',25)=0 THEN
  R:=205;
IF STR_compare(name,length,'RFINIRRMODALSUPERDEIXIS',23)=0 THEN
  R:=206;
IF STR_compare(name,length,'RADJREFVARINSERTION',19)=0 THEN
  R:=207;
IF STR_compare(name,length,'RADJDURVARINSERTION',19)=0 THEN
  R:=208;
IF STR_compare(name,length,'RADJRETROVARINSERTION',21)=0 THEN
  R:=209;
IF STR_compare(name,length,'RADJASPECTIMPERFECTIVE',22)=0 THEN
  R:=210;
IF STR_compare(name,length,'RADJPRESENTSUPERDEIXIS',22)=0 THEN
  R:=211;
IF STR_compare(name,length,'RADJPASTSUPERDEIXIS',19)=0 THEN
  R:=212;
IF STR_compare(name,length,'RBADVTOSUB',10)=0 THEN
  R:=213;
IF STR_compare(name,length,'RSUBADJTOSUBADV',15)=0 THEN
  R:=214;
IF STR_compare(name,length,'RSTARTADVP0',11)=0 THEN
  R:=215;
IF STR_compare(name,length,'RADVPSUPERDEIXIS',16)=0 THEN
  R:=216;
IF STR_compare(name,length,'RSTARTADVPPROP100',17)=0 THEN
  R:=217;
IF STR_compare(name,length,'RSTARTADVPPROP010',17)=0 THEN
  R:=218;
IF STR_compare(name,length,'RSTARTADVPPROP120',17)=0 THEN
  R:=219;
IF STR_compare(name,length,'RADVREFVARINSERTION',19)=0 THEN
  R:=220;
IF STR_compare(name,length,'RADVPPROPVOICE',14)=0 THEN
  R:=221;
IF STR_compare(name,length,'RADVTOFORMULA',13)=0 THEN
  R:=222;
IF STR_compare(name,length,'RADVASPECTIMPERFECTIVE',22)=0 THEN
  R:=223;
IF STR_compare(name,length,'RADVPPSUPERDEIXIS',17)=0 THEN
  R:=224;
IF STR_compare(name,length,'RADVPPSUBST1',12)=0 THEN
  R:=225;
IF STR_compare(name,length,'RADVPPMOOD1',11)=0 THEN
  R:=226;
IF STR_compare(name,length,'RADVPPMOOD2',11)=0 THEN
  R:=227;
IF STR_compare(name,length,'RADVPPNOPUNC',12)=0 THEN
  R:=228;
IF STR_compare(name,length,'RADVPDEGREEMOD1',15)=0 THEN
  R:=229;
IF STR_compare(name,length,'RADVPDEGREEMOD2',15)=0 THEN
  R:=230;
IF STR_compare(name,length,'RADVPDEGREEMOD3',15)=0 THEN
  R:=231;
IF STR_compare(name,length,'RADVPCOMPARISONCOMPLMOD',23)=0 THEN
  R:=232;
IF STR_compare(name,length,'RADVPSUBST2',11)=0 THEN
  R:=233;
IF STR_compare(name,length,'RPUNC0',6)=0 THEN
  R:=234;
IF STR_compare(name,length,'RPUNC1',6)=0 THEN
  R:=235;
IF STR_compare(name,length,'RPUNC2',6)=0 THEN
  R:=236;
IF STR_compare(name,length,'RPUNC3',6)=0 THEN
  R:=237;
IF STR_compare(name,length,'RCOORDINTRO',11)=0 THEN
  R:=238;
IF STR_compare(name,length,'RUTT1',5)=0 THEN
  R:=239;
IF STR_compare(name,length,'RUTTNP',6)=0 THEN
  R:=240;
IF STR_compare(name,length,'RUTTADVP',8)=0 THEN
  R:=241;
IF STR_compare(name,length,'RUTTADJP',8)=0 THEN
  R:=242;
IF STR_compare(name,length,'RUTTPREPP',9)=0 THEN
  R:=243;
IF STR_compare(name,length,'RUTTEXCLAM',10)=0 THEN
  R:=244;
IF STR_compare(name,length,'RADDEXCLAM',10)=0 THEN
  R:=245;
IF STR_compare(name,length,'RADJPARAOBJMOD',14)=0 THEN
  R:=246;
IF STR_compare(name,length,'RADJPARAMOD1',12)=0 THEN
  R:=247;
IF STR_compare(name,length,'RADJDEGREEMOD1',14)=0 THEN
  R:=248;
IF STR_compare(name,length,'RADJDEGREEMOD2A',15)=0 THEN
  R:=249;
IF STR_compare(name,length,'RADJDEGREEMOD2B',15)=0 THEN
  R:=250;
IF STR_compare(name,length,'RBADJTOSUB1',11)=0 THEN
  R:=251;
IF STR_compare(name,length,'RORDDERIV',9)=0 THEN
  R:=252;
IF STR_compare(name,length,'RSTARTADJPPROP000',17)=0 THEN
  R:=253;
IF STR_compare(name,length,'RSTARTADJPPROP100',17)=0 THEN
  R:=254;
IF STR_compare(name,length,'RSTARTADJPPROP120',17)=0 THEN
  R:=255;
IF STR_compare(name,length,'RADJPPCONJSVAR',14)=0 THEN
  R:=256;
IF STR_compare(name,length,'RADJPPFINCONJSVAR',17)=0 THEN
  R:=257;
IF STR_compare(name,length,'RADJVOICEDEFAULT',16)=0 THEN
  R:=258;
IF STR_compare(name,length,'RADJSENTENCESUBSTITUTION1',25)=0 THEN
  R:=259;
IF STR_compare(name,length,'RADJPFORMULAFORMATION1',22)=0 THEN
  R:=260;
IF STR_compare(name,length,'RADJEMPTYSUBST1',15)=0 THEN
  R:=261;
IF STR_compare(name,length,'RADJEMPTYSUBST2',15)=0 THEN
  R:=262;
IF STR_compare(name,length,'RNPFORMATION1',13)=0 THEN
  R:=263;
IF STR_compare(name,length,'RNPFORMATION2',13)=0 THEN
  R:=264;
IF STR_compare(name,length,'RNPFORMATION3',13)=0 THEN
  R:=265;
IF STR_compare(name,length,'RNPFORMATION4',13)=0 THEN
  R:=266;
IF STR_compare(name,length,'RNPFORMATION4A',14)=0 THEN
  R:=267;
IF STR_compare(name,length,'RNPFORMATION5',13)=0 THEN
  R:=268;
IF STR_compare(name,length,'RNPFORMATION6',13)=0 THEN
  R:=269;
IF STR_compare(name,length,'RNPFORMATION7',13)=0 THEN
  R:=270;
IF STR_compare(name,length,'RNPFORMATION8',13)=0 THEN
  R:=271;
IF STR_compare(name,length,'RNPFORMATION9',13)=0 THEN
  R:=272;
IF STR_compare(name,length,'RNPFORMATION10',14)=0 THEN
  R:=273;
IF STR_compare(name,length,'RNPFORMATION12',14)=0 THEN
  R:=274;
IF STR_compare(name,length,'RNPFORMATION13',14)=0 THEN
  R:=275;
IF STR_compare(name,length,'RNPPRESENTSUPERDEIXIS1',22)=0 THEN
  R:=276;
IF STR_compare(name,length,'RNPPASTSUPERDEIXIS1',19)=0 THEN
  R:=277;
IF STR_compare(name,length,'RNPPRESENTSUPERDEIXIS2',22)=0 THEN
  R:=278;
IF STR_compare(name,length,'RNPPASTSUPERDEIXIS2',19)=0 THEN
  R:=279;
IF STR_compare(name,length,'RNPMODADVP',10)=0 THEN
  R:=280;
IF STR_compare(name,length,'RNPAPPOSITION',13)=0 THEN
  R:=281;
IF STR_compare(name,length,'DETDERIVATION1',14)=0 THEN
  R:=282;
IF STR_compare(name,length,'DETPFORMATION1',14)=0 THEN
  R:=283;
IF STR_compare(name,length,'DETPFORMATION2',14)=0 THEN
  R:=284;
IF STR_compare(name,length,'DETPFORMATION3',14)=0 THEN
  R:=285;
IF STR_compare(name,length,'DETPFORMATION4',14)=0 THEN
  R:=286;
IF STR_compare(name,length,'DETPFORMATION1A',15)=0 THEN
  R:=287;
IF STR_compare(name,length,'DETPFORMATION3A',15)=0 THEN
  R:=288;
IF STR_compare(name,length,'RDETPPARTITIVEFORMATION',23)=0 THEN
  R:=289;
IF STR_compare(name,length,'RDETPSUPERDEIXIS',16)=0 THEN
  R:=290;
IF STR_compare(name,length,'RADVPAMOUNTMOD',14)=0 THEN
  R:=291;
IF STR_compare(name,length,'RQTOQP1',7)=0 THEN
  R:=292;
IF STR_compare(name,length,'RQTOQP2',7)=0 THEN
  R:=293;
IF STR_compare(name,length,'RQPSUPERDEIXIS',14)=0 THEN
  R:=294;
IF STR_compare(name,length,'RQPCOMPARATIVECOMPLMOD1',23)=0 THEN
  R:=295;
IF STR_compare(name,length,'RQPCOMPARATIVECOMPLMOD2',23)=0 THEN
  R:=296;
IF STR_compare(name,length,'RQPSUPERLATIVECOMPLMOD',22)=0 THEN
  R:=297;
IF STR_compare(name,length,'RQPAMOUNTMOD',12)=0 THEN
  R:=298;
IF STR_compare(name,length,'RQPSUBSTITUTION1',16)=0 THEN
  R:=299;
IF STR_compare(name,length,'BNOUNTOSUBNOUN',14)=0 THEN
  R:=300;
IF STR_compare(name,length,'RSUBNOUNTONOUN1',15)=0 THEN
  R:=301;
IF STR_compare(name,length,'RSUBNOUNTONOUN2',15)=0 THEN
  R:=302;
IF STR_compare(name,length,'RBPROPERNOUNTOPROPERNOUN',24)=0 THEN
  R:=303;
IF STR_compare(name,length,'RINDEFPROTOSUBINDEFPRO',22)=0 THEN
  R:=304;
IF STR_compare(name,length,'RBWHPROTOWHPRO',14)=0 THEN
  R:=305;
IF STR_compare(name,length,'RBPERSPROTOPERSPRO',18)=0 THEN
  R:=306;
IF STR_compare(name,length,'RCNFORMATION1',13)=0 THEN
  R:=307;
IF STR_compare(name,length,'RCNFORMATION2',13)=0 THEN
  R:=308;
IF STR_compare(name,length,'RCNFORMATION3',13)=0 THEN
  R:=309;
IF STR_compare(name,length,'RCNFORMATION4',13)=0 THEN
  R:=310;
IF STR_compare(name,length,'RCNPRESENTSUPERDEIXIS',21)=0 THEN
  R:=311;
IF STR_compare(name,length,'RCNPASTSUPERDEIXIS',18)=0 THEN
  R:=312;
IF STR_compare(name,length,'RIDCNMODADJP1',13)=0 THEN
  R:=313;
IF STR_compare(name,length,'RCNMODADJP1',11)=0 THEN
  R:=314;
IF STR_compare(name,length,'RCNMODADJP2',11)=0 THEN
  R:=315;
IF STR_compare(name,length,'RCNMODNUM',9)=0 THEN
  R:=316;
IF STR_compare(name,length,'RCNMODPOSS1',11)=0 THEN
  R:=317;
IF STR_compare(name,length,'RCNMODPOSS2',11)=0 THEN
  R:=318;
IF STR_compare(name,length,'RCNMODPOSS3',11)=0 THEN
  R:=319;
IF STR_compare(name,length,'RCNMODPP',8)=0 THEN
  R:=320;
IF STR_compare(name,length,'RCNSPECPROPERNAME',17)=0 THEN
  R:=321;
IF STR_compare(name,length,'RCNMODBARENP',12)=0 THEN
  R:=322;
IF STR_compare(name,length,'RNPPROPFORMATION',16)=0 THEN
  R:=323;
IF STR_compare(name,length,'RNPREFVARINSERTION',18)=0 THEN
  R:=324;
IF STR_compare(name,length,'RNPRETROVARINSERTION',20)=0 THEN
  R:=325;
IF STR_compare(name,length,'RNPPSUBSTITUTION1',17)=0 THEN
  R:=326;
IF STR_compare(name,length,'ROPENNPPROPFORMATION',20)=0 THEN
  R:=327;
IF STR_compare(name,length,'RCLOSEDNPPROPFORMATION',22)=0 THEN
  R:=328;
IF STR_compare(name,length,'RNPPNOPUNC',10)=0 THEN
  R:=329;
IF STR_compare(name,length,'RCNMODRELSENT1',14)=0 THEN
  R:=330;
IF STR_compare(name,length,'RIDNPPSUPERDEIXIS',17)=0 THEN
  R:=331;
IF STR_compare(name,length,'RADJSUBSTITUTION1',17)=0 THEN
  R:=332;
IF STR_compare(name,length,'RADJSUBSTITUTION2',17)=0 THEN
  R:=333;
IF STR_compare(name,length,'RADJSUBSTITUTION3',17)=0 THEN
  R:=334;
IF STR_compare(name,length,'RADJSUBSTITUTION4',17)=0 THEN
  R:=335;
IF STR_compare(name,length,'RADJMOOD1',9)=0 THEN
  R:=336;
IF STR_compare(name,length,'RADJMOOD2',9)=0 THEN
  R:=337;
IF STR_compare(name,length,'RADJPUNC',8)=0 THEN
  R:=338;
IF STR_compare(name,length,'RHELPEMPTYSUBJSUBST',19)=0 THEN
  R:=339;
IF STR_compare(name,length,'RADJEMPTYSUBJSUBST',18)=0 THEN
  R:=340;
IF STR_compare(name,length,'RPREPTOSUB',10)=0 THEN
  R:=341;
IF STR_compare(name,length,'RSTARTPREPPPROP000',18)=0 THEN
  R:=342;
IF STR_compare(name,length,'RSTARTPREPPPROP100',18)=0 THEN
  R:=343;
IF STR_compare(name,length,'RSTARTPREPPPROP120',18)=0 THEN
  R:=344;
IF STR_compare(name,length,'RPREPPPROPVOICE',15)=0 THEN
  R:=345;
IF STR_compare(name,length,'RPPPNPMOD',9)=0 THEN
  R:=346;
IF STR_compare(name,length,'RPPPADVPMOD',11)=0 THEN
  R:=347;
IF STR_compare(name,length,'RPREPTOFORMULA',14)=0 THEN
  R:=348;
IF STR_compare(name,length,'RPPPASPECTIMPERFECTIVE',22)=0 THEN
  R:=349;
IF STR_compare(name,length,'RPPPSUPERDEIXIS',15)=0 THEN
  R:=350;
IF STR_compare(name,length,'RPPPMOOD1',9)=0 THEN
  R:=351;
IF STR_compare(name,length,'RPPPMOOD2',9)=0 THEN
  R:=352;
IF STR_compare(name,length,'RPPPSUBSTITUTION1',17)=0 THEN
  R:=353;
IF STR_compare(name,length,'RPPPSUBSTITUTION3',17)=0 THEN
  R:=354;
IF STR_compare(name,length,'RPPPSUBSTITUTION4',17)=0 THEN
  R:=355;
IF STR_compare(name,length,'RPPPSUBSTITUTION5',17)=0 THEN
  R:=356;
IF STR_compare(name,length,'RPPPNOPUNC',10)=0 THEN
  R:=357;
IF STR_compare(name,length,'RSTARTPREPP100',14)=0 THEN
  R:=358;
IF STR_compare(name,length,'RSTARTPREPP120',14)=0 THEN
  R:=359;
IF STR_compare(name,length,'RPPNPMOD',8)=0 THEN
  R:=360;
IF STR_compare(name,length,'RPPADVPMOD',10)=0 THEN
  R:=361;
IF STR_compare(name,length,'RPPSUPERDEIXIS',14)=0 THEN
  R:=362;
IF STR_compare(name,length,'RPPSUBSTITUTION1',16)=0 THEN
  R:=363;
IF STR_compare(name,length,'RPPSUBSTITUTION3',16)=0 THEN
  R:=364;
IF STR_compare(name,length,'RPPSUBSTITUTION4',16)=0 THEN
  R:=365;
IF STR_compare(name,length,'RPROPSUBST13',12)=0 THEN
  R:=366;
IF STR_compare(name,length,'RPROPSUBST14',12)=0 THEN
  R:=367;
IF STR_compare(name,length,'RPROPSUBSTFUTURO',16)=0 THEN
  R:=368;
IF STR_compare(name,length,'RCONJSENTSUBST1',15)=0 THEN
  R:=369;
IF STR_compare(name,length,'RCONJSENTSUBST2',15)=0 THEN
  R:=370;
IF STR_compare(name,length,'RNEGVARINTRO1',13)=0 THEN
  R:=371;
IF STR_compare(name,length,'RPOSVARINTRO1',13)=0 THEN
  R:=372;
IF STR_compare(name,length,'RNEGVARINTRO2',13)=0 THEN
  R:=373;
IF STR_compare(name,length,'RNEGVARINTRO3',13)=0 THEN
  R:=374;
IF STR_compare(name,length,'RMOODOPENQUEINF',15)=0 THEN
  R:=375;
IF STR_compare(name,length,'RMOODCLOSEDQUEINF',17)=0 THEN
  R:=376;
IF STR_compare(name,length,'RRECIPROCALSUBST1',17)=0 THEN
  R:=377;
IF STR_compare(name,length,'RCONJSENT1',10)=0 THEN
  R:=378;
IF STR_compare(name,length,'RCONJSENT2',10)=0 THEN
  R:=379;
IF STR_compare(name,length,'RCONJSENT3',10)=0 THEN
  R:=380;
IF STR_compare(name,length,'RCONJSENT4',10)=0 THEN
  R:=381;
IF STR_compare(name,length,'RCONJSENT5',10)=0 THEN
  R:=382;
IF STR_compare(name,length,'RADJUNCTVAR1',12)=0 THEN
  R:=383;
IF STR_compare(name,length,'RADJUNCTVAR2',12)=0 THEN
  R:=384;
IF STR_compare(name,length,'RADJUNCTVAR3',12)=0 THEN
  R:=385;
IF STR_compare(name,length,'RIDCN2',6)=0 THEN
  R:=386;
IF STR_compare(name,length,'RIDNPFORMATION2',15)=0 THEN
  R:=387;
IF STR_compare(name,length,'RIDCN1',6)=0 THEN
  R:=388;
IF STR_compare(name,length,'RIDDERIV1',9)=0 THEN
  R:=389;
IF STR_compare(name,length,'RIDDERIV6',9)=0 THEN
  R:=390;
IF STR_compare(name,length,'RIDDERIV9',9)=0 THEN
  R:=391;
IF STR_compare(name,length,'RNOUNARGMOD1',12)=0 THEN
  R:=392;
IF STR_compare(name,length,'RNOUNARGMOD2',12)=0 THEN
  R:=393;
IF STR_compare(name,length,'RNPARGMODSUBST1',15)=0 THEN
  R:=394;
IF STR_compare(name,length,'RNPARGMODSUBST2',15)=0 THEN
  R:=395;
IF STR_compare(name,length,'RNPFORMATION11',14)=0 THEN
  R:=396;
IF STR_compare(name,length,'RNPPARTITIVEFORMATION1',22)=0 THEN
  R:=397;
IF STR_compare(name,length,'RNPPARTITIVEFORMATION2',22)=0 THEN
  R:=398;
IF STR_compare(name,length,'RNPFORMATION14',14)=0 THEN
  R:=399;
END;
 PROCEDURE LDMrules_Transformationnumber(VAR R:LDMrules_transformationindex;
const name:string;length:INTEGER);
BEGIN
IF STR_compare(name,length,'TINDOBJCLITICSPELLING',21)=0 THEN
  R:=1;
IF STR_compare(name,length,'TNOINDOBJCLITICSPELLING',23)=0 THEN
  R:=2;
IF STR_compare(name,length,'TCLITICNODEINSERTION',20)=0 THEN
  R:=3;
IF STR_compare(name,length,'TREFLSPELLINGDEFAULT',20)=0 THEN
  R:=4;
IF STR_compare(name,length,'TREFLSPELLINGDEFAULT2',21)=0 THEN
  R:=5;
IF STR_compare(name,length,'TREFLSPELLING1A',15)=0 THEN
  R:=6;
IF STR_compare(name,length,'TREFLSPELLING1B',15)=0 THEN
  R:=7;
IF STR_compare(name,length,'TREFLSPELLING2A',15)=0 THEN
  R:=8;
IF STR_compare(name,length,'TREFLSPELLING2B',15)=0 THEN
  R:=9;
IF STR_compare(name,length,'TREFLSPELLING3',14)=0 THEN
  R:=10;
IF STR_compare(name,length,'TREFLSPELLING4',14)=0 THEN
  R:=11;
IF STR_compare(name,length,'TREFLCLOSEDCAT1A',16)=0 THEN
  R:=12;
IF STR_compare(name,length,'TREFLCLOSEDCAT1B',16)=0 THEN
  R:=13;
IF STR_compare(name,length,'TREFLCLOSEDCAT3',15)=0 THEN
  R:=14;
IF STR_compare(name,length,'TREFLCLOSEDCATPREP1A',20)=0 THEN
  R:=15;
IF STR_compare(name,length,'TREFLCLOSEDCATPREP1B',20)=0 THEN
  R:=16;
IF STR_compare(name,length,'TREFLCLOSEDCATPREP3',19)=0 THEN
  R:=17;
IF STR_compare(name,length,'TOBJECTOK0',10)=0 THEN
  R:=18;
IF STR_compare(name,length,'TOBJECTOK1A',11)=0 THEN
  R:=19;
IF STR_compare(name,length,'TOBJECTOK1B',11)=0 THEN
  R:=20;
IF STR_compare(name,length,'TOBJECTOK2A',11)=0 THEN
  R:=21;
IF STR_compare(name,length,'TOBJECTOK2B',11)=0 THEN
  R:=22;
IF STR_compare(name,length,'TOBJECTOK3A',11)=0 THEN
  R:=23;
IF STR_compare(name,length,'TOBJECTOK3B',11)=0 THEN
  R:=24;
IF STR_compare(name,length,'TOBJECTOK3C',11)=0 THEN
  R:=25;
IF STR_compare(name,length,'TOBJECTOK3D',11)=0 THEN
  R:=26;
IF STR_compare(name,length,'TOBJECTOK4A',11)=0 THEN
  R:=27;
IF STR_compare(name,length,'TOBJECTOK4B',11)=0 THEN
  R:=28;
IF STR_compare(name,length,'TOBJECTOK4C',11)=0 THEN
  R:=29;
IF STR_compare(name,length,'TOBJECTOK4D',11)=0 THEN
  R:=30;
IF STR_compare(name,length,'TOBJECTOK5',10)=0 THEN
  R:=31;
IF STR_compare(name,length,'TOBJECTOK6A',11)=0 THEN
  R:=32;
IF STR_compare(name,length,'TOBJECTOK6B',11)=0 THEN
  R:=33;
IF STR_compare(name,length,'TOBJECTOK7',10)=0 THEN
  R:=34;
IF STR_compare(name,length,'TOBJECTOK8',10)=0 THEN
  R:=35;
IF STR_compare(name,length,'TSVAGR0',7)=0 THEN
  R:=36;
IF STR_compare(name,length,'TSVAGR1',7)=0 THEN
  R:=37;
IF STR_compare(name,length,'TADJAGR',7)=0 THEN
  R:=38;
IF STR_compare(name,length,'TPTCPASAGR1',11)=0 THEN
  R:=39;
IF STR_compare(name,length,'TPTCPASAGR2',11)=0 THEN
  R:=40;
IF STR_compare(name,length,'TCONTROL0',9)=0 THEN
  R:=41;
IF STR_compare(name,length,'TOBLCONTROL1A',13)=0 THEN
  R:=42;
IF STR_compare(name,length,'TOBLCONTROL1B',13)=0 THEN
  R:=43;
IF STR_compare(name,length,'TNOCONTROL1',11)=0 THEN
  R:=44;
IF STR_compare(name,length,'TOBLCONTROL2A',13)=0 THEN
  R:=45;
IF STR_compare(name,length,'TOBLCONTROL2B',13)=0 THEN
  R:=46;
IF STR_compare(name,length,'TNOCONTROL2',11)=0 THEN
  R:=47;
IF STR_compare(name,length,'TOBLCONTROL3A',13)=0 THEN
  R:=48;
IF STR_compare(name,length,'TOBLCONTROL3B',13)=0 THEN
  R:=49;
IF STR_compare(name,length,'TNOCONTROL3',11)=0 THEN
  R:=50;
IF STR_compare(name,length,'TNOCONTROL3ID',13)=0 THEN
  R:=51;
IF STR_compare(name,length,'TOBLCONTROL7A',13)=0 THEN
  R:=52;
IF STR_compare(name,length,'TOBLCONTROL7B',13)=0 THEN
  R:=53;
IF STR_compare(name,length,'TNOCONTROL7',11)=0 THEN
  R:=54;
IF STR_compare(name,length,'TOBLCONTROL4A',13)=0 THEN
  R:=55;
IF STR_compare(name,length,'TOBLCONTROL4B',13)=0 THEN
  R:=56;
IF STR_compare(name,length,'TNOCONTROL4',11)=0 THEN
  R:=57;
IF STR_compare(name,length,'TNOCONTROL4ID',13)=0 THEN
  R:=58;
IF STR_compare(name,length,'TOBLCONTROL5A',13)=0 THEN
  R:=59;
IF STR_compare(name,length,'TOBLCONTROL5B',13)=0 THEN
  R:=60;
IF STR_compare(name,length,'TNOCONTROL5',11)=0 THEN
  R:=61;
IF STR_compare(name,length,'TOBLCONTROL6A',13)=0 THEN
  R:=62;
IF STR_compare(name,length,'TOBLCONTROL6B',13)=0 THEN
  R:=63;
IF STR_compare(name,length,'TOBLCONTROL6C',13)=0 THEN
  R:=64;
IF STR_compare(name,length,'TOBLCONTROL5A1',14)=0 THEN
  R:=65;
IF STR_compare(name,length,'TOBLCONTROL5B1',14)=0 THEN
  R:=66;
IF STR_compare(name,length,'TNOCONTROL51',12)=0 THEN
  R:=67;
IF STR_compare(name,length,'TCASEASSIGNMENT1',16)=0 THEN
  R:=68;
IF STR_compare(name,length,'TCASEASSIGNMENT2',16)=0 THEN
  R:=69;
IF STR_compare(name,length,'TCASEASSIGNMENT3',16)=0 THEN
  R:=70;
IF STR_compare(name,length,'TCASEASSIGNMENT4',16)=0 THEN
  R:=71;
IF STR_compare(name,length,'TCASEASSIGNMENT5',16)=0 THEN
  R:=72;
IF STR_compare(name,length,'TCASEASSIGNMENT6',16)=0 THEN
  R:=73;
IF STR_compare(name,length,'TIMPERCLMOVE',12)=0 THEN
  R:=74;
IF STR_compare(name,length,'VCLUSTERING1',12)=0 THEN
  R:=75;
IF STR_compare(name,length,'VCLUSTERING2',12)=0 THEN
  R:=76;
IF STR_compare(name,length,'TCLINFPTCPASCLIMBING',20)=0 THEN
  R:=77;
IF STR_compare(name,length,'TNOCOMPLSENT',12)=0 THEN
  R:=78;
IF STR_compare(name,length,'TEXTRAPOSFINSENT',16)=0 THEN
  R:=79;
IF STR_compare(name,length,'TEXTRAPOSPREPFINSENT',20)=0 THEN
  R:=80;
IF STR_compare(name,length,'TNOCLUSTERING',13)=0 THEN
  R:=81;
IF STR_compare(name,length,'TVERBRAISING',12)=0 THEN
  R:=82;
IF STR_compare(name,length,'TPREPVERBRAISING',16)=0 THEN
  R:=83;
IF STR_compare(name,length,'TRESTRUCTURING1',15)=0 THEN
  R:=84;
IF STR_compare(name,length,'TVPDEL',6)=0 THEN
  R:=85;
IF STR_compare(name,length,'TVPDEL2',7)=0 THEN
  R:=86;
IF STR_compare(name,length,'TCLDEL1',7)=0 THEN
  R:=87;
IF STR_compare(name,length,'TCLDEL2',7)=0 THEN
  R:=88;
IF STR_compare(name,length,'TVPDEL3',7)=0 THEN
  R:=89;
IF STR_compare(name,length,'TAGLUEEL',8)=0 THEN
  R:=90;
IF STR_compare(name,length,'TAGLUEEL2',9)=0 THEN
  R:=91;
IF STR_compare(name,length,'TADEGLUEEL',10)=0 THEN
  R:=92;
IF STR_compare(name,length,'TADEGLUEEL2',11)=0 THEN
  R:=93;
IF STR_compare(name,length,'TCONGLUEMITI',12)=0 THEN
  R:=94;
IF STR_compare(name,length,'TCONGLUEMITI2',13)=0 THEN
  R:=95;
IF STR_compare(name,length,'TVERBPATTERN0',13)=0 THEN
  R:=96;
IF STR_compare(name,length,'TVERBPATTERN1',13)=0 THEN
  R:=97;
IF STR_compare(name,length,'TIDVERBPATTERN',14)=0 THEN
  R:=98;
IF STR_compare(name,length,'TVERBPATTERN3',13)=0 THEN
  R:=99;
IF STR_compare(name,length,'TVERBPATTERN4',13)=0 THEN
  R:=100;
IF STR_compare(name,length,'TVERBPATTERN5',13)=0 THEN
  R:=101;
IF STR_compare(name,length,'TVERBPATTERN6',13)=0 THEN
  R:=102;
IF STR_compare(name,length,'TVERBPATTERN7',13)=0 THEN
  R:=103;
IF STR_compare(name,length,'TVERBPATTERN8',13)=0 THEN
  R:=104;
IF STR_compare(name,length,'TVERBPATTERN10',14)=0 THEN
  R:=105;
IF STR_compare(name,length,'TVERBPATTERN11',14)=0 THEN
  R:=106;
IF STR_compare(name,length,'TVERBPATTERN12',14)=0 THEN
  R:=107;
IF STR_compare(name,length,'TAKTACTIVITY1',13)=0 THEN
  R:=108;
IF STR_compare(name,length,'TAKTACTIVITY2',13)=0 THEN
  R:=109;
IF STR_compare(name,length,'TAKTACTIVITY3',13)=0 THEN
  R:=110;
IF STR_compare(name,length,'TAKTACTIVITY4',13)=0 THEN
  R:=111;
IF STR_compare(name,length,'TAKTACTIVITY5',13)=0 THEN
  R:=112;
IF STR_compare(name,length,'TAKTACTIVITY6',13)=0 THEN
  R:=113;
IF STR_compare(name,length,'TAKTACCOMPLISHMENT1',19)=0 THEN
  R:=114;
IF STR_compare(name,length,'TAKTACCOMPLISHMENT2',19)=0 THEN
  R:=115;
IF STR_compare(name,length,'TAKTACCOMPLISHMENT3',19)=0 THEN
  R:=116;
IF STR_compare(name,length,'TAKTACHIEVEMENT1',16)=0 THEN
  R:=117;
IF STR_compare(name,length,'TAKTSTATIVE1',12)=0 THEN
  R:=118;
IF STR_compare(name,length,'TFINITE',7)=0 THEN
  R:=119;
IF STR_compare(name,length,'TINFINITE',9)=0 THEN
  R:=120;
IF STR_compare(name,length,'TASPECTNEUTRALIZATION',21)=0 THEN
  R:=121;
IF STR_compare(name,length,'TRETRONEUTRALIZATION',20)=0 THEN
  R:=122;
IF STR_compare(name,length,'TTEMPREFTOSHIFT',15)=0 THEN
  R:=123;
IF STR_compare(name,length,'TTEMPCONJSENTADAPTATION',23)=0 THEN
  R:=124;
IF STR_compare(name,length,'TNOSUPERDEIXISADAPTATION',24)=0 THEN
  R:=125;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION1A',24)=0 THEN
  R:=126;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION1B',24)=0 THEN
  R:=127;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION2',23)=0 THEN
  R:=128;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION5',23)=0 THEN
  R:=129;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION8',23)=0 THEN
  R:=130;
IF STR_compare(name,length,'TDEIXISRETROADAPTATION1',23)=0 THEN
  R:=131;
IF STR_compare(name,length,'TREFDELETION',12)=0 THEN
  R:=132;
IF STR_compare(name,length,'TRETRODELETION',14)=0 THEN
  R:=133;
IF STR_compare(name,length,'TADJAKTSTATIVE1',15)=0 THEN
  R:=134;
IF STR_compare(name,length,'TADJASPECTNEUTRALISATION',24)=0 THEN
  R:=135;
IF STR_compare(name,length,'TADJSUPERDEIXISADAPTATION1',26)=0 THEN
  R:=136;
IF STR_compare(name,length,'TADJSUPERDEIXISADAPTATION2',26)=0 THEN
  R:=137;
IF STR_compare(name,length,'TADJNOSUPERDEIXISADAPTATION',27)=0 THEN
  R:=138;
IF STR_compare(name,length,'TADVPATTERN0',12)=0 THEN
  R:=139;
IF STR_compare(name,length,'TADVPATTERN1',12)=0 THEN
  R:=140;
IF STR_compare(name,length,'TADVPPPROSUBJECT',16)=0 THEN
  R:=141;
IF STR_compare(name,length,'TADVASPECTNEUTRALISATION',24)=0 THEN
  R:=142;
IF STR_compare(name,length,'TADVPNOMCASEASSIGNMENT',22)=0 THEN
  R:=143;
IF STR_compare(name,length,'T2CLGLUEINF',11)=0 THEN
  R:=144;
IF STR_compare(name,length,'T3CLGLUEINF',11)=0 THEN
  R:=145;
IF STR_compare(name,length,'T4CLGLUEINF',11)=0 THEN
  R:=146;
IF STR_compare(name,length,'TAUXGLUECLPTC',13)=0 THEN
  R:=147;
IF STR_compare(name,length,'T2CLAUXPTC',10)=0 THEN
  R:=148;
IF STR_compare(name,length,'T3CLAUXPTC',10)=0 THEN
  R:=149;
IF STR_compare(name,length,'T4CLAUXPTC',10)=0 THEN
  R:=150;
IF STR_compare(name,length,'TINFGLUECL',10)=0 THEN
  R:=151;
IF STR_compare(name,length,'T1CLGLUEIMP',11)=0 THEN
  R:=152;
IF STR_compare(name,length,'T2CLGLUEIMP',11)=0 THEN
  R:=153;
IF STR_compare(name,length,'T3CLGLUEIMP',11)=0 THEN
  R:=154;
IF STR_compare(name,length,'T4CLGLUEIMP',11)=0 THEN
  R:=155;
IF STR_compare(name,length,'TPREPPPROPOVERIO',16)=0 THEN
  R:=156;
IF STR_compare(name,length,'TPROSUBJDEL',11)=0 THEN
  R:=157;
IF STR_compare(name,length,'TREDELLOSUBJDEL',15)=0 THEN
  R:=158;
IF STR_compare(name,length,'TPRONPVARDEL',12)=0 THEN
  R:=159;
IF STR_compare(name,length,'TSEPASSPERSPROOBJDEL',20)=0 THEN
  R:=160;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION3',23)=0 THEN
  R:=161;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION4',23)=0 THEN
  R:=162;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION6',23)=0 THEN
  R:=163;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION7',23)=0 THEN
  R:=164;
IF STR_compare(name,length,'TIDSUPERDEIXISADAPTATION',24)=0 THEN
  R:=165;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION10',24)=0 THEN
  R:=166;
IF STR_compare(name,length,'TYINSERTION',11)=0 THEN
  R:=167;
IF STR_compare(name,length,'TACASE',6)=0 THEN
  R:=168;
IF STR_compare(name,length,'TACASECAUSAT',12)=0 THEN
  R:=169;
IF STR_compare(name,length,'TAINSERTION',11)=0 THEN
  R:=170;
IF STR_compare(name,length,'TAINSERTION2',12)=0 THEN
  R:=171;
IF STR_compare(name,length,'TADJAGREEMENT',13)=0 THEN
  R:=172;
IF STR_compare(name,length,'TADJPATTERN0',12)=0 THEN
  R:=173;
IF STR_compare(name,length,'TADJPATTERN12A',14)=0 THEN
  R:=174;
IF STR_compare(name,length,'TADJPATTERN12B',14)=0 THEN
  R:=175;
IF STR_compare(name,length,'TADJPATTERN14',13)=0 THEN
  R:=176;
IF STR_compare(name,length,'TADJPATTERN16',13)=0 THEN
  R:=177;
IF STR_compare(name,length,'TADJPATTERN18A',14)=0 THEN
  R:=178;
IF STR_compare(name,length,'TADJPATTERN18B',14)=0 THEN
  R:=179;
IF STR_compare(name,length,'TADJCASEASSIGNMENT1',19)=0 THEN
  R:=180;
IF STR_compare(name,length,'TADJCASEASSIGNMENT2',19)=0 THEN
  R:=181;
IF STR_compare(name,length,'TADJCOMPLEXTRAPOS',17)=0 THEN
  R:=182;
IF STR_compare(name,length,'TSESPELLING',11)=0 THEN
  R:=183;
IF STR_compare(name,length,'TSESPELLINGCLPASSIVE',20)=0 THEN
  R:=184;
IF STR_compare(name,length,'TSESPELLINGPASSIVE',18)=0 THEN
  R:=185;
IF STR_compare(name,length,'TUNOSPELLING',12)=0 THEN
  R:=186;
IF STR_compare(name,length,'TEMPTYSESPELLING',16)=0 THEN
  R:=187;
IF STR_compare(name,length,'TNPCNDELETION1',14)=0 THEN
  R:=188;
IF STR_compare(name,length,'TNPCNDELETION2',14)=0 THEN
  R:=189;
IF STR_compare(name,length,'TNPQPCOMPLEXTRAPOS',18)=0 THEN
  R:=190;
IF STR_compare(name,length,'TNPENDELETION1',14)=0 THEN
  R:=191;
IF STR_compare(name,length,'TNPENDELETION2',14)=0 THEN
  R:=192;
IF STR_compare(name,length,'TQPDELGLUE',10)=0 THEN
  R:=193;
IF STR_compare(name,length,'TQPDECOMPLCASEASSIGNMENT',24)=0 THEN
  R:=194;
IF STR_compare(name,length,'TQPNOMCASEASSIGNMENT',20)=0 THEN
  R:=195;
IF STR_compare(name,length,'TCNAPOCOPE',10)=0 THEN
  R:=196;
IF STR_compare(name,length,'TNPPNOPROSUBJ',13)=0 THEN
  R:=197;
IF STR_compare(name,length,'TNPPPROSUBJ',11)=0 THEN
  R:=198;
IF STR_compare(name,length,'TPPDELGLUE',10)=0 THEN
  R:=199;
IF STR_compare(name,length,'TRELADEGLUEEL',13)=0 THEN
  R:=200;
IF STR_compare(name,length,'TPPADEGLUEEL',12)=0 THEN
  R:=201;
IF STR_compare(name,length,'TADJSETPROSUBJECT',17)=0 THEN
  R:=202;
IF STR_compare(name,length,'TADJADEGLUEEL',13)=0 THEN
  R:=203;
IF STR_compare(name,length,'TPREPPATTERN0',13)=0 THEN
  R:=204;
IF STR_compare(name,length,'TPREPPATTERN1',13)=0 THEN
  R:=205;
IF STR_compare(name,length,'TPPCA0',6)=0 THEN
  R:=206;
IF STR_compare(name,length,'TPPCA1',6)=0 THEN
  R:=207;
IF STR_compare(name,length,'TPPPNOPROSUBJ',13)=0 THEN
  R:=208;
IF STR_compare(name,length,'TPPPPROSUBJ',11)=0 THEN
  R:=209;
IF STR_compare(name,length,'TPPPASPECTNEUTRALIZATION',24)=0 THEN
  R:=210;
IF STR_compare(name,length,'TWHSHIFT1A',10)=0 THEN
  R:=211;
IF STR_compare(name,length,'TWHSHIFT1B',10)=0 THEN
  R:=212;
IF STR_compare(name,length,'TWHSHIFT0',9)=0 THEN
  R:=213;
IF STR_compare(name,length,'TWHSHIFT2',9)=0 THEN
  R:=214;
IF STR_compare(name,length,'TPPPREPPATTERN0',15)=0 THEN
  R:=215;
IF STR_compare(name,length,'TPPPREPPATTERN1',15)=0 THEN
  R:=216;
IF STR_compare(name,length,'TPREPPCA0',9)=0 THEN
  R:=217;
IF STR_compare(name,length,'TPREPPCA1',9)=0 THEN
  R:=218;
IF STR_compare(name,length,'TPREPPCA2',9)=0 THEN
  R:=219;
IF STR_compare(name,length,'TPPTOVARPP0',11)=0 THEN
  R:=220;
IF STR_compare(name,length,'TPPTOVARPP1',11)=0 THEN
  R:=221;
IF STR_compare(name,length,'TPROSTATUS1',11)=0 THEN
  R:=222;
IF STR_compare(name,length,'TPRONIODEL',10)=0 THEN
  R:=223;
IF STR_compare(name,length,'TPRONIODEL2',11)=0 THEN
  R:=224;
IF STR_compare(name,length,'TPOSTPROSUBJDEL',15)=0 THEN
  R:=225;
IF STR_compare(name,length,'TDOCLMINUSPERSPRO2',18)=0 THEN
  R:=226;
IF STR_compare(name,length,'TDOCLMINUSPERSPRO',17)=0 THEN
  R:=227;
IF STR_compare(name,length,'TIOCLCAMBIOSEPLUS',17)=0 THEN
  R:=228;
IF STR_compare(name,length,'TIOCLCAMBIOSEPLUS2',18)=0 THEN
  R:=229;
IF STR_compare(name,length,'TIOCLCAMBIOSEMINUS',18)=0 THEN
  R:=230;
IF STR_compare(name,length,'TIOCLCAMBIOSEMINUS2',19)=0 THEN
  R:=231;
IF STR_compare(name,length,'TVRCOMPLSETTING',15)=0 THEN
  R:=232;
IF STR_compare(name,length,'TINVERSION1',11)=0 THEN
  R:=233;
IF STR_compare(name,length,'TINVERSION2',11)=0 THEN
  R:=234;
IF STR_compare(name,length,'TINVERSION3',11)=0 THEN
  R:=235;
IF STR_compare(name,length,'TINVERSION4',11)=0 THEN
  R:=236;
IF STR_compare(name,length,'TFINCONTROL1',12)=0 THEN
  R:=237;
IF STR_compare(name,length,'TFINCONTROL0',12)=0 THEN
  R:=238;
IF STR_compare(name,length,'TFINCONTROL2',12)=0 THEN
  R:=239;
IF STR_compare(name,length,'TFINCONTROL3',12)=0 THEN
  R:=240;
IF STR_compare(name,length,'TADVCONTROL1',12)=0 THEN
  R:=241;
IF STR_compare(name,length,'TADVCONTROL2',12)=0 THEN
  R:=242;
IF STR_compare(name,length,'TOBJTOOBJCONTROL',16)=0 THEN
  R:=243;
IF STR_compare(name,length,'TNEGDEL1',8)=0 THEN
  R:=244;
IF STR_compare(name,length,'TARGREFLSPELLING1',17)=0 THEN
  R:=245;
IF STR_compare(name,length,'TPRONIODELINF',13)=0 THEN
  R:=246;
IF STR_compare(name,length,'TPRONIODEL2INF',14)=0 THEN
  R:=247;
IF STR_compare(name,length,'TDOCLMINPERSMINIOCL2',20)=0 THEN
  R:=248;
IF STR_compare(name,length,'TDOCLMINPERSMINIOCL',19)=0 THEN
  R:=249;
IF STR_compare(name,length,'TIDCLAUSETOVPPROP',17)=0 THEN
  R:=250;
IF STR_compare(name,length,'TIDVPPROPTOCLAUSE',17)=0 THEN
  R:=251;
IF STR_compare(name,length,'TISIDIOM',8)=0 THEN
  R:=252;
IF STR_compare(name,length,'TISNOTIDIOM',11)=0 THEN
  R:=253;
IF STR_compare(name,length,'TSESPELLING1',12)=0 THEN
  R:=254;
IF STR_compare(name,length,'TSESPELLING2',12)=0 THEN
  R:=255;
IF STR_compare(name,length,'TSESPELLING3',12)=0 THEN
  R:=256;
IF STR_compare(name,length,'TSESPELLING4',12)=0 THEN
  R:=257;
IF STR_compare(name,length,'TSESPELLING5',12)=0 THEN
  R:=258;
IF STR_compare(name,length,'TSESPELLING6',12)=0 THEN
  R:=259;
IF STR_compare(name,length,'THABERQUESUBJDEL',16)=0 THEN
  R:=260;
IF STR_compare(name,length,'FADJAGR',7)=0 THEN
  R:=261;
IF STR_compare(name,length,'FPTCPASAGR1',11)=0 THEN
  R:=262;
IF STR_compare(name,length,'FPTCPASAGR2',11)=0 THEN
  R:=263;
IF STR_compare(name,length,'FPOSTCASEASSIGNMENT1',20)=0 THEN
  R:=264;
IF STR_compare(name,length,'FPOSTCASEASSIGNMENT2',20)=0 THEN
  R:=265;
IF STR_compare(name,length,'FPOSTCASEASSIGNMENT3',20)=0 THEN
  R:=266;
IF STR_compare(name,length,'FPOSTCASEASSIGNMENT4',20)=0 THEN
  R:=267;
IF STR_compare(name,length,'FPOSTCASEASSIGNMENT5',20)=0 THEN
  R:=268;
IF STR_compare(name,length,'FPOSTCASEASSIGNMENT6',20)=0 THEN
  R:=269;
IF STR_compare(name,length,'FIMPERCLMOVE',12)=0 THEN
  R:=270;
IF STR_compare(name,length,'FVPDEL',6)=0 THEN
  R:=271;
IF STR_compare(name,length,'FVPDEL2',7)=0 THEN
  R:=272;
IF STR_compare(name,length,'FCLDEL1',7)=0 THEN
  R:=273;
IF STR_compare(name,length,'FCLDEL2',7)=0 THEN
  R:=274;
IF STR_compare(name,length,'FVPDEL3',7)=0 THEN
  R:=275;
IF STR_compare(name,length,'FAGLUEEL',8)=0 THEN
  R:=276;
IF STR_compare(name,length,'FAGLUEEL2',9)=0 THEN
  R:=277;
IF STR_compare(name,length,'FADEGLUEEL',10)=0 THEN
  R:=278;
IF STR_compare(name,length,'FADEGLUEEL2',11)=0 THEN
  R:=279;
IF STR_compare(name,length,'FCONGLUEMITI',12)=0 THEN
  R:=280;
IF STR_compare(name,length,'FCONGLUEMITI2',13)=0 THEN
  R:=281;
IF STR_compare(name,length,'FRETRONEUTRALIZATION',20)=0 THEN
  R:=282;
IF STR_compare(name,length,'FTEMPREFTOSHIFT',15)=0 THEN
  R:=283;
IF STR_compare(name,length,'FPOSTTEMPCONJSENTADAPTATION',27)=0 THEN
  R:=284;
IF STR_compare(name,length,'FPRETEMPCONJSENTADAPTATION',26)=0 THEN
  R:=285;
IF STR_compare(name,length,'FPRETEMPCONJSENTMOVETOLEFT',26)=0 THEN
  R:=286;
IF STR_compare(name,length,'FSUPERDEIXISADAPTATION8',23)=0 THEN
  R:=287;
IF STR_compare(name,length,'FTEMPINDEP1',11)=0 THEN
  R:=288;
IF STR_compare(name,length,'FDEIXISRETROADAPTATION1',23)=0 THEN
  R:=289;
IF STR_compare(name,length,'FREFDELETION',12)=0 THEN
  R:=290;
IF STR_compare(name,length,'FRETRODELETION',14)=0 THEN
  R:=291;
IF STR_compare(name,length,'FADJSUPERDEIXISADAPTATION2',26)=0 THEN
  R:=292;
IF STR_compare(name,length,'FADVPPPREPROSUBJECT',19)=0 THEN
  R:=293;
IF STR_compare(name,length,'FPRECOORDINTRO',14)=0 THEN
  R:=294;
IF STR_compare(name,length,'F2CLGLUEINF',11)=0 THEN
  R:=295;
IF STR_compare(name,length,'F3CLGLUEINF',11)=0 THEN
  R:=296;
IF STR_compare(name,length,'F4CLGLUEINF',11)=0 THEN
  R:=297;
IF STR_compare(name,length,'FAUXGLUECLPTC',13)=0 THEN
  R:=298;
IF STR_compare(name,length,'F2CLAUXPTC',10)=0 THEN
  R:=299;
IF STR_compare(name,length,'F3CLAUXPTC',10)=0 THEN
  R:=300;
IF STR_compare(name,length,'F4CLAUXPTC',10)=0 THEN
  R:=301;
IF STR_compare(name,length,'FINFGLUECL',10)=0 THEN
  R:=302;
IF STR_compare(name,length,'F1CLGLUEIMP',11)=0 THEN
  R:=303;
IF STR_compare(name,length,'F2CLGLUEIMP',11)=0 THEN
  R:=304;
IF STR_compare(name,length,'F3CLGLUEIMP',11)=0 THEN
  R:=305;
IF STR_compare(name,length,'F4CLGLUEIMP',11)=0 THEN
  R:=306;
IF STR_compare(name,length,'FPREPPPROPOVERIO',16)=0 THEN
  R:=307;
IF STR_compare(name,length,'FPROSUBJDEL',11)=0 THEN
  R:=308;
IF STR_compare(name,length,'FREDELLOSUBJDEL',15)=0 THEN
  R:=309;
IF STR_compare(name,length,'FPRONPVARDEL',12)=0 THEN
  R:=310;
IF STR_compare(name,length,'FSEPASSPERSPROOBJDEL',20)=0 THEN
  R:=311;
IF STR_compare(name,length,'FSUPERDEIXISADAPTATION7',23)=0 THEN
  R:=312;
IF STR_compare(name,length,'FSUPERDEIXISADAPTATION10',24)=0 THEN
  R:=313;
IF STR_compare(name,length,'FPOSTYINSERTION',15)=0 THEN
  R:=314;
IF STR_compare(name,length,'FACASE',6)=0 THEN
  R:=315;
IF STR_compare(name,length,'FACASECAUSAT',12)=0 THEN
  R:=316;
IF STR_compare(name,length,'FAINSERTION',11)=0 THEN
  R:=317;
IF STR_compare(name,length,'FAINSERTION2',12)=0 THEN
  R:=318;
IF STR_compare(name,length,'FADJAGREEMENT',13)=0 THEN
  R:=319;
IF STR_compare(name,length,'FADJPOSTCASEASSIGNMENT1',23)=0 THEN
  R:=320;
IF STR_compare(name,length,'FADJPOSTCASEASSIGNMENT2',23)=0 THEN
  R:=321;
IF STR_compare(name,length,'FADJPRECASEASSIGNMENT1',22)=0 THEN
  R:=322;
IF STR_compare(name,length,'FADJPRECASEASSIGNMENT2',22)=0 THEN
  R:=323;
IF STR_compare(name,length,'FADJPOSTCOMPLEXTRAPOS',21)=0 THEN
  R:=324;
IF STR_compare(name,length,'FADJPRECOMPLEXTRAPOS',20)=0 THEN
  R:=325;
IF STR_compare(name,length,'FSESPELLING',11)=0 THEN
  R:=326;
IF STR_compare(name,length,'FSESPELLINGCLPASSIVE',20)=0 THEN
  R:=327;
IF STR_compare(name,length,'FSESPELLINGPASSIVE',18)=0 THEN
  R:=328;
IF STR_compare(name,length,'FUNOSPELLING',12)=0 THEN
  R:=329;
IF STR_compare(name,length,'FEMPTYSESPELLING',16)=0 THEN
  R:=330;
IF STR_compare(name,length,'FPOSTNPCNDELETION1',18)=0 THEN
  R:=331;
IF STR_compare(name,length,'FPOSTNPCNDELETION2',18)=0 THEN
  R:=332;
IF STR_compare(name,length,'FPRENPQPCOMPLEXTRAPOS',21)=0 THEN
  R:=333;
IF STR_compare(name,length,'FPOSTNPQPCOMPLEXTRAPOS',22)=0 THEN
  R:=334;
IF STR_compare(name,length,'FNPPOSTENDELETION',17)=0 THEN
  R:=335;
IF STR_compare(name,length,'FNPPREENDELETION',16)=0 THEN
  R:=336;
IF STR_compare(name,length,'FQPDELGLUE',10)=0 THEN
  R:=337;
IF STR_compare(name,length,'FPOSTCNAPOCOPE',14)=0 THEN
  R:=338;
IF STR_compare(name,length,'FPPDELGLUE',10)=0 THEN
  R:=339;
IF STR_compare(name,length,'FRELADEGLUEEL',13)=0 THEN
  R:=340;
IF STR_compare(name,length,'FPPADEGLUEEL',12)=0 THEN
  R:=341;
IF STR_compare(name,length,'FESOESTO',8)=0 THEN
  R:=342;
IF STR_compare(name,length,'FADJADEGLUEEL',13)=0 THEN
  R:=343;
IF STR_compare(name,length,'FPOSTPROSUBJDEL',15)=0 THEN
  R:=344;
IF STR_compare(name,length,'FDOCLPLUSPERSPRO',16)=0 THEN
  R:=345;
IF STR_compare(name,length,'FDOCLMINUSPERSPRO',17)=0 THEN
  R:=346;
IF STR_compare(name,length,'FDOCLMINUSPERSPRO2',18)=0 THEN
  R:=347;
IF STR_compare(name,length,'FDOCLMINPERSMINIOCL',19)=0 THEN
  R:=348;
IF STR_compare(name,length,'FDOCLMINPERSMINIOCL2',20)=0 THEN
  R:=349;
IF STR_compare(name,length,'FIOCLCAMBIOSEPLUS',17)=0 THEN
  R:=350;
IF STR_compare(name,length,'FIOCLCAMBIOSEMINUS',18)=0 THEN
  R:=351;
IF STR_compare(name,length,'FIOCLCAMBIOSEPLUS2',18)=0 THEN
  R:=352;
IF STR_compare(name,length,'FIOCLCAMBIOSEMINUS2',19)=0 THEN
  R:=353;
IF STR_compare(name,length,'FDOCLPLUSPERSPRO2',17)=0 THEN
  R:=354;
IF STR_compare(name,length,'FADVCONTROL',11)=0 THEN
  R:=355;
IF STR_compare(name,length,'FPREADVCONTROL',14)=0 THEN
  R:=356;
IF STR_compare(name,length,'FOBJTOOBJCONTROL',16)=0 THEN
  R:=357;
IF STR_compare(name,length,'FNEGDEL1',8)=0 THEN
  R:=358;
IF STR_compare(name,length,'FARGREFLSPELLING1',17)=0 THEN
  R:=359;
IF STR_compare(name,length,'FPRONIODEL',10)=0 THEN
  R:=360;
IF STR_compare(name,length,'FPRONIODEL2',11)=0 THEN
  R:=361;
IF STR_compare(name,length,'FPRONIODELINF',13)=0 THEN
  R:=362;
IF STR_compare(name,length,'FPRONIODEL2INF',14)=0 THEN
  R:=363;
IF STR_compare(name,length,'FSESPELLING1',12)=0 THEN
  R:=364;
IF STR_compare(name,length,'FSESPELLING2',12)=0 THEN
  R:=365;
IF STR_compare(name,length,'FSESPELLING3',12)=0 THEN
  R:=366;
IF STR_compare(name,length,'FSESPELLING4',12)=0 THEN
  R:=367;
IF STR_compare(name,length,'FSESPELLING5',12)=0 THEN
  R:=368;
IF STR_compare(name,length,'FSESPELLING6',12)=0 THEN
  R:=369;
IF STR_compare(name,length,'FHABERQUESUBJDEL',16)=0 THEN
  R:=370;
END;
 PROCEDURE LDMrules_Rulename(sg:LDMrules_subgrammarindex;R:LDMrules_ruleindex;
VAR name:string;VAR length:INTEGER);
BEGIN
CASE R OF
1: BEGIN name:='ERRORRULE';
    length:=9 END;
2: BEGIN name:='RBVERBTOSUB';
    length:=11 END;
3: BEGIN name:='RSIDSTARTVPPROP120';
    length:=18 END;
4: BEGIN name:='RSIDSTARTVPPROP123';
    length:=18 END;
5: BEGIN name:='RSTARTVPPROP000';
    length:=15 END;
6: BEGIN name:='RSTARTVPPROP100';
    length:=15 END;
7: BEGIN name:='RSTARTVPPROP010A';
    length:=16 END;
8: BEGIN name:='RSTARTVPPROP010B';
    length:=16 END;
9: BEGIN name:='RSTARTVPPROP120';
    length:=15 END;
10: BEGIN name:='RSTARTVPPROP012';
    length:=15 END;
11: BEGIN name:='RSTARTVPPROP021';
    length:=15 END;
12: BEGIN name:='RSTARTVPPROP123';
    length:=15 END;
13: BEGIN name:='RSTARTVPPROP312';
    length:=15 END;
14: BEGIN name:='RSTARTVPPROP321';
    length:=15 END;
15: BEGIN name:='RSTARTVPPROP210';
    length:=15 END;
16: BEGIN name:='RSTARTVPPROP132';
    length:=15 END;
17: BEGIN name:='RIDENTFORMATIONESTO';
    length:=19 END;
18: BEGIN name:='RIDENTFORMATIONESO1';
    length:=19 END;
19: BEGIN name:='RIDENTFORMATIONESO2';
    length:=19 END;
20: BEGIN name:='RPERSPROIDENT';
    length:=13 END;
21: BEGIN name:='RSENTIDENT';
    length:=10 END;
22: BEGIN name:='RDEMPROWHIDENTSG';
    length:=16 END;
23: BEGIN name:='RDEMPROWHIDENTPL';
    length:=16 END;
24: BEGIN name:='RIDENTREFVARINSERT';
    length:=18 END;
25: BEGIN name:='RIDENTCONJSENTVAR';
    length:=17 END;
26: BEGIN name:='RIDENTFINALCONJSENTVAR';
    length:=22 END;
27: BEGIN name:='RIDENTLOCADVVAR';
    length:=15 END;
28: BEGIN name:='RIDENTLOCPREPPVAR';
    length:=17 END;
29: BEGIN name:='RIDENTSADVVAR';
    length:=13 END;
30: BEGIN name:='RIDENTSPREPPVAR';
    length:=15 END;
31: BEGIN name:='RSTARTEXISTENTIAL1';
    length:=18 END;
32: BEGIN name:='REXISTREFVARINSERTION';
    length:=21 END;
33: BEGIN name:='REXISTCONJSENTVAR';
    length:=17 END;
34: BEGIN name:='REXISTFINALCONJSENTVAR';
    length:=22 END;
35: BEGIN name:='REXISTLOCADVVAR';
    length:=15 END;
36: BEGIN name:='REXISTLOCPREPPVAR';
    length:=17 END;
37: BEGIN name:='REXISTSADVVAR';
    length:=13 END;
38: BEGIN name:='REXISTSPREPPVAR';
    length:=15 END;
39: BEGIN name:='RACTIVE';
    length:=7 END;
40: BEGIN name:='RSEACTIVE1';
    length:=10 END;
41: BEGIN name:='RSEACTIVE2';
    length:=10 END;
42: BEGIN name:='RSEACTIVE3';
    length:=10 END;
43: BEGIN name:='RSEPASSIVE';
    length:=10 END;
44: BEGIN name:='RPASSIVE';
    length:=8 END;
45: BEGIN name:='RPREPPVARINVP';
    length:=13 END;
46: BEGIN name:='RLOCADVVAR';
    length:=10 END;
47: BEGIN name:='RLOCPREPPVAR';
    length:=12 END;
48: BEGIN name:='RSADVVAR';
    length:=8 END;
49: BEGIN name:='RSPREPPVAR';
    length:=10 END;
50: BEGIN name:='RCONJSVAR';
    length:=9 END;
51: BEGIN name:='RFINCONJSVAR';
    length:=12 END;
52: BEGIN name:='RPPPLOCADVVAR';
    length:=13 END;
53: BEGIN name:='RADVPPLOCADVVAR';
    length:=15 END;
54: BEGIN name:='RPPPLOCPREPPVAR';
    length:=15 END;
55: BEGIN name:='RADVPPLOCPREPPVAR';
    length:=17 END;
56: BEGIN name:='RPPPSADVVAR';
    length:=11 END;
57: BEGIN name:='RADVPPSADVVAR';
    length:=13 END;
58: BEGIN name:='RPPPSPREPPVAR';
    length:=13 END;
59: BEGIN name:='RADVPPSPREPPVAR';
    length:=15 END;
60: BEGIN name:='RADJLOCADVVAR';
    length:=13 END;
61: BEGIN name:='RADJLOCPREPPVAR';
    length:=15 END;
62: BEGIN name:='RADJSADVVAR';
    length:=11 END;
63: BEGIN name:='RADJSPREPPVAR';
    length:=13 END;
64: BEGIN name:='RPPPCONJSVAR';
    length:=12 END;
65: BEGIN name:='RPPPFINCONJSVAR';
    length:=15 END;
66: BEGIN name:='RADVPPCONJSVAR';
    length:=14 END;
67: BEGIN name:='RADVPPFINCONJSVAR';
    length:=17 END;
68: BEGIN name:='RNPPLOCADVVAR';
    length:=13 END;
69: BEGIN name:='RNPPLOCPREPPVAR';
    length:=15 END;
70: BEGIN name:='RNPPSADVVAR';
    length:=11 END;
71: BEGIN name:='RNPPSPREPPVAR';
    length:=13 END;
72: BEGIN name:='RNPPCONJSVAR';
    length:=12 END;
73: BEGIN name:='RNPPFINCONJSVAR';
    length:=15 END;
74: BEGIN name:='RSINGLECARD';
    length:=11 END;
75: BEGIN name:='RCOMPOSEDCARD';
    length:=13 END;
76: BEGIN name:='RCARDTONP';
    length:=9 END;
77: BEGIN name:='RCARDTODETP';
    length:=11 END;
78: BEGIN name:='RPRNTONP';
    length:=8 END;
79: BEGIN name:='RMONTHYEAR';
    length:=10 END;
80: BEGIN name:='RDAYMONTH';
    length:=9 END;
81: BEGIN name:='RWEEKDATUM';
    length:=10 END;
82: BEGIN name:='RDAYNUMBER';
    length:=10 END;
83: BEGIN name:='RVPADV';
    length:=6 END;
84: BEGIN name:='RAGVPADV1';
    length:=9 END;
85: BEGIN name:='RAGVPADV2';
    length:=9 END;
86: BEGIN name:='RAGVPADV3';
    length:=9 END;
87: BEGIN name:='RCLAUSEFORMATION1';
    length:=17 END;
88: BEGIN name:='RCLAUSEFORMATION2';
    length:=17 END;
89: BEGIN name:='RCLAUSEFORMATION3A';
    length:=18 END;
90: BEGIN name:='RCLAUSEFORMATION3B';
    length:=18 END;
91: BEGIN name:='RCLAUSEFORMATION4';
    length:=17 END;
92: BEGIN name:='RCLAUSEFORMATION5';
    length:=17 END;
93: BEGIN name:='RCLAUSEFORMATION6A';
    length:=18 END;
94: BEGIN name:='RCLAUSEFORMATION6B';
    length:=18 END;
95: BEGIN name:='RCLAUSEFORMATION7A';
    length:=18 END;
96: BEGIN name:='RCLAUSEFORMATION7B';
    length:=18 END;
97: BEGIN name:='ROPENADJPPROPSUBSTITUTION';
    length:=25 END;
98: BEGIN name:='RCLOSEDADJPPROPSUBSTITUTION';
    length:=27 END;
99: BEGIN name:='ROPENADVPPROPSUBSTITUTION';
    length:=25 END;
100: BEGIN name:='RCLOSEDADVPPROPSUBSTITUTION';
    length:=27 END;
101: BEGIN name:='ROPENNPPROPSUBSTITUTION';
    length:=23 END;
102: BEGIN name:='RCLOSEDNPPROPSUBSTITUTION';
    length:=25 END;
103: BEGIN name:='RLOPREPPPROPSUBSTITUTION';
    length:=24 END;
104: BEGIN name:='RLCPREPPPROPSUBSTITUTION';
    length:=24 END;
105: BEGIN name:='RDOPREPPPROPSUBSTITUTION';
    length:=24 END;
106: BEGIN name:='RDCPREPPPROPSUBSTITUTION';
    length:=24 END;
107: BEGIN name:='ROCPREPPPROPSUBSTITUTION';
    length:=24 END;
108: BEGIN name:='RSENTENCECOMPL';
    length:=14 END;
109: BEGIN name:='ROPENADJPPROPPREPOBJ';
    length:=20 END;
110: BEGIN name:='RCLOSEDADJPPROPPREPOBJ';
    length:=22 END;
111: BEGIN name:='ROPENNPPROPPREPOBJ';
    length:=18 END;
112: BEGIN name:='RCLOSEDNPPROPPREPOBJ';
    length:=20 END;
113: BEGIN name:='RSENTENCEPREPOBJ';
    length:=16 END;
114: BEGIN name:='RSENTENCESUBJ';
    length:=13 END;
115: BEGIN name:='RSENTENCEEXTRAPOS';
    length:=17 END;
116: BEGIN name:='RSENTENCELDISLOC';
    length:=16 END;
117: BEGIN name:='ROPENADJPPROPSENTENCESUBST';
    length:=26 END;
118: BEGIN name:='REMPTYSUBSTITUTION1';
    length:=19 END;
119: BEGIN name:='REMPTYSUBSTITUTION2';
    length:=19 END;
120: BEGIN name:='REMPTYSUBSTITUTION3';
    length:=19 END;
121: BEGIN name:='REMPTYSUBSTITUTION4';
    length:=19 END;
122: BEGIN name:='REMPTYSUBSTITUTION5';
    length:=19 END;
123: BEGIN name:='REMPTYSUBSTITUTION8';
    length:=19 END;
124: BEGIN name:='REMPTYSUBSTITUTION10';
    length:=20 END;
125: BEGIN name:='RPREPEMPTYSUBST1';
    length:=16 END;
126: BEGIN name:='RDIREMPTYSUBST1';
    length:=15 END;
127: BEGIN name:='RMOODDETERMINATION';
    length:=18 END;
128: BEGIN name:='RMOOD2';
    length:=6 END;
129: BEGIN name:='RMOOD3';
    length:=6 END;
130: BEGIN name:='RMOOD4';
    length:=6 END;
131: BEGIN name:='RMOOD5';
    length:=6 END;
132: BEGIN name:='RMOOD6';
    length:=6 END;
133: BEGIN name:='RMOODFINREL';
    length:=11 END;
134: BEGIN name:='RMOODFINWHMOD';
    length:=13 END;
135: BEGIN name:='RMOODOPENINF';
    length:=12 END;
136: BEGIN name:='RMOODCLOSEDINF';
    length:=14 END;
137: BEGIN name:='RMOOD7A';
    length:=7 END;
138: BEGIN name:='RMOOD7B';
    length:=7 END;
139: BEGIN name:='RMOOD8A';
    length:=7 END;
140: BEGIN name:='RMOOD8B';
    length:=7 END;
141: BEGIN name:='RMOODPOLITEIMP';
    length:=14 END;
142: BEGIN name:='RMOODADHORT1';
    length:=12 END;
143: BEGIN name:='RMOODADHORT2';
    length:=12 END;
144: BEGIN name:='RMOODGERUNDIO';
    length:=13 END;
145: BEGIN name:='RMOODPTCPAS1';
    length:=12 END;
146: BEGIN name:='RMOODPTCPAS2';
    length:=12 END;
147: BEGIN name:='RMOOD9';
    length:=6 END;
148: BEGIN name:='RIDSUBSTITUTION1';
    length:=16 END;
149: BEGIN name:='RSUBSTITUTION1';
    length:=14 END;
150: BEGIN name:='RSUBSTITUTION2';
    length:=14 END;
151: BEGIN name:='RSUBSTITUTION3';
    length:=14 END;
152: BEGIN name:='RSUBSTITUTION4';
    length:=14 END;
153: BEGIN name:='RPREPSUBSTVP';
    length:=12 END;
154: BEGIN name:='RSUBSTITUTION5';
    length:=14 END;
155: BEGIN name:='RSUBSTITUTION5A';
    length:=15 END;
156: BEGIN name:='RSUBSTITUTION6';
    length:=14 END;
157: BEGIN name:='RSUBSTITUTION8';
    length:=14 END;
158: BEGIN name:='RSUBSTITUTION9';
    length:=14 END;
159: BEGIN name:='RSUBSTITUTION10';
    length:=15 END;
160: BEGIN name:='RSUBSTITUTION7';
    length:=14 END;
161: BEGIN name:='RSUBSTENNP1';
    length:=11 END;
162: BEGIN name:='RSUBSTENNP2';
    length:=11 END;
163: BEGIN name:='RDEEPSUBST1';
    length:=11 END;
164: BEGIN name:='RDEEPSUBST2';
    length:=11 END;
165: BEGIN name:='RBPERSPRO';
    length:=9 END;
166: BEGIN name:='RTEMPADVSUBSTITUTION1';
    length:=21 END;
167: BEGIN name:='RTEMPADVSUBSTITUTION2';
    length:=21 END;
168: BEGIN name:='RTEMPADVSENTSUBSTITUTION';
    length:=24 END;
169: BEGIN name:='RTEMPADVSUBSTITUTION3';
    length:=21 END;
170: BEGIN name:='RTEMPADVSUBSTITUTION4';
    length:=21 END;
171: BEGIN name:='RREFVARINSERTION';
    length:=16 END;
172: BEGIN name:='RDURVARINSERTION';
    length:=16 END;
173: BEGIN name:='RRETROVARINSERTION';
    length:=18 END;
174: BEGIN name:='RFREQVARINSERTION';
    length:=17 END;
175: BEGIN name:='RPPPREFVARINSERTION';
    length:=19 END;
176: BEGIN name:='RPPPDURVARINSERTION';
    length:=19 END;
177: BEGIN name:='RPPPRETROVARINSERTION';
    length:=21 END;
178: BEGIN name:='RADVPPREFVARINSERTION';
    length:=21 END;
179: BEGIN name:='RADVPPDURVARINSERTION';
    length:=21 END;
180: BEGIN name:='RADVPPRETROVARINSERTION';
    length:=23 END;
181: BEGIN name:='RASPECTIMPERFECTIVE';
    length:=19 END;
182: BEGIN name:='RASPECTPERFECTIVE';
    length:=17 END;
183: BEGIN name:='RASPECTHABITUAL';
    length:=15 END;
184: BEGIN name:='RFINPRESENTDEIXIS';
    length:=17 END;
185: BEGIN name:='RFINPASTDEIXIS';
    length:=14 END;
186: BEGIN name:='RTEMPCONJSENTMOVETOLEFT';
    length:=23 END;
187: BEGIN name:='RINFINPASTDEIXISSPEC';
    length:=20 END;
188: BEGIN name:='RIMPDEIXIS';
    length:=10 END;
189: BEGIN name:='RFINIRRMODALDEIXIS';
    length:=18 END;
190: BEGIN name:='RFINPRESENTSUPERDEIXIS';
    length:=22 END;
191: BEGIN name:='RFINPASTSUPERDEIXIS1';
    length:=20 END;
192: BEGIN name:='RFINPASTSUPERDEIXIS2';
    length:=20 END;
193: BEGIN name:='RFINPRESFUTDEIXIS';
    length:=17 END;
194: BEGIN name:='RFINFUTPASTDEIXIS';
    length:=17 END;
195: BEGIN name:='RFINFUTPRESDEIXIS';
    length:=17 END;
196: BEGIN name:='RFINPRESFUTSUPERDEIXIS';
    length:=22 END;
197: BEGIN name:='RFINPASTFUTSUPERDEIXIS';
    length:=22 END;
198: BEGIN name:='RFINFUTPRESSUPERDEIXIS';
    length:=22 END;
199: BEGIN name:='RFINFUTPASTSUPERDEIXIS';
    length:=22 END;
200: BEGIN name:='RRETROIMPERFECTIVE1';
    length:=19 END;
201: BEGIN name:='RRETROIMPERFECTIVE2';
    length:=19 END;
202: BEGIN name:='RRETROPERFECTIVE';
    length:=16 END;
203: BEGIN name:='RINFINPRESENTSUPERDEIXIS';
    length:=24 END;
204: BEGIN name:='RINFINPASTSUPERDEIXIS';
    length:=21 END;
205: BEGIN name:='RINFINPASTSUPERDEIXISSPEC';
    length:=25 END;
206: BEGIN name:='RFINIRRMODALSUPERDEIXIS';
    length:=23 END;
207: BEGIN name:='RADJREFVARINSERTION';
    length:=19 END;
208: BEGIN name:='RADJDURVARINSERTION';
    length:=19 END;
209: BEGIN name:='RADJRETROVARINSERTION';
    length:=21 END;
210: BEGIN name:='RADJASPECTIMPERFECTIVE';
    length:=22 END;
211: BEGIN name:='RADJPRESENTSUPERDEIXIS';
    length:=22 END;
212: BEGIN name:='RADJPASTSUPERDEIXIS';
    length:=19 END;
213: BEGIN name:='RBADVTOSUB';
    length:=10 END;
214: BEGIN name:='RSUBADJTOSUBADV';
    length:=15 END;
215: BEGIN name:='RSTARTADVP0';
    length:=11 END;
216: BEGIN name:='RADVPSUPERDEIXIS';
    length:=16 END;
217: BEGIN name:='RSTARTADVPPROP100';
    length:=17 END;
218: BEGIN name:='RSTARTADVPPROP010';
    length:=17 END;
219: BEGIN name:='RSTARTADVPPROP120';
    length:=17 END;
220: BEGIN name:='RADVREFVARINSERTION';
    length:=19 END;
221: BEGIN name:='RADVPPROPVOICE';
    length:=14 END;
222: BEGIN name:='RADVTOFORMULA';
    length:=13 END;
223: BEGIN name:='RADVASPECTIMPERFECTIVE';
    length:=22 END;
224: BEGIN name:='RADVPPSUPERDEIXIS';
    length:=17 END;
225: BEGIN name:='RADVPPSUBST1';
    length:=12 END;
226: BEGIN name:='RADVPPMOOD1';
    length:=11 END;
227: BEGIN name:='RADVPPMOOD2';
    length:=11 END;
228: BEGIN name:='RADVPPNOPUNC';
    length:=12 END;
229: BEGIN name:='RADVPDEGREEMOD1';
    length:=15 END;
230: BEGIN name:='RADVPDEGREEMOD2';
    length:=15 END;
231: BEGIN name:='RADVPDEGREEMOD3';
    length:=15 END;
232: BEGIN name:='RADVPCOMPARISONCOMPLMOD';
    length:=23 END;
233: BEGIN name:='RADVPSUBST2';
    length:=11 END;
234: BEGIN name:='RPUNC0';
    length:=6 END;
235: BEGIN name:='RPUNC1';
    length:=6 END;
236: BEGIN name:='RPUNC2';
    length:=6 END;
237: BEGIN name:='RPUNC3';
    length:=6 END;
238: BEGIN name:='RCOORDINTRO';
    length:=11 END;
239: BEGIN name:='RUTT1';
    length:=5 END;
240: BEGIN name:='RUTTNP';
    length:=6 END;
241: BEGIN name:='RUTTADVP';
    length:=8 END;
242: BEGIN name:='RUTTADJP';
    length:=8 END;
243: BEGIN name:='RUTTPREPP';
    length:=9 END;
244: BEGIN name:='RUTTEXCLAM';
    length:=10 END;
245: BEGIN name:='RADDEXCLAM';
    length:=10 END;
246: BEGIN name:='RADJPARAOBJMOD';
    length:=14 END;
247: BEGIN name:='RADJPARAMOD1';
    length:=12 END;
248: BEGIN name:='RADJDEGREEMOD1';
    length:=14 END;
249: BEGIN name:='RADJDEGREEMOD2A';
    length:=15 END;
250: BEGIN name:='RADJDEGREEMOD2B';
    length:=15 END;
251: BEGIN name:='RBADJTOSUB1';
    length:=11 END;
252: BEGIN name:='RORDDERIV';
    length:=9 END;
253: BEGIN name:='RSTARTADJPPROP000';
    length:=17 END;
254: BEGIN name:='RSTARTADJPPROP100';
    length:=17 END;
255: BEGIN name:='RSTARTADJPPROP120';
    length:=17 END;
256: BEGIN name:='RADJPPCONJSVAR';
    length:=14 END;
257: BEGIN name:='RADJPPFINCONJSVAR';
    length:=17 END;
258: BEGIN name:='RADJVOICEDEFAULT';
    length:=16 END;
259: BEGIN name:='RADJSENTENCESUBSTITUTION1';
    length:=25 END;
260: BEGIN name:='RADJPFORMULAFORMATION1';
    length:=22 END;
261: BEGIN name:='RADJEMPTYSUBST1';
    length:=15 END;
262: BEGIN name:='RADJEMPTYSUBST2';
    length:=15 END;
263: BEGIN name:='RNPFORMATION1';
    length:=13 END;
264: BEGIN name:='RNPFORMATION2';
    length:=13 END;
265: BEGIN name:='RNPFORMATION3';
    length:=13 END;
266: BEGIN name:='RNPFORMATION4';
    length:=13 END;
267: BEGIN name:='RNPFORMATION4A';
    length:=14 END;
268: BEGIN name:='RNPFORMATION5';
    length:=13 END;
269: BEGIN name:='RNPFORMATION6';
    length:=13 END;
270: BEGIN name:='RNPFORMATION7';
    length:=13 END;
271: BEGIN name:='RNPFORMATION8';
    length:=13 END;
272: BEGIN name:='RNPFORMATION9';
    length:=13 END;
273: BEGIN name:='RNPFORMATION10';
    length:=14 END;
274: BEGIN name:='RNPFORMATION12';
    length:=14 END;
275: BEGIN name:='RNPFORMATION13';
    length:=14 END;
276: BEGIN name:='RNPPRESENTSUPERDEIXIS1';
    length:=22 END;
277: BEGIN name:='RNPPASTSUPERDEIXIS1';
    length:=19 END;
278: BEGIN name:='RNPPRESENTSUPERDEIXIS2';
    length:=22 END;
279: BEGIN name:='RNPPASTSUPERDEIXIS2';
    length:=19 END;
280: BEGIN name:='RNPMODADVP';
    length:=10 END;
281: BEGIN name:='RNPAPPOSITION';
    length:=13 END;
282: BEGIN name:='DETDERIVATION1';
    length:=14 END;
283: BEGIN name:='DETPFORMATION1';
    length:=14 END;
284: BEGIN name:='DETPFORMATION2';
    length:=14 END;
285: BEGIN name:='DETPFORMATION3';
    length:=14 END;
286: BEGIN name:='DETPFORMATION4';
    length:=14 END;
287: BEGIN name:='DETPFORMATION1A';
    length:=15 END;
288: BEGIN name:='DETPFORMATION3A';
    length:=15 END;
289: BEGIN name:='RDETPPARTITIVEFORMATION';
    length:=23 END;
290: BEGIN name:='RDETPSUPERDEIXIS';
    length:=16 END;
291: BEGIN name:='RADVPAMOUNTMOD';
    length:=14 END;
292: BEGIN name:='RQTOQP1';
    length:=7 END;
293: BEGIN name:='RQTOQP2';
    length:=7 END;
294: BEGIN name:='RQPSUPERDEIXIS';
    length:=14 END;
295: BEGIN name:='RQPCOMPARATIVECOMPLMOD1';
    length:=23 END;
296: BEGIN name:='RQPCOMPARATIVECOMPLMOD2';
    length:=23 END;
297: BEGIN name:='RQPSUPERLATIVECOMPLMOD';
    length:=22 END;
298: BEGIN name:='RQPAMOUNTMOD';
    length:=12 END;
299: BEGIN name:='RQPSUBSTITUTION1';
    length:=16 END;
300: BEGIN name:='BNOUNTOSUBNOUN';
    length:=14 END;
301: BEGIN name:='RSUBNOUNTONOUN1';
    length:=15 END;
302: BEGIN name:='RSUBNOUNTONOUN2';
    length:=15 END;
303: BEGIN name:='RBPROPERNOUNTOPROPERNOUN';
    length:=24 END;
304: BEGIN name:='RINDEFPROTOSUBINDEFPRO';
    length:=22 END;
305: BEGIN name:='RBWHPROTOWHPRO';
    length:=14 END;
306: BEGIN name:='RBPERSPROTOPERSPRO';
    length:=18 END;
307: BEGIN name:='RCNFORMATION1';
    length:=13 END;
308: BEGIN name:='RCNFORMATION2';
    length:=13 END;
309: BEGIN name:='RCNFORMATION3';
    length:=13 END;
310: BEGIN name:='RCNFORMATION4';
    length:=13 END;
311: BEGIN name:='RCNPRESENTSUPERDEIXIS';
    length:=21 END;
312: BEGIN name:='RCNPASTSUPERDEIXIS';
    length:=18 END;
313: BEGIN name:='RIDCNMODADJP1';
    length:=13 END;
314: BEGIN name:='RCNMODADJP1';
    length:=11 END;
315: BEGIN name:='RCNMODADJP2';
    length:=11 END;
316: BEGIN name:='RCNMODNUM';
    length:=9 END;
317: BEGIN name:='RCNMODPOSS1';
    length:=11 END;
318: BEGIN name:='RCNMODPOSS2';
    length:=11 END;
319: BEGIN name:='RCNMODPOSS3';
    length:=11 END;
320: BEGIN name:='RCNMODPP';
    length:=8 END;
321: BEGIN name:='RCNSPECPROPERNAME';
    length:=17 END;
322: BEGIN name:='RCNMODBARENP';
    length:=12 END;
323: BEGIN name:='RNPPROPFORMATION';
    length:=16 END;
324: BEGIN name:='RNPREFVARINSERTION';
    length:=18 END;
325: BEGIN name:='RNPRETROVARINSERTION';
    length:=20 END;
326: BEGIN name:='RNPPSUBSTITUTION1';
    length:=17 END;
327: BEGIN name:='ROPENNPPROPFORMATION';
    length:=20 END;
328: BEGIN name:='RCLOSEDNPPROPFORMATION';
    length:=22 END;
329: BEGIN name:='RNPPNOPUNC';
    length:=10 END;
330: BEGIN name:='RCNMODRELSENT1';
    length:=14 END;
331: BEGIN name:='RIDNPPSUPERDEIXIS';
    length:=17 END;
332: BEGIN name:='RADJSUBSTITUTION1';
    length:=17 END;
333: BEGIN name:='RADJSUBSTITUTION2';
    length:=17 END;
334: BEGIN name:='RADJSUBSTITUTION3';
    length:=17 END;
335: BEGIN name:='RADJSUBSTITUTION4';
    length:=17 END;
336: BEGIN name:='RADJMOOD1';
    length:=9 END;
337: BEGIN name:='RADJMOOD2';
    length:=9 END;
338: BEGIN name:='RADJPUNC';
    length:=8 END;
339: BEGIN name:='RHELPEMPTYSUBJSUBST';
    length:=19 END;
340: BEGIN name:='RADJEMPTYSUBJSUBST';
    length:=18 END;
341: BEGIN name:='RPREPTOSUB';
    length:=10 END;
342: BEGIN name:='RSTARTPREPPPROP000';
    length:=18 END;
343: BEGIN name:='RSTARTPREPPPROP100';
    length:=18 END;
344: BEGIN name:='RSTARTPREPPPROP120';
    length:=18 END;
345: BEGIN name:='RPREPPPROPVOICE';
    length:=15 END;
346: BEGIN name:='RPPPNPMOD';
    length:=9 END;
347: BEGIN name:='RPPPADVPMOD';
    length:=11 END;
348: BEGIN name:='RPREPTOFORMULA';
    length:=14 END;
349: BEGIN name:='RPPPASPECTIMPERFECTIVE';
    length:=22 END;
350: BEGIN name:='RPPPSUPERDEIXIS';
    length:=15 END;
351: BEGIN name:='RPPPMOOD1';
    length:=9 END;
352: BEGIN name:='RPPPMOOD2';
    length:=9 END;
353: BEGIN name:='RPPPSUBSTITUTION1';
    length:=17 END;
354: BEGIN name:='RPPPSUBSTITUTION3';
    length:=17 END;
355: BEGIN name:='RPPPSUBSTITUTION4';
    length:=17 END;
356: BEGIN name:='RPPPSUBSTITUTION5';
    length:=17 END;
357: BEGIN name:='RPPPNOPUNC';
    length:=10 END;
358: BEGIN name:='RSTARTPREPP100';
    length:=14 END;
359: BEGIN name:='RSTARTPREPP120';
    length:=14 END;
360: BEGIN name:='RPPNPMOD';
    length:=8 END;
361: BEGIN name:='RPPADVPMOD';
    length:=10 END;
362: BEGIN name:='RPPSUPERDEIXIS';
    length:=14 END;
363: BEGIN name:='RPPSUBSTITUTION1';
    length:=16 END;
364: BEGIN name:='RPPSUBSTITUTION3';
    length:=16 END;
365: BEGIN name:='RPPSUBSTITUTION4';
    length:=16 END;
366: BEGIN name:='RPROPSUBST13';
    length:=12 END;
367: BEGIN name:='RPROPSUBST14';
    length:=12 END;
368: BEGIN name:='RPROPSUBSTFUTURO';
    length:=16 END;
369: BEGIN name:='RCONJSENTSUBST1';
    length:=15 END;
370: BEGIN name:='RCONJSENTSUBST2';
    length:=15 END;
371: BEGIN name:='RNEGVARINTRO1';
    length:=13 END;
372: BEGIN name:='RPOSVARINTRO1';
    length:=13 END;
373: BEGIN name:='RNEGVARINTRO2';
    length:=13 END;
374: BEGIN name:='RNEGVARINTRO3';
    length:=13 END;
375: BEGIN name:='RMOODOPENQUEINF';
    length:=15 END;
376: BEGIN name:='RMOODCLOSEDQUEINF';
    length:=17 END;
377: BEGIN name:='RRECIPROCALSUBST1';
    length:=17 END;
378: BEGIN name:='RCONJSENT1';
    length:=10 END;
379: BEGIN name:='RCONJSENT2';
    length:=10 END;
380: BEGIN name:='RCONJSENT3';
    length:=10 END;
381: BEGIN name:='RCONJSENT4';
    length:=10 END;
382: BEGIN name:='RCONJSENT5';
    length:=10 END;
383: BEGIN name:='RADJUNCTVAR1';
    length:=12 END;
384: BEGIN name:='RADJUNCTVAR2';
    length:=12 END;
385: BEGIN name:='RADJUNCTVAR3';
    length:=12 END;
386: BEGIN name:='RIDCN2';
    length:=6 END;
387: BEGIN name:='RIDNPFORMATION2';
    length:=15 END;
388: BEGIN name:='RIDCN1';
    length:=6 END;
389: BEGIN name:='RIDDERIV1';
    length:=9 END;
390: BEGIN name:='RIDDERIV6';
    length:=9 END;
391: BEGIN name:='RIDDERIV9';
    length:=9 END;
392: BEGIN name:='RNOUNARGMOD1';
    length:=12 END;
393: BEGIN name:='RNOUNARGMOD2';
    length:=12 END;
394: BEGIN name:='RNPARGMODSUBST1';
    length:=15 END;
395: BEGIN name:='RNPARGMODSUBST2';
    length:=15 END;
396: BEGIN name:='RNPFORMATION11';
    length:=14 END;
397: BEGIN name:='RNPPARTITIVEFORMATION1';
    length:=22 END;
398: BEGIN name:='RNPPARTITIVEFORMATION2';
    length:=22 END;
399: BEGIN name:='RNPFORMATION14';
    length:=14 END;
END;
END;
 FUNCTION LDMrules_IsFilter(
T:LDMrules_transformationindex):BOOLEAN;
BEGIN
LDMRULES_IsFilter:=(T>260)
END;
 PROCEDURE LDMrules_Transformationname(sg:LDMrules_subgrammarindex;
T:LDMrules_transformationindex;VAR name:string;VAR length:INTEGER);
BEGIN
CASE T OF
1: BEGIN name:='TINDOBJCLITICSPELLING';
    length:=21 END;
2: BEGIN name:='TNOINDOBJCLITICSPELLING';
    length:=23 END;
3: BEGIN name:='TCLITICNODEINSERTION';
    length:=20 END;
4: BEGIN name:='TREFLSPELLINGDEFAULT';
    length:=20 END;
5: BEGIN name:='TREFLSPELLINGDEFAULT2';
    length:=21 END;
6: BEGIN name:='TREFLSPELLING1A';
    length:=15 END;
7: BEGIN name:='TREFLSPELLING1B';
    length:=15 END;
8: BEGIN name:='TREFLSPELLING2A';
    length:=15 END;
9: BEGIN name:='TREFLSPELLING2B';
    length:=15 END;
10: BEGIN name:='TREFLSPELLING3';
    length:=14 END;
11: BEGIN name:='TREFLSPELLING4';
    length:=14 END;
12: BEGIN name:='TREFLCLOSEDCAT1A';
    length:=16 END;
13: BEGIN name:='TREFLCLOSEDCAT1B';
    length:=16 END;
14: BEGIN name:='TREFLCLOSEDCAT3';
    length:=15 END;
15: BEGIN name:='TREFLCLOSEDCATPREP1A';
    length:=20 END;
16: BEGIN name:='TREFLCLOSEDCATPREP1B';
    length:=20 END;
17: BEGIN name:='TREFLCLOSEDCATPREP3';
    length:=19 END;
18: BEGIN name:='TOBJECTOK0';
    length:=10 END;
19: BEGIN name:='TOBJECTOK1A';
    length:=11 END;
20: BEGIN name:='TOBJECTOK1B';
    length:=11 END;
21: BEGIN name:='TOBJECTOK2A';
    length:=11 END;
22: BEGIN name:='TOBJECTOK2B';
    length:=11 END;
23: BEGIN name:='TOBJECTOK3A';
    length:=11 END;
24: BEGIN name:='TOBJECTOK3B';
    length:=11 END;
25: BEGIN name:='TOBJECTOK3C';
    length:=11 END;
26: BEGIN name:='TOBJECTOK3D';
    length:=11 END;
27: BEGIN name:='TOBJECTOK4A';
    length:=11 END;
28: BEGIN name:='TOBJECTOK4B';
    length:=11 END;
29: BEGIN name:='TOBJECTOK4C';
    length:=11 END;
30: BEGIN name:='TOBJECTOK4D';
    length:=11 END;
31: BEGIN name:='TOBJECTOK5';
    length:=10 END;
32: BEGIN name:='TOBJECTOK6A';
    length:=11 END;
33: BEGIN name:='TOBJECTOK6B';
    length:=11 END;
34: BEGIN name:='TOBJECTOK7';
    length:=10 END;
35: BEGIN name:='TOBJECTOK8';
    length:=10 END;
36: BEGIN name:='TSVAGR0';
    length:=7 END;
37: BEGIN name:='TSVAGR1';
    length:=7 END;
38: BEGIN name:='TADJAGR';
    length:=7 END;
39: BEGIN name:='TPTCPASAGR1';
    length:=11 END;
40: BEGIN name:='TPTCPASAGR2';
    length:=11 END;
41: BEGIN name:='TCONTROL0';
    length:=9 END;
42: BEGIN name:='TOBLCONTROL1A';
    length:=13 END;
43: BEGIN name:='TOBLCONTROL1B';
    length:=13 END;
44: BEGIN name:='TNOCONTROL1';
    length:=11 END;
45: BEGIN name:='TOBLCONTROL2A';
    length:=13 END;
46: BEGIN name:='TOBLCONTROL2B';
    length:=13 END;
47: BEGIN name:='TNOCONTROL2';
    length:=11 END;
48: BEGIN name:='TOBLCONTROL3A';
    length:=13 END;
49: BEGIN name:='TOBLCONTROL3B';
    length:=13 END;
50: BEGIN name:='TNOCONTROL3';
    length:=11 END;
51: BEGIN name:='TNOCONTROL3ID';
    length:=13 END;
52: BEGIN name:='TOBLCONTROL7A';
    length:=13 END;
53: BEGIN name:='TOBLCONTROL7B';
    length:=13 END;
54: BEGIN name:='TNOCONTROL7';
    length:=11 END;
55: BEGIN name:='TOBLCONTROL4A';
    length:=13 END;
56: BEGIN name:='TOBLCONTROL4B';
    length:=13 END;
57: BEGIN name:='TNOCONTROL4';
    length:=11 END;
58: BEGIN name:='TNOCONTROL4ID';
    length:=13 END;
59: BEGIN name:='TOBLCONTROL5A';
    length:=13 END;
60: BEGIN name:='TOBLCONTROL5B';
    length:=13 END;
61: BEGIN name:='TNOCONTROL5';
    length:=11 END;
62: BEGIN name:='TOBLCONTROL6A';
    length:=13 END;
63: BEGIN name:='TOBLCONTROL6B';
    length:=13 END;
64: BEGIN name:='TOBLCONTROL6C';
    length:=13 END;
65: BEGIN name:='TOBLCONTROL5A1';
    length:=14 END;
66: BEGIN name:='TOBLCONTROL5B1';
    length:=14 END;
67: BEGIN name:='TNOCONTROL51';
    length:=12 END;
68: BEGIN name:='TCASEASSIGNMENT1';
    length:=16 END;
69: BEGIN name:='TCASEASSIGNMENT2';
    length:=16 END;
70: BEGIN name:='TCASEASSIGNMENT3';
    length:=16 END;
71: BEGIN name:='TCASEASSIGNMENT4';
    length:=16 END;
72: BEGIN name:='TCASEASSIGNMENT5';
    length:=16 END;
73: BEGIN name:='TCASEASSIGNMENT6';
    length:=16 END;
74: BEGIN name:='TIMPERCLMOVE';
    length:=12 END;
75: BEGIN name:='VCLUSTERING1';
    length:=12 END;
76: BEGIN name:='VCLUSTERING2';
    length:=12 END;
77: BEGIN name:='TCLINFPTCPASCLIMBING';
    length:=20 END;
78: BEGIN name:='TNOCOMPLSENT';
    length:=12 END;
79: BEGIN name:='TEXTRAPOSFINSENT';
    length:=16 END;
80: BEGIN name:='TEXTRAPOSPREPFINSENT';
    length:=20 END;
81: BEGIN name:='TNOCLUSTERING';
    length:=13 END;
82: BEGIN name:='TVERBRAISING';
    length:=12 END;
83: BEGIN name:='TPREPVERBRAISING';
    length:=16 END;
84: BEGIN name:='TRESTRUCTURING1';
    length:=15 END;
85: BEGIN name:='TVPDEL';
    length:=6 END;
86: BEGIN name:='TVPDEL2';
    length:=7 END;
87: BEGIN name:='TCLDEL1';
    length:=7 END;
88: BEGIN name:='TCLDEL2';
    length:=7 END;
89: BEGIN name:='TVPDEL3';
    length:=7 END;
90: BEGIN name:='TAGLUEEL';
    length:=8 END;
91: BEGIN name:='TAGLUEEL2';
    length:=9 END;
92: BEGIN name:='TADEGLUEEL';
    length:=10 END;
93: BEGIN name:='TADEGLUEEL2';
    length:=11 END;
94: BEGIN name:='TCONGLUEMITI';
    length:=12 END;
95: BEGIN name:='TCONGLUEMITI2';
    length:=13 END;
96: BEGIN name:='TVERBPATTERN0';
    length:=13 END;
97: BEGIN name:='TVERBPATTERN1';
    length:=13 END;
98: BEGIN name:='TIDVERBPATTERN';
    length:=14 END;
99: BEGIN name:='TVERBPATTERN3';
    length:=13 END;
100: BEGIN name:='TVERBPATTERN4';
    length:=13 END;
101: BEGIN name:='TVERBPATTERN5';
    length:=13 END;
102: BEGIN name:='TVERBPATTERN6';
    length:=13 END;
103: BEGIN name:='TVERBPATTERN7';
    length:=13 END;
104: BEGIN name:='TVERBPATTERN8';
    length:=13 END;
105: BEGIN name:='TVERBPATTERN10';
    length:=14 END;
106: BEGIN name:='TVERBPATTERN11';
    length:=14 END;
107: BEGIN name:='TVERBPATTERN12';
    length:=14 END;
108: BEGIN name:='TAKTACTIVITY1';
    length:=13 END;
109: BEGIN name:='TAKTACTIVITY2';
    length:=13 END;
110: BEGIN name:='TAKTACTIVITY3';
    length:=13 END;
111: BEGIN name:='TAKTACTIVITY4';
    length:=13 END;
112: BEGIN name:='TAKTACTIVITY5';
    length:=13 END;
113: BEGIN name:='TAKTACTIVITY6';
    length:=13 END;
114: BEGIN name:='TAKTACCOMPLISHMENT1';
    length:=19 END;
115: BEGIN name:='TAKTACCOMPLISHMENT2';
    length:=19 END;
116: BEGIN name:='TAKTACCOMPLISHMENT3';
    length:=19 END;
117: BEGIN name:='TAKTACHIEVEMENT1';
    length:=16 END;
118: BEGIN name:='TAKTSTATIVE1';
    length:=12 END;
119: BEGIN name:='TFINITE';
    length:=7 END;
120: BEGIN name:='TINFINITE';
    length:=9 END;
121: BEGIN name:='TASPECTNEUTRALIZATION';
    length:=21 END;
122: BEGIN name:='TRETRONEUTRALIZATION';
    length:=20 END;
123: BEGIN name:='TTEMPREFTOSHIFT';
    length:=15 END;
124: BEGIN name:='TTEMPCONJSENTADAPTATION';
    length:=23 END;
125: BEGIN name:='TNOSUPERDEIXISADAPTATION';
    length:=24 END;
126: BEGIN name:='TSUPERDEIXISADAPTATION1A';
    length:=24 END;
127: BEGIN name:='TSUPERDEIXISADAPTATION1B';
    length:=24 END;
128: BEGIN name:='TSUPERDEIXISADAPTATION2';
    length:=23 END;
129: BEGIN name:='TSUPERDEIXISADAPTATION5';
    length:=23 END;
130: BEGIN name:='TSUPERDEIXISADAPTATION8';
    length:=23 END;
131: BEGIN name:='TDEIXISRETROADAPTATION1';
    length:=23 END;
132: BEGIN name:='TREFDELETION';
    length:=12 END;
133: BEGIN name:='TRETRODELETION';
    length:=14 END;
134: BEGIN name:='TADJAKTSTATIVE1';
    length:=15 END;
135: BEGIN name:='TADJASPECTNEUTRALISATION';
    length:=24 END;
136: BEGIN name:='TADJSUPERDEIXISADAPTATION1';
    length:=26 END;
137: BEGIN name:='TADJSUPERDEIXISADAPTATION2';
    length:=26 END;
138: BEGIN name:='TADJNOSUPERDEIXISADAPTATION';
    length:=27 END;
139: BEGIN name:='TADVPATTERN0';
    length:=12 END;
140: BEGIN name:='TADVPATTERN1';
    length:=12 END;
141: BEGIN name:='TADVPPPROSUBJECT';
    length:=16 END;
142: BEGIN name:='TADVASPECTNEUTRALISATION';
    length:=24 END;
143: BEGIN name:='TADVPNOMCASEASSIGNMENT';
    length:=22 END;
144: BEGIN name:='T2CLGLUEINF';
    length:=11 END;
145: BEGIN name:='T3CLGLUEINF';
    length:=11 END;
146: BEGIN name:='T4CLGLUEINF';
    length:=11 END;
147: BEGIN name:='TAUXGLUECLPTC';
    length:=13 END;
148: BEGIN name:='T2CLAUXPTC';
    length:=10 END;
149: BEGIN name:='T3CLAUXPTC';
    length:=10 END;
150: BEGIN name:='T4CLAUXPTC';
    length:=10 END;
151: BEGIN name:='TINFGLUECL';
    length:=10 END;
152: BEGIN name:='T1CLGLUEIMP';
    length:=11 END;
153: BEGIN name:='T2CLGLUEIMP';
    length:=11 END;
154: BEGIN name:='T3CLGLUEIMP';
    length:=11 END;
155: BEGIN name:='T4CLGLUEIMP';
    length:=11 END;
156: BEGIN name:='TPREPPPROPOVERIO';
    length:=16 END;
157: BEGIN name:='TPROSUBJDEL';
    length:=11 END;
158: BEGIN name:='TREDELLOSUBJDEL';
    length:=15 END;
159: BEGIN name:='TPRONPVARDEL';
    length:=12 END;
160: BEGIN name:='TSEPASSPERSPROOBJDEL';
    length:=20 END;
161: BEGIN name:='TSUPERDEIXISADAPTATION3';
    length:=23 END;
162: BEGIN name:='TSUPERDEIXISADAPTATION4';
    length:=23 END;
163: BEGIN name:='TSUPERDEIXISADAPTATION6';
    length:=23 END;
164: BEGIN name:='TSUPERDEIXISADAPTATION7';
    length:=23 END;
165: BEGIN name:='TIDSUPERDEIXISADAPTATION';
    length:=24 END;
166: BEGIN name:='TSUPERDEIXISADAPTATION10';
    length:=24 END;
167: BEGIN name:='TYINSERTION';
    length:=11 END;
168: BEGIN name:='TACASE';
    length:=6 END;
169: BEGIN name:='TACASECAUSAT';
    length:=12 END;
170: BEGIN name:='TAINSERTION';
    length:=11 END;
171: BEGIN name:='TAINSERTION2';
    length:=12 END;
172: BEGIN name:='TADJAGREEMENT';
    length:=13 END;
173: BEGIN name:='TADJPATTERN0';
    length:=12 END;
174: BEGIN name:='TADJPATTERN12A';
    length:=14 END;
175: BEGIN name:='TADJPATTERN12B';
    length:=14 END;
176: BEGIN name:='TADJPATTERN14';
    length:=13 END;
177: BEGIN name:='TADJPATTERN16';
    length:=13 END;
178: BEGIN name:='TADJPATTERN18A';
    length:=14 END;
179: BEGIN name:='TADJPATTERN18B';
    length:=14 END;
180: BEGIN name:='TADJCASEASSIGNMENT1';
    length:=19 END;
181: BEGIN name:='TADJCASEASSIGNMENT2';
    length:=19 END;
182: BEGIN name:='TADJCOMPLEXTRAPOS';
    length:=17 END;
183: BEGIN name:='TSESPELLING';
    length:=11 END;
184: BEGIN name:='TSESPELLINGCLPASSIVE';
    length:=20 END;
185: BEGIN name:='TSESPELLINGPASSIVE';
    length:=18 END;
186: BEGIN name:='TUNOSPELLING';
    length:=12 END;
187: BEGIN name:='TEMPTYSESPELLING';
    length:=16 END;
188: BEGIN name:='TNPCNDELETION1';
    length:=14 END;
189: BEGIN name:='TNPCNDELETION2';
    length:=14 END;
190: BEGIN name:='TNPQPCOMPLEXTRAPOS';
    length:=18 END;
191: BEGIN name:='TNPENDELETION1';
    length:=14 END;
192: BEGIN name:='TNPENDELETION2';
    length:=14 END;
193: BEGIN name:='TQPDELGLUE';
    length:=10 END;
194: BEGIN name:='TQPDECOMPLCASEASSIGNMENT';
    length:=24 END;
195: BEGIN name:='TQPNOMCASEASSIGNMENT';
    length:=20 END;
196: BEGIN name:='TCNAPOCOPE';
    length:=10 END;
197: BEGIN name:='TNPPNOPROSUBJ';
    length:=13 END;
198: BEGIN name:='TNPPPROSUBJ';
    length:=11 END;
199: BEGIN name:='TPPDELGLUE';
    length:=10 END;
200: BEGIN name:='TRELADEGLUEEL';
    length:=13 END;
201: BEGIN name:='TPPADEGLUEEL';
    length:=12 END;
202: BEGIN name:='TADJSETPROSUBJECT';
    length:=17 END;
203: BEGIN name:='TADJADEGLUEEL';
    length:=13 END;
204: BEGIN name:='TPREPPATTERN0';
    length:=13 END;
205: BEGIN name:='TPREPPATTERN1';
    length:=13 END;
206: BEGIN name:='TPPCA0';
    length:=6 END;
207: BEGIN name:='TPPCA1';
    length:=6 END;
208: BEGIN name:='TPPPNOPROSUBJ';
    length:=13 END;
209: BEGIN name:='TPPPPROSUBJ';
    length:=11 END;
210: BEGIN name:='TPPPASPECTNEUTRALIZATION';
    length:=24 END;
211: BEGIN name:='TWHSHIFT1A';
    length:=10 END;
212: BEGIN name:='TWHSHIFT1B';
    length:=10 END;
213: BEGIN name:='TWHSHIFT0';
    length:=9 END;
214: BEGIN name:='TWHSHIFT2';
    length:=9 END;
215: BEGIN name:='TPPPREPPATTERN0';
    length:=15 END;
216: BEGIN name:='TPPPREPPATTERN1';
    length:=15 END;
217: BEGIN name:='TPREPPCA0';
    length:=9 END;
218: BEGIN name:='TPREPPCA1';
    length:=9 END;
219: BEGIN name:='TPREPPCA2';
    length:=9 END;
220: BEGIN name:='TPPTOVARPP0';
    length:=11 END;
221: BEGIN name:='TPPTOVARPP1';
    length:=11 END;
222: BEGIN name:='TPROSTATUS1';
    length:=11 END;
223: BEGIN name:='TPRONIODEL';
    length:=10 END;
224: BEGIN name:='TPRONIODEL2';
    length:=11 END;
225: BEGIN name:='TPOSTPROSUBJDEL';
    length:=15 END;
226: BEGIN name:='TDOCLMINUSPERSPRO2';
    length:=18 END;
227: BEGIN name:='TDOCLMINUSPERSPRO';
    length:=17 END;
228: BEGIN name:='TIOCLCAMBIOSEPLUS';
    length:=17 END;
229: BEGIN name:='TIOCLCAMBIOSEPLUS2';
    length:=18 END;
230: BEGIN name:='TIOCLCAMBIOSEMINUS';
    length:=18 END;
231: BEGIN name:='TIOCLCAMBIOSEMINUS2';
    length:=19 END;
232: BEGIN name:='TVRCOMPLSETTING';
    length:=15 END;
233: BEGIN name:='TINVERSION1';
    length:=11 END;
234: BEGIN name:='TINVERSION2';
    length:=11 END;
235: BEGIN name:='TINVERSION3';
    length:=11 END;
236: BEGIN name:='TINVERSION4';
    length:=11 END;
237: BEGIN name:='TFINCONTROL1';
    length:=12 END;
238: BEGIN name:='TFINCONTROL0';
    length:=12 END;
239: BEGIN name:='TFINCONTROL2';
    length:=12 END;
240: BEGIN name:='TFINCONTROL3';
    length:=12 END;
241: BEGIN name:='TADVCONTROL1';
    length:=12 END;
242: BEGIN name:='TADVCONTROL2';
    length:=12 END;
243: BEGIN name:='TOBJTOOBJCONTROL';
    length:=16 END;
244: BEGIN name:='TNEGDEL1';
    length:=8 END;
245: BEGIN name:='TARGREFLSPELLING1';
    length:=17 END;
246: BEGIN name:='TPRONIODELINF';
    length:=13 END;
247: BEGIN name:='TPRONIODEL2INF';
    length:=14 END;
248: BEGIN name:='TDOCLMINPERSMINIOCL2';
    length:=20 END;
249: BEGIN name:='TDOCLMINPERSMINIOCL';
    length:=19 END;
250: BEGIN name:='TIDCLAUSETOVPPROP';
    length:=17 END;
251: BEGIN name:='TIDVPPROPTOCLAUSE';
    length:=17 END;
252: BEGIN name:='TISIDIOM';
    length:=8 END;
253: BEGIN name:='TISNOTIDIOM';
    length:=11 END;
254: BEGIN name:='TSESPELLING1';
    length:=12 END;
255: BEGIN name:='TSESPELLING2';
    length:=12 END;
256: BEGIN name:='TSESPELLING3';
    length:=12 END;
257: BEGIN name:='TSESPELLING4';
    length:=12 END;
258: BEGIN name:='TSESPELLING5';
    length:=12 END;
259: BEGIN name:='TSESPELLING6';
    length:=12 END;
260: BEGIN name:='THABERQUESUBJDEL';
    length:=16 END;
261: BEGIN name:='FADJAGR';
    length:=7 END;
262: BEGIN name:='FPTCPASAGR1';
    length:=11 END;
263: BEGIN name:='FPTCPASAGR2';
    length:=11 END;
264: BEGIN name:='FPOSTCASEASSIGNMENT1';
    length:=20 END;
265: BEGIN name:='FPOSTCASEASSIGNMENT2';
    length:=20 END;
266: BEGIN name:='FPOSTCASEASSIGNMENT3';
    length:=20 END;
267: BEGIN name:='FPOSTCASEASSIGNMENT4';
    length:=20 END;
268: BEGIN name:='FPOSTCASEASSIGNMENT5';
    length:=20 END;
269: BEGIN name:='FPOSTCASEASSIGNMENT6';
    length:=20 END;
270: BEGIN name:='FIMPERCLMOVE';
    length:=12 END;
271: BEGIN name:='FVPDEL';
    length:=6 END;
272: BEGIN name:='FVPDEL2';
    length:=7 END;
273: BEGIN name:='FCLDEL1';
    length:=7 END;
274: BEGIN name:='FCLDEL2';
    length:=7 END;
275: BEGIN name:='FVPDEL3';
    length:=7 END;
276: BEGIN name:='FAGLUEEL';
    length:=8 END;
277: BEGIN name:='FAGLUEEL2';
    length:=9 END;
278: BEGIN name:='FADEGLUEEL';
    length:=10 END;
279: BEGIN name:='FADEGLUEEL2';
    length:=11 END;
280: BEGIN name:='FCONGLUEMITI';
    length:=12 END;
281: BEGIN name:='FCONGLUEMITI2';
    length:=13 END;
282: BEGIN name:='FRETRONEUTRALIZATION';
    length:=20 END;
283: BEGIN name:='FTEMPREFTOSHIFT';
    length:=15 END;
284: BEGIN name:='FPOSTTEMPCONJSENTADAPTATION';
    length:=27 END;
285: BEGIN name:='FPRETEMPCONJSENTADAPTATION';
    length:=26 END;
286: BEGIN name:='FPRETEMPCONJSENTMOVETOLEFT';
    length:=26 END;
287: BEGIN name:='FSUPERDEIXISADAPTATION8';
    length:=23 END;
288: BEGIN name:='FTEMPINDEP1';
    length:=11 END;
289: BEGIN name:='FDEIXISRETROADAPTATION1';
    length:=23 END;
290: BEGIN name:='FREFDELETION';
    length:=12 END;
291: BEGIN name:='FRETRODELETION';
    length:=14 END;
292: BEGIN name:='FADJSUPERDEIXISADAPTATION2';
    length:=26 END;
293: BEGIN name:='FADVPPPREPROSUBJECT';
    length:=19 END;
294: BEGIN name:='FPRECOORDINTRO';
    length:=14 END;
295: BEGIN name:='F2CLGLUEINF';
    length:=11 END;
296: BEGIN name:='F3CLGLUEINF';
    length:=11 END;
297: BEGIN name:='F4CLGLUEINF';
    length:=11 END;
298: BEGIN name:='FAUXGLUECLPTC';
    length:=13 END;
299: BEGIN name:='F2CLAUXPTC';
    length:=10 END;
300: BEGIN name:='F3CLAUXPTC';
    length:=10 END;
301: BEGIN name:='F4CLAUXPTC';
    length:=10 END;
302: BEGIN name:='FINFGLUECL';
    length:=10 END;
303: BEGIN name:='F1CLGLUEIMP';
    length:=11 END;
304: BEGIN name:='F2CLGLUEIMP';
    length:=11 END;
305: BEGIN name:='F3CLGLUEIMP';
    length:=11 END;
306: BEGIN name:='F4CLGLUEIMP';
    length:=11 END;
307: BEGIN name:='FPREPPPROPOVERIO';
    length:=16 END;
308: BEGIN name:='FPROSUBJDEL';
    length:=11 END;
309: BEGIN name:='FREDELLOSUBJDEL';
    length:=15 END;
310: BEGIN name:='FPRONPVARDEL';
    length:=12 END;
311: BEGIN name:='FSEPASSPERSPROOBJDEL';
    length:=20 END;
312: BEGIN name:='FSUPERDEIXISADAPTATION7';
    length:=23 END;
313: BEGIN name:='FSUPERDEIXISADAPTATION10';
    length:=24 END;
314: BEGIN name:='FPOSTYINSERTION';
    length:=15 END;
315: BEGIN name:='FACASE';
    length:=6 END;
316: BEGIN name:='FACASECAUSAT';
    length:=12 END;
317: BEGIN name:='FAINSERTION';
    length:=11 END;
318: BEGIN name:='FAINSERTION2';
    length:=12 END;
319: BEGIN name:='FADJAGREEMENT';
    length:=13 END;
320: BEGIN name:='FADJPOSTCASEASSIGNMENT1';
    length:=23 END;
321: BEGIN name:='FADJPOSTCASEASSIGNMENT2';
    length:=23 END;
322: BEGIN name:='FADJPRECASEASSIGNMENT1';
    length:=22 END;
323: BEGIN name:='FADJPRECASEASSIGNMENT2';
    length:=22 END;
324: BEGIN name:='FADJPOSTCOMPLEXTRAPOS';
    length:=21 END;
325: BEGIN name:='FADJPRECOMPLEXTRAPOS';
    length:=20 END;
326: BEGIN name:='FSESPELLING';
    length:=11 END;
327: BEGIN name:='FSESPELLINGCLPASSIVE';
    length:=20 END;
328: BEGIN name:='FSESPELLINGPASSIVE';
    length:=18 END;
329: BEGIN name:='FUNOSPELLING';
    length:=12 END;
330: BEGIN name:='FEMPTYSESPELLING';
    length:=16 END;
331: BEGIN name:='FPOSTNPCNDELETION1';
    length:=18 END;
332: BEGIN name:='FPOSTNPCNDELETION2';
    length:=18 END;
333: BEGIN name:='FPRENPQPCOMPLEXTRAPOS';
    length:=21 END;
334: BEGIN name:='FPOSTNPQPCOMPLEXTRAPOS';
    length:=22 END;
335: BEGIN name:='FNPPOSTENDELETION';
    length:=17 END;
336: BEGIN name:='FNPPREENDELETION';
    length:=16 END;
337: BEGIN name:='FQPDELGLUE';
    length:=10 END;
338: BEGIN name:='FPOSTCNAPOCOPE';
    length:=14 END;
339: BEGIN name:='FPPDELGLUE';
    length:=10 END;
340: BEGIN name:='FRELADEGLUEEL';
    length:=13 END;
341: BEGIN name:='FPPADEGLUEEL';
    length:=12 END;
342: BEGIN name:='FESOESTO';
    length:=8 END;
343: BEGIN name:='FADJADEGLUEEL';
    length:=13 END;
344: BEGIN name:='FPOSTPROSUBJDEL';
    length:=15 END;
345: BEGIN name:='FDOCLPLUSPERSPRO';
    length:=16 END;
346: BEGIN name:='FDOCLMINUSPERSPRO';
    length:=17 END;
347: BEGIN name:='FDOCLMINUSPERSPRO2';
    length:=18 END;
348: BEGIN name:='FDOCLMINPERSMINIOCL';
    length:=19 END;
349: BEGIN name:='FDOCLMINPERSMINIOCL2';
    length:=20 END;
350: BEGIN name:='FIOCLCAMBIOSEPLUS';
    length:=17 END;
351: BEGIN name:='FIOCLCAMBIOSEMINUS';
    length:=18 END;
352: BEGIN name:='FIOCLCAMBIOSEPLUS2';
    length:=18 END;
353: BEGIN name:='FIOCLCAMBIOSEMINUS2';
    length:=19 END;
354: BEGIN name:='FDOCLPLUSPERSPRO2';
    length:=17 END;
355: BEGIN name:='FADVCONTROL';
    length:=11 END;
356: BEGIN name:='FPREADVCONTROL';
    length:=14 END;
357: BEGIN name:='FOBJTOOBJCONTROL';
    length:=16 END;
358: BEGIN name:='FNEGDEL1';
    length:=8 END;
359: BEGIN name:='FARGREFLSPELLING1';
    length:=17 END;
360: BEGIN name:='FPRONIODEL';
    length:=10 END;
361: BEGIN name:='FPRONIODEL2';
    length:=11 END;
362: BEGIN name:='FPRONIODELINF';
    length:=13 END;
363: BEGIN name:='FPRONIODEL2INF';
    length:=14 END;
364: BEGIN name:='FSESPELLING1';
    length:=12 END;
365: BEGIN name:='FSESPELLING2';
    length:=12 END;
366: BEGIN name:='FSESPELLING3';
    length:=12 END;
367: BEGIN name:='FSESPELLING4';
    length:=12 END;
368: BEGIN name:='FSESPELLING5';
    length:=12 END;
369: BEGIN name:='FSESPELLING6';
    length:=12 END;
370: BEGIN name:='FHABERQUESUBJDEL';
    length:=16 END;
END;
END;
 PROCEDURE LDMrules_subgrammarname(sg:LDMrules_subgrammarindex;
VAR name:string;VAR length:INTEGER);
BEGIN
CASE sg OF
1: BEGIN name:='IDENTIFICATIONAL';
    length:=16 END;
2: BEGIN name:='EXISTENTIAL';
    length:=11 END;
3: BEGIN name:='CARDINALS';
    length:=9 END;
4: BEGIN name:='DATUMFORMATION';
    length:=14 END;
5: BEGIN name:='VERBPPROPFORMATION';
    length:=18 END;
6: BEGIN name:='VERBDERIVATION';
    length:=14 END;
7: BEGIN name:='XPPROPTOCLAUSE';
    length:=14 END;
8: BEGIN name:='CLAUSETOSENTENCE';
    length:=16 END;
9: BEGIN name:='TESTNP';
    length:=6 END;
10: BEGIN name:='ADVDERIVATION';
    length:=13 END;
11: BEGIN name:='ADVPFORMATION';
    length:=13 END;
12: BEGIN name:='ADVPPROPFORMATION';
    length:=17 END;
13: BEGIN name:='ADVPPROPTOADVPFORMULA';
    length:=21 END;
14: BEGIN name:='ADVPFORMULATOADVPPROP';
    length:=21 END;
15: BEGIN name:='UTTERANCE';
    length:=9 END;
16: BEGIN name:='QPFORMATION';
    length:=11 END;
17: BEGIN name:='NPDERIVATION';
    length:=12 END;
18: BEGIN name:='CNFORMATION';
    length:=11 END;
19: BEGIN name:='NPFORMATION';
    length:=11 END;
20: BEGIN name:='DETDERIVATION';
    length:=13 END;
21: BEGIN name:='DETPFORMATION';
    length:=13 END;
22: BEGIN name:='NPPROPFORMATION';
    length:=15 END;
23: BEGIN name:='TONPPROP';
    length:=8 END;
24: BEGIN name:='ADJDERIVATION';
    length:=13 END;
25: BEGIN name:='ADJPPROPFORMATION';
    length:=17 END;
26: BEGIN name:='ADJPPROPTOADJPFORMULA';
    length:=21 END;
27: BEGIN name:='ADJPFORMULATOADJPPROP';
    length:=21 END;
28: BEGIN name:='PREPDERIVATION';
    length:=14 END;
29: BEGIN name:='PREPPPROPFORMATION';
    length:=18 END;
30: BEGIN name:='PREPPPROPTOPREPPFORMULA';
    length:=23 END;
31: BEGIN name:='PREPPFORMULATOPREPPPROP';
    length:=23 END;
32: BEGIN name:='PREPPFORMATION';
    length:=14 END;
END;
END;
 FUNCTION LDMrules_MinSubgrammarIndex:LDMrules_Subgrammarindex;
BEGIN
LDMrules_MinSubgrammarIndex:=1
END;
 FUNCTION LDMrules_MaxSubgrammarIndex:LDMrules_Subgrammarindex;
BEGIN
LDMrules_MaxSubgrammarIndex:=32
END;
 PROCEDURE LDMrules_TheCtrlExpr(sg:LDMrules_SubgrammarIndex;VAR ce:LDMRULES_CtrlExpr);
BEGIN
LDSUBGRAMMARS_TheCtrlExpr(sg,ce);
END;
 PROCEDURE LDMrules_Init;
BEGIN
LDSUBGRAMMARS_init;
LSMRUQUO_init;
END;
 PROCEDURE LDMRULES_subgrammarnumber(
R1:LDMRULES_RuleIndex;VAR R2:LDMRULES_SubgrammarIndex);
BEGIN
CASE R1 OF
17: R2:=1;
18: R2:=1;
19: R2:=1;
20: R2:=1;
21: R2:=1;
22: R2:=1;
23: R2:=1;
25: R2:=1;
26: R2:=1;
27: R2:=1;
28: R2:=1;
29: R2:=1;
30: R2:=1;
24: R2:=1;
31: R2:=2;
32: R2:=2;
35: R2:=2;
36: R2:=2;
37: R2:=2;
38: R2:=2;
33: R2:=2;
34: R2:=2;
74: R2:=3;
75: R2:=3;
78: R2:=4;
79: R2:=4;
80: R2:=4;
81: R2:=4;
82: R2:=4;
5: R2:=5;
6: R2:=5;
7: R2:=5;
8: R2:=5;
9: R2:=5;
10: R2:=5;
11: R2:=5;
12: R2:=5;
15: R2:=5;
13: R2:=5;
14: R2:=5;
16: R2:=5;
3: R2:=5;
4: R2:=5;
389: R2:=5;
391: R2:=5;
390: R2:=5;
383: R2:=5;
384: R2:=5;
385: R2:=5;
45: R2:=5;
172: R2:=5;
173: R2:=5;
171: R2:=5;
48: R2:=5;
49: R2:=5;
50: R2:=5;
51: R2:=5;
46: R2:=5;
47: R2:=5;
39: R2:=5;
40: R2:=5;
41: R2:=5;
42: R2:=5;
43: R2:=5;
44: R2:=5;
2: R2:=6;
97: R2:=7;
98: R2:=7;
117: R2:=7;
99: R2:=7;
100: R2:=7;
101: R2:=7;
102: R2:=7;
103: R2:=7;
104: R2:=7;
105: R2:=7;
106: R2:=7;
107: R2:=7;
108: R2:=7;
109: R2:=7;
110: R2:=7;
111: R2:=7;
112: R2:=7;
113: R2:=7;
114: R2:=7;
115: R2:=7;
116: R2:=7;
366: R2:=7;
367: R2:=7;
168: R2:=7;
368: R2:=7;
369: R2:=7;
370: R2:=7;
87: R2:=7;
88: R2:=7;
89: R2:=7;
90: R2:=7;
91: R2:=7;
92: R2:=7;
93: R2:=7;
95: R2:=7;
96: R2:=7;
182: R2:=7;
181: R2:=7;
200: R2:=7;
201: R2:=7;
202: R2:=7;
184: R2:=7;
185: R2:=7;
187: R2:=7;
190: R2:=7;
191: R2:=7;
192: R2:=7;
205: R2:=7;
203: R2:=7;
204: R2:=7;
188: R2:=7;
193: R2:=7;
195: R2:=7;
194: R2:=7;
196: R2:=7;
197: R2:=7;
198: R2:=7;
199: R2:=7;
189: R2:=7;
206: R2:=7;
83: R2:=7;
84: R2:=7;
85: R2:=7;
86: R2:=7;
118: R2:=7;
119: R2:=7;
120: R2:=7;
121: R2:=7;
122: R2:=7;
123: R2:=7;
124: R2:=7;
126: R2:=7;
125: R2:=7;
377: R2:=7;
371: R2:=8;
373: R2:=8;
374: R2:=8;
372: R2:=8;
149: R2:=8;
153: R2:=8;
150: R2:=8;
151: R2:=8;
152: R2:=8;
154: R2:=8;
156: R2:=8;
160: R2:=8;
157: R2:=8;
158: R2:=8;
159: R2:=8;
166: R2:=8;
167: R2:=8;
148: R2:=8;
161: R2:=8;
162: R2:=8;
169: R2:=8;
170: R2:=8;
155: R2:=8;
163: R2:=8;
164: R2:=8;
127: R2:=8;
128: R2:=8;
129: R2:=8;
130: R2:=8;
131: R2:=8;
132: R2:=8;
137: R2:=8;
133: R2:=8;
134: R2:=8;
135: R2:=8;
145: R2:=8;
146: R2:=8;
138: R2:=8;
139: R2:=8;
140: R2:=8;
136: R2:=8;
141: R2:=8;
142: R2:=8;
143: R2:=8;
144: R2:=8;
375: R2:=8;
147: R2:=8;
376: R2:=8;
378: R2:=8;
379: R2:=8;
380: R2:=8;
381: R2:=8;
382: R2:=8;
238: R2:=8;
234: R2:=8;
235: R2:=8;
236: R2:=8;
237: R2:=8;
165: R2:=9;
213: R2:=10;
214: R2:=10;
215: R2:=11;
216: R2:=11;
229: R2:=11;
230: R2:=11;
231: R2:=11;
232: R2:=11;
233: R2:=11;
217: R2:=12;
218: R2:=12;
219: R2:=12;
220: R2:=12;
53: R2:=12;
55: R2:=12;
57: R2:=12;
59: R2:=12;
66: R2:=12;
67: R2:=12;
221: R2:=12;
222: R2:=13;
223: R2:=13;
224: R2:=13;
225: R2:=14;
226: R2:=14;
227: R2:=14;
228: R2:=14;
239: R2:=15;
240: R2:=15;
241: R2:=15;
242: R2:=15;
243: R2:=15;
244: R2:=15;
245: R2:=15;
292: R2:=16;
293: R2:=16;
294: R2:=16;
295: R2:=16;
296: R2:=16;
297: R2:=16;
298: R2:=16;
299: R2:=16;
300: R2:=17;
303: R2:=17;
306: R2:=17;
304: R2:=17;
305: R2:=17;
301: R2:=18;
302: R2:=18;
307: R2:=18;
308: R2:=18;
309: R2:=18;
310: R2:=18;
388: R2:=18;
386: R2:=18;
311: R2:=18;
312: R2:=18;
392: R2:=18;
393: R2:=18;
322: R2:=18;
321: R2:=18;
314: R2:=18;
315: R2:=18;
316: R2:=18;
320: R2:=18;
317: R2:=18;
318: R2:=18;
319: R2:=18;
330: R2:=18;
313: R2:=18;
263: R2:=19;
264: R2:=19;
265: R2:=19;
266: R2:=19;
267: R2:=19;
268: R2:=19;
269: R2:=19;
270: R2:=19;
271: R2:=19;
272: R2:=19;
273: R2:=19;
396: R2:=19;
274: R2:=19;
275: R2:=19;
399: R2:=19;
397: R2:=19;
398: R2:=19;
76: R2:=19;
276: R2:=19;
277: R2:=19;
278: R2:=19;
279: R2:=19;
281: R2:=19;
280: R2:=19;
394: R2:=19;
395: R2:=19;
282: R2:=20;
283: R2:=21;
284: R2:=21;
286: R2:=21;
287: R2:=21;
77: R2:=21;
290: R2:=21;
285: R2:=21;
288: R2:=21;
289: R2:=21;
323: R2:=22;
324: R2:=22;
325: R2:=22;
68: R2:=22;
69: R2:=22;
70: R2:=22;
71: R2:=22;
72: R2:=22;
73: R2:=22;
331: R2:=23;
326: R2:=23;
327: R2:=23;
328: R2:=23;
329: R2:=23;
251: R2:=24;
252: R2:=24;
253: R2:=25;
254: R2:=25;
255: R2:=25;
248: R2:=25;
249: R2:=25;
250: R2:=25;
207: R2:=25;
208: R2:=25;
209: R2:=25;
63: R2:=25;
62: R2:=25;
60: R2:=25;
256: R2:=25;
61: R2:=25;
257: R2:=25;
258: R2:=25;
259: R2:=26;
260: R2:=26;
210: R2:=26;
211: R2:=26;
212: R2:=26;
261: R2:=26;
262: R2:=26;
332: R2:=27;
333: R2:=27;
334: R2:=27;
335: R2:=27;
336: R2:=27;
337: R2:=27;
338: R2:=27;
339: R2:=27;
341: R2:=28;
342: R2:=29;
343: R2:=29;
344: R2:=29;
52: R2:=29;
54: R2:=29;
56: R2:=29;
58: R2:=29;
175: R2:=29;
176: R2:=29;
177: R2:=29;
64: R2:=29;
65: R2:=29;
345: R2:=29;
347: R2:=29;
346: R2:=29;
348: R2:=30;
349: R2:=30;
350: R2:=30;
353: R2:=31;
354: R2:=31;
355: R2:=31;
356: R2:=31;
351: R2:=31;
352: R2:=31;
357: R2:=31;
358: R2:=32;
359: R2:=32;
362: R2:=32;
361: R2:=32;
360: R2:=32;
363: R2:=32;
364: R2:=32;
365: R2:=32;
END;{CASE}
END;
 PROCEDURE LDMRULES_ruleparameters(
R:LDMRULES_ruleindex;VAR params:LDMRULES_paramlist);
VAR paramlist,p:LDMRULES_paramlist;
BEGIN
paramlist:=NIL;
CASE R OF
1: BEGIN

  END;
2: BEGIN

  END;
3: BEGIN

  END;
4: BEGIN

  END;
5: BEGIN

  END;
6: BEGIN

  END;
7: BEGIN

  END;
8: BEGIN

  END;
9: BEGIN

  END;
10: BEGIN

  END;
11: BEGIN

  END;
12: BEGIN

  END;
13: BEGIN

  END;
14: BEGIN

  END;
15: BEGIN

  END;
16: BEGIN

  END;
17: BEGIN

  END;
18: BEGIN

  END;
19: BEGIN

  END;
20: BEGIN

  END;
21: BEGIN

  END;
22: BEGIN

  END;
23: BEGIN

  END;
24: BEGIN

  END;
25: BEGIN

  END;
26: BEGIN

  END;
27: BEGIN

  END;
28: BEGIN

  END;
29: BEGIN

  END;
30: BEGIN

  END;
31: BEGIN

  END;
32: BEGIN

  END;
33: BEGIN

  END;
34: BEGIN

  END;
35: BEGIN

  END;
36: BEGIN

  END;
37: BEGIN

  END;
38: BEGIN

  END;
39: BEGIN

  END;
40: BEGIN

  END;
41: BEGIN

  END;
42: BEGIN

  END;
43: BEGIN

  END;
44: BEGIN

  END;
45: BEGIN

  END;
46: BEGIN

  END;
47: BEGIN

  END;
48: BEGIN

  END;
49: BEGIN

  END;
50: BEGIN

  END;
51: BEGIN

  END;
52: BEGIN

  END;
53: BEGIN

  END;
54: BEGIN

  END;
55: BEGIN

  END;
56: BEGIN

  END;
57: BEGIN

  END;
58: BEGIN

  END;
59: BEGIN

  END;
60: BEGIN

  END;
61: BEGIN

  END;
62: BEGIN

  END;
63: BEGIN

  END;
64: BEGIN

  END;
65: BEGIN

  END;
66: BEGIN

  END;
67: BEGIN

  END;
68: BEGIN

  END;
69: BEGIN

  END;
70: BEGIN

  END;
71: BEGIN

  END;
72: BEGIN

  END;
73: BEGIN

  END;
74: BEGIN

  END;
75: BEGIN

  END;
76: BEGIN

  END;
77: BEGIN

  END;
78: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='SUPERPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;
  END;
79: BEGIN

  END;
80: BEGIN

  END;
81: BEGIN

  END;
82: BEGIN

  END;
83: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
84: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
85: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
86: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
87: BEGIN

  END;
88: BEGIN

  END;
89: BEGIN

  END;
90: BEGIN

  END;
91: BEGIN

  END;
92: BEGIN

  END;
93: BEGIN

  END;
94: BEGIN

  END;
95: BEGIN

  END;
96: BEGIN

  END;
97: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
98: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
99: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
100: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
101: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
102: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
103: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
104: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
105: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
106: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
107: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
108: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
109: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
110: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
111: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
112: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
113: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
114: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
115: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
116: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
117: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
118: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
119: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
120: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
121: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
122: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
123: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
124: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
125: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
126: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
127: BEGIN

  END;
128: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='MODOPAR';
p^.length:=7;
p^.next:=paramlist;
paramlist:=p;
  END;
129: BEGIN

  END;
130: BEGIN

  END;
131: BEGIN

  END;
132: BEGIN

  END;
133: BEGIN

  END;
134: BEGIN

  END;
135: BEGIN

  END;
136: BEGIN

  END;
137: BEGIN

  END;
138: BEGIN

  END;
139: BEGIN

  END;
140: BEGIN

  END;
141: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='GENEROPAR';
p^.length:=9;
p^.next:=paramlist;
paramlist:=p;LDMRULES_makeparamlist(p);
p^.paramname:='NUMEROPAR';
p^.length:=9;
p^.next:=paramlist;
paramlist:=p;
  END;
142: BEGIN

  END;
143: BEGIN

  END;
144: BEGIN

  END;
145: BEGIN

  END;
146: BEGIN

  END;
147: BEGIN

  END;
148: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
149: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
150: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
151: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
152: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
153: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
154: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
155: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
156: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
157: BEGIN

  END;
158: BEGIN

  END;
159: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
160: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
161: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
162: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
163: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
164: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
165: BEGIN

  END;
166: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
167: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
168: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
169: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
170: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
171: BEGIN

  END;
172: BEGIN

  END;
173: BEGIN

  END;
174: BEGIN

  END;
175: BEGIN

  END;
176: BEGIN

  END;
177: BEGIN

  END;
178: BEGIN

  END;
179: BEGIN

  END;
180: BEGIN

  END;
181: BEGIN

  END;
182: BEGIN

  END;
183: BEGIN

  END;
184: BEGIN

  END;
185: BEGIN

  END;
186: BEGIN

  END;
187: BEGIN

  END;
188: BEGIN

  END;
189: BEGIN

  END;
190: BEGIN

  END;
191: BEGIN

  END;
192: BEGIN

  END;
193: BEGIN

  END;
194: BEGIN

  END;
195: BEGIN

  END;
196: BEGIN

  END;
197: BEGIN

  END;
198: BEGIN

  END;
199: BEGIN

  END;
200: BEGIN

  END;
201: BEGIN

  END;
202: BEGIN

  END;
203: BEGIN

  END;
204: BEGIN

  END;
205: BEGIN

  END;
206: BEGIN

  END;
207: BEGIN

  END;
208: BEGIN

  END;
209: BEGIN

  END;
210: BEGIN

  END;
211: BEGIN

  END;
212: BEGIN

  END;
213: BEGIN

  END;
214: BEGIN

  END;
215: BEGIN

  END;
216: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='SUPER';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
217: BEGIN

  END;
218: BEGIN

  END;
219: BEGIN

  END;
220: BEGIN

  END;
221: BEGIN

  END;
222: BEGIN

  END;
223: BEGIN

  END;
224: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='SUPER';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
225: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
226: BEGIN

  END;
227: BEGIN

  END;
228: BEGIN

  END;
229: BEGIN

  END;
230: BEGIN

  END;
231: BEGIN

  END;
232: BEGIN

  END;
233: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
234: BEGIN

  END;
235: BEGIN

  END;
236: BEGIN

  END;
237: BEGIN

  END;
238: BEGIN

  END;
239: BEGIN

  END;
240: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='CASESPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;
  END;
241: BEGIN

  END;
242: BEGIN

  END;
243: BEGIN

  END;
244: BEGIN

  END;
245: BEGIN

  END;
246: BEGIN

  END;
247: BEGIN

  END;
248: BEGIN

  END;
249: BEGIN

  END;
250: BEGIN

  END;
251: BEGIN

  END;
252: BEGIN

  END;
253: BEGIN

  END;
254: BEGIN

  END;
255: BEGIN

  END;
256: BEGIN

  END;
257: BEGIN

  END;
258: BEGIN

  END;
259: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
260: BEGIN

  END;
261: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
262: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
263: BEGIN

  END;
264: BEGIN

  END;
265: BEGIN

  END;
266: BEGIN

  END;
267: BEGIN

  END;
268: BEGIN

  END;
269: BEGIN

  END;
270: BEGIN

  END;
271: BEGIN

  END;
272: BEGIN

  END;
273: BEGIN

  END;
274: BEGIN

  END;
275: BEGIN

  END;
276: BEGIN

  END;
277: BEGIN

  END;
278: BEGIN

  END;
279: BEGIN

  END;
280: BEGIN

  END;
281: BEGIN

  END;
282: BEGIN

  END;
283: BEGIN

  END;
284: BEGIN

  END;
285: BEGIN

  END;
286: BEGIN

  END;
287: BEGIN

  END;
288: BEGIN

  END;
289: BEGIN

  END;
290: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='SUPER';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
291: BEGIN

  END;
292: BEGIN

  END;
293: BEGIN

  END;
294: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='SUPER';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
295: BEGIN

  END;
296: BEGIN

  END;
297: BEGIN

  END;
298: BEGIN

  END;
299: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
300: BEGIN

  END;
301: BEGIN

  END;
302: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='NUMBERPAR';
p^.length:=9;
p^.next:=paramlist;
paramlist:=p;
  END;
303: BEGIN

  END;
304: BEGIN

  END;
305: BEGIN

  END;
306: BEGIN

  END;
307: BEGIN

  END;
308: BEGIN

  END;
309: BEGIN

  END;
310: BEGIN

  END;
311: BEGIN

  END;
312: BEGIN

  END;
313: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
314: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
315: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
316: BEGIN

  END;
317: BEGIN

  END;
318: BEGIN

  END;
319: BEGIN

  END;
320: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
321: BEGIN

  END;
322: BEGIN

  END;
323: BEGIN

  END;
324: BEGIN

  END;
325: BEGIN

  END;
326: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
327: BEGIN

  END;
328: BEGIN

  END;
329: BEGIN

  END;
330: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
331: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='SUPER';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
332: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
333: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
334: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
335: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
336: BEGIN

  END;
337: BEGIN

  END;
338: BEGIN

  END;
339: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
340: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
341: BEGIN

  END;
342: BEGIN

  END;
343: BEGIN

  END;
344: BEGIN

  END;
345: BEGIN

  END;
346: BEGIN

  END;
347: BEGIN

  END;
348: BEGIN

  END;
349: BEGIN

  END;
350: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='SUPER';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
351: BEGIN

  END;
352: BEGIN

  END;
353: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
354: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
355: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
356: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
357: BEGIN

  END;
358: BEGIN

  END;
359: BEGIN

  END;
360: BEGIN

  END;
361: BEGIN

  END;
362: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='SUPER';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
363: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
364: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
365: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
366: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
367: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
368: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
369: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
370: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
371: BEGIN

  END;
372: BEGIN

  END;
373: BEGIN

  END;
374: BEGIN

  END;
375: BEGIN

  END;
376: BEGIN

  END;
377: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;LDMRULES_makeparamlist(p);
p^.paramname:='ANTECEDENT';
p^.length:=10;
p^.next:=paramlist;
paramlist:=p;LDMRULES_makeparamlist(p);
p^.paramname:='NUMEROPAR';
p^.length:=9;
p^.next:=paramlist;
paramlist:=p;
  END;
378: BEGIN

  END;
379: BEGIN

  END;
380: BEGIN

  END;
381: BEGIN

  END;
382: BEGIN

  END;
383: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='ADJUNCTPAR';
p^.length:=10;
p^.next:=paramlist;
paramlist:=p;
  END;
384: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='ADJUNCTPAR';
p^.length:=10;
p^.next:=paramlist;
paramlist:=p;
  END;
385: BEGIN

  END;
386: BEGIN

  END;
387: BEGIN

  END;
388: BEGIN

  END;
389: BEGIN

  END;
390: BEGIN

  END;
391: BEGIN

  END;
392: BEGIN

  END;
393: BEGIN

  END;
394: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
395: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
396: BEGIN

  END;
397: BEGIN

  END;
398: BEGIN

  END;
399: BEGIN

  END;
END{CASE};
params:=paramlist;
END;
