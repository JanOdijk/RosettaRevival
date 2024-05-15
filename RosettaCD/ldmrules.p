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
val3X1:LSDOMAINT_casetype;
val6X1:LSDOMAINT_casetype;
val9X1:LSDOMAINT_casetype;
val10X1:LSDOMAINT_casetype;
val11X1:LSDOMAINT_casetype;
val12X1:LSDOMAINT_casetype;
val13X1:LSDOMAINT_casetype;
val14X1:LSDOMAINT_casetype;
val15X1:LSDOMAINT_casetype;
val16X1:LSDOMAINT_casetype;
val17X1:LSDOMAINT_casetype;
val18X1:LSDOMAINT_casetype;
val19X1:LSDOMAINT_casetype;
val20X1:LSDOMAINT_casetype;
val21X1:LSDOMAINT_casetype;
val34X1:LSDOMAINT_casetype;
val35X1:LSDOMAINT_casetype;
val36X1:LSDOMAINT_casetype;
val37X1:LSDOMAINT_casetype;
val38X1:LSDOMAINT_casetype;
val39X1:LSDOMAINT_casetype;
val40X1:LSDOMAINT_casetype;
val41X1:LSDOMAINT_casetype;
val42X1:LSDOMAINT_casetype;
val43X1:LSDOMAINT_casetype;
val44X1:LSDOMAINT_casetype;
val52X1:LSDOMAINT_casetype;
val53X1:LSDOMAINT_casetype;
val54X1:LSDOMAINT_casetype;
val55X1:LSDOMAINT_casetype;
val56X1:LSDOMAINT_casetype;
val57X1:LSDOMAINT_casetype;
val58X1:LSDOMAINT_casetype;
val59X1:LSDOMAINT_casetype;
val60X1:LSDOMAINT_casetype;
val61X1:LSDOMAINT_casetype;
val62X1:LSDOMAINT_casetype;
val63X1:LSDOMAINT_casetype;
val64X1:LSDOMAINT_casetype;
val65X1:LSDOMAINT_casetype;
val94X1:LSDOMAINT_casetype;
val95X1:LSDOMAINT_casetype;
val96X1:LSDOMAINT_casetype;
val97X1:LSDOMAINT_casetype;
val98X1:LSDOMAINT_casetype;
val100X1:LSDOMAINT_casetype;
val101X1:LSDOMAINT_casetype;
val102X1:LSDOMAINT_casetype;
val103X1:LSDOMAINT_casetype;
val437X1:LSDOMAINT_synpatterntype;
val438X1:LSDOMAINT_synpatterntype;
val452X1:LSDOMAINT_synpatterntype;
val454X1:LSDOMAINT_synpatterntype;
val455X1:LSDOMAINT_synpatterntype;
val456X1:LSDOMAINT_synpatterntype;
val457X1:LSDOMAINT_synpatterntype;
val475X1:LSDOMAINT_synpatterntype;
val477X1:LSDOMAINT_synpatterntype;
val477X2:LSDOMAINT_synpatterntype;
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
 p^.fieldname.str:='CASESPAR' ; p^.fieldname.len:=8;
p^.typeindicator:=enumset;
FOR val3X1 := nominative TO Rcase DO
  BEGIN
  IF val3X1 IN lsps^.X3CASESPAR THEN
    BEGIN
    new(q);
    q^.nextvalue:=p^.setvalue;
    p^.setvalue:=q;
    LSTYPETOSTR_casetype(p^.setvalue^.eltvalue.str,p^.setvalue^.eltvalue.len,val3X1);
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
10
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
11
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
12
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
13
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
14
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
15
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
16
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
17
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
18
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
19
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
20
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
21
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
35
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
36
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
37
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
38
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
39
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
40
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
41
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
42
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
43
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
96
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
 p^.fieldname.str:='SUPER' ; p^.fieldname.len:=5;
  LSTYPETOSTR_DEIXISTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X112SUPER);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='SUPER' ; p^.fieldname.len:=5;
  LSTYPETOSTR_DEIXISTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X122SUPER);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='NUMBERPAR' ; p^.fieldname.len:=9;
  LSTYPETOSTR_NUMBERTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X145NUMBERPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
174
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
 p^.fieldname.str:='VOICEPAR' ; p^.fieldname.len:=8;
  LSTYPETOSTR_VOICETYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X221VOICEPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='VOICEPAR' ; p^.fieldname.len:=8;
  LSTYPETOSTR_VOICETYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X222VOICEPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
247
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
256
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
257
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
258
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
267
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
268
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
269
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
303
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
 p^.fieldname.str:='SUPER' ; p^.fieldname.len:=5;
  LSTYPETOSTR_DEIXISTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X319SUPER);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
323
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
324
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
325
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
328
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
 p^.fieldname.str:='GELIEVEPAR' ; p^.fieldname.len:=10;
  LSTYPETOSTR_GELIEVETYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X347GELIEVEPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='ADJUNCTPAR' ; p^.fieldname.len:=10;
  LSTYPETOSTR_ADJUNCTTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X348ADJUNCTPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='ADJUNCTPAR' ; p^.fieldname.len:=10;
  LSTYPETOSTR_ADJUNCTTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X349ADJUNCTPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
358
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
359
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
360
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
361
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
362
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='SUPER' ; p^.fieldname.len:=5;
  LSTYPETOSTR_DEIXISTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X362SUPER);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
372
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
373
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
378
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
 p^.fieldname.str:='SUPER' ; p^.fieldname.len:=5;
  LSTYPETOSTR_DEIXISTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X392SUPER);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='SUPER' ; p^.fieldname.len:=5;
  LSTYPETOSTR_DEIXISTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X401SUPER);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='LEVEL' ; p^.fieldname.len:=5;
