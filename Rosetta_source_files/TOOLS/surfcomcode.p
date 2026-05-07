EXPORT(surfcomcode);
pragma C_include('surfcomcode.pf');
pragma C_include('surfcomdecl.pf');
pragma C_include('surfcomlangspec.pf');
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
PROGRAM surfcomCODE;
WITH surfcomlangspec,
surfcomdecl,ldtypetostr,lduniquerels,ldmrules,files,tfiles,tstring,lidomaint,str,mem,
tldstrtostr,ldconvrec,tldconvrec,ldstrtotype,ldcatsets,strng;
VAR RULESPEC__number              :surfcomlangspec_int
;RULESPEC__procpars              :LOCALFILE
;RULESPEC__blockenv              :LOCALFILE
;RULESPEC__blockpas              :LOCALFILE
;RULEBODY__number              :surfcomlangspec_int
;RULEBODY__rulename              :TSTRING_string
;RULEBODY__procpars              :LOCALFILE
;RULEBODY__blockenv              :LOCALFILE
;RULEBODY__blockpas              :LOCALFILE
;BLOCK__rulename              :TSTRING_string
;BLOCK__parameters              :surfcomlangspec_setofidents
;BLOCK__blockenv              :LOCALFILE
;BLOCK__blockpas              :LOCALFILE
;PASCALTOHEKJE__parameters              :surfcomlangspec_setofidents
;PASCALTOHEKJE__copy              :LOCALFILE
;PASCALTOGLOBAL__parameters              :surfcomlangspec_setofidents
;PASCALTOGLOBAL__copy              :LOCALFILE
;PASCALTOEND__parameters              :surfcomlangspec_setofidents
;PASCALTOEND__copy              :LOCALFILE
;PSTOSTARRIGHT__parameters              :surfcomlangspec_setofidents
;PSTOSTARRIGHT__copy              :LOCALFILE
;INITBLOCK__rulename              :TSTRING_string
;INITBLOCK__parameters              :surfcomlangspec_setofidents
;INITBLOCK__blockenv              :LOCALFILE
;INITBLOCK__blockpas              :LOCALFILE
;FINALBLOCK__rulename              :TSTRING_string
;FINALBLOCK__parameters              :surfcomlangspec_setofidents
;FINALBLOCK__blockenv              :LOCALFILE
;FINALBLOCK__blockpas              :LOCALFILE
;blocksenv:files_text;
blockspas:files_text;
RTNfile:files_text;
PROCEDURE surfcomCODE_UTTproc(top:surfcomDECL_psnode
);
VAR currenttree:surfcomDECL_psnode;
    rsnode1:surfcomDECL_prsnode;
 rulenumber: surfcomLANGSPEC_int;
BEGIN 
BEGIN TFILES_open(RTNfile,'rtnfile',7,3);
TFILES_open(BLOCKSenv,'blocksenv',9,3);
TFILES_open(BLOCKSpas,'blockspas',9,3);
rulenumber:=0;
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
END
END;

2: begin
  BEGIN END
;
 BEGIN
END
END;

3: begin
  BEGIN rulenumber:=rulenumber+1;RULESPEC__number:=rulenumber; END
; surfcomCODE_RULESPECproc(currenttree
,RULESPEC__number
,RULESPEC__procpars
,RULESPEC__blockenv
,RULESPEC__blockpas
);
 BEGIN appendfile(RULESPEC__procpars,RTNfile);
appendfile(RULESPEC__blockenv,blocksenv);
appendfile(RULESPEC__blockpas,blockspas);
END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN
END
END;
PROCEDURE surfcomCODE_RULESPECproc(top:surfcomDECL_psnode
;RULESPEC_number              :surfcomlangspec_int
;var RULESPEC_procpars              :LOCALFILE
;var RULESPEC_blockenv              :LOCALFILE
;var RULESPEC_blockpas              :LOCALFILE
);
VAR currenttree:surfcomDECL_psnode;
    rsnode1:surfcomDECL_prsnode;
 str,rulename:TSTRING_string;
number: surfcomLANGSPEC_int;
procpars,blockenv,blockpas:LOCALFILE;
BEGIN 
BEGIN number:=RULESPEC_number;
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
END
END;

2: begin
  BEGIN rulename:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN
END
END;

3: begin
  BEGIN END
