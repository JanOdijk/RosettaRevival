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
val413X1:LSDOMAINT_casetype;
val424X1:LSDOMAINT_synpatterntype;
val425X1:LSDOMAINT_synpatterntype;
val435X1:LSDOMAINT_synpatterntype;
val437X1:LSDOMAINT_synpatterntype;
val438X1:LSDOMAINT_synpatterntype;
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
 p^.fieldname.str:='NUMBERPAR' ; p^.fieldname.len:=9;
  LSTYPETOSTR_NUMBERTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X18NUMBERPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='NUMBERPAR' ; p^.fieldname.len:=9;
  LSTYPETOSTR_NUMBERTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X41NUMBERPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
45
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
46
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
47
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
48
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
49
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
50
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
51
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
52
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
53
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
54
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
55
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
56
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
57
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
58
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
59
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
60
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
61
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
62
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
63
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
64
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
65
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
66
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
67
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
73
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
74
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
  STR_integertostr(lsps^.X74ANTECEDENT,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='MULTITUDEPAR' ; p^.fieldname.len:=12;
IF lsps^.X74MULTITUDEPAR THEN
  BEGIN
  p^.fieldvalue.str:='TRUE';
  p^.fieldvalue.len:=4;
  END
ELSE
  BEGIN
  p^.fieldvalue.str:='FALSE';
  p^.fieldvalue.len:=5;
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
75
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
76
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
77
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
78
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
79
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
80
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
81
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
91
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
92
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
93
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
94
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
128
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
129
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
130
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
131
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
132
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
133
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
134
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
135
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
136
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
137
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
138
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
139
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
140
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
141
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
142
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
143
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
144
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
145
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
146
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='VOICEPAR' ; p^.fieldname.len:=8;
  LSTYPETOSTR_VOICETYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X146VOICEPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='VOICEPAR' ; p^.fieldname.len:=8;
  LSTYPETOSTR_VOICETYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X147VOICEPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='VOICEPAR' ; p^.fieldname.len:=8;
  LSTYPETOSTR_VOICETYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X148VOICEPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
193
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
194
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='SUPER' ; p^.fieldname.len:=5;
  LSTYPETOSTR_DEIXISTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X194SUPER);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
199
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
200
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
 p^.fieldname.str:='SUPERPAR' ; p^.fieldname.len:=8;
  LSTYPETOSTR_DEIXISTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X203SUPERPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='SUPER' ; p^.fieldname.len:=5;
  LSTYPETOSTR_DEIXISTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X215SUPER);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='SUPER' ; p^.fieldname.len:=5;
  LSTYPETOSTR_DEIXISTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X228SUPER);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='NUMBERPAR' ; p^.fieldname.len:=9;
  LSTYPETOSTR_NUMBERTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X251NUMBERPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='NUMBERPAR' ; p^.fieldname.len:=9;
  LSTYPETOSTR_NUMBERTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X252NUMBERPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
265
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
271
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
276
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
277
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
278
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
283
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
 p^.fieldname.str:='SUPER' ; p^.fieldname.len:=5;
  LSTYPETOSTR_DEIXISTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X312SUPER);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='SUPER' ; p^.fieldname.len:=5;
  LSTYPETOSTR_DEIXISTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X328SUPER);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