STR_integertostr(parameters.index,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='ANTECEDENT' ; p^.fieldname.len:=10;
  STR_integertostr(lsps^.X412ANTECEDENT,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='RELPAR' ; p^.fieldname.len:=6;
  STR_integertostr(ORD(lsps^.X421RELPAR),p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='RELPAR' ; p^.fieldname.len:=6;
  STR_integertostr(ORD(lsps^.X422RELPAR),p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='INDEXPAR' ; p^.fieldname.len:=8;
  STR_integertostr(lsps^.X423INDEXPAR,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='XPMOODPAR' ; p^.fieldname.len:=9;
  LSTYPETOSTR_XPMOODTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X423XPMOODPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='INDEXPAR' ; p^.fieldname.len:=8;
  STR_integertostr(lsps^.X424INDEXPAR,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='XPMOODPAR' ; p^.fieldname.len:=9;
  LSTYPETOSTR_XPMOODTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X424XPMOODPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='INDEXPAR' ; p^.fieldname.len:=8;
  STR_integertostr(lsps^.X425INDEXPAR,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='XPMOODPAR' ; p^.fieldname.len:=9;
  LSTYPETOSTR_XPMOODTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X425XPMOODPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='INDEXPAR' ; p^.fieldname.len:=8;
  STR_integertostr(lsps^.X426INDEXPAR,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='XPMOODPAR' ; p^.fieldname.len:=9;
  LSTYPETOSTR_XPMOODTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X426XPMOODPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
 p^.fieldname.str:='VPID' ; p^.fieldname.len:=4;
p^.typeindicator:=enumset;
FOR val437X1 := synnoVPargs TO vpid200 DO
  BEGIN
  IF val437X1 IN lsps^.X437VPID THEN
    BEGIN
    new(q);
    q^.nextvalue:=p^.setvalue;
    p^.setvalue:=q;
    LSTYPETOSTR_synpatterntype(p^.setvalue^.eltvalue.str,p^.setvalue^.eltvalue.len,val437X1);
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
438
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='VPID' ; p^.fieldname.len:=4;
p^.typeindicator:=enumset;
FOR val438X1 := synnoVPargs TO vpid200 DO
  BEGIN
  IF val438X1 IN lsps^.X438VPID THEN
    BEGIN
    new(q);
    q^.nextvalue:=p^.setvalue;
    p^.setvalue:=q;
    LSTYPETOSTR_synpatterntype(p^.setvalue^.eltvalue.str,p^.setvalue^.eltvalue.len,val438X1);
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
455
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
456
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
457
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
458
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
459
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
460
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
461
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
462
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
463
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
464
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
465
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
466
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
467
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
468
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
469
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='CONTROLLERPAR' ; p^.fieldname.len:=13;
  STR_integertostr(lsps^.X469CONTROLLERPAR,p^.fieldvalue.str,p^.fieldvalue.len);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
470
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
471
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
472
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
473
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
474
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
475
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='VPID' ; p^.fieldname.len:=4;
p^.typeindicator:=enumset;
FOR val475X1 := synnoVPargs TO vpid200 DO
  BEGIN
  IF val475X1 IN lsps^.X475VPID THEN
    BEGIN
    new(q);
    q^.nextvalue:=p^.setvalue;
    p^.setvalue:=q;
    LSTYPETOSTR_synpatterntype(p^.setvalue^.eltvalue.str,p^.setvalue^.eltvalue.len,val475X1);
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
476
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
477
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='VPID' ; p^.fieldname.len:=4;
p^.typeindicator:=enumset;
FOR val477X1 := synnoVPargs TO vpid200 DO
  BEGIN
  IF val477X1 IN lsps^.X477VPID THEN
    BEGIN
    new(q);
    q^.nextvalue:=p^.setvalue;
    p^.setvalue:=q;
    LSTYPETOSTR_synpatterntype(p^.setvalue^.eltvalue.str,p^.setvalue^.eltvalue.len,val477X1);
    END;
  END;
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
478
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
479
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
480
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
481
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
482
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
483
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='SUPERPAR' ; p^.fieldname.len:=8;
  LSTYPETOSTR_DEIXISTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X483SUPERPAR);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
484
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
485
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
486
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
487
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
488
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
489
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
490
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
491
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
492
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
493
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
494
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
495
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
496
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
497
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
498
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
499
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
500
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
501
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
502
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
503
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
504
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
505
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
506
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
507
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
508
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
509
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
510
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
511
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
512
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
513
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
514
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
515
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='RULE';
 p^.fieldname.len:=4;
LDMRULES_rulename(1,lsps^.rulenr
,p^.fieldvalue.str,convlen);
p^.fieldvalue.len:=convlen;
 END;
516
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
517
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
518
:BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
 attrstruct:=p;
 p^.setvalue:=NIL;
 p^.typeindicator:=enumeration;
 p^.fieldname.str:='SUPER' ; p^.fieldname.len:=5;
  LSTYPETOSTR_DEIXISTYPE(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.X518SUPER);
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));
 p^.nextattr:=attrstruct;
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
IF STR_compare(name,length,'RUTT1',5)=0 THEN
  R:=2;
IF STR_compare(name,length,'RUTTNP',6)=0 THEN
  R:=3;
IF STR_compare(name,length,'RUTTADVP',8)=0 THEN
  R:=4;
IF STR_compare(name,length,'RUTTPREPP',9)=0 THEN
  R:=5;
IF STR_compare(name,length,'RUTTADVPPROP',12)=0 THEN
  R:=6;
IF STR_compare(name,length,'RUTTEXCLAM',10)=0 THEN
  R:=7;
IF STR_compare(name,length,'RADDEXCLAM',10)=0 THEN
  R:=8;
IF STR_compare(name,length,'RIDSUBSTITUTION2',16)=0 THEN
  R:=9;
IF STR_compare(name,length,'RSUBSTITUTION1',14)=0 THEN
  R:=10;
IF STR_compare(name,length,'RSUBSTITUTION2',14)=0 THEN
  R:=11;
IF STR_compare(name,length,'RSUBSTITUTION3',14)=0 THEN
  R:=12;
IF STR_compare(name,length,'RSUBSTITUTION3A',15)=0 THEN
  R:=13;
IF STR_compare(name,length,'RSUBSTITUTION4',14)=0 THEN
  R:=14;
IF STR_compare(name,length,'RSUBSTITUTION4A',15)=0 THEN
  R:=15;
IF STR_compare(name,length,'RSUBSTITUTION4B',15)=0 THEN
  R:=16;
IF STR_compare(name,length,'RSUBSTITUTION5',14)=0 THEN
  R:=17;
IF STR_compare(name,length,'RSUBSTITUTION6',14)=0 THEN
  R:=18;
IF STR_compare(name,length,'RSUBSTITUTION8',14)=0 THEN
  R:=19;
IF STR_compare(name,length,'RSUBSTITUTION9',14)=0 THEN
  R:=20;
IF STR_compare(name,length,'RSUBSTITUTION10',15)=0 THEN
  R:=21;
IF STR_compare(name,length,'RSUBSTITUTION11',15)=0 THEN
  R:=22;
IF STR_compare(name,length,'RSUBSTITUTION12',15)=0 THEN
  R:=23;
IF STR_compare(name,length,'RSUBSTITUTION13',15)=0 THEN
  R:=24;
IF STR_compare(name,length,'RSUBSTITUTION14',15)=0 THEN
  R:=25;
IF STR_compare(name,length,'RMOODDETERMINATION1',19)=0 THEN
  R:=26;
IF STR_compare(name,length,'RMOOD2',6)=0 THEN
  R:=27;
IF STR_compare(name,length,'RMOOD3',6)=0 THEN
  R:=28;
IF STR_compare(name,length,'RMOOD4',6)=0 THEN
  R:=29;
IF STR_compare(name,length,'RMOOD5',6)=0 THEN
  R:=30;
IF STR_compare(name,length,'RMOOD6',6)=0 THEN
  R:=31;
IF STR_compare(name,length,'RMOODINFREL',11)=0 THEN
  R:=32;
IF STR_compare(name,length,'RWILINSERTION',13)=0 THEN
  R:=33;
IF STR_compare(name,length,'REMPTYSUBSTITUTION1',19)=0 THEN
  R:=34;
IF STR_compare(name,length,'REMPTYSUBSTITUTION2',19)=0 THEN
  R:=35;
IF STR_compare(name,length,'REMPTYSUBSTITUTION3',19)=0 THEN
  R:=36;
IF STR_compare(name,length,'REMPTYSUBSTITUTION4',19)=0 THEN
  R:=37;
IF STR_compare(name,length,'REMPTYSUBSTITUTION5',19)=0 THEN
  R:=38;
IF STR_compare(name,length,'RPREPEMPTYSUBST1',16)=0 THEN
  R:=39;
IF STR_compare(name,length,'RPREPEMPTYSUBST2',16)=0 THEN
  R:=40;
IF STR_compare(name,length,'RDIREMPTYSUBST1',15)=0 THEN
  R:=41;
IF STR_compare(name,length,'RZEEMPTYSUBST',13)=0 THEN
  R:=42;
IF STR_compare(name,length,'RIDEMPTYSUBSTITUTION1',21)=0 THEN
  R:=43;
IF STR_compare(name,length,'RSADJEMPTYSUBST',15)=0 THEN
  R:=44;
IF STR_compare(name,length,'RCLAUSEFORMATION1',17)=0 THEN
  R:=45;
IF STR_compare(name,length,'RCLAUSEFORMATION2',17)=0 THEN
  R:=46;
IF STR_compare(name,length,'RCLAUSEFORMATION3',17)=0 THEN
  R:=47;
IF STR_compare(name,length,'RCLAUSEFORMATION4',17)=0 THEN
  R:=48;
IF STR_compare(name,length,'RCLAUSEFORMATION5',17)=0 THEN
  R:=49;
IF STR_compare(name,length,'RCLAUSEFORMATION6',17)=0 THEN
  R:=50;
IF STR_compare(name,length,'RCLAUSEFORMATION7',17)=0 THEN
  R:=51;
IF STR_compare(name,length,'ROPENADJPPROPSUBSTITUTION',25)=0 THEN
  R:=52;
IF STR_compare(name,length,'RCLOSEDADJPPROPSUBSTITUTION',27)=0 THEN
  R:=53;
IF STR_compare(name,length,'ROPENNPPROPSUBSTITUTION',23)=0 THEN
  R:=54;
IF STR_compare(name,length,'RCLOSEDNPPROPSUBSTITUTION',25)=0 THEN
  R:=55;
IF STR_compare(name,length,'RLOCOPENPREPPROPSUBSTITUTION',28)=0 THEN
  R:=56;
IF STR_compare(name,length,'RLCPPPSUBST',11)=0 THEN
  R:=57;
IF STR_compare(name,length,'RDIROPENPREPPROPSUBSTITUTION',28)=0 THEN
  R:=58;
IF STR_compare(name,length,'RDIRCLOSEDPREPPPROP',19)=0 THEN
  R:=59;
IF STR_compare(name,length,'ROOPPPSUBST',11)=0 THEN
  R:=60;
IF STR_compare(name,length,'ROCPPPSUBST',11)=0 THEN
  R:=61;
IF STR_compare(name,length,'RPROPSUBST13',12)=0 THEN
  R:=62;
IF STR_compare(name,length,'RCADVPPSUBST',12)=0 THEN
  R:=63;
IF STR_compare(name,length,'ROADVPPSUBST',12)=0 THEN
  R:=64;
IF STR_compare(name,length,'RCVPPSUBST',10)=0 THEN
  R:=65;
IF STR_compare(name,length,'RSIDSTARTVPPROP120',18)=0 THEN
  R:=66;
IF STR_compare(name,length,'RSIDSTARTVPPROP123',18)=0 THEN
  R:=67;
IF STR_compare(name,length,'RSTARTVPPROP000',15)=0 THEN
  R:=68;
IF STR_compare(name,length,'RSTARTVPPROP100',15)=0 THEN
  R:=69;
IF STR_compare(name,length,'RSTARTVPPROP010A',16)=0 THEN
  R:=70;
IF STR_compare(name,length,'RSTARTVERBPPROP010B',19)=0 THEN
  R:=71;
IF STR_compare(name,length,'RSTARTVPPROP120',15)=0 THEN
  R:=72;
IF STR_compare(name,length,'RSTARTVPPROP012',15)=0 THEN
  R:=73;
IF STR_compare(name,length,'RSTARTVPPROP123',15)=0 THEN
  R:=74;
IF STR_compare(name,length,'RADJVOOROBJMOD',14)=0 THEN
  R:=75;
IF STR_compare(name,length,'RADJMOD1',8)=0 THEN
  R:=76;
IF STR_compare(name,length,'RADJOMTEMOD1',12)=0 THEN
  R:=77;
IF STR_compare(name,length,'RADJDEGREEMOD1',14)=0 THEN
  R:=78;
IF STR_compare(name,length,'RADJDEGREEMOD2A',15)=0 THEN
  R:=79;
IF STR_compare(name,length,'RADJDEGREEMOD2B',15)=0 THEN
  R:=80;
IF STR_compare(name,length,'RBADJTOSUB1',11)=0 THEN
  R:=81;
IF STR_compare(name,length,'RORDDERIV',9)=0 THEN
  R:=82;
IF STR_compare(name,length,'RSTARTADJPPROPFORMATION000',26)=0 THEN
  R:=83;
IF STR_compare(name,length,'RSTARTADJPPROP100',17)=0 THEN
  R:=84;
IF STR_compare(name,length,'RSTARTADJPPROP120',17)=0 THEN
  R:=85;
IF STR_compare(name,length,'RSTARTADJPPROP123',17)=0 THEN
  R:=86;
IF STR_compare(name,length,'RSTARTADJPPROP012',17)=0 THEN
  R:=87;
IF STR_compare(name,length,'RADJLOCADVPVAR',14)=0 THEN
  R:=88;
IF STR_compare(name,length,'RADJLOCPREPPVAR',15)=0 THEN
  R:=89;
IF STR_compare(name,length,'RADJCAUSADVPVAR',15)=0 THEN
  R:=90;
IF STR_compare(name,length,'RADJCAUSPREPPVAR',16)=0 THEN
  R:=91;
IF STR_compare(name,length,'RADJACTIVEVOICE',15)=0 THEN
  R:=92;
IF STR_compare(name,length,'RADJVOICEDEFAULT',16)=0 THEN
  R:=93;
IF STR_compare(name,length,'RADJSENTENCESUBSTITUTION1',25)=0 THEN
  R:=94;
IF STR_compare(name,length,'RADJSENTENCESUBSTITUTION2',25)=0 THEN
  R:=95;
IF STR_compare(name,length,'RADJSENTENCESUBSTITUTION3',25)=0 THEN
  R:=96;
IF STR_compare(name,length,'RADJSENTENCEOMTECOMPL',21)=0 THEN
  R:=97;
IF STR_compare(name,length,'RADJSENTENCEOMTESUBJ',20)=0 THEN
  R:=98;
IF STR_compare(name,length,'RADJPFORMULAFORMATION1',22)=0 THEN
  R:=99;
IF STR_compare(name,length,'RADJEMPTYSUBST1',15)=0 THEN
  R:=100;
IF STR_compare(name,length,'RADJEMPTYSUBST2',15)=0 THEN
  R:=101;
IF STR_compare(name,length,'RADJEMPTYSUBST3',15)=0 THEN
  R:=102;
IF STR_compare(name,length,'RADJEMPTYSUBST4',15)=0 THEN
  R:=103;
IF STR_compare(name,length,'DETDERIVATION1',14)=0 THEN
  R:=104;
IF STR_compare(name,length,'DETPFORMATION1',14)=0 THEN
  R:=105;
IF STR_compare(name,length,'DETPFORMATION2',14)=0 THEN
  R:=106;
IF STR_compare(name,length,'RCARDTODETP',11)=0 THEN
  R:=107;
IF STR_compare(name,length,'DETPFORMATION3',14)=0 THEN
  R:=108;
IF STR_compare(name,length,'DETPFORMATION3A',15)=0 THEN
  R:=109;
IF STR_compare(name,length,'DETPFORMATION4',14)=0 THEN
  R:=110;
IF STR_compare(name,length,'RDETPPARTITIVEFORMATION',23)=0 THEN
  R:=111;
IF STR_compare(name,length,'RDETPSUPERDEIXIS',16)=0 THEN
  R:=112;
IF STR_compare(name,length,'RADVPAMOUNTMOD',14)=0 THEN
  R:=113;
IF STR_compare(name,length,'RADVPOMCOMPLMOD',15)=0 THEN
  R:=114;
IF STR_compare(name,length,'RQTOQP1',7)=0 THEN
  R:=115;
IF STR_compare(name,length,'RQTOQP2',7)=0 THEN
  R:=116;
IF STR_compare(name,length,'RQPCOMPARATIVECOMPLMOD',22)=0 THEN
  R:=117;
IF STR_compare(name,length,'RQPSUPERLATIVECOMPLMOD',22)=0 THEN
  R:=118;
IF STR_compare(name,length,'RQPAMOUNTMOD',12)=0 THEN
  R:=119;
IF STR_compare(name,length,'RQPOMCOMPLMOD',13)=0 THEN
  R:=120;
IF STR_compare(name,length,'RQPVOOROBJMOD',13)=0 THEN
  R:=121;
IF STR_compare(name,length,'RQPSUPERDEIXIS',14)=0 THEN
  R:=122;
IF STR_compare(name,length,'RQPSUBSTITUTION1',16)=0 THEN
  R:=123;
IF STR_compare(name,length,'RQPSUBSTITUTION2',16)=0 THEN
  R:=124;
IF STR_compare(name,length,'RNPFORMATION1',13)=0 THEN
  R:=125;
IF STR_compare(name,length,'RNPFORMATION2',13)=0 THEN
  R:=126;
IF STR_compare(name,length,'RNPFORMATION3',13)=0 THEN
  R:=127;
IF STR_compare(name,length,'RNPFORMATION3A',14)=0 THEN
  R:=128;
IF STR_compare(name,length,'RNPFORMATION4',13)=0 THEN
  R:=129;
IF STR_compare(name,length,'RNPFORMATION4A',14)=0 THEN
  R:=130;
IF STR_compare(name,length,'RNPFORMATION5',13)=0 THEN
  R:=131;
IF STR_compare(name,length,'RNPFORMATION10',14)=0 THEN
  R:=132;
IF STR_compare(name,length,'RNPFORMATION12',14)=0 THEN
  R:=133;
IF STR_compare(name,length,'RNPPRESENTSUPERDEIXIS1',22)=0 THEN
  R:=134;
IF STR_compare(name,length,'RNPPASTSUPERDEIXIS1',19)=0 THEN
  R:=135;
IF STR_compare(name,length,'RNPPRESENTSUPERDEIXIS2',22)=0 THEN
  R:=136;
IF STR_compare(name,length,'RNPPASTSUPERDEIXIS2',19)=0 THEN
  R:=137;
IF STR_compare(name,length,'RNPINDEFMODPOSS',15)=0 THEN
  R:=138;
IF STR_compare(name,length,'RNPWHMODPOSS',12)=0 THEN
  R:=139;
IF STR_compare(name,length,'RNPPROPERNOUNMODPOSS',20)=0 THEN
  R:=140;
IF STR_compare(name,length,'RNPMODADVP',10)=0 THEN
  R:=141;
IF STR_compare(name,length,'RNPAPPOSITION',13)=0 THEN
  R:=142;
IF STR_compare(name,length,'BNOUNTOSUBNOUN',14)=0 THEN
  R:=143;
IF STR_compare(name,length,'RSUBNOUNTONOUN1',15)=0 THEN
  R:=144;
IF STR_compare(name,length,'RSUBNOUNTONOUN2',15)=0 THEN
  R:=145;
IF STR_compare(name,length,'RBPROPERNOUNTOPROPERNOUN',24)=0 THEN
  R:=146;
IF STR_compare(name,length,'RBPROPERNOUNTOSUBNOUN',21)=0 THEN
  R:=147;
IF STR_compare(name,length,'RBINDEFPROTOINDEFPRO',20)=0 THEN
  R:=148;
IF STR_compare(name,length,'RBWHPROTOWHPRO',14)=0 THEN
  R:=149;
IF STR_compare(name,length,'RBPERSPROTOPERSPRO',18)=0 THEN
  R:=150;
IF STR_compare(name,length,'RCNFORMATION1',13)=0 THEN
  R:=151;
IF STR_compare(name,length,'RCNFORMATION2',13)=0 THEN
  R:=152;
IF STR_compare(name,length,'RCNFORMATION3',13)=0 THEN
  R:=153;
IF STR_compare(name,length,'RCNFORMATION4',13)=0 THEN
  R:=154;
IF STR_compare(name,length,'RCNPRESENTSUPERDEIXIS',21)=0 THEN
  R:=155;
IF STR_compare(name,length,'RCNPASTSUPERDEIXIS',18)=0 THEN
  R:=156;
IF STR_compare(name,length,'RCNMODADJP',10)=0 THEN
  R:=157;
IF STR_compare(name,length,'RCNMODNUM',9)=0 THEN
  R:=158;
IF STR_compare(name,length,'RCNMODPOSS1',11)=0 THEN
  R:=159;
IF STR_compare(name,length,'RCNMODPOSS2',11)=0 THEN
  R:=160;
IF STR_compare(name,length,'RCNMODPOSS3',11)=0 THEN
  R:=161;
IF STR_compare(name,length,'RCNMODPP',8)=0 THEN
  R:=162;
IF STR_compare(name,length,'RCNMODBARENP',12)=0 THEN
  R:=163;
IF STR_compare(name,length,'RCNMODANTEREL1',14)=0 THEN
  R:=164;
IF STR_compare(name,length,'RCNSPECPROPERNAME',17)=0 THEN
  R:=165;
IF STR_compare(name,length,'RADJSUBSTITUTION1',17)=0 THEN
  R:=166;
IF STR_compare(name,length,'RADJSUBSTITUTION2',17)=0 THEN
  R:=167;
IF STR_compare(name,length,'RADJSUBSTITUTION3',17)=0 THEN
  R:=168;
IF STR_compare(name,length,'RADJSUBSTITUTION4',17)=0 THEN
  R:=169;
IF STR_compare(name,length,'RADJMOOD1',9)=0 THEN
  R:=170;
IF STR_compare(name,length,'RADJMOOD2',9)=0 THEN
  R:=171;
IF STR_compare(name,length,'RADJPUNC',8)=0 THEN
  R:=172;
IF STR_compare(name,length,'RHELPEMPTYSUBJSUBST',19)=0 THEN
  R:=173;
IF STR_compare(name,length,'RADJEMPTYSUBJSUBST',18)=0 THEN
  R:=174;
IF STR_compare(name,length,'RLOCADVVAR',10)=0 THEN
  R:=175;
IF STR_compare(name,length,'RLOCPREPPVAR',12)=0 THEN
  R:=176;
IF STR_compare(name,length,'RSADVVAR',8)=0 THEN
  R:=177;
IF STR_compare(name,length,'RSPREPPVAR',10)=0 THEN
  R:=178;
IF STR_compare(name,length,'RVPPREPPVAR',11)=0 THEN
  R:=179;
IF STR_compare(name,length,'CONJSVAR',8)=0 THEN
  R:=180;
IF STR_compare(name,length,'RCONJSVAR2',10)=0 THEN
  R:=181;
IF STR_compare(name,length,'RCONJSVAR3',10)=0 THEN
  R:=182;
IF STR_compare(name,length,'RIDENTLOCADVVAR',15)=0 THEN
  R:=183;
IF STR_compare(name,length,'REXISTLOCADVVAR',15)=0 THEN
  R:=184;
IF STR_compare(name,length,'RPPPLOCADVVAR',13)=0 THEN
  R:=185;
IF STR_compare(name,length,'RIDENTLOCPREPPVAR',17)=0 THEN
  R:=186;
IF STR_compare(name,length,'REXISTLOCPREPPVAR',17)=0 THEN
  R:=187;
IF STR_compare(name,length,'RPPPLOCPREPPVAR',15)=0 THEN
  R:=188;
IF STR_compare(name,length,'RNPPLOCADVVAR',13)=0 THEN
  R:=189;
IF STR_compare(name,length,'RNPPLOCPREPPVAR',15)=0 THEN
  R:=190;
IF STR_compare(name,length,'RADVPPLOCADVVAR',15)=0 THEN
  R:=191;
IF STR_compare(name,length,'RADVPPLOCPREPPVAR',17)=0 THEN
  R:=192;
IF STR_compare(name,length,'RIDENTCONJSVAR',14)=0 THEN
  R:=193;
IF STR_compare(name,length,'RIDENTCONJSVAR2',15)=0 THEN
  R:=194;
IF STR_compare(name,length,'RIDENTCONJSVAR3',15)=0 THEN
  R:=195;
IF STR_compare(name,length,'REXISTCONJSVAR',14)=0 THEN
  R:=196;
IF STR_compare(name,length,'REXISTCONJSVAR2',15)=0 THEN
  R:=197;
IF STR_compare(name,length,'REXISTCONJSVAR3',15)=0 THEN
  R:=198;
IF STR_compare(name,length,'RNPPCONJSVAR',12)=0 THEN
  R:=199;
IF STR_compare(name,length,'RNPPCONJSVAR2',13)=0 THEN
  R:=200;
IF STR_compare(name,length,'RNPPCONJSVAR3',13)=0 THEN
  R:=201;
IF STR_compare(name,length,'RPPPCONJSVAR',12)=0 THEN
  R:=202;
IF STR_compare(name,length,'RPPPCONJSVAR2',13)=0 THEN
  R:=203;
IF STR_compare(name,length,'RPPPCONJSVAR3',13)=0 THEN
  R:=204;
IF STR_compare(name,length,'RADVPPCONJSVAR',14)=0 THEN
  R:=205;
IF STR_compare(name,length,'RADVPPCONJSVAR2',15)=0 THEN
  R:=206;
IF STR_compare(name,length,'RADVPPCONJSVAR3',15)=0 THEN
  R:=207;
IF STR_compare(name,length,'RADJPPCONJSVAR',14)=0 THEN
  R:=208;
IF STR_compare(name,length,'RADJPPCONJSVAR2',15)=0 THEN
  R:=209;
IF STR_compare(name,length,'RADJPPCONJSVAR3',15)=0 THEN
  R:=210;
IF STR_compare(name,length,'REXISTSADVVAR',13)=0 THEN
  R:=211;
IF STR_compare(name,length,'REXISTSPREPPVAR',15)=0 THEN
  R:=212;
IF STR_compare(name,length,'RIDENTSADVVAR',13)=0 THEN
  R:=213;
IF STR_compare(name,length,'RIDENTSPREPPVAR',15)=0 THEN
  R:=214;
IF STR_compare(name,length,'RNPPSADVVAR',11)=0 THEN
  R:=215;
IF STR_compare(name,length,'RNPPSPREPPVAR',13)=0 THEN
  R:=216;
IF STR_compare(name,length,'RADVPPSADVVAR',13)=0 THEN
  R:=217;
IF STR_compare(name,length,'RADVPPSPREPPVAR',15)=0 THEN
  R:=218;
IF STR_compare(name,length,'RPPPSADVVAR',11)=0 THEN
  R:=219;
IF STR_compare(name,length,'RPPPSPREPPVAR',13)=0 THEN
  R:=220;
IF STR_compare(name,length,'RACTIVE',7)=0 THEN
  R:=221;
IF STR_compare(name,length,'RPASSIVE',8)=0 THEN
  R:=222;
IF STR_compare(name,length,'RDOORACTIVE',11)=0 THEN
  R:=223;
IF STR_compare(name,length,'RAANACTIVE',10)=0 THEN
  R:=224;
IF STR_compare(name,length,'RSTARTEXISTENTIAL1',18)=0 THEN
  R:=225;
IF STR_compare(name,length,'REXISTREFVARINSERTION',21)=0 THEN
  R:=226;
IF STR_compare(name,length,'RIDENTFORMATION1',16)=0 THEN
  R:=227;
IF STR_compare(name,length,'RIDENTFORMATION2',16)=0 THEN
  R:=228;
IF STR_compare(name,length,'RIDENTFORMATION3',16)=0 THEN
  R:=229;
IF STR_compare(name,length,'RIDENTFORMATION4',16)=0 THEN
  R:=230;
IF STR_compare(name,length,'RIDENTFORMATION5',16)=0 THEN
  R:=231;
IF STR_compare(name,length,'RIDENTFORMATION6',16)=0 THEN
  R:=232;
IF STR_compare(name,length,'RIDENTREFVARINSERTION',21)=0 THEN
  R:=233;
IF STR_compare(name,length,'RBVERBTOSUB',11)=0 THEN
  R:=234;
IF STR_compare(name,length,'RNNCOMPOUNDS',12)=0 THEN
  R:=235;
IF STR_compare(name,length,'RVNCOMPOUNDS',12)=0 THEN
  R:=236;
IF STR_compare(name,length,'RNOUNDIM',8)=0 THEN
  R:=237;
IF STR_compare(name,length,'RPNDIM',6)=0 THEN
  R:=238;
IF STR_compare(name,length,'RASPECTIMPERFECTIVE',19)=0 THEN
  R:=239;
IF STR_compare(name,length,'RASPECTPERFECTIVE',17)=0 THEN
  R:=240;
IF STR_compare(name,length,'RASPECTHABITUAL',15)=0 THEN
  R:=241;
IF STR_compare(name,length,'RREFVARINSERTION',16)=0 THEN
  R:=242;
IF STR_compare(name,length,'RDURVARINSERTION',16)=0 THEN
  R:=243;
IF STR_compare(name,length,'RRETROVARINSERTION',18)=0 THEN
  R:=244;
IF STR_compare(name,length,'RFREQVARINSERTION',17)=0 THEN
  R:=245;
IF STR_compare(name,length,'RTEMPADVSUBSTITUTION1',21)=0 THEN
  R:=246;
IF STR_compare(name,length,'RTEMPADVSUBSTITUTION2',21)=0 THEN
  R:=247;
IF STR_compare(name,length,'RFINPRESENTDEIXIS',17)=0 THEN
  R:=248;
IF STR_compare(name,length,'RFINPASTDEIXIS',14)=0 THEN
  R:=249;
IF STR_compare(name,length,'RFINPASTDEIXISSPEC',18)=0 THEN
  R:=250;
IF STR_compare(name,length,'RFINPRESENTDEIXISA',18)=0 THEN
  R:=251;
IF STR_compare(name,length,'RFINPASTDEIXISA',15)=0 THEN
  R:=252;
IF STR_compare(name,length,'RFINPASTDEIXISSPECA',19)=0 THEN
  R:=253;
IF STR_compare(name,length,'RTEMPCONJSENTMOVETOLEFT',23)=0 THEN
  R:=254;
IF STR_compare(name,length,'RPROPSUBST14',12)=0 THEN
  R:=255;
IF STR_compare(name,length,'RSENTENCECOMPL',14)=0 THEN
  R:=256;
IF STR_compare(name,length,'RSENTENCEOMTECOMPL',18)=0 THEN
  R:=257;
IF STR_compare(name,length,'ROPENADJPPROPPREPOBJ',20)=0 THEN
  R:=258;
IF STR_compare(name,length,'RCLOSEDADJPPROPPREPOBJ',22)=0 THEN
  R:=259;
IF STR_compare(name,length,'ROPENNPPROPPREPOBJ',18)=0 THEN
  R:=260;
IF STR_compare(name,length,'RCLOSEDNPPROPPREPOBJ',20)=0 THEN
  R:=261;
IF STR_compare(name,length,'RSENTENCEPREPOBJ',16)=0 THEN
  R:=262;
IF STR_compare(name,length,'RSENTENCESUBJ',13)=0 THEN
  R:=263;
IF STR_compare(name,length,'RSENTENCEEXTRAPOS',17)=0 THEN
  R:=264;
IF STR_compare(name,length,'RSENTENCELDISLOC',16)=0 THEN
  R:=265;
IF STR_compare(name,length,'RTEMPADVSENTSUBSTITUTION',24)=0 THEN
  R:=266;
IF STR_compare(name,length,'RCONJSENTSUBST1',15)=0 THEN
  R:=267;
IF STR_compare(name,length,'RSADJSENTSUBST',14)=0 THEN
  R:=268;
IF STR_compare(name,length,'RCONJSENTSUBST2',15)=0 THEN
  R:=269;
IF STR_compare(name,length,'RCONJSENTSUBST3',15)=0 THEN
  R:=270;
IF STR_compare(name,length,'RCONJSENTSUBST4',15)=0 THEN
  R:=271;
IF STR_compare(name,length,'RINFINPRESENTDEIXIS',19)=0 THEN
  R:=272;
IF STR_compare(name,length,'RINFINPASTDEIXISSPEC',20)=0 THEN
  R:=273;
IF STR_compare(name,length,'RIMPDEIXIS',10)=0 THEN
  R:=274;
IF STR_compare(name,length,'RFINIRRMODALDEIXIS',18)=0 THEN
  R:=275;
IF STR_compare(name,length,'RINFINPRESENTDEIXISA',20)=0 THEN
  R:=276;
IF STR_compare(name,length,'RINFINPASTDEIXISSPECA',21)=0 THEN
  R:=277;
IF STR_compare(name,length,'RFINPRESENTSUPERDEIXIS',22)=0 THEN
  R:=278;
IF STR_compare(name,length,'RFINPASTSUPERDEIXIS1',20)=0 THEN
  R:=279;
IF STR_compare(name,length,'RFINPASTSUPERDEIXIS2',20)=0 THEN
  R:=280;
IF STR_compare(name,length,'RFINPRESENTSUPERDEIXISA',23)=0 THEN
  R:=281;
IF STR_compare(name,length,'RFINPASTSUPERDEIXIS1A',21)=0 THEN
  R:=282;
IF STR_compare(name,length,'RFINPASTSUPERDEIXIS2A',21)=0 THEN
  R:=283;
IF STR_compare(name,length,'RINFINPRESENTSUPERDEIXISA',25)=0 THEN
  R:=284;
IF STR_compare(name,length,'RINFINPASTSUPERDEIXISA',22)=0 THEN
  R:=285;
IF STR_compare(name,length,'RINFINPASTSUPERDEIXISSPECA',26)=0 THEN
  R:=286;
IF STR_compare(name,length,'RFINPASTSUPERDEIXISSPECA',24)=0 THEN
  R:=287;
IF STR_compare(name,length,'RRETROIMPERFECTIVE',18)=0 THEN
  R:=288;
IF STR_compare(name,length,'RRETROPERFECTIVE',16)=0 THEN
  R:=289;
IF STR_compare(name,length,'RINFINPRESENTSUPERDEIXIS',24)=0 THEN
  R:=290;
IF STR_compare(name,length,'RINFINPASTSUPERDEIXIS',21)=0 THEN
  R:=291;
IF STR_compare(name,length,'RINFINPASTSUPERDEIXISSPEC',25)=0 THEN
  R:=292;
IF STR_compare(name,length,'RFINIRRMODALSUPERDEIXIS',23)=0 THEN
  R:=293;
IF STR_compare(name,length,'RFINPASTSUPERDEIXISSPEC',23)=0 THEN
  R:=294;
IF STR_compare(name,length,'RADJREFVARINSERTION',19)=0 THEN
  R:=295;
IF STR_compare(name,length,'RADJDURVARINSERTION',19)=0 THEN
  R:=296;
IF STR_compare(name,length,'RADJRETROVARINSERTION',21)=0 THEN
  R:=297;
IF STR_compare(name,length,'RADJASPECTIMPERFECTIVE',22)=0 THEN
  R:=298;
IF STR_compare(name,length,'RADJRETROIMPERFECTIVE',21)=0 THEN
  R:=299;
IF STR_compare(name,length,'RADJPRESENTDEIXIS',17)=0 THEN
  R:=300;
IF STR_compare(name,length,'RADJPASTDEIXIS',14)=0 THEN
  R:=301;
IF STR_compare(name,length,'RADJTEMPADVSUBSTITUTION1',24)=0 THEN
  R:=302;
IF STR_compare(name,length,'RADJTEMPADVSUBSTITUTION2',24)=0 THEN
  R:=303;
IF STR_compare(name,length,'RADJPRESENTSUPERDEIXIS',22)=0 THEN
  R:=304;
IF STR_compare(name,length,'RADJPASTSUPERDEIXIS',19)=0 THEN
  R:=305;
IF STR_compare(name,length,'RADJTEMPADVSENTSUBSTITUTION',27)=0 THEN
  R:=306;
IF STR_compare(name,length,'RPREPTOSUB',10)=0 THEN
  R:=307;
IF STR_compare(name,length,'RSTARTPREPPPROP000',18)=0 THEN
  R:=308;
IF STR_compare(name,length,'RSTARTPREPPPROP100',18)=0 THEN
  R:=309;
IF STR_compare(name,length,'RSTARTPREPPPROP120',18)=0 THEN
  R:=310;
IF STR_compare(name,length,'RPPPREFVARINSERTION',19)=0 THEN
  R:=311;
IF STR_compare(name,length,'RPPPDURVARINSERTION',19)=0 THEN
  R:=312;
IF STR_compare(name,length,'RPPPRETROVARINSERTION',21)=0 THEN
  R:=313;
IF STR_compare(name,length,'RPREPPPROPVOICE',15)=0 THEN
  R:=314;
IF STR_compare(name,length,'RPPPNPMOD',9)=0 THEN
  R:=315;
IF STR_compare(name,length,'RPPPADVPMOD',11)=0 THEN
  R:=316;
IF STR_compare(name,length,'RPREPTOFORMULA',14)=0 THEN
  R:=317;
IF STR_compare(name,length,'RPPPASPECTIMPERFECTIVE',22)=0 THEN
  R:=318;
IF STR_compare(name,length,'RPPPSUPERDEIXIS',15)=0 THEN
  R:=319;
IF STR_compare(name,length,'RPPPMOOD1',9)=0 THEN
  R:=320;
IF STR_compare(name,length,'RPPPMOOD2',9)=0 THEN
  R:=321;
IF STR_compare(name,length,'RPPPSUBSTITUTION1',17)=0 THEN
  R:=322;
IF STR_compare(name,length,'RIDPPPSUBSTITUTION1',19)=0 THEN
  R:=323;
IF STR_compare(name,length,'RPPPSUBSTITUTION2',17)=0 THEN
  R:=324;
IF STR_compare(name,length,'RIDPPPSUBSTITUTION2',19)=0 THEN
  R:=325;
IF STR_compare(name,length,'RPPPSUBSTITUTION3',17)=0 THEN
  R:=326;
IF STR_compare(name,length,'RPPPSUBSTITUTION4',17)=0 THEN
  R:=327;
IF STR_compare(name,length,'RPPPSUBSTITUTION5',17)=0 THEN
  R:=328;
IF STR_compare(name,length,'RPPPNOPUNC',10)=0 THEN
  R:=329;
IF STR_compare(name,length,'RMOODFINREL',11)=0 THEN
  R:=330;
IF STR_compare(name,length,'RMOODFINWHMOD',13)=0 THEN
  R:=331;
IF STR_compare(name,length,'RMOODOPENINF',12)=0 THEN
  R:=332;
IF STR_compare(name,length,'RMOODCLOSEDINF',14)=0 THEN
  R:=333;
IF STR_compare(name,length,'RMOOD7',6)=0 THEN
  R:=334;
IF STR_compare(name,length,'RMOOD8',6)=0 THEN
  R:=335;
IF STR_compare(name,length,'RMOODPOLITEIMP',14)=0 THEN
  R:=336;
IF STR_compare(name,length,'RMOOD7S',7)=0 THEN
  R:=337;
IF STR_compare(name,length,'RMOOD8S',7)=0 THEN
  R:=338;
IF STR_compare(name,length,'RMOODPOLITEIMPS',15)=0 THEN
  R:=339;
IF STR_compare(name,length,'RLATENMOOD',10)=0 THEN
  R:=340;
IF STR_compare(name,length,'RMOODPRESPART',13)=0 THEN
  R:=341;
IF STR_compare(name,length,'RMOODOPENTEINF',14)=0 THEN
  R:=342;
IF STR_compare(name,length,'RMOODOPENOMTEINF',16)=0 THEN
  R:=343;
IF STR_compare(name,length,'RCLOSEDTEINF',12)=0 THEN
  R:=344;
IF STR_compare(name,length,'RMOODPASTPART',13)=0 THEN
  R:=345;
IF STR_compare(name,length,'RMOODCVPP',9)=0 THEN
  R:=346;
IF STR_compare(name,length,'RGELIEVEMOOD',12)=0 THEN
  R:=347;
IF STR_compare(name,length,'RADJUNCTVAR1',12)=0 THEN
  R:=348;
IF STR_compare(name,length,'RADJUNCTVAR2',12)=0 THEN
  R:=349;
IF STR_compare(name,length,'RADJUNCTVAR3',12)=0 THEN
  R:=350;
IF STR_compare(name,length,'RSTARTPREPP100',14)=0 THEN
  R:=351;
IF STR_compare(name,length,'RSTARTPREPP120',14)=0 THEN
  R:=352;
IF STR_compare(name,length,'RPPNPMOD',8)=0 THEN
  R:=353;
IF STR_compare(name,length,'RPPADVPMOD',10)=0 THEN
  R:=354;
IF STR_compare(name,length,'RPPSUBSTITUTION1',16)=0 THEN
  R:=355;
IF STR_compare(name,length,'RIDPPSUBSTITUTION1',18)=0 THEN
  R:=356;
IF STR_compare(name,length,'RIDPPSUBSTITUTION3',18)=0 THEN
  R:=357;
IF STR_compare(name,length,'RPPSUBSTITUTION2',16)=0 THEN
  R:=358;
IF STR_compare(name,length,'RIDPPSUBSTITUTION2',18)=0 THEN
  R:=359;
IF STR_compare(name,length,'RPPSUBSTITUTION3',16)=0 THEN
  R:=360;
IF STR_compare(name,length,'RPPSUBSTITUTION4',16)=0 THEN
  R:=361;
IF STR_compare(name,length,'RPPSUPERDEIXIS',14)=0 THEN
  R:=362;
IF STR_compare(name,length,'RSECONDPP',9)=0 THEN
  R:=363;
IF STR_compare(name,length,'RIDSUBSTITUTION1',16)=0 THEN
  R:=364;
IF STR_compare(name,length,'RIDSUBSTITUTION3',16)=0 THEN
  R:=365;
IF STR_compare(name,length,'RIDSUBSTITUTION4',16)=0 THEN
  R:=366;
IF STR_compare(name,length,'RIDSUBSTITUTION5',16)=0 THEN
  R:=367;
IF STR_compare(name,length,'RIDSUBSTITUTION6',16)=0 THEN
  R:=368;
IF STR_compare(name,length,'RSUBSTITUTION7',14)=0 THEN
  R:=369;
IF STR_compare(name,length,'RSUBSTITUTION16',15)=0 THEN
  R:=370;
IF STR_compare(name,length,'RSUBSTITUTION17',15)=0 THEN
  R:=371;
IF STR_compare(name,length,'RSUBSTITUTION18',15)=0 THEN
  R:=372;
IF STR_compare(name,length,'RSUBSTENNP1',11)=0 THEN
  R:=373;
IF STR_compare(name,length,'RSUBSTENNP2',11)=0 THEN
  R:=374;
IF STR_compare(name,length,'RBIGPROSUBST',12)=0 THEN
  R:=375;
IF STR_compare(name,length,'RSADJSUBSTITUTION1',18)=0 THEN
  R:=376;
IF STR_compare(name,length,'RSOPROSENTSUBST',15)=0 THEN
  R:=377;
IF STR_compare(name,length,'RPREPPROSENTSUBST',17)=0 THEN
  R:=378;
IF STR_compare(name,length,'RBADVTOSUB',10)=0 THEN
  R:=379;
IF STR_compare(name,length,'RRADVTOSUB',10)=0 THEN
  R:=380;
IF STR_compare(name,length,'RSUBADJTOSUBADV',15)=0 THEN
  R:=381;
IF STR_compare(name,length,'RSTARTADVP0',11)=0 THEN
  R:=382;
IF STR_compare(name,length,'RSTARTADVP1',11)=0 THEN
  R:=383;
IF STR_compare(name,length,'RADVPDEGREEMOD1',15)=0 THEN
  R:=384;
IF STR_compare(name,length,'RADVPDEGREEMOD2',15)=0 THEN
  R:=385;
IF STR_compare(name,length,'RADVPDEGREEMOD3',15)=0 THEN
  R:=386;
IF STR_compare(name,length,'RADVPVOOROBJMOD',15)=0 THEN
  R:=387;
IF STR_compare(name,length,'RADVPSUBSTITUTION1',18)=0 THEN
  R:=388;
IF STR_compare(name,length,'RADVPSUBSTITUTION2',18)=0 THEN
  R:=389;
IF STR_compare(name,length,'RADVPSUBSTITUTION3',18)=0 THEN
  R:=390;
IF STR_compare(name,length,'RADVPSUBSTITUTION4',18)=0 THEN
  R:=391;
IF STR_compare(name,length,'RADVPSUPERDEIXIS',16)=0 THEN
  R:=392;
IF STR_compare(name,length,'RADVPCOMPARISONCOMPLMOD',23)=0 THEN
  R:=393;
IF STR_compare(name,length,'RSTARTADVPPROP100',17)=0 THEN
  R:=394;
IF STR_compare(name,length,'RSTARTADVPPROP010',17)=0 THEN
  R:=395;
IF STR_compare(name,length,'RSTARTADVPPROP120',17)=0 THEN
  R:=396;
IF STR_compare(name,length,'RADVREFVARINSERTION',19)=0 THEN
  R:=397;
IF STR_compare(name,length,'RADVPPROPVOICE',14)=0 THEN
  R:=398;
IF STR_compare(name,length,'RADVTOFORMULA',13)=0 THEN
  R:=399;
IF STR_compare(name,length,'RADVASPECTIMPERFECTIVE',22)=0 THEN
  R:=400;
IF STR_compare(name,length,'RADVPPSUPERDEIXIS',17)=0 THEN
  R:=401;
IF STR_compare(name,length,'RADVPPSUBST1',12)=0 THEN
  R:=402;
IF STR_compare(name,length,'RADVPPMOOD1',11)=0 THEN
  R:=403;
IF STR_compare(name,length,'RADVPPMOOD2',11)=0 THEN
  R:=404;
IF STR_compare(name,length,'RADVPPNOPUNC',12)=0 THEN
  R:=405;
IF STR_compare(name,length,'RUTTADJP',8)=0 THEN
  R:=406;
IF STR_compare(name,length,'RPUNC0',6)=0 THEN
  R:=407;
IF STR_compare(name,length,'RPUNC1',6)=0 THEN
  R:=408;
IF STR_compare(name,length,'RPUNC2',6)=0 THEN
  R:=409;
IF STR_compare(name,length,'RPUNC3',6)=0 THEN
  R:=410;
IF STR_compare(name,length,'RCOORDINTRO',11)=0 THEN
  R:=411;
IF STR_compare(name,length,'RRECIPROCALSUBST1',17)=0 THEN
  R:=412;
IF STR_compare(name,length,'RCONJSENT1',10)=0 THEN
  R:=413;
IF STR_compare(name,length,'RCONJSENT2',10)=0 THEN
  R:=414;
IF STR_compare(name,length,'RCONJSENT3',10)=0 THEN
  R:=415;
IF STR_compare(name,length,'RCONJSENT4',10)=0 THEN
  R:=416;
IF STR_compare(name,length,'RCONJSENT5',10)=0 THEN
  R:=417;
IF STR_compare(name,length,'RCONJSENT6',10)=0 THEN
  R:=418;
IF STR_compare(name,length,'RPOSVAR',7)=0 THEN
  R:=419;
IF STR_compare(name,length,'RNEGVAR1',8)=0 THEN
  R:=420;
IF STR_compare(name,length,'RNEGVAR2',8)=0 THEN
  R:=421;
IF STR_compare(name,length,'RNEGVAR3',8)=0 THEN
  R:=422;
IF STR_compare(name,length,'RRELMARKING1',12)=0 THEN
  R:=423;
IF STR_compare(name,length,'RRELMARKING2',12)=0 THEN
  R:=424;
IF STR_compare(name,length,'RRELMARKING3',12)=0 THEN
  R:=425;
IF STR_compare(name,length,'RRELMARKING4',12)=0 THEN
  R:=426;
IF STR_compare(name,length,'RIDDERIV13',10)=0 THEN
  R:=427;
IF STR_compare(name,length,'RIDTOPICXPMARKING',17)=0 THEN
  R:=428;
IF STR_compare(name,length,'RIDSTARTPREPPFORM1',18)=0 THEN
  R:=429;
IF STR_compare(name,length,'RIDSTARTPREPPFORM2',18)=0 THEN
  R:=430;
IF STR_compare(name,length,'RIDSTARTPREPP1',14)=0 THEN
  R:=431;
IF STR_compare(name,length,'RIDSTARTPREPP3',14)=0 THEN
  R:=432;
IF STR_compare(name,length,'RIDSTARTPREPP4',14)=0 THEN
  R:=433;
IF STR_compare(name,length,'RIDSTARTPREPP2',14)=0 THEN
  R:=434;
IF STR_compare(name,length,'RIDDERIV1',9)=0 THEN
  R:=435;
IF STR_compare(name,length,'RIDDERIV2',9)=0 THEN
  R:=436;
IF STR_compare(name,length,'RIDSUBNOUNTONOUN',16)=0 THEN
  R:=437;
IF STR_compare(name,length,'RIDALTNPFORMATION1',18)=0 THEN
  R:=438;
IF STR_compare(name,length,'RIDDERIV3',9)=0 THEN
  R:=439;
IF STR_compare(name,length,'RIDDERIV4',9)=0 THEN
  R:=440;
IF STR_compare(name,length,'RIDDERIV5',9)=0 THEN
  R:=441;
IF STR_compare(name,length,'RIDDERIV6',9)=0 THEN
  R:=442;
IF STR_compare(name,length,'RIDDERIV8',9)=0 THEN
  R:=443;
IF STR_compare(name,length,'RIDDERIV9',9)=0 THEN
  R:=444;
IF STR_compare(name,length,'RIDDERIV10',10)=0 THEN
  R:=445;
IF STR_compare(name,length,'RIDDERIV11',10)=0 THEN
  R:=446;
IF STR_compare(name,length,'RIDNPFORMATION3',15)=0 THEN
  R:=447;
IF STR_compare(name,length,'RIDNPFORMATION2',15)=0 THEN
  R:=448;
IF STR_compare(name,length,'RIDVARPPTOPP',12)=0 THEN
  R:=449;
IF STR_compare(name,length,'RIDPPFORMTOPPP',14)=0 THEN
  R:=450;
IF STR_compare(name,length,'RIDNPFORMATION',14)=0 THEN
  R:=451;
IF STR_compare(name,length,'RCNMODADVP1',11)=0 THEN
  R:=452;
IF STR_compare(name,length,'RCNMODADVP2',11)=0 THEN
  R:=453;
IF STR_compare(name,length,'RCNMODPOSTPARTICPLE',19)=0 THEN
  R:=454;
IF STR_compare(name,length,'RCNMODRELSENT1',14)=0 THEN
  R:=455;
IF STR_compare(name,length,'RNONCNMODRELSENT1',17)=0 THEN
  R:=456;
IF STR_compare(name,length,'RCNMODINFREL',12)=0 THEN
  R:=457;
IF STR_compare(name,length,'RNPPARTITIVEFORMATION1',22)=0 THEN
  R:=458;
IF STR_compare(name,length,'RNPPARTITIVEFORMATION2',22)=0 THEN
  R:=459;
IF STR_compare(name,length,'RCARDNP',7)=0 THEN
  R:=460;
IF STR_compare(name,length,'RNPFORMATION6',13)=0 THEN
  R:=461;
IF STR_compare(name,length,'RNPFORMATION7',13)=0 THEN
  R:=462;
IF STR_compare(name,length,'RNPFORMATION8',13)=0 THEN
  R:=463;
IF STR_compare(name,length,'RNPFORMATION9',13)=0 THEN
  R:=464;
IF STR_compare(name,length,'RNPFORMATION11',14)=0 THEN
  R:=465;
IF STR_compare(name,length,'RNPFORMATION11A',15)=0 THEN
  R:=466;
IF STR_compare(name,length,'RNPFORMATION13',14)=0 THEN
  R:=467;
IF STR_compare(name,length,'RNPFORMATION14',14)=0 THEN
  R:=468;
IF STR_compare(name,length,'RNPFORMATION17',14)=0 THEN
  R:=469;
IF STR_compare(name,length,'RBTOBIGPRO',10)=0 THEN
  R:=470;
IF STR_compare(name,length,'RVPADV',6)=0 THEN
  R:=471;
IF STR_compare(name,length,'RAGVPADV1',9)=0 THEN
  R:=472;
IF STR_compare(name,length,'RAGVPADV2',9)=0 THEN
  R:=473;
IF STR_compare(name,length,'RAGVPADV3',9)=0 THEN
  R:=474;
IF STR_compare(name,length,'RIDALTPREPFORM',14)=0 THEN
  R:=475;
IF STR_compare(name,length,'RIDDERIV15',10)=0 THEN
  R:=476;
IF STR_compare(name,length,'RIDALTLOCDIRSUBST',17)=0 THEN
  R:=477;
IF STR_compare(name,length,'RIDDERIV14',10)=0 THEN
  R:=478;
IF STR_compare(name,length,'RIDDERIV7',9)=0 THEN
  R:=479;
IF STR_compare(name,length,'RIDDERIV12',10)=0 THEN
  R:=480;
IF STR_compare(name,length,'RCARD1',6)=0 THEN
  R:=481;
IF STR_compare(name,length,'RCARD2',6)=0 THEN
  R:=482;
IF STR_compare(name,length,'RDATUMNP',8)=0 THEN
  R:=483;
IF STR_compare(name,length,'RDATUMDAY',9)=0 THEN
  R:=484;
IF STR_compare(name,length,'RDATUMYEAR',10)=0 THEN
  R:=485;
IF STR_compare(name,length,'RDATUMDAYNAME',13)=0 THEN
  R:=486;
IF STR_compare(name,length,'RSIMPLEOPENADJPPCOORD',21)=0 THEN
  R:=487;
IF STR_compare(name,length,'RSIMPLECLOSEDADJPPCOORD',23)=0 THEN
  R:=488;
IF STR_compare(name,length,'RSIMPLEADJPPCOORD',17)=0 THEN
  R:=489;
IF STR_compare(name,length,'RSIMPLEOPENADVPPCOORD',21)=0 THEN
  R:=490;
IF STR_compare(name,length,'RSIMPLECLOSEDADVPPCOORD',23)=0 THEN
  R:=491;
IF STR_compare(name,length,'RSIMPLEOPENPPPCOORD',19)=0 THEN
  R:=492;
IF STR_compare(name,length,'RSIMPLECLOSEDPPPCOORD',21)=0 THEN
  R:=493;
IF STR_compare(name,length,'RSIMPLEPPCOORD',14)=0 THEN
  R:=494;
IF STR_compare(name,length,'RSIMPLEADVPCOORD',16)=0 THEN
  R:=495;
IF STR_compare(name,length,'RSIMPLENPCOORD',14)=0 THEN
  R:=496;
IF STR_compare(name,length,'RITSKPPCOORD',12)=0 THEN
  R:=497;
IF STR_compare(name,length,'RITSCPPCOORD',12)=0 THEN
  R:=498;
IF STR_compare(name,length,'RCOORDS',7)=0 THEN
  R:=499;
IF STR_compare(name,length,'RCOORDITS',9)=0 THEN
  R:=500;
IF STR_compare(name,length,'RCORRPPCOORD',12)=0 THEN
  R:=501;
IF STR_compare(name,length,'RCORROPENADJPPCOORD',19)=0 THEN
  R:=502;
IF STR_compare(name,length,'RCORRCLOSEDADJPPCOORD',21)=0 THEN
  R:=503;
IF STR_compare(name,length,'RCORRADJPPCOORD',15)=0 THEN
  R:=504;
IF STR_compare(name,length,'RCORROPENADVPPCOORD',19)=0 THEN
  R:=505;
IF STR_compare(name,length,'RCORRNPCOORD',12)=0 THEN
  R:=506;
IF STR_compare(name,length,'RNPPROPFORMATION',16)=0 THEN
  R:=507;
IF STR_compare(name,length,'RNPREFVARINSERTION',18)=0 THEN
  R:=508;
IF STR_compare(name,length,'RNPRETROVARINSERTION',20)=0 THEN
  R:=509;
IF STR_compare(name,length,'RNPPSUBST1',10)=0 THEN
  R:=510;
IF STR_compare(name,length,'ROPENNPPROPFORMATION',20)=0 THEN
  R:=511;
IF STR_compare(name,length,'RCLOSEDNPPROPFORMATION',22)=0 THEN
  R:=512;
IF STR_compare(name,length,'RNPPNOPUNC',10)=0 THEN
  R:=513;
IF STR_compare(name,length,'RNOUNARGMOD1',12)=0 THEN
  R:=514;
IF STR_compare(name,length,'RNOUNARGMOD2',12)=0 THEN
  R:=515;
IF STR_compare(name,length,'RNPARGMODSUBST1',15)=0 THEN
  R:=516;
IF STR_compare(name,length,'RNPARGMODSUBST2',15)=0 THEN
  R:=517;
IF STR_compare(name,length,'RIDNPPSUPERDEIXIS',17)=0 THEN
  R:=518;
END;
 PROCEDURE LDMrules_Transformationnumber(VAR R:LDMrules_transformationindex;
const name:string;length:INTEGER);
BEGIN
IF STR_compare(name,length,'TVPDEL1',7)=0 THEN
  R:=1;
IF STR_compare(name,length,'TVPDEL0',7)=0 THEN
  R:=2;
IF STR_compare(name,length,'TSUBJECTSHIFT1',14)=0 THEN
  R:=3;
IF STR_compare(name,length,'TSUBJECTSHIFT2',14)=0 THEN
  R:=4;
IF STR_compare(name,length,'TV21',4)=0 THEN
  R:=5;
IF STR_compare(name,length,'TV22',4)=0 THEN
  R:=6;
IF STR_compare(name,length,'TV23',4)=0 THEN
  R:=7;
IF STR_compare(name,length,'TNOV2',5)=0 THEN
  R:=8;
IF STR_compare(name,length,'TV24',4)=0 THEN
  R:=9;
IF STR_compare(name,length,'TV25',4)=0 THEN
  R:=10;
IF STR_compare(name,length,'TPROSTATUS1',11)=0 THEN
  R:=11;
IF STR_compare(name,length,'TNPOVERADV1',11)=0 THEN
  R:=12;
IF STR_compare(name,length,'TPPOVERV1',9)=0 THEN
  R:=13;
IF STR_compare(name,length,'TPPOVERV2',9)=0 THEN
  R:=14;
IF STR_compare(name,length,'TPPOVERV3',9)=0 THEN
  R:=15;
IF STR_compare(name,length,'TPPOVERV4',9)=0 THEN
  R:=16;
IF STR_compare(name,length,'TADJPPOVERV1',12)=0 THEN
  R:=17;
IF STR_compare(name,length,'TSPRUNING1',10)=0 THEN
  R:=18;
IF STR_compare(name,length,'TSPRUNING0',10)=0 THEN
  R:=19;
IF STR_compare(name,length,'TMODALSWITCH1',13)=0 THEN
  R:=20;
IF STR_compare(name,length,'TGAANDELETION',13)=0 THEN
  R:=21;
IF STR_compare(name,length,'TMODALEXP1',10)=0 THEN
  R:=22;
IF STR_compare(name,length,'TMODALEXP2',10)=0 THEN
  R:=23;
IF STR_compare(name,length,'TMODALEXP0',10)=0 THEN
  R:=24;
IF STR_compare(name,length,'TMODALEXP3',10)=0 THEN
  R:=25;
IF STR_compare(name,length,'TZOUINSERTION',13)=0 THEN
  R:=26;
IF STR_compare(name,length,'TCASEASSIGNMENT1',16)=0 THEN
  R:=27;
IF STR_compare(name,length,'TCASEASSIGNMENT1A',17)=0 THEN
  R:=28;
IF STR_compare(name,length,'TCASEASSIGNMENT2',16)=0 THEN
  R:=29;
IF STR_compare(name,length,'TCASEASSIGNMENT3',16)=0 THEN
  R:=30;
IF STR_compare(name,length,'TCASEASSIGNMENT4',16)=0 THEN
  R:=31;
IF STR_compare(name,length,'SVA0',4)=0 THEN
  R:=32;
IF STR_compare(name,length,'SVA1',4)=0 THEN
  R:=33;
IF STR_compare(name,length,'TOBJECTOK0',10)=0 THEN
  R:=34;
IF STR_compare(name,length,'TOBJECTOK1',10)=0 THEN
  R:=35;
IF STR_compare(name,length,'TOBJECTOK2',10)=0 THEN
  R:=36;
IF STR_compare(name,length,'TOBJECTOK3',10)=0 THEN
  R:=37;
IF STR_compare(name,length,'TOBJECTOK4',10)=0 THEN
  R:=38;
IF STR_compare(name,length,'TOBJECTOK5',10)=0 THEN
  R:=39;
IF STR_compare(name,length,'TOBJECTOK6',10)=0 THEN
  R:=40;
IF STR_compare(name,length,'TOBJECTOK7',10)=0 THEN
  R:=41;
IF STR_compare(name,length,'TNOC1',5)=0 THEN
  R:=42;
IF STR_compare(name,length,'TNOC2',5)=0 THEN
  R:=43;
IF STR_compare(name,length,'TNOC3',5)=0 THEN
  R:=44;
IF STR_compare(name,length,'TNOC4',5)=0 THEN
  R:=45;
IF STR_compare(name,length,'TCONTROL0',9)=0 THEN
  R:=46;
IF STR_compare(name,length,'TOBLCONTROL1A',13)=0 THEN
  R:=47;
IF STR_compare(name,length,'TOBLCONTROL1B',13)=0 THEN
  R:=48;
IF STR_compare(name,length,'TNOCONTROL1',11)=0 THEN
  R:=49;
IF STR_compare(name,length,'TOBLCONTROL2A',13)=0 THEN
  R:=50;
IF STR_compare(name,length,'TOBLCONTROL2B',13)=0 THEN
  R:=51;
IF STR_compare(name,length,'TNOCONTROL2',11)=0 THEN
  R:=52;
IF STR_compare(name,length,'TOBLCONTROL3A',13)=0 THEN
  R:=53;
IF STR_compare(name,length,'TOBLCONTROL3B',13)=0 THEN
  R:=54;
IF STR_compare(name,length,'TNOCONTROL3',11)=0 THEN
  R:=55;
IF STR_compare(name,length,'TNOCONTROLID',12)=0 THEN
  R:=56;
IF STR_compare(name,length,'TOBLCONTROL7A',13)=0 THEN
  R:=57;
IF STR_compare(name,length,'TOBLCONTROL7B',13)=0 THEN
  R:=58;
IF STR_compare(name,length,'TNOCONTROL7',11)=0 THEN
  R:=59;
IF STR_compare(name,length,'TNOCONTROL8',11)=0 THEN
  R:=60;
IF STR_compare(name,length,'THATOA1',7)=0 THEN
  R:=61;
IF STR_compare(name,length,'THTOA2',6)=0 THEN
  R:=62;
IF STR_compare(name,length,'THTOA3',6)=0 THEN
  R:=63;
IF STR_compare(name,length,'TPTOA1',6)=0 THEN
  R:=64;
IF STR_compare(name,length,'TVPPRUNING1',11)=0 THEN
  R:=65;
IF STR_compare(name,length,'TVPPRUNING0',11)=0 THEN
  R:=66;
IF STR_compare(name,length,'SENTENCEOK0',11)=0 THEN
  R:=67;
IF STR_compare(name,length,'EXTRAPOSITION1',14)=0 THEN
  R:=68;
IF STR_compare(name,length,'EXTRAPOSITION2',14)=0 THEN
  R:=69;
IF STR_compare(name,length,'VERBRAISING1',12)=0 THEN
  R:=70;
IF STR_compare(name,length,'VERBRAISING2',12)=0 THEN
  R:=71;
IF STR_compare(name,length,'TVERBRAISING3',13)=0 THEN
  R:=72;
IF STR_compare(name,length,'TPOSTSUBJFORMATION1',19)=0 THEN
  R:=73;
IF STR_compare(name,length,'TPOSTSUBJFORMATION2',19)=0 THEN
  R:=74;
IF STR_compare(name,length,'TREMOVECLITICS1',15)=0 THEN
  R:=75;
IF STR_compare(name,length,'TREMOVECLITICS2',15)=0 THEN
  R:=76;
IF STR_compare(name,length,'TREMOVECLITICS3',15)=0 THEN
  R:=77;
IF STR_compare(name,length,'TREMOVECLITICS4',15)=0 THEN
  R:=78;
IF STR_compare(name,length,'TREMOVESADVS1',13)=0 THEN
  R:=79;
IF STR_compare(name,length,'TREMOVESUBJ1',12)=0 THEN
  R:=80;
IF STR_compare(name,length,'TREMOVESUBJ2',12)=0 THEN
  R:=81;
IF STR_compare(name,length,'TSUBJTOCL',9)=0 THEN
  R:=82;
IF STR_compare(name,length,'THETSUBJTOCL',12)=0 THEN
  R:=83;
IF STR_compare(name,length,'TREMOVEVPARGS1',14)=0 THEN
  R:=84;
IF STR_compare(name,length,'REMOVER1',8)=0 THEN
  R:=85;
IF STR_compare(name,length,'TREMOVESHIFT1',13)=0 THEN
  R:=86;
IF STR_compare(name,length,'TREMOVEVPADVS1',14)=0 THEN
  R:=87;
IF STR_compare(name,length,'TREMOVEARGNP',12)=0 THEN
  R:=88;
IF STR_compare(name,length,'TREMOVECOMPL',12)=0 THEN
  R:=89;
IF STR_compare(name,length,'TOBLCONTROL4A',13)=0 THEN
  R:=90;
IF STR_compare(name,length,'TOBLCONTROL4B',13)=0 THEN
  R:=91;
IF STR_compare(name,length,'TNOCONTROL4',11)=0 THEN
  R:=92;
IF STR_compare(name,length,'TNOCONTROL4ID',13)=0 THEN
  R:=93;
IF STR_compare(name,length,'TOBLCONTROL5A',13)=0 THEN
  R:=94;
IF STR_compare(name,length,'TOBLCONTROL5B',13)=0 THEN
  R:=95;
IF STR_compare(name,length,'TNOCONTROL5',11)=0 THEN
  R:=96;
IF STR_compare(name,length,'TOBLCONTROL5A1',14)=0 THEN
  R:=97;
IF STR_compare(name,length,'TOBLCONTROL5B1',14)=0 THEN
  R:=98;
IF STR_compare(name,length,'TNOCONTROL51',12)=0 THEN
  R:=99;
IF STR_compare(name,length,'TOBLCONTROL6A',13)=0 THEN
  R:=100;
IF STR_compare(name,length,'TOBLCONTROL6B',13)=0 THEN
  R:=101;
IF STR_compare(name,length,'RVERBPATTERN0',13)=0 THEN
  R:=102;
IF STR_compare(name,length,'RVERBPATTERN1',13)=0 THEN
  R:=103;
IF STR_compare(name,length,'TADJPATTERN0',12)=0 THEN
  R:=104;
IF STR_compare(name,length,'TADJPATTERN11',13)=0 THEN
  R:=105;
IF STR_compare(name,length,'TADJPATTERN12A',14)=0 THEN
  R:=106;
IF STR_compare(name,length,'TADJPATTERN12B',14)=0 THEN
  R:=107;
IF STR_compare(name,length,'TADJPATTERN13',13)=0 THEN
  R:=108;
IF STR_compare(name,length,'TADJPATTERN14',13)=0 THEN
  R:=109;
IF STR_compare(name,length,'TADJPATTERN15A',14)=0 THEN
  R:=110;
IF STR_compare(name,length,'TADJPATTERN15B',14)=0 THEN
  R:=111;
IF STR_compare(name,length,'TADJPATTERN16',13)=0 THEN
  R:=112;
IF STR_compare(name,length,'TADJPATTERN17',13)=0 THEN
  R:=113;
IF STR_compare(name,length,'TADJPATTERN18A',14)=0 THEN
  R:=114;
IF STR_compare(name,length,'TADJPATTERN18B',14)=0 THEN
  R:=115;
IF STR_compare(name,length,'TADJPATTERN21',13)=0 THEN
  R:=116;
IF STR_compare(name,length,'TADJPATTERN22',13)=0 THEN
  R:=117;
IF STR_compare(name,length,'TADJPATTERN23',13)=0 THEN
  R:=118;
IF STR_compare(name,length,'TADJPATTERN24',13)=0 THEN
  R:=119;
IF STR_compare(name,length,'TADJPATTERN25',13)=0 THEN
  R:=120;
IF STR_compare(name,length,'TADJPATTERN26',13)=0 THEN
  R:=121;
IF STR_compare(name,length,'TADJZICHSPELLINGDEFAULT',23)=0 THEN
  R:=122;
IF STR_compare(name,length,'TADJZICHSPELLING1',17)=0 THEN
  R:=123;
IF STR_compare(name,length,'TADJZICHSPELLING2',17)=0 THEN
  R:=124;
IF STR_compare(name,length,'TADJZICHSPELLING3',17)=0 THEN
  R:=125;
IF STR_compare(name,length,'TADJZICHSPELLING4',17)=0 THEN
  R:=126;
IF STR_compare(name,length,'TADJRECIPROCALSPELLING1',23)=0 THEN
  R:=127;
IF STR_compare(name,length,'TADJRECIPROCALSPELLING1A',24)=0 THEN
  R:=128;
IF STR_compare(name,length,'TADJRECIPROCALSPELLING2',23)=0 THEN
  R:=129;
IF STR_compare(name,length,'TADJRECIPROCALSPELLING2A',24)=0 THEN
  R:=130;
IF STR_compare(name,length,'TADJRECIPROCALSPELLING3',23)=0 THEN
  R:=131;
IF STR_compare(name,length,'TADJRECIPROCALSPELLING3A',24)=0 THEN
  R:=132;
IF STR_compare(name,length,'TADJRECIPROCALSPELLING4',23)=0 THEN
  R:=133;
IF STR_compare(name,length,'TADJRECIPROCALSPELLING4A',24)=0 THEN
  R:=134;
IF STR_compare(name,length,'TADJQPHOPPING1',14)=0 THEN
  R:=135;
IF STR_compare(name,length,'TADJQPHOPPING2',14)=0 THEN
  R:=136;
IF STR_compare(name,length,'TADVQPHOPPING1',14)=0 THEN
  R:=137;
IF STR_compare(name,length,'TADVQPHOPPING2',14)=0 THEN
  R:=138;
IF STR_compare(name,length,'TADJCASEASSIGNMENT1',19)=0 THEN
  R:=139;
IF STR_compare(name,length,'TADJCASEASSIGNMENT2',19)=0 THEN
  R:=140;
IF STR_compare(name,length,'TADJCASEASSIGNMENT3',19)=0 THEN
  R:=141;
IF STR_compare(name,length,'TADJCONTROL0',12)=0 THEN
  R:=142;
IF STR_compare(name,length,'TADJCONTROL1',12)=0 THEN
  R:=143;
IF STR_compare(name,length,'TADJCONTROL2A',13)=0 THEN
  R:=144;
IF STR_compare(name,length,'TADJCONTROL2B',13)=0 THEN
  R:=145;
IF STR_compare(name,length,'TADJCONTROL2C',13)=0 THEN
  R:=146;
IF STR_compare(name,length,'TADJCONTROL3A',13)=0 THEN
  R:=147;
IF STR_compare(name,length,'TADJCONTROL3B',13)=0 THEN
  R:=148;
IF STR_compare(name,length,'TADJCONTROL3C',13)=0 THEN
  R:=149;
IF STR_compare(name,length,'TADJCONTROL4',12)=0 THEN
  R:=150;
IF STR_compare(name,length,'TADJPROOBJCONTROL0',18)=0 THEN
  R:=151;
IF STR_compare(name,length,'TADJPROOBJCONTROL1',18)=0 THEN
  R:=152;
IF STR_compare(name,length,'TADJSENTEXTRAPOS',16)=0 THEN
  R:=153;
IF STR_compare(name,length,'TADJCOMPLEXTRAPOS',17)=0 THEN
  R:=154;
IF STR_compare(name,length,'TADJPREPPEXTRAPOS1',18)=0 THEN
  R:=155;
IF STR_compare(name,length,'TADJPREPPEXTRAPOS3',18)=0 THEN
  R:=156;
IF STR_compare(name,length,'TADJPREPPEXTRAPOS2',18)=0 THEN
  R:=157;
IF STR_compare(name,length,'TADJOBJECTOK0',13)=0 THEN
  R:=158;
IF STR_compare(name,length,'TADJOBJECTOK1',13)=0 THEN
  R:=159;
IF STR_compare(name,length,'TADJOBJECTOK2',13)=0 THEN
  R:=160;
IF STR_compare(name,length,'TADJMEERTOER',12)=0 THEN
  R:=161;
IF STR_compare(name,length,'TADJMEERNOTTOER',15)=0 THEN
  R:=162;
IF STR_compare(name,length,'TADJNOERNOMEER',14)=0 THEN
  R:=163;
IF STR_compare(name,length,'TADJMEESTTOST1',14)=0 THEN
  R:=164;
IF STR_compare(name,length,'TADJMEESTTOST2',14)=0 THEN
  R:=165;
IF STR_compare(name,length,'TADJMEESTNOTTOST',16)=0 THEN
  R:=166;
IF STR_compare(name,length,'TADJNOSTNOMEEST',15)=0 THEN
  R:=167;
IF STR_compare(name,length,'TADJPACOMPLMOVEMENT',19)=0 THEN
  R:=168;
IF STR_compare(name,length,'TADJCOMPLMOVEMENT',17)=0 THEN
  R:=169;
IF STR_compare(name,length,'TADJVOOROBJMOVEMENT1',20)=0 THEN
  R:=170;
IF STR_compare(name,length,'TQPNOMCASEASSIGNMENT',20)=0 THEN
  R:=171;
IF STR_compare(name,length,'TQPVANCOMPLCASEASSIGNMENT',25)=0 THEN
  R:=172;
IF STR_compare(name,length,'TQPSUPERDEIXISADAPTATION1',25)=0 THEN
  R:=173;
IF STR_compare(name,length,'TQPSUPERDEIXISADAPTATION2',25)=0 THEN
  R:=174;
IF STR_compare(name,length,'TNOQPSUPERDEIXISADAPTATION',26)=0 THEN
  R:=175;
IF STR_compare(name,length,'TNPHOP',6)=0 THEN
  R:=176;
IF STR_compare(name,length,'TNPADJQPCOMPLEXTRAPOS1',22)=0 THEN
  R:=177;
IF STR_compare(name,length,'TNPNOTOOMEGA1',13)=0 THEN
  R:=178;
IF STR_compare(name,length,'TNPNOTOOMEGA2',13)=0 THEN
  R:=179;
IF STR_compare(name,length,'TNPQPCOMPLEXTRAPOS',18)=0 THEN
  R:=180;
IF STR_compare(name,length,'TNPASSIGNEFORM1',15)=0 THEN
  R:=181;
IF STR_compare(name,length,'TNPASSIGNEFORM2',15)=0 THEN
  R:=182;
IF STR_compare(name,length,'TNPASSIGNEFORM3',15)=0 THEN
  R:=183;
IF STR_compare(name,length,'TNPASSIGNEFORM4',15)=0 THEN
  R:=184;
IF STR_compare(name,length,'TNPENDELETION1',14)=0 THEN
  R:=185;
IF STR_compare(name,length,'TNPENDELETION2',14)=0 THEN
  R:=186;
IF STR_compare(name,length,'TNPCNDELETION1',14)=0 THEN
  R:=187;
IF STR_compare(name,length,'TNPCNDELETION2',14)=0 THEN
  R:=188;
IF STR_compare(name,length,'TADJARGREFLSPELLING1',20)=0 THEN
  R:=189;
IF STR_compare(name,length,'TADJARGREFLSPELLING2',20)=0 THEN
  R:=190;
IF STR_compare(name,length,'TADJARGRECIPRSPELLING1',22)=0 THEN
  R:=191;
IF STR_compare(name,length,'TADJARGRECIPRSPELLING2',22)=0 THEN
  R:=192;
IF STR_compare(name,length,'TADJSETPROSUBJECT',17)=0 THEN
  R:=193;
IF STR_compare(name,length,'TADJALSINTRO',12)=0 THEN
  R:=194;
IF STR_compare(name,length,'TARGREFLSPELLING1',17)=0 THEN
  R:=195;
IF STR_compare(name,length,'TARGREFLSPELLING2',17)=0 THEN
  R:=196;
IF STR_compare(name,length,'TARGREFLSPELLING3',17)=0 THEN
  R:=197;
IF STR_compare(name,length,'TARGREFLSPELLING4',17)=0 THEN
  R:=198;
IF STR_compare(name,length,'TARGREFLSPELLING5',17)=0 THEN
  R:=199;
IF STR_compare(name,length,'TARGREFLSPELLING6',17)=0 THEN
  R:=200;
IF STR_compare(name,length,'TARGREFLSPELLING7',17)=0 THEN
  R:=201;
IF STR_compare(name,length,'TARGREFLSPELLING8',17)=0 THEN
  R:=202;
IF STR_compare(name,length,'TARGREFLSPELLING9',17)=0 THEN
  R:=203;
IF STR_compare(name,length,'TARGREFLSPELLING10',18)=0 THEN
  R:=204;
IF STR_compare(name,length,'RIDVERBPATTERN',14)=0 THEN
  R:=205;
IF STR_compare(name,length,'RVERBPATTERN2',13)=0 THEN
  R:=206;
IF STR_compare(name,length,'RVERBPATTERN3',13)=0 THEN
  R:=207;
IF STR_compare(name,length,'RVERBPATTERN16',14)=0 THEN
  R:=208;
IF STR_compare(name,length,'RVERBPATTERN5',13)=0 THEN
  R:=209;
IF STR_compare(name,length,'RVERBPATTERN6',13)=0 THEN
  R:=210;
IF STR_compare(name,length,'RVERBPATTERN14',14)=0 THEN
  R:=211;
IF STR_compare(name,length,'RVERBPATTERN7',13)=0 THEN
  R:=212;
IF STR_compare(name,length,'RVERBPATTERN8',13)=0 THEN
  R:=213;
IF STR_compare(name,length,'TPOSSADJSPELLING1',17)=0 THEN
  R:=214;
IF STR_compare(name,length,'ZICHSPELLINGDEFAULT',19)=0 THEN
  R:=215;
IF STR_compare(name,length,'ZICHSPELLING1',13)=0 THEN
  R:=216;
IF STR_compare(name,length,'ZICHSPELLING2',13)=0 THEN
  R:=217;
IF STR_compare(name,length,'ZICHSPELLING3',13)=0 THEN
  R:=218;
IF STR_compare(name,length,'ZICHSPELLING4',13)=0 THEN
  R:=219;
IF STR_compare(name,length,'RECIPROCALSPELLING1',19)=0 THEN
  R:=220;
IF STR_compare(name,length,'RECIPROCALSPELLING1A',20)=0 THEN
  R:=221;
IF STR_compare(name,length,'RECIPROCALSPELLING2',19)=0 THEN
  R:=222;
IF STR_compare(name,length,'RECIPROCALSPELLING2A',20)=0 THEN
  R:=223;
IF STR_compare(name,length,'TPARTICLESPELLING0',18)=0 THEN
  R:=224;
IF STR_compare(name,length,'TPARTICLE1',10)=0 THEN
  R:=225;
IF STR_compare(name,length,'TAKTACTIVITY1',13)=0 THEN
  R:=226;
IF STR_compare(name,length,'TAKTACTIVITY2',13)=0 THEN
  R:=227;
IF STR_compare(name,length,'TAKTACTIVITY3',13)=0 THEN
  R:=228;
IF STR_compare(name,length,'TAKTACTIVITY4',13)=0 THEN
  R:=229;
IF STR_compare(name,length,'TAKTACTIVITY5',13)=0 THEN
  R:=230;
IF STR_compare(name,length,'TAKTACTIVITY6',13)=0 THEN
  R:=231;
IF STR_compare(name,length,'TAKTACCOMPLISHMENT1',19)=0 THEN
  R:=232;
IF STR_compare(name,length,'TAKTACCOMPLISHMENT2',19)=0 THEN
  R:=233;
IF STR_compare(name,length,'TAKTACCOMPLISHMENT3',19)=0 THEN
  R:=234;
IF STR_compare(name,length,'TAKTACHIEVEMENT1',16)=0 THEN
  R:=235;
IF STR_compare(name,length,'TAKTSTATIVE1',12)=0 THEN
  R:=236;
IF STR_compare(name,length,'TFINITE',7)=0 THEN
  R:=237;
IF STR_compare(name,length,'TINFINITE',9)=0 THEN
  R:=238;
IF STR_compare(name,length,'TASPECTNEUTRALIZATION',21)=0 THEN
  R:=239;
IF STR_compare(name,length,'TRETRONEUTRALIZATION',20)=0 THEN
  R:=240;
IF STR_compare(name,length,'TLANGDELETION',13)=0 THEN
  R:=241;
IF STR_compare(name,length,'TTEMPCONJSENTADAPTATION',23)=0 THEN
  R:=242;
IF STR_compare(name,length,'TTEMPCONJSENTMOVETORIGHT',24)=0 THEN
  R:=243;
IF STR_compare(name,length,'RVERBPATTERN4',13)=0 THEN
  R:=244;
IF STR_compare(name,length,'RVERBPATTERN4P2',15)=0 THEN
  R:=245;
IF STR_compare(name,length,'TNOC5',5)=0 THEN
  R:=246;
IF STR_compare(name,length,'TNOC6',5)=0 THEN
  R:=247;
IF STR_compare(name,length,'TNOC7',5)=0 THEN
  R:=248;
IF STR_compare(name,length,'TNOC8',5)=0 THEN
  R:=249;
IF STR_compare(name,length,'TNOC9',5)=0 THEN
  R:=250;
IF STR_compare(name,length,'TNOSUPERDEIXISADAPTATION',24)=0 THEN
  R:=251;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION1',23)=0 THEN
  R:=252;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION2',23)=0 THEN
  R:=253;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION5',23)=0 THEN
  R:=254;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION8',23)=0 THEN
  R:=255;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION10',24)=0 THEN
  R:=256;
IF STR_compare(name,length,'TDEIXISRETROADAPTATION1',23)=0 THEN
  R:=257;
IF STR_compare(name,length,'TGEWEESTTOZIJND',15)=0 THEN
  R:=258;
IF STR_compare(name,length,'TDEIXISPRESINFADAPTATION1',25)=0 THEN
  R:=259;
IF STR_compare(name,length,'TDEIXISPRESINFADAPTATION2',25)=0 THEN
  R:=260;
IF STR_compare(name,length,'TDEIXISPRESINFADAPTATION3',25)=0 THEN
  R:=261;
IF STR_compare(name,length,'TPASSIVEGEWORDENDELETION',24)=0 THEN
  R:=262;
IF STR_compare(name,length,'TREFDELETION',12)=0 THEN
  R:=263;
IF STR_compare(name,length,'TRETRODELETION',14)=0 THEN
  R:=264;
IF STR_compare(name,length,'TADJAKTSTATIVE1',15)=0 THEN
  R:=265;
IF STR_compare(name,length,'TADJASPECTNEUTRALIZATION',24)=0 THEN
  R:=266;
IF STR_compare(name,length,'TADJRETRONEUTRALIZATION',23)=0 THEN
  R:=267;
IF STR_compare(name,length,'TADJDEIXISPRESADAPTATION',24)=0 THEN
  R:=268;
IF STR_compare(name,length,'TADJDEIXISPASTADAPTATION',24)=0 THEN
  R:=269;
IF STR_compare(name,length,'TADJSUPERDEIXISADAPTATION1',26)=0 THEN
  R:=270;
IF STR_compare(name,length,'TADJNOSUPERDEIXISADAPTATION',27)=0 THEN
  R:=271;
IF STR_compare(name,length,'TADJSUPERDEIXISADAPTATION2',26)=0 THEN
  R:=272;
IF STR_compare(name,length,'TPREPPATTERN0',13)=0 THEN
  R:=273;
IF STR_compare(name,length,'TIDPREPPATTERN1',15)=0 THEN
  R:=274;
IF STR_compare(name,length,'TPREPPATTERN1A',14)=0 THEN
  R:=275;
IF STR_compare(name,length,'TPREPPATTERN1B',14)=0 THEN
  R:=276;
IF STR_compare(name,length,'TPPCA0',6)=0 THEN
  R:=277;
IF STR_compare(name,length,'TPPCA1',6)=0 THEN
  R:=278;
IF STR_compare(name,length,'THETTOER1',9)=0 THEN
  R:=279;
IF STR_compare(name,length,'TIDHETTOER1',11)=0 THEN
  R:=280;
IF STR_compare(name,length,'THETTOER0',9)=0 THEN
  R:=281;
IF STR_compare(name,length,'THETTOER2',9)=0 THEN
  R:=282;
IF STR_compare(name,length,'TIDHETTOER2',11)=0 THEN
  R:=283;
IF STR_compare(name,length,'TPPPPROSUBJECT',14)=0 THEN
  R:=284;
IF STR_compare(name,length,'TPPPASPECTNEUTRALIZATION',24)=0 THEN
  R:=285;
IF STR_compare(name,length,'TWHSHIFT1A',10)=0 THEN
  R:=286;
IF STR_compare(name,length,'TWHSHIFT1B',10)=0 THEN
  R:=287;
IF STR_compare(name,length,'TWHSHIFT0',9)=0 THEN
  R:=288;
IF STR_compare(name,length,'TWHSHIFT2',9)=0 THEN
  R:=289;
IF STR_compare(name,length,'TERXDELETION1',13)=0 THEN
  R:=290;
IF STR_compare(name,length,'TPPTOERPOS1',11)=0 THEN
  R:=291;
IF STR_compare(name,length,'TERTOERPOS1',11)=0 THEN
  R:=292;
IF STR_compare(name,length,'TERTOERPOS2',11)=0 THEN
  R:=293;
IF STR_compare(name,length,'TADJHETTOER1',12)=0 THEN
  R:=294;
IF STR_compare(name,length,'TADJHETTOER2',12)=0 THEN
  R:=295;
IF STR_compare(name,length,'TADJERTOERPOS1',14)=0 THEN
  R:=296;
IF STR_compare(name,length,'TERPGLUE',8)=0 THEN
  R:=297;
IF STR_compare(name,length,'TTOER1',6)=0 THEN
  R:=298;
IF STR_compare(name,length,'TTOER2',6)=0 THEN
  R:=299;
IF STR_compare(name,length,'TERQER1',7)=0 THEN
  R:=300;
IF STR_compare(name,length,'TERQER2',7)=0 THEN
  R:=301;
IF STR_compare(name,length,'TERQER3',7)=0 THEN
  R:=302;
IF STR_compare(name,length,'TERQER4',7)=0 THEN
  R:=303;
IF STR_compare(name,length,'TERQER0',7)=0 THEN
  R:=304;
IF STR_compare(name,length,'TERXINS1',8)=0 THEN
  R:=305;
IF STR_compare(name,length,'TERXINS0',8)=0 THEN
  R:=306;
IF STR_compare(name,length,'TECDEL',6)=0 THEN
  R:=307;
IF STR_compare(name,length,'TERZICH1',8)=0 THEN
  R:=308;
IF STR_compare(name,length,'TERZICH2',8)=0 THEN
  R:=309;
IF STR_compare(name,length,'TERZICH0',8)=0 THEN
  R:=310;
IF STR_compare(name,length,'TNEGADAPT1',10)=0 THEN
  R:=311;
IF STR_compare(name,length,'TNEGADAPT2',10)=0 THEN
  R:=312;
IF STR_compare(name,length,'TNEGADAPT3',10)=0 THEN
  R:=313;
IF STR_compare(name,length,'TNEGADAPT4',10)=0 THEN
  R:=314;
IF STR_compare(name,length,'TPPPREPPATTERN0',15)=0 THEN
  R:=315;
IF STR_compare(name,length,'TIDPPPREPPATTERN',16)=0 THEN
  R:=316;
IF STR_compare(name,length,'TPPPREPPATTERN1A',16)=0 THEN
  R:=317;
IF STR_compare(name,length,'TPPPREPPATTERN1B',16)=0 THEN
  R:=318;
IF STR_compare(name,length,'TPREPPCA0',9)=0 THEN
  R:=319;
IF STR_compare(name,length,'TPREPPCA1',9)=0 THEN
  R:=320;
IF STR_compare(name,length,'TPPHETTOER1',11)=0 THEN
  R:=321;
IF STR_compare(name,length,'TIDPPHETTOER1',13)=0 THEN
  R:=322;
IF STR_compare(name,length,'TPPHETTOER0',11)=0 THEN
  R:=323;
IF STR_compare(name,length,'TPPHETTOER2',11)=0 THEN
  R:=324;
IF STR_compare(name,length,'TIDPPHETTOER2',13)=0 THEN
  R:=325;
IF STR_compare(name,length,'TPPTOVARPP0',11)=0 THEN
  R:=326;
IF STR_compare(name,length,'TPPTOVARPP1',11)=0 THEN
  R:=327;
IF STR_compare(name,length,'TCONJDEL0',9)=0 THEN
  R:=328;
IF STR_compare(name,length,'TCONJDEL1',9)=0 THEN
  R:=329;
IF STR_compare(name,length,'TCONJDEL2',9)=0 THEN
  R:=330;
IF STR_compare(name,length,'TTEMPADVCHECK',13)=0 THEN
  R:=331;
IF STR_compare(name,length,'TNOADVVARS',10)=0 THEN
  R:=332;
IF STR_compare(name,length,'TNOERORVR',9)=0 THEN
  R:=333;
IF STR_compare(name,length,'TTEMPADVRELPRES',15)=0 THEN
  R:=334;
IF STR_compare(name,length,'TSUPERDEIXISOK',14)=0 THEN
  R:=335;
IF STR_compare(name,length,'TNOPASSORBYOBJ',14)=0 THEN
  R:=336;
IF STR_compare(name,length,'TNOAUXORPASS',12)=0 THEN
  R:=337;
IF STR_compare(name,length,'TADVPADVPATTERN0',16)=0 THEN
  R:=338;
IF STR_compare(name,length,'TADVPADVPATTERN1A',17)=0 THEN
  R:=339;
IF STR_compare(name,length,'TADVPADVPATTERN1B',17)=0 THEN
  R:=340;
IF STR_compare(name,length,'TADVPADVPATTERN1C',17)=0 THEN
  R:=341;
IF STR_compare(name,length,'TADVPNOMCASEASSIGNMENT',22)=0 THEN
  R:=342;
IF STR_compare(name,length,'TADVPATTERN0',12)=0 THEN
  R:=343;
IF STR_compare(name,length,'TADVPATTERN1',12)=0 THEN
  R:=344;
IF STR_compare(name,length,'TADVASPECTNEUTRALISATION',24)=0 THEN
  R:=345;
IF STR_compare(name,length,'TADVPPPROSUBJECT',16)=0 THEN
  R:=346;
IF STR_compare(name,length,'TADVMEERTOER',12)=0 THEN
  R:=347;
IF STR_compare(name,length,'TADVMEERNOTTOER',15)=0 THEN
  R:=348;
IF STR_compare(name,length,'TADVNOERNOMEER',14)=0 THEN
  R:=349;
IF STR_compare(name,length,'TADVMEESTTOST2',14)=0 THEN
  R:=350;
IF STR_compare(name,length,'TADVMEESTNOTTOST',16)=0 THEN
  R:=351;
IF STR_compare(name,length,'TADVNOSTNOMEEST',15)=0 THEN
  R:=352;
IF STR_compare(name,length,'TADVALSINTRO',12)=0 THEN
  R:=353;
IF STR_compare(name,length,'THETCLPLACEMENT1',16)=0 THEN
  R:=354;
IF STR_compare(name,length,'THETCLPLACEMENT2',16)=0 THEN
  R:=355;
IF STR_compare(name,length,'THETCLPLACEMENT0',16)=0 THEN
  R:=356;
IF STR_compare(name,length,'TINDOBJTOCL1',12)=0 THEN
  R:=357;
IF STR_compare(name,length,'TINDOBJTOCL0',12)=0 THEN
  R:=358;
IF STR_compare(name,length,'TOBJTOCL1',9)=0 THEN
  R:=359;
IF STR_compare(name,length,'TPREDTOCL1',10)=0 THEN
  R:=360;
IF STR_compare(name,length,'TOBJTOCL0',9)=0 THEN
  R:=361;
IF STR_compare(name,length,'TCLITICSPEED',12)=0 THEN
  R:=362;
IF STR_compare(name,length,'TADJHETCLPLACEMENT1',19)=0 THEN
  R:=363;
IF STR_compare(name,length,'TADJINDOBJTOCL1',15)=0 THEN
  R:=364;
IF STR_compare(name,length,'TADJOBJTOCL1',12)=0 THEN
  R:=365;
IF STR_compare(name,length,'RVERBPATTERN9',13)=0 THEN
  R:=366;
IF STR_compare(name,length,'RVERBPATTERN10',14)=0 THEN
  R:=367;
IF STR_compare(name,length,'RVERBPATTERN11',14)=0 THEN
  R:=368;
IF STR_compare(name,length,'RVERBPATTERN12',14)=0 THEN
  R:=369;
IF STR_compare(name,length,'RVERBPATTERN13',14)=0 THEN
  R:=370;
IF STR_compare(name,length,'RVERBPATTERN15',14)=0 THEN
  R:=371;
IF STR_compare(name,length,'TVPHETTOER1',11)=0 THEN
  R:=372;
IF STR_compare(name,length,'TVPHETTOER2',11)=0 THEN
  R:=373;
IF STR_compare(name,length,'TSHETTOER1',10)=0 THEN
  R:=374;
IF STR_compare(name,length,'TSHETTOER2',10)=0 THEN
  R:=375;
IF STR_compare(name,length,'TERQ1',5)=0 THEN
  R:=376;
IF STR_compare(name,length,'TERQ2',5)=0 THEN
  R:=377;
IF STR_compare(name,length,'TERQ3',5)=0 THEN
  R:=378;
IF STR_compare(name,length,'TARGRTORPOS1',12)=0 THEN
  R:=379;
IF STR_compare(name,length,'TARGRTORPOS2',12)=0 THEN
  R:=380;
IF STR_compare(name,length,'TARGRTORPOS0',12)=0 THEN
  R:=381;
IF STR_compare(name,length,'TADVRTORPOS1',12)=0 THEN
  R:=382;
IF STR_compare(name,length,'TADVRTORPOS0',12)=0 THEN
  R:=383;
IF STR_compare(name,length,'TADVRTORPOS2',12)=0 THEN
  R:=384;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION3',23)=0 THEN
  R:=385;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION4',23)=0 THEN
  R:=386;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION6',23)=0 THEN
  R:=387;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION7',23)=0 THEN
  R:=388;
IF STR_compare(name,length,'TIDSUPERDEIXISADAPTATION',24)=0 THEN
  R:=389;
IF STR_compare(name,length,'TSUPERDEIXISADAPTATION9',23)=0 THEN
  R:=390;
IF STR_compare(name,length,'TVARPPMOODADAPT1',16)=0 THEN
  R:=391;
IF STR_compare(name,length,'TPOSTPREPOK1',12)=0 THEN
  R:=392;
IF STR_compare(name,length,'TPOSTPREPOK0',12)=0 THEN
  R:=393;
IF STR_compare(name,length,'TIDCLAUSETOVPPROP',17)=0 THEN
  R:=394;
IF STR_compare(name,length,'TIDVPPROPTOCLAUSE',17)=0 THEN
  R:=395;
IF STR_compare(name,length,'TIDPPSUPERDEIXIS',16)=0 THEN
  R:=396;
IF STR_compare(name,length,'TISIDIOM',8)=0 THEN
  R:=397;
IF STR_compare(name,length,'TISPPIDIOM',10)=0 THEN
  R:=398;
IF STR_compare(name,length,'TISPPFORMIDIOM',14)=0 THEN
  R:=399;
IF STR_compare(name,length,'TISNOTIDIOM',11)=0 THEN
  R:=400;
IF STR_compare(name,length,'TISNOTPPIDIOM',13)=0 THEN
  R:=401;
IF STR_compare(name,length,'TISNOTPPFORMIDIOM',17)=0 THEN
  R:=402;
IF STR_compare(name,length,'TIDCASEASSIGNMENT',17)=0 THEN
  R:=403;
IF STR_compare(name,length,'TSUBSTSPEED',11)=0 THEN
  R:=404;
IF STR_compare(name,length,'TEXTRAPOSANDNOVR',16)=0 THEN
  R:=405;
IF STR_compare(name,length,'TNOEXTRAPOS',11)=0 THEN
  R:=406;
IF STR_compare(name,length,'TZIJNDDEL',9)=0 THEN
  R:=407;
IF STR_compare(name,length,'TFINCONTROL1',12)=0 THEN
  R:=408;
IF STR_compare(name,length,'TFINCONTROL0',12)=0 THEN
  R:=409;
IF STR_compare(name,length,'TADVCONTROL1',12)=0 THEN
  R:=410;
IF STR_compare(name,length,'TADVCONTROL2',12)=0 THEN
  R:=411;
IF STR_compare(name,length,'TINFRELCONTROL',14)=0 THEN
  R:=412;
IF STR_compare(name,length,'TSADJCOMPLEXTRAPOS',18)=0 THEN
  R:=413;
IF STR_compare(name,length,'TSADJEXTRAPOS1',14)=0 THEN
  R:=414;
IF STR_compare(name,length,'TSADJEXTRAPOS2',14)=0 THEN
  R:=415;
IF STR_compare(name,length,'TSADJCA1',8)=0 THEN
  R:=416;
IF STR_compare(name,length,'TSADJCA2',8)=0 THEN
  R:=417;
IF STR_compare(name,length,'TSADJMEERTOER',13)=0 THEN
  R:=418;
IF STR_compare(name,length,'TSADJMEERNOTTOER',16)=0 THEN
  R:=419;
IF STR_compare(name,length,'TSADJNOMEERNOMEEST',18)=0 THEN
  R:=420;
IF STR_compare(name,length,'TSADJMEESTTOST2',15)=0 THEN
  R:=421;
IF STR_compare(name,length,'TSADJMEESTNOTTOST',17)=0 THEN
  R:=422;
IF STR_compare(name,length,'TMEERTOERDEFAULT',16)=0 THEN
  R:=423;
IF STR_compare(name,length,'TTHANPEXTRA1',12)=0 THEN
  R:=424;
IF STR_compare(name,length,'TPOPLDLCOMMA',12)=0 THEN
  R:=425;
IF STR_compare(name,length,'TDATDELETION',12)=0 THEN
  R:=426;
IF STR_compare(name,length,'TRINPPGLUE',10)=0 THEN
  R:=427;
IF STR_compare(name,length,'TPURPOSEADVERBIAL',17)=0 THEN
  R:=428;
IF STR_compare(name,length,'TSTOCVPP',8)=0 THEN
  R:=429;
IF STR_compare(name,length,'THETACIADAPT',12)=0 THEN
  R:=430;
IF STR_compare(name,length,'TNOVPADVS',9)=0 THEN
  R:=431;
IF STR_compare(name,length,'TSUITNP1',8)=0 THEN
  R:=432;
IF STR_compare(name,length,'TSUITNP2',8)=0 THEN
  R:=433;
IF STR_compare(name,length,'TADJPEXTRA1',11)=0 THEN
  R:=434;
IF STR_compare(name,length,'TARGREFLSPELLING11',18)=0 THEN
  R:=435;
IF STR_compare(name,length,'TPREPNPARTICLEINTRO1',20)=0 THEN
  R:=436;
IF STR_compare(name,length,'TNPARTICLEINTRO2',16)=0 THEN
  R:=437;
IF STR_compare(name,length,'TNPPNOPROSUBJECT',16)=0 THEN
  R:=438;
IF STR_compare(name,length,'TNPPPROSUBJECT',14)=0 THEN
  R:=439;
IF STR_compare(name,length,'TCNNOUNPOSS',11)=0 THEN
  R:=440;
IF STR_compare(name,length,'TNPPOSTOPOSTMOD',15)=0 THEN
  R:=441;
IF STR_compare(name,length,'FNOPREADV',9)=0 THEN
  R:=442;
IF STR_compare(name,length,'FPREPPOVERV',11)=0 THEN
  R:=443;
IF STR_compare(name,length,'FPREGAANDELETION',16)=0 THEN
  R:=444;
IF STR_compare(name,length,'FZOUINSERTION',13)=0 THEN
  R:=445;
IF STR_compare(name,length,'PFPREWILINSERTION',17)=0 THEN
  R:=446;
IF STR_compare(name,length,'FPRECASEASSIGNMENT1',19)=0 THEN
  R:=447;
IF STR_compare(name,length,'FPRECASEASSIGNMENT2',19)=0 THEN
  R:=448;
IF STR_compare(name,length,'FPRECASEASSIGNMENT3',19)=0 THEN
  R:=449;
IF STR_compare(name,length,'FPRECASEASSIGNMENT4',19)=0 THEN
  R:=450;
IF STR_compare(name,length,'FPOSTCASEASSIGNMENT1',20)=0 THEN
  R:=451;
IF STR_compare(name,length,'FPOSTCASEASSIGNMENT3',20)=0 THEN
  R:=452;
IF STR_compare(name,length,'FPOSTCASEASSIGNMENT4',20)=0 THEN
  R:=453;
IF STR_compare(name,length,'FPRECA1A',8)=0 THEN
  R:=454;
IF STR_compare(name,length,'FHATOA1',7)=0 THEN
  R:=455;
IF STR_compare(name,length,'FPREAUX',7)=0 THEN
  R:=456;
IF STR_compare(name,length,'FPOSTSUBJFORMATION1',19)=0 THEN
  R:=457;
IF STR_compare(name,length,'FNOARGS',7)=0 THEN
  R:=458;
IF STR_compare(name,length,'FPOSTADJQPHOPPING',17)=0 THEN
  R:=459;
IF STR_compare(name,length,'FPOSTADVQPHOPPING',17)=0 THEN
  R:=460;
IF STR_compare(name,length,'FADJPRESENTENCESUBST',20)=0 THEN
  R:=461;
IF STR_compare(name,length,'FADJPRESUBST',12)=0 THEN
  R:=462;
IF STR_compare(name,length,'FADJPOSTCASEASSIGNMENT1',23)=0 THEN
  R:=463;
IF STR_compare(name,length,'FADJPOSTCASEASSIGNMENT2',23)=0 THEN
  R:=464;
IF STR_compare(name,length,'FADJPOSTCASEASSIGNMENT3',23)=0 THEN
  R:=465;
IF STR_compare(name,length,'FADJPRECASEASSIGNMENT1',22)=0 THEN
  R:=466;
IF STR_compare(name,length,'FADJPRECASEASSIGNMENT2',22)=0 THEN
  R:=467;
IF STR_compare(name,length,'FADJPRECASEASSIGNMENT3',22)=0 THEN
  R:=468;
IF STR_compare(name,length,'FADJPOSTSENTEXTRAPOS',20)=0 THEN
  R:=469;
IF STR_compare(name,length,'FADJPRESENTEXTRAPOS',19)=0 THEN
  R:=470;
IF STR_compare(name,length,'FADJPOSTCOMPLEXTRAPOS',21)=0 THEN
  R:=471;
IF STR_compare(name,length,'FADJPRECOMPLEXTRAPOS',20)=0 THEN
  R:=472;
IF STR_compare(name,length,'FPREADJPREPPEXTRAPOS2',21)=0 THEN
  R:=473;
IF STR_compare(name,length,'FPOSTUNITNP',11)=0 THEN
  R:=474;
IF STR_compare(name,length,'FPOSTNPADJQPCOMPLEXTRAPOS1',26)=0 THEN
  R:=475;
IF STR_compare(name,length,'FPRENPADJQPCOMPLEXTRAPOS1',25)=0 THEN
  R:=476;
IF STR_compare(name,length,'FPOSTNPNOTOOMEGA1',17)=0 THEN
  R:=477;
IF STR_compare(name,length,'FPOSTNPNOTOOMEGA2',17)=0 THEN
  R:=478;
IF STR_compare(name,length,'FPRENPQPCOMPLEXTRAPOS',21)=0 THEN
  R:=479;
IF STR_compare(name,length,'FPOSTNPQPCOMPLEXTRAPOS',22)=0 THEN
  R:=480;
IF STR_compare(name,length,'FNPPOSTENDELETION',17)=0 THEN
  R:=481;
IF STR_compare(name,length,'FNPPREENDELETION',16)=0 THEN
  R:=482;
IF STR_compare(name,length,'FPOSTNPCNDELETION1',18)=0 THEN
  R:=483;
IF STR_compare(name,length,'FPOSTNPCNDELETION2',18)=0 THEN
  R:=484;
IF STR_compare(name,length,'FTEMPADJCHECK',13)=0 THEN
  R:=485;
IF STR_compare(name,length,'FADJPREHETSUBST',15)=0 THEN
  R:=486;
IF STR_compare(name,length,'FADJALSINTRO',12)=0 THEN
  R:=487;
IF STR_compare(name,length,'FBTB1',5)=0 THEN
  R:=488;
IF STR_compare(name,length,'FARGREFLSPELLING1',17)=0 THEN
  R:=489;
IF STR_compare(name,length,'FPREARGREFL',11)=0 THEN
  R:=490;
IF STR_compare(name,length,'FPOSSADJSPELLING1',17)=0 THEN
  R:=491;
IF STR_compare(name,length,'FPOSSADJSPELLING2',17)=0 THEN
  R:=492;
IF STR_compare(name,length,'FRETRONEUTRALIZATION',20)=0 THEN
  R:=493;
IF STR_compare(name,length,'FPRERETRONEUTRALIZATION',23)=0 THEN
  R:=494;
IF STR_compare(name,length,'FLANGDELETION',13)=0 THEN
  R:=495;
IF STR_compare(name,length,'FPRELANGDELETION',16)=0 THEN
  R:=496;
IF STR_compare(name,length,'FPOSTTEMPCONJSENTADAPTATION',27)=0 THEN
  R:=497;
IF STR_compare(name,length,'FPRETEMPCONJSENTADAPTATION',26)=0 THEN
  R:=498;
IF STR_compare(name,length,'FPRETEMPCONJSENTMOVETORIGHT',27)=0 THEN
  R:=499;
IF STR_compare(name,length,'FPRETEMPCONJSENTMOVETOLEFT',26)=0 THEN
  R:=500;
IF STR_compare(name,length,'FSUPERDEIXISADAPTATION8',23)=0 THEN
  R:=501;
IF STR_compare(name,length,'FTEMPINDEP1',11)=0 THEN
  R:=502;
IF STR_compare(name,length,'FSUPERDEIXISADAPTATION10',24)=0 THEN
  R:=503;
IF STR_compare(name,length,'FDEIXISRETROADAPTATION1',23)=0 THEN
  R:=504;
IF STR_compare(name,length,'FPREDEIXISRETRO',15)=0 THEN
  R:=505;
IF STR_compare(name,length,'FGEWEESTTOZIJND',15)=0 THEN
  R:=506;
IF STR_compare(name,length,'FPASSIVEGEWORDENDELETION',24)=0 THEN
  R:=507;
IF STR_compare(name,length,'FREFDELETION',12)=0 THEN
  R:=508;
IF STR_compare(name,length,'FRETRODELETION',14)=0 THEN
  R:=509;
IF STR_compare(name,length,'FPRERETRODELETION',17)=0 THEN
  R:=510;
IF STR_compare(name,length,'FADJSUPERDEIXISADAPTATION2',26)=0 THEN
  R:=511;
IF STR_compare(name,length,'FPPPTEPREP',10)=0 THEN
  R:=512;
IF STR_compare(name,length,'FPPPPREPROSUBJECT',17)=0 THEN
  R:=513;
IF STR_compare(name,length,'FPPPER',6)=0 THEN
  R:=514;
IF STR_compare(name,length,'FERTOERPOS12',12)=0 THEN
  R:=515;
IF STR_compare(name,length,'PFPREERTOERPOS',14)=0 THEN
  R:=516;
IF STR_compare(name,length,'FADJHETTOER12',13)=0 THEN
  R:=517;
IF STR_compare(name,length,'FADJERTOERPOS12',15)=0 THEN
  R:=518;
IF STR_compare(name,length,'FERPGLUE',8)=0 THEN
  R:=519;
IF STR_compare(name,length,'FPREERPGLUE',11)=0 THEN
  R:=520;
IF STR_compare(name,length,'FTOER12',7)=0 THEN
  R:=521;
IF STR_compare(name,length,'NEGADAPTFILTER',14)=0 THEN
  R:=522;
IF STR_compare(name,length,'FNEGSPEED',9)=0 THEN
  R:=523;
IF STR_compare(name,length,'FPPTEPREP',9)=0 THEN
  R:=524;
IF STR_compare(name,length,'FVRCOMPL',8)=0 THEN
  R:=525;
IF STR_compare(name,length,'FPREPROPSUBST',13)=0 THEN
  R:=526;
IF STR_compare(name,length,'FPREPROSTATUS',13)=0 THEN
  R:=527;
IF STR_compare(name,length,'FNOR',4)=0 THEN
  R:=528;
IF STR_compare(name,length,'FNOSHIFT',8)=0 THEN
  R:=529;
IF STR_compare(name,length,'FNOCLITICS',10)=0 THEN
  R:=530;
IF STR_compare(name,length,'PFSHIFTCHECK',12)=0 THEN
  R:=531;
IF STR_compare(name,length,'FPRESUBJSHIFT',13)=0 THEN
  R:=532;
IF STR_compare(name,length,'FREMOVESPEED1',13)=0 THEN
  R:=533;
IF STR_compare(name,length,'FADVPPPREPROSUBJECT',19)=0 THEN
  R:=534;
IF STR_compare(name,length,'FPREADVALSINTRO',15)=0 THEN
  R:=535;
IF STR_compare(name,length,'FPRECOORDINTRO',14)=0 THEN
  R:=536;
IF STR_compare(name,length,'FVPHETTOER12',12)=0 THEN
  R:=537;
IF STR_compare(name,length,'FSHETTOER12',11)=0 THEN
  R:=538;
IF STR_compare(name,length,'FPREHETTOER',11)=0 THEN
  R:=539;
IF STR_compare(name,length,'FERQ',4)=0 THEN
  R:=540;
IF STR_compare(name,length,'FPREERQ',7)=0 THEN
  R:=541;
IF STR_compare(name,length,'FPRERECIPRO1',12)=0 THEN
  R:=542;
IF STR_compare(name,length,'FNONEGORPOSVAR',14)=0 THEN
  R:=543;
IF STR_compare(name,length,'FSUPERDEIXISADAPTATION7',23)=0 THEN
  R:=544;
IF STR_compare(name,length,'FSUPERDEIXISADAPTATION9',23)=0 THEN
  R:=545;
IF STR_compare(name,length,'FTEMPINDEP2',11)=0 THEN
  R:=546;
IF STR_compare(name,length,'FNOTOPIC',8)=0 THEN
  R:=547;
IF STR_compare(name,length,'FVARPPMOODADAPT1',16)=0 THEN
  R:=548;
IF STR_compare(name,length,'FPREVARPPMOODADAPT',18)=0 THEN
  R:=549;
IF STR_compare(name,length,'FNOECNP',7)=0 THEN
  R:=550;
IF STR_compare(name,length,'FZIJNDDEL',9)=0 THEN
  R:=551;
IF STR_compare(name,length,'FADVCONTROL',11)=0 THEN
  R:=552;
IF STR_compare(name,length,'FPREADVCONTROL',14)=0 THEN
  R:=553;
IF STR_compare(name,length,'FINFRELCONTROL',14)=0 THEN
  R:=554;
IF STR_compare(name,length,'FPREINFRELCONTROL',17)=0 THEN
  R:=555;
IF STR_compare(name,length,'FSADJPOSTCOMPLEXTRAPOS',22)=0 THEN
  R:=556;
IF STR_compare(name,length,'FSADJPRECOMPLEXTRAPOS',21)=0 THEN
  R:=557;
IF STR_compare(name,length,'FSADJCA1',8)=0 THEN
  R:=558;
IF STR_compare(name,length,'FSADJCA2',8)=0 THEN
  R:=559;
IF STR_compare(name,length,'FPRESADJCA1',11)=0 THEN
  R:=560;
IF STR_compare(name,length,'FPRESADJCA2',11)=0 THEN
  R:=561;
IF STR_compare(name,length,'FPRETHANPEXTRA1',15)=0 THEN
  R:=562;
IF STR_compare(name,length,'FPOPLDLKOMMA',12)=0 THEN
  R:=563;
IF STR_compare(name,length,'FPREPOPLDL',10)=0 THEN
  R:=564;
IF STR_compare(name,length,'FRINPPGLUE',10)=0 THEN
  R:=565;
IF STR_compare(name,length,'FPURPOSEADVERBIAL',17)=0 THEN
  R:=566;
IF STR_compare(name,length,'FPREPURPOSEADVERBIAL',20)=0 THEN
  R:=567;
IF STR_compare(name,length,'FSTOCVPP',8)=0 THEN
  R:=568;
IF STR_compare(name,length,'FPRESTOCVPP',11)=0 THEN
  R:=569;
IF STR_compare(name,length,'FHETACIADAPT',12)=0 THEN
  R:=570;
IF STR_compare(name,length,'FNORELSENTREL',13)=0 THEN
  R:=571;
IF STR_compare(name,length,'FADJPEXTRA1',11)=0 THEN
  R:=572;
IF STR_compare(name,length,'FPREPREPNPARTICLEINTRO1',23)=0 THEN
  R:=573;
IF STR_compare(name,length,'FPRENPARTICLEINTRO2',19)=0 THEN
  R:=574;
IF STR_compare(name,length,'FHETDITDAT',10)=0 THEN
  R:=575;
IF STR_compare(name,length,'FCNNOUNPOSS',11)=0 THEN
  R:=576;
IF STR_compare(name,length,'FNPPOSTOPOSTMOD',15)=0 THEN
  R:=577;
IF STR_compare(name,length,'FPRENPASSIGNEFORM',17)=0 THEN
  R:=578;
IF STR_compare(name,length,'FPOSTNPASSIGNEFORM',18)=0 THEN
  R:=579;
END;
 PROCEDURE LDMrules_Rulename(sg:LDMrules_subgrammarindex;R:LDMrules_ruleindex;
VAR name:string;VAR length:INTEGER);
BEGIN
CASE R OF
1: BEGIN name:='ERRORRULE';
    length:=9 END;
2: BEGIN name:='RUTT1';
    length:=5 END;
3: BEGIN name:='RUTTNP';
    length:=6 END;
4: BEGIN name:='RUTTADVP';
    length:=8 END;
5: BEGIN name:='RUTTPREPP';
    length:=9 END;
6: BEGIN name:='RUTTADVPPROP';
    length:=12 END;
7: BEGIN name:='RUTTEXCLAM';
    length:=10 END;
8: BEGIN name:='RADDEXCLAM';
    length:=10 END;
9: BEGIN name:='RIDSUBSTITUTION2';
    length:=16 END;
10: BEGIN name:='RSUBSTITUTION1';
    length:=14 END;
11: BEGIN name:='RSUBSTITUTION2';
    length:=14 END;
12: BEGIN name:='RSUBSTITUTION3';
    length:=14 END;
13: BEGIN name:='RSUBSTITUTION3A';
    length:=15 END;
14: BEGIN name:='RSUBSTITUTION4';
    length:=14 END;
15: BEGIN name:='RSUBSTITUTION4A';
    length:=15 END;
16: BEGIN name:='RSUBSTITUTION4B';
    length:=15 END;
17: BEGIN name:='RSUBSTITUTION5';
    length:=14 END;
18: BEGIN name:='RSUBSTITUTION6';
    length:=14 END;
19: BEGIN name:='RSUBSTITUTION8';
    length:=14 END;
20: BEGIN name:='RSUBSTITUTION9';
    length:=14 END;
21: BEGIN name:='RSUBSTITUTION10';
    length:=15 END;
22: BEGIN name:='RSUBSTITUTION11';
    length:=15 END;
23: BEGIN name:='RSUBSTITUTION12';
    length:=15 END;
24: BEGIN name:='RSUBSTITUTION13';
    length:=15 END;
25: BEGIN name:='RSUBSTITUTION14';
    length:=15 END;
26: BEGIN name:='RMOODDETERMINATION1';
    length:=19 END;
27: BEGIN name:='RMOOD2';
    length:=6 END;
28: BEGIN name:='RMOOD3';
    length:=6 END;
29: BEGIN name:='RMOOD4';
    length:=6 END;
30: BEGIN name:='RMOOD5';
    length:=6 END;
31: BEGIN name:='RMOOD6';
    length:=6 END;
32: BEGIN name:='RMOODINFREL';
    length:=11 END;
33: BEGIN name:='RWILINSERTION';
    length:=13 END;
34: BEGIN name:='REMPTYSUBSTITUTION1';
    length:=19 END;
35: BEGIN name:='REMPTYSUBSTITUTION2';
    length:=19 END;
36: BEGIN name:='REMPTYSUBSTITUTION3';
    length:=19 END;
37: BEGIN name:='REMPTYSUBSTITUTION4';
    length:=19 END;
38: BEGIN name:='REMPTYSUBSTITUTION5';
    length:=19 END;
39: BEGIN name:='RPREPEMPTYSUBST1';
    length:=16 END;
40: BEGIN name:='RPREPEMPTYSUBST2';
    length:=16 END;
41: BEGIN name:='RDIREMPTYSUBST1';
    length:=15 END;
42: BEGIN name:='RZEEMPTYSUBST';
    length:=13 END;
43: BEGIN name:='RIDEMPTYSUBSTITUTION1';
    length:=21 END;
44: BEGIN name:='RSADJEMPTYSUBST';
    length:=15 END;
45: BEGIN name:='RCLAUSEFORMATION1';
    length:=17 END;
46: BEGIN name:='RCLAUSEFORMATION2';
    length:=17 END;
47: BEGIN name:='RCLAUSEFORMATION3';
    length:=17 END;
48: BEGIN name:='RCLAUSEFORMATION4';
    length:=17 END;
49: BEGIN name:='RCLAUSEFORMATION5';
    length:=17 END;
50: BEGIN name:='RCLAUSEFORMATION6';
    length:=17 END;
51: BEGIN name:='RCLAUSEFORMATION7';
    length:=17 END;
52: BEGIN name:='ROPENADJPPROPSUBSTITUTION';
    length:=25 END;
53: BEGIN name:='RCLOSEDADJPPROPSUBSTITUTION';
    length:=27 END;
54: BEGIN name:='ROPENNPPROPSUBSTITUTION';
    length:=23 END;
55: BEGIN name:='RCLOSEDNPPROPSUBSTITUTION';
    length:=25 END;
56: BEGIN name:='RLOCOPENPREPPROPSUBSTITUTION';
    length:=28 END;
57: BEGIN name:='RLCPPPSUBST';
    length:=11 END;
58: BEGIN name:='RDIROPENPREPPROPSUBSTITUTION';
    length:=28 END;
59: BEGIN name:='RDIRCLOSEDPREPPPROP';
    length:=19 END;
60: BEGIN name:='ROOPPPSUBST';
    length:=11 END;
61: BEGIN name:='ROCPPPSUBST';
    length:=11 END;
62: BEGIN name:='RPROPSUBST13';
    length:=12 END;
63: BEGIN name:='RCADVPPSUBST';
    length:=12 END;
64: BEGIN name:='ROADVPPSUBST';
    length:=12 END;
65: BEGIN name:='RCVPPSUBST';
    length:=10 END;
66: BEGIN name:='RSIDSTARTVPPROP120';
    length:=18 END;
67: BEGIN name:='RSIDSTARTVPPROP123';
    length:=18 END;
68: BEGIN name:='RSTARTVPPROP000';
    length:=15 END;
69: BEGIN name:='RSTARTVPPROP100';
    length:=15 END;
70: BEGIN name:='RSTARTVPPROP010A';
    length:=16 END;
71: BEGIN name:='RSTARTVERBPPROP010B';
    length:=19 END;
72: BEGIN name:='RSTARTVPPROP120';
    length:=15 END;
73: BEGIN name:='RSTARTVPPROP012';
    length:=15 END;
74: BEGIN name:='RSTARTVPPROP123';
    length:=15 END;
75: BEGIN name:='RADJVOOROBJMOD';
    length:=14 END;
76: BEGIN name:='RADJMOD1';
    length:=8 END;
77: BEGIN name:='RADJOMTEMOD1';
    length:=12 END;
78: BEGIN name:='RADJDEGREEMOD1';
    length:=14 END;
79: BEGIN name:='RADJDEGREEMOD2A';
    length:=15 END;
80: BEGIN name:='RADJDEGREEMOD2B';
    length:=15 END;
81: BEGIN name:='RBADJTOSUB1';
    length:=11 END;
82: BEGIN name:='RORDDERIV';
    length:=9 END;
83: BEGIN name:='RSTARTADJPPROPFORMATION000';
    length:=26 END;
84: BEGIN name:='RSTARTADJPPROP100';
    length:=17 END;
85: BEGIN name:='RSTARTADJPPROP120';
    length:=17 END;
86: BEGIN name:='RSTARTADJPPROP123';
    length:=17 END;
87: BEGIN name:='RSTARTADJPPROP012';
    length:=17 END;
88: BEGIN name:='RADJLOCADVPVAR';
    length:=14 END;
89: BEGIN name:='RADJLOCPREPPVAR';
    length:=15 END;
90: BEGIN name:='RADJCAUSADVPVAR';
    length:=15 END;
91: BEGIN name:='RADJCAUSPREPPVAR';
    length:=16 END;
92: BEGIN name:='RADJACTIVEVOICE';
    length:=15 END;
93: BEGIN name:='RADJVOICEDEFAULT';
    length:=16 END;
94: BEGIN name:='RADJSENTENCESUBSTITUTION1';
    length:=25 END;
95: BEGIN name:='RADJSENTENCESUBSTITUTION2';
    length:=25 END;
96: BEGIN name:='RADJSENTENCESUBSTITUTION3';
    length:=25 END;
97: BEGIN name:='RADJSENTENCEOMTECOMPL';
    length:=21 END;
98: BEGIN name:='RADJSENTENCEOMTESUBJ';
    length:=20 END;
99: BEGIN name:='RADJPFORMULAFORMATION1';
    length:=22 END;
100: BEGIN name:='RADJEMPTYSUBST1';
    length:=15 END;
101: BEGIN name:='RADJEMPTYSUBST2';
    length:=15 END;
102: BEGIN name:='RADJEMPTYSUBST3';
    length:=15 END;
103: BEGIN name:='RADJEMPTYSUBST4';
    length:=15 END;
104: BEGIN name:='DETDERIVATION1';
    length:=14 END;
105: BEGIN name:='DETPFORMATION1';
    length:=14 END;
106: BEGIN name:='DETPFORMATION2';
    length:=14 END;
107: BEGIN name:='RCARDTODETP';
    length:=11 END;
108: BEGIN name:='DETPFORMATION3';
    length:=14 END;
109: BEGIN name:='DETPFORMATION3A';
    length:=15 END;
110: BEGIN name:='DETPFORMATION4';
    length:=14 END;
111: BEGIN name:='RDETPPARTITIVEFORMATION';
    length:=23 END;
112: BEGIN name:='RDETPSUPERDEIXIS';
    length:=16 END;
113: BEGIN name:='RADVPAMOUNTMOD';
    length:=14 END;
114: BEGIN name:='RADVPOMCOMPLMOD';
    length:=15 END;
115: BEGIN name:='RQTOQP1';
    length:=7 END;
116: BEGIN name:='RQTOQP2';
    length:=7 END;
117: BEGIN name:='RQPCOMPARATIVECOMPLMOD';
    length:=22 END;
118: BEGIN name:='RQPSUPERLATIVECOMPLMOD';
    length:=22 END;
119: BEGIN name:='RQPAMOUNTMOD';
    length:=12 END;
120: BEGIN name:='RQPOMCOMPLMOD';
    length:=13 END;
121: BEGIN name:='RQPVOOROBJMOD';
    length:=13 END;
122: BEGIN name:='RQPSUPERDEIXIS';
    length:=14 END;
123: BEGIN name:='RQPSUBSTITUTION1';
    length:=16 END;
124: BEGIN name:='RQPSUBSTITUTION2';
    length:=16 END;
125: BEGIN name:='RNPFORMATION1';
    length:=13 END;
126: BEGIN name:='RNPFORMATION2';
    length:=13 END;
127: BEGIN name:='RNPFORMATION3';
    length:=13 END;
128: BEGIN name:='RNPFORMATION3A';
    length:=14 END;
129: BEGIN name:='RNPFORMATION4';
    length:=13 END;
130: BEGIN name:='RNPFORMATION4A';
    length:=14 END;
131: BEGIN name:='RNPFORMATION5';
    length:=13 END;
132: BEGIN name:='RNPFORMATION10';
    length:=14 END;
133: BEGIN name:='RNPFORMATION12';
    length:=14 END;
134: BEGIN name:='RNPPRESENTSUPERDEIXIS1';
    length:=22 END;
135: BEGIN name:='RNPPASTSUPERDEIXIS1';
    length:=19 END;
136: BEGIN name:='RNPPRESENTSUPERDEIXIS2';
    length:=22 END;
137: BEGIN name:='RNPPASTSUPERDEIXIS2';
    length:=19 END;
138: BEGIN name:='RNPINDEFMODPOSS';
    length:=15 END;
139: BEGIN name:='RNPWHMODPOSS';
    length:=12 END;
140: BEGIN name:='RNPPROPERNOUNMODPOSS';
    length:=20 END;
141: BEGIN name:='RNPMODADVP';
    length:=10 END;
142: BEGIN name:='RNPAPPOSITION';
    length:=13 END;
143: BEGIN name:='BNOUNTOSUBNOUN';
    length:=14 END;
144: BEGIN name:='RSUBNOUNTONOUN1';
    length:=15 END;
145: BEGIN name:='RSUBNOUNTONOUN2';
    length:=15 END;
146: BEGIN name:='RBPROPERNOUNTOPROPERNOUN';
    length:=24 END;
147: BEGIN name:='RBPROPERNOUNTOSUBNOUN';
    length:=21 END;
148: BEGIN name:='RBINDEFPROTOINDEFPRO';
    length:=20 END;
149: BEGIN name:='RBWHPROTOWHPRO';
    length:=14 END;
150: BEGIN name:='RBPERSPROTOPERSPRO';
    length:=18 END;
151: BEGIN name:='RCNFORMATION1';
    length:=13 END;
152: BEGIN name:='RCNFORMATION2';
    length:=13 END;
153: BEGIN name:='RCNFORMATION3';
    length:=13 END;
154: BEGIN name:='RCNFORMATION4';
    length:=13 END;
155: BEGIN name:='RCNPRESENTSUPERDEIXIS';
    length:=21 END;
156: BEGIN name:='RCNPASTSUPERDEIXIS';
    length:=18 END;
157: BEGIN name:='RCNMODADJP';
    length:=10 END;
158: BEGIN name:='RCNMODNUM';
    length:=9 END;
159: BEGIN name:='RCNMODPOSS1';
    length:=11 END;
160: BEGIN name:='RCNMODPOSS2';
    length:=11 END;
161: BEGIN name:='RCNMODPOSS3';
    length:=11 END;
162: BEGIN name:='RCNMODPP';
    length:=8 END;
163: BEGIN name:='RCNMODBARENP';
    length:=12 END;
164: BEGIN name:='RCNMODANTEREL1';
    length:=14 END;
165: BEGIN name:='RCNSPECPROPERNAME';
    length:=17 END;
166: BEGIN name:='RADJSUBSTITUTION1';
    length:=17 END;
167: BEGIN name:='RADJSUBSTITUTION2';
    length:=17 END;
168: BEGIN name:='RADJSUBSTITUTION3';
    length:=17 END;
169: BEGIN name:='RADJSUBSTITUTION4';
    length:=17 END;
170: BEGIN name:='RADJMOOD1';
    length:=9 END;
171: BEGIN name:='RADJMOOD2';
    length:=9 END;
172: BEGIN name:='RADJPUNC';
    length:=8 END;
173: BEGIN name:='RHELPEMPTYSUBJSUBST';
    length:=19 END;
174: BEGIN name:='RADJEMPTYSUBJSUBST';
    length:=18 END;
175: BEGIN name:='RLOCADVVAR';
    length:=10 END;
176: BEGIN name:='RLOCPREPPVAR';
    length:=12 END;
177: BEGIN name:='RSADVVAR';
    length:=8 END;
178: BEGIN name:='RSPREPPVAR';
    length:=10 END;
179: BEGIN name:='RVPPREPPVAR';
    length:=11 END;
180: BEGIN name:='CONJSVAR';
    length:=8 END;
181: BEGIN name:='RCONJSVAR2';
    length:=10 END;
182: BEGIN name:='RCONJSVAR3';
    length:=10 END;
183: BEGIN name:='RIDENTLOCADVVAR';
    length:=15 END;
184: BEGIN name:='REXISTLOCADVVAR';
    length:=15 END;
185: BEGIN name:='RPPPLOCADVVAR';
    length:=13 END;
186: BEGIN name:='RIDENTLOCPREPPVAR';
    length:=17 END;
187: BEGIN name:='REXISTLOCPREPPVAR';
    length:=17 END;
188: BEGIN name:='RPPPLOCPREPPVAR';
    length:=15 END;
189: BEGIN name:='RNPPLOCADVVAR';
    length:=13 END;
190: BEGIN name:='RNPPLOCPREPPVAR';
    length:=15 END;
191: BEGIN name:='RADVPPLOCADVVAR';
    length:=15 END;
192: BEGIN name:='RADVPPLOCPREPPVAR';
    length:=17 END;
193: BEGIN name:='RIDENTCONJSVAR';
    length:=14 END;
194: BEGIN name:='RIDENTCONJSVAR2';
    length:=15 END;
195: BEGIN name:='RIDENTCONJSVAR3';
    length:=15 END;
196: BEGIN name:='REXISTCONJSVAR';
    length:=14 END;
197: BEGIN name:='REXISTCONJSVAR2';
    length:=15 END;
198: BEGIN name:='REXISTCONJSVAR3';
    length:=15 END;
199: BEGIN name:='RNPPCONJSVAR';
    length:=12 END;
200: BEGIN name:='RNPPCONJSVAR2';
    length:=13 END;
201: BEGIN name:='RNPPCONJSVAR3';
    length:=13 END;
202: BEGIN name:='RPPPCONJSVAR';
    length:=12 END;
203: BEGIN name:='RPPPCONJSVAR2';
    length:=13 END;
204: BEGIN name:='RPPPCONJSVAR3';
    length:=13 END;
205: BEGIN name:='RADVPPCONJSVAR';
    length:=14 END;
206: BEGIN name:='RADVPPCONJSVAR2';
    length:=15 END;
207: BEGIN name:='RADVPPCONJSVAR3';
    length:=15 END;
208: BEGIN name:='RADJPPCONJSVAR';
    length:=14 END;
209: BEGIN name:='RADJPPCONJSVAR2';
    length:=15 END;
210: BEGIN name:='RADJPPCONJSVAR3';
    length:=15 END;
211: BEGIN name:='REXISTSADVVAR';
    length:=13 END;
212: BEGIN name:='REXISTSPREPPVAR';
    length:=15 END;
213: BEGIN name:='RIDENTSADVVAR';
    length:=13 END;
214: BEGIN name:='RIDENTSPREPPVAR';
    length:=15 END;
215: BEGIN name:='RNPPSADVVAR';
    length:=11 END;
216: BEGIN name:='RNPPSPREPPVAR';
    length:=13 END;
217: BEGIN name:='RADVPPSADVVAR';
    length:=13 END;
218: BEGIN name:='RADVPPSPREPPVAR';
    length:=15 END;
219: BEGIN name:='RPPPSADVVAR';
    length:=11 END;
220: BEGIN name:='RPPPSPREPPVAR';
    length:=13 END;
221: BEGIN name:='RACTIVE';
    length:=7 END;
222: BEGIN name:='RPASSIVE';
    length:=8 END;
223: BEGIN name:='RDOORACTIVE';
    length:=11 END;
224: BEGIN name:='RAANACTIVE';
    length:=10 END;
225: BEGIN name:='RSTARTEXISTENTIAL1';
    length:=18 END;
226: BEGIN name:='REXISTREFVARINSERTION';
    length:=21 END;
227: BEGIN name:='RIDENTFORMATION1';
    length:=16 END;
228: BEGIN name:='RIDENTFORMATION2';
    length:=16 END;
229: BEGIN name:='RIDENTFORMATION3';
    length:=16 END;
230: BEGIN name:='RIDENTFORMATION4';
    length:=16 END;
231: BEGIN name:='RIDENTFORMATION5';
    length:=16 END;
232: BEGIN name:='RIDENTFORMATION6';
    length:=16 END;
233: BEGIN name:='RIDENTREFVARINSERTION';
    length:=21 END;
234: BEGIN name:='RBVERBTOSUB';
    length:=11 END;
235: BEGIN name:='RNNCOMPOUNDS';
    length:=12 END;
236: BEGIN name:='RVNCOMPOUNDS';
    length:=12 END;
237: BEGIN name:='RNOUNDIM';
    length:=8 END;
238: BEGIN name:='RPNDIM';
    length:=6 END;
239: BEGIN name:='RASPECTIMPERFECTIVE';
    length:=19 END;
240: BEGIN name:='RASPECTPERFECTIVE';
    length:=17 END;
241: BEGIN name:='RASPECTHABITUAL';
    length:=15 END;
242: BEGIN name:='RREFVARINSERTION';
    length:=16 END;
243: BEGIN name:='RDURVARINSERTION';
    length:=16 END;
244: BEGIN name:='RRETROVARINSERTION';
    length:=18 END;
245: BEGIN name:='RFREQVARINSERTION';
    length:=17 END;
246: BEGIN name:='RTEMPADVSUBSTITUTION1';
    length:=21 END;
247: BEGIN name:='RTEMPADVSUBSTITUTION2';
    length:=21 END;
248: BEGIN name:='RFINPRESENTDEIXIS';
    length:=17 END;
249: BEGIN name:='RFINPASTDEIXIS';
    length:=14 END;
250: BEGIN name:='RFINPASTDEIXISSPEC';
    length:=18 END;
251: BEGIN name:='RFINPRESENTDEIXISA';
    length:=18 END;
252: BEGIN name:='RFINPASTDEIXISA';
    length:=15 END;
253: BEGIN name:='RFINPASTDEIXISSPECA';
    length:=19 END;
254: BEGIN name:='RTEMPCONJSENTMOVETOLEFT';
    length:=23 END;
255: BEGIN name:='RPROPSUBST14';
    length:=12 END;
256: BEGIN name:='RSENTENCECOMPL';
    length:=14 END;
257: BEGIN name:='RSENTENCEOMTECOMPL';
    length:=18 END;
258: BEGIN name:='ROPENADJPPROPPREPOBJ';
    length:=20 END;
259: BEGIN name:='RCLOSEDADJPPROPPREPOBJ';
    length:=22 END;
260: BEGIN name:='ROPENNPPROPPREPOBJ';
    length:=18 END;
261: BEGIN name:='RCLOSEDNPPROPPREPOBJ';
    length:=20 END;
262: BEGIN name:='RSENTENCEPREPOBJ';
    length:=16 END;
263: BEGIN name:='RSENTENCESUBJ';
    length:=13 END;
264: BEGIN name:='RSENTENCEEXTRAPOS';
    length:=17 END;
265: BEGIN name:='RSENTENCELDISLOC';
    length:=16 END;
266: BEGIN name:='RTEMPADVSENTSUBSTITUTION';
    length:=24 END;
267: BEGIN name:='RCONJSENTSUBST1';
    length:=15 END;
268: BEGIN name:='RSADJSENTSUBST';
    length:=14 END;
269: BEGIN name:='RCONJSENTSUBST2';
    length:=15 END;
270: BEGIN name:='RCONJSENTSUBST3';
    length:=15 END;
271: BEGIN name:='RCONJSENTSUBST4';
    length:=15 END;
272: BEGIN name:='RINFINPRESENTDEIXIS';
    length:=19 END;
273: BEGIN name:='RINFINPASTDEIXISSPEC';
    length:=20 END;
274: BEGIN name:='RIMPDEIXIS';
    length:=10 END;
275: BEGIN name:='RFINIRRMODALDEIXIS';
    length:=18 END;
276: BEGIN name:='RINFINPRESENTDEIXISA';
    length:=20 END;
277: BEGIN name:='RINFINPASTDEIXISSPECA';
    length:=21 END;
278: BEGIN name:='RFINPRESENTSUPERDEIXIS';
    length:=22 END;
279: BEGIN name:='RFINPASTSUPERDEIXIS1';
    length:=20 END;
280: BEGIN name:='RFINPASTSUPERDEIXIS2';
    length:=20 END;
281: BEGIN name:='RFINPRESENTSUPERDEIXISA';
    length:=23 END;
282: BEGIN name:='RFINPASTSUPERDEIXIS1A';
    length:=21 END;
283: BEGIN name:='RFINPASTSUPERDEIXIS2A';
    length:=21 END;
284: BEGIN name:='RINFINPRESENTSUPERDEIXISA';
    length:=25 END;
285: BEGIN name:='RINFINPASTSUPERDEIXISA';
    length:=22 END;
286: BEGIN name:='RINFINPASTSUPERDEIXISSPECA';
    length:=26 END;
287: BEGIN name:='RFINPASTSUPERDEIXISSPECA';
    length:=24 END;
288: BEGIN name:='RRETROIMPERFECTIVE';
    length:=18 END;
289: BEGIN name:='RRETROPERFECTIVE';
    length:=16 END;
290: BEGIN name:='RINFINPRESENTSUPERDEIXIS';
    length:=24 END;
291: BEGIN name:='RINFINPASTSUPERDEIXIS';
    length:=21 END;
292: BEGIN name:='RINFINPASTSUPERDEIXISSPEC';
    length:=25 END;
293: BEGIN name:='RFINIRRMODALSUPERDEIXIS';
    length:=23 END;
294: BEGIN name:='RFINPASTSUPERDEIXISSPEC';
    length:=23 END;
295: BEGIN name:='RADJREFVARINSERTION';
    length:=19 END;
296: BEGIN name:='RADJDURVARINSERTION';
    length:=19 END;
297: BEGIN name:='RADJRETROVARINSERTION';
    length:=21 END;
298: BEGIN name:='RADJASPECTIMPERFECTIVE';
    length:=22 END;
299: BEGIN name:='RADJRETROIMPERFECTIVE';
    length:=21 END;
300: BEGIN name:='RADJPRESENTDEIXIS';
    length:=17 END;
301: BEGIN name:='RADJPASTDEIXIS';
    length:=14 END;
302: BEGIN name:='RADJTEMPADVSUBSTITUTION1';
    length:=24 END;
303: BEGIN name:='RADJTEMPADVSUBSTITUTION2';
    length:=24 END;
304: BEGIN name:='RADJPRESENTSUPERDEIXIS';
    length:=22 END;
305: BEGIN name:='RADJPASTSUPERDEIXIS';
    length:=19 END;
306: BEGIN name:='RADJTEMPADVSENTSUBSTITUTION';
    length:=27 END;
307: BEGIN name:='RPREPTOSUB';
    length:=10 END;
308: BEGIN name:='RSTARTPREPPPROP000';
    length:=18 END;
309: BEGIN name:='RSTARTPREPPPROP100';
    length:=18 END;
310: BEGIN name:='RSTARTPREPPPROP120';
    length:=18 END;
311: BEGIN name:='RPPPREFVARINSERTION';
    length:=19 END;
312: BEGIN name:='RPPPDURVARINSERTION';
    length:=19 END;
313: BEGIN name:='RPPPRETROVARINSERTION';
    length:=21 END;
314: BEGIN name:='RPREPPPROPVOICE';
    length:=15 END;
315: BEGIN name:='RPPPNPMOD';
    length:=9 END;
316: BEGIN name:='RPPPADVPMOD';
    length:=11 END;
317: BEGIN name:='RPREPTOFORMULA';
    length:=14 END;
318: BEGIN name:='RPPPASPECTIMPERFECTIVE';
    length:=22 END;
319: BEGIN name:='RPPPSUPERDEIXIS';
    length:=15 END;
320: BEGIN name:='RPPPMOOD1';
    length:=9 END;
321: BEGIN name:='RPPPMOOD2';
    length:=9 END;
322: BEGIN name:='RPPPSUBSTITUTION1';
    length:=17 END;
323: BEGIN name:='RIDPPPSUBSTITUTION1';
    length:=19 END;
324: BEGIN name:='RPPPSUBSTITUTION2';
    length:=17 END;
325: BEGIN name:='RIDPPPSUBSTITUTION2';
    length:=19 END;
326: BEGIN name:='RPPPSUBSTITUTION3';
    length:=17 END;
327: BEGIN name:='RPPPSUBSTITUTION4';
    length:=17 END;
328: BEGIN name:='RPPPSUBSTITUTION5';
    length:=17 END;
329: BEGIN name:='RPPPNOPUNC';
    length:=10 END;
330: BEGIN name:='RMOODFINREL';
    length:=11 END;
331: BEGIN name:='RMOODFINWHMOD';
    length:=13 END;
332: BEGIN name:='RMOODOPENINF';
    length:=12 END;
333: BEGIN name:='RMOODCLOSEDINF';
    length:=14 END;
334: BEGIN name:='RMOOD7';
    length:=6 END;
335: BEGIN name:='RMOOD8';
    length:=6 END;
336: BEGIN name:='RMOODPOLITEIMP';
    length:=14 END;
337: BEGIN name:='RMOOD7S';
    length:=7 END;
338: BEGIN name:='RMOOD8S';
    length:=7 END;
339: BEGIN name:='RMOODPOLITEIMPS';
    length:=15 END;
340: BEGIN name:='RLATENMOOD';
    length:=10 END;
341: BEGIN name:='RMOODPRESPART';
    length:=13 END;
342: BEGIN name:='RMOODOPENTEINF';
    length:=14 END;
343: BEGIN name:='RMOODOPENOMTEINF';
    length:=16 END;
344: BEGIN name:='RCLOSEDTEINF';
    length:=12 END;
345: BEGIN name:='RMOODPASTPART';
    length:=13 END;
346: BEGIN name:='RMOODCVPP';
    length:=9 END;
347: BEGIN name:='RGELIEVEMOOD';
    length:=12 END;
348: BEGIN name:='RADJUNCTVAR1';
    length:=12 END;
349: BEGIN name:='RADJUNCTVAR2';
    length:=12 END;
350: BEGIN name:='RADJUNCTVAR3';
    length:=12 END;
351: BEGIN name:='RSTARTPREPP100';
    length:=14 END;
352: BEGIN name:='RSTARTPREPP120';
    length:=14 END;
353: BEGIN name:='RPPNPMOD';
    length:=8 END;
354: BEGIN name:='RPPADVPMOD';
    length:=10 END;
355: BEGIN name:='RPPSUBSTITUTION1';
    length:=16 END;
356: BEGIN name:='RIDPPSUBSTITUTION1';
    length:=18 END;
357: BEGIN name:='RIDPPSUBSTITUTION3';
    length:=18 END;
358: BEGIN name:='RPPSUBSTITUTION2';
    length:=16 END;
359: BEGIN name:='RIDPPSUBSTITUTION2';
    length:=18 END;
360: BEGIN name:='RPPSUBSTITUTION3';
    length:=16 END;
361: BEGIN name:='RPPSUBSTITUTION4';
    length:=16 END;
362: BEGIN name:='RPPSUPERDEIXIS';
    length:=14 END;
363: BEGIN name:='RSECONDPP';
    length:=9 END;
364: BEGIN name:='RIDSUBSTITUTION1';
    length:=16 END;
365: BEGIN name:='RIDSUBSTITUTION3';
    length:=16 END;
366: BEGIN name:='RIDSUBSTITUTION4';
    length:=16 END;
367: BEGIN name:='RIDSUBSTITUTION5';
    length:=16 END;
368: BEGIN name:='RIDSUBSTITUTION6';
    length:=16 END;
369: BEGIN name:='RSUBSTITUTION7';
    length:=14 END;
370: BEGIN name:='RSUBSTITUTION16';
    length:=15 END;
371: BEGIN name:='RSUBSTITUTION17';
    length:=15 END;
372: BEGIN name:='RSUBSTITUTION18';
    length:=15 END;
373: BEGIN name:='RSUBSTENNP1';
    length:=11 END;
374: BEGIN name:='RSUBSTENNP2';
    length:=11 END;
375: BEGIN name:='RBIGPROSUBST';
    length:=12 END;
376: BEGIN name:='RSADJSUBSTITUTION1';
    length:=18 END;
377: BEGIN name:='RSOPROSENTSUBST';
    length:=15 END;
378: BEGIN name:='RPREPPROSENTSUBST';
    length:=17 END;
379: BEGIN name:='RBADVTOSUB';
    length:=10 END;
380: BEGIN name:='RRADVTOSUB';
    length:=10 END;
381: BEGIN name:='RSUBADJTOSUBADV';
    length:=15 END;
382: BEGIN name:='RSTARTADVP0';
    length:=11 END;
383: BEGIN name:='RSTARTADVP1';
    length:=11 END;
384: BEGIN name:='RADVPDEGREEMOD1';
    length:=15 END;
385: BEGIN name:='RADVPDEGREEMOD2';
    length:=15 END;
386: BEGIN name:='RADVPDEGREEMOD3';
    length:=15 END;
387: BEGIN name:='RADVPVOOROBJMOD';
    length:=15 END;
388: BEGIN name:='RADVPSUBSTITUTION1';
    length:=18 END;
389: BEGIN name:='RADVPSUBSTITUTION2';
    length:=18 END;
390: BEGIN name:='RADVPSUBSTITUTION3';
    length:=18 END;
391: BEGIN name:='RADVPSUBSTITUTION4';
    length:=18 END;
392: BEGIN name:='RADVPSUPERDEIXIS';
    length:=16 END;
393: BEGIN name:='RADVPCOMPARISONCOMPLMOD';
    length:=23 END;
394: BEGIN name:='RSTARTADVPPROP100';
    length:=17 END;
395: BEGIN name:='RSTARTADVPPROP010';
    length:=17 END;
396: BEGIN name:='RSTARTADVPPROP120';
    length:=17 END;
397: BEGIN name:='RADVREFVARINSERTION';
    length:=19 END;
398: BEGIN name:='RADVPPROPVOICE';
    length:=14 END;
399: BEGIN name:='RADVTOFORMULA';
    length:=13 END;
400: BEGIN name:='RADVASPECTIMPERFECTIVE';
    length:=22 END;
401: BEGIN name:='RADVPPSUPERDEIXIS';
    length:=17 END;
402: BEGIN name:='RADVPPSUBST1';
    length:=12 END;
403: BEGIN name:='RADVPPMOOD1';
    length:=11 END;
404: BEGIN name:='RADVPPMOOD2';
    length:=11 END;
405: BEGIN name:='RADVPPNOPUNC';
    length:=12 END;
406: BEGIN name:='RUTTADJP';
    length:=8 END;
407: BEGIN name:='RPUNC0';
    length:=6 END;
408: BEGIN name:='RPUNC1';
    length:=6 END;
409: BEGIN name:='RPUNC2';
    length:=6 END;
410: BEGIN name:='RPUNC3';
    length:=6 END;
411: BEGIN name:='RCOORDINTRO';
    length:=11 END;
412: BEGIN name:='RRECIPROCALSUBST1';
    length:=17 END;
413: BEGIN name:='RCONJSENT1';
    length:=10 END;
414: BEGIN name:='RCONJSENT2';
    length:=10 END;
415: BEGIN name:='RCONJSENT3';
    length:=10 END;
416: BEGIN name:='RCONJSENT4';
    length:=10 END;
417: BEGIN name:='RCONJSENT5';
    length:=10 END;
418: BEGIN name:='RCONJSENT6';
    length:=10 END;
419: BEGIN name:='RPOSVAR';
    length:=7 END;
420: BEGIN name:='RNEGVAR1';
    length:=8 END;
421: BEGIN name:='RNEGVAR2';
    length:=8 END;
422: BEGIN name:='RNEGVAR3';
    length:=8 END;
423: BEGIN name:='RRELMARKING1';
    length:=12 END;
424: BEGIN name:='RRELMARKING2';
    length:=12 END;
425: BEGIN name:='RRELMARKING3';
    length:=12 END;
426: BEGIN name:='RRELMARKING4';
    length:=12 END;
427: BEGIN name:='RIDDERIV13';
    length:=10 END;
428: BEGIN name:='RIDTOPICXPMARKING';
    length:=17 END;
429: BEGIN name:='RIDSTARTPREPPFORM1';
    length:=18 END;
430: BEGIN name:='RIDSTARTPREPPFORM2';
    length:=18 END;
431: BEGIN name:='RIDSTARTPREPP1';
    length:=14 END;
432: BEGIN name:='RIDSTARTPREPP3';
    length:=14 END;
433: BEGIN name:='RIDSTARTPREPP4';
    length:=14 END;
434: BEGIN name:='RIDSTARTPREPP2';
    length:=14 END;
435: BEGIN name:='RIDDERIV1';
    length:=9 END;
436: BEGIN name:='RIDDERIV2';
    length:=9 END;
437: BEGIN name:='RIDSUBNOUNTONOUN';
    length:=16 END;
438: BEGIN name:='RIDALTNPFORMATION1';
    length:=18 END;
439: BEGIN name:='RIDDERIV3';
    length:=9 END;
440: BEGIN name:='RIDDERIV4';
    length:=9 END;
441: BEGIN name:='RIDDERIV5';
    length:=9 END;
442: BEGIN name:='RIDDERIV6';
    length:=9 END;
443: BEGIN name:='RIDDERIV8';
    length:=9 END;
444: BEGIN name:='RIDDERIV9';
    length:=9 END;
445: BEGIN name:='RIDDERIV10';
    length:=10 END;
446: BEGIN name:='RIDDERIV11';
    length:=10 END;
447: BEGIN name:='RIDNPFORMATION3';
    length:=15 END;
448: BEGIN name:='RIDNPFORMATION2';
    length:=15 END;
449: BEGIN name:='RIDVARPPTOPP';
    length:=12 END;
450: BEGIN name:='RIDPPFORMTOPPP';
    length:=14 END;
451: BEGIN name:='RIDNPFORMATION';
    length:=14 END;
452: BEGIN name:='RCNMODADVP1';
    length:=11 END;
453: BEGIN name:='RCNMODADVP2';
    length:=11 END;
454: BEGIN name:='RCNMODPOSTPARTICPLE';
    length:=19 END;
455: BEGIN name:='RCNMODRELSENT1';
    length:=14 END;
456: BEGIN name:='RNONCNMODRELSENT1';
    length:=17 END;
457: BEGIN name:='RCNMODINFREL';
    length:=12 END;
458: BEGIN name:='RNPPARTITIVEFORMATION1';
    length:=22 END;
459: BEGIN name:='RNPPARTITIVEFORMATION2';
    length:=22 END;
460: BEGIN name:='RCARDNP';
    length:=7 END;
461: BEGIN name:='RNPFORMATION6';
    length:=13 END;
462: BEGIN name:='RNPFORMATION7';
    length:=13 END;
463: BEGIN name:='RNPFORMATION8';
    length:=13 END;
464: BEGIN name:='RNPFORMATION9';
    length:=13 END;
465: BEGIN name:='RNPFORMATION11';
    length:=14 END;
466: BEGIN name:='RNPFORMATION11A';
    length:=15 END;
467: BEGIN name:='RNPFORMATION13';
    length:=14 END;
468: BEGIN name:='RNPFORMATION14';
    length:=14 END;
469: BEGIN name:='RNPFORMATION17';
    length:=14 END;
470: BEGIN name:='RBTOBIGPRO';
    length:=10 END;
471: BEGIN name:='RVPADV';
    length:=6 END;
472: BEGIN name:='RAGVPADV1';
    length:=9 END;
473: BEGIN name:='RAGVPADV2';
    length:=9 END;
474: BEGIN name:='RAGVPADV3';
    length:=9 END;
475: BEGIN name:='RIDALTPREPFORM';
    length:=14 END;
476: BEGIN name:='RIDDERIV15';
    length:=10 END;
477: BEGIN name:='RIDALTLOCDIRSUBST';
    length:=17 END;
478: BEGIN name:='RIDDERIV14';
    length:=10 END;
479: BEGIN name:='RIDDERIV7';
    length:=9 END;
480: BEGIN name:='RIDDERIV12';
    length:=10 END;
481: BEGIN name:='RCARD1';
    length:=6 END;
482: BEGIN name:='RCARD2';
    length:=6 END;
483: BEGIN name:='RDATUMNP';
    length:=8 END;
484: BEGIN name:='RDATUMDAY';
    length:=9 END;
485: BEGIN name:='RDATUMYEAR';
    length:=10 END;
486: BEGIN name:='RDATUMDAYNAME';
    length:=13 END;
487: BEGIN name:='RSIMPLEOPENADJPPCOORD';
    length:=21 END;
488: BEGIN name:='RSIMPLECLOSEDADJPPCOORD';
    length:=23 END;
489: BEGIN name:='RSIMPLEADJPPCOORD';
    length:=17 END;
490: BEGIN name:='RSIMPLEOPENADVPPCOORD';
    length:=21 END;
491: BEGIN name:='RSIMPLECLOSEDADVPPCOORD';
    length:=23 END;
492: BEGIN name:='RSIMPLEOPENPPPCOORD';
    length:=19 END;
493: BEGIN name:='RSIMPLECLOSEDPPPCOORD';
    length:=21 END;
494: BEGIN name:='RSIMPLEPPCOORD';
    length:=14 END;
495: BEGIN name:='RSIMPLEADVPCOORD';
    length:=16 END;
496: BEGIN name:='RSIMPLENPCOORD';
    length:=14 END;
497: BEGIN name:='RITSKPPCOORD';
    length:=12 END;
498: BEGIN name:='RITSCPPCOORD';
    length:=12 END;
499: BEGIN name:='RCOORDS';
    length:=7 END;
500: BEGIN name:='RCOORDITS';
    length:=9 END;
501: BEGIN name:='RCORRPPCOORD';
    length:=12 END;
502: BEGIN name:='RCORROPENADJPPCOORD';
    length:=19 END;
503: BEGIN name:='RCORRCLOSEDADJPPCOORD';
    length:=21 END;
504: BEGIN name:='RCORRADJPPCOORD';
    length:=15 END;
505: BEGIN name:='RCORROPENADVPPCOORD';
    length:=19 END;
506: BEGIN name:='RCORRNPCOORD';
    length:=12 END;
507: BEGIN name:='RNPPROPFORMATION';
    length:=16 END;
508: BEGIN name:='RNPREFVARINSERTION';
    length:=18 END;
509: BEGIN name:='RNPRETROVARINSERTION';
    length:=20 END;
510: BEGIN name:='RNPPSUBST1';
    length:=10 END;
511: BEGIN name:='ROPENNPPROPFORMATION';
    length:=20 END;
512: BEGIN name:='RCLOSEDNPPROPFORMATION';
    length:=22 END;
513: BEGIN name:='RNPPNOPUNC';
    length:=10 END;
514: BEGIN name:='RNOUNARGMOD1';
    length:=12 END;
515: BEGIN name:='RNOUNARGMOD2';
    length:=12 END;
516: BEGIN name:='RNPARGMODSUBST1';
    length:=15 END;
517: BEGIN name:='RNPARGMODSUBST2';
    length:=15 END;
518: BEGIN name:='RIDNPPSUPERDEIXIS';
    length:=17 END;
END;
END;
 FUNCTION LDMrules_IsFilter(
T:LDMrules_transformationindex):BOOLEAN;
BEGIN
LDMRULES_IsFilter:=(T>441)
END;
 PROCEDURE LDMrules_Transformationname(sg:LDMrules_subgrammarindex;
T:LDMrules_transformationindex;VAR name:string;VAR length:INTEGER);
BEGIN
CASE T OF
1: BEGIN name:='TVPDEL1';
    length:=7 END;
2: BEGIN name:='TVPDEL0';
    length:=7 END;
3: BEGIN name:='TSUBJECTSHIFT1';
    length:=14 END;
4: BEGIN name:='TSUBJECTSHIFT2';
    length:=14 END;
5: BEGIN name:='TV21';
    length:=4 END;
6: BEGIN name:='TV22';
    length:=4 END;
7: BEGIN name:='TV23';
    length:=4 END;
8: BEGIN name:='TNOV2';
    length:=5 END;
9: BEGIN name:='TV24';
    length:=4 END;
10: BEGIN name:='TV25';
    length:=4 END;
11: BEGIN name:='TPROSTATUS1';
    length:=11 END;
12: BEGIN name:='TNPOVERADV1';
    length:=11 END;
13: BEGIN name:='TPPOVERV1';
    length:=9 END;
14: BEGIN name:='TPPOVERV2';
    length:=9 END;
15: BEGIN name:='TPPOVERV3';
    length:=9 END;
16: BEGIN name:='TPPOVERV4';
    length:=9 END;
17: BEGIN name:='TADJPPOVERV1';
    length:=12 END;
18: BEGIN name:='TSPRUNING1';
    length:=10 END;
19: BEGIN name:='TSPRUNING0';
    length:=10 END;
20: BEGIN name:='TMODALSWITCH1';
    length:=13 END;
21: BEGIN name:='TGAANDELETION';
    length:=13 END;
22: BEGIN name:='TMODALEXP1';
    length:=10 END;
23: BEGIN name:='TMODALEXP2';
    length:=10 END;
24: BEGIN name:='TMODALEXP0';
    length:=10 END;
25: BEGIN name:='TMODALEXP3';
    length:=10 END;
26: BEGIN name:='TZOUINSERTION';
    length:=13 END;
27: BEGIN name:='TCASEASSIGNMENT1';
    length:=16 END;
28: BEGIN name:='TCASEASSIGNMENT1A';
    length:=17 END;
29: BEGIN name:='TCASEASSIGNMENT2';
    length:=16 END;
30: BEGIN name:='TCASEASSIGNMENT3';
    length:=16 END;
31: BEGIN name:='TCASEASSIGNMENT4';
    length:=16 END;
32: BEGIN name:='SVA0';
    length:=4 END;
33: BEGIN name:='SVA1';
    length:=4 END;
34: BEGIN name:='TOBJECTOK0';
    length:=10 END;
35: BEGIN name:='TOBJECTOK1';
    length:=10 END;
36: BEGIN name:='TOBJECTOK2';
    length:=10 END;
37: BEGIN name:='TOBJECTOK3';
    length:=10 END;
38: BEGIN name:='TOBJECTOK4';
    length:=10 END;
39: BEGIN name:='TOBJECTOK5';
    length:=10 END;
40: BEGIN name:='TOBJECTOK6';
    length:=10 END;
41: BEGIN name:='TOBJECTOK7';
    length:=10 END;
42: BEGIN name:='TNOC1';
    length:=5 END;
43: BEGIN name:='TNOC2';
    length:=5 END;
44: BEGIN name:='TNOC3';
    length:=5 END;
45: BEGIN name:='TNOC4';
    length:=5 END;
46: BEGIN name:='TCONTROL0';
    length:=9 END;
47: BEGIN name:='TOBLCONTROL1A';
    length:=13 END;
48: BEGIN name:='TOBLCONTROL1B';
    length:=13 END;
49: BEGIN name:='TNOCONTROL1';
    length:=11 END;
50: BEGIN name:='TOBLCONTROL2A';
    length:=13 END;
51: BEGIN name:='TOBLCONTROL2B';
    length:=13 END;
52: BEGIN name:='TNOCONTROL2';
    length:=11 END;
53: BEGIN name:='TOBLCONTROL3A';
    length:=13 END;
54: BEGIN name:='TOBLCONTROL3B';
    length:=13 END;
55: BEGIN name:='TNOCONTROL3';
    length:=11 END;
56: BEGIN name:='TNOCONTROLID';
    length:=12 END;
57: BEGIN name:='TOBLCONTROL7A';
    length:=13 END;
58: BEGIN name:='TOBLCONTROL7B';
    length:=13 END;
59: BEGIN name:='TNOCONTROL7';
    length:=11 END;
60: BEGIN name:='TNOCONTROL8';
    length:=11 END;
61: BEGIN name:='THATOA1';
    length:=7 END;
62: BEGIN name:='THTOA2';
    length:=6 END;
63: BEGIN name:='THTOA3';
    length:=6 END;
64: BEGIN name:='TPTOA1';
    length:=6 END;
65: BEGIN name:='TVPPRUNING1';
    length:=11 END;
66: BEGIN name:='TVPPRUNING0';
    length:=11 END;
67: BEGIN name:='SENTENCEOK0';
    length:=11 END;
68: BEGIN name:='EXTRAPOSITION1';
    length:=14 END;
69: BEGIN name:='EXTRAPOSITION2';
    length:=14 END;
70: BEGIN name:='VERBRAISING1';
    length:=12 END;
71: BEGIN name:='VERBRAISING2';
    length:=12 END;
72: BEGIN name:='TVERBRAISING3';
    length:=13 END;
73: BEGIN name:='TPOSTSUBJFORMATION1';
    length:=19 END;
74: BEGIN name:='TPOSTSUBJFORMATION2';
    length:=19 END;
75: BEGIN name:='TREMOVECLITICS1';
    length:=15 END;
76: BEGIN name:='TREMOVECLITICS2';
    length:=15 END;
77: BEGIN name:='TREMOVECLITICS3';
    length:=15 END;
78: BEGIN name:='TREMOVECLITICS4';
    length:=15 END;
79: BEGIN name:='TREMOVESADVS1';
    length:=13 END;
80: BEGIN name:='TREMOVESUBJ1';
    length:=12 END;
81: BEGIN name:='TREMOVESUBJ2';
    length:=12 END;
82: BEGIN name:='TSUBJTOCL';
    length:=9 END;
83: BEGIN name:='THETSUBJTOCL';
    length:=12 END;
84: BEGIN name:='TREMOVEVPARGS1';
    length:=14 END;
85: BEGIN name:='REMOVER1';
    length:=8 END;
86: BEGIN name:='TREMOVESHIFT1';
    length:=13 END;
87: BEGIN name:='TREMOVEVPADVS1';
    length:=14 END;
88: BEGIN name:='TREMOVEARGNP';
    length:=12 END;
89: BEGIN name:='TREMOVECOMPL';
    length:=12 END;
90: BEGIN name:='TOBLCONTROL4A';
    length:=13 END;
91: BEGIN name:='TOBLCONTROL4B';
    length:=13 END;
92: BEGIN name:='TNOCONTROL4';
    length:=11 END;
93: BEGIN name:='TNOCONTROL4ID';
    length:=13 END;
94: BEGIN name:='TOBLCONTROL5A';
    length:=13 END;
95: BEGIN name:='TOBLCONTROL5B';
    length:=13 END;
96: BEGIN name:='TNOCONTROL5';
    length:=11 END;
97: BEGIN name:='TOBLCONTROL5A1';
    length:=14 END;
98: BEGIN name:='TOBLCONTROL5B1';
    length:=14 END;
99: BEGIN name:='TNOCONTROL51';
    length:=12 END;
100: BEGIN name:='TOBLCONTROL6A';
    length:=13 END;
101: BEGIN name:='TOBLCONTROL6B';
    length:=13 END;
102: BEGIN name:='RVERBPATTERN0';
    length:=13 END;
103: BEGIN name:='RVERBPATTERN1';
    length:=13 END;
104: BEGIN name:='TADJPATTERN0';
    length:=12 END;
105: BEGIN name:='TADJPATTERN11';
    length:=13 END;
106: BEGIN name:='TADJPATTERN12A';
    length:=14 END;
107: BEGIN name:='TADJPATTERN12B';
    length:=14 END;
108: BEGIN name:='TADJPATTERN13';
    length:=13 END;
109: BEGIN name:='TADJPATTERN14';
    length:=13 END;
110: BEGIN name:='TADJPATTERN15A';
    length:=14 END;
111: BEGIN name:='TADJPATTERN15B';
    length:=14 END;
112: BEGIN name:='TADJPATTERN16';
    length:=13 END;
113: BEGIN name:='TADJPATTERN17';
    length:=13 END;
114: BEGIN name:='TADJPATTERN18A';
    length:=14 END;
115: BEGIN name:='TADJPATTERN18B';
    length:=14 END;
116: BEGIN name:='TADJPATTERN21';
    length:=13 END;
117: BEGIN name:='TADJPATTERN22';
    length:=13 END;
118: BEGIN name:='TADJPATTERN23';
    length:=13 END;
119: BEGIN name:='TADJPATTERN24';
    length:=13 END;
120: BEGIN name:='TADJPATTERN25';
    length:=13 END;
121: BEGIN name:='TADJPATTERN26';
    length:=13 END;
122: BEGIN name:='TADJZICHSPELLINGDEFAULT';
    length:=23 END;
123: BEGIN name:='TADJZICHSPELLING1';
    length:=17 END;
124: BEGIN name:='TADJZICHSPELLING2';
    length:=17 END;
125: BEGIN name:='TADJZICHSPELLING3';
    length:=17 END;
126: BEGIN name:='TADJZICHSPELLING4';
    length:=17 END;
127: BEGIN name:='TADJRECIPROCALSPELLING1';
    length:=23 END;
128: BEGIN name:='TADJRECIPROCALSPELLING1A';
    length:=24 END;
129: BEGIN name:='TADJRECIPROCALSPELLING2';
    length:=23 END;
130: BEGIN name:='TADJRECIPROCALSPELLING2A';
    length:=24 END;
131: BEGIN name:='TADJRECIPROCALSPELLING3';
    length:=23 END;
132: BEGIN name:='TADJRECIPROCALSPELLING3A';
    length:=24 END;
133: BEGIN name:='TADJRECIPROCALSPELLING4';
    length:=23 END;
134: BEGIN name:='TADJRECIPROCALSPELLING4A';
    length:=24 END;
135: BEGIN name:='TADJQPHOPPING1';
    length:=14 END;
136: BEGIN name:='TADJQPHOPPING2';
    length:=14 END;
137: BEGIN name:='TADVQPHOPPING1';
    length:=14 END;
138: BEGIN name:='TADVQPHOPPING2';
    length:=14 END;
139: BEGIN name:='TADJCASEASSIGNMENT1';
    length:=19 END;
140: BEGIN name:='TADJCASEASSIGNMENT2';
    length:=19 END;
141: BEGIN name:='TADJCASEASSIGNMENT3';
    length:=19 END;
142: BEGIN name:='TADJCONTROL0';
    length:=12 END;
143: BEGIN name:='TADJCONTROL1';
    length:=12 END;
144: BEGIN name:='TADJCONTROL2A';
    length:=13 END;
145: BEGIN name:='TADJCONTROL2B';
    length:=13 END;
146: BEGIN name:='TADJCONTROL2C';
    length:=13 END;
147: BEGIN name:='TADJCONTROL3A';
    length:=13 END;
148: BEGIN name:='TADJCONTROL3B';
    length:=13 END;
149: BEGIN name:='TADJCONTROL3C';
    length:=13 END;
150: BEGIN name:='TADJCONTROL4';
    length:=12 END;
151: BEGIN name:='TADJPROOBJCONTROL0';
    length:=18 END;
152: BEGIN name:='TADJPROOBJCONTROL1';
    length:=18 END;
153: BEGIN name:='TADJSENTEXTRAPOS';
    length:=16 END;
154: BEGIN name:='TADJCOMPLEXTRAPOS';
    length:=17 END;
155: BEGIN name:='TADJPREPPEXTRAPOS1';
    length:=18 END;
156: BEGIN name:='TADJPREPPEXTRAPOS3';
    length:=18 END;
157: BEGIN name:='TADJPREPPEXTRAPOS2';
    length:=18 END;
158: BEGIN name:='TADJOBJECTOK0';
    length:=13 END;
159: BEGIN name:='TADJOBJECTOK1';
    length:=13 END;
160: BEGIN name:='TADJOBJECTOK2';
    length:=13 END;
161: BEGIN name:='TADJMEERTOER';
    length:=12 END;
162: BEGIN name:='TADJMEERNOTTOER';
    length:=15 END;
163: BEGIN name:='TADJNOERNOMEER';
    length:=14 END;
164: BEGIN name:='TADJMEESTTOST1';
    length:=14 END;
165: BEGIN name:='TADJMEESTTOST2';
    length:=14 END;
166: BEGIN name:='TADJMEESTNOTTOST';
    length:=16 END;
167: BEGIN name:='TADJNOSTNOMEEST';
    length:=15 END;
168: BEGIN name:='TADJPACOMPLMOVEMENT';
    length:=19 END;
169: BEGIN name:='TADJCOMPLMOVEMENT';
    length:=17 END;
170: BEGIN name:='TADJVOOROBJMOVEMENT1';
    length:=20 END;
171: BEGIN name:='TQPNOMCASEASSIGNMENT';
    length:=20 END;
172: BEGIN name:='TQPVANCOMPLCASEASSIGNMENT';
    length:=25 END;
173: BEGIN name:='TQPSUPERDEIXISADAPTATION1';
    length:=25 END;
174: BEGIN name:='TQPSUPERDEIXISADAPTATION2';
    length:=25 END;
175: BEGIN name:='TNOQPSUPERDEIXISADAPTATION';
    length:=26 END;
176: BEGIN name:='TNPHOP';
    length:=6 END;
177: BEGIN name:='TNPADJQPCOMPLEXTRAPOS1';
    length:=22 END;
178: BEGIN name:='TNPNOTOOMEGA1';
    length:=13 END;
179: BEGIN name:='TNPNOTOOMEGA2';
    length:=13 END;
180: BEGIN name:='TNPQPCOMPLEXTRAPOS';
    length:=18 END;
181: BEGIN name:='TNPASSIGNEFORM1';
    length:=15 END;
182: BEGIN name:='TNPASSIGNEFORM2';
    length:=15 END;
183: BEGIN name:='TNPASSIGNEFORM3';
    length:=15 END;
184: BEGIN name:='TNPASSIGNEFORM4';
    length:=15 END;
185: BEGIN name:='TNPENDELETION1';
    length:=14 END;
186: BEGIN name:='TNPENDELETION2';
    length:=14 END;
187: BEGIN name:='TNPCNDELETION1';
    length:=14 END;
188: BEGIN name:='TNPCNDELETION2';
    length:=14 END;
189: BEGIN name:='TADJARGREFLSPELLING1';
    length:=20 END;
190: BEGIN name:='TADJARGREFLSPELLING2';
    length:=20 END;
191: BEGIN name:='TADJARGRECIPRSPELLING1';
    length:=22 END;
192: BEGIN name:='TADJARGRECIPRSPELLING2';
    length:=22 END;
193: BEGIN name:='TADJSETPROSUBJECT';
    length:=17 END;
194: BEGIN name:='TADJALSINTRO';
    length:=12 END;
195: BEGIN name:='TARGREFLSPELLING1';
    length:=17 END;
196: BEGIN name:='TARGREFLSPELLING2';
    length:=17 END;
197: BEGIN name:='TARGREFLSPELLING3';
    length:=17 END;
198: BEGIN name:='TARGREFLSPELLING4';
    length:=17 END;
199: BEGIN name:='TARGREFLSPELLING5';
    length:=17 END;
200: BEGIN name:='TARGREFLSPELLING6';
    length:=17 END;
201: BEGIN name:='TARGREFLSPELLING7';
    length:=17 END;
202: BEGIN name:='TARGREFLSPELLING8';
    length:=17 END;
203: BEGIN name:='TARGREFLSPELLING9';
    length:=17 END;
204: BEGIN name:='TARGREFLSPELLING10';
    length:=18 END;
205: BEGIN name:='RIDVERBPATTERN';
    length:=14 END;
206: BEGIN name:='RVERBPATTERN2';
    length:=13 END;
207: BEGIN name:='RVERBPATTERN3';
    length:=13 END;
208: BEGIN name:='RVERBPATTERN16';
    length:=14 END;
209: BEGIN name:='RVERBPATTERN5';
    length:=13 END;
210: BEGIN name:='RVERBPATTERN6';
    length:=13 END;
211: BEGIN name:='RVERBPATTERN14';
    length:=14 END;
212: BEGIN name:='RVERBPATTERN7';
    length:=13 END;
213: BEGIN name:='RVERBPATTERN8';
    length:=13 END;
214: BEGIN name:='TPOSSADJSPELLING1';
    length:=17 END;
215: BEGIN name:='ZICHSPELLINGDEFAULT';
    length:=19 END;
216: BEGIN name:='ZICHSPELLING1';
    length:=13 END;
217: BEGIN name:='ZICHSPELLING2';
    length:=13 END;
218: BEGIN name:='ZICHSPELLING3';
    length:=13 END;
219: BEGIN name:='ZICHSPELLING4';
    length:=13 END;
220: BEGIN name:='RECIPROCALSPELLING1';
    length:=19 END;
221: BEGIN name:='RECIPROCALSPELLING1A';
    length:=20 END;
222: BEGIN name:='RECIPROCALSPELLING2';
    length:=19 END;
223: BEGIN name:='RECIPROCALSPELLING2A';
    length:=20 END;
224: BEGIN name:='TPARTICLESPELLING0';
    length:=18 END;
225: BEGIN name:='TPARTICLE1';
    length:=10 END;
226: BEGIN name:='TAKTACTIVITY1';
    length:=13 END;
227: BEGIN name:='TAKTACTIVITY2';
    length:=13 END;
228: BEGIN name:='TAKTACTIVITY3';
    length:=13 END;
229: BEGIN name:='TAKTACTIVITY4';
    length:=13 END;
230: BEGIN name:='TAKTACTIVITY5';
    length:=13 END;
231: BEGIN name:='TAKTACTIVITY6';
    length:=13 END;
232: BEGIN name:='TAKTACCOMPLISHMENT1';
    length:=19 END;
233: BEGIN name:='TAKTACCOMPLISHMENT2';
    length:=19 END;
234: BEGIN name:='TAKTACCOMPLISHMENT3';
    length:=19 END;
235: BEGIN name:='TAKTACHIEVEMENT1';
    length:=16 END;
236: BEGIN name:='TAKTSTATIVE1';
    length:=12 END;
237: BEGIN name:='TFINITE';
    length:=7 END;
238: BEGIN name:='TINFINITE';
    length:=9 END;
239: BEGIN name:='TASPECTNEUTRALIZATION';
    length:=21 END;
240: BEGIN name:='TRETRONEUTRALIZATION';
    length:=20 END;
241: BEGIN name:='TLANGDELETION';
    length:=13 END;
242: BEGIN name:='TTEMPCONJSENTADAPTATION';
    length:=23 END;
243: BEGIN name:='TTEMPCONJSENTMOVETORIGHT';
    length:=24 END;
244: BEGIN name:='RVERBPATTERN4';
    length:=13 END;
245: BEGIN name:='RVERBPATTERN4P2';
    length:=15 END;
246: BEGIN name:='TNOC5';
    length:=5 END;
247: BEGIN name:='TNOC6';
    length:=5 END;
248: BEGIN name:='TNOC7';
    length:=5 END;
249: BEGIN name:='TNOC8';
    length:=5 END;
250: BEGIN name:='TNOC9';
    length:=5 END;
251: BEGIN name:='TNOSUPERDEIXISADAPTATION';
    length:=24 END;
252: BEGIN name:='TSUPERDEIXISADAPTATION1';
    length:=23 END;
253: BEGIN name:='TSUPERDEIXISADAPTATION2';
    length:=23 END;
254: BEGIN name:='TSUPERDEIXISADAPTATION5';
    length:=23 END;
255: BEGIN name:='TSUPERDEIXISADAPTATION8';
    length:=23 END;
256: BEGIN name:='TSUPERDEIXISADAPTATION10';
    length:=24 END;
257: BEGIN name:='TDEIXISRETROADAPTATION1';
    length:=23 END;
258: BEGIN name:='TGEWEESTTOZIJND';
    length:=15 END;
259: BEGIN name:='TDEIXISPRESINFADAPTATION1';
    length:=25 END;
260: BEGIN name:='TDEIXISPRESINFADAPTATION2';
    length:=25 END;
261: BEGIN name:='TDEIXISPRESINFADAPTATION3';
    length:=25 END;
262: BEGIN name:='TPASSIVEGEWORDENDELETION';
    length:=24 END;
263: BEGIN name:='TREFDELETION';
    length:=12 END;
264: BEGIN name:='TRETRODELETION';
    length:=14 END;
265: BEGIN name:='TADJAKTSTATIVE1';
    length:=15 END;
266: BEGIN name:='TADJASPECTNEUTRALIZATION';
    length:=24 END;
267: BEGIN name:='TADJRETRONEUTRALIZATION';
    length:=23 END;
268: BEGIN name:='TADJDEIXISPRESADAPTATION';
    length:=24 END;
269: BEGIN name:='TADJDEIXISPASTADAPTATION';
    length:=24 END;
270: BEGIN name:='TADJSUPERDEIXISADAPTATION1';
    length:=26 END;
271: BEGIN name:='TADJNOSUPERDEIXISADAPTATION';
    length:=27 END;
272: BEGIN name:='TADJSUPERDEIXISADAPTATION2';
    length:=26 END;
273: BEGIN name:='TPREPPATTERN0';
    length:=13 END;
274: BEGIN name:='TIDPREPPATTERN1';
    length:=15 END;
275: BEGIN name:='TPREPPATTERN1A';
    length:=14 END;
276: BEGIN name:='TPREPPATTERN1B';
    length:=14 END;
277: BEGIN name:='TPPCA0';
    length:=6 END;
278: BEGIN name:='TPPCA1';
    length:=6 END;
279: BEGIN name:='THETTOER1';
    length:=9 END;
280: BEGIN name:='TIDHETTOER1';
    length:=11 END;
281: BEGIN name:='THETTOER0';
    length:=9 END;
282: BEGIN name:='THETTOER2';
    length:=9 END;
283: BEGIN name:='TIDHETTOER2';
    length:=11 END;
284: BEGIN name:='TPPPPROSUBJECT';
    length:=14 END;
285: BEGIN name:='TPPPASPECTNEUTRALIZATION';
    length:=24 END;
286: BEGIN name:='TWHSHIFT1A';
    length:=10 END;
287: BEGIN name:='TWHSHIFT1B';
    length:=10 END;
288: BEGIN name:='TWHSHIFT0';
    length:=9 END;
289: BEGIN name:='TWHSHIFT2';
    length:=9 END;
290: BEGIN name:='TERXDELETION1';
    length:=13 END;
291: BEGIN name:='TPPTOERPOS1';
    length:=11 END;
292: BEGIN name:='TERTOERPOS1';
    length:=11 END;
293: BEGIN name:='TERTOERPOS2';
    length:=11 END;
294: BEGIN name:='TADJHETTOER1';
    length:=12 END;
295: BEGIN name:='TADJHETTOER2';
    length:=12 END;
296: BEGIN name:='TADJERTOERPOS1';
    length:=14 END;
297: BEGIN name:='TERPGLUE';
    length:=8 END;
298: BEGIN name:='TTOER1';
    length:=6 END;
299: BEGIN name:='TTOER2';
    length:=6 END;
300: BEGIN name:='TERQER1';
    length:=7 END;
301: BEGIN name:='TERQER2';
    length:=7 END;
302: BEGIN name:='TERQER3';
    length:=7 END;
303: BEGIN name:='TERQER4';
    length:=7 END;
304: BEGIN name:='TERQER0';
    length:=7 END;
305: BEGIN name:='TERXINS1';
    length:=8 END;
306: BEGIN name:='TERXINS0';
    length:=8 END;
307: BEGIN name:='TECDEL';
    length:=6 END;
308: BEGIN name:='TERZICH1';
    length:=8 END;
309: BEGIN name:='TERZICH2';
    length:=8 END;
310: BEGIN name:='TERZICH0';
    length:=8 END;
311: BEGIN name:='TNEGADAPT1';
    length:=10 END;
312: BEGIN name:='TNEGADAPT2';
    length:=10 END;
313: BEGIN name:='TNEGADAPT3';
    length:=10 END;
314: BEGIN name:='TNEGADAPT4';
    length:=10 END;
315: BEGIN name:='TPPPREPPATTERN0';
    length:=15 END;
316: BEGIN name:='TIDPPPREPPATTERN';
    length:=16 END;
317: BEGIN name:='TPPPREPPATTERN1A';
    length:=16 END;
318: BEGIN name:='TPPPREPPATTERN1B';
    length:=16 END;
319: BEGIN name:='TPREPPCA0';
    length:=9 END;
320: BEGIN name:='TPREPPCA1';
    length:=9 END;
321: BEGIN name:='TPPHETTOER1';
    length:=11 END;
322: BEGIN name:='TIDPPHETTOER1';
    length:=13 END;
323: BEGIN name:='TPPHETTOER0';
    length:=11 END;
324: BEGIN name:='TPPHETTOER2';
    length:=11 END;
325: BEGIN name:='TIDPPHETTOER2';
    length:=13 END;
326: BEGIN name:='TPPTOVARPP0';
    length:=11 END;
327: BEGIN name:='TPPTOVARPP1';
    length:=11 END;
328: BEGIN name:='TCONJDEL0';
    length:=9 END;
329: BEGIN name:='TCONJDEL1';
    length:=9 END;
330: BEGIN name:='TCONJDEL2';
    length:=9 END;
331: BEGIN name:='TTEMPADVCHECK';
    length:=13 END;
332: BEGIN name:='TNOADVVARS';
    length:=10 END;
333: BEGIN name:='TNOERORVR';
    length:=9 END;
334: BEGIN name:='TTEMPADVRELPRES';
    length:=15 END;
335: BEGIN name:='TSUPERDEIXISOK';
    length:=14 END;
336: BEGIN name:='TNOPASSORBYOBJ';
    length:=14 END;
337: BEGIN name:='TNOAUXORPASS';
    length:=12 END;
338: BEGIN name:='TADVPADVPATTERN0';
    length:=16 END;
339: BEGIN name:='TADVPADVPATTERN1A';
    length:=17 END;
340: BEGIN name:='TADVPADVPATTERN1B';
    length:=17 END;
341: BEGIN name:='TADVPADVPATTERN1C';
    length:=17 END;
342: BEGIN name:='TADVPNOMCASEASSIGNMENT';
    length:=22 END;
343: BEGIN name:='TADVPATTERN0';
    length:=12 END;
344: BEGIN name:='TADVPATTERN1';
    length:=12 END;
345: BEGIN name:='TADVASPECTNEUTRALISATION';
    length:=24 END;
346: BEGIN name:='TADVPPPROSUBJECT';
    length:=16 END;
347: BEGIN name:='TADVMEERTOER';
    length:=12 END;
348: BEGIN name:='TADVMEERNOTTOER';
    length:=15 END;
349: BEGIN name:='TADVNOERNOMEER';
    length:=14 END;
350: BEGIN name:='TADVMEESTTOST2';
    length:=14 END;
351: BEGIN name:='TADVMEESTNOTTOST';
    length:=16 END;
352: BEGIN name:='TADVNOSTNOMEEST';
    length:=15 END;
353: BEGIN name:='TADVALSINTRO';
    length:=12 END;
354: BEGIN name:='THETCLPLACEMENT1';
    length:=16 END;
355: BEGIN name:='THETCLPLACEMENT2';
    length:=16 END;
356: BEGIN name:='THETCLPLACEMENT0';
    length:=16 END;
357: BEGIN name:='TINDOBJTOCL1';
    length:=12 END;
358: BEGIN name:='TINDOBJTOCL0';
    length:=12 END;
359: BEGIN name:='TOBJTOCL1';
    length:=9 END;
360: BEGIN name:='TPREDTOCL1';
    length:=10 END;
361: BEGIN name:='TOBJTOCL0';
    length:=9 END;
362: BEGIN name:='TCLITICSPEED';
    length:=12 END;
363: BEGIN name:='TADJHETCLPLACEMENT1';
    length:=19 END;
364: BEGIN name:='TADJINDOBJTOCL1';
    length:=15 END;
365: BEGIN name:='TADJOBJTOCL1';
    length:=12 END;
366: BEGIN name:='RVERBPATTERN9';
    length:=13 END;
367: BEGIN name:='RVERBPATTERN10';
    length:=14 END;
368: BEGIN name:='RVERBPATTERN11';
    length:=14 END;
369: BEGIN name:='RVERBPATTERN12';
    length:=14 END;
370: BEGIN name:='RVERBPATTERN13';
    length:=14 END;
371: BEGIN name:='RVERBPATTERN15';
    length:=14 END;
372: BEGIN name:='TVPHETTOER1';
    length:=11 END;
373: BEGIN name:='TVPHETTOER2';
    length:=11 END;
374: BEGIN name:='TSHETTOER1';
    length:=10 END;
375: BEGIN name:='TSHETTOER2';
    length:=10 END;
376: BEGIN name:='TERQ1';
    length:=5 END;
377: BEGIN name:='TERQ2';
    length:=5 END;
378: BEGIN name:='TERQ3';
    length:=5 END;
379: BEGIN name:='TARGRTORPOS1';
    length:=12 END;
380: BEGIN name:='TARGRTORPOS2';
    length:=12 END;
381: BEGIN name:='TARGRTORPOS0';
    length:=12 END;
382: BEGIN name:='TADVRTORPOS1';
    length:=12 END;
383: BEGIN name:='TADVRTORPOS0';
    length:=12 END;
384: BEGIN name:='TADVRTORPOS2';
    length:=12 END;
385: BEGIN name:='TSUPERDEIXISADAPTATION3';
    length:=23 END;
386: BEGIN name:='TSUPERDEIXISADAPTATION4';
    length:=23 END;
387: BEGIN name:='TSUPERDEIXISADAPTATION6';
    length:=23 END;
388: BEGIN name:='TSUPERDEIXISADAPTATION7';
    length:=23 END;
389: BEGIN name:='TIDSUPERDEIXISADAPTATION';
    length:=24 END;
390: BEGIN name:='TSUPERDEIXISADAPTATION9';
    length:=23 END;
391: BEGIN name:='TVARPPMOODADAPT1';
    length:=16 END;
392: BEGIN name:='TPOSTPREPOK1';
    length:=12 END;
393: BEGIN name:='TPOSTPREPOK0';
    length:=12 END;
394: BEGIN name:='TIDCLAUSETOVPPROP';
    length:=17 END;
395: BEGIN name:='TIDVPPROPTOCLAUSE';
    length:=17 END;
396: BEGIN name:='TIDPPSUPERDEIXIS';
    length:=16 END;
397: BEGIN name:='TISIDIOM';
    length:=8 END;
398: BEGIN name:='TISPPIDIOM';
    length:=10 END;
399: BEGIN name:='TISPPFORMIDIOM';
    length:=14 END;
400: BEGIN name:='TISNOTIDIOM';
    length:=11 END;
401: BEGIN name:='TISNOTPPIDIOM';
    length:=13 END;
402: BEGIN name:='TISNOTPPFORMIDIOM';
    length:=17 END;
403: BEGIN name:='TIDCASEASSIGNMENT';
    length:=17 END;
404: BEGIN name:='TSUBSTSPEED';
    length:=11 END;
405: BEGIN name:='TEXTRAPOSANDNOVR';
    length:=16 END;
406: BEGIN name:='TNOEXTRAPOS';
    length:=11 END;
407: BEGIN name:='TZIJNDDEL';
    length:=9 END;
408: BEGIN name:='TFINCONTROL1';
    length:=12 END;
409: BEGIN name:='TFINCONTROL0';
    length:=12 END;
410: BEGIN name:='TADVCONTROL1';
    length:=12 END;
411: BEGIN name:='TADVCONTROL2';
    length:=12 END;
412: BEGIN name:='TINFRELCONTROL';
    length:=14 END;
413: BEGIN name:='TSADJCOMPLEXTRAPOS';
    length:=18 END;
414: BEGIN name:='TSADJEXTRAPOS1';
    length:=14 END;
415: BEGIN name:='TSADJEXTRAPOS2';
    length:=14 END;
416: BEGIN name:='TSADJCA1';
    length:=8 END;
417: BEGIN name:='TSADJCA2';
    length:=8 END;
418: BEGIN name:='TSADJMEERTOER';
    length:=13 END;
419: BEGIN name:='TSADJMEERNOTTOER';
    length:=16 END;
420: BEGIN name:='TSADJNOMEERNOMEEST';
    length:=18 END;
421: BEGIN name:='TSADJMEESTTOST2';
    length:=15 END;
422: BEGIN name:='TSADJMEESTNOTTOST';
    length:=17 END;
423: BEGIN name:='TMEERTOERDEFAULT';
    length:=16 END;
424: BEGIN name:='TTHANPEXTRA1';
    length:=12 END;
425: BEGIN name:='TPOPLDLCOMMA';
    length:=12 END;
426: BEGIN name:='TDATDELETION';
    length:=12 END;
427: BEGIN name:='TRINPPGLUE';
    length:=10 END;
428: BEGIN name:='TPURPOSEADVERBIAL';
    length:=17 END;
429: BEGIN name:='TSTOCVPP';
    length:=8 END;
430: BEGIN name:='THETACIADAPT';
    length:=12 END;
431: BEGIN name:='TNOVPADVS';
    length:=9 END;
432: BEGIN name:='TSUITNP1';
    length:=8 END;
433: BEGIN name:='TSUITNP2';
    length:=8 END;
434: BEGIN name:='TADJPEXTRA1';
    length:=11 END;
435: BEGIN name:='TARGREFLSPELLING11';
    length:=18 END;
436: BEGIN name:='TPREPNPARTICLEINTRO1';
    length:=20 END;
437: BEGIN name:='TNPARTICLEINTRO2';
    length:=16 END;
438: BEGIN name:='TNPPNOPROSUBJECT';
    length:=16 END;
439: BEGIN name:='TNPPPROSUBJECT';
    length:=14 END;
440: BEGIN name:='TCNNOUNPOSS';
    length:=11 END;
441: BEGIN name:='TNPPOSTOPOSTMOD';
    length:=15 END;
442: BEGIN name:='FNOPREADV';
    length:=9 END;
443: BEGIN name:='FPREPPOVERV';
    length:=11 END;
444: BEGIN name:='FPREGAANDELETION';
    length:=16 END;
445: BEGIN name:='FZOUINSERTION';
    length:=13 END;
446: BEGIN name:='PFPREWILINSERTION';
    length:=17 END;
447: BEGIN name:='FPRECASEASSIGNMENT1';
    length:=19 END;
448: BEGIN name:='FPRECASEASSIGNMENT2';
    length:=19 END;
449: BEGIN name:='FPRECASEASSIGNMENT3';
    length:=19 END;
450: BEGIN name:='FPRECASEASSIGNMENT4';
    length:=19 END;
451: BEGIN name:='FPOSTCASEASSIGNMENT1';
    length:=20 END;
452: BEGIN name:='FPOSTCASEASSIGNMENT3';
    length:=20 END;
453: BEGIN name:='FPOSTCASEASSIGNMENT4';
    length:=20 END;
454: BEGIN name:='FPRECA1A';
    length:=8 END;
455: BEGIN name:='FHATOA1';
    length:=7 END;
456: BEGIN name:='FPREAUX';
    length:=7 END;
457: BEGIN name:='FPOSTSUBJFORMATION1';
    length:=19 END;
458: BEGIN name:='FNOARGS';
    length:=7 END;
459: BEGIN name:='FPOSTADJQPHOPPING';
    length:=17 END;
460: BEGIN name:='FPOSTADVQPHOPPING';
    length:=17 END;
461: BEGIN name:='FADJPRESENTENCESUBST';
    length:=20 END;
462: BEGIN name:='FADJPRESUBST';
    length:=12 END;
463: BEGIN name:='FADJPOSTCASEASSIGNMENT1';
    length:=23 END;
464: BEGIN name:='FADJPOSTCASEASSIGNMENT2';
    length:=23 END;
465: BEGIN name:='FADJPOSTCASEASSIGNMENT3';
    length:=23 END;
466: BEGIN name:='FADJPRECASEASSIGNMENT1';
    length:=22 END;
467: BEGIN name:='FADJPRECASEASSIGNMENT2';
    length:=22 END;
468: BEGIN name:='FADJPRECASEASSIGNMENT3';
    length:=22 END;
469: BEGIN name:='FADJPOSTSENTEXTRAPOS';
    length:=20 END;
470: BEGIN name:='FADJPRESENTEXTRAPOS';
    length:=19 END;
471: BEGIN name:='FADJPOSTCOMPLEXTRAPOS';
    length:=21 END;
472: BEGIN name:='FADJPRECOMPLEXTRAPOS';
    length:=20 END;
473: BEGIN name:='FPREADJPREPPEXTRAPOS2';
    length:=21 END;
474: BEGIN name:='FPOSTUNITNP';
    length:=11 END;
475: BEGIN name:='FPOSTNPADJQPCOMPLEXTRAPOS1';
    length:=26 END;
476: BEGIN name:='FPRENPADJQPCOMPLEXTRAPOS1';
    length:=25 END;
477: BEGIN name:='FPOSTNPNOTOOMEGA1';
    length:=17 END;
478: BEGIN name:='FPOSTNPNOTOOMEGA2';
    length:=17 END;
479: BEGIN name:='FPRENPQPCOMPLEXTRAPOS';
    length:=21 END;
480: BEGIN name:='FPOSTNPQPCOMPLEXTRAPOS';
    length:=22 END;
481: BEGIN name:='FNPPOSTENDELETION';
    length:=17 END;
482: BEGIN name:='FNPPREENDELETION';
    length:=16 END;
483: BEGIN name:='FPOSTNPCNDELETION1';
    length:=18 END;
484: BEGIN name:='FPOSTNPCNDELETION2';
    length:=18 END;
485: BEGIN name:='FTEMPADJCHECK';
    length:=13 END;
486: BEGIN name:='FADJPREHETSUBST';
    length:=15 END;
487: BEGIN name:='FADJALSINTRO';
    length:=12 END;
488: BEGIN name:='FBTB1';
    length:=5 END;
489: BEGIN name:='FARGREFLSPELLING1';
    length:=17 END;
490: BEGIN name:='FPREARGREFL';
    length:=11 END;
491: BEGIN name:='FPOSSADJSPELLING1';
    length:=17 END;
492: BEGIN name:='FPOSSADJSPELLING2';
    length:=17 END;
493: BEGIN name:='FRETRONEUTRALIZATION';
    length:=20 END;
494: BEGIN name:='FPRERETRONEUTRALIZATION';
    length:=23 END;
495: BEGIN name:='FLANGDELETION';
    length:=13 END;
496: BEGIN name:='FPRELANGDELETION';
    length:=16 END;
497: BEGIN name:='FPOSTTEMPCONJSENTADAPTATION';
    length:=27 END;
498: BEGIN name:='FPRETEMPCONJSENTADAPTATION';
    length:=26 END;
499: BEGIN name:='FPRETEMPCONJSENTMOVETORIGHT';
    length:=27 END;
500: BEGIN name:='FPRETEMPCONJSENTMOVETOLEFT';
    length:=26 END;
501: BEGIN name:='FSUPERDEIXISADAPTATION8';
    length:=23 END;
502: BEGIN name:='FTEMPINDEP1';
    length:=11 END;
503: BEGIN name:='FSUPERDEIXISADAPTATION10';
    length:=24 END;
504: BEGIN name:='FDEIXISRETROADAPTATION1';
    length:=23 END;
505: BEGIN name:='FPREDEIXISRETRO';
    length:=15 END;
506: BEGIN name:='FGEWEESTTOZIJND';
    length:=15 END;
507: BEGIN name:='FPASSIVEGEWORDENDELETION';
    length:=24 END;
508: BEGIN name:='FREFDELETION';
    length:=12 END;
509: BEGIN name:='FRETRODELETION';
    length:=14 END;
510: BEGIN name:='FPRERETRODELETION';
    length:=17 END;
511: BEGIN name:='FADJSUPERDEIXISADAPTATION2';
    length:=26 END;
512: BEGIN name:='FPPPTEPREP';
    length:=10 END;
513: BEGIN name:='FPPPPREPROSUBJECT';
    length:=17 END;
514: BEGIN name:='FPPPER';
    length:=6 END;
515: BEGIN name:='FERTOERPOS12';
    length:=12 END;
516: BEGIN name:='PFPREERTOERPOS';
    length:=14 END;
517: BEGIN name:='FADJHETTOER12';
    length:=13 END;
518: BEGIN name:='FADJERTOERPOS12';
    length:=15 END;
519: BEGIN name:='FERPGLUE';
    length:=8 END;
520: BEGIN name:='FPREERPGLUE';
    length:=11 END;
521: BEGIN name:='FTOER12';
    length:=7 END;
522: BEGIN name:='NEGADAPTFILTER';
    length:=14 END;
523: BEGIN name:='FNEGSPEED';
    length:=9 END;
524: BEGIN name:='FPPTEPREP';
    length:=9 END;
525: BEGIN name:='FVRCOMPL';
    length:=8 END;
526: BEGIN name:='FPREPROPSUBST';
    length:=13 END;
527: BEGIN name:='FPREPROSTATUS';
    length:=13 END;
528: BEGIN name:='FNOR';
    length:=4 END;
529: BEGIN name:='FNOSHIFT';
    length:=8 END;
530: BEGIN name:='FNOCLITICS';
    length:=10 END;
531: BEGIN name:='PFSHIFTCHECK';
    length:=12 END;
532: BEGIN name:='FPRESUBJSHIFT';
    length:=13 END;
533: BEGIN name:='FREMOVESPEED1';
    length:=13 END;
534: BEGIN name:='FADVPPPREPROSUBJECT';
    length:=19 END;
535: BEGIN name:='FPREADVALSINTRO';
    length:=15 END;
536: BEGIN name:='FPRECOORDINTRO';
    length:=14 END;
537: BEGIN name:='FVPHETTOER12';
    length:=12 END;
538: BEGIN name:='FSHETTOER12';
    length:=11 END;
539: BEGIN name:='FPREHETTOER';
    length:=11 END;
540: BEGIN name:='FERQ';
    length:=4 END;
541: BEGIN name:='FPREERQ';
    length:=7 END;
542: BEGIN name:='FPRERECIPRO1';
    length:=12 END;
543: BEGIN name:='FNONEGORPOSVAR';
    length:=14 END;
544: BEGIN name:='FSUPERDEIXISADAPTATION7';
    length:=23 END;
545: BEGIN name:='FSUPERDEIXISADAPTATION9';
    length:=23 END;
546: BEGIN name:='FTEMPINDEP2';
    length:=11 END;
547: BEGIN name:='FNOTOPIC';
    length:=8 END;
548: BEGIN name:='FVARPPMOODADAPT1';
    length:=16 END;
549: BEGIN name:='FPREVARPPMOODADAPT';
    length:=18 END;
550: BEGIN name:='FNOECNP';
    length:=7 END;
551: BEGIN name:='FZIJNDDEL';
    length:=9 END;
552: BEGIN name:='FADVCONTROL';
    length:=11 END;
553: BEGIN name:='FPREADVCONTROL';
    length:=14 END;
554: BEGIN name:='FINFRELCONTROL';
    length:=14 END;
555: BEGIN name:='FPREINFRELCONTROL';
    length:=17 END;
556: BEGIN name:='FSADJPOSTCOMPLEXTRAPOS';
    length:=22 END;
557: BEGIN name:='FSADJPRECOMPLEXTRAPOS';
    length:=21 END;
558: BEGIN name:='FSADJCA1';
    length:=8 END;
559: BEGIN name:='FSADJCA2';
    length:=8 END;
560: BEGIN name:='FPRESADJCA1';
    length:=11 END;
561: BEGIN name:='FPRESADJCA2';
    length:=11 END;
562: BEGIN name:='FPRETHANPEXTRA1';
    length:=15 END;
563: BEGIN name:='FPOPLDLKOMMA';
    length:=12 END;
564: BEGIN name:='FPREPOPLDL';
    length:=10 END;
565: BEGIN name:='FRINPPGLUE';
    length:=10 END;
566: BEGIN name:='FPURPOSEADVERBIAL';
    length:=17 END;
567: BEGIN name:='FPREPURPOSEADVERBIAL';
    length:=20 END;
568: BEGIN name:='FSTOCVPP';
    length:=8 END;
569: BEGIN name:='FPRESTOCVPP';
    length:=11 END;
570: BEGIN name:='FHETACIADAPT';
    length:=12 END;
571: BEGIN name:='FNORELSENTREL';
    length:=13 END;
572: BEGIN name:='FADJPEXTRA1';
    length:=11 END;
573: BEGIN name:='FPREPREPNPARTICLEINTRO1';
    length:=23 END;
574: BEGIN name:='FPRENPARTICLEINTRO2';
    length:=19 END;
575: BEGIN name:='FHETDITDAT';
    length:=10 END;
576: BEGIN name:='FCNNOUNPOSS';
    length:=11 END;
577: BEGIN name:='FNPPOSTOPOSTMOD';
    length:=15 END;
578: BEGIN name:='FPRENPASSIGNEFORM';
    length:=17 END;
579: BEGIN name:='FPOSTNPASSIGNEFORM';
    length:=18 END;
END;
END;
 PROCEDURE LDMrules_subgrammarname(sg:LDMrules_subgrammarindex;
VAR name:string;VAR length:INTEGER);
BEGIN
CASE sg OF
1: BEGIN name:='UTTERANCE';
    length:=9 END;
2: BEGIN name:='CLAUSETOSENTENCE';
    length:=16 END;
3: BEGIN name:='XPPROPTOCLAUSE';
    length:=14 END;
4: BEGIN name:='VERBPPROPFORMATION';
    length:=18 END;
5: BEGIN name:='QPFORMATION';
    length:=11 END;
6: BEGIN name:='ADJDERIVATION';
    length:=13 END;
7: BEGIN name:='ADJPPROPFORMATION';
    length:=17 END;
8: BEGIN name:='ADJPPROPTOADJPFORMULA';
    length:=21 END;
9: BEGIN name:='ADJPFORMULATOADJPPROP';
    length:=21 END;
10: BEGIN name:='EXISTENTIAL';
    length:=11 END;
11: BEGIN name:='IDENTIFICATIONAL';
    length:=16 END;
12: BEGIN name:='VERBDERIVATION';
    length:=14 END;
13: BEGIN name:='NPDERIVATION';
    length:=12 END;
14: BEGIN name:='CNFORMATION';
    length:=11 END;
15: BEGIN name:='NPFORMATION';
    length:=11 END;
16: BEGIN name:='DETDERIVATION';
    length:=13 END;
17: BEGIN name:='DETPFORMATION';
    length:=13 END;
18: BEGIN name:='NPPROPFORMATION';
    length:=15 END;
19: BEGIN name:='TONPPROP';
    length:=8 END;
20: BEGIN name:='PREPDERIVATION';
    length:=14 END;
21: BEGIN name:='PREPPPROPFORMATION';
    length:=18 END;
22: BEGIN name:='PREPPPROPTOPREPPFORMULA';
    length:=23 END;
23: BEGIN name:='PREPPFORMULATOPREPPPROP';
    length:=23 END;
24: BEGIN name:='PREPPFORMATION';
    length:=14 END;
25: BEGIN name:='ADVDERIVATION';
    length:=13 END;
26: BEGIN name:='ADVPFORMATION';
    length:=13 END;
27: BEGIN name:='ADVPPROPFORMATION';
    length:=17 END;
28: BEGIN name:='ADVPPROPTOADVPFORMULA';
    length:=21 END;
29: BEGIN name:='ADVPFORMULATOADVPPROP';
    length:=21 END;
30: BEGIN name:='CARDINALS';
    length:=9 END;
31: BEGIN name:='DATUMFORMATION';
    length:=14 END;
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
2: R2:=1;
3: R2:=1;
4: R2:=1;
406: R2:=1;
5: R2:=1;
6: R2:=1;
7: R2:=1;
8: R2:=1;
423: R2:=2;
424: R2:=2;
425: R2:=2;
426: R2:=2;
33: R2:=2;
419: R2:=2;
420: R2:=2;
421: R2:=2;
422: R2:=2;
10: R2:=2;
11: R2:=2;
12: R2:=2;
13: R2:=2;
15: R2:=2;
16: R2:=2;
14: R2:=2;
17: R2:=2;
18: R2:=2;
369: R2:=2;
19: R2:=2;
20: R2:=2;
21: R2:=2;
22: R2:=2;
23: R2:=2;
24: R2:=2;
373: R2:=2;
374: R2:=2;
25: R2:=2;
246: R2:=2;
370: R2:=2;
371: R2:=2;
372: R2:=2;
377: R2:=2;
378: R2:=2;
247: R2:=2;
375: R2:=2;
364: R2:=2;
9: R2:=2;
365: R2:=2;
376: R2:=2;
366: R2:=2;
367: R2:=2;
368: R2:=2;
254: R2:=2;
26: R2:=2;
27: R2:=2;
28: R2:=2;
29: R2:=2;
30: R2:=2;
31: R2:=2;
334: R2:=2;
335: R2:=2;
330: R2:=2;
331: R2:=2;
332: R2:=2;
341: R2:=2;
345: R2:=2;
342: R2:=2;
343: R2:=2;
344: R2:=2;
333: R2:=2;
340: R2:=2;
336: R2:=2;
346: R2:=2;
337: R2:=2;
338: R2:=2;
339: R2:=2;
347: R2:=2;
32: R2:=2;
413: R2:=2;
414: R2:=2;
415: R2:=2;
416: R2:=2;
417: R2:=2;
418: R2:=2;
411: R2:=2;
407: R2:=2;
408: R2:=2;
409: R2:=2;
410: R2:=2;
52: R2:=3;
53: R2:=3;
54: R2:=3;
55: R2:=3;
56: R2:=3;
57: R2:=3;
58: R2:=3;
59: R2:=3;
60: R2:=3;
61: R2:=3;
256: R2:=3;
257: R2:=3;
258: R2:=3;
259: R2:=3;
260: R2:=3;
261: R2:=3;
262: R2:=3;
263: R2:=3;
264: R2:=3;
265: R2:=3;
62: R2:=3;
255: R2:=3;
64: R2:=3;
63: R2:=3;
266: R2:=3;
267: R2:=3;
269: R2:=3;
268: R2:=3;
270: R2:=3;
271: R2:=3;
65: R2:=3;
45: R2:=3;
46: R2:=3;
47: R2:=3;
48: R2:=3;
49: R2:=3;
50: R2:=3;
51: R2:=3;
239: R2:=3;
240: R2:=3;
241: R2:=3;
288: R2:=3;
289: R2:=3;
248: R2:=3;
249: R2:=3;
250: R2:=3;
272: R2:=3;
273: R2:=3;
278: R2:=3;
279: R2:=3;
280: R2:=3;
294: R2:=3;
290: R2:=3;
291: R2:=3;
292: R2:=3;
274: R2:=3;
275: R2:=3;
293: R2:=3;
251: R2:=3;
252: R2:=3;
253: R2:=3;
276: R2:=3;
277: R2:=3;
281: R2:=3;
282: R2:=3;
283: R2:=3;
284: R2:=3;
285: R2:=3;
287: R2:=3;
286: R2:=3;
471: R2:=3;
472: R2:=3;
473: R2:=3;
474: R2:=3;
34: R2:=3;
35: R2:=3;
36: R2:=3;
37: R2:=3;
38: R2:=3;
39: R2:=3;
41: R2:=3;
42: R2:=3;
43: R2:=3;
44: R2:=3;
40: R2:=3;
412: R2:=3;
68: R2:=4;
69: R2:=4;
70: R2:=4;
71: R2:=4;
72: R2:=4;
73: R2:=4;
74: R2:=4;
66: R2:=4;
67: R2:=4;
435: R2:=4;
436: R2:=4;
439: R2:=4;
440: R2:=4;
441: R2:=4;
442: R2:=4;
479: R2:=4;
443: R2:=4;
444: R2:=4;
445: R2:=4;
446: R2:=4;
480: R2:=4;
427: R2:=4;
478: R2:=4;
476: R2:=4;
348: R2:=4;
349: R2:=4;
350: R2:=4;
179: R2:=4;
243: R2:=4;
242: R2:=4;
244: R2:=4;
177: R2:=4;
178: R2:=4;
180: R2:=4;
181: R2:=4;
182: R2:=4;
175: R2:=4;
176: R2:=4;
221: R2:=4;
222: R2:=4;
223: R2:=4;
224: R2:=4;
115: R2:=5;
116: R2:=5;
122: R2:=5;
117: R2:=5;
118: R2:=5;
120: R2:=5;
121: R2:=5;
119: R2:=5;
123: R2:=5;
124: R2:=5;
81: R2:=6;
82: R2:=6;
83: R2:=7;
84: R2:=7;
85: R2:=7;
86: R2:=7;
87: R2:=7;
75: R2:=7;
76: R2:=7;
77: R2:=7;
78: R2:=7;
79: R2:=7;
80: R2:=7;
295: R2:=7;
296: R2:=7;
297: R2:=7;
91: R2:=7;
90: R2:=7;
208: R2:=7;
209: R2:=7;
210: R2:=7;
89: R2:=7;
88: R2:=7;
93: R2:=7;
94: R2:=8;
95: R2:=8;
96: R2:=8;
97: R2:=8;
98: R2:=8;
99: R2:=8;
298: R2:=8;
304: R2:=8;
305: R2:=8;
100: R2:=8;
101: R2:=8;
102: R2:=8;
103: R2:=8;
166: R2:=9;
167: R2:=9;
168: R2:=9;
169: R2:=9;
170: R2:=9;
171: R2:=9;
172: R2:=9;
174: R2:=9;
173: R2:=9;
225: R2:=10;
226: R2:=10;
211: R2:=10;
212: R2:=10;
196: R2:=10;
197: R2:=10;
198: R2:=10;
184: R2:=10;
187: R2:=10;
227: R2:=11;
228: R2:=11;
229: R2:=11;
230: R2:=11;
231: R2:=11;
232: R2:=11;
233: R2:=11;
213: R2:=11;
214: R2:=11;
193: R2:=11;
194: R2:=11;
195: R2:=11;
183: R2:=11;
186: R2:=11;
234: R2:=12;
143: R2:=13;
148: R2:=13;
150: R2:=13;
146: R2:=13;
149: R2:=13;
470: R2:=13;
147: R2:=13;
144: R2:=14;
145: R2:=14;
151: R2:=14;
152: R2:=14;
153: R2:=14;
154: R2:=14;
155: R2:=14;
156: R2:=14;
235: R2:=14;
236: R2:=14;
514: R2:=14;
515: R2:=14;
163: R2:=14;
165: R2:=14;
157: R2:=14;
158: R2:=14;
162: R2:=14;
452: R2:=14;
453: R2:=14;
455: R2:=14;
159: R2:=14;
160: R2:=14;
161: R2:=14;
164: R2:=14;
457: R2:=14;
237: R2:=14;
125: R2:=15;
126: R2:=15;
127: R2:=15;
128: R2:=15;
130: R2:=15;
129: R2:=15;
131: R2:=15;
461: R2:=15;
462: R2:=15;
463: R2:=15;
464: R2:=15;
132: R2:=15;
465: R2:=15;
466: R2:=15;
133: R2:=15;
467: R2:=15;
458: R2:=15;
459: R2:=15;
468: R2:=15;
469: R2:=15;
460: R2:=15;
238: R2:=15;
134: R2:=15;
135: R2:=15;
136: R2:=15;
137: R2:=15;
139: R2:=15;
140: R2:=15;
138: R2:=15;
456: R2:=15;
142: R2:=15;
141: R2:=15;
516: R2:=15;
517: R2:=15;
104: R2:=16;
105: R2:=17;
106: R2:=17;
110: R2:=17;
107: R2:=17;
112: R2:=17;
108: R2:=17;
109: R2:=17;
111: R2:=17;
507: R2:=18;
508: R2:=18;
509: R2:=18;
215: R2:=18;
216: R2:=18;
199: R2:=18;
200: R2:=18;
201: R2:=18;
189: R2:=18;
190: R2:=18;
518: R2:=19;
510: R2:=19;
511: R2:=19;
512: R2:=19;
513: R2:=19;
307: R2:=20;
308: R2:=21;
309: R2:=21;
310: R2:=21;
429: R2:=21;
430: R2:=21;
311: R2:=21;
312: R2:=21;
313: R2:=21;
219: R2:=21;
220: R2:=21;
202: R2:=21;
203: R2:=21;
204: R2:=21;
185: R2:=21;
188: R2:=21;
314: R2:=21;
315: R2:=21;
316: R2:=21;
317: R2:=22;
318: R2:=22;
319: R2:=22;
322: R2:=23;
324: R2:=23;
326: R2:=23;
327: R2:=23;
328: R2:=23;
323: R2:=23;
325: R2:=23;
320: R2:=23;
321: R2:=23;
329: R2:=23;
351: R2:=24;
352: R2:=24;
431: R2:=24;
434: R2:=24;
432: R2:=24;
433: R2:=24;
362: R2:=24;
353: R2:=24;
354: R2:=24;
355: R2:=24;
358: R2:=24;
360: R2:=24;
361: R2:=24;
356: R2:=24;
359: R2:=24;
357: R2:=24;
363: R2:=24;
379: R2:=25;
380: R2:=25;
381: R2:=25;
382: R2:=26;
383: R2:=26;
392: R2:=26;
384: R2:=26;
385: R2:=26;
386: R2:=26;
393: R2:=26;
114: R2:=26;
387: R2:=26;
388: R2:=26;
389: R2:=26;
390: R2:=26;
391: R2:=26;
113: R2:=26;
394: R2:=27;
395: R2:=27;
396: R2:=27;
397: R2:=27;
217: R2:=27;
218: R2:=27;
205: R2:=27;
206: R2:=27;
207: R2:=27;
191: R2:=27;
192: R2:=27;
398: R2:=27;
399: R2:=28;
400: R2:=28;
401: R2:=28;
402: R2:=29;
403: R2:=29;
404: R2:=29;
405: R2:=29;
481: R2:=30;
482: R2:=30;
483: R2:=31;
485: R2:=31;
484: R2:=31;
486: R2:=31;
499: R2:=32;
494: R2:=32;
501: R2:=32;
502: R2:=32;
503: R2:=32;
504: R2:=32;
506: R2:=32;
505: R2:=32;
492: R2:=32;
495: R2:=32;
490: R2:=32;
491: R2:=32;
487: R2:=32;
489: R2:=32;
488: R2:=32;
496: R2:=32;
500: R2:=32;
497: R2:=32;
498: R2:=32;
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
LDMRULES_makeparamlist(p);
p^.paramname:='CASESPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;
  END;
4: BEGIN

  END;
5: BEGIN

  END;
6: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
7: BEGIN

  END;
8: BEGIN

  END;
9: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
10: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
11: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
12: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
13: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
14: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
15: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
16: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
17: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
18: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
19: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
20: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
21: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
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
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
35: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
36: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
37: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
38: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
39: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
40: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
41: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
42: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
43: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
44: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
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

  END;
91: BEGIN

  END;
92: BEGIN

  END;
93: BEGIN

  END;
94: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
95: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
96: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
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

  END;
105: BEGIN

  END;
106: BEGIN

  END;
107: BEGIN

  END;
108: BEGIN

  END;
109: BEGIN

  END;
110: BEGIN

  END;
111: BEGIN

  END;
112: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='SUPER';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
113: BEGIN

  END;
114: BEGIN

  END;
115: BEGIN

  END;
116: BEGIN

  END;
117: BEGIN

  END;
118: BEGIN

  END;
119: BEGIN

  END;
120: BEGIN

  END;
121: BEGIN

  END;
122: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='SUPER';
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

  END;
126: BEGIN

  END;
127: BEGIN

  END;
128: BEGIN

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

  END;
142: BEGIN

  END;
143: BEGIN

  END;
144: BEGIN

  END;
145: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='NUMBERPAR';
p^.length:=9;
p^.next:=paramlist;
paramlist:=p;
  END;
146: BEGIN

  END;
147: BEGIN

  END;
148: BEGIN

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
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
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
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
163: BEGIN

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

  END;
171: BEGIN

  END;
172: BEGIN

  END;
173: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
174: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
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
LDMRULES_makeparamlist(p);
p^.paramname:='VOICEPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;
  END;
222: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='VOICEPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;
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
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
247: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
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
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
256: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
257: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
258: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
259: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
260: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
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
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
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
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
267: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
268: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
269: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
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
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
303: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
304: BEGIN

  END;
305: BEGIN

  END;
306: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
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

  END;
314: BEGIN

  END;
315: BEGIN

  END;
316: BEGIN

  END;
317: BEGIN

  END;
318: BEGIN

  END;
319: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='SUPER';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
320: BEGIN

  END;
321: BEGIN

  END;
322: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
323: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
324: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
325: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
326: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
327: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
328: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
329: BEGIN

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

  END;
338: BEGIN

  END;
339: BEGIN

  END;
340: BEGIN

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
LDMRULES_makeparamlist(p);
p^.paramname:='GELIEVEPAR';
p^.length:=10;
p^.next:=paramlist;
paramlist:=p;
  END;
348: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='ADJUNCTPAR';
p^.length:=10;
p^.next:=paramlist;
paramlist:=p;
  END;
349: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='ADJUNCTPAR';
p^.length:=10;
p^.next:=paramlist;
paramlist:=p;
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
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
358: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
359: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
360: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
361: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
362: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='SUPER';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
363: BEGIN

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
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
372: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
373: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
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
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
378: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
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
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
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
p^.paramname:='SUPER';
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
LDMRULES_makeparamlist(p);
p^.paramname:='SUPER';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
402: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
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
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;LDMRULES_makeparamlist(p);
p^.paramname:='ANTECEDENT';
p^.length:=10;
p^.next:=paramlist;
paramlist:=p;
  END;
413: BEGIN

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

  END;
420: BEGIN

  END;
421: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='RELPAR';
p^.length:=6;
p^.next:=paramlist;
paramlist:=p;
  END;
422: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='RELPAR';
p^.length:=6;
p^.next:=paramlist;
paramlist:=p;
  END;
423: BEGIN
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
424: BEGIN
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
425: BEGIN
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
426: BEGIN
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

  END;
436: BEGIN

  END;
437: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='VPID';
p^.length:=4;
p^.next:=paramlist;
paramlist:=p;
  END;
438: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='VPID';
p^.length:=4;
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

  END;
451: BEGIN

  END;
452: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
453: BEGIN

  END;
454: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
455: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
456: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
457: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
458: BEGIN

  END;
459: BEGIN

  END;
460: BEGIN

  END;
461: BEGIN

  END;
462: BEGIN

  END;
463: BEGIN

  END;
464: BEGIN

  END;
465: BEGIN

  END;
466: BEGIN

  END;
467: BEGIN

  END;
468: BEGIN

  END;
469: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='CONTROLLERPAR';
p^.length:=13;
p^.next:=paramlist;
paramlist:=p;
  END;
470: BEGIN

  END;
471: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
472: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
473: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
474: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
475: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='VPID';
p^.length:=4;
p^.next:=paramlist;
paramlist:=p;
  END;
476: BEGIN

  END;
477: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='VPID';
p^.length:=4;
p^.next:=paramlist;
paramlist:=p;LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
478: BEGIN

  END;
479: BEGIN

  END;
480: BEGIN

  END;
481: BEGIN

  END;
482: BEGIN

  END;
483: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='SUPERPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;
  END;
484: BEGIN

  END;
485: BEGIN

  END;
486: BEGIN

  END;
487: BEGIN

  END;
488: BEGIN

  END;
489: BEGIN

  END;
490: BEGIN

  END;
491: BEGIN

  END;
492: BEGIN

  END;
493: BEGIN

  END;
494: BEGIN

  END;
495: BEGIN

  END;
496: BEGIN

  END;
497: BEGIN

  END;
498: BEGIN

  END;
499: BEGIN

  END;
500: BEGIN

  END;
501: BEGIN

  END;
502: BEGIN

  END;
503: BEGIN

  END;
504: BEGIN

  END;
505: BEGIN

  END;
506: BEGIN

  END;
507: BEGIN

  END;
508: BEGIN

  END;
509: BEGIN

  END;
510: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
511: BEGIN

  END;
512: BEGIN

  END;
513: BEGIN

  END;
514: BEGIN

  END;
515: BEGIN

  END;
516: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
517: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
518: BEGIN
LDMRULES_makeparamlist(p);
p^.paramname:='SUPER';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
  END;
END{CASE};
params:=paramlist;
END;