; surfcomCODE_GRAPHproc(currenttree
);
 BEGIN 
END
END;

4: begin
  BEGIN  TFILES_writestr(RTNfile,
'+',FILES_maxIO,0,left);

 TFILES_writestring(RTNfile,
rulename,0,left);

TFILES_writeline(RTNfile,TRUE);


RULEBODY__number:=number;
RULEBODY__rulename:=rulename 
END
; surfcomCODE_RULEBODYproc(currenttree
,RULEBODY__number
,RULEBODY__rulename
,RULEBODY__procpars
,RULEBODY__blockenv
,RULEBODY__blockpas
);
 BEGIN procpars:=RULEBODY__procpars;
blockpas:=RULEBODY__blockpas;
blockenv:=RULEBODY__blockenv;
END
END;

5: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN 
TFILES_writestring(RTNfile,
str,0,left);

 TFILES_writestr(RTNfile,
'=',FILES_maxIO,0,left);

TFILES_writeline(RTNfile,TRUE);


END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN 
RULESPEC_procpars:=procpars;
RULESPEC_blockenv:=blockenv;
RULESPEC_blockpas:=blockpas;
END
END;
PROCEDURE surfcomCODE_GRAPHproc(top:surfcomDECL_psnode
);
VAR currenttree:surfcomDECL_psnode;
    rsnode1:surfcomDECL_prsnode;
 str:TSTRING_string;
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
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN TFILES_writestring(RTNfile,
str,0,left);

TFILES_writeline(RTNfile,TRUE);


END
END;

3: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str
END 
;
 BEGIN TFILES_writestring(RTNfile,
str,0,left);

TFILES_writeline(RTNfile,TRUE);


END 
END;

4: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str
END
;
 BEGIN TFILES_writestring(RTNfile,
str,0,left);

TFILES_writeline(RTNfile,TRUE);


END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
END
END;
PROCEDURE surfcomCODE_NUMBERproc(top:surfcomDECL_psnode
);
VAR currenttree:surfcomDECL_psnode;
    rsnode1:surfcomDECL_prsnode;

BEGIN
 BEGIN END;
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
BEGIN END
END;
PROCEDURE surfcomCODE_RULEBODYproc(top:surfcomDECL_psnode
;RULEBODY_number              :surfcomlangspec_int
;RULEBODY_rulename              :TSTRING_string
;var RULEBODY_procpars              :LOCALFILE
;var RULEBODY_blockenv              :LOCALFILE
;var RULEBODY_blockpas              :LOCALFILE
);
VAR currenttree:surfcomDECL_psnode;
    rsnode1:surfcomDECL_prsnode;
 procpars,blockpas,blockenv:LOCALFILE;
number: surfcomLANGSPEC_int;
str,rulename:TSTRING_string;
first,write: surfcomLANGSPEC_bool;
parameters: surfcomLANGSPEC_setofidents;
id: surfcomLANGSPEC_ident;
BEGIN 
BEGIN initlocalfile(procpars);
initlocalfile(blockenv);
initlocalfile(blockpas);
initsetofidents(parameters);
first:=TRUE;
write:=FALSE;
rulename:=RULEBODY_rulename;
number:=RULEBODY_number;
 appendstring('#',procpars);
 appendstring(rulename,procpars);
 appendstring('#REC = RECORD',procpars);
appendstring('\\',procpars);

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
END
END;

2: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str; 
END
;
 BEGIN 
END
END;

3: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN IF write THEN BEGIN
IF TSTRING_comparechars(str,'BOOLEAN',7)<>0 THEN appendstring('LSDOMAINT_',procpars);

appendstring(str,procpars);
appendstring('\\',procpars);

END;
write:=FALSE;
END
END;

4: begin
  BEGIN BLOCK__rulename:=rulename;
BLOCK__parameters:=parameters;
END
; surfcomCODE_BLOCKproc(currenttree
,BLOCK__rulename
,BLOCK__parameters
,BLOCK__blockenv
,BLOCK__blockpas
);
 BEGIN appendlocfile(BLOCK__blockenv,blockenv);
appendlocfile(BLOCK__blockpas,blockpas);
END
END;

5: begin
  BEGIN INITBLOCK__rulename:=rulename;