330
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='INDEXPAR' ; p^.fieldname.len:=8;
  STR_integertostr(lsps^.X337INDEXPAR,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='XPMOODPAR' ; p^.fieldname.len:=9;
  LSTYPETOSTR_XPMOODTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X337XPMOODPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='INDEXPAR' ; p^.fieldname.len:=8;
  STR_integertostr(lsps^.X338INDEXPAR,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='XPMOODPAR' ; p^.fieldname.len:=9;
  LSTYPETOSTR_XPMOODTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X338XPMOODPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='INDEXPAR' ; p^.fieldname.len:=8;
  STR_integertostr(lsps^.X339INDEXPAR,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='XPMOODPAR' ; p^.fieldname.len:=9;
  LSTYPETOSTR_XPMOODTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X339XPMOODPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='INDEXPAR' ; p^.fieldname.len:=8;
  STR_integertostr(lsps^.X340INDEXPAR,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='XPMOODPAR' ; p^.fieldname.len:=9;
  LSTYPETOSTR_XPMOODTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X340XPMOODPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='INDEXPAR' ; p^.fieldname.len:=8;
  STR_integertostr(lsps^.X341INDEXPAR,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='XPMOODPAR' ; p^.fieldname.len:=9;
  LSTYPETOSTR_XPMOODTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X341XPMOODPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='INDEXPAR' ; p^.fieldname.len:=8;
  STR_integertostr(lsps^.X342INDEXPAR,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='XPMOODPAR' ; p^.fieldname.len:=9;
  LSTYPETOSTR_XPMOODTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X342XPMOODPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='INDEXPAR' ; p^.fieldname.len:=8;
  STR_integertostr(lsps^.X343INDEXPAR,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='XPMOODPAR' ; p^.fieldname.len:=9;
  LSTYPETOSTR_XPMOODTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X343XPMOODPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='SUPERPAR' ; p^.fieldname.len:=8;
  LSTYPETOSTR_DEIXISTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X361SUPERPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='SUPER' ; p^.fieldname.len:=5;
  LSTYPETOSTR_DEIXISTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X371SUPER);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
375
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
376
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
377
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
390
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
391
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
392
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
400
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
401
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
402
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
403
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
404
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
405
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
406
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
407
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
408
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
409
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
410
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
411
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
412
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
413
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='CASESPAR' ; p^.fieldname.len:=8;
p^.typeindicator:=enumset;
FOR val413X1 := nominative TO omegacase DO
  BEGIN
  IF val413X1 IN lsps^.X413CASESPAR THEN
    BEGIN
    new(q);
    q^.nextvalue:=p^.setvalue;
    p^.setvalue:=q;
    LSTYPETOSTR_casetype(p^.setvalue^.eltvalue.str,p^.setvalue^.eltvalue.len,val413X1);
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
414
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
415
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
416
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
417
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
418
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
419
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='ADJUNCTPAR' ; p^.fieldname.len:=10;
  LSTYPETOSTR_ADJUNCTTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X419ADJUNCTPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
420
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='ADJUNCTPAR' ; p^.fieldname.len:=10;
  LSTYPETOSTR_ADJUNCTTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X420ADJUNCTPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
421
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
422
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
423
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
424
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='VPID' ; p^.fieldname.len:=4;
p^.typeindicator:=enumset;
FOR val424X1 := synASIFSENT TO synDONP_OPENINFSENT DO
  BEGIN
  IF val424X1 IN lsps^.X424VPID THEN
    BEGIN
    new(q);
    q^.nextvalue:=p^.setvalue;
    p^.setvalue:=q;
    LSTYPETOSTR_synpatterntype(p^.setvalue^.eltvalue.str,p^.setvalue^.eltvalue.len,val424X1);
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
425
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='VPID' ; p^.fieldname.len:=4;
p^.typeindicator:=enumset;
FOR val425X1 := synASIFSENT TO synDONP_OPENINFSENT DO
  BEGIN
  IF val425X1 IN lsps^.X425VPID THEN
    BEGIN
    new(q);
    q^.nextvalue:=p^.setvalue;
    p^.setvalue:=q;
    LSTYPETOSTR_synpatterntype(p^.setvalue^.eltvalue.str,p^.setvalue^.eltvalue.len,val425X1);
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
426
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
427
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
428
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
429
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
430
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
431
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
432
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
433
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
434
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
435
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
436
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
437
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
438
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
439
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
440
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
441
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
442
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
443
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
444
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
445
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
446
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
447
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
448
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
449
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
450
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='CONTROLLERPAR' ; p^.fieldname.len:=13;
  STR_integertostr(lsps^.X450CONTROLLERPAR,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
451
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
452
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
453
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
454
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
455
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
IF STR_compare(name,length,'RNNCOMPOUNDS',12)=0 THEN
  R:=2;
IF STR_compare(name,length,'RVNCOMPOUNDS',12)=0 THEN
  R:=3;
IF STR_compare(name,length,'RNOUNDIM',8)=0 THEN
  R:=4;
IF STR_compare(name,length,'RPNDIM',6)=0 THEN
  R:=5;
IF STR_compare(name,length,'RBVERBTOSUB',11)=0 THEN
  R:=6;
IF STR_compare(name,length,'RNOPUNC',7)=0 THEN
  R:=7;
IF STR_compare(name,length,'RQUMARK',7)=0 THEN
  R:=8;
IF STR_compare(name,length,'REXCLAM',7)=0 THEN
  R:=9;
IF STR_compare(name,length,'RPERIOD',7)=0 THEN
  R:=10;
IF STR_compare(name,length,'RCOORDINTRO',11)=0 THEN
  R:=11;
IF STR_compare(name,length,'RNPOPENINGMOOD',14)=0 THEN
  R:=12;
IF STR_compare(name,length,'RNPPOSSINGMOOD',14)=0 THEN
  R:=13;
IF STR_compare(name,length,'RLETSMOOD',9)=0 THEN
  R:=14;
IF STR_compare(name,length,'RVPPROPMOOD',11)=0 THEN
  R:=15;
IF STR_compare(name,length,'RWOULDINSERTION',15)=0 THEN
  R:=16;
IF STR_compare(name,length,'RNOWOULDINSERTION',17)=0 THEN
  R:=17;
IF STR_compare(name,length,'RIMPMOODPLEASE',14)=0 THEN
  R:=18;
IF STR_compare(name,length,'ROPENINFMOOD',12)=0 THEN
  R:=19;
IF STR_compare(name,length,'RCLOSEDINFMOOD',14)=0 THEN
  R:=20;
IF STR_compare(name,length,'ROPENTOINFMOOD',14)=0 THEN
  R:=21;
IF STR_compare(name,length,'RCLOSEDTOINFMOOD',16)=0 THEN
  R:=22;
IF STR_compare(name,length,'RWHTOINFMOOD',12)=0 THEN
  R:=23;
IF STR_compare(name,length,'RTOINFRELMOOD',13)=0 THEN
  R:=24;
IF STR_compare(name,length,'RTOINFWHMODMOOD',15)=0 THEN
  R:=25;
IF STR_compare(name,length,'RFORTOINFMOOD',13)=0 THEN
  R:=26;
IF STR_compare(name,length,'RFORTOINFRELMOOD',16)=0 THEN
  R:=27;
IF STR_compare(name,length,'RFORTOINFWHMODMOOD',18)=0 THEN
  R:=28;
IF STR_compare(name,length,'ROPENINGMOOD',12)=0 THEN
  R:=29;
IF STR_compare(name,length,'RANTERELINGMOOD',15)=0 THEN
  R:=30;
IF STR_compare(name,length,'RACCINGMOOD',11)=0 THEN
  R:=31;
IF STR_compare(name,length,'RPASTPARTMOOD',13)=0 THEN
  R:=32;
IF STR_compare(name,length,'RINDICMOODMAIN',14)=0 THEN
  R:=33;
IF STR_compare(name,length,'RINDICMOODSUB',13)=0 THEN
  R:=34;
IF STR_compare(name,length,'RINDICFUTMOODSUB1',17)=0 THEN
  R:=35;
IF STR_compare(name,length,'RINDICFUTMOODSUB2',17)=0 THEN
  R:=36;
IF STR_compare(name,length,'RINDICWHMOODMAIN',16)=0 THEN
  R:=37;
IF STR_compare(name,length,'RINDICWHMOODSUB',15)=0 THEN
  R:=38;
IF STR_compare(name,length,'RINDICYESNOMOODMAIN',19)=0 THEN
  R:=39;
IF STR_compare(name,length,'RINDICYESNOMOODSUB',18)=0 THEN
  R:=40;
IF STR_compare(name,length,'RIMPMOOD',8)=0 THEN
  R:=41;
IF STR_compare(name,length,'RFINRELMOOD',11)=0 THEN
  R:=42;
IF STR_compare(name,length,'RWHMODMOOD',10)=0 THEN
  R:=43;
IF STR_compare(name,length,'RIDSUBSTITUTION1',16)=0 THEN
  R:=44;
IF STR_compare(name,length,'RIDSUBSTITUTION2',16)=0 THEN
  R:=45;
IF STR_compare(name,length,'RIDSUBSTITUTION3',16)=0 THEN
  R:=46;
IF STR_compare(name,length,'RXPPVARPREPNPSUBST',18)=0 THEN
  R:=47;
IF STR_compare(name,length,'RXPPOBJNPSUBST',14)=0 THEN
  R:=48;
IF STR_compare(name,length,'RDEEPSUBST1',11)=0 THEN
  R:=49;
IF STR_compare(name,length,'RDEEPSUBSTPP',12)=0 THEN
  R:=50;
IF STR_compare(name,length,'RDEEPSUBSTVARPP',15)=0 THEN
  R:=51;
IF STR_compare(name,length,'RDEEPSUBSTADVP',14)=0 THEN
  R:=52;
IF STR_compare(name,length,'RVPADVPPSUBST',13)=0 THEN
  R:=53;
IF STR_compare(name,length,'RBIGPROSUBST',12)=0 THEN
  R:=54;
IF STR_compare(name,length,'ROBJNPSUBST',11)=0 THEN
  R:=55;
IF STR_compare(name,length,'RSUBJNPSUBST',12)=0 THEN
  R:=56;
IF STR_compare(name,length,'RSHIFTNPSUBST',13)=0 THEN
  R:=57;
IF STR_compare(name,length,'RPREPNPSUBST',12)=0 THEN
  R:=58;
IF STR_compare(name,length,'RVARPREPNPSUBST',15)=0 THEN
  R:=59;
IF STR_compare(name,length,'RVARPREPGENSUBST',16)=0 THEN
  R:=60;
IF STR_compare(name,length,'RLOCADVSUBST',12)=0 THEN
  R:=61;
IF STR_compare(name,length,'RSHIFTLOCADVSUBST',17)=0 THEN
  R:=62;
IF STR_compare(name,length,'RSENTADVSUBST',13)=0 THEN
  R:=63;
IF STR_compare(name,length,'RSENTPREPPSUBST',15)=0 THEN
  R:=64;
IF STR_compare(name,length,'RPROSENTSUBST',13)=0 THEN
  R:=65;
IF STR_compare(name,length,'RSOPROSENTSUBST',15)=0 THEN
  R:=66;
IF STR_compare(name,length,'RNOTPROSENTSUBST',16)=0 THEN
  R:=67;
IF STR_compare(name,length,'RPOSSUBST',9)=0 THEN
  R:=68;
IF STR_compare(name,length,'RSENTNEGSUBST',13)=0 THEN
  R:=69;
IF STR_compare(name,length,'RSENTMELTNEGSUBST',17)=0 THEN
  R:=70;
IF STR_compare(name,length,'RVPMELTNEGSUBST',15)=0 THEN
  R:=71;
IF STR_compare(name,length,'RSHIFTPREPNPSUBST',17)=0 THEN
  R:=72;
IF STR_compare(name,length,'RSHIFTVARPREPNPSUBST',20)=0 THEN
  R:=73;
IF STR_compare(name,length,'ROBJRECIPROSUBST',16)=0 THEN
  R:=74;
IF STR_compare(name,length,'RBYEMPTYSUBST',13)=0 THEN
  R:=75;
IF STR_compare(name,length,'RPREPEMPTYSUBST1',16)=0 THEN
  R:=76;
IF STR_compare(name,length,'RPREPEMPTYSUBST2',16)=0 THEN
  R:=77;
IF STR_compare(name,length,'ROBJEMPTYSUBST',14)=0 THEN
  R:=78;
IF STR_compare(name,length,'RINDOBJEMPTYSUBST',17)=0 THEN
  R:=79;
IF STR_compare(name,length,'RONESUBJEMPTYSUBST',18)=0 THEN
  R:=80;
IF STR_compare(name,length,'REMPTYINADJPSUBST',17)=0 THEN
  R:=81;
IF STR_compare(name,length,'RTEMPCONJSENTMOVETOLEFT',23)=0 THEN
  R:=82;
IF STR_compare(name,length,'RFINPRESENTDEIXIS',17)=0 THEN
  R:=83;
IF STR_compare(name,length,'RFINPASTDEIXIS',14)=0 THEN
  R:=84;
IF STR_compare(name,length,'RFINPRESFUTDEIXIS',17)=0 THEN
  R:=85;
IF STR_compare(name,length,'RREFVARINSERTION',16)=0 THEN
  R:=86;
IF STR_compare(name,length,'RDURVARINSERTION',16)=0 THEN
  R:=87;
IF STR_compare(name,length,'RRETROVARINSERTION',18)=0 THEN
  R:=88;
IF STR_compare(name,length,'RFREQVARINSERTION',17)=0 THEN
  R:=89;
IF STR_compare(name,length,'RTEMPADVSUBSTITUTION1',21)=0 THEN
  R:=90;
IF STR_compare(name,length,'RTEMPADVSUBSTSHIFT1',19)=0 THEN
  R:=91;
IF STR_compare(name,length,'RTEMPADVSUBSTITUTION2',21)=0 THEN
  R:=92;
IF STR_compare(name,length,'RTEMPADVSUBSTSHIFT2',19)=0 THEN
  R:=93;
IF STR_compare(name,length,'RTEMPADVSENTSUBSTITUTION',24)=0 THEN
  R:=94;
IF STR_compare(name,length,'RASPECTIMPERFECTIVE1',20)=0 THEN
  R:=95;
IF STR_compare(name,length,'RASPECTIMPERFECTIVE2',20)=0 THEN
  R:=96;
IF STR_compare(name,length,'RASPECTPERFECTIVE',17)=0 THEN
  R:=97;
IF STR_compare(name,length,'RASPECTHABITUAL',15)=0 THEN
  R:=98;
IF STR_compare(name,length,'RACTCLAUSEFORMATION',19)=0 THEN
  R:=99;
IF STR_compare(name,length,'RPASCLAUSEFORMATION',19)=0 THEN
  R:=100;
IF STR_compare(name,length,'RADJPCLAUSEFORMATION',20)=0 THEN
  R:=101;
IF STR_compare(name,length,'RNPCLAUSEFORMATION',18)=0 THEN
  R:=102;
IF STR_compare(name,length,'REXISTNPCLAUSEFORMATION',23)=0 THEN
  R:=103;
IF STR_compare(name,length,'RIDENTNPCLAUSEFORMATION',23)=0 THEN
  R:=104;
IF STR_compare(name,length,'RPREPPCLAUSEFORMATION',21)=0 THEN
  R:=105;
IF STR_compare(name,length,'RCLOSEDNPPROPSUBST',18)=0 THEN
  R:=106;
IF STR_compare(name,length,'ROPENNPPROPSUBST',16)=0 THEN
  R:=107;
IF STR_compare(name,length,'RCLOSEDADJPPROPSUBST',20)=0 THEN
  R:=108;
IF STR_compare(name,length,'ROPENADJPPROPSUBST',18)=0 THEN
  R:=109;
IF STR_compare(name,length,'ROPENADJPPROPSENTENCESUBST',26)=0 THEN
  R:=110;
IF STR_compare(name,length,'RCLOSEDVERBPPROPSUBST',21)=0 THEN
  R:=111;
IF STR_compare(name,length,'ROPENVERBPPROPSUBST',19)=0 THEN
  R:=112;
IF STR_compare(name,length,'RPREPSENTSUBST',14)=0 THEN
  R:=113;
IF STR_compare(name,length,'RBYSENTSUBST',12)=0 THEN
  R:=114;
IF STR_compare(name,length,'RCOMPLSENTSUBST',15)=0 THEN
  R:=115;
IF STR_compare(name,length,'RLDISLOCSUBJSENTSUBST',21)=0 THEN
  R:=116;
IF STR_compare(name,length,'REXTRAPSUBJSENTSUBST',20)=0 THEN
  R:=117;
IF STR_compare(name,length,'RMODALCOMPLSENTSUBST1',21)=0 THEN
  R:=118;
IF STR_compare(name,length,'RMODALCOMPLSENTSUBST2',21)=0 THEN
  R:=119;
IF STR_compare(name,length,'ROBJNPSENTSUBST',15)=0 THEN
  R:=120;
IF STR_compare(name,length,'RSUBJNPSENTSUBST',16)=0 THEN
  R:=121;
IF STR_compare(name,length,'RPREPOBJNPSENTSUBST',19)=0 THEN
  R:=122;
IF STR_compare(name,length,'RCONJSENTSUBST',14)=0 THEN
  R:=123;
IF STR_compare(name,length,'RCONJPREPNPSUBST',16)=0 THEN
  R:=124;
IF STR_compare(name,length,'RFINALCONJSENTSUBST',19)=0 THEN
  R:=125;
IF STR_compare(name,length,'RFINALCONJPREPNPSUBST',21)=0 THEN
  R:=126;
IF STR_compare(name,length,'RADJPPCOMPLSENTSUBST',20)=0 THEN
  R:=127;
IF STR_compare(name,length,'RXPPEXTRAPSUBJSENTSUBST',23)=0 THEN
  R:=128;
IF STR_compare(name,length,'RLOCCLOSEDPREPPPROPSUBST',24)=0 THEN
  R:=129;
IF STR_compare(name,length,'RLOCOPENPREPPPROPSUBST',22)=0 THEN
  R:=130;
IF STR_compare(name,length,'RDIRCLOSEDPREPPPROPSUBST',24)=0 THEN
  R:=131;
IF STR_compare(name,length,'RDIROPENPREPPPROPSUBST',22)=0 THEN
  R:=132;
IF STR_compare(name,length,'ROTHERCLOSEDPREPPPROPSUBST',26)=0 THEN
  R:=133;
IF STR_compare(name,length,'ROTHEROPENPREPPPROPSUBST',24)=0 THEN
  R:=134;
IF STR_compare(name,length,'RLOCCLOSEDADVPPROPSUBST',23)=0 THEN
  R:=135;
IF STR_compare(name,length,'RLOCOPENADVPPROPSUBST',21)=0 THEN
  R:=136;
IF STR_compare(name,length,'RDIRCLOSEDADVPPROPSUBST',23)=0 THEN
  R:=137;
IF STR_compare(name,length,'RDIROPENADVPPROPSUBST',21)=0 THEN
  R:=138;
IF STR_compare(name,length,'ROTHERCLOSEDADVPPROPSUBST',25)=0 THEN
  R:=139;
IF STR_compare(name,length,'ROTHEROPENADVPPROPSUBST',23)=0 THEN
  R:=140;
IF STR_compare(name,length,'RCLOSEDPREPNPPROPSUBST',22)=0 THEN
  R:=141;
IF STR_compare(name,length,'ROPENPREPNPPROPSUBST',20)=0 THEN
  R:=142;
IF STR_compare(name,length,'RCLOSEDPREPADJPPROPSUBST',24)=0 THEN
  R:=143;
IF STR_compare(name,length,'ROPENPREPADJPPROPSUBST',22)=0 THEN
  R:=144;
IF STR_compare(name,length,'ROPENPREPPREPPPROPSUBST',23)=0 THEN
  R:=145;
IF STR_compare(name,length,'RACTIVE',7)=0 THEN
  R:=146;
IF STR_compare(name,length,'RPASSIVE1',9)=0 THEN
  R:=147;
IF STR_compare(name,length,'RPASSIVE2',9)=0 THEN
  R:=148;
IF STR_compare(name,length,'RSIDSTARTVPPROP120',18)=0 THEN
  R:=149;
IF STR_compare(name,length,'RSIDSTARTVPPROP123',18)=0 THEN
  R:=150;
IF STR_compare(name,length,'RSTARTVPPROP000',15)=0 THEN
  R:=151;
IF STR_compare(name,length,'RSTARTVPPROP100',15)=0 THEN
  R:=152;
IF STR_compare(name,length,'RSTARTVPPROP010A',16)=0 THEN
  R:=153;
IF STR_compare(name,length,'RSTARTVPPROP010B',16)=0 THEN
  R:=154;
IF STR_compare(name,length,'RSTARTVPPROP120',15)=0 THEN
  R:=155;
IF STR_compare(name,length,'RSTARTVPPROP012',15)=0 THEN
  R:=156;
IF STR_compare(name,length,'RSTARTVPPROP123',15)=0 THEN
  R:=157;
IF STR_compare(name,length,'RSTARTVPPROP132',15)=0 THEN
  R:=158;
IF STR_compare(name,length,'RADJFOROBJMOD',13)=0 THEN
  R:=159;
IF STR_compare(name,length,'RADJMOD1',8)=0 THEN
  R:=160;
IF STR_compare(name,length,'RADJTOMOD1',10)=0 THEN
  R:=161;
IF STR_compare(name,length,'RADJDEGREEMOD1',14)=0 THEN
  R:=162;
IF STR_compare(name,length,'RADJDEGREEMOD2A',15)=0 THEN
  R:=163;
IF STR_compare(name,length,'RADJDEGREEMOD2B',15)=0 THEN
  R:=164;
IF STR_compare(name,length,'RBADJTOSUB1',11)=0 THEN
  R:=165;
IF STR_compare(name,length,'RORDINALFORM',12)=0 THEN
  R:=166;
IF STR_compare(name,length,'RSTARTADJPPROP000',17)=0 THEN
  R:=167;
IF STR_compare(name,length,'RSTARTADJPPROP100',17)=0 THEN
  R:=168;
IF STR_compare(name,length,'RSTARTADJPPROP120',17)=0 THEN
  R:=169;
IF STR_compare(name,length,'RSTARTADJPPROP123',17)=0 THEN
  R:=170;
IF STR_compare(name,length,'RSTARTADJPPROP010',17)=0 THEN
  R:=171;
IF STR_compare(name,length,'RSTARTADJPPROP012',17)=0 THEN
  R:=172;
IF STR_compare(name,length,'RADJCONJSENTVAR',15)=0 THEN
  R:=173;
IF STR_compare(name,length,'RADJFINALCONJSENTVAR',20)=0 THEN
  R:=174;
IF STR_compare(name,length,'RADJSENTADVVAR',14)=0 THEN
  R:=175;
IF STR_compare(name,length,'RADJLOCADVVAR',13)=0 THEN
  R:=176;
IF STR_compare(name,length,'RADJLOCPREPPVAR',15)=0 THEN
  R:=177;
IF STR_compare(name,length,'RNPPROPFORMATION',16)=0 THEN
  R:=178;
IF STR_compare(name,length,'RNPREFVARINSERT',15)=0 THEN
  R:=179;
IF STR_compare(name,length,'RNPRETROVARINSERT',17)=0 THEN
  R:=180;
IF STR_compare(name,length,'RNPCONJSENTVAR',14)=0 THEN
  R:=181;
IF STR_compare(name,length,'RNPFINALCONJSENTVAR',19)=0 THEN
  R:=182;
IF STR_compare(name,length,'RNPSENTADVVAR',13)=0 THEN
  R:=183;
IF STR_compare(name,length,'RNPLOCADVVAR',12)=0 THEN
  R:=184;
IF STR_compare(name,length,'RNPLOCPREPPVAR',14)=0 THEN
  R:=185;
IF STR_compare(name,length,'RNPPSUBJSUBST',13)=0 THEN
  R:=186;
IF STR_compare(name,length,'ROPENNPPROPFORMATION',20)=0 THEN
  R:=187;
IF STR_compare(name,length,'RCLOSEDNPPROPFORMATION',22)=0 THEN
  R:=188;
IF STR_compare(name,length,'RNPPNOPUNC',10)=0 THEN
  R:=189;
IF STR_compare(name,length,'RNOUNARGMOD1',12)=0 THEN
  R:=190;
IF STR_compare(name,length,'RNOUNARGMOD2',12)=0 THEN
  R:=191;
IF STR_compare(name,length,'RNPARGMODSUBST1',15)=0 THEN
  R:=192;
IF STR_compare(name,length,'RNPARGMODSUBST2',15)=0 THEN
  R:=193;
IF STR_compare(name,length,'RIDNPPSUPERDEIXIS',17)=0 THEN
  R:=194;
IF STR_compare(name,length,'RADJVOICEDEFAULT',16)=0 THEN
  R:=195;
IF STR_compare(name,length,'RADJSENTENCESUBSTITUTION1',25)=0 THEN
  R:=196;
IF STR_compare(name,length,'RADJPFORMULAFORMATION1',22)=0 THEN
  R:=197;
IF STR_compare(name,length,'RADJEMPTYSUBST1',15)=0 THEN
  R:=198;
IF STR_compare(name,length,'RADJEMPTYSUBST2',15)=0 THEN
  R:=199;
IF STR_compare(name,length,'RADJEMPTYSUBST3',15)=0 THEN
  R:=200;
IF STR_compare(name,length,'RCARD1',6)=0 THEN
  R:=201;
IF STR_compare(name,length,'RCARD2',6)=0 THEN
  R:=202;
IF STR_compare(name,length,'RMONTHTONP',10)=0 THEN
  R:=203;
IF STR_compare(name,length,'RNPYEAR',7)=0 THEN
  R:=204;
IF STR_compare(name,length,'RNPDAY',6)=0 THEN
  R:=205;
IF STR_compare(name,length,'RNPDAYORD',9)=0 THEN
  R:=206;
IF STR_compare(name,length,'RNPDAY1',7)=0 THEN
  R:=207;
IF STR_compare(name,length,'RNPDAY1ORD',10)=0 THEN
  R:=208;
IF STR_compare(name,length,'RWEEKDAY',8)=0 THEN
  R:=209;
IF STR_compare(name,length,'RDETDERIVATION',14)=0 THEN
  R:=210;
IF STR_compare(name,length,'DETPFORMATION1',14)=0 THEN
  R:=211;
IF STR_compare(name,length,'DETPFORMATION2',14)=0 THEN
  R:=212;
IF STR_compare(name,length,'DETPFORMATION3',14)=0 THEN
  R:=213;
IF STR_compare(name,length,'DETPFORMATION4',14)=0 THEN
  R:=214;
IF STR_compare(name,length,'RDETPSUPERDEIXIS',16)=0 THEN
  R:=215;
IF STR_compare(name,length,'RDETPPARTITIVEFORMATION',23)=0 THEN
  R:=216;
IF STR_compare(name,length,'RCARDTODETP',11)=0 THEN
  R:=217;
IF STR_compare(name,length,'RADVPAMOUNTMOD',14)=0 THEN
  R:=218;
IF STR_compare(name,length,'RADVPFOROBJMOD',14)=0 THEN
  R:=219;
IF STR_compare(name,length,'RADVPINFCOMPLMOD',16)=0 THEN
  R:=220;
IF STR_compare(name,length,'RQTOQP1',7)=0 THEN
  R:=221;
IF STR_compare(name,length,'RQTOQP2',7)=0 THEN
  R:=222;
IF STR_compare(name,length,'RQPCOMPARATIVECOMPLMOD',22)=0 THEN
  R:=223;
IF STR_compare(name,length,'RQPSUPERLATIVECOMPLMOD',22)=0 THEN
  R:=224;
IF STR_compare(name,length,'RQPFOROBJMOD',12)=0 THEN
  R:=225;
IF STR_compare(name,length,'RQPINFCOMPLMOD',14)=0 THEN
  R:=226;
IF STR_compare(name,length,'RQPAMOUNTMOD',12)=0 THEN
  R:=227;
IF STR_compare(name,length,'RQPSUPERDEIXIS',14)=0 THEN
  R:=228;
IF STR_compare(name,length,'RQPSUBSTITUTION1',16)=0 THEN
  R:=229;
IF STR_compare(name,length,'RNPFORMATION1',13)=0 THEN
  R:=230;
IF STR_compare(name,length,'RNPFORMATION2',13)=0 THEN
  R:=231;
IF STR_compare(name,length,'RNPFORMATION3',13)=0 THEN
  R:=232;
IF STR_compare(name,length,'RNPFORMATION4',13)=0 THEN
  R:=233;
IF STR_compare(name,length,'RNPFORMATION4A',14)=0 THEN
  R:=234;
IF STR_compare(name,length,'RNPFORMATION5',13)=0 THEN
  R:=235;
IF STR_compare(name,length,'RNPFORMATION10',14)=0 THEN
  R:=236;
IF STR_compare(name,length,'RANYNPFORMATION',15)=0 THEN
  R:=237;
IF STR_compare(name,length,'RNPFORMATION12',14)=0 THEN
  R:=238;
IF STR_compare(name,length,'RNPPRESENTSUPERDEIXIS1',22)=0 THEN
  R:=239;
IF STR_compare(name,length,'RNPPASTSUPERDEIXIS1',19)=0 THEN
  R:=240;
IF STR_compare(name,length,'RNPPRESENTSUPERDEIXIS2',22)=0 THEN
  R:=241;
IF STR_compare(name,length,'RNPPASTSUPERDEIXIS2',19)=0 THEN
  R:=242;
IF STR_compare(name,length,'RNPINDEFMODPOSS',15)=0 THEN
  R:=243;
IF STR_compare(name,length,'RNPWHMODPOSS',12)=0 THEN
  R:=244;
IF STR_compare(name,length,'RNPPROPERNOUNMODPOSS',20)=0 THEN
  R:=245;
IF STR_compare(name,length,'RNPMODADVP1',11)=0 THEN
  R:=246;
IF STR_compare(name,length,'RNPMODADVP2',11)=0 THEN
  R:=247;
IF STR_compare(name,length,'RNPAPPOSITION',13)=0 THEN
  R:=248;
IF STR_compare(name,length,'BNOUNTOSUBNOUN',14)=0 THEN
  R:=249;
IF STR_compare(name,length,'RSUBNOUNTONOUN1',15)=0 THEN
  R:=250;
IF STR_compare(name,length,'RSUBNOUNTONOUN2',15)=0 THEN
  R:=251;
IF STR_compare(name,length,'RSUBNOUNTONOUN3',15)=0 THEN
  R:=252;
IF STR_compare(name,length,'RBPROPERNOUNTOPROPERNOUN',24)=0 THEN
  R:=253;
IF STR_compare(name,length,'RBPROPERNOUNTOSUBNOUN',21)=0 THEN
  R:=254;
IF STR_compare(name,length,'RINDEFPROTOSUBINDEFPRO',22)=0 THEN
  R:=255;
IF STR_compare(name,length,'RBWHPROTOWHPRO',14)=0 THEN
  R:=256;
IF STR_compare(name,length,'RBPERSPROTOPERSPRO',18)=0 THEN
  R:=257;
IF STR_compare(name,length,'RCNFORMATION1',13)=0 THEN
  R:=258;
IF STR_compare(name,length,'RCNFORMATION2',13)=0 THEN
  R:=259;
IF STR_compare(name,length,'RCNFORMATION3',13)=0 THEN
  R:=260;
IF STR_compare(name,length,'RCNFORMATION4',13)=0 THEN
  R:=261;
IF STR_compare(name,length,'RCNPRESENTSUPERDEIXIS',21)=0 THEN
  R:=262;
IF STR_compare(name,length,'RCNPASTSUPERDEIXIS',18)=0 THEN
  R:=263;
IF STR_compare(name,length,'RCNMODADJP1',11)=0 THEN
  R:=264;
IF STR_compare(name,length,'RCNMODADJP2',11)=0 THEN
  R:=265;
IF STR_compare(name,length,'RCNMODNUM',9)=0 THEN
  R:=266;
IF STR_compare(name,length,'RCNMODPOSS1',11)=0 THEN
  R:=267;
IF STR_compare(name,length,'RCNMODPOSS2',11)=0 THEN
  R:=268;
IF STR_compare(name,length,'RCNMODPOSS3',11)=0 THEN
  R:=269;
IF STR_compare(name,length,'RCNMODPP',8)=0 THEN
  R:=270;
IF STR_compare(name,length,'RCNMODANTEREL1',14)=0 THEN
  R:=271;
IF STR_compare(name,length,'RCNMODBARENP',12)=0 THEN
  R:=272;
IF STR_compare(name,length,'RCNSPECPROPERNAME1',18)=0 THEN
  R:=273;
IF STR_compare(name,length,'RCNSPECPROPERNAME2',18)=0 THEN
  R:=274;
IF STR_compare(name,length,'RADJSUBSTITUTION1',17)=0 THEN
  R:=275;
IF STR_compare(name,length,'RADJSUBSTITUTION2',17)=0 THEN
  R:=276;
IF STR_compare(name,length,'RADJSUBSTITUTION3',17)=0 THEN
  R:=277;
IF STR_compare(name,length,'RADJSUBSTITUTION4',17)=0 THEN
  R:=278;
IF STR_compare(name,length,'RADJMOOD1',9)=0 THEN
  R:=279;
IF STR_compare(name,length,'RADJMOOD2',9)=0 THEN
  R:=280;
IF STR_compare(name,length,'RADJPUNC',8)=0 THEN
  R:=281;
IF STR_compare(name,length,'RHELPEMPTYSUBJSUBST',19)=0 THEN
  R:=282;
IF STR_compare(name,length,'RADJEMPTYSUBJSUBST',18)=0 THEN
  R:=283;
IF STR_compare(name,length,'RINFINPASTDEIXISSPEC',20)=0 THEN
  R:=284;
IF STR_compare(name,length,'RIMPDEIXIS',10)=0 THEN
  R:=285;
IF STR_compare(name,length,'RFINIRRMODALDEIXIS',18)=0 THEN
  R:=286;
IF STR_compare(name,length,'RFINPRESENTSUPERDEIXIS',22)=0 THEN
  R:=287;
IF STR_compare(name,length,'RFINPASTSUPERDEIXIS1',20)=0 THEN
  R:=288;
IF STR_compare(name,length,'RFINPASTSUPERDEIXIS2',20)=0 THEN
  R:=289;
IF STR_compare(name,length,'RFINPRESFUTSUPERDEIXIS',22)=0 THEN
  R:=290;
IF STR_compare(name,length,'RFINPASTFUTSUPERDEIXIS',22)=0 THEN
  R:=291;
IF STR_compare(name,length,'RRETRO',6)=0 THEN
  R:=292;
IF STR_compare(name,length,'RRETROSPEC',10)=0 THEN
  R:=293;
IF STR_compare(name,length,'RINFINPRESENTSUPERDEIXIS',24)=0 THEN
  R:=294;
IF STR_compare(name,length,'RINFINPASTSUPERDEIXIS',21)=0 THEN
  R:=295;
IF STR_compare(name,length,'RINFINPASTSUPERDEIXISSPEC',25)=0 THEN
  R:=296;
IF STR_compare(name,length,'RFINIRRMODALSUPERDEIXIS',23)=0 THEN
  R:=297;
IF STR_compare(name,length,'RADJREFVARINSERTION',19)=0 THEN
  R:=298;
IF STR_compare(name,length,'RADJDURVARINSERTION',19)=0 THEN
  R:=299;
IF STR_compare(name,length,'RADJRETROVARINSERTION',21)=0 THEN
  R:=300;
IF STR_compare(name,length,'RADJASPECTIMPERFECTIVE',22)=0 THEN
  R:=301;
IF STR_compare(name,length,'RADJPRESENTSUPERDEIXIS',22)=0 THEN
  R:=302;
IF STR_compare(name,length,'RADJPASTSUPERDEIXIS',19)=0 THEN
  R:=303;
IF STR_compare(name,length,'RSENTNEGVAR',11)=0 THEN
  R:=304;
IF STR_compare(name,length,'RSENTMELTNEGVAR',15)=0 THEN
  R:=305;
IF STR_compare(name,length,'RVPNEGVAR',9)=0 THEN
  R:=306;
IF STR_compare(name,length,'RSENTPOSVAR',11)=0 THEN
  R:=307;
IF STR_compare(name,length,'RBADVTOSUBADV',13)=0 THEN
  R:=308;
IF STR_compare(name,length,'RSUBADJTOSUBADV',15)=0 THEN
  R:=309;
IF STR_compare(name,length,'RSTARTADVP0',11)=0 THEN
  R:=310;
IF STR_compare(name,length,'RSTARTADVP1',11)=0 THEN
  R:=311;
IF STR_compare(name,length,'RADVPSUPERDEIXIS',16)=0 THEN
  R:=312;
IF STR_compare(name,length,'RADVPSUBST1',11)=0 THEN
  R:=313;
IF STR_compare(name,length,'RADVPSUBST3',11)=0 THEN
  R:=314;
IF STR_compare(name,length,'RADVPSUBST4',11)=0 THEN
  R:=315;
IF STR_compare(name,length,'RSTARTADVPPROP100',17)=0 THEN
  R:=316;
IF STR_compare(name,length,'RSTARTADVPPROP010',17)=0 THEN
  R:=317;
IF STR_compare(name,length,'RSTARTADVPPROP120',17)=0 THEN
  R:=318;
IF STR_compare(name,length,'RADVREFVARINSERTION',19)=0 THEN
  R:=319;
IF STR_compare(name,length,'RADVCONJSENTVAR',15)=0 THEN
  R:=320;
IF STR_compare(name,length,'RADVFINALCONJSENTVAR',20)=0 THEN
  R:=321;
IF STR_compare(name,length,'RADVSENTADVVAR',14)=0 THEN
  R:=322;
IF STR_compare(name,length,'RADVLOCADVVAR',13)=0 THEN
  R:=323;
IF STR_compare(name,length,'RADVLOCPREPPVAR',15)=0 THEN
  R:=324;
IF STR_compare(name,length,'RADVPPROPVOICE',14)=0 THEN
  R:=325;
IF STR_compare(name,length,'RADVTOFORMULA',13)=0 THEN
  R:=326;
IF STR_compare(name,length,'RADVPPASPECTIMPERF',18)=0 THEN
  R:=327;
IF STR_compare(name,length,'RADVPPSUPERDEIXIS',17)=0 THEN
  R:=328;
IF STR_compare(name,length,'RADVPPSUBJSUBST',15)=0 THEN
  R:=329;
IF STR_compare(name,length,'ROPENADVPPMOOD',14)=0 THEN
  R:=330;
IF STR_compare(name,length,'RCLOSEDADVPPMOOD',16)=0 THEN
  R:=331;
IF STR_compare(name,length,'RADVPPNOPUNC',12)=0 THEN
  R:=332;
IF STR_compare(name,length,'RADVPDEGREEMOD1',15)=0 THEN
  R:=333;
IF STR_compare(name,length,'RADVPDEGREEMOD2',15)=0 THEN
  R:=334;
IF STR_compare(name,length,'RADVPDEGREEMOD3',15)=0 THEN
  R:=335;
IF STR_compare(name,length,'RADVPCOMPARISONCOMPLMOD',23)=0 THEN
  R:=336;
IF STR_compare(name,length,'RSRELMARKING',12)=0 THEN
  R:=337;
IF STR_compare(name,length,'RVPRELMARKING',13)=0 THEN
  R:=338;
IF STR_compare(name,length,'RVARPPSRELMARKING',17)=0 THEN
  R:=339;
IF STR_compare(name,length,'RPPSRELMARKING',14)=0 THEN
  R:=340;
IF STR_compare(name,length,'RVARPPVPRELMARKING',18)=0 THEN
  R:=341;
IF STR_compare(name,length,'RPPVPRELMARKING',15)=0 THEN
  R:=342;
IF STR_compare(name,length,'RNORELMARKING',13)=0 THEN
  R:=343;
IF STR_compare(name,length,'RPREPTOSUB',10)=0 THEN
  R:=344;
IF STR_compare(name,length,'RSTARTPPPROP000',15)=0 THEN
  R:=345;
IF STR_compare(name,length,'RSTARTPPPROP100',15)=0 THEN
  R:=346;
IF STR_compare(name,length,'RSTARTPPPROP120',15)=0 THEN
  R:=347;
IF STR_compare(name,length,'RPPPCONJSENTVAR',15)=0 THEN
  R:=348;
IF STR_compare(name,length,'RPPPFINALCONJSENTVAR',20)=0 THEN
  R:=349;
IF STR_compare(name,length,'RPPPSENTADVVAR',14)=0 THEN
  R:=350;
IF STR_compare(name,length,'RPPPLOCADVVAR',13)=0 THEN
  R:=351;
IF STR_compare(name,length,'RPPPLOCPREPPVAR',15)=0 THEN
  R:=352;
IF STR_compare(name,length,'RPPPVOICE',9)=0 THEN
  R:=353;
IF STR_compare(name,length,'RPPPNPMOD',9)=0 THEN
  R:=354;
IF STR_compare(name,length,'RPPPREFVARINSERTION',19)=0 THEN
  R:=355;
IF STR_compare(name,length,'RPPPDURVARINSERTION',19)=0 THEN
  R:=356;
IF STR_compare(name,length,'RPPPRETROVARINSERTION',21)=0 THEN
  R:=357;
IF STR_compare(name,length,'RPPPADVPMOD',11)=0 THEN
  R:=358;
IF STR_compare(name,length,'RPREPTOFORMULA',14)=0 THEN
  R:=359;
IF STR_compare(name,length,'RPPPASPECTIMPERF',16)=0 THEN
  R:=360;
IF STR_compare(name,length,'RPPPSUPERDEIXIS',15)=0 THEN
  R:=361;
IF STR_compare(name,length,'RPPPSUBJSUBST',13)=0 THEN
  R:=362;
IF STR_compare(name,length,'RPPPNPSUBST',11)=0 THEN
  R:=363;
IF STR_compare(name,length,'RPPPPREPPSUBST',14)=0 THEN
  R:=364;
IF STR_compare(name,length,'RPPPADVPSUBST',13)=0 THEN
  R:=365;
IF STR_compare(name,length,'ROPENPPPMOOD',12)=0 THEN
  R:=366;
IF STR_compare(name,length,'RCLOSEDPPPMOOD',14)=0 THEN
  R:=367;
IF STR_compare(name,length,'RPPPNOPUNC',10)=0 THEN
  R:=368;
IF STR_compare(name,length,'RSTARTPREPP100',14)=0 THEN
  R:=369;
IF STR_compare(name,length,'RSTARTPREPP120',14)=0 THEN
  R:=370;
IF STR_compare(name,length,'RPPSUPERDEIXIS',14)=0 THEN
  R:=371;
IF STR_compare(name,length,'RPPNPMOD',8)=0 THEN
  R:=372;
IF STR_compare(name,length,'RPPADVPMOD',10)=0 THEN
  R:=373;
IF STR_compare(name,length,'RPPSUBSTITUTION1',16)=0 THEN
  R:=374;
IF STR_compare(name,length,'RPPSUBSTITUTION3',16)=0 THEN
  R:=375;
IF STR_compare(name,length,'RPPSUBSTITUTION4',16)=0 THEN
  R:=376;
IF STR_compare(name,length,'RCONJSENTVAR',12)=0 THEN
  R:=377;
IF STR_compare(name,length,'RFINALCONJSENTVAR',17)=0 THEN
  R:=378;
IF STR_compare(name,length,'RSENTADVVAR',11)=0 THEN
  R:=379;
IF STR_compare(name,length,'RSENTPREPPVAR',13)=0 THEN
  R:=380;
IF STR_compare(name,length,'RLOCADVVAR',10)=0 THEN
  R:=381;
IF STR_compare(name,length,'RLOCPREPPVAR',12)=0 THEN
  R:=382;
IF STR_compare(name,length,'RVPPREPPVAR',11)=0 THEN
  R:=383;
IF STR_compare(name,length,'RCONJFINSUBSENT',15)=0 THEN
  R:=384;
IF STR_compare(name,length,'RCONJINGSUBSENT',15)=0 THEN
  R:=385;
IF STR_compare(name,length,'RCONJTOINFSUBSENT',17)=0 THEN
  R:=386;
IF STR_compare(name,length,'RPREPFINSUBSENT',15)=0 THEN
  R:=387;
IF STR_compare(name,length,'RPREPINGSUBSENT',15)=0 THEN
  R:=388;
IF STR_compare(name,length,'RVPADV',6)=0 THEN
  R:=389;
IF STR_compare(name,length,'RAGVPADVSUBJ',12)=0 THEN
  R:=390;
IF STR_compare(name,length,'RAGVPADVBYOBJ',13)=0 THEN
  R:=391;
IF STR_compare(name,length,'RAGVPADVOBJ',11)=0 THEN
  R:=392;
IF STR_compare(name,length,'RDEMPROIDENTSG',14)=0 THEN
  R:=393;
IF STR_compare(name,length,'RDEMPROIDENTPL',14)=0 THEN
  R:=394;
IF STR_compare(name,length,'RDEMPROWHIDENTSG',16)=0 THEN
  R:=395;
IF STR_compare(name,length,'RDEMPROWHIDENTPL',16)=0 THEN
  R:=396;
IF STR_compare(name,length,'RPERSPROIDENT',13)=0 THEN
  R:=397;
IF STR_compare(name,length,'RSENTIDENT',10)=0 THEN
  R:=398;
IF STR_compare(name,length,'RIDENTREFVARINSERT',18)=0 THEN
  R:=399;
IF STR_compare(name,length,'RIDENTSENTADVVAR',16)=0 THEN
  R:=400;
IF STR_compare(name,length,'RIDENTCONJSENTVAR',17)=0 THEN
  R:=401;
IF STR_compare(name,length,'RIDENTFINALCONJSENTVAR',22)=0 THEN
  R:=402;
IF STR_compare(name,length,'RIDENTLOCADVVAR',15)=0 THEN
  R:=403;
IF STR_compare(name,length,'RIDENTLOCPREPPVAR',17)=0 THEN
  R:=404;
IF STR_compare(name,length,'RSTARTEXIST',11)=0 THEN
  R:=405;
IF STR_compare(name,length,'REXISTREFVARINSERT',18)=0 THEN
  R:=406;
IF STR_compare(name,length,'REXISTCONJSENTVAR',17)=0 THEN
  R:=407;
IF STR_compare(name,length,'REXISTFINALCONJSENTVAR',22)=0 THEN
  R:=408;
IF STR_compare(name,length,'REXISTSENTADVVAR',16)=0 THEN
  R:=409;
IF STR_compare(name,length,'REXISTLOCADVVAR',15)=0 THEN
  R:=410;
IF STR_compare(name,length,'REXISTLOCPREPPVAR',17)=0 THEN
  R:=411;
IF STR_compare(name,length,'RUTTSENT',8)=0 THEN
  R:=412;
IF STR_compare(name,length,'RUTTNP',6)=0 THEN
  R:=413;
IF STR_compare(name,length,'RUTTADVP',8)=0 THEN
  R:=414;
IF STR_compare(name,length,'RUTTADJP',8)=0 THEN
  R:=415;
IF STR_compare(name,length,'RUTTPREPP',9)=0 THEN
  R:=416;
IF STR_compare(name,length,'RUTTEXCLAM',10)=0 THEN
  R:=417;
IF STR_compare(name,length,'RADDEXCLAM',10)=0 THEN
  R:=418;
IF STR_compare(name,length,'RADJUNCTVAR1',12)=0 THEN
  R:=419;
IF STR_compare(name,length,'RADJUNCTVAR2',12)=0 THEN
  R:=420;
IF STR_compare(name,length,'RADJUNCTVAR3',12)=0 THEN
  R:=421;
IF STR_compare(name,length,'RIDCN1',6)=0 THEN
  R:=422;
IF STR_compare(name,length,'RIDNPFORMATION2',15)=0 THEN
  R:=423;
IF STR_compare(name,length,'RIDALTNPFORMATION1',18)=0 THEN
  R:=424;
IF STR_compare(name,length,'RIDSUBNOUNTONOUN',16)=0 THEN
  R:=425;
IF STR_compare(name,length,'RIDDERIV1',9)=0 THEN
  R:=426;
IF STR_compare(name,length,'RIDDERIV3',9)=0 THEN
  R:=427;
IF STR_compare(name,length,'RIDDERIV7',9)=0 THEN
  R:=428;
IF STR_compare(name,length,'RIDDERIV8',9)=0 THEN
  R:=429;
IF STR_compare(name,length,'RIDDERIV9',9)=0 THEN
  R:=430;
IF STR_compare(name,length,'RIDDERIV10',10)=0 THEN
  R:=431;
IF STR_compare(name,length,'RIDDERIV12',10)=0 THEN
  R:=432;
IF STR_compare(name,length,'RIDNPFORMATION',14)=0 THEN
  R:=433;
IF STR_compare(name,length,'RIDSTARTVPPROP1VAR2ID0',22)=0 THEN
  R:=434;
IF STR_compare(name,length,'RCNMODADVP1',11)=0 THEN
  R:=435;
IF STR_compare(name,length,'RCNMODADVP2',11)=0 THEN
  R:=436;
IF STR_compare(name,length,'RCNMODRELSENT1',14)=0 THEN
  R:=437;
IF STR_compare(name,length,'RCNMODINFREL',12)=0 THEN
  R:=438;
IF STR_compare(name,length,'RNPPARTITIVEFORMATION1',22)=0 THEN
  R:=439;
IF STR_compare(name,length,'RNPPARTITIVEFORMATION2',22)=0 THEN
  R:=440;
IF STR_compare(name,length,'RNPFORMATION6',13)=0 THEN
  R:=441;
IF STR_compare(name,length,'RNPFORMATION7',13)=0 THEN
  R:=442;
IF STR_compare(name,length,'RNPFORMATION8',13)=0 THEN
  R:=443;
IF STR_compare(name,length,'RNPFORMATION9',13)=0 THEN
  R:=444;
IF STR_compare(name,length,'RNPFORMATION13',14)=0 THEN
  R:=445;
IF STR_compare(name,length,'RNPFORMATION11',14)=0 THEN
  R:=446;
IF STR_compare(name,length,'RNPFORMATION14',14)=0 THEN
  R:=447;
IF STR_compare(name,length,'RCARDNP',7)=0 THEN
  R:=448;
IF STR_compare(name,length,'RBTOBIGPRO',10)=0 THEN
  R:=449;
IF STR_compare(name,length,'RBIGPRONP',9)=0 THEN
  R:=450;
IF STR_compare(name,length,'RSIMPLEOPENPPPCOORD',19)=0 THEN
  R:=451;
IF STR_compare(name,length,'RSIMPLEPPCOORD',14)=0 THEN
  R:=452;
IF STR_compare(name,length,'RITSKPPCOORD',12)=0 THEN
  R:=453;
IF STR_compare(name,length,'RCOORDS',7)=0 THEN
  R:=454;
IF STR_compare(name,length,'RCOORDITS',9)=0 THEN
  R:=455;
END;
 PROCEDURE LDMrules_Transformationnumber(VAR R:LDMrules_transformationindex;
const name:string;length:INTEGER);
BEGIN
IF STR_compare(name,length,'TSNEGADAPT',10)=0 THEN
  R:=1;
IF STR_compare(name,length,'TVPNEGADAPT',11)=0 THEN
  R:=2;
IF STR_compare(name,length,'TPPSNEGADAPT',12)=0 THEN
  R:=3;
IF STR_compare(name,length,'TPPVPNEGADAPT',13)=0 THEN
  R:=4;
IF STR_compare(name,length,'TCOMMAINCORP',12)=0 THEN
  R:=5;
IF STR_compare(name,length,'TVPDELETION',11)=0 THEN
  R:=6;
IF STR_compare(name,length,'TNOVPDELETION',13)=0 THEN
  R:=7;
IF STR_compare(name,length,'TNEGAUXADAPT',12)=0 THEN
  R:=8;
IF STR_compare(name,length,'TAUXTOCOMP',10)=0 THEN
  R:=9;
IF STR_compare(name,length,'TAUXTOCOMP2',11)=0 THEN
  R:=10;
IF STR_compare(name,length,'TNOAUXTOCOMP',12)=0 THEN
  R:=11;
IF STR_compare(name,length,'TCANNEGINCORP',13)=0 THEN
  R:=12;
IF STR_compare(name,length,'TCONJTHATDELETION',17)=0 THEN
  R:=13;
IF STR_compare(name,length,'TSUBSTSPEED',11)=0 THEN
  R:=14;
IF STR_compare(name,length,'TARGREFLSPELLING1',17)=0 THEN
  R:=15;
IF STR_compare(name,length,'TARGREFLSPELLING2',17)=0 THEN
  R:=16;
IF STR_compare(name,length,'TARGREFLSPELLING3',17)=0 THEN
  R:=17;
IF STR_compare(name,length,'TARGREFLSPELLING4',17)=0 THEN
  R:=18;
IF STR_compare(name,length,'TARGREFLSPELLING5',17)=0 THEN
  R:=19;
IF STR_compare(name,length,'TARGREFLSPELLING6',17)=0 THEN
  R:=20;
IF STR_compare(name,length,'TARGREFLSPELLING7',17)=0 THEN
  R:=21;
IF STR_compare(name,length,'TARGREFLSPELLING8',17)=0 THEN
  R:=22;
IF STR_compare(name,length,'TARGREFLSPELLING9',17)=0 THEN
  R:=23;
IF STR_compare(name,length,'TARGREFLSPELLING10',18)=0 THEN
  R:=24;
IF STR_compare(name,length,'TWHSHIFT',8)=0 THEN
  R:=25;
IF STR_compare(name,length,'TNOWHSHIFT',10)=0 THEN
  R:=26;
IF STR_compare(name,length,'TNOWHINFSHIFT',13)=0 THEN
  R:=27;
IF STR_compare(name,length,'TEXTRAPWHSHIFT',14)=0 THEN
  R:=28;
IF STR_compare(name,length,'TCOMPLWHSHIFT',13)=0 THEN
  R:=29;
IF STR_compare(name,length,'TSTRANDEDWHSHIFT',16)=0 THEN
  R:=30;
IF STR_compare(name,length,'TNOPROSTATUS',12)=0 THEN
  R:=31;
IF STR_compare(name,length,'TPROSTATUS',10)=0 THEN
  R:=32;
IF STR_compare(name,length,'TOBLOBJCONTROLPREPSENT',22)=0 THEN
  R:=33;
IF STR_compare(name,length,'TOBLSUBJCONTROLPREPSENT',23)=0 THEN
  R:=34;
IF STR_compare(name,length,'TOBLOBJCONTROLEXTRAPSENT',24)=0 THEN
  R:=35;
IF STR_compare(name,length,'TOBLSUBJCONTROLEXTRAPSENT',25)=0 THEN
  R:=36;
IF STR_compare(name,length,'TOBLPREPOBJCONTROLEXTRAPSENT',28)=0 THEN
  R:=37;
IF STR_compare(name,length,'TOBLSUBJCONTROLOPENINGNP',24)=0 THEN
  R:=38;
IF STR_compare(name,length,'TOBLOBJCONTROLPREPOPENINGNP',27)=0 THEN
  R:=39;
IF STR_compare(name,length,'TOBLSUBJCONTROLPREPOPENINGNP',28)=0 THEN
  R:=40;
IF STR_compare(name,length,'TNOVERBLEFT',11)=0 THEN
  R:=41;
IF STR_compare(name,length,'TVERBLEFT',9)=0 THEN
  R:=42;
IF STR_compare(name,length,'TNOPARTHOP',10)=0 THEN
  R:=43;
IF STR_compare(name,length,'TOBLPARTHOP',11)=0 THEN
  R:=44;
IF STR_compare(name,length,'TOPTPARTHOP',11)=0 THEN
  R:=45;
IF STR_compare(name,length,'TOBJCASEASSIGN',14)=0 THEN
  R:=46;
IF STR_compare(name,length,'TERGBECASEASSIGN',16)=0 THEN
  R:=47;
IF STR_compare(name,length,'TSUBJCASEASSIGN',15)=0 THEN
  R:=48;
IF STR_compare(name,length,'TPREPCASEASSIGN',15)=0 THEN
  R:=49;
IF STR_compare(name,length,'TEXCEPTCASEASSIGN',17)=0 THEN
  R:=50;
IF STR_compare(name,length,'TPREPEXCEPTCASEASSIGN',21)=0 THEN
  R:=51;
IF STR_compare(name,length,'TXPPOBJCASEASSIGN',17)=0 THEN
  R:=52;
IF STR_compare(name,length,'TXPPPREPCASEASSIGN',18)=0 THEN
  R:=53;
IF STR_compare(name,length,'TNOAGREEMENT',12)=0 THEN
  R:=54;
IF STR_compare(name,length,'TAGREEMENT',10)=0 THEN
  R:=55;
IF STR_compare(name,length,'TNOTHATDELETION',15)=0 THEN
  R:=56;
IF STR_compare(name,length,'TTHATDELETION',13)=0 THEN
  R:=57;
IF STR_compare(name,length,'TSUBJOK',7)=0 THEN
  R:=58;
IF STR_compare(name,length,'TOBJTOSUBJRAISING',17)=0 THEN
  R:=59;
IF STR_compare(name,length,'TSUBJTOSUBJRAISING',18)=0 THEN
  R:=60;
IF STR_compare(name,length,'TINDOBJTOSUBJRAISING',20)=0 THEN
  R:=61;
IF STR_compare(name,length,'TPREPOBJTOSUBJRAISING',21)=0 THEN
  R:=62;
IF STR_compare(name,length,'TTHERESUBJINSERTION',19)=0 THEN
  R:=63;
IF STR_compare(name,length,'TITSUBJINSERTION',16)=0 THEN
  R:=64;
IF STR_compare(name,length,'TNOCONTROLVERBP',15)=0 THEN
  R:=65;
IF STR_compare(name,length,'TOBLOBJCONTROLPREPP',19)=0 THEN
  R:=66;
IF STR_compare(name,length,'TOBLSUBJCONTROLPREPP',20)=0 THEN
  R:=67;
IF STR_compare(name,length,'TNOCONTROLPREPP',15)=0 THEN
  R:=68;
IF STR_compare(name,length,'TOBLOBJCONTROLPREPPREPP',23)=0 THEN
  R:=69;
IF STR_compare(name,length,'TOBLOBJCONTROLADVP',18)=0 THEN
  R:=70;
IF STR_compare(name,length,'TOBLSUBJCONTROLADVP',19)=0 THEN
  R:=71;
IF STR_compare(name,length,'TNOCONTROLADVP',14)=0 THEN
  R:=72;
IF STR_compare(name,length,'TOBLOBJCONTROLCOMPLSENT',23)=0 THEN
  R:=73;
IF STR_compare(name,length,'TOBLSUBJCONTROLCOMPLSENT',24)=0 THEN
  R:=74;
IF STR_compare(name,length,'TOBLPREPOBJCONTROLCOMPLSENT',27)=0 THEN
  R:=75;
IF STR_compare(name,length,'TOBLBYOBJCONTROLCOMPLSENT',25)=0 THEN
  R:=76;
IF STR_compare(name,length,'TNOCONTROL',10)=0 THEN
  R:=77;
IF STR_compare(name,length,'TOBLOBJCONTROLADJP',18)=0 THEN
  R:=78;
IF STR_compare(name,length,'TOBLSUBJCONTROLADJP',19)=0 THEN
  R:=79;
IF STR_compare(name,length,'TNOCONTROLADJP',14)=0 THEN
  R:=80;
IF STR_compare(name,length,'TOBLOBJCONTROLPREPADJP',22)=0 THEN
  R:=81;
IF STR_compare(name,length,'TOBLSUBJCONTROLPREPADJP',23)=0 THEN
  R:=82;
IF STR_compare(name,length,'TNOCONTROLPREPADJP',18)=0 THEN
  R:=83;
IF STR_compare(name,length,'TOBLOBJCONTROLNP',16)=0 THEN
  R:=84;
IF STR_compare(name,length,'TOBLSUBJCONTROLNP',17)=0 THEN
  R:=85;
IF STR_compare(name,length,'TNOCONTROLNP',12)=0 THEN
  R:=86;
IF STR_compare(name,length,'TNOCONTROLID',12)=0 THEN
  R:=87;
IF STR_compare(name,length,'TOBLOBJCONTROLPREPNP',20)=0 THEN
  R:=88;
IF STR_compare(name,length,'TOBLSUBJCONTROLPREPNP',21)=0 THEN
  R:=89;
IF STR_compare(name,length,'TNOCONTROLPREPNP',16)=0 THEN
  R:=90;
IF STR_compare(name,length,'TNOEXTRAPOSITION',16)=0 THEN
  R:=91;
IF STR_compare(name,length,'TEXTRAPOSITION1',15)=0 THEN
  R:=92;
IF STR_compare(name,length,'TEXTRAPOSITION2',15)=0 THEN
  R:=93;
IF STR_compare(name,length,'TEXTRAPOSITION3',15)=0 THEN
  R:=94;
IF STR_compare(name,length,'TPREDEXTRAPOS1',14)=0 THEN
  R:=95;
IF STR_compare(name,length,'TASPECTNEUTRALIZATION',21)=0 THEN
  R:=96;
IF STR_compare(name,length,'TASPECTNEUTRALIZATION2',22)=0 THEN
  R:=97;
IF STR_compare(name,length,'TASPECTNEUTRALIZATION3',22)=0 THEN
  R:=98;
IF STR_compare(name,length,'TASPECTNEUTRALIZATION4',22)=0 THEN
  R:=99;
IF STR_compare(name,length,'TRETRONEUTRALIZATION1',21)=0 THEN
  R:=100;
IF STR_compare(name,length,'TRETRONEUTRALIZATION2',21)=0 THEN
  R:=101;
IF STR_compare(name,length,'TTEMPCONJSENTADAPTATION',23)=0 THEN
  R:=102;
IF STR_compare(name,length,'TTEMPADVCHECK',13)=0 THEN
  R:=103;
IF STR_compare(name,length,'TFINITE1',8)=0 THEN
  R:=104;
IF STR_compare(name,length,'TFINITE2',8)=0 THEN
  R:=105;
IF STR_compare(name,length,'TINFINITE',9)=0 THEN
  R:=106;
IF STR_compare(name,length,'TOBJRECIPROINSERTION1',21)=0 THEN
  R:=107;
IF STR_compare(name,length,'TPOSSADJSPELLING1',17)=0 THEN
  R:=108;
IF STR_compare(name,length,'TNOREFLINSERTION',16)=0 THEN
  R:=109;
IF STR_compare(name,length,'TOBJREFLINSERTION1',18)=0 THEN
  R:=110;
IF STR_compare(name,length,'TOBJREFLINSERTION2',18)=0 THEN
  R:=111;
IF STR_compare(name,length,'TINDOBJREFLINSERTION1',21)=0 THEN
  R:=112;
IF STR_compare(name,length,'TINDOBJREFLINSERTION2',21)=0 THEN
  R:=113;
IF STR_compare(name,length,'TNOPARTICLEINSERTION',20)=0 THEN
  R:=114;
IF STR_compare(name,length,'TPARTICLEINSERTION',18)=0 THEN
  R:=115;
IF STR_compare(name,length,'TVERBPATTERN7',13)=0 THEN
  R:=116;
IF STR_compare(name,length,'TVERBPATTERN8',13)=0 THEN
  R:=117;
IF STR_compare(name,length,'TVERBPATTERN9',13)=0 THEN
  R:=118;
IF STR_compare(name,length,'TVERBPATTERN10',14)=0 THEN
  R:=119;
IF STR_compare(name,length,'TVERBPATTERN11',14)=0 THEN
  R:=120;
IF STR_compare(name,length,'TVERBPATTERN5',13)=0 THEN
  R:=121;
IF STR_compare(name,length,'TVERBPATTERN6',13)=0 THEN
  R:=122;
IF STR_compare(name,length,'TVERBPATTERN12',14)=0 THEN
  R:=123;
IF STR_compare(name,length,'TVERBPATTERN13',14)=0 THEN
  R:=124;
IF STR_compare(name,length,'TVERBPATTERN4',13)=0 THEN
  R:=125;
IF STR_compare(name,length,'TIDVERBPATTERN',14)=0 THEN
  R:=126;
IF STR_compare(name,length,'TVERBPATTERN3',13)=0 THEN
  R:=127;
IF STR_compare(name,length,'TVERBPATTERN0',13)=0 THEN
  R:=128;
IF STR_compare(name,length,'TVERBPATTERN1',13)=0 THEN
  R:=129;
IF STR_compare(name,length,'TVERBPATTERN2',13)=0 THEN
  R:=130;
IF STR_compare(name,length,'TADJPATTERN0',12)=0 THEN
  R:=131;
IF STR_compare(name,length,'TADJPATTERN11',13)=0 THEN
  R:=132;
IF STR_compare(name,length,'TADJPATTERN12',13)=0 THEN
  R:=133;
IF STR_compare(name,length,'TADJPATTERN14',13)=0 THEN
  R:=134;
IF STR_compare(name,length,'TADJPATTERN15',13)=0 THEN
  R:=135;
IF STR_compare(name,length,'TADJPATTERN16',13)=0 THEN
  R:=136;
IF STR_compare(name,length,'TADJPATTERN18A',14)=0 THEN
  R:=137;
IF STR_compare(name,length,'TNPPOSTOPOSTMOD',15)=0 THEN
  R:=138;
IF STR_compare(name,length,'TNPAKTSTATIVE',13)=0 THEN
  R:=139;
IF STR_compare(name,length,'TNPNOPROSUBJ',12)=0 THEN
  R:=140;
IF STR_compare(name,length,'TNPPROSUBJ',10)=0 THEN
  R:=141;
IF STR_compare(name,length,'TADJQPHOPPING1',14)=0 THEN
  R:=142;
IF STR_compare(name,length,'TADJQPHOPPING2',14)=0 THEN
  R:=143;
IF STR_compare(name,length,'TADVQPHOPPING1',14)=0 THEN
  R:=144;
IF STR_compare(name,length,'TADVQPHOPPING2',14)=0 THEN
  R:=145;
IF STR_compare(name,length,'TADJCASEASSIGNMENT1',19)=0 THEN
  R:=146;
IF STR_compare(name,length,'TADJCASEASSIGNMENT2',19)=0 THEN
  R:=147;
IF STR_compare(name,length,'TADJCOMPLEXTRAPOS',17)=0 THEN
  R:=148;
IF STR_compare(name,length,'TADJMORETOER',12)=0 THEN
  R:=149;
IF STR_compare(name,length,'TADJMORENOTTOER',15)=0 THEN
  R:=150;
IF STR_compare(name,length,'TADJNOERNOMORE',14)=0 THEN
  R:=151;
IF STR_compare(name,length,'TADJMOSTTOST',12)=0 THEN
  R:=152;
IF STR_compare(name,length,'TADJMOSTNOTTOST',15)=0 THEN
  R:=153;
IF STR_compare(name,length,'TADJNOSTNOMOST',14)=0 THEN
  R:=154;
IF STR_compare(name,length,'TADJCONTROL0',12)=0 THEN
  R:=155;
IF STR_compare(name,length,'TADJCONTROL1',12)=0 THEN
  R:=156;
IF STR_compare(name,length,'TADJCONTROL4',12)=0 THEN
  R:=157;
IF STR_compare(name,length,'TQPOFCOMPLCASEASSIGNMENT',24)=0 THEN
  R:=158;
IF STR_compare(name,length,'TQPACCCASEASSIGNMENT',20)=0 THEN
  R:=159;
IF STR_compare(name,length,'TNPHOP',6)=0 THEN
  R:=160;
IF STR_compare(name,length,'TNPADJADVPCOMPLEXTRAPOS1',24)=0 THEN
  R:=161;
IF STR_compare(name,length,'TNPADJQPCOMPLEXTRAPOS1',22)=0 THEN
  R:=162;
IF STR_compare(name,length,'TNPQPCOMPLEXTRAPOS',18)=0 THEN
  R:=163;
IF STR_compare(name,length,'TNPENDELETION1',14)=0 THEN
  R:=164;
IF STR_compare(name,length,'TNPCNDELETION1',14)=0 THEN
  R:=165;
IF STR_compare(name,length,'TNPCNDELETION2',14)=0 THEN
  R:=166;
IF STR_compare(name,length,'TNPCOUNTENTOONE1',16)=0 THEN
  R:=167;
IF STR_compare(name,length,'TADJSETPROSUBJECT',17)=0 THEN
  R:=168;
IF STR_compare(name,length,'TNOSUPERDEIXISADAPTATION',24)=0 THEN
  R:=169;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION1A',24)=0 THEN
  R:=170;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION1B',24)=0 THEN
  R:=171;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION2',23)=0 THEN
  R:=172;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION5',23)=0 THEN
  R:=173;
IF STR_compare(name,length,'TIDSUPERDEIXISADAPTATION',24)=0 THEN
  R:=174;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION11',24)=0 THEN
  R:=175;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION12',24)=0 THEN
  R:=176;
IF STR_compare(name,length,'TDEIXISRETROADAPTATION1',23)=0 THEN
  R:=177;
IF STR_compare(name,length,'THAVEMODALADAPTATION',20)=0 THEN
  R:=178;
IF STR_compare(name,length,'TREFDELETION',12)=0 THEN
  R:=179;
IF STR_compare(name,length,'TRETRODELETION',14)=0 THEN
  R:=180;
IF STR_compare(name,length,'TRETRODELETION2',15)=0 THEN
  R:=181;
IF STR_compare(name,length,'TTEMPADVRELPRES',15)=0 THEN
  R:=182;
IF STR_compare(name,length,'TADJAKTSTATIVE1',15)=0 THEN
  R:=183;
IF STR_compare(name,length,'TADJASPECTNEUTRALISATION',24)=0 THEN
  R:=184;
IF STR_compare(name,length,'TADJSUPERDEIXISADAPTATION1',26)=0 THEN
  R:=185;
IF STR_compare(name,length,'TADJSUPERDEIXISADAPTATION2',26)=0 THEN
  R:=186;
IF STR_compare(name,length,'TADJNOSUPERDEIXISADAPTATION',27)=0 THEN
  R:=187;
IF STR_compare(name,length,'TAKTACTIVITY1',13)=0 THEN
  R:=188;
IF STR_compare(name,length,'TAKTACTIVITY2',13)=0 THEN
  R:=189;
IF STR_compare(name,length,'TAKTACTIVITY3',13)=0 THEN
  R:=190;
IF STR_compare(name,length,'TAKTACTIVITY4',13)=0 THEN
  R:=191;
IF STR_compare(name,length,'TAKTACTIVITY5',13)=0 THEN
  R:=192;
IF STR_compare(name,length,'TAKTACTIVITY6',13)=0 THEN
  R:=193;
IF STR_compare(name,length,'TAKTACCOMPLISHMENT1',19)=0 THEN
  R:=194;
IF STR_compare(name,length,'TAKTACCOMPLISHMENT2',19)=0 THEN
  R:=195;
IF STR_compare(name,length,'TAKTACCOMPLISHMENT3',19)=0 THEN
  R:=196;
IF STR_compare(name,length,'TAKTACHIEVEMENT1',16)=0 THEN
  R:=197;
IF STR_compare(name,length,'TAKTSTATIVE1',12)=0 THEN
  R:=198;
IF STR_compare(name,length,'TAKTSTATIVE2',12)=0 THEN
  R:=199;
IF STR_compare(name,length,'TDOBEDELETION',13)=0 THEN
  R:=200;
IF STR_compare(name,length,'TDOBEDELETION2',14)=0 THEN
  R:=201;
IF STR_compare(name,length,'TNODOBEDELETION',15)=0 THEN
  R:=202;
IF STR_compare(name,length,'TDODELETION',11)=0 THEN
  R:=203;
IF STR_compare(name,length,'TPOSDELETION',12)=0 THEN
  R:=204;
IF STR_compare(name,length,'TNODELETION1',12)=0 THEN
  R:=205;
IF STR_compare(name,length,'TNODELETION2',12)=0 THEN
  R:=206;
IF STR_compare(name,length,'TSHALLWILL',10)=0 THEN
  R:=207;
IF STR_compare(name,length,'TADVPPATTERN0',13)=0 THEN
  R:=208;
IF STR_compare(name,length,'TADVPPATTERN1',13)=0 THEN
  R:=209;
IF STR_compare(name,length,'TADVPATTERN0',12)=0 THEN
  R:=210;
IF STR_compare(name,length,'TADVPATTERN1',12)=0 THEN
  R:=211;
IF STR_compare(name,length,'TADVPPNOPROSUBJECT',18)=0 THEN
  R:=212;
IF STR_compare(name,length,'TADVPPPROSUBJECT',16)=0 THEN
  R:=213;
IF STR_compare(name,length,'TADVPPASPECTNEUTRALIZATION',26)=0 THEN
  R:=214;
IF STR_compare(name,length,'TADVPACCCASEASSIGNMENT',22)=0 THEN
  R:=215;
IF STR_compare(name,length,'TADVMORETOER',12)=0 THEN
  R:=216;
IF STR_compare(name,length,'TPPPPATTERN0',12)=0 THEN
  R:=217;
IF STR_compare(name,length,'TPPPPATTERN1',12)=0 THEN
  R:=218;
IF STR_compare(name,length,'TNOPPCASEASSIGN',15)=0 THEN
  R:=219;
IF STR_compare(name,length,'TPPCASEASSIGN',13)=0 THEN
  R:=220;
IF STR_compare(name,length,'TPPPNOPROSUBJ',13)=0 THEN
  R:=221;
IF STR_compare(name,length,'TPPPPROSUBJ',11)=0 THEN
  R:=222;
IF STR_compare(name,length,'TPPPASPECTNEUTRALIZATION',24)=0 THEN
  R:=223;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION3',23)=0 THEN
  R:=224;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION4',23)=0 THEN
  R:=225;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION6',23)=0 THEN
  R:=226;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION7',23)=0 THEN
  R:=227;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION8',23)=0 THEN
  R:=228;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION9',23)=0 THEN
  R:=229;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION10',24)=0 THEN
  R:=230;
IF STR_compare(name,length,'TPPPREPPATTERN0',15)=0 THEN
  R:=231;
IF STR_compare(name,length,'TPPPREPPATTERN1',15)=0 THEN
  R:=232;
IF STR_compare(name,length,'TPREPPCA0',9)=0 THEN
  R:=233;
IF STR_compare(name,length,'TPREPPCA1',9)=0 THEN
  R:=234;
IF STR_compare(name,length,'TNOPPTOVARPP',12)=0 THEN
  R:=235;
IF STR_compare(name,length,'TPPTOVARPP',10)=0 THEN
  R:=236;
IF STR_compare(name,length,'TNOVPADVS',9)=0 THEN
  R:=237;
IF STR_compare(name,length,'TSUBJCONTROLCONJSENT',20)=0 THEN
  R:=238;
IF STR_compare(name,length,'TSUBJCONTROLFINALCONJSENT',25)=0 THEN
  R:=239;
IF STR_compare(name,length,'TSUBJCONTROLCONJPREPNP',22)=0 THEN
  R:=240;
IF STR_compare(name,length,'TSUBJCONTROLFINALCONJPREPNP',27)=0 THEN
  R:=241;
IF STR_compare(name,length,'TSADJCOMPLEXTRAPOS',18)=0 THEN
  R:=242;
IF STR_compare(name,length,'TCOMPARINCORP',13)=0 THEN
  R:=243;
IF STR_compare(name,length,'TSUPERINCORP',12)=0 THEN
  R:=244;
IF STR_compare(name,length,'TNOINCORP',9)=0 THEN
  R:=245;
IF STR_compare(name,length,'TINCORPDEFAULT',14)=0 THEN
  R:=246;
IF STR_compare(name,length,'TMOVETOPIC',10)=0 THEN
  R:=247;
IF STR_compare(name,length,'TNOTOPICCLEFT',13)=0 THEN
  R:=248;
IF STR_compare(name,length,'TPOLITE1',8)=0 THEN
  R:=249;
IF STR_compare(name,length,'TPOLITE2',8)=0 THEN
  R:=250;
IF STR_compare(name,length,'TPOLITE3',8)=0 THEN
  R:=251;
IF STR_compare(name,length,'TPOLITE4',8)=0 THEN
  R:=252;
IF STR_compare(name,length,'TPOLITE5A',9)=0 THEN
  R:=253;
IF STR_compare(name,length,'TPOLITE5B',9)=0 THEN
  R:=254;
IF STR_compare(name,length,'TPOLITE6',8)=0 THEN
  R:=255;
IF STR_compare(name,length,'TPOLITE7',8)=0 THEN
  R:=256;
IF STR_compare(name,length,'TNOFINCONTROL',13)=0 THEN
  R:=257;
IF STR_compare(name,length,'TEXTRAPFINCONTROL',17)=0 THEN
  R:=258;
IF STR_compare(name,length,'TCOMPLFINCONTROL',16)=0 THEN
  R:=259;
IF STR_compare(name,length,'TPREPFINCONTROL',15)=0 THEN
  R:=260;
IF STR_compare(name,length,'TPOSTSENTFINCONTROL',19)=0 THEN
  R:=261;
IF STR_compare(name,length,'TINFRELCONTROL',14)=0 THEN
  R:=262;
IF STR_compare(name,length,'TPROGBETOBE1',12)=0 THEN
  R:=263;
IF STR_compare(name,length,'TPROGBETOBE2',12)=0 THEN
  R:=264;
IF STR_compare(name,length,'TIDCLAUSETOVPPROP',17)=0 THEN
  R:=265;
IF STR_compare(name,length,'TIDVPPROPTOCLAUSE',17)=0 THEN
  R:=266;
IF STR_compare(name,length,'TISIDIOM',8)=0 THEN
  R:=267;
IF STR_compare(name,length,'TISNOTIDIOM',11)=0 THEN
  R:=268;
IF STR_compare(name,length,'FNOPERSPRO',10)=0 THEN
  R:=269;
IF STR_compare(name,length,'FPOSTNEGADAPT',13)=0 THEN
  R:=270;
IF STR_compare(name,length,'FNEGBLOCK',9)=0 THEN
  R:=271;
IF STR_compare(name,length,'FPOSTCOMMAINCORP',16)=0 THEN
  R:=272;
IF STR_compare(name,length,'FPRECOMMAINCORP',15)=0 THEN
  R:=273;
IF STR_compare(name,length,'FPRECOORDINTRO',14)=0 THEN
  R:=274;
IF STR_compare(name,length,'FPRENEGAUXADAPT',15)=0 THEN
  R:=275;
IF STR_compare(name,length,'FPRECANNEGINCORP',16)=0 THEN
  R:=276;
IF STR_compare(name,length,'FCANNEGINCORP',13)=0 THEN
  R:=277;
IF STR_compare(name,length,'FPRERECIPRO1',12)=0 THEN
  R:=278;
IF STR_compare(name,length,'FPREOBJCASEASSIGN',17)=0 THEN
  R:=279;
IF STR_compare(name,length,'FPRESUBJCASEASSIGN',18)=0 THEN
  R:=280;
IF STR_compare(name,length,'FPREPREPCASEASSIGN',18)=0 THEN
  R:=281;
IF STR_compare(name,length,'FPREEXCEPTCASEASSIGN',20)=0 THEN
  R:=282;
IF STR_compare(name,length,'FPREPREPEXCEPTCASEASSIGN',24)=0 THEN
  R:=283;
IF STR_compare(name,length,'FPREXPPOBJCASEASSIGN',20)=0 THEN
  R:=284;
IF STR_compare(name,length,'FPREXPPPREPCASEASSIGN',21)=0 THEN
  R:=285;
IF STR_compare(name,length,'FPOSTOBJCASEASSIGN',18)=0 THEN
  R:=286;
IF STR_compare(name,length,'FPOSTSUBJCASEASSIGN',19)=0 THEN
  R:=287;
IF STR_compare(name,length,'FPOSTPREPCASEASSIGN',19)=0 THEN
  R:=288;
IF STR_compare(name,length,'FPOSTEXCEPTCASEASSIGN',21)=0 THEN
  R:=289;
IF STR_compare(name,length,'FPOSTPREPEXCEPTCASEASSIGN',25)=0 THEN
  R:=290;
IF STR_compare(name,length,'FPOSTXPPOBJCASEASSIGN',21)=0 THEN
  R:=291;
IF STR_compare(name,length,'FPOSTXPPPREPCASEASSIGN',22)=0 THEN
  R:=292;
IF STR_compare(name,length,'FPREEXTRAPOS',12)=0 THEN
  R:=293;
IF STR_compare(name,length,'FRETRONEUTRALIZATION1',21)=0 THEN
  R:=294;
IF STR_compare(name,length,'FRETRONEUTRALIZATION2',21)=0 THEN
  R:=295;
IF STR_compare(name,length,'FPOSTTEMPCONJSENTADAPTATION',27)=0 THEN
  R:=296;
IF STR_compare(name,length,'FPRETEMPCONJSENTADAPTATION',26)=0 THEN
  R:=297;
IF STR_compare(name,length,'FPRETEMPCONJSENTMOVETOLEFT',26)=0 THEN
  R:=298;
IF STR_compare(name,length,'FPOSSADJSPELLING1',17)=0 THEN
  R:=299;
IF STR_compare(name,length,'FPOSSADJSPELLING2',17)=0 THEN
  R:=300;
IF STR_compare(name,length,'FNPPOSTOPOSTMOD',15)=0 THEN
  R:=301;
IF STR_compare(name,length,'FITTHISTHAT',11)=0 THEN
  R:=302;
IF STR_compare(name,length,'FPOSTADJQPHOPPING',17)=0 THEN
  R:=303;
IF STR_compare(name,length,'FPOSTADVQPHOPPING',17)=0 THEN
  R:=304;
IF STR_compare(name,length,'FADJPRESUBST',12)=0 THEN
  R:=305;
IF STR_compare(name,length,'FADJPOSTCASEASSIGNMENT1',23)=0 THEN
  R:=306;
IF STR_compare(name,length,'FADJPOSTCASEASSIGNMENT2',23)=0 THEN
  R:=307;
IF STR_compare(name,length,'FADJPRECASEASSIGNMENT1',22)=0 THEN
  R:=308;
IF STR_compare(name,length,'FADJPRECASEASSIGNMENT2',22)=0 THEN
  R:=309;
IF STR_compare(name,length,'FADJPOSTCOMPLEXTRAPOS',21)=0 THEN
  R:=310;
IF STR_compare(name,length,'FADJPRECOMPLEXTRAPOS',20)=0 THEN
  R:=311;
IF STR_compare(name,length,'FPOSTNPADJADVPCOMPLEXTRAPOS1',28)=0 THEN
  R:=312;
IF STR_compare(name,length,'FPRENPADJADVPCOMPLEXTRAPOS1',27)=0 THEN
  R:=313;
IF STR_compare(name,length,'FPOSTNPADJQPCOMPLEXTRAPOS1',26)=0 THEN
  R:=314;
IF STR_compare(name,length,'FPRENPADJQPCOMPLEXTRAPOS1',25)=0 THEN
  R:=315;
IF STR_compare(name,length,'FPRENPQPCOMPLEXTRAPOS',21)=0 THEN
  R:=316;
IF STR_compare(name,length,'FPOSTNPQPCOMPLEXTRAPOS',22)=0 THEN
  R:=317;
IF STR_compare(name,length,'FPOSTNPCOUNTENTOONE1',20)=0 THEN
  R:=318;
IF STR_compare(name,length,'FPRENPCOUNTENTOONE1',19)=0 THEN
  R:=319;
IF STR_compare(name,length,'FPOSTNPENDELETION',17)=0 THEN
  R:=320;
IF STR_compare(name,length,'FPRENPENDELETION',16)=0 THEN
  R:=321;
IF STR_compare(name,length,'FTEMPADJCHECK',13)=0 THEN
  R:=322;
IF STR_compare(name,length,'FSUPERDEIXISADAPTATION11',24)=0 THEN
  R:=323;
IF STR_compare(name,length,'FTEMPINDEP1',11)=0 THEN
  R:=324;
IF STR_compare(name,length,'FSUPERDEIXISADAPTATION12',24)=0 THEN
  R:=325;
IF STR_compare(name,length,'FDEIXISRETROADAPTATION1',23)=0 THEN
  R:=326;
IF STR_compare(name,length,'FHAVEMODALADAPTATION',20)=0 THEN
  R:=327;
IF STR_compare(name,length,'FREFDELETION',12)=0 THEN
  R:=328;
IF STR_compare(name,length,'FRETRODELETION',14)=0 THEN
  R:=329;
IF STR_compare(name,length,'FRETRODELETION2',15)=0 THEN
  R:=330;
IF STR_compare(name,length,'FADJSUPERDEIXISADAPTATION2',26)=0 THEN
  R:=331;
IF STR_compare(name,length,'FNOSHALL',8)=0 THEN
  R:=332;
IF STR_compare(name,length,'FPOSTADVMORETOER',16)=0 THEN
  R:=333;
IF STR_compare(name,length,'FNOTOPIC',8)=0 THEN
  R:=334;
IF STR_compare(name,length,'FSUPERDEIXISADAPTATION9',23)=0 THEN
  R:=335;
IF STR_compare(name,length,'FPOSTCONJSENTCONTROL',20)=0 THEN
  R:=336;
IF STR_compare(name,length,'FPRECONJSENTCONTROL',19)=0 THEN
  R:=337;
IF STR_compare(name,length,'FSADJPOSTCOMPLEXTRAPOS',22)=0 THEN
  R:=338;
IF STR_compare(name,length,'FSADJPRECOMPLEXTRAPOS',21)=0 THEN
  R:=339;
IF STR_compare(name,length,'FPOLITE7',8)=0 THEN
  R:=340;
IF STR_compare(name,length,'FINFRELCONTROL',14)=0 THEN
  R:=341;
IF STR_compare(name,length,'FPREINFRELCONTROL',17)=0 THEN
  R:=342;
IF STR_compare(name,length,'FPROGBETOBE',11)=0 THEN
  R:=343;
IF STR_compare(name,length,'FPREARGREFLSPELLING',19)=0 THEN
  R:=344;
IF STR_compare(name,length,'FPOSTARGREFLSPELLING',20)=0 THEN
  R:=345;
END;
 PROCEDURE LDMrules_Rulename(sg:LDMrules_subgrammarindex;R:LDMrules_ruleindex;
VAR name:string;VAR length:INTEGER);
BEGIN
CASE R OF
1: BEGIN name:='ERRORRULE';
    length:=9 END;
2: BEGIN name:='RNNCOMPOUNDS';
    length:=12 END;
3: BEGIN name:='RVNCOMPOUNDS';
    length:=12 END;
4: BEGIN name:='RNOUNDIM';
    length:=8 END;
5: BEGIN name:='RPNDIM';
    length:=6 END;
6: BEGIN name:='RBVERBTOSUB';
    length:=11 END;
7: BEGIN name:='RNOPUNC';
    length:=7 END;
8: BEGIN name:='RQUMARK';
    length:=7 END;
9: BEGIN name:='REXCLAM';
    length:=7 END;
10: BEGIN name:='RPERIOD';
    length:=7 END;
11: BEGIN name:='RCOORDINTRO';
    length:=11 END;
12: BEGIN name:='RNPOPENINGMOOD';
    length:=14 END;
13: BEGIN name:='RNPPOSSINGMOOD';
    length:=14 END;
14: BEGIN name:='RLETSMOOD';
    length:=9 END;
15: BEGIN name:='RVPPROPMOOD';
    length:=11 END;
16: BEGIN name:='RWOULDINSERTION';
    length:=15 END;
17: BEGIN name:='RNOWOULDINSERTION';
    length:=17 END;
18: BEGIN name:='RIMPMOODPLEASE';
    length:=14 END;
19: BEGIN name:='ROPENINFMOOD';
    length:=12 END;
20: BEGIN name:='RCLOSEDINFMOOD';
    length:=14 END;
21: BEGIN name:='ROPENTOINFMOOD';
    length:=14 END;
22: BEGIN name:='RCLOSEDTOINFMOOD';
    length:=16 END;
23: BEGIN name:='RWHTOINFMOOD';
    length:=12 END;
24: BEGIN name:='RTOINFRELMOOD';
    length:=13 END;
25: BEGIN name:='RTOINFWHMODMOOD';
    length:=15 END;
26: BEGIN name:='RFORTOINFMOOD';
    length:=13 END;
27: BEGIN name:='RFORTOINFRELMOOD';
    length:=16 END;
28: BEGIN name:='RFORTOINFWHMODMOOD';
    length:=18 END;
29: BEGIN name:='ROPENINGMOOD';
    length:=12 END;
30: BEGIN name:='RANTERELINGMOOD';
    length:=15 END;
31: BEGIN name:='RACCINGMOOD';
    length:=11 END;
32: BEGIN name:='RPASTPARTMOOD';
    length:=13 END;
33: BEGIN name:='RINDICMOODMAIN';
    length:=14 END;
34: BEGIN name:='RINDICMOODSUB';
    length:=13 END;
35: BEGIN name:='RINDICFUTMOODSUB1';
    length:=17 END;
36: BEGIN name:='RINDICFUTMOODSUB2';
    length:=17 END;
37: BEGIN name:='RINDICWHMOODMAIN';
    length:=16 END;
38: BEGIN name:='RINDICWHMOODSUB';
    length:=15 END;
39: BEGIN name:='RINDICYESNOMOODMAIN';
    length:=19 END;
40: BEGIN name:='RINDICYESNOMOODSUB';
    length:=18 END;
41: BEGIN name:='RIMPMOOD';
    length:=8 END;
42: BEGIN name:='RFINRELMOOD';
    length:=11 END;
43: BEGIN name:='RWHMODMOOD';
    length:=10 END;
44: BEGIN name:='RIDSUBSTITUTION1';
    length:=16 END;
45: BEGIN name:='RIDSUBSTITUTION2';
    length:=16 END;
46: BEGIN name:='RIDSUBSTITUTION3';
    length:=16 END;
47: BEGIN name:='RXPPVARPREPNPSUBST';
    length:=18 END;
48: BEGIN name:='RXPPOBJNPSUBST';
    length:=14 END;
49: BEGIN name:='RDEEPSUBST1';
    length:=11 END;
50: BEGIN name:='RDEEPSUBSTPP';
    length:=12 END;
51: BEGIN name:='RDEEPSUBSTVARPP';
    length:=15 END;
52: BEGIN name:='RDEEPSUBSTADVP';
    length:=14 END;
53: BEGIN name:='RVPADVPPSUBST';
    length:=13 END;
54: BEGIN name:='RBIGPROSUBST';
    length:=12 END;
55: BEGIN name:='ROBJNPSUBST';
    length:=11 END;
56: BEGIN name:='RSUBJNPSUBST';
    length:=12 END;
57: BEGIN name:='RSHIFTNPSUBST';
    length:=13 END;
58: BEGIN name:='RPREPNPSUBST';
    length:=12 END;
59: BEGIN name:='RVARPREPNPSUBST';
    length:=15 END;
60: BEGIN name:='RVARPREPGENSUBST';
    length:=16 END;
61: BEGIN name:='RLOCADVSUBST';
    length:=12 END;
62: BEGIN name:='RSHIFTLOCADVSUBST';
    length:=17 END;
63: BEGIN name:='RSENTADVSUBST';
    length:=13 END;
64: BEGIN name:='RSENTPREPPSUBST';
    length:=15 END;
65: BEGIN name:='RPROSENTSUBST';
    length:=13 END;
66: BEGIN name:='RSOPROSENTSUBST';
    length:=15 END;
67: BEGIN name:='RNOTPROSENTSUBST';
    length:=16 END;
68: BEGIN name:='RPOSSUBST';
    length:=9 END;
69: BEGIN name:='RSENTNEGSUBST';
    length:=13 END;
70: BEGIN name:='RSENTMELTNEGSUBST';
    length:=17 END;
71: BEGIN name:='RVPMELTNEGSUBST';
    length:=15 END;
72: BEGIN name:='RSHIFTPREPNPSUBST';
    length:=17 END;
73: BEGIN name:='RSHIFTVARPREPNPSUBST';
    length:=20 END;
74: BEGIN name:='ROBJRECIPROSUBST';
    length:=16 END;
75: BEGIN name:='RBYEMPTYSUBST';
    length:=13 END;
76: BEGIN name:='RPREPEMPTYSUBST1';
    length:=16 END;
77: BEGIN name:='RPREPEMPTYSUBST2';
    length:=16 END;
78: BEGIN name:='ROBJEMPTYSUBST';
    length:=14 END;
79: BEGIN name:='RINDOBJEMPTYSUBST';
    length:=17 END;
80: BEGIN name:='RONESUBJEMPTYSUBST';
    length:=18 END;
81: BEGIN name:='REMPTYINADJPSUBST';
    length:=17 END;
82: BEGIN name:='RTEMPCONJSENTMOVETOLEFT';
    length:=23 END;
83: BEGIN name:='RFINPRESENTDEIXIS';
    length:=17 END;
84: BEGIN name:='RFINPASTDEIXIS';
    length:=14 END;
85: BEGIN name:='RFINPRESFUTDEIXIS';
    length:=17 END;
86: BEGIN name:='RREFVARINSERTION';
    length:=16 END;
87: BEGIN name:='RDURVARINSERTION';
    length:=16 END;
88: BEGIN name:='RRETROVARINSERTION';
    length:=18 END;
89: BEGIN name:='RFREQVARINSERTION';
    length:=17 END;
90: BEGIN name:='RTEMPADVSUBSTITUTION1';
    length:=21 END;
91: BEGIN name:='RTEMPADVSUBSTSHIFT1';
    length:=19 END;
92: BEGIN name:='RTEMPADVSUBSTITUTION2';
    length:=21 END;
93: BEGIN name:='RTEMPADVSUBSTSHIFT2';
    length:=19 END;
94: BEGIN name:='RTEMPADVSENTSUBSTITUTION';
    length:=24 END;
95: BEGIN name:='RASPECTIMPERFECTIVE1';
    length:=20 END;
96: BEGIN name:='RASPECTIMPERFECTIVE2';
    length:=20 END;
97: BEGIN name:='RASPECTPERFECTIVE';
    length:=17 END;
98: BEGIN name:='RASPECTHABITUAL';
    length:=15 END;
99: BEGIN name:='RACTCLAUSEFORMATION';
    length:=19 END;
100: BEGIN name:='RPASCLAUSEFORMATION';
    length:=19 END;
101: BEGIN name:='RADJPCLAUSEFORMATION';
    length:=20 END;
102: BEGIN name:='RNPCLAUSEFORMATION';
    length:=18 END;
103: BEGIN name:='REXISTNPCLAUSEFORMATION';
    length:=23 END;
104: BEGIN name:='RIDENTNPCLAUSEFORMATION';
    length:=23 END;
105: BEGIN name:='RPREPPCLAUSEFORMATION';
    length:=21 END;
106: BEGIN name:='RCLOSEDNPPROPSUBST';
    length:=18 END;
107: BEGIN name:='ROPENNPPROPSUBST';
    length:=16 END;
108: BEGIN name:='RCLOSEDADJPPROPSUBST';
    length:=20 END;
109: BEGIN name:='ROPENADJPPROPSUBST';
    length:=18 END;
110: BEGIN name:='ROPENADJPPROPSENTENCESUBST';
    length:=26 END;
111: BEGIN name:='RCLOSEDVERBPPROPSUBST';
    length:=21 END;
112: BEGIN name:='ROPENVERBPPROPSUBST';
    length:=19 END;
113: BEGIN name:='RPREPSENTSUBST';
    length:=14 END;
114: BEGIN name:='RBYSENTSUBST';
    length:=12 END;
115: BEGIN name:='RCOMPLSENTSUBST';
    length:=15 END;
116: BEGIN name:='RLDISLOCSUBJSENTSUBST';
    length:=21 END;
117: BEGIN name:='REXTRAPSUBJSENTSUBST';
    length:=20 END;
118: BEGIN name:='RMODALCOMPLSENTSUBST1';
    length:=21 END;
119: BEGIN name:='RMODALCOMPLSENTSUBST2';
    length:=21 END;
120: BEGIN name:='ROBJNPSENTSUBST';
    length:=15 END;
121: BEGIN name:='RSUBJNPSENTSUBST';
    length:=16 END;
122: BEGIN name:='RPREPOBJNPSENTSUBST';
    length:=19 END;
123: BEGIN name:='RCONJSENTSUBST';
    length:=14 END;
124: BEGIN name:='RCONJPREPNPSUBST';
    length:=16 END;
125: BEGIN name:='RFINALCONJSENTSUBST';
    length:=19 END;
126: BEGIN name:='RFINALCONJPREPNPSUBST';
    length:=21 END;
127: BEGIN name:='RADJPPCOMPLSENTSUBST';
    length:=20 END;
128: BEGIN name:='RXPPEXTRAPSUBJSENTSUBST';
    length:=23 END;
129: BEGIN name:='RLOCCLOSEDPREPPPROPSUBST';
    length:=24 END;
130: BEGIN name:='RLOCOPENPREPPPROPSUBST';
    length:=22 END;
131: BEGIN name:='RDIRCLOSEDPREPPPROPSUBST';
    length:=24 END;
132: BEGIN name:='RDIROPENPREPPPROPSUBST';
    length:=22 END;
133: BEGIN name:='ROTHERCLOSEDPREPPPROPSUBST';
    length:=26 END;
134: BEGIN name:='ROTHEROPENPREPPPROPSUBST';
    length:=24 END;
135: BEGIN name:='RLOCCLOSEDADVPPROPSUBST';
    length:=23 END;
136: BEGIN name:='RLOCOPENADVPPROPSUBST';
    length:=21 END;
137: BEGIN name:='RDIRCLOSEDADVPPROPSUBST';
    length:=23 END;
138: BEGIN name:='RDIROPENADVPPROPSUBST';
    length:=21 END;
139: BEGIN name:='ROTHERCLOSEDADVPPROPSUBST';
    length:=25 END;
140: BEGIN name:='ROTHEROPENADVPPROPSUBST';
    length:=23 END;
141: BEGIN name:='RCLOSEDPREPNPPROPSUBST';
    length:=22 END;
142: BEGIN name:='ROPENPREPNPPROPSUBST';
    length:=20 END;
143: BEGIN name:='RCLOSEDPREPADJPPROPSUBST';
    length:=24 END;
144: BEGIN name:='ROPENPREPADJPPROPSUBST';
    length:=22 END;
145: BEGIN name:='ROPENPREPPREPPPROPSUBST';
    length:=23 END;
146: BEGIN name:='RACTIVE';
    length:=7 END;
147: BEGIN name:='RPASSIVE1';
    length:=9 END;
148: BEGIN name:='RPASSIVE2';
    length:=9 END;
149: BEGIN name:='RSIDSTARTVPPROP120';
    length:=18 END;
150: BEGIN name:='RSIDSTARTVPPROP123';
    length:=18 END;
151: BEGIN name:='RSTARTVPPROP000';
    length:=15 END;
152: BEGIN name:='RSTARTVPPROP100';
    length:=15 END;
153: BEGIN name:='RSTARTVPPROP010A';
    length:=16 END;
154: BEGIN name:='RSTARTVPPROP010B';
    length:=16 END;
155: BEGIN name:='RSTARTVPPROP120';
    length:=15 END;
156: BEGIN name:='RSTARTVPPROP012';
    length:=15 END;
157: BEGIN name:='RSTARTVPPROP123';
    length:=15 END;
158: BEGIN name:='RSTARTVPPROP132';
    length:=15 END;
159: BEGIN name:='RADJFOROBJMOD';
    length:=13 END;
160: BEGIN name:='RADJMOD1';
    length:=8 END;
161: BEGIN name:='RADJTOMOD1';
    length:=10 END;
162: BEGIN name:='RADJDEGREEMOD1';
    length:=14 END;
163: BEGIN name:='RADJDEGREEMOD2A';
    length:=15 END;
164: BEGIN name:='RADJDEGREEMOD2B';
    length:=15 END;
165: BEGIN name:='RBADJTOSUB1';
    length:=11 END;
166: BEGIN name:='RORDINALFORM';
    length:=12 END;
167: BEGIN name:='RSTARTADJPPROP000';
    length:=17 END;
168: BEGIN name:='RSTARTADJPPROP100';
    length:=17 END;
169: BEGIN name:='RSTARTADJPPROP120';
    length:=17 END;
170: BEGIN name:='RSTARTADJPPROP123';
    length:=17 END;
171: BEGIN name:='RSTARTADJPPROP010';
    length:=17 END;
172: BEGIN name:='RSTARTADJPPROP012';
    length:=17 END;
173: BEGIN name:='RADJCONJSENTVAR';
    length:=15 END;
174: BEGIN name:='RADJFINALCONJSENTVAR';
    length:=20 END;
175: BEGIN name:='RADJSENTADVVAR';
    length:=14 END;
176: BEGIN name:='RADJLOCADVVAR';
    length:=13 END;
177: BEGIN name:='RADJLOCPREPPVAR';
    length:=15 END;
178: BEGIN name:='RNPPROPFORMATION';
    length:=16 END;
179: BEGIN name:='RNPREFVARINSERT';
    length:=15 END;
180: BEGIN name:='RNPRETROVARINSERT';
    length:=17 END;
181: BEGIN name:='RNPCONJSENTVAR';
    length:=14 END;
182: BEGIN name:='RNPFINALCONJSENTVAR';
    length:=19 END;
183: BEGIN name:='RNPSENTADVVAR';
    length:=13 END;
184: BEGIN name:='RNPLOCADVVAR';
    length:=12 END;
185: BEGIN name:='RNPLOCPREPPVAR';
    length:=14 END;
186: BEGIN name:='RNPPSUBJSUBST';
    length:=13 END;
187: BEGIN name:='ROPENNPPROPFORMATION';
    length:=20 END;
188: BEGIN name:='RCLOSEDNPPROPFORMATION';
    length:=22 END;
189: BEGIN name:='RNPPNOPUNC';
    length:=10 END;
190: BEGIN name:='RNOUNARGMOD1';
    length:=12 END;
191: BEGIN name:='RNOUNARGMOD2';
    length:=12 END;
192: BEGIN name:='RNPARGMODSUBST1';
    length:=15 END;
193: BEGIN name:='RNPARGMODSUBST2';
    length:=15 END;
194: BEGIN name:='RIDNPPSUPERDEIXIS';
    length:=17 END;
195: BEGIN name:='RADJVOICEDEFAULT';
    length:=16 END;
196: BEGIN name:='RADJSENTENCESUBSTITUTION1';
    length:=25 END;
197: BEGIN name:='RADJPFORMULAFORMATION1';
    length:=22 END;
198: BEGIN name:='RADJEMPTYSUBST1';
    length:=15 END;
199: BEGIN name:='RADJEMPTYSUBST2';
    length:=15 END;
200: BEGIN name:='RADJEMPTYSUBST3';
    length:=15 END;
201: BEGIN name:='RCARD1';
    length:=6 END;
202: BEGIN name:='RCARD2';
    length:=6 END;
203: BEGIN name:='RMONTHTONP';
    length:=10 END;
204: BEGIN name:='RNPYEAR';
    length:=7 END;
205: BEGIN name:='RNPDAY';
    length:=6 END;
206: BEGIN name:='RNPDAYORD';
    length:=9 END;
207: BEGIN name:='RNPDAY1';
    length:=7 END;
208: BEGIN name:='RNPDAY1ORD';
    length:=10 END;
209: BEGIN name:='RWEEKDAY';
    length:=8 END;
210: BEGIN name:='RDETDERIVATION';
    length:=14 END;
211: BEGIN name:='DETPFORMATION1';
    length:=14 END;
212: BEGIN name:='DETPFORMATION2';
    length:=14 END;
213: BEGIN name:='DETPFORMATION3';
    length:=14 END;
214: BEGIN name:='DETPFORMATION4';
    length:=14 END;
215: BEGIN name:='RDETPSUPERDEIXIS';
    length:=16 END;
216: BEGIN name:='RDETPPARTITIVEFORMATION';
    length:=23 END;
217: BEGIN name:='RCARDTODETP';
    length:=11 END;
218: BEGIN name:='RADVPAMOUNTMOD';
    length:=14 END;
219: BEGIN name:='RADVPFOROBJMOD';
    length:=14 END;
220: BEGIN name:='RADVPINFCOMPLMOD';
    length:=16 END;
221: BEGIN name:='RQTOQP1';
    length:=7 END;
222: BEGIN name:='RQTOQP2';
    length:=7 END;
223: BEGIN name:='RQPCOMPARATIVECOMPLMOD';
    length:=22 END;
224: BEGIN name:='RQPSUPERLATIVECOMPLMOD';
    length:=22 END;
225: BEGIN name:='RQPFOROBJMOD';
    length:=12 END;
226: BEGIN name:='RQPINFCOMPLMOD';
    length:=14 END;
227: BEGIN name:='RQPAMOUNTMOD';
    length:=12 END;
228: BEGIN name:='RQPSUPERDEIXIS';
    length:=14 END;
229: BEGIN name:='RQPSUBSTITUTION1';
    length:=16 END;
230: BEGIN name:='RNPFORMATION1';
    length:=13 END;
231: BEGIN name:='RNPFORMATION2';
    length:=13 END;
232: BEGIN name:='RNPFORMATION3';
    length:=13 END;
233: BEGIN name:='RNPFORMATION4';
    length:=13 END;
234: BEGIN name:='RNPFORMATION4A';
    length:=14 END;
235: BEGIN name:='RNPFORMATION5';
    length:=13 END;
236: BEGIN name:='RNPFORMATION10';
    length:=14 END;
237: BEGIN name:='RANYNPFORMATION';
    length:=15 END;
238: BEGIN name:='RNPFORMATION12';
    length:=14 END;
239: BEGIN name:='RNPPRESENTSUPERDEIXIS1';
    length:=22 END;
240: BEGIN name:='RNPPASTSUPERDEIXIS1';
    length:=19 END;
241: BEGIN name:='RNPPRESENTSUPERDEIXIS2';
    length:=22 END;
242: BEGIN name:='RNPPASTSUPERDEIXIS2';
    length:=19 END;
243: BEGIN name:='RNPINDEFMODPOSS';
    length:=15 END;
244: BEGIN name:='RNPWHMODPOSS';
    length:=12 END;
245: BEGIN name:='RNPPROPERNOUNMODPOSS';
    length:=20 END;
246: BEGIN name:='RNPMODADVP1';
    length:=11 END;
247: BEGIN name:='RNPMODADVP2';
    length:=11 END;
248: BEGIN name:='RNPAPPOSITION';
    length:=13 END;
249: BEGIN name:='BNOUNTOSUBNOUN';
    length:=14 END;
250: BEGIN name:='RSUBNOUNTONOUN1';
    length:=15 END;
251: BEGIN name:='RSUBNOUNTONOUN2';
    length:=15 END;
252: BEGIN name:='RSUBNOUNTONOUN3';
    length:=15 END;
253: BEGIN name:='RBPROPERNOUNTOPROPERNOUN';
    length:=24 END;
254: BEGIN name:='RBPROPERNOUNTOSUBNOUN';
    length:=21 END;
255: BEGIN name:='RINDEFPROTOSUBINDEFPRO';
    length:=22 END;
256: BEGIN name:='RBWHPROTOWHPRO';
    length:=14 END;
257: BEGIN name:='RBPERSPROTOPERSPRO';
    length:=18 END;
258: BEGIN name:='RCNFORMATION1';
    length:=13 END;
259: BEGIN name:='RCNFORMATION2';
    length:=13 END;
260: BEGIN name:='RCNFORMATION3';
    length:=13 END;
261: BEGIN name:='RCNFORMATION4';
    length:=13 END;
262: BEGIN name:='RCNPRESENTSUPERDEIXIS';
    length:=21 END;
263: BEGIN name:='RCNPASTSUPERDEIXIS';
    length:=18 END;
264: BEGIN name:='RCNMODADJP1';
    length:=11 END;
265: BEGIN name:='RCNMODADJP2';
    length:=11 END;
266: BEGIN name:='RCNMODNUM';
    length:=9 END;
267: BEGIN name:='RCNMODPOSS1';
    length:=11 END;
268: BEGIN name:='RCNMODPOSS2';
    length:=11 END;
269: BEGIN name:='RCNMODPOSS3';
    length:=11 END;
270: BEGIN name:='RCNMODPP';
    length:=8 END;
271: BEGIN name:='RCNMODANTEREL1';
    length:=14 END;
272: BEGIN name:='RCNMODBARENP';
    length:=12 END;
273: BEGIN name:='RCNSPECPROPERNAME1';
    length:=18 END;
274: BEGIN name:='RCNSPECPROPERNAME2';
    length:=18 END;
275: BEGIN name:='RADJSUBSTITUTION1';
    length:=17 END;
276: BEGIN name:='RADJSUBSTITUTION2';
    length:=17 END;
277: BEGIN name:='RADJSUBSTITUTION3';
    length:=17 END;
278: BEGIN name:='RADJSUBSTITUTION4';
    length:=17 END;
279: BEGIN name:='RADJMOOD1';
    length:=9 END;
280: BEGIN name:='RADJMOOD2';
    length:=9 END;
281: BEGIN name:='RADJPUNC';
    length:=8 END;
282: BEGIN name:='RHELPEMPTYSUBJSUBST';
    length:=19 END;
283: BEGIN name:='RADJEMPTYSUBJSUBST';
    length:=18 END;
284: BEGIN name:='RINFINPASTDEIXISSPEC';
    length:=20 END;
285: BEGIN name:='RIMPDEIXIS';
    length:=10 END;
286: BEGIN name:='RFINIRRMODALDEIXIS';
    length:=18 END;
287: BEGIN name:='RFINPRESENTSUPERDEIXIS';
    length:=22 END;
288: BEGIN name:='RFINPASTSUPERDEIXIS1';
    length:=20 END;
289: BEGIN name:='RFINPASTSUPERDEIXIS2';
    length:=20 END;
290: BEGIN name:='RFINPRESFUTSUPERDEIXIS';
    length:=22 END;
291: BEGIN name:='RFINPASTFUTSUPERDEIXIS';
    length:=22 END;
292: BEGIN name:='RRETRO';
    length:=6 END;
293: BEGIN name:='RRETROSPEC';
    length:=10 END;
294: BEGIN name:='RINFINPRESENTSUPERDEIXIS';
    length:=24 END;
295: BEGIN name:='RINFINPASTSUPERDEIXIS';
    length:=21 END;
296: BEGIN name:='RINFINPASTSUPERDEIXISSPEC';
    length:=25 END;
297: BEGIN name:='RFINIRRMODALSUPERDEIXIS';
    length:=23 END;
298: BEGIN name:='RADJREFVARINSERTION';
    length:=19 END;
299: BEGIN name:='RADJDURVARINSERTION';
    length:=19 END;
300: BEGIN name:='RADJRETROVARINSERTION';
    length:=21 END;
301: BEGIN name:='RADJASPECTIMPERFECTIVE';
    length:=22 END;
302: BEGIN name:='RADJPRESENTSUPERDEIXIS';
    length:=22 END;
303: BEGIN name:='RADJPASTSUPERDEIXIS';
    length:=19 END;
304: BEGIN name:='RSENTNEGVAR';
    length:=11 END;
305: BEGIN name:='RSENTMELTNEGVAR';
    length:=15 END;
306: BEGIN name:='RVPNEGVAR';
    length:=9 END;
307: BEGIN name:='RSENTPOSVAR';
    length:=11 END;
308: BEGIN name:='RBADVTOSUBADV';
    length:=13 END;
309: BEGIN name:='RSUBADJTOSUBADV';
    length:=15 END;
310: BEGIN name:='RSTARTADVP0';
    length:=11 END;
311: BEGIN name:='RSTARTADVP1';
    length:=11 END;
312: BEGIN name:='RADVPSUPERDEIXIS';
    length:=16 END;
313: BEGIN name:='RADVPSUBST1';
    length:=11 END;
314: BEGIN name:='RADVPSUBST3';
    length:=11 END;
315: BEGIN name:='RADVPSUBST4';
    length:=11 END;
316: BEGIN name:='RSTARTADVPPROP100';
    length:=17 END;
317: BEGIN name:='RSTARTADVPPROP010';
    length:=17 END;
318: BEGIN name:='RSTARTADVPPROP120';
    length:=17 END;
319: BEGIN name:='RADVREFVARINSERTION';
    length:=19 END;
320: BEGIN name:='RADVCONJSENTVAR';
    length:=15 END;
321: BEGIN name:='RADVFINALCONJSENTVAR';
    length:=20 END;
322: BEGIN name:='RADVSENTADVVAR';
    length:=14 END;
323: BEGIN name:='RADVLOCADVVAR';
    length:=13 END;
324: BEGIN name:='RADVLOCPREPPVAR';
    length:=15 END;
325: BEGIN name:='RADVPPROPVOICE';
    length:=14 END;
326: BEGIN name:='RADVTOFORMULA';
    length:=13 END;
327: BEGIN name:='RADVPPASPECTIMPERF';
    length:=18 END;
328: BEGIN name:='RADVPPSUPERDEIXIS';
    length:=17 END;
329: BEGIN name:='RADVPPSUBJSUBST';
    length:=15 END;
330: BEGIN name:='ROPENADVPPMOOD';
    length:=14 END;
331: BEGIN name:='RCLOSEDADVPPMOOD';
    length:=16 END;
332: BEGIN name:='RADVPPNOPUNC';
    length:=12 END;
333: BEGIN name:='RADVPDEGREEMOD1';
    length:=15 END;
334: BEGIN name:='RADVPDEGREEMOD2';
    length:=15 END;
335: BEGIN name:='RADVPDEGREEMOD3';
    length:=15 END;
336: BEGIN name:='RADVPCOMPARISONCOMPLMOD';
    length:=23 END;
337: BEGIN name:='RSRELMARKING';
    length:=12 END;
338: BEGIN name:='RVPRELMARKING';
    length:=13 END;
339: BEGIN name:='RVARPPSRELMARKING';
    length:=17 END;
340: BEGIN name:='RPPSRELMARKING';
    length:=14 END;
341: BEGIN name:='RVARPPVPRELMARKING';
    length:=18 END;
342: BEGIN name:='RPPVPRELMARKING';
    length:=15 END;
343: BEGIN name:='RNORELMARKING';
    length:=13 END;
344: BEGIN name:='RPREPTOSUB';
    length:=10 END;
345: BEGIN name:='RSTARTPPPROP000';
    length:=15 END;
346: BEGIN name:='RSTARTPPPROP100';
    length:=15 END;
347: BEGIN name:='RSTARTPPPROP120';
    length:=15 END;
348: BEGIN name:='RPPPCONJSENTVAR';
    length:=15 END;
349: BEGIN name:='RPPPFINALCONJSENTVAR';
    length:=20 END;
350: BEGIN name:='RPPPSENTADVVAR';
    length:=14 END;
351: BEGIN name:='RPPPLOCADVVAR';
    length:=13 END;
352: BEGIN name:='RPPPLOCPREPPVAR';
    length:=15 END;
353: BEGIN name:='RPPPVOICE';
    length:=9 END;
354: BEGIN name:='RPPPNPMOD';
    length:=9 END;
355: BEGIN name:='RPPPREFVARINSERTION';
    length:=19 END;
356: BEGIN name:='RPPPDURVARINSERTION';
    length:=19 END;
357: BEGIN name:='RPPPRETROVARINSERTION';
    length:=21 END;
358: BEGIN name:='RPPPADVPMOD';
    length:=11 END;
359: BEGIN name:='RPREPTOFORMULA';
    length:=14 END;
360: BEGIN name:='RPPPASPECTIMPERF';
    length:=16 END;
361: BEGIN name:='RPPPSUPERDEIXIS';
    length:=15 END;
362: BEGIN name:='RPPPSUBJSUBST';
    length:=13 END;
363: BEGIN name:='RPPPNPSUBST';
    length:=11 END;
364: BEGIN name:='RPPPPREPPSUBST';
    length:=14 END;
365: BEGIN name:='RPPPADVPSUBST';
    length:=13 END;
366: BEGIN name:='ROPENPPPMOOD';
    length:=12 END;
367: BEGIN name:='RCLOSEDPPPMOOD';
    length:=14 END;
368: BEGIN name:='RPPPNOPUNC';
    length:=10 END;
369: BEGIN name:='RSTARTPREPP100';
    length:=14 END;
370: BEGIN name:='RSTARTPREPP120';
    length:=14 END;
371: BEGIN name:='RPPSUPERDEIXIS';
    length:=14 END;
372: BEGIN name:='RPPNPMOD';
    length:=8 END;
373: BEGIN name:='RPPADVPMOD';
    length:=10 END;
374: BEGIN name:='RPPSUBSTITUTION1';
    length:=16 END;
375: BEGIN name:='RPPSUBSTITUTION3';
    length:=16 END;
376: BEGIN name:='RPPSUBSTITUTION4';
    length:=16 END;
377: BEGIN name:='RCONJSENTVAR';
    length:=12 END;
378: BEGIN name:='RFINALCONJSENTVAR';
    length:=17 END;
379: BEGIN name:='RSENTADVVAR';
    length:=11 END;
380: BEGIN name:='RSENTPREPPVAR';
    length:=13 END;
381: BEGIN name:='RLOCADVVAR';
    length:=10 END;
382: BEGIN name:='RLOCPREPPVAR';
    length:=12 END;
383: BEGIN name:='RVPPREPPVAR';
    length:=11 END;
384: BEGIN name:='RCONJFINSUBSENT';
    length:=15 END;
385: BEGIN name:='RCONJINGSUBSENT';
    length:=15 END;
386: BEGIN name:='RCONJTOINFSUBSENT';
    length:=17 END;
387: BEGIN name:='RPREPFINSUBSENT';
    length:=15 END;
388: BEGIN name:='RPREPINGSUBSENT';
    length:=15 END;
389: BEGIN name:='RVPADV';
    length:=6 END;
390: BEGIN name:='RAGVPADVSUBJ';
    length:=12 END;
391: BEGIN name:='RAGVPADVBYOBJ';
    length:=13 END;
392: BEGIN name:='RAGVPADVOBJ';
    length:=11 END;
393: BEGIN name:='RDEMPROIDENTSG';
    length:=14 END;
394: BEGIN name:='RDEMPROIDENTPL';
    length:=14 END;
395: BEGIN name:='RDEMPROWHIDENTSG';
    length:=16 END;
396: BEGIN name:='RDEMPROWHIDENTPL';
    length:=16 END;
397: BEGIN name:='RPERSPROIDENT';
    length:=13 END;
398: BEGIN name:='RSENTIDENT';
    length:=10 END;
399: BEGIN name:='RIDENTREFVARINSERT';
    length:=18 END;
400: BEGIN name:='RIDENTSENTADVVAR';
    length:=16 END;
401: BEGIN name:='RIDENTCONJSENTVAR';
    length:=17 END;
402: BEGIN name:='RIDENTFINALCONJSENTVAR';
    length:=22 END;
403: BEGIN name:='RIDENTLOCADVVAR';
    length:=15 END;
404: BEGIN name:='RIDENTLOCPREPPVAR';
    length:=17 END;
405: BEGIN name:='RSTARTEXIST';
    length:=11 END;
406: BEGIN name:='REXISTREFVARINSERT';
    length:=18 END;
407: BEGIN name:='REXISTCONJSENTVAR';
    length:=17 END;
408: BEGIN name:='REXISTFINALCONJSENTVAR';
    length:=22 END;
409: BEGIN name:='REXISTSENTADVVAR';
    length:=16 END;
410: BEGIN name:='REXISTLOCADVVAR';
    length:=15 END;
411: BEGIN name:='REXISTLOCPREPPVAR';
    length:=17 END;
412: BEGIN name:='RUTTSENT';
    length:=8 END;
413: BEGIN name:='RUTTNP';
    length:=6 END;
414: BEGIN name:='RUTTADVP';
    length:=8 END;
415: BEGIN name:='RUTTADJP';
    length:=8 END;
416: BEGIN name:='RUTTPREPP';
    length:=9 END;
417: BEGIN name:='RUTTEXCLAM';
    length:=10 END;
418: BEGIN name:='RADDEXCLAM';
    length:=10 END;
419: BEGIN name:='RADJUNCTVAR1';
    length:=12 END;
420: BEGIN name:='RADJUNCTVAR2';
    length:=12 END;
421: BEGIN name:='RADJUNCTVAR3';
    length:=12 END;
422: BEGIN name:='RIDCN1';
    length:=6 END;
423: BEGIN name:='RIDNPFORMATION2';
    length:=15 END;
424: BEGIN name:='RIDALTNPFORMATION1';
    length:=18 END;
425: BEGIN name:='RIDSUBNOUNTONOUN';
    length:=16 END;
426: BEGIN name:='RIDDERIV1';
    length:=9 END;
427: BEGIN name:='RIDDERIV3';
    length:=9 END;
428: BEGIN name:='RIDDERIV7';
    length:=9 END;
429: BEGIN name:='RIDDERIV8';
    length:=9 END;
430: BEGIN name:='RIDDERIV9';
    length:=9 END;
431: BEGIN name:='RIDDERIV10';
    length:=10 END;
432: BEGIN name:='RIDDERIV12';
    length:=10 END;
433: BEGIN name:='RIDNPFORMATION';
    length:=14 END;
434: BEGIN name:='RIDSTARTVPPROP1VAR2ID0';
    length:=22 END;
435: BEGIN name:='RCNMODADVP1';
    length:=11 END;
436: BEGIN name:='RCNMODADVP2';
    length:=11 END;
437: BEGIN name:='RCNMODRELSENT1';
    length:=14 END;
438: BEGIN name:='RCNMODINFREL';
    length:=12 END;
439: BEGIN name:='RNPPARTITIVEFORMATION1';
    length:=22 END;
440: BEGIN name:='RNPPARTITIVEFORMATION2';
    length:=22 END;
441: BEGIN name:='RNPFORMATION6';
    length:=13 END;
442: BEGIN name:='RNPFORMATION7';
    length:=13 END;
443: BEGIN name:='RNPFORMATION8';
    length:=13 END;
444: BEGIN name:='RNPFORMATION9';
    length:=13 END;
445: BEGIN name:='RNPFORMATION13';
    length:=14 END;
446: BEGIN name:='RNPFORMATION11';
    length:=14 END;
447: BEGIN name:='RNPFORMATION14';
    length:=14 END;
448: BEGIN name:='RCARDNP';
    length:=7 END;
449: BEGIN name:='RBTOBIGPRO';
    length:=10 END;
450: BEGIN name:='RBIGPRONP';
    length:=9 END;
451: BEGIN name:='RSIMPLEOPENPPPCOORD';
    length:=19 END;
452: BEGIN name:='RSIMPLEPPCOORD';
    length:=14 END;
453: BEGIN name:='RITSKPPCOORD';
    length:=12 END;
454: BEGIN name:='RCOORDS';
    length:=7 END;
455: BEGIN name:='RCOORDITS';
    length:=9 END;
END;
END;
 FUNCTION LDMrules_IsFilter(
T:LDMrules_transformationindex):BOOLEAN;
BEGIN
LDMRULES_IsFilter:=(T>268)
END;
 PROCEDURE LDMrules_Transformationname(sg:LDMrules_subgrammarindex;
T:LDMrules_transformationindex;VAR name:string;VAR length:INTEGER);
BEGIN
CASE T OF
1: BEGIN name:='TSNEGADAPT';
    length:=10 END;
2: BEGIN name:='TVPNEGADAPT';
    length:=11 END;
3: BEGIN name:='TPPSNEGADAPT';
    length:=12 END;
4: BEGIN name:='TPPVPNEGADAPT';
    length:=13 END;
5: BEGIN name:='TCOMMAINCORP';
    length:=12 END;
6: BEGIN name:='TVPDELETION';
    length:=11 END;
7: BEGIN name:='TNOVPDELETION';
    length:=13 END;
8: BEGIN name:='TNEGAUXADAPT';
    length:=12 END;
9: BEGIN name:='TAUXTOCOMP';
    length:=10 END;
10: BEGIN name:='TAUXTOCOMP2';
    length:=11 END;
11: BEGIN name:='TNOAUXTOCOMP';
    length:=12 END;
12: BEGIN name:='TCANNEGINCORP';
    length:=13 END;
13: BEGIN name:='TCONJTHATDELETION';
    length:=17 END;
14: BEGIN name:='TSUBSTSPEED';
    length:=11 END;
15: BEGIN name:='TARGREFLSPELLING1';
    length:=17 END;
16: BEGIN name:='TARGREFLSPELLING2';
    length:=17 END;
17: BEGIN name:='TARGREFLSPELLING3';
    length:=17 END;
18: BEGIN name:='TARGREFLSPELLING4';
    length:=17 END;
19: BEGIN name:='TARGREFLSPELLING5';
    length:=17 END;
20: BEGIN name:='TARGREFLSPELLING6';
    length:=17 END;
21: BEGIN name:='TARGREFLSPELLING7';
    length:=17 END;
22: BEGIN name:='TARGREFLSPELLING8';
    length:=17 END;
23: BEGIN name:='TARGREFLSPELLING9';
    length:=17 END;
24: BEGIN name:='TARGREFLSPELLING10';
    length:=18 END;
25: BEGIN name:='TWHSHIFT';
    length:=8 END;
26: BEGIN name:='TNOWHSHIFT';
    length:=10 END;
27: BEGIN name:='TNOWHINFSHIFT';
    length:=13 END;
28: BEGIN name:='TEXTRAPWHSHIFT';
    length:=14 END;
29: BEGIN name:='TCOMPLWHSHIFT';
    length:=13 END;
30: BEGIN name:='TSTRANDEDWHSHIFT';
    length:=16 END;
31: BEGIN name:='TNOPROSTATUS';
    length:=12 END;
32: BEGIN name:='TPROSTATUS';
    length:=10 END;
33: BEGIN name:='TOBLOBJCONTROLPREPSENT';
    length:=22 END;
34: BEGIN name:='TOBLSUBJCONTROLPREPSENT';
    length:=23 END;
35: BEGIN name:='TOBLOBJCONTROLEXTRAPSENT';
    length:=24 END;
36: BEGIN name:='TOBLSUBJCONTROLEXTRAPSENT';
    length:=25 END;
37: BEGIN name:='TOBLPREPOBJCONTROLEXTRAPSENT';
    length:=28 END;
38: BEGIN name:='TOBLSUBJCONTROLOPENINGNP';
    length:=24 END;
39: BEGIN name:='TOBLOBJCONTROLPREPOPENINGNP';
    length:=27 END;
40: BEGIN name:='TOBLSUBJCONTROLPREPOPENINGNP';
    length:=28 END;
41: BEGIN name:='TNOVERBLEFT';
    length:=11 END;
42: BEGIN name:='TVERBLEFT';
    length:=9 END;
43: BEGIN name:='TNOPARTHOP';
    length:=10 END;
44: BEGIN name:='TOBLPARTHOP';
    length:=11 END;
45: BEGIN name:='TOPTPARTHOP';
    length:=11 END;
46: BEGIN name:='TOBJCASEASSIGN';
    length:=14 END;
47: BEGIN name:='TERGBECASEASSIGN';
    length:=16 END;
48: BEGIN name:='TSUBJCASEASSIGN';
    length:=15 END;
49: BEGIN name:='TPREPCASEASSIGN';
    length:=15 END;
50: BEGIN name:='TEXCEPTCASEASSIGN';
    length:=17 END;
51: BEGIN name:='TPREPEXCEPTCASEASSIGN';
    length:=21 END;
52: BEGIN name:='TXPPOBJCASEASSIGN';
    length:=17 END;
53: BEGIN name:='TXPPPREPCASEASSIGN';
    length:=18 END;
54: BEGIN name:='TNOAGREEMENT';
    length:=12 END;
55: BEGIN name:='TAGREEMENT';
    length:=10 END;
56: BEGIN name:='TNOTHATDELETION';
    length:=15 END;
57: BEGIN name:='TTHATDELETION';
    length:=13 END;
58: BEGIN name:='TSUBJOK';
    length:=7 END;
59: BEGIN name:='TOBJTOSUBJRAISING';
    length:=17 END;
60: BEGIN name:='TSUBJTOSUBJRAISING';
    length:=18 END;
61: BEGIN name:='TINDOBJTOSUBJRAISING';
    length:=20 END;
62: BEGIN name:='TPREPOBJTOSUBJRAISING';
    length:=21 END;
63: BEGIN name:='TTHERESUBJINSERTION';
    length:=19 END;
64: BEGIN name:='TITSUBJINSERTION';
    length:=16 END;
65: BEGIN name:='TNOCONTROLVERBP';
    length:=15 END;
66: BEGIN name:='TOBLOBJCONTROLPREPP';
    length:=19 END;
67: BEGIN name:='TOBLSUBJCONTROLPREPP';
    length:=20 END;
68: BEGIN name:='TNOCONTROLPREPP';
    length:=15 END;
69: BEGIN name:='TOBLOBJCONTROLPREPPREPP';
    length:=23 END;
70: BEGIN name:='TOBLOBJCONTROLADVP';
    length:=18 END;
71: BEGIN name:='TOBLSUBJCONTROLADVP';
    length:=19 END;
72: BEGIN name:='TNOCONTROLADVP';
    length:=14 END;
73: BEGIN name:='TOBLOBJCONTROLCOMPLSENT';
    length:=23 END;
74: BEGIN name:='TOBLSUBJCONTROLCOMPLSENT';
    length:=24 END;
75: BEGIN name:='TOBLPREPOBJCONTROLCOMPLSENT';
    length:=27 END;
76: BEGIN name:='TOBLBYOBJCONTROLCOMPLSENT';
    length:=25 END;
77: BEGIN name:='TNOCONTROL';
    length:=10 END;
78: BEGIN name:='TOBLOBJCONTROLADJP';
    length:=18 END;
79: BEGIN name:='TOBLSUBJCONTROLADJP';
    length:=19 END;
80: BEGIN name:='TNOCONTROLADJP';
    length:=14 END;
81: BEGIN name:='TOBLOBJCONTROLPREPADJP';
    length:=22 END;
82: BEGIN name:='TOBLSUBJCONTROLPREPADJP';
    length:=23 END;
83: BEGIN name:='TNOCONTROLPREPADJP';
    length:=18 END;
84: BEGIN name:='TOBLOBJCONTROLNP';
    length:=16 END;
85: BEGIN name:='TOBLSUBJCONTROLNP';
    length:=17 END;
86: BEGIN name:='TNOCONTROLNP';
    length:=12 END;
87: BEGIN name:='TNOCONTROLID';
    length:=12 END;
88: BEGIN name:='TOBLOBJCONTROLPREPNP';
    length:=20 END;
89: BEGIN name:='TOBLSUBJCONTROLPREPNP';
    length:=21 END;
90: BEGIN name:='TNOCONTROLPREPNP';
    length:=16 END;
91: BEGIN name:='TNOEXTRAPOSITION';
    length:=16 END;
92: BEGIN name:='TEXTRAPOSITION1';
    length:=15 END;
93: BEGIN name:='TEXTRAPOSITION2';
    length:=15 END;
94: BEGIN name:='TEXTRAPOSITION3';
    length:=15 END;
95: BEGIN name:='TPREDEXTRAPOS1';
    length:=14 END;
96: BEGIN name:='TASPECTNEUTRALIZATION';
    length:=21 END;
97: BEGIN name:='TASPECTNEUTRALIZATION2';
    length:=22 END;
98: BEGIN name:='TASPECTNEUTRALIZATION3';
    length:=22 END;
99: BEGIN name:='TASPECTNEUTRALIZATION4';
    length:=22 END;
100: BEGIN name:='TRETRONEUTRALIZATION1';
    length:=21 END;
101: BEGIN name:='TRETRONEUTRALIZATION2';
    length:=21 END;
102: BEGIN name:='TTEMPCONJSENTADAPTATION';
    length:=23 END;
103: BEGIN name:='TTEMPADVCHECK';
    length:=13 END;
104: BEGIN name:='TFINITE1';
    length:=8 END;
105: BEGIN name:='TFINITE2';
    length:=8 END;
106: BEGIN name:='TINFINITE';
    length:=9 END;
107: BEGIN name:='TOBJRECIPROINSERTION1';
    length:=21 END;
108: BEGIN name:='TPOSSADJSPELLING1';
    length:=17 END;
109: BEGIN name:='TNOREFLINSERTION';
    length:=16 END;
110: BEGIN name:='TOBJREFLINSERTION1';
    length:=18 END;
111: BEGIN name:='TOBJREFLINSERTION2';
    length:=18 END;
112: BEGIN name:='TINDOBJREFLINSERTION1';
    length:=21 END;
113: BEGIN name:='TINDOBJREFLINSERTION2';
    length:=21 END;
114: BEGIN name:='TNOPARTICLEINSERTION';
    length:=20 END;
115: BEGIN name:='TPARTICLEINSERTION';
    length:=18 END;
116: BEGIN name:='TVERBPATTERN7';
    length:=13 END;
117: BEGIN name:='TVERBPATTERN8';
    length:=13 END;
118: BEGIN name:='TVERBPATTERN9';
    length:=13 END;
119: BEGIN name:='TVERBPATTERN10';
    length:=14 END;
120: BEGIN name:='TVERBPATTERN11';
    length:=14 END;
121: BEGIN name:='TVERBPATTERN5';
    length:=13 END;
122: BEGIN name:='TVERBPATTERN6';
    length:=13 END;
123: BEGIN name:='TVERBPATTERN12';
    length:=14 END;
124: BEGIN name:='TVERBPATTERN13';
    length:=14 END;
125: BEGIN name:='TVERBPATTERN4';
    length:=13 END;
126: BEGIN name:='TIDVERBPATTERN';
    length:=14 END;
127: BEGIN name:='TVERBPATTERN3';
    length:=13 END;
128: BEGIN name:='TVERBPATTERN0';
    length:=13 END;
129: BEGIN name:='TVERBPATTERN1';
    length:=13 END;
130: BEGIN name:='TVERBPATTERN2';
    length:=13 END;
131: BEGIN name:='TADJPATTERN0';
    length:=12 END;
132: BEGIN name:='TADJPATTERN11';
    length:=13 END;
133: BEGIN name:='TADJPATTERN12';
    length:=13 END;
134: BEGIN name:='TADJPATTERN14';
    length:=13 END;
135: BEGIN name:='TADJPATTERN15';
    length:=13 END;
136: BEGIN name:='TADJPATTERN16';
    length:=13 END;
137: BEGIN name:='TADJPATTERN18A';
    length:=14 END;
138: BEGIN name:='TNPPOSTOPOSTMOD';
    length:=15 END;
139: BEGIN name:='TNPAKTSTATIVE';
    length:=13 END;
140: BEGIN name:='TNPNOPROSUBJ';
    length:=12 END;
141: BEGIN name:='TNPPROSUBJ';
    length:=10 END;
142: BEGIN name:='TADJQPHOPPING1';
    length:=14 END;
143: BEGIN name:='TADJQPHOPPING2';
    length:=14 END;
144: BEGIN name:='TADVQPHOPPING1';
    length:=14 END;
145: BEGIN name:='TADVQPHOPPING2';
    length:=14 END;
146: BEGIN name:='TADJCASEASSIGNMENT1';
    length:=19 END;
147: BEGIN name:='TADJCASEASSIGNMENT2';
    length:=19 END;
148: BEGIN name:='TADJCOMPLEXTRAPOS';
    length:=17 END;
149: BEGIN name:='TADJMORETOER';
    length:=12 END;
150: BEGIN name:='TADJMORENOTTOER';
    length:=15 END;
151: BEGIN name:='TADJNOERNOMORE';
    length:=14 END;
152: BEGIN name:='TADJMOSTTOST';
    length:=12 END;
153: BEGIN name:='TADJMOSTNOTTOST';
    length:=15 END;
154: BEGIN name:='TADJNOSTNOMOST';
    length:=14 END;
155: BEGIN name:='TADJCONTROL0';
    length:=12 END;
156: BEGIN name:='TADJCONTROL1';
    length:=12 END;
157: BEGIN name:='TADJCONTROL4';
    length:=12 END;
158: BEGIN name:='TQPOFCOMPLCASEASSIGNMENT';
    length:=24 END;
159: BEGIN name:='TQPACCCASEASSIGNMENT';
    length:=20 END;
160: BEGIN name:='TNPHOP';
    length:=6 END;
161: BEGIN name:='TNPADJADVPCOMPLEXTRAPOS1';
    length:=24 END;
162: BEGIN name:='TNPADJQPCOMPLEXTRAPOS1';
    length:=22 END;
163: BEGIN name:='TNPQPCOMPLEXTRAPOS';
    length:=18 END;
164: BEGIN name:='TNPENDELETION1';
    length:=14 END;
165: BEGIN name:='TNPCNDELETION1';
    length:=14 END;
166: BEGIN name:='TNPCNDELETION2';
    length:=14 END;
167: BEGIN name:='TNPCOUNTENTOONE1';
    length:=16 END;
168: BEGIN name:='TADJSETPROSUBJECT';
    length:=17 END;
169: BEGIN name:='TNOSUPERDEIXISADAPTATION';
    length:=24 END;
170: BEGIN name:='TSUPERDEIXISADAPTATION1A';
    length:=24 END;
171: BEGIN name:='TSUPERDEIXISADAPTATION1B';
    length:=24 END;
172: BEGIN name:='TSUPERDEIXISADAPTATION2';
    length:=23 END;
173: BEGIN name:='TSUPERDEIXISADAPTATION5';
    length:=23 END;
174: BEGIN name:='TIDSUPERDEIXISADAPTATION';
    length:=24 END;
175: BEGIN name:='TSUPERDEIXISADAPTATION11';
    length:=24 END;
176: BEGIN name:='TSUPERDEIXISADAPTATION12';
    length:=24 END;
177: BEGIN name:='TDEIXISRETROADAPTATION1';
    length:=23 END;
178: BEGIN name:='THAVEMODALADAPTATION';
    length:=20 END;
179: BEGIN name:='TREFDELETION';
    length:=12 END;
180: BEGIN name:='TRETRODELETION';
    length:=14 END;
181: BEGIN name:='TRETRODELETION2';
    length:=15 END;
182: BEGIN name:='TTEMPADVRELPRES';
    length:=15 END;
183: BEGIN name:='TADJAKTSTATIVE1';
    length:=15 END;
184: BEGIN name:='TADJASPECTNEUTRALISATION';
    length:=24 END;
185: BEGIN name:='TADJSUPERDEIXISADAPTATION1';
    length:=26 END;
186: BEGIN name:='TADJSUPERDEIXISADAPTATION2';
    length:=26 END;
187: BEGIN name:='TADJNOSUPERDEIXISADAPTATION';
    length:=27 END;
188: BEGIN name:='TAKTACTIVITY1';
    length:=13 END;
189: BEGIN name:='TAKTACTIVITY2';
    length:=13 END;
190: BEGIN name:='TAKTACTIVITY3';
    length:=13 END;
191: BEGIN name:='TAKTACTIVITY4';
    length:=13 END;
192: BEGIN name:='TAKTACTIVITY5';
    length:=13 END;
193: BEGIN name:='TAKTACTIVITY6';
    length:=13 END;
194: BEGIN name:='TAKTACCOMPLISHMENT1';
    length:=19 END;
195: BEGIN name:='TAKTACCOMPLISHMENT2';
    length:=19 END;
196: BEGIN name:='TAKTACCOMPLISHMENT3';
    length:=19 END;
197: BEGIN name:='TAKTACHIEVEMENT1';
    length:=16 END;
198: BEGIN name:='TAKTSTATIVE1';
    length:=12 END;
199: BEGIN name:='TAKTSTATIVE2';
    length:=12 END;
200: BEGIN name:='TDOBEDELETION';
    length:=13 END;
201: BEGIN name:='TDOBEDELETION2';
    length:=14 END;
202: BEGIN name:='TNODOBEDELETION';
    length:=15 END;
203: BEGIN name:='TDODELETION';
    length:=11 END;
204: BEGIN name:='TPOSDELETION';
    length:=12 END;
205: BEGIN name:='TNODELETION1';
    length:=12 END;
206: BEGIN name:='TNODELETION2';
    length:=12 END;
207: BEGIN name:='TSHALLWILL';
    length:=10 END;
208: BEGIN name:='TADVPPATTERN0';
    length:=13 END;
209: BEGIN name:='TADVPPATTERN1';
    length:=13 END;
210: BEGIN name:='TADVPATTERN0';
    length:=12 END;
211: BEGIN name:='TADVPATTERN1';
    length:=12 END;
212: BEGIN name:='TADVPPNOPROSUBJECT';
    length:=18 END;
213: BEGIN name:='TADVPPPROSUBJECT';
    length:=16 END;
214: BEGIN name:='TADVPPASPECTNEUTRALIZATION';
    length:=26 END;
215: BEGIN name:='TADVPACCCASEASSIGNMENT';
    length:=22 END;
216: BEGIN name:='TADVMORETOER';
    length:=12 END;
217: BEGIN name:='TPPPPATTERN0';
    length:=12 END;
218: BEGIN name:='TPPPPATTERN1';
    length:=12 END;
219: BEGIN name:='TNOPPCASEASSIGN';
    length:=15 END;
220: BEGIN name:='TPPCASEASSIGN';
    length:=13 END;
221: BEGIN name:='TPPPNOPROSUBJ';
    length:=13 END;
222: BEGIN name:='TPPPPROSUBJ';
    length:=11 END;
223: BEGIN name:='TPPPASPECTNEUTRALIZATION';
    length:=24 END;
224: BEGIN name:='TSUPERDEIXISADAPTATION3';
    length:=23 END;
225: BEGIN name:='TSUPERDEIXISADAPTATION4';
    length:=23 END;
226: BEGIN name:='TSUPERDEIXISADAPTATION6';
    length:=23 END;
227: BEGIN name:='TSUPERDEIXISADAPTATION7';
    length:=23 END;
228: BEGIN name:='TSUPERDEIXISADAPTATION8';
    length:=23 END;
229: BEGIN name:='TSUPERDEIXISADAPTATION9';
    length:=23 END;
230: BEGIN name:='TSUPERDEIXISADAPTATION10';
    length:=24 END;
231: BEGIN name:='TPPPREPPATTERN0';
    length:=15 END;
232: BEGIN name:='TPPPREPPATTERN1';
    length:=15 END;
233: BEGIN name:='TPREPPCA0';
    length:=9 END;
234: BEGIN name:='TPREPPCA1';
    length:=9 END;
235: BEGIN name:='TNOPPTOVARPP';
    length:=12 END;
236: BEGIN name:='TPPTOVARPP';
    length:=10 END;
237: BEGIN name:='TNOVPADVS';
    length:=9 END;
238: BEGIN name:='TSUBJCONTROLCONJSENT';
    length:=20 END;
239: BEGIN name:='TSUBJCONTROLFINALCONJSENT';
    length:=25 END;
240: BEGIN name:='TSUBJCONTROLCONJPREPNP';
    length:=22 END;
241: BEGIN name:='TSUBJCONTROLFINALCONJPREPNP';
    length:=27 END;
242: BEGIN name:='TSADJCOMPLEXTRAPOS';
    length:=18 END;
243: BEGIN name:='TCOMPARINCORP';
    length:=13 END;
244: BEGIN name:='TSUPERINCORP';
    length:=12 END;
245: BEGIN name:='TNOINCORP';
    length:=9 END;
246: BEGIN name:='TINCORPDEFAULT';
    length:=14 END;
247: BEGIN name:='TMOVETOPIC';
    length:=10 END;
248: BEGIN name:='TNOTOPICCLEFT';
    length:=13 END;
249: BEGIN name:='TPOLITE1';
    length:=8 END;
250: BEGIN name:='TPOLITE2';
    length:=8 END;
251: BEGIN name:='TPOLITE3';
    length:=8 END;
252: BEGIN name:='TPOLITE4';
    length:=8 END;
253: BEGIN name:='TPOLITE5A';
    length:=9 END;
254: BEGIN name:='TPOLITE5B';
    length:=9 END;
255: BEGIN name:='TPOLITE6';
    length:=8 END;
256: BEGIN name:='TPOLITE7';
    length:=8 END;
257: BEGIN name:='TNOFINCONTROL';
    length:=13 END;
258: BEGIN name:='TEXTRAPFINCONTROL';
    length:=17 END;
259: BEGIN name:='TCOMPLFINCONTROL';
    length:=16 END;
260: BEGIN name:='TPREPFINCONTROL';
    length:=15 END;
261: BEGIN name:='TPOSTSENTFINCONTROL';
    length:=19 END;
262: BEGIN name:='TINFRELCONTROL';
    length:=14 END;
263: BEGIN name:='TPROGBETOBE1';
    length:=12 END;
264: BEGIN name:='TPROGBETOBE2';
    length:=12 END;
265: BEGIN name:='TIDCLAUSETOVPPROP';
    length:=17 END;
266: BEGIN name:='TIDVPPROPTOCLAUSE';
    length:=17 END;
267: BEGIN name:='TISIDIOM';
    length:=8 END;
268: BEGIN name:='TISNOTIDIOM';
    length:=11 END;
269: BEGIN name:='FNOPERSPRO';
    length:=10 END;
270: BEGIN name:='FPOSTNEGADAPT';
    length:=13 END;
271: BEGIN name:='FNEGBLOCK';
    length:=9 END;
272: BEGIN name:='FPOSTCOMMAINCORP';
    length:=16 END;
273: BEGIN name:='FPRECOMMAINCORP';
    length:=15 END;
274: BEGIN name:='FPRECOORDINTRO';
    length:=14 END;
275: BEGIN name:='FPRENEGAUXADAPT';
    length:=15 END;
276: BEGIN name:='FPRECANNEGINCORP';
    length:=16 END;
277: BEGIN name:='FCANNEGINCORP';
    length:=13 END;
278: BEGIN name:='FPRERECIPRO1';
    length:=12 END;
279: BEGIN name:='FPREOBJCASEASSIGN';
    length:=17 END;
280: BEGIN name:='FPRESUBJCASEASSIGN';
    length:=18 END;
281: BEGIN name:='FPREPREPCASEASSIGN';
    length:=18 END;
282: BEGIN name:='FPREEXCEPTCASEASSIGN';
    length:=20 END;
283: BEGIN name:='FPREPREPEXCEPTCASEASSIGN';
    length:=24 END;
284: BEGIN name:='FPREXPPOBJCASEASSIGN';
    length:=20 END;
285: BEGIN name:='FPREXPPPREPCASEASSIGN';
    length:=21 END;
286: BEGIN name:='FPOSTOBJCASEASSIGN';
    length:=18 END;
287: BEGIN name:='FPOSTSUBJCASEASSIGN';
    length:=19 END;
288: BEGIN name:='FPOSTPREPCASEASSIGN';
    length:=19 END;
289: BEGIN name:='FPOSTEXCEPTCASEASSIGN';
    length:=21 END;
290: BEGIN name:='FPOSTPREPEXCEPTCASEASSIGN';
    length:=25 END;
291: BEGIN name:='FPOSTXPPOBJCASEASSIGN';
    length:=21 END;
292: BEGIN name:='FPOSTXPPPREPCASEASSIGN';
    length:=22 END;
293: BEGIN name:='FPREEXTRAPOS';
    length:=12 END;
294: BEGIN name:='FRETRONEUTRALIZATION1';
    length:=21 END;
295: BEGIN name:='FRETRONEUTRALIZATION2';
    length:=21 END;
296: BEGIN name:='FPOSTTEMPCONJSENTADAPTATION';
    length:=27 END;
297: BEGIN name:='FPRETEMPCONJSENTADAPTATION';
    length:=26 END;
298: BEGIN name:='FPRETEMPCONJSENTMOVETOLEFT';
    length:=26 END;
299: BEGIN name:='FPOSSADJSPELLING1';
    length:=17 END;
300: BEGIN name:='FPOSSADJSPELLING2';
    length:=17 END;
301: BEGIN name:='FNPPOSTOPOSTMOD';
    length:=15 END;
302: BEGIN name:='FITTHISTHAT';
    length:=11 END;
303: BEGIN name:='FPOSTADJQPHOPPING';
    length:=17 END;
304: BEGIN name:='FPOSTADVQPHOPPING';
    length:=17 END;
305: BEGIN name:='FADJPRESUBST';
    length:=12 END;
306: BEGIN name:='FADJPOSTCASEASSIGNMENT1';
    length:=23 END;
307: BEGIN name:='FADJPOSTCASEASSIGNMENT2';
    length:=23 END;
308: BEGIN name:='FADJPRECASEASSIGNMENT1';
    length:=22 END;
309: BEGIN name:='FADJPRECASEASSIGNMENT2';
    length:=22 END;
310: BEGIN name:='FADJPOSTCOMPLEXTRAPOS';
    length:=21 END;
311: BEGIN name:='FADJPRECOMPLEXTRAPOS';
    length:=20 END;
312: BEGIN name:='FPOSTNPADJADVPCOMPLEXTRAPOS1';
    length:=28 END;
313: BEGIN name:='FPRENPADJADVPCOMPLEXTRAPOS1';
    length:=27 END;
314: BEGIN name:='FPOSTNPADJQPCOMPLEXTRAPOS1';
    length:=26 END;
315: BEGIN name:='FPRENPADJQPCOMPLEXTRAPOS1';
    length:=25 END;
316: BEGIN name:='FPRENPQPCOMPLEXTRAPOS';
    length:=21 END;
317: BEGIN name:='FPOSTNPQPCOMPLEXTRAPOS';
    length:=22 END;
318: BEGIN name:='FPOSTNPCOUNTENTOONE1';
    length:=20 END;
319: BEGIN name:='FPRENPCOUNTENTOONE1';
    length:=19 END;
320: BEGIN name:='FPOSTNPENDELETION';
    length:=17 END;
321: BEGIN name:='FPRENPENDELETION';
    length:=16 END;
322: BEGIN name:='FTEMPADJCHECK';
    length:=13 END;
323: BEGIN name:='FSUPERDEIXISADAPTATION11';
    length:=24 END;
324: BEGIN name:='FTEMPINDEP1';
    length:=11 END;
325: BEGIN name:='FSUPERDEIXISADAPTATION12';
    length:=24 END;
326: BEGIN name:='FDEIXISRETROADAPTATION1';
    length:=23 END;
327: BEGIN name:='FHAVEMODALADAPTATION';
    length:=20 END;
328: BEGIN name:='FREFDELETION';
    length:=12 END;
329: BEGIN name:='FRETRODELETION';
    length:=14 END;
330: BEGIN name:='FRETRODELETION2';
    length:=15 END;
331: BEGIN name:='FADJSUPERDEIXISADAPTATION2';
    length:=26 END;
332: BEGIN name:='FNOSHALL';
    length:=8 END;
333: BEGIN name:='FPOSTADVMORETOER';
    length:=16 END;
334: BEGIN name:='FNOTOPIC';
    length:=8 END;
335: BEGIN name:='FSUPERDEIXISADAPTATION9';
    length:=23 END;
336: BEGIN name:='FPOSTCONJSENTCONTROL';
    length:=20 END;
337: BEGIN name:='FPRECONJSENTCONTROL';
    length:=19 END;
338: BEGIN name:='FSADJPOSTCOMPLEXTRAPOS';
    length:=22 END;
339: BEGIN name:='FSADJPRECOMPLEXTRAPOS';
    length:=21 END;
340: BEGIN name:='FPOLITE7';
    length:=8 END;
341: BEGIN name:='FINFRELCONTROL';
    length:=14 END;
342: BEGIN name:='FPREINFRELCONTROL';
    length:=17 END;
343: BEGIN name:='FPROGBETOBE';
    length:=11 END;
344: BEGIN name:='FPREARGREFLSPELLING';
    length:=19 END;
345: BEGIN name:='FPOSTARGREFLSPELLING';
    length:=20 END;
END;
END;
 PROCEDURE LDMrules_subgrammarname(sg:LDMrules_subgrammarindex;
VAR name:string;VAR length:INTEGER);
BEGIN
CASE sg OF
1: BEGIN name:='VERBDERIVATION';
    length:=14 END;
2: BEGIN name:='VERBPPROPFORMATION';
    length:=18 END;
3: BEGIN name:='XPPROPTOCLAUSE';
    length:=14 END;
4: BEGIN name:='CLAUSETOSENTENCE';
    length:=16 END;
5: BEGIN name:='NPDERIVATION';
    length:=12 END;
6: BEGIN name:='CNFORMATION';
    length:=11 END;
7: BEGIN name:='NPFORMATION';
    length:=11 END;
8: BEGIN name:='DETDERIVATION';
    length:=13 END;
9: BEGIN name:='DETPFORMATION';
    length:=13 END;
10: BEGIN name:='NPPROPFORMATION';
    length:=15 END;
11: BEGIN name:='TONPPROP';
    length:=8 END;
12: BEGIN name:='DATUMFORMATION';
    length:=14 END;
13: BEGIN name:='CARDINALFORMATION';
    length:=17 END;
14: BEGIN name:='QPFORMATION';
    length:=11 END;
15: BEGIN name:='ADJDERIVATION';
    length:=13 END;
16: BEGIN name:='ADJPPROPFORMATION';
    length:=17 END;
17: BEGIN name:='ADJPPROPTOADJPFORMULA';
    length:=21 END;
18: BEGIN name:='ADJPFORMULATOADJPPROP';
    length:=21 END;
19: BEGIN name:='ADVDERIVATION';
    length:=13 END;
20: BEGIN name:='ADVPFORMATION';
    length:=13 END;
21: BEGIN name:='ADVPPROPFORMATION';
    length:=17 END;
22: BEGIN name:='ADVPPROPTOFORMULA';
    length:=17 END;
23: BEGIN name:='ADVPFORMULATOPROP';
    length:=17 END;
24: BEGIN name:='PREPDERIVATION';
    length:=14 END;
25: BEGIN name:='PREPPPROPFORMATION';
    length:=18 END;
26: BEGIN name:='PREPPPROPTOFORMULA';
    length:=18 END;
27: BEGIN name:='PREPPFORMULATOPROP';
    length:=18 END;
28: BEGIN name:='PREPPFORMATION';
    length:=14 END;
29: BEGIN name:='IDENTPROPFORMATION';
    length:=18 END;
30: BEGIN name:='EXISTPROPFORMATION';
    length:=18 END;
31: BEGIN name:='UTTERANCE';
    length:=9 END;
32: BEGIN name:='COORDINATION';
    length:=12 END;
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
6: R2:=1;
151: R2:=2;
152: R2:=2;
153: R2:=2;
154: R2:=2;
155: R2:=2;
156: R2:=2;
157: R2:=2;
158: R2:=2;
149: R2:=2;
150: R2:=2;
434: R2:=2;
426: R2:=2;
427: R2:=2;
428: R2:=2;
429: R2:=2;
430: R2:=2;
431: R2:=2;
432: R2:=2;
419: R2:=2;
420: R2:=2;
421: R2:=2;
383: R2:=2;
87: R2:=2;
88: R2:=2;
86: R2:=2;
379: R2:=2;
380: R2:=2;
377: R2:=2;
378: R2:=2;
381: R2:=2;
382: R2:=2;
146: R2:=2;
147: R2:=2;
148: R2:=2;
106: R2:=3;
107: R2:=3;
108: R2:=3;
109: R2:=3;
110: R2:=3;
129: R2:=3;
130: R2:=3;
131: R2:=3;
132: R2:=3;
133: R2:=3;
134: R2:=3;
111: R2:=3;
112: R2:=3;
141: R2:=3;
142: R2:=3;
143: R2:=3;
144: R2:=3;
145: R2:=3;
113: R2:=3;
114: R2:=3;
115: R2:=3;
116: R2:=3;
117: R2:=3;
118: R2:=3;
119: R2:=3;
135: R2:=3;
136: R2:=3;
137: R2:=3;
138: R2:=3;
139: R2:=3;
140: R2:=3;
120: R2:=3;
121: R2:=3;
122: R2:=3;
94: R2:=3;
123: R2:=3;
124: R2:=3;
125: R2:=3;
126: R2:=3;
127: R2:=3;
128: R2:=3;
99: R2:=3;
100: R2:=3;
101: R2:=3;
102: R2:=3;
105: R2:=3;
103: R2:=3;
104: R2:=3;
97: R2:=3;
95: R2:=3;
96: R2:=3;
98: R2:=3;
292: R2:=3;
293: R2:=3;
83: R2:=3;
84: R2:=3;
284: R2:=3;
285: R2:=3;
287: R2:=3;
288: R2:=3;
289: R2:=3;
294: R2:=3;
295: R2:=3;
296: R2:=3;
85: R2:=3;
290: R2:=3;
291: R2:=3;
286: R2:=3;
297: R2:=3;
389: R2:=3;
390: R2:=3;
391: R2:=3;
392: R2:=3;
75: R2:=3;
78: R2:=3;
79: R2:=3;
80: R2:=3;
76: R2:=3;
77: R2:=3;
81: R2:=3;
74: R2:=3;
337: R2:=4;
338: R2:=4;
340: R2:=4;
342: R2:=4;
339: R2:=4;
341: R2:=4;
343: R2:=4;
16: R2:=4;
304: R2:=4;
305: R2:=4;
306: R2:=4;
307: R2:=4;
90: R2:=4;
92: R2:=4;
91: R2:=4;
93: R2:=4;
55: R2:=4;
56: R2:=4;
57: R2:=4;
58: R2:=4;
59: R2:=4;
61: R2:=4;
62: R2:=4;
44: R2:=4;
45: R2:=4;
46: R2:=4;
63: R2:=4;
64: R2:=4;
65: R2:=4;
66: R2:=4;
67: R2:=4;
68: R2:=4;
69: R2:=4;
70: R2:=4;
71: R2:=4;
72: R2:=4;
73: R2:=4;
48: R2:=4;
47: R2:=4;
49: R2:=4;
50: R2:=4;
51: R2:=4;
52: R2:=4;
53: R2:=4;
54: R2:=4;
82: R2:=4;
33: R2:=4;
34: R2:=4;
35: R2:=4;
36: R2:=4;
37: R2:=4;
38: R2:=4;
39: R2:=4;
40: R2:=4;
41: R2:=4;
18: R2:=4;
42: R2:=4;
43: R2:=4;
19: R2:=4;
20: R2:=4;
21: R2:=4;
22: R2:=4;
23: R2:=4;
24: R2:=4;
25: R2:=4;
26: R2:=4;
27: R2:=4;
28: R2:=4;
29: R2:=4;
30: R2:=4;
31: R2:=4;
32: R2:=4;
13: R2:=4;
12: R2:=4;
14: R2:=4;
15: R2:=4;
384: R2:=4;
385: R2:=4;
387: R2:=4;
388: R2:=4;
386: R2:=4;
11: R2:=4;
7: R2:=4;
8: R2:=4;
9: R2:=4;
10: R2:=4;
249: R2:=5;
256: R2:=5;
257: R2:=5;
253: R2:=5;
255: R2:=5;
254: R2:=5;
449: R2:=5;
250: R2:=6;
251: R2:=6;
252: R2:=6;
258: R2:=6;
259: R2:=6;
260: R2:=6;
261: R2:=6;
422: R2:=6;
262: R2:=6;
263: R2:=6;
2: R2:=6;
3: R2:=6;
190: R2:=6;
191: R2:=6;
272: R2:=6;
273: R2:=6;
274: R2:=6;
264: R2:=6;
265: R2:=6;
266: R2:=6;
270: R2:=6;
437: R2:=6;
271: R2:=6;
267: R2:=6;
268: R2:=6;
269: R2:=6;
435: R2:=6;
436: R2:=6;
438: R2:=6;
4: R2:=6;
230: R2:=7;
231: R2:=7;
232: R2:=7;
233: R2:=7;
234: R2:=7;
235: R2:=7;
441: R2:=7;
442: R2:=7;
443: R2:=7;
444: R2:=7;
236: R2:=7;
446: R2:=7;
237: R2:=7;
439: R2:=7;
440: R2:=7;
238: R2:=7;
445: R2:=7;
447: R2:=7;
448: R2:=7;
450: R2:=7;
5: R2:=7;
239: R2:=7;
240: R2:=7;
241: R2:=7;
242: R2:=7;
244: R2:=7;
245: R2:=7;
243: R2:=7;
248: R2:=7;
246: R2:=7;
247: R2:=7;
192: R2:=7;
193: R2:=7;
210: R2:=8;
211: R2:=9;
212: R2:=9;
214: R2:=9;
217: R2:=9;
215: R2:=9;
213: R2:=9;
216: R2:=9;
178: R2:=10;
179: R2:=10;
180: R2:=10;
181: R2:=10;
182: R2:=10;
183: R2:=10;
184: R2:=10;
185: R2:=10;
194: R2:=11;
186: R2:=11;
187: R2:=11;
188: R2:=11;
189: R2:=11;
203: R2:=12;
204: R2:=12;
205: R2:=12;
207: R2:=12;
206: R2:=12;
208: R2:=12;
209: R2:=12;
201: R2:=13;
202: R2:=13;
221: R2:=14;
222: R2:=14;
228: R2:=14;
225: R2:=14;
223: R2:=14;
224: R2:=14;
226: R2:=14;
227: R2:=14;
229: R2:=14;
165: R2:=15;
166: R2:=15;
167: R2:=16;
168: R2:=16;
169: R2:=16;
170: R2:=16;
172: R2:=16;
171: R2:=16;
159: R2:=16;
160: R2:=16;
162: R2:=16;
163: R2:=16;
164: R2:=16;
298: R2:=16;
299: R2:=16;
300: R2:=16;
173: R2:=16;
175: R2:=16;
174: R2:=16;
177: R2:=16;
176: R2:=16;
195: R2:=16;
196: R2:=17;
197: R2:=17;
301: R2:=17;
302: R2:=17;
303: R2:=17;
198: R2:=17;
199: R2:=17;
200: R2:=17;
275: R2:=18;
276: R2:=18;
277: R2:=18;
278: R2:=18;
279: R2:=18;
280: R2:=18;
281: R2:=18;
283: R2:=18;
282: R2:=18;
308: R2:=19;
309: R2:=19;
310: R2:=20;
311: R2:=20;
312: R2:=20;
333: R2:=20;
334: R2:=20;
335: R2:=20;
336: R2:=20;
220: R2:=20;
219: R2:=20;
313: R2:=20;
314: R2:=20;
315: R2:=20;
218: R2:=20;
316: R2:=21;
317: R2:=21;
318: R2:=21;
319: R2:=21;
320: R2:=21;
321: R2:=21;
322: R2:=21;
323: R2:=21;
324: R2:=21;
325: R2:=21;
326: R2:=22;
327: R2:=22;
328: R2:=22;
329: R2:=23;
330: R2:=23;
331: R2:=23;
332: R2:=23;
344: R2:=24;
345: R2:=25;
346: R2:=25;
347: R2:=25;
355: R2:=25;
356: R2:=25;
357: R2:=25;
348: R2:=25;
349: R2:=25;
350: R2:=25;
351: R2:=25;
352: R2:=25;
353: R2:=25;
358: R2:=25;
354: R2:=25;
359: R2:=26;
360: R2:=26;
361: R2:=26;
363: R2:=27;
364: R2:=27;
365: R2:=27;
362: R2:=27;
366: R2:=27;
367: R2:=27;
368: R2:=27;
369: R2:=28;
370: R2:=28;
371: R2:=28;
373: R2:=28;
372: R2:=28;
374: R2:=28;
375: R2:=28;
376: R2:=28;
393: R2:=29;
394: R2:=29;
395: R2:=29;
396: R2:=29;
397: R2:=29;
398: R2:=29;
399: R2:=29;
400: R2:=29;
401: R2:=29;
402: R2:=29;
403: R2:=29;
404: R2:=29;
405: R2:=30;
406: R2:=30;
407: R2:=30;
408: R2:=30;
409: R2:=30;
410: R2:=30;
411: R2:=30;
412: R2:=31;
413: R2:=31;
414: R2:=31;
415: R2:=31;
416: R2:=31;
417: R2:=31;
418: R2:=31;
454: R2:=32;
452: R2:=32;
451: R2:=32;
455: R2:=32;
453: R2:=32;
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
LDMRULES_makeparamlist(p);
p^.paramname:='NUMBERPAR';
p^.length:=9;
p^.next:=paramlist;
paramlist:=p;
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
LDMRULES_makeparamlist(p);
p^.paramname:='NUMBERPAR';
p^.length:=9;
p^.next:=paramlist;
paramlist:=p;
  END;
42: BEGIN

  END;
43: BEGIN

  END;
44: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
45: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
46: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
47: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
48: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
49: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
50: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
51: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
52: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
53: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
54: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
55: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
56: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
57: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
58: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
59: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
60: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
61: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
62: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
63: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
64: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
65: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
66: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
67: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
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
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
73: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
74: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;LDMRULES_makeparamlist(p);
p^.paramname:='ANTECEDENT';
p^.length:=10;
p^.next:=paramlist;
paramlist:=p;LDMRULES_makeparamlist(p);
p^.paramname:='MULTITUDEPAR';
p^.length:=12;
p^.next:=paramlist;
paramlist:=p;
  END;
75: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
76: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
77: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
78: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
79: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
80: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
81: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
82: BEGIN

  END;
83: BEGIN

  END;
84: BEGIN

  END;
85: BEGIN

  END;
86: BEGIN

  END;
87: BEGIN

  END;
88: BEGIN

  END;
89: BEGIN

  END;
90: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
91: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
92: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
93: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
94: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
95: BEGIN

  END;
96: BEGIN

  END;
97: BEGIN

  END;
98: BEGIN

  END;
99: BEGIN

  END;
100: BEGIN

  END;
101: BEGIN

  END;
102: BEGIN

  END;
103: BEGIN

  END;
104: BEGIN

  END;
105: BEGIN

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
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
128: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
129: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
130: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
131: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
132: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
133: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
134: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
135: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
136: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
137: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
138: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
139: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
140: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
141: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
142: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
143: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
144: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
145: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
146: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='VOICEPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;
  END;
147: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='VOICEPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;
  END;
148: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='VOICEPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;
  END;
149: BEGIN

  END;
150: BEGIN

  END;
151: BEGIN

  END;
152: BEGIN

  END;
153: BEGIN

  END;
154: BEGIN

  END;
155: BEGIN

  END;
156: BEGIN

  END;
157: BEGIN

  END;
158: BEGIN

  END;
159: BEGIN

  END;
160: BEGIN

  END;
161: BEGIN

  END;
162: BEGIN

  END;
163: BEGIN

  END;
164: BEGIN

  END;
165: BEGIN

  END;
166: BEGIN

  END;
167: BEGIN

  END;
168: BEGIN

  END;
169: BEGIN

  END;
170: BEGIN

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
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
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
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
193: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
194: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='SUPER';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
195: BEGIN

  END;
196: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
197: BEGIN

  END;
198: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
199: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
200: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
201: BEGIN

  END;
202: BEGIN

  END;
203: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='SUPERPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;
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
LDMRULES_makeparamlist(p);
p^.paramname:='SUPER';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
216: BEGIN

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

  END;
225: BEGIN

  END;
226: BEGIN

  END;
227: BEGIN

  END;
228: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='SUPER';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
229: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
230: BEGIN

  END;
231: BEGIN

  END;
232: BEGIN

  END;
233: BEGIN

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
LDMRULES_makeparamlist(p);
p^.paramname:='NUMBERPAR';
p^.length:=9;
p^.next:=paramlist;
paramlist:=p;
  END;
252: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='NUMBERPAR';
p^.length:=9;
p^.next:=paramlist;
paramlist:=p;
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

  END;
260: BEGIN

  END;
261: BEGIN

  END;
262: BEGIN

  END;
263: BEGIN

  END;
264: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
265: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
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
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
271: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
272: BEGIN

  END;
273: BEGIN

  END;
274: BEGIN

  END;
275: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
276: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
277: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
278: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
279: BEGIN

  END;
280: BEGIN

  END;
281: BEGIN

  END;
282: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
283: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
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

  END;
291: BEGIN

  END;
292: BEGIN

  END;
293: BEGIN

  END;
294: BEGIN

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

  END;
300: BEGIN

  END;
301: BEGIN

  END;
302: BEGIN

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
LDMRULES_makeparamlist(p);
p^.paramname:='SUPER';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
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

  END;
327: BEGIN

  END;
328: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='SUPER';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
329: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
330: BEGIN

  END;
331: BEGIN

  END;
332: BEGIN

  END;
333: BEGIN

  END;
334: BEGIN

  END;
335: BEGIN

  END;
336: BEGIN

  END;
337: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='INDEXPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;LDMRULES_makeparamlist(p);
p^.paramname:='XPMOODPAR';
p^.length:=9;
p^.next:=paramlist;
paramlist:=p;
  END;
338: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='INDEXPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;LDMRULES_makeparamlist(p);
p^.paramname:='XPMOODPAR';
p^.length:=9;
p^.next:=paramlist;
paramlist:=p;
  END;
339: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='INDEXPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;LDMRULES_makeparamlist(p);
p^.paramname:='XPMOODPAR';
p^.length:=9;
p^.next:=paramlist;
paramlist:=p;
  END;
340: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='INDEXPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;LDMRULES_makeparamlist(p);
p^.paramname:='XPMOODPAR';
p^.length:=9;
p^.next:=paramlist;
paramlist:=p;
  END;
341: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='INDEXPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;LDMRULES_makeparamlist(p);
p^.paramname:='XPMOODPAR';
p^.length:=9;
p^.next:=paramlist;
paramlist:=p;
  END;
342: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='INDEXPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;LDMRULES_makeparamlist(p);
p^.paramname:='XPMOODPAR';
p^.length:=9;
p^.next:=paramlist;
paramlist:=p;
  END;
343: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='INDEXPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;LDMRULES_makeparamlist(p);
p^.paramname:='XPMOODPAR';
p^.length:=9;
p^.next:=paramlist;
paramlist:=p;
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

  END;
351: BEGIN

  END;
352: BEGIN

  END;
353: BEGIN

  END;
354: BEGIN

  END;
355: BEGIN

  END;
356: BEGIN

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
LDMRULES_makeparamlist(p);
p^.paramname:='SUPERPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;
  END;
362: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
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

  END;
367: BEGIN

  END;
368: BEGIN

  END;
369: BEGIN

  END;
370: BEGIN

  END;
371: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='SUPER';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
372: BEGIN

  END;
373: BEGIN

  END;
374: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
375: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
376: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
377: BEGIN

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

  END;
384: BEGIN

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
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
390: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
391: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
392: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
393: BEGIN

  END;
394: BEGIN

  END;
395: BEGIN

  END;
396: BEGIN

  END;
397: BEGIN

  END;
398: BEGIN

  END;
399: BEGIN

  END;
400: BEGIN

  END;
401: BEGIN

  END;
402: BEGIN

  END;
403: BEGIN

  END;
404: BEGIN

  END;
405: BEGIN

  END;
406: BEGIN

  END;
407: BEGIN

  END;
408: BEGIN

  END;
409: BEGIN

  END;
410: BEGIN

  END;
411: BEGIN

  END;
412: BEGIN

  END;
413: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='CASESPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;
  END;
414: BEGIN

  END;
415: BEGIN

  END;
416: BEGIN

  END;
417: BEGIN

  END;
418: BEGIN

  END;
419: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='ADJUNCTPAR';
p^.length:=10;
p^.next:=paramlist;
paramlist:=p;
  END;
420: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='ADJUNCTPAR';
p^.length:=10;
p^.next:=paramlist;
paramlist:=p;
  END;
421: BEGIN

  END;
422: BEGIN

  END;
423: BEGIN

  END;
424: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='VPID';
p^.length:=4;
p^.next:=paramlist;
paramlist:=p;
  END;
425: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='VPID';
p^.length:=4;
p^.next:=paramlist;
paramlist:=p;
  END;
426: BEGIN

  END;
427: BEGIN

  END;
428: BEGIN

  END;
429: BEGIN

  END;
430: BEGIN

  END;
431: BEGIN

  END;
432: BEGIN

  END;
433: BEGIN

  END;
434: BEGIN

  END;
435: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
436: BEGIN

  END;
437: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
438: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
439: BEGIN

  END;
440: BEGIN

  END;
441: BEGIN

  END;
442: BEGIN

  END;
443: BEGIN

  END;
444: BEGIN

  END;
445: BEGIN

  END;
446: BEGIN

  END;
447: BEGIN

  END;
448: BEGIN

  END;
449: BEGIN

  END;
450: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='CONTROLLERPAR';
p^.length:=13;
p^.next:=paramlist;
paramlist:=p;
  END;
451: BEGIN

  END;
452: BEGIN

  END;
453: BEGIN

  END;
454: BEGIN

  END;
455: BEGIN

  END;
END{CASE};
params:=paramlist;
END;
