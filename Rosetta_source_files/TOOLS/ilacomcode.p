EXPORT(ilacomcode);
pragma C_include('ilacomcode.pf');
pragma C_include('ilacomdecl.pf');
pragma C_include('ilacomlangspec.pf');
pragma C_include('ldtypetostr.pf');
pragma C_include('lduniquerels.pf');
pragma C_include('ldmrules.pf');
pragma C_include('files.pf');
pragma C_include('tfiles.pf');
pragma C_include('tstring.pf');
pragma C_include('str.pf');
pragma C_include('string.pf');
pragma C_include('strings.pf');
pragma C_include('lidomaint.pf');
pragma C_include('mem.pf');
pragma C_include('tldstrtostr.pf');
pragma C_include('ldconvrec.pf');
pragma C_include('tldconvrec.pf');
pragma C_include('ldstrtotype.pf');
pragma C_include('ldcatsets.pf');
PROGRAM ilacomCODE;
WITH ilacomlangspec,
ilacomdecl,ldtypetostr,lduniquerels,ldmrules,files,tfiles,tstring,lidomaint,str,mem,
tldstrtostr,ldconvrec,tldconvrec,ldstrtotype,ldcatsets,strng;
VAR TYPESPEC__parametertypes              :LOCALFILE
;TYPESPEC__converttypes              :LOCALFILE
;TYPEDEFINITION__parametertypes              :LOCALFILE
;TYPEDEFINITION__converttypes              :LOCALFILE
;ENUMDEF__parametertype              :LOCALFILE
;ENUMDEF__converttype              :LOCALFILE
;SUBRANGEDEF__parametertype              :LOCALFILE
;SUBRANGEDEF__converttype              :LOCALFILE
;INTEGERDEF__parametertype              :LOCALFILE
;INTEGERDEF__converttype              :LOCALFILE
;BOOLEANDEF__parametertype              :LOCALFILE
;BOOLEANDEF__converttype              :LOCALFILE
;SETDEF__parametertype              :LOCALFILE
;SETDEF__converttype              :LOCALFILE
;of1:files_text;
of2:files_text;
PROCEDURE ilacomCODE_UTTproc(top:ilacomDECL_psnode
);
VAR currenttree:ilacomDECL_psnode;
    rsnode1:ilacomDECL_prsnode;
 parametertypes:LOCALFILE;
converttypes:LOCALFILE;
typestable: ilacomLANGSPEC_setoftypespecs;
rulespec: ilacomLANGSPEC_rulespec;
typespec: ilacomLANGSPEC_typespec;
params: ilacomLANGSPEC_setofparams;
param: ilacomLANGSPEC_param;
i:INTEGER;
rulestable,rulestable1: ilacomLANGSPEC_setofrulespecs;
 PROCEDURE findtypespec(str:TSTRING_string;typestable: ilacomLANGSPEC_setoftypespecs;
VAR typespec: ilacomLANGSPEC_typespec);
VAR found: ilacomLANGSPEC_bool;
BEGIN
found:=false;
WHILE stilltypespecs(typestable) AND NOT found DO
BEGIN
taketypespec(typespec,typestable);
found:=TSTRING_compare(typespec.typename,str)=0;
END;
END;
BEGIN 
BEGIN INITlocalfile(parametertypes);
INITlocalfile(converttypes);
typestable:=top^.ldfield.UTTfield^.typestable;
rulestable:=top^.ldfield.UTTfield^.rulestable;
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN END
;
 BEGIN 