INITBLOCK__parameters:=parameters;
END
; surfcomCODE_INITBLOCKproc(currenttree
,INITBLOCK__rulename
,INITBLOCK__parameters
,INITBLOCK__blockenv
,INITBLOCK__blockpas
);
 BEGIN appendlocfile(INITBLOCK__blockenv,blockenv);
appendlocfile(INITBLOCK__blockpas,blockpas);
END
END;

6: begin
  BEGIN FINALBLOCK__rulename:=rulename;
END
; surfcomCODE_FINALBLOCKproc(currenttree
,FINALBLOCK__rulename
,FINALBLOCK__parameters
,FINALBLOCK__blockenv
,FINALBLOCK__blockpas
);
 BEGIN appendlocfile(FINALBLOCK__blockenv,blockenv);
appendlocfile(FINALBLOCK__blockpas,blockpas);
END
END;

7: begin
  BEGIN IF NOT first THEN appendstring(';',procpars);
 
first:=FALSE;
id.str:=str;
appendident(id,parameters);
END
;
 BEGIN appendstring(str,procpars);
 appendstring(':',procpars);
 write:=TRUE;
END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN  appendstring(' END;',procpars);
appendstring('\\',procpars);

RULEBODY_procpars:=procpars;

appendstring(' FUNCTION comp_',blockenv);
 appendstring(rulename,blockenv);
 
appendstring('(rec1,rec2:',blockenv);
 appendstring(rulename,blockenv);
 appendstring('typ):BOOLEAN;EXTERNAL;',blockenv);
appendstring('\\',blockenv);

RULEBODY_blockenv:=blockenv;

appendstring(' FUNCTION comp_',blockpas);
 appendstring(rulename,blockpas);
 
appendstring('(rec1,rec2:',blockpas);
 appendstring(rulename,blockpas);
 appendstring('typ):BOOLEAN;',blockpas);
appendstring('\\',blockpas);

appendstring('BEGIN WITH rec1^ DO comp_',blockpas);
 appendstring(rulename,blockpas);
 appendstring(':=',blockpas);
appendstring('\\',blockpas);

IF NOT(stillidents(parameters)) THEN BEGIN appendstring('TRUE',blockpas);
 appendstring('\\',blockpas);
 END;
WHILE stillidents(parameters) DO BEGIN
takeident(id,parameters);
appendstring('(',blockpas);
 appendstring(id.str,blockpas);
 appendstring('=rec2^.',blockpas);
 
appendstring(id.str,blockpas);
 appendstring(')',blockpas);

IF stillidents(parameters) THEN appendstring(' AND',blockpas);
 appendstring('\\',blockpas);

END;
appendstring('END;',blockpas);
appendstring('\\',blockpas);

RULEBODY_blockpas:=blockpas;
END
END;
PROCEDURE surfcomCODE_BLOCKproc(top:surfcomDECL_psnode
;BLOCK_rulename              :TSTRING_string
;BLOCK_parameters              :surfcomlangspec_setofidents
;var BLOCK_blockenv              :LOCALFILE
;var BLOCK_blockpas              :LOCALFILE
);
VAR currenttree:surfcomDECL_psnode;
    rsnode1:surfcomDECL_prsnode;
 blockenv,blockpas:LOCALFILE;
rulename,blocknumber,str:TSTRING_string;
parameters: surfcomLANGSPEC_setofidents;
BEGIN 
BEGIN initlocalfile(blockenv);
initlocalfile(blockpas);
parameters:=BLOCK_parameters;
rulename:=BLOCK_rulename;
blocknumber:=top^.ldfield.BLOCKfield^.number;

appendstring('FUNCTION ',blockenv);
 appendstring(rulename,blockenv);
 appendstring('_',blockenv);

appendstring(blocknumber,blockenv);
 appendstring('\\',blockenv);
 appendstring('(VAR rec:',blockenv);
 appendstring(rulename,blockenv);
 
appendstring('typ;{VAR synrel:LSDOMAINT_synrel;}',blockenv);

appendstring('b:LSSTREE_pstree):BOOLEAN;EXTERNAL;',blockenv);
appendstring('\\',blockenv);


appendstring('FUNCTION ',blockpas);
 appendstring(rulename,blockpas);
 appendstring('_',blockpas);

appendstring(blocknumber,blockpas);
 appendstring('\\',blockpas);
 appendstring('(VAR rec:',blockpas);
 appendstring(rulename,blockpas);
 
appendstring('typ;{VAR synrel:LSDOMAINT_synrel;}',blockpas);

appendstring('b:LSSTREE_pstree):BOOLEAN;',blockpas);
appendstring('\\',blockpas);

appendstring('VAR result:BOOLEAN;',blockpas);
appendstring('\\',blockpas);

appendstring('BEGIN WITH rec^ DO BEGIN result:=FALSE;IF ',blockpas);
appendstring('\\',blockpas);

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
END
END;

2: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN  TFILES_writestr(RTNfile,
'+',FILES_maxIO,0,left);

 TFILES_writestring(RTNfile,
str,0,left);

TFILES_writeline(RTNfile,TRUE);



END
END;

3: begin
  BEGIN END
;{PASCALTOGLOBAL}
 BEGIN {appendlocfile(PASCALTOGLOBAL__copy,blockpas);
appendstring('\\',blockpas);
appendstring('THEN IF',blockpas);
appendstring('\\',blockpas);
}
END
END;

4: begin
  BEGIN END
; surfcomCODE_PASCALTOHEKJEproc(currenttree
,PASCALTOHEKJE__parameters
,PASCALTOHEKJE__copy
);
 BEGIN appendlocfile(PASCALTOHEKJE__copy,blockpas);
appendstring('\\',blockpas);
appendstring('THEN result:=TRUE;IF result THEN',blockpas);
appendstring('\\',blockpas);

END
END;

5: begin
  BEGIN PSTOSTARRIGHT__parameters:=parameters END
; surfcomCODE_PSTOSTARRIGHTproc(currenttree
,PSTOSTARRIGHT__parameters
,PSTOSTARRIGHT__copy
);
 BEGIN appendlocfile(PSTOSTARRIGHT__copy,blockpas);
END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN BLOCK_blockenv:=blockenv;
appendstring('END;',blockpas);
 appendstring(rulename,blockpas);
 appendstring('_',blockpas);
 appendstring(blocknumber,blockpas);

appendstring(':=result;',blockpas);
appendstring('\\',blockpas);