TFILES_open(of1,'ilofenv',7,3);
BEGIN
TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'pragma C_include(''windows.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'PACKAGE LIILRULES;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'WITH windows;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'TYPE ',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);

 
TFILES_writestr(of1,
'LIILrules_ruleindex = INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


END;
TFILES_open(of2,'ilofpas',7,3);
BEGIN
TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'EXPORT(liilrules);',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'pragma C_include(''liilrules.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'pragma C_include(''strings.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'pragma C_include(''windows.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'pragma C_include(''ldconvrec.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'pragma C_include(''mem.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'pragma C_include(''str.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'pragma C_include(''lirectoscreen.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'PROGRAM LIILrules;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'WITH windows,ldconvrec,mem,str,lirectoscreen;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


END;
END
END;

2: begin
  BEGIN END
; ilacomCODE_TYPESPECproc(currenttree
,TYPESPEC__parametertypes
,TYPESPEC__converttypes
);
 BEGIN parametertypes:=TYPESPEC__parametertypes;
converttypes:=TYPESPEC__converttypes;
END
END;

3: begin
  BEGIN END
; ilacomCODE_ILRULESSPECproc(currenttree
);
 BEGIN 
END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN
BEGIN
TFILES_writeline(of1,TRUE);

TFILES_writeline(of1,TRUE);


appendfile(parametertypes,of1);
TFILES_writestr(of1,
'TYPE ',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);

 
TFILES_writestr(of1,
'LIILrules_ILparams = RECORD',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'CASE rulenr:LIILrules_RuleIndex OF',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


rulestable1:=rulestable;
WHILE stillrulespecs(rulestable1) DO
BEGIN
takerulespec(rulespec,rulestable1);
TFILES_writeinteger(of1,
rulespec.rulenr,0,left);

 TFILES_writestr(of1,
': (',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


params:=rulespec.params;
WHILE stillparams(params) DO
BEGIN
takeparam(param,params);
IF TSTRING_comparechars(param.name,'LEVEL',5)<>0 THEN
BEGIN
TFILES_writestr(of1,
'X',FILES_maxIO,0,left);

 TFILES_writeinteger(of1,
rulespec.rulenr,0,left);

 TFILES_writestring(of1,
param.name,0,left);

 
TFILES_writestr(of1,
' : LIILRULES_',FILES_maxIO,0,left);

 
TFILES_writestring(of1,
param.typename,0,left);

 TFILES_writestr(of1,
';',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


END;
END;
TFILES_writestr(of1,
');',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


END;
TFILES_writestr(of1,
'END;{ILparams}',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'LIILrules_LIparameters = RECORD',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1,5);TFILES_writestr(of1,
'index:INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1,5);TFILES_writestr(of1,
'subst:INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1,5);TFILES_writestr(of1,
'params:LIILrules_ILparams;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'LIILRULES_paramlist = ^LIILRULES_aramlist;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'LIILRULES_aramlist = RECORD',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' paramname: string(20);',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' length : INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' next : LIILRULES_paramlist',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' PROCEDURE LIILRULES_RuleName (R:LIILrules_RuleIndex;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' VAR name: string;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' VAR length: INTEGER); EXTERNAL;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' PROCEDURE LIILRULES_RuleParameters (R:LIILrules_RuleIndex;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' VAR params: LIILRULES_paramlist); EXTERNAL;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' PROCEDURE LIILRULES_RuleNumber (VAR R:LIILrules_RuleIndex;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' CONST name: string;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' length: INTEGER); EXTERNAL;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' PROCEDURE LIILRULES_PrintParameters (w:WINDOWS_device;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' parameters: LIILRULES_LIparameters); EXTERNAL;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'END; {LIILrules}',FILES_maxIO,0,left);


END;
BEGIN
TFILES_writeline(of2,TRUE);

TFILES_writeline(of2,TRUE);


appendfile(converttypes,of2);
TFILES_writestr(of2,
'PROCEDURE MakeParamlist(VAR p:LIILRULES_paramlist);',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'MEM_NewDefault(loopholes.sizeof',FILES_maxIO,0,left);


TFILES_writestr(of2,
'(LIILRULES_aramlist),loopholes.retype(p,MEM_Ptr));',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' PROCEDURE LIILRULES_RuleName (R:LIILrules_RuleIndex;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' VAR name: string;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' VAR length: INTEGER);',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' CASE R OF',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


rulestable1:=rulestable;
WHILE stillrulespecs(rulestable1) DO
BEGIN
takerulespec(rulespec,rulestable1);
TFILES_writeinteger(of2,
rulespec.rulenr,0,left);

 TFILES_writestr(of2,
': BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' name := ''',FILES_maxIO,0,left);

 TFILES_writestring(of2,
rulespec.rulename,0,left);

 TFILES_writestr(of2,
''';',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' length := ',FILES_maxIO,0,left);

 TFILES_writeinteger(of2,
TSTRING_length(rulespec.rulename),0,left);

 TFILES_writestr(of2,
';',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' END;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);

 
END;
TFILES_writestr(of2,
' END{CASE};',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' PROCEDURE LIILRULES_RuleParameters (R:LIILrules_RuleIndex;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' VAR params: LIILRULES_paramlist);',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' VAR paramlist,p:LIILRULES_paramlist;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'paramlist:=NIL;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'CASE R OF',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


rulestable1:=rulestable;
WHILE stillrulespecs(rulestable1) DO
BEGIN
takerulespec(rulespec,rulestable1);
TFILES_writeinteger(of2,
rulespec.rulenr,0,left);

 TFILES_writestr(of2,
': BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


params:=rulespec.params;
WHILE stillparams(params) DO
BEGIN
takeparam(param,params);
TFILES_writestr(of2,
'makeparamlist(p);',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'p^.paramname:=''',FILES_maxIO,0,left);

 TFILES_writestring(of2,
param.name,0,left);

 TFILES_writestr(of2,
''';',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'p^.length:=',FILES_maxIO,0,left);

 TFILES_writeinteger(of2,
TSTRING_length(param.name),0,left);

 TFILES_writestr(of2,
';',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'p^.next:=paramlist;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'paramlist:=p;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


END;
TFILES_writestr(of2,
' END;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);

 
END;
TFILES_writestr(of2,
' END{CASE};',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'params:=paramlist;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' PROCEDURE LIILRULES_RuleNumber (VAR R:LIILrules_RuleIndex;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' CONST name: string;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' length: INTEGER);',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'R := -1;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


rulestable1:=rulestable;
WHILE stillrulespecs(rulestable1) DO
BEGIN
takerulespec(rulespec,rulestable1);
TFILES_writestr(of2,
'IF STR_compare(name,length,''',FILES_maxIO,0,left);


TFILES_writestring(of2,
rulespec.rulename,0,left);

 TFILES_writestr(of2,
''',',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writeinteger(of2,
TSTRING_length(rulespec.rulename),0,left);

 TFILES_writestr(of2,
')=0 THEN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' R := ',FILES_maxIO,0,left);

 TFILES_writeinteger(of2,
rulespec.rulenr,0,left);

 TFILES_writestr(of2,
';',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


END;
TFILES_writestr(of2,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' PROCEDURE LIILRULES_PrintParameters (w:WINDOWS_device;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' parameters: LIILRULES_LIparameters);',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' VAR p,attrstruct:LDCONVREC_pattrstruct;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' len1:INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' q:LDCONVREC_psetvaluetype;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


rulestable1:=rulestable;
WHILE stillrulespecs(rulestable1) DO
BEGIN
takerulespec(rulespec,rulestable1);
params:=rulespec.params;
i:=0;
WHILE stillparams(params) DO
BEGIN
i:=i+1;
takeparam(param,params);
findtypespec(param.typename,typestable,typespec);
IF typespec.typekind=setkind THEN
BEGIN
TFILES_writestr(of2,
' val',FILES_maxIO,0,left);

 TFILES_writeinteger(of2,
rulespec.rulenr,0,left);

 TFILES_writestr(of2,
'X',FILES_maxIO,0,left);


TFILES_writeinteger(of2,
i,0,left);

 TFILES_writestr(of2,
' : LIILRULES_',FILES_maxIO,0,left);

 TFILES_writestring(of2,
typespec.basetype,0,left);

 
TFILES_writestr(of2,
';',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


END;
END;
END;
TFILES_writestr(of2,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'attrstruct:=NIL;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'CASE parameters.params.rulenr OF',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


rulestable1:=rulestable;
WHILE stillrulespecs(rulestable1) DO
BEGIN
takerulespec(rulespec,rulestable1);
TFILES_writeinteger(of2,
rulespec.rulenr,0,left);

 TFILES_writestr(of2,
': BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'MEM_newdefault(loopholes.sizeof',FILES_maxIO,0,left);


TFILES_writestr(of2,
'(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'p^.nextattr:=attrstruct;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'attrstruct:=p;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'p^.setvalue:=NIL;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'p^.typeindicator:=enumeration;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'p^.fieldname.str:=''ILRULE'';',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'p^.fieldname.len:=6;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'LIILRULES_rulename(',FILES_maxIO,0,left);

 TFILES_writeinteger(of2,
rulespec.rulenr,0,left);


TFILES_writestr(of2,
',p^.fieldvalue.str,len1);',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'p^.fieldvalue.len:=len1;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


params:=rulespec.params;
i:=0;
WHILE stillparams(params) DO
BEGIN
i:=i+1;
takeparam(param,params);
findtypespec(param.typename,typestable,typespec);
TFILES_writestr(of2,
'MEM_newdefault(loopholes.sizeof',FILES_maxIO,0,left);


TFILES_writestr(of2,
'(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'p^.nextattr:=attrstruct;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'attrstruct:=p;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'p^.setvalue:=NIL;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


IF typespec.typekind<>setkind THEN
BEGIN
TFILES_writestr(of2,
'p^.typeindicator:=enumeration;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'p^.fieldname.str:=''',FILES_maxIO,0,left);

 TFILES_writestring(of2,
param.name,0,left);

 TFILES_writestr(of2,
''';',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'p^.fieldname.len:=',FILES_maxIO,0,left);

 TFILES_writeinteger(of2,
TSTRING_length(param.name),0,left);

 TFILES_writestr(of2,
';',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'conv',FILES_maxIO,0,left);

 TFILES_writestring(of2,
param.typename,0,left);

 
IF TSTRING_comparechars(param.name,'LEVEL',5)<>0 THEN
BEGIN
TFILES_writestr(of2,
'(parameters.params.X',FILES_maxIO,0,left);


TFILES_writeinteger(of2,
rulespec.rulenr,0,left);

 TFILES_writestring(of2,
param.name,0,left);


END
ELSE
BEGIN
TFILES_writestr(of2,
'(parameters.index',FILES_maxIO,0,left);


END;
TFILES_writestr(of2,
',p^.fieldvalue.str,len1);',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'p^.fieldvalue.len:=len1;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


END
ELSE {setkind}
BEGIN
TFILES_writestr(of2,
'p^.typeindicator:=enumset;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'FOR val',FILES_maxIO,0,left);

 TFILES_writeinteger(of2,
rulespec.rulenr,0,left);

 TFILES_writestr(of2,
'X',FILES_maxIO,0,left);


TFILES_writeinteger(of2,
i,0,left);

 TFILES_writestr(of2,
':=',FILES_maxIO,0,left);

 TFILES_writestring(of2,
typespec.basefirst,0,left);


TFILES_writestr(of2,
' TO ',FILES_maxIO,0,left);

 TFILES_writestring(of2,
typespec.baselast,0,left);

 TFILES_writestr(of2,
' DO',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'IF val',FILES_maxIO,0,left);

 TFILES_writeinteger(of2,
rulespec.rulenr,0,left);

 TFILES_writestr(of2,
'X',FILES_maxIO,0,left);


TFILES_writeinteger(of2,
i,0,left);

 TFILES_writestr(of2,
' IN parameters.params.X',FILES_maxIO,0,left);

 TFILES_writeinteger(of2,
rulespec.rulenr,0,left);


TFILES_writestring(of2,
param.name,0,left);

 TFILES_writestr(of2,
' THEN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'MEM_newdefault(loopholes.sizeof',FILES_maxIO,0,left);


TFILES_writestr(of2,
'(LDCONVREC_setvaluetype),q::MEM_ptr);',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'q^.nextvalue:=p^.setvalue;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'p^.setvalue:=q;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'conv',FILES_maxIO,0,left);

 TFILES_writestring(of2,
typespec.basetype,0,left);

 TFILES_writestr(of2,
'(',FILES_maxIO,0,left);


TFILES_writestr(of2,
'val',FILES_maxIO,0,left);

 TFILES_writeinteger(of2,
rulespec.rulenr,0,left);

 
TFILES_writestr(of2,
'X',FILES_maxIO,0,left);

 TFILES_writeinteger(of2,
i,0,left);


TFILES_writestr(of2,
',p^.setvalue^.eltvalue.str,',FILES_maxIO,0,left);


TFILES_writestr(of2,
'len1 );',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'p^.setvalue^.eltvalue.len:=len1;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


END;
END;
TFILES_writestr(of2,
' END;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);

 
END;
TFILES_writestr(of2,
' END{CASE};',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'LIRECTOSCREEN_write(w,attrstruct);',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


END;
END
END;
PROCEDURE ilacomCODE_TYPESPECproc(top:ilacomDECL_psnode
;var TYPESPEC_parametertypes              :LOCALFILE
;var TYPESPEC_converttypes              :LOCALFILE
);
VAR currenttree:ilacomDECL_psnode;
    rsnode1:ilacomDECL_prsnode;
 parametertypes,converttypes:LOCALFILE; 
BEGIN
 BEGIN INITLOCALFILE(parametertypes);
INITLOCALFILE(converttypes);

appendstring('PROCEDURE convINTEGER(',converttypes);

appendstring('valeu:INTEGER;',converttypes);

appendstring('VAR str:string;',converttypes);

appendstring('VAR len:INTEGER);',converttypes);
appendstring('\\',converttypes);

appendstring('VAR len1:STR_range;',converttypes);
appendstring('\\',converttypes);

appendstring('BEGIN',converttypes);
appendstring('\\',converttypes);

appendstring('STR_IntegerTostr(valeu,str,len1);',converttypes);
appendstring('\\',converttypes);

appendstring('len:=len1;',converttypes);
appendstring('\\',converttypes);

appendstring('END;',converttypes);
appendstring('\\',converttypes);

END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN
END
;
 BEGIN END
END;

2: begin
  BEGIN END
; ilacomCODE_TYPEDEFINITIONproc(currenttree
,TYPEDEFINITION__parametertypes
,TYPEDEFINITION__converttypes
);
 BEGIN appendlocfile(TYPEDEFINITION__parametertypes,
parametertypes);
appendlocfile(TYPEDEFINITION__converttypes,
converttypes);
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN TYPESPEC_parametertypes:=parametertypes;
TYPESPEC_converttypes:=converttypes;
END
END;
PROCEDURE ilacomCODE_TYPEDEFINITIONproc(top:ilacomDECL_psnode
;var TYPEDEFINITION_parametertypes              :LOCALFILE
;var TYPEDEFINITION_converttypes              :LOCALFILE
);
VAR currenttree:ilacomDECL_psnode;
    rsnode1:ilacomDECL_prsnode;
 parametertypes,converttypes:LOCALFILE;
BEGIN
 BEGIN initlocalfile(parametertypes);
initlocalfile(converttypes);
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN
END
; ilacomCODE_ENUMDEFproc(currenttree
,ENUMDEF__parametertype
,ENUMDEF__converttype
);
 BEGIN appendlocfile(ENUMDEF__parametertype,parametertypes);
appendlocfile(ENUMDEF__converttype,converttypes);
END
END;

2: begin
  BEGIN END
; ilacomCODE_SUBRANGEDEFproc(currenttree
,SUBRANGEDEF__parametertype
,SUBRANGEDEF__converttype
);
 BEGIN appendlocfile(SUBRANGEDEF__parametertype,parametertypes);
appendlocfile(SUBRANGEDEF__converttype,converttypes);
END
END;

3: begin
  BEGIN END
; ilacomCODE_INTEGERDEFproc(currenttree
,INTEGERDEF__parametertype
,INTEGERDEF__converttype
);
 BEGIN appendlocfile(INTEGERDEF__parametertype,parametertypes);
appendlocfile(INTEGERDEF__converttype,converttypes);
END
END;

4: begin
  BEGIN END
; ilacomCODE_BOOLEANDEFproc(currenttree
,BOOLEANDEF__parametertype
,BOOLEANDEF__converttype
);
 BEGIN appendlocfile(BOOLEANDEF__parametertype,parametertypes);
appendlocfile(BOOLEANDEF__converttype,converttypes);
END
END;

5: begin
  BEGIN END
; ilacomCODE_SETDEFproc(currenttree
,SETDEF__parametertype
,SETDEF__converttype
);
 BEGIN appendlocfile(SETDEF__parametertype,parametertypes);
appendlocfile(SETDEF__converttype,converttypes);
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN TYPEDEFINITION_parametertypes:=parametertypes;
TYPEDEFINITION_converttypes:=converttypes;
END
END;
PROCEDURE ilacomCODE_ENUMDEFproc(top:ilacomDECL_psnode
;var ENUMDEF_parametertype              :LOCALFILE
;var ENUMDEF_converttype              :LOCALFILE
);
VAR currenttree:ilacomDECL_psnode;
    rsnode1:ilacomDECL_prsnode;
 parametertype,converttype:LOCALFILE;
str:TSTRING_string;
BEGIN
 BEGIN INITlocalfile(parametertype);
initlocalfile(converttype);
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN
END
;
 BEGIN END
END;

2: begin
  BEGIN END
;
 BEGIN 
str:=currenttree^.ldfield.TYPENAMEfield^.str;
appendstring('LIILrules_',parametertype);
 appendstring(str,parametertype);
 appendstring(' = (',parametertype);
 appendstring('\\',parametertype);


appendstring('PROCEDURE ',converttype);
 appendstring('conv',converttype);
 appendstring(str,converttype);

appendstring('(valeu:LIILRULES_',converttype);
 appendstring(str,converttype);
 appendstring(';',converttype);
appendstring('\\',converttype);

appendstring('VAR str:string;',converttype);

appendstring('VAR len:INTEGER);',converttype);
appendstring('\\',converttype);

appendstring('BEGIN',converttype);
appendstring('\\',converttype);

END
END;

3: begin
  BEGIN END
;
 BEGIN 
str:=currenttree^.ldfield.TERMINAL^.str;
appendstring(str,parametertype);
appendstring('\\',parametertype);


appendstring('IF valeu=',converttype);
 appendstring(str,converttype);
 appendstring(' THEN',converttype);
appendstring('\\',converttype);

appendstring('BEGIN ',converttype);
appendstring('\\',converttype);

appendstring('str:=''',converttype);

appendstring(str,converttype);
 appendstring(''';',converttype);
appendstring('\\',converttype);

appendstring('len:=',converttype);
 appendstring(ilacomDECL_convinttostring(TSTRING_length(str)),converttype);
 
appendstring(' END;',converttype);
appendstring('\\',converttype);

END
END;

4: begin
  BEGIN END
;
 BEGIN 
appendstring(',',parametertype);
 
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
appendstring(');',parametertype);
appendstring('\\',parametertype);


appendstring('END;',converttype);
appendstring('\\',converttype);

ENUMDEF_converttype:=converttype;
ENUMDEF_parametertype:=parametertype;
END
END;
PROCEDURE ilacomCODE_SUBRANGEDEFproc(top:ilacomDECL_psnode
;var SUBRANGEDEF_parametertype              :LOCALFILE
;var SUBRANGEDEF_converttype              :LOCALFILE
);
VAR currenttree:ilacomDECL_psnode;
    rsnode1:ilacomDECL_prsnode;
 parametertype,converttype:LOCALFILE;
str:TSTRING_string;
BEGIN
 BEGIN initlocalfile(parametertype);
initlocalfile(converttype);
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN
END
;
 BEGIN END
END;

2: begin
  BEGIN END
;
 BEGIN str:=currenttree^.ldfield.TYPENAMEfield^.str;

appendstring('LIILrules_',parametertype);
 appendstring(str,parametertype);
 appendstring('=',parametertype);
appendstring('\\',parametertype);


appendstring('PROCEDURE conv',converttype);
 appendstring(str,converttype);
 appendstring('(',converttype);

appendstring('valeu:LIILRULES_',converttype);
 appendstring(str,converttype);
 appendstring(';',converttype);

appendstring('VAR str:string;',converttype);

appendstring('VAR len:INTEGER);',converttype);
appendstring('\\',converttype);

appendstring('VAR len1:STR_range;',converttype);
appendstring('\\',converttype);

appendstring('BEGIN',converttype);
appendstring('\\',converttype);

appendstring('STR_IntegerTostr(valeu,str,len1);',converttype);
appendstring('\\',converttype);

appendstring('len:=len1;',converttype);
appendstring('\\',converttype);

appendstring('END;',converttype);
appendstring('\\',converttype);

END
END;

3: begin
  BEGIN END
;
 BEGIN str:=currenttree^.ldfield.TERMINAL^.str;

appendstring(str,parametertype);
 appendstring('..',parametertype);

END
END;

4: begin
  BEGIN END
;
 BEGIN str:=currenttree^.ldfield.TERMINAL^.str;

appendstring(str,parametertype);
 appendstring(';',parametertype);
 appendstring('\\',parametertype);

END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN SUBRANGEDEF_parametertype:=parametertype;
SUBRANGEDEF_converttype:=converttype;
END
END;
PROCEDURE ilacomCODE_INTEGERDEFproc(top:ilacomDECL_psnode
;var INTEGERDEF_parametertype              :LOCALFILE
;var INTEGERDEF_converttype              :LOCALFILE
);
VAR currenttree:ilacomDECL_psnode;
    rsnode1:ilacomDECL_prsnode;
 parametertype,converttype:LOCALFILE;
str:TSTRING_string;
BEGIN
 BEGIN initlocalfile(parametertype);
initlocalfile(converttype);
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN
END
;
 BEGIN END
END;

2: begin
  BEGIN END
;
 BEGIN str:=currenttree^.ldfield.TYPENAMEfield^.str;

appendstring('LIILrules_',parametertype);
 appendstring(str,parametertype);
 appendstring('=INTEGER;',parametertype);
appendstring('\\',parametertype);


appendstring('PROCEDURE conv',converttype);
 appendstring(str,converttype);
 appendstring('(',converttype);

appendstring('valeu:LIILRULES_',converttype);
 appendstring(str,converttype);
 appendstring(';',converttype);

appendstring('VAR str:string;',converttype);

appendstring('VAR len:INTEGER);',converttype);
appendstring('\\',converttype);

appendstring('VAR len1:STR_range;',converttype);
appendstring('\\',converttype);

appendstring('BEGIN',converttype);
appendstring('\\',converttype);

appendstring('STR_IntegerTostr(valeu,str,len1);',converttype);
appendstring('\\',converttype);

appendstring('len:=len1;',converttype);
appendstring('\\',converttype);

appendstring('len:=len1;',converttype);
appendstring('\\',converttype);

appendstring('END;',converttype);
appendstring('\\',converttype);

END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN INTEGERDEF_parametertype:=parametertype;
INTEGERDEF_converttype:=converttype;
END
END;
PROCEDURE ilacomCODE_BOOLEANDEFproc(top:ilacomDECL_psnode
;var BOOLEANDEF_parametertype              :LOCALFILE
;var BOOLEANDEF_converttype              :LOCALFILE
);
VAR currenttree:ilacomDECL_psnode;
    rsnode1:ilacomDECL_prsnode;
 parametertype,converttype:LOCALFILE;
str:TSTRING_string;
BEGIN
 BEGIN initlocalfile(parametertype);
initlocalfile(converttype);
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN
END
;
 BEGIN END
END;

2: begin
  BEGIN END
;
 BEGIN str:=currenttree^.ldfield.TYPENAMEfield^.str;

appendstring('LIILrules_',parametertype);
 appendstring(str,parametertype);
 appendstring('=BOOLEAN;',parametertype);
appendstring('\\',parametertype);


appendstring('PROCEDURE conv',converttype);
 appendstring(str,converttype);
 appendstring('(',converttype);

appendstring('valeu:LIILRULES_',converttype);
 appendstring(str,converttype);
 appendstring(';',converttype);

appendstring('VAR str:string;',converttype);

appendstring('VAR len:INTEGER);',converttype);
appendstring('\\',converttype);

appendstring('BEGIN',converttype);
appendstring('\\',converttype);

appendstring('STR_BooleanTostr(valeu,str,len);',converttype);
appendstring('\\',converttype);

appendstring('END;',converttype);
appendstring('\\',converttype);

END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN BOOLEANDEF_parametertype:=parametertype;
BOOLEANDEF_converttype:=converttype;
END
END;
PROCEDURE ilacomCODE_SETDEFproc(top:ilacomDECL_psnode
;var SETDEF_parametertype              :LOCALFILE
;var SETDEF_converttype              :LOCALFILE
);
VAR currenttree:ilacomDECL_psnode;
    rsnode1:ilacomDECL_prsnode;
 parametertype,converttype:LOCALFILE;
str:TSTRING_string; 
BEGIN
 BEGIN initlocalfile(parametertype);
initlocalfile(converttype);
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN
END
;
 BEGIN END
END;

2: begin
  BEGIN END
;
 BEGIN str:=currenttree^.ldfield.TYPENAMEfield^.str;

appendstring('LIILrules_',parametertype);
 appendstring(str,parametertype);
 appendstring(' = SET OF LIILRULES_',parametertype);

END
END;

3: begin
  BEGIN END
;
 BEGIN str:=currenttree^.ldfield.TERMINAL^.str;

appendstring(str,parametertype);
 appendstring(';',parametertype);
appendstring('\\',parametertype);

END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN SETDEF_parametertype:=parametertype;
SETDEF_converttype:=converttype;
END
END;
PROCEDURE ilacomCODE_LANGVERSIONproc(top:ilacomDECL_psnode
);
VAR currenttree:ilacomDECL_psnode;
    rsnode1:ilacomDECL_prsnode;
 
BEGIN
 BEGIN 
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN
END
;
 BEGIN END
END;

2: begin
  BEGIN END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
END
END;
PROCEDURE ilacomCODE_ILRULESspecproc(top:ilacomDECL_psnode
);
VAR currenttree:ilacomDECL_psnode;
    rsnode1:ilacomDECL_prsnode;
 
BEGIN
 BEGIN 
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN END
;
 BEGIN END
END;

2: begin
  BEGIN END
; ilacomCODE_ILRULEproc(currenttree
);
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
END
END;
PROCEDURE ilacomCODE_ILRULEproc(top:ilacomDECL_psnode
);
VAR currenttree:ilacomDECL_psnode;
    rsnode1:ilacomDECL_prsnode;
 
BEGIN
 BEGIN END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN
END
;
 BEGIN END
END;

2: begin
  BEGIN
END
;
 BEGIN END
END;

3: begin
  BEGIN
END
;
 BEGIN END
END;

4: begin
  BEGIN
END
;
 BEGIN END
END;

5: begin
  BEGIN
END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
END
END;
PROCEDURE ilacomCODE_PARAMNAMEproc(top:ilacomDECL_psnode
);
VAR currenttree:ilacomDECL_psnode;
    rsnode1:ilacomDECL_prsnode;
 
BEGIN
 BEGIN 
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
END
END;
PROCEDURE ilacomCODE_TYPENAMEproc(top:ilacomDECL_psnode
);
VAR currenttree:ilacomDECL_psnode;
    rsnode1:ilacomDECL_prsnode;
 
BEGIN
 BEGIN 
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
END
END;