{ appendstring('DEBUG_writestr(''<-',blockpas);
 appendstring(rulename,blockpas);
 appendstring('_',blockpas);

appendstring(blocknumber,blockpas);
 appendstring(''',DEBUG_MaxIO,0,TRUE);',blockpas);
appendstring('\\',blockpas);

appendstring('IF result THEN',blockpas);

appendstring(' DEBUG_writestr(''TRUE'',DEBUG_MaxIO,0,TRUE)',blockpas);
appendstring('\\',blockpas);

appendstring('ELSE',blockpas);

appendstring(' DEBUG_writestr(''FALSE'',DEBUG_MaxIO,0,TRUE);',blockpas);
appendstring('\\',blockpas);

appendstring('DEBUG_writeline(TRUE);',blockpas);
appendstring('\\',blockpas);
}
appendstring('END;',blockpas);
appendstring('\\',blockpas);

BLOCK_blockpas:=blockpas; 
END
END;
PROCEDURE surfcomCODE_INITBLOCKproc(top:surfcomDECL_psnode
;INITBLOCK_rulename              :TSTRING_string
;INITBLOCK_parameters              :surfcomlangspec_setofidents
;var INITBLOCK_blockenv              :LOCALFILE
;var INITBLOCK_blockpas              :LOCALFILE
);
VAR currenttree:surfcomDECL_psnode;
    rsnode1:surfcomDECL_prsnode;
 blockpas,blockenv:LOCALFILE;
rulename:TSTRING_string;
parameters: surfcomLANGSPEC_setofidents;
BEGIN 
BEGIN parameters:=INITBLOCK_parameters;

rulename:=INITBLOCK_rulename;
initlocalfile(blockenv);
appendstring('PROCEDURE ',blockenv);
 appendstring(rulename,blockenv);
 appendstring('_0(VAR rec:',blockenv);

appendstring(rulename,blockenv);
 appendstring('typ);EXTERNAL;',blockenv);
appendstring('\\',blockenv);


initlocalfile(blockpas);
appendstring('PROCEDURE ',blockpas);
 appendstring(rulename,blockpas);
 appendstring('_0(VAR rec:',blockpas);

appendstring(rulename,blockpas);
 appendstring('typ);',blockpas);
appendstring('\\',blockpas);

appendstring('BEGIN WITH rec^ DO BEGIN',blockpas);
appendstring('\\',blockpas);

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
END
END;

2: begin
  BEGIN END
;
 BEGIN
END
END;

3: begin
  BEGIN PASCALTOEND__parameters:=parameters END
; surfcomCODE_PASCALTOENDproc(currenttree
,PASCALTOEND__parameters
,PASCALTOEND__copy
);
 BEGIN appendlocfile(PASCALTOEND__copy,blockpas);
END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN appendstring('END;END;',blockpas);
appendstring('\\',blockpas);

initblock_blockenv:=blockenv;
initblock_blockpas:=blockpas;
END
END;
PROCEDURE surfcomCODE_FINALBLOCKproc(top:surfcomDECL_psnode
;FINALBLOCK_rulename              :TSTRING_string
;FINALBLOCK_parameters              :surfcomlangspec_setofidents
;var FINALBLOCK_blockenv              :LOCALFILE
;var FINALBLOCK_blockpas              :LOCALFILE
);
VAR currenttree:surfcomDECL_psnode;
    rsnode1:surfcomDECL_prsnode;
 blockpas,blockenv:LOCALFILE;
rulename:TSTRING_string;
BEGIN 
BEGIN 
rulename:=FINALBLOCK_rulename;
initlocalfile(blockenv);
appendstring('FUNCTION ',blockenv);
 appendstring(rulename,blockenv);
 appendstring('_F',blockenv);
appendstring('\\',blockenv);

appendstring('(VAR rec:',blockenv);
 appendstring(rulename,blockenv);
 
appendstring('typ;VAR topset:LISTREE_setofstrees):BOOLEAN;EXTERNAL;',blockenv);
appendstring('\\',blockenv);


initlocalfile(blockpas);
appendstring('FUNCTION ',blockpas);
 appendstring(rulename,blockpas);
 appendstring('_F',blockpas);
appendstring('\\',blockpas);

appendstring('(VAR rec:',blockpas);
 appendstring(rulename,blockpas);
 
appendstring('typ;VAR topset:LISTREE_setofstrees):BOOLEAN;',blockpas);
appendstring('\\',blockpas);

appendstring('VAR result:BOOLEAN;top:LSSTREE_pstree;',blockpas);
appendstring('\\',blockpas);

appendstring('BEGIN LISTREE_initsetofstrees(topset);',blockpas);

appendstring('WITH rec^ DO BEGIN result:=',blockpas);
appendstring('\\',blockpas);

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
END
END;

2: begin
  BEGIN END
;
 BEGIN
END
END;

3: begin
  BEGIN END
;
 BEGIN 
END
END;

4: begin
  BEGIN END
; surfcomCODE_PASCALTOHEKJEproc(currenttree
,PASCALTOHEKJE__parameters
,PASCALTOHEKJE__copy
);
 BEGIN appendlocfile(PASCALTOHEKJE__copy,blockpas);
appendstring('\\',blockpas);
appendstring(';IF result THEN',blockpas);
appendstring('\\',blockpas);

END
END;

5: begin
  BEGIN initsetofidents(PSTOSTARRIGHT__parameters) END
; surfcomCODE_PSTOSTARRIGHTproc(currenttree
,PSTOSTARRIGHT__parameters
,PSTOSTARRIGHT__copy
);
 BEGIN appendlocfile(PSTOSTARRIGHT__copy,blockpas);
END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN
finalblock_blockenv:=blockenv;
appendstring('END;',blockpas);
 appendstring(rulename,blockpas);
 appendstring('_F',blockpas);

appendstring(':=result;',blockpas);
appendstring('\\',blockpas);

appendstring('DEBUG_writestr(''<-',blockpas);
 appendstring(rulename,blockpas);
 appendstring('_F ',blockpas);

appendstring(''',DEBUG_MaxIO,0,TRUE);',blockpas);

appendstring('IF LISTREE_stillstrees(topset) THEN',blockpas);

appendstring(' DEBUG_writestr(''TRUE'',DEBUG_MaxIO,0,TRUE)',blockpas);
appendstring('\\',blockpas);

appendstring('ELSE',blockpas);

appendstring(' DEBUG_writestr(''FALSE'',DEBUG_MaxIO,0,TRUE);',blockpas);

appendstring('Debug_WriteLine(TRUE);',blockpas);
appendstring('\\',blockpas);

appendstring('END;',blockpas);
appendstring('\\',blockpas);

finalblock_blockpas:=blockpas;
initlocalfile(finalblock_blockenv);
initlocalfile(finalblock_blockpas);
END
END;
PROCEDURE surfcomCODE_PASCALTOHEKJEproc(top:surfcomDECL_psnode
;PASCALTOHEKJE_parameters              :surfcomlangspec_setofidents
;var PASCALTOHEKJE_copy              :LOCALFILE
);
VAR currenttree:surfcomDECL_psnode;
    rsnode1:surfcomDECL_prsnode;
 copy:LOCALFILE;
writekey,writefield,writeextra: surfcomLANGSPEC_bool;
str,str1:TSTRING_string;
BEGIN 
BEGIN 
writeextra:=FALSE;
writekey:=FALSE;
writefield:=FALSE;
initlocalfile(copy);
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN IF TSTRING_comparechars(str,'IN',2)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'NOT',3)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'AND',3)=0 THEN appendstring(' ',copy);

TSTRING_constant(str1,'END',3);
IF TSTRING_comparebegin(str1,str)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'OR',2)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'IF',2)=0 THEN appendstring(' ',copy);

IF writekey THEN IF str[STRING_length(str)]=')' THEN BEGIN
TSTRING_extractbegin(str,str,STRING_length(str)-1);
writeextra:=TRUE;
END;
appendstring(str,copy);

IF TSTRING_comparechars(str,'IN',2)=0 THEN appendstring(' ',copy);

TSTRING_constant(str1,'NOT',3);
IF TSTRING_compareend(str,str1)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'IF',2)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'OR',2)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'AND',3)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'END',3)=0 THEN appendstring(' ',copy);

IF writekey THEN BEGIN
appendstring(''')',copy);

IF writeextra THEN appendstring(')',copy);

writeextra:=FALSE;
writekey:=FALSE;
END;
END
END;

2: begin
  BEGIN END
;
 BEGIN appendstring('\\',copy);
appendstring('b^.ls^.',copy);

writefield:=TRUE;
END
END;

3: begin
  BEGIN writekey:=TRUE END
;
 BEGIN appendstring('auxkey(''',copy);

END
END;

4: begin
  BEGIN END
;
 BEGIN IF writefield THEN BEGIN
appendstring('field^',copy);

writefield:=FALSE;
END;
appendstring('.',copy);

END
END;

5: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN appendstring(str,copy);
appendstring('\\',copy);

END
END;

6: begin
  BEGIN END
;
 BEGIN appendstring('\\',copy);
appendstring('LSAUXDOM',copy);

END
END;

7: begin
  BEGIN END
;
 BEGIN 
END
END;

8: begin
  BEGIN END
;
 BEGIN IF NOT writekey THEN appendstring('_',copy);

END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN PASCALTOHEKJE_copy:=copy
END
END;
PROCEDURE surfcomCODE_PASCALTOGLOBALproc(top:surfcomDECL_psnode
;PASCALTOGLOBAL_parameters              :surfcomlangspec_setofidents
;var PASCALTOGLOBAL_copy              :LOCALFILE
);
VAR currenttree:surfcomDECL_psnode;
    rsnode1:surfcomDECL_prsnode;
 copy:LOCALFILE;
writekey,writefield,writeextra: surfcomLANGSPEC_bool;
str,str1:TSTRING_string;
BEGIN 
BEGIN 
writeextra:=FALSE;
writekey:=FALSE;
writefield:=FALSE;
initlocalfile(copy);
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN IF TSTRING_comparechars(str,'IN',2)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'NOT',3)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'IF',2)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'OR',2)=0 THEN appendstring(' ',copy);

TSTRING_constant(str1,'END',3);
IF TSTRING_comparebegin(str1,str)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'AND',3)=0 THEN appendstring(' ',copy);

IF writekey THEN IF str[STRING_length(str)]=')' THEN BEGIN
TSTRING_extractbegin(str,str,STRING_length(str)-1);
writeextra:=TRUE;
END;
appendstring(str,copy);

IF TSTRING_comparechars(str,'IN',2)=0 THEN appendstring(' ',copy);

TSTRING_constant(str1,'NOT',3);
IF TSTRING_compareend(str,str1)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'IF',2)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'OR',2)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'END',3)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'AND',3)=0 THEN appendstring(' ',copy);

IF writekey THEN BEGIN
appendstring(''')',copy);

IF writeextra THEN appendstring(')',copy);

writeextra:=FALSE;
writekey:=FALSE;
END;
END
END;

2: begin
  BEGIN END
;
 BEGIN appendstring('\\',copy);
appendstring('b^.ls^.',copy);

writefield:=TRUE;
END
END;

3: begin
  BEGIN writekey:=TRUE END
;
 BEGIN appendstring('auxkey(''',copy);

END
END;

4: begin
  BEGIN END
;
 BEGIN IF writefield THEN BEGIN
appendstring('field^',copy);

writefield:=FALSE;
END;
appendstring('.',copy);

END
END;

5: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN appendstring(str,copy);
appendstring('\\',copy);

END
END;

6: begin
  BEGIN END
;
 BEGIN appendstring('\\',copy);
appendstring('LSAUXDOM',copy);

END
END;

7: begin
  BEGIN END
;
 BEGIN 
END
END;

8: begin
  BEGIN END
;
 BEGIN IF NOT writekey THEN appendstring('_',copy);

END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN PASCALTOGLOBAL_copy:=copy
END
END;
PROCEDURE surfcomCODE_PSTOSTARRIGHTproc(top:surfcomDECL_psnode
;PSTOSTARRIGHT_parameters              :surfcomlangspec_setofidents
;var PSTOSTARRIGHT_copy              :LOCALFILE
);
VAR currenttree:surfcomDECL_psnode;
    rsnode1:surfcomDECL_prsnode;
 copy,result:LOCALFILE;
writebracket,writekey,writefield,writeextra: surfcomLANGSPEC_bool;
str,str1:TSTRING_string;
write,dontlook:BOOLEAN;
parameters1,parameters: surfcomLANGSPEC_setofidents;
id: surfcomLANGSPEC_ident;
BEGIN 
BEGIN 
parameters:=PSTOSTARRIGHT_parameters;
initlocalfile(result);
appendstring('BEGIN',result);
appendstring('\\',result);

write:=FALSE;
dontlook:=FALSE;
writeextra:=FALSE;
writekey:=FALSE;
writebracket:=FALSE;
writefield:=FALSE;
initlocalfile(copy);

END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN parameters1:=parameters;
IF NOT(dontlook) THEN WHILE stillidents(parameters1) DO BEGIN
takeident(id,parameters1);
IF id.str=str THEN write:=TRUE
END;
IF TSTRING_comparechars(str,'IN',2)=0 THEN appendstring(' ',copy);

TSTRING_constant(str1,'END',3);
IF TSTRING_comparebegin(str1,str)=0 THEN appendstring('\\',copy);

IF TSTRING_comparechars(str,'ELSE',4)=0 THEN appendstring('\\',copy);

IF TSTRING_comparechars(str,'THEN',4)=0 THEN 
BEGIN appendstring('\\',copy);
 dontlook:=FALSE END;
IF TSTRING_comparechars(str,'NOT',3)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'IF',2)=0 THEN 
BEGIN appendstring(' ',copy);
 dontlook:=TRUE END;
IF TSTRING_comparechars(str,'OR',2)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'AND',3)=0 THEN appendstring(' ',copy);

IF writekey THEN IF str[STRING_length(str)]=')' THEN BEGIN
TSTRING_extractbegin(str,str,STRING_length(str)-1);
writeextra:=TRUE;
END;
appendstring(str,copy);

IF TSTRING_comparechars(str,'IN',2)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'BEGIN',5)=0 THEN appendstring('\\',copy);

IF TSTRING_comparechars(str,'ELSE',4)=0 THEN appendstring('\\',copy);

IF TSTRING_comparechars(str,'THEN',4)=0 THEN appendstring('\\',copy);

TSTRING_constant(str1,'NOT',3);
IF TSTRING_compareend(str,str1)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'IF',2)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'OR',2)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'END',3)=0 THEN appendstring(' ',copy);

IF TSTRING_comparechars(str,'AND',3)=0 THEN appendstring(' ',copy);

IF writekey THEN BEGIN
appendstring(''')',copy);

IF writeextra THEN appendstring(')',copy);

writeextra:=FALSE;
writekey:=FALSE;
END;
IF writebracket THEN BEGIN appendstring(');',copy);
appendstring('\\',copy);

appendstring('LISTREE_appendstree(top::LISTREE_pstree,topset);',copy);

writebracket:=FALSE;
END;
END
END;

2: begin
  BEGIN END
;
 BEGIN appendstring('\\',copy);
appendstring('b^.ls^.',copy);

writefield:=TRUE;
END
END;

3: begin
  BEGIN writekey:=TRUE END
;
 BEGIN appendstring('auxkey(''',copy);

END
END;

4: begin
  BEGIN END
;
 BEGIN IF writefield THEN BEGIN
appendstring('field^',copy);

writefield:=FALSE;
END;
appendstring('.',copy);

END
END;

5: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN appendstring(str,copy);
appendstring('\\',copy);

IF write THEN appendlocfile(copy,result);
initlocalfile(copy);
write:=FALSE;
dontlook:=FALSE;
END
END;

6: begin
  BEGIN END
;
 BEGIN appendstring('\\',copy);
appendstring('LSAUXDOM',copy);

END
END;

7: begin
  BEGIN END
;
 BEGIN 
IF write THEN appendlocfile(copy,result);
END
END;

8: begin
  BEGIN END
;
 BEGIN IF NOT (writekey OR writebracket) THEN appendstring('_',copy);

END
END;

9: begin
  BEGIN writebracket:=TRUE END
;
 BEGIN appendstring('top:=MAKET_stree(',copy);

END
END;

10: begin
  BEGIN END
;
 BEGIN appendstring('\\',copy);
appendstring('top^.ls^.',copy);

writefield:=TRUE;
END
END;

11: begin
  BEGIN END
;
 BEGIN dontlook:=TRUE; appendstring('=',copy);

END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN  IF not write THEN appendstring('END;',result);
 appendstring('\\',result);

PSTOSTARRIGHT_copy:=result
END
END;
PROCEDURE surfcomCODE_PASCALTOENDproc(top:surfcomDECL_psnode
;PASCALTOEND_parameters              :surfcomlangspec_setofidents
;var PASCALTOEND_copy              :LOCALFILE
);
VAR currenttree:surfcomDECL_psnode;
    rsnode1:surfcomDECL_prsnode;
 copy:LOCALFILE;
write,writekey: surfcomLANGSPEC_bool;
str:TSTRING_string;
parameters1,parameters: surfcomLANGSPEC_setofidents;
id: surfcomLANGSPEC_ident;
BEGIN 
BEGIN initlocalfile(copy);
writekey:=FALSE;write:=FALSE;
parameters:=PASCALTOEND_parameters;
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN IF write THEN BEGIN
IF TSTRING_comparechars(str,'END',3)=0 THEN appendstring('\\',copy);

IF TSTRING_comparechars(str,'END',3)<>0 THEN appendstring(str,copy);

IF writekey THEN BEGIN writekey:=FALSE; appendstring(')',copy);
 END;
IF TSTRING_comparechars(str,'BEGIN',5)=0 THEN appendstring('\\',copy);

END;
END
END;

2: begin
  BEGIN END
;
 BEGIN 
END
END;

3: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN IF write THEN BEGIN appendstring(str,copy);
appendstring('\\',copy);
 write:=FALSE END;
END
END;

4: begin
  BEGIN END
;
 BEGIN IF write THEN BEGIN appendstring('\\',copy);
appendstring('LSAUXDOM_',copy);
 END;
END
END;

5: begin
  BEGIN writekey:=TRUE END
;
 BEGIN IF write THEN appendstring('auxkey(',copy);

END
END;

7: begin
  BEGIN {str:=currenttree^.ldfield.TERMINAL^.str} END
;
 BEGIN {appendstring(str,copy);
}
parameters1:=parameters;
WHILE stillidents(parameters1) DO BEGIN
takeident(id,parameters1);
IF id.str=str THEN BEGIN
write:=TRUE;
appendstring(str,copy);
 appendstring(':',copy);

END;
END; 
END
END;

8: begin
  BEGIN END
;
 BEGIN appendstring(str,copy);
 appendstring(':',copy);

write:=TRUE;
END
END;

9: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN write:=FALSE;
END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN PASCALTOEND_copy:=copy 
END
END;
