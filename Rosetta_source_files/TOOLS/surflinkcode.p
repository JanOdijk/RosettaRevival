EXPORT(surflinkcode);
pragma C_include('surflinkcode.pf');
pragma C_include('surflinkdecl.pf');
pragma C_include('surflinklangspec.pf');
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
PROGRAM surflinkCODE;
WITH surflinklangspec,
surflinkdecl,ldtypetostr,lduniquerels,ldmrules,files,tfiles,tstring,lidomaint,str,mem,
tldstrtostr,ldconvrec,tldconvrec,ldstrtotype,ldcatsets,strng;
VAR RULEBODY__rulename              :TSTRING_string
;GRAPH__iteration              :surflinklangspec_int
;GRAPH__shorthands              :surflinklangspec_setofshds
;GRAPH__nodebefore              :surflinklangspec_int
;GRAPH__nodeafter              :surflinklangspec_int
;GRAPH__possempty              :surflinklangspec_bool
;GRAPH__basestate              :surflinklangspec_int
;CONCGRAPH__iteration              :surflinklangspec_int
;CONCGRAPH__shorthands              :surflinklangspec_setofshds
;CONCGRAPH__nodebefore              :surflinklangspec_int
;CONCGRAPH__nodeafter              :surflinklangspec_int
;CONCGRAPH__possempty              :surflinklangspec_bool
;CONCGRAPH__basestate              :surflinklangspec_int
;ELEMGRAPH__iteration              :surflinklangspec_int
;ELEMGRAPH__shorthands              :surflinklangspec_setofshds
;ELEMGRAPH__nodebefore              :surflinklangspec_int
;ELEMGRAPH__nodeafter              :surflinklangspec_int
;ELEMGRAPH__possempty              :surflinklangspec_bool
;ELEMGRAPH__basestate              :surflinklangspec_int
;PARAMS__procpars              :LOCALFILE
;procspas:files_text;
parsenv:files_text;
ascentenv:files_text;
ascentpas1:files_text;
switchpas:files_text;
ascentpas2:files_text;
ascentpas3:files_text;
ascentpas4:files_text;
ascentpas5:files_text;
PROCEDURE surflinkCODE_UTTproc(top:surflinkDECL_psnode
);
TYPE stringtype = PACKED ARRAY [1..30] OF CHAR;
VAR currenttree:surflinkDECL_psnode;
    rsnode1:surflinkDECL_prsnode;
 procpars:LOCALFILE;
emptyfile,locfile:LOCALFILE;
rulenames,rulenames1: surflinkLANGSPEC_setofidts;
id,rulename: surflinkLANGSPEC_idt;
i,rulecounter:INTEGER;
rulenaam,blockstr:TSTRING_string;
pairtotripleenv,pairtotriple,recordfile,tempfile2,tempfile1,tempfile,helpfile:LOCALFILE;
numberofstates,total: surflinkLANGSPEC_int;
shorthands: surflinkLANGSPEC_setofshds;
firsttime,newrule: surflinkLANGSPEC_bool;
node,finalnode,initialnode:plosnode;
cat:TSTRING_string;
tran: surflinkLANGSPEC_tran;
auto: surflinkLANGSPEC_auto;
autos,autos1: surflinkLANGSPEC_setofautos;
str:stringtype;len: surflinkLANGSPEC_int;
category:LIDOMAINT_syntcat;
emptys: surflinkLANGSPEC_setofptrs;ptr: surflinkLANGSPEC_ptr;
 PROCEDURE converSTRING(str1:TSTRING_string;VAR str2:stringtype;VAR len:INTEGER);
VAR i:INTEGER;ch:CHAR;
BEGIN
i:=0;
WHILE i<>TSTRING_length(str1) DO
BEGIN
i:=i+1;
TSTRING_extractchar(ch,str1,i);
str2[i]:=ch;
END;
len:=i;
END;
BEGIN 
BEGIN initlocalfile(procpars);
initlocalfile(emptyfile);
initlocalfile(pairtotripleenv);
initlocalfile(pairtotriple);
initlocalfile(recordfile);
initlocalfile(helpfile);
initlocalfile(tempfile2);
initlocalfile(tempfile1);
initlocalfile(tempfile);
initsetofautos(autos);
newrule:=TRUE;
shorthands:=top^.ldfield.UTTfield^.shorthands;
firsttime:=TRUE;
total:=0;
rulecounter:=0;
TFILES_open(switchpas,'switchpas',9,3);

appendstring(' PROCEDURE LDSURFSWITCH_copy',tempfile2);

appendstring('(int1:INTEGER;params:ITEMS_params;',tempfile2);
 appendstring('VAR params1:ITEMS_params);',tempfile2);
appendstring('\\',tempfile2);

appendstring('BEGIN CASE int1 OF',tempfile2);
appendstring('\\',tempfile2);


appendstring(' FUNCTION LDSURFSWITCH_comp',tempfile1);

appendstring('(int1:INTEGER;params,params1:ITEMS_params):BOOLEAN;',tempfile1);
appendstring('\\',tempfile1);

appendstring('BEGIN CASE int1 OF',tempfile1);
appendstring('\\',tempfile1);


appendstring(' PROCEDURE LDSURFSWITCH_make',tempfile);

appendstring('(int1:INTEGER;VAR params:ITEMS_params);',tempfile);
appendstring('\\',tempfile);

appendstring('BEGIN CASE int1 OF',tempfile);
appendstring('\\',tempfile);


TFILES_writestr(switchpas,
'EXPORT(ldsurfswitch);',FILES_maxIO,0,left);


TFILES_writestr(switchpas,
'pragma C_include(''items.pf'');',FILES_maxIO,0,left);

TFILES_writeline(switchpas,TRUE);


TFILES_writestr(switchpas,
'pragma C_include(''mem.pf'');',FILES_maxIO,0,left);

TFILES_writeline(switchpas,TRUE);


TFILES_writestr(switchpas,
'pragma C_include(''ldsurfswitch.pf'');',FILES_maxIO,0,left);

TFILES_writeline(switchpas,TRUE);


TFILES_writestr(switchpas,
'pragma C_include(''lsrulepars.pf'');',FILES_maxIO,0,left);

TFILES_writeline(switchpas,TRUE);


TFILES_writestr(switchpas,
'pragma C_include(''liprims.pf'');',FILES_maxIO,0,left);

TFILES_writeline(switchpas,TRUE);


TFILES_writestr(switchpas,
'pragma C_include(''listree.pf'');',FILES_maxIO,0,left);

TFILES_writeline(switchpas,TRUE);


TFILES_writestr(switchpas,
'pragma C_include(''lsstree.pf'');',FILES_maxIO,0,left);

TFILES_writeline(switchpas,TRUE);


TFILES_writestr(switchpas,
'pragma C_include(''surfrulesblocks.pf'');',FILES_maxIO,0,left);

TFILES_writeline(switchpas,TRUE);


TFILES_writestr(switchpas,
'PROGRAM LDSURFSWITCH;',FILES_maxIO,0,left);

TFILES_writeline(switchpas,TRUE);


TFILES_writestr(switchpas,
'WITH items,mem,lsrulepars,liprims,listree,lsstree,surfrulesblocks;',FILES_maxIO,0,left);

TFILES_writeline(switchpas,TRUE);


TFILES_writestr(switchpas,
' FUNCTION LDSURFSWITCH_body',FILES_maxIO,0,left);


TFILES_writestr(switchpas,
'(int1,int2:INTEGER;params:ITEMS_params;',FILES_maxIO,0,left);


TFILES_writestr(switchpas,
'stree:LISTREE_pstree):BOOLEAN;',FILES_maxIO,0,left);

TFILES_writeline(switchpas,TRUE);


TFILES_writestr(switchpas,
'BEGIN CASE int1 OF',FILES_maxIO,0,left);

TFILES_writeline(switchpas,TRUE);



rulenames:=top^.ldfield.UTTfield^.rulenames;
rulenames1:=rulenames;
takeidt(rulename,rulenames1);
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
 BEGIN cat:=currenttree^.ldfield.TERMINAL^.str
END
END;

3: begin
  BEGIN GRAPH__shorthands:=shorthands;
END
;
 BEGIN 
numberofstates:=numberofstates + currenttree^.ldfield.GRAPHfield^.numberofstates;
newrule:=FALSE;
END
END;

4: begin
  BEGIN newrule:=TRUE END;
; surflinkCODE_PARAMSproc(currenttree
,PARAMS__procpars
);
 BEGIN appendlocfile(PARAMS__procpars,procpars);
total:=total+numberofstates+2;
finalnode^.arg.state:=numberofstates+1;
numberofstates:=0;
takeidt(rulename,rulenames1);
END
END;

5: begin
  BEGIN rulecounter:=rulecounter+1;
END
;
 BEGIN rulenaam:=currenttree^.ldfield.TERMINAL^.str;

appendstring(surflinkDECL_convinttostring(rulecounter),tempfile2);
 
appendstring(':loopholes.retype(params1,',tempfile2);
 appendstring(rulenaam,tempfile2);
 appendstring('typ)^:=',tempfile2);

appendstring('loopholes.retype(params,',tempfile2);
 appendstring(rulenaam,tempfile2);
 appendstring('typ)^;',tempfile2);
appendstring('\\',tempfile2);


appendstring(surflinkDECL_convinttostring(rulecounter),tempfile1);
 appendstring(':LDSURFSWITCH_comp:=',tempfile1);
 
appendstring('comp_',tempfile1);
 appendstring(rulenaam,tempfile1);

appendstring('(loopholes.retype(params,',tempfile1);
 appendstring(rulenaam,tempfile1);
 appendstring('typ),',tempfile1);

appendstring('loopholes.retype(params1,',tempfile1);
 appendstring(rulenaam,tempfile1);
 appendstring('typ));',tempfile1);
appendstring('\\',tempfile1);


appendstring(surflinkDECL_convinttostring(rulecounter),tempfile);
 
appendstring(':MEM_newdefault(loopholes.SIZEof(',tempfile);
 appendstring(rulenaam,tempfile);
 appendstring('rec),',tempfile);

appendstring('loopholes.retype(params,MEM_ptr));',tempfile);
appendstring('\\',tempfile);


IF NOT firsttime THEN BEGIN TFILES_writestr(switchpas,
'END;',FILES_maxIO,0,left);

TFILES_writeline(switchpas,TRUE);

 END;
TFILES_writeinteger(switchpas,
rulecounter,0,left);

 TFILES_writestr(switchpas,
':CASE int2 OF',FILES_maxIO,0,left);

TFILES_writeline(switchpas,TRUE);


TFILES_writestr(switchpas,
'LIPRIMS_Hinit:BEGIN',FILES_maxIO,0,left);

 TFILES_writestr(switchpas,
' LDSURFSWITCH_body:=TRUE;',FILES_maxIO,0,left);

TFILES_writeline(switchpas,TRUE);


TFILES_writestring(switchpas,
rulenaam,0,left);

 TFILES_writestr(switchpas,
'_0(loopholes.retype(params,',FILES_maxIO,0,left);


TFILES_writestring(switchpas,
rulenaam,0,left);

 TFILES_writestr(switchpas,
'typ)); END;',FILES_maxIO,0,left);

TFILES_writeline(switchpas,TRUE);


firsttime:=FALSE;
END
END;

6: begin
  BEGIN blockstr:=currenttree^.ldfield.TERMINAL^.str;
END
;
 BEGIN TFILES_writestring(switchpas,
blockstr,0,left);

 TFILES_writestr(switchpas,
':BEGIN LDSURFSWITCH_body:=',FILES_maxIO,0,left);

TFILES_writeline(switchpas,TRUE);


TFILES_writestring(switchpas,
rulenaam,0,left);

 TFILES_writestr(switchpas,
'_',FILES_maxIO,0,left);

 TFILES_writestring(switchpas,
blockstr,0,left);


TFILES_writestr(switchpas,
'(loopholes.retype(params,',FILES_maxIO,0,left);

 TFILES_writestring(switchpas,
rulenaam,0,left);

 TFILES_writestr(switchpas,
'typ),',FILES_maxIO,0,left);


TFILES_writestr(switchpas,
'loopholes.retype(stree,LSSTREE_pstree));',FILES_maxIO,0,left);

TFILES_writeline(switchpas,TRUE);


TFILES_writestr(switchpas,
'END;',FILES_maxIO,0,left);

TFILES_writeline(switchpas,TRUE);


END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN 
appendstring('END END;',tempfile);


appendstring('END END;',tempfile1);


appendstring('END END;',tempfile2);


TFILES_writestr(switchpas,
'END END END;',FILES_maxIO,0,left);

TFILES_writeline(switchpas,TRUE);


appendfile(tempfile,switchpas);
appendfile(tempfile1,switchpas);
appendfile(tempfile2,switchpas);

TFILES_open(parsenv,'parsenv',7,3);

TFILES_writestr(parsenv,
'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);

TFILES_writeline(parsenv,TRUE);


TFILES_writestr(parsenv,
'PACKAGE LSRULEPARS;',FILES_maxIO,0,left);

TFILES_writeline(parsenv,TRUE);


TFILES_writestr(parsenv,
'WITH lsdomaint;',FILES_maxIO,0,left);


rulenames1:=rulenames;
i:=0;
WHILE stillidts(rulenames1) DO
BEGIN
takeidt(id,rulenames1);
i:=i+1;
END;
TFILES_writestr(parsenv,
'CONST LSRULEPARS_maxrulenr=',FILES_maxIO,0,left);

 TFILES_writeinteger(parsenv,
i,0,left);

 TFILES_writestr(parsenv,
';',FILES_maxIO,0,left);

TFILES_writeline(parsenv,TRUE);


TFILES_writestr(parsenv,
'TYPE',FILES_maxIO,0,left);

TFILES_writeline(parsenv,TRUE);


TFILES_writestr(parsenv,
'LSRULEPARS_ruletype = (',FILES_maxIO,0,left);


rulenames1:=rulenames;
WHILE stillidts(rulenames1) DO
BEGIN
takeidt(id,rulenames1);
TFILES_writestring(parsenv,
id.str,0,left);

 TFILES_writestr(parsenv,
'_',FILES_maxIO,0,left);


IF stillidts(rulenames1) THEN BEGIN TFILES_writestr(parsenv,
',',FILES_maxIO,0,left);

 TFILES_writeline(parsenv,TRUE);

 END;
END;
TFILES_writestr(parsenv,
');',FILES_maxIO,0,left);

TFILES_writeline(parsenv,TRUE);


TFILES_writestr(parsenv,
'LSRULEPARS_rulenrtype = 1..LSRULEPARS_maxrulenr;',FILES_maxIO,0,left);

TFILES_writeline(parsenv,TRUE);


rulenames1:=rulenames;
WHILE stillidts(rulenames1) DO
BEGIN
takeidt(id,rulenames1);
TFILES_writestring(parsenv,
id.str,0,left);

 TFILES_writestr(parsenv,
'typ=^',FILES_maxIO,0,left);

 TFILES_writestring(parsenv,
id.str,0,left);

 TFILES_writestr(parsenv,
'rec;',FILES_maxIO,0,left);

TFILES_writeline(parsenv,TRUE);


END;
appendfile(procpars,parsenv);
TFILES_writestr(parsenv,
'LSRULEPARS_record = RECORD',FILES_maxIO,0,left);

TFILES_writeline(parsenv,TRUE);


TFILES_writestr(parsenv,
'CASE LSRULEPARS_ruletype OF',FILES_maxIO,0,left);

TFILES_writeline(parsenv,TRUE);


rulenames1:=rulenames;
WHILE stillidts(rulenames1) DO
BEGIN
takeidt(id,rulenames1);
TFILES_writestring(parsenv,
id.str,0,left);

 TFILES_writestr(parsenv,
'_:(',FILES_maxIO,0,left);

 TFILES_writestring(parsenv,
id.str,0,left);

 TFILES_writestr(parsenv,
'ptr:',FILES_maxIO,0,left);


TFILES_writestring(parsenv,
id.str,0,left);

 TFILES_writestr(parsenv,
'typ);',FILES_maxIO,0,left);

TFILES_writeline(parsenv,TRUE);


END;
TFILES_writestr(parsenv,
'END; END;',FILES_maxIO,0,left);

TFILES_writeline(parsenv,TRUE);


END
END;
PROCEDURE surflinkCODE_PARAMSproc(top:surflinkDECL_psnode
;var PARAMS_procpars              :LOCALFILE
);
VAR currenttree:surflinkDECL_psnode;
    rsnode1:surflinkDECL_prsnode;
 procpars:LOCALFILE;str:TSTRING_string;
BEGIN 
BEGIN initlocalfile(procpars);

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
 BEGIN appendstring(str,procpars);

END
END;

3: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str
END
;
 BEGIN appendstring(str,procpars);

END
END;

4: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str
END
;
 BEGIN appendstring(str,procpars);
appendstring('\\',procpars);

END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN PARAMS_procpars:=procpars;
END
END;
PROCEDURE surflinkCODE_GRAPHproc(top:surflinkDECL_psnode
;GRAPH_iteration              :surflinklangspec_int
;GRAPH_shorthands              :surflinklangspec_setofshds
;GRAPH_nodebefore              :surflinklangspec_int
;GRAPH_nodeafter              :surflinklangspec_int
;var GRAPH_possempty              :surflinklangspec_bool
;var GRAPH_basestate              :surflinklangspec_int
);
VAR currenttree:surflinkDECL_psnode;
    rsnode1:surflinkDECL_prsnode;
 shorthands: surflinkLANGSPEC_setofshds;
possempty: surflinkLANGSPEC_bool;
nodebefore: surflinkLANGSPEC_int;
nodeafter: surflinkLANGSPEC_int;
tran: surflinkLANGSPEC_tran;
basestate: surflinkLANGSPEC_int;
iteration: surflinkLANGSPEC_int;
BEGIN
 BEGIN shorthands:=GRAPH_shorthands;
iteration:=GRAPH_iteration;
nodebefore:=GRAPH_nodebefore;
nodeafter:=GRAPH_nodeafter;
basestate:=GRAPH_basestate;
possempty:=FALSE;
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
  BEGIN CONCGRAPH__shorthands:=shorthands;
CONCGRAPH__nodebefore:=nodebefore;
CONCGRAPH__nodeafter:=nodeafter;
CONCGRAPH__iteration:=iteration;
CONCGRAPH__basestate:=basestate;
END
; surflinkCODE_CONCGRAPHproc(currenttree
,CONCGRAPH__iteration
,CONCGRAPH__shorthands
,CONCGRAPH__nodebefore
,CONCGRAPH__nodeafter
,CONCGRAPH__possempty
,CONCGRAPH__basestate
);
 BEGIN basestate:=CONCGRAPH__basestate;
possempty:=possempty OR CONCGRAPH__possempty;
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN GRAPH_possempty:=possempty;
GRAPH_basestate:=basestate;
END
END;
PROCEDURE surflinkCODE_CONCGRAPHproc(top:surflinkDECL_psnode
;CONCGRAPH_iteration              :surflinklangspec_int
;CONCGRAPH_shorthands              :surflinklangspec_setofshds
;CONCGRAPH_nodebefore              :surflinklangspec_int
;CONCGRAPH_nodeafter              :surflinklangspec_int
;var CONCGRAPH_possempty              :surflinklangspec_bool
;var CONCGRAPH_basestate              :surflinklangspec_int
);
VAR currenttree:surflinkDECL_psnode;
    rsnode1:surflinkDECL_prsnode;
 shorthands: surflinkLANGSPEC_setofshds;
possempty: surflinkLANGSPEC_bool;
node:plosnode;
iteration: surflinkLANGSPEC_int;
nodebefore,nodeafter: surflinkLANGSPEC_int;
nodebefore1,nodeafter1: surflinkLANGSPEC_int;
numofelemgraphs,i: surflinkLANGSPEC_int;
tran: surflinkLANGSPEC_tran;
basestate: surflinkLANGSPEC_int;
 PROCEDURE mergetran(tran: surflinkLANGSPEC_tran;VAR trans: surflinkLANGSPEC_setoftrans);
VAR trans1: surflinkLANGSPEC_setoftrans;tran1: surflinkLANGSPEC_tran;found: surflinkLANGSPEC_bool;
BEGIN
trans1:=trans;
found:=FALSE;
WHILE stilltrans(trans1) AND NOT found DO BEGIN
taketran(tran1,trans1);
found:=(tran1.node=tran.node) AND
(tran1.cat=tran.cat) AND
(tran1.kind=tran.kind) AND
(tran1.block=tran.block)
END;
IF NOT found THEN appendtran(tran,trans)
END;
BEGIN
 BEGIN shorthands:=CONCGRAPH_shorthands;
nodebefore:=CONCGRAPH_nodebefore;
iteration:=CONCGRAPH_iteration;
nodeafter:=CONCGRAPH_nodeafter;
numofelemgraphs:=top^.ldfield.CONCGRAPHfield^.numofelemgraphs;
basestate:=CONCGRAPH_basestate;
possempty:=TRUE;
i:=0;
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
  BEGIN ELEMGRAPH__shorthands:=shorthands;
i:=i+1;
ELEMGRAPH__basestate:=basestate;
ELEMGRAPH__nodebefore:=nodebefore1;
ELEMGRAPH__nodeafter:=nodeafter1;
END
; surflinkCODE_ELEMGRAPHproc(currenttree
,ELEMGRAPH__iteration
,ELEMGRAPH__shorthands
,ELEMGRAPH__nodebefore
,ELEMGRAPH__nodeafter
,ELEMGRAPH__possempty
,ELEMGRAPH__basestate
);
 BEGIN possempty:=possempty AND ELEMGRAPH__possempty;
basestate:=ELEMGRAPH__basestate;
IF i<>numofelemgraphs THEN basestate:=basestate+1;
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN CONCGRAPH_possempty:=possempty;
CONCGRAPH_basestate:=basestate;
END
END;
PROCEDURE surflinkCODE_ELEMGRAPHproc(top:surflinkDECL_psnode
;ELEMGRAPH_iteration              :surflinklangspec_int
;ELEMGRAPH_shorthands              :surflinklangspec_setofshds
;ELEMGRAPH_nodebefore              :surflinklangspec_int
;ELEMGRAPH_nodeafter              :surflinklangspec_int
;var ELEMGRAPH_possempty              :surflinklangspec_bool
;var ELEMGRAPH_basestate              :surflinklangspec_int
);
VAR currenttree:surflinkDECL_psnode;
    rsnode1:surflinkDECL_prsnode;
 shorthands: surflinkLANGSPEC_setofshds;
shd: surflinkLANGSPEC_shd;
tran: surflinkLANGSPEC_tran;
found,possempty: surflinkLANGSPEC_bool;
iteration,basestate,nodebefore,nodeafter: surflinkLANGSPEC_int;
 PROCEDURE mergetran(tran: surflinkLANGSPEC_tran;VAR trans: surflinkLANGSPEC_setoftrans);
VAR trans1: surflinkLANGSPEC_setoftrans;tran1: surflinkLANGSPEC_tran;found: surflinkLANGSPEC_bool;
BEGIN
trans1:=trans;
found:=FALSE;
WHILE stilltrans(trans1) AND NOT found DO BEGIN
taketran(tran1,trans1);
found:=(tran1.node=tran.node) AND
(tran1.cat=tran.cat) AND
(tran1.kind=tran.kind) AND
(tran1.block=tran.block)
END;
IF NOT found THEN appendtran(tran,trans)
END;
BEGIN
 BEGIN shorthands:=ELEMGRAPH_shorthands;
iteration:=ELEMGRAPH_iteration;
nodebefore:=ELEMGRAPH_nodebefore;
nodeafter:=ELEMGRAPH_nodeafter;
basestate:=ELEMGRAPH_basestate;
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
  BEGIN GRAPH__shorthands:=shorthands;
GRAPH__nodebefore:=nodebefore;
GRAPH__nodeafter:=nodeafter;
GRAPH__basestate:=basestate;
GRAPH__iteration:=iteration;
END
; surflinkCODE_GRAPHproc(currenttree
,GRAPH__iteration
,GRAPH__shorthands
,GRAPH__nodebefore
,GRAPH__nodeafter
,GRAPH__possempty
,GRAPH__basestate
);
 BEGIN possempty:=GRAPH__possempty;
basestate:=GRAPH__basestate;
END
END;

3: begin
  BEGIN GRAPH__shorthands:=shorthands;
GRAPH__nodebefore:=nodebefore;
GRAPH__nodeafter:=nodeafter;
GRAPH__basestate:=basestate;
GRAPH__iteration:=iteration;
END
; surflinkCODE_GRAPHproc(currenttree
,GRAPH__iteration
,GRAPH__shorthands
,GRAPH__nodebefore
,GRAPH__nodeafter
,GRAPH__possempty
,GRAPH__basestate
);
 BEGIN possempty:=TRUE;
basestate:=GRAPH__basestate;
END
END;

4: begin
  BEGIN GRAPH__shorthands:=shorthands;
GRAPH__nodebefore:=nodebefore;
GRAPH__nodeafter:=nodeafter;
GRAPH__basestate:=basestate;
GRAPH__iteration:=nodebefore;
END
; surflinkCODE_GRAPHproc(currenttree
,GRAPH__iteration
,GRAPH__shorthands
,GRAPH__nodebefore
,GRAPH__nodeafter
,GRAPH__possempty
,GRAPH__basestate
);
 BEGIN possempty:=TRUE;
basestate:=GRAPH__basestate;
END
END;

5: begin
  BEGIN possempty:=FALSE;
tran.cat:=currenttree^.ldfield.TERMINAL^.str;
tran.kind:=primary;
tran.surfcat:=FALSE;
loopholes.retype(tran.node,INTEGER):=nodeafter;
loopholes.retype(tran.node,plosnode)^.arg.procstate:=TRUE;
END
;
 BEGIN END
END;

6: begin
  BEGIN END
;
 BEGIN tran.block:=currenttree^.ldfield.NUMBERfield^.int;
IF loopholes.retype(iteration,plosnode)=NIL THEN
mergetran(tran,
loopholes.retype(nodebefore,plosnode)^.arg.trans);
IF loopholes.retype(iteration,plosnode)<>NIL THEN BEGIN
loopholes.retype(tran.node,INTEGER):=iteration;
loopholes.retype(tran.node,plosnode)^.arg.procstate:=TRUE;
mergetran(tran,
loopholes.retype(nodebefore,plosnode)^.arg.trans);
END;
END
END;

7: begin
  BEGIN GRAPH__shorthands:=shorthands;
GRAPH__iteration:=iteration;
GRAPH__nodebefore:=nodebefore;
GRAPH__nodeafter:=nodeafter;
GRAPH__basestate:=basestate;
found:=FALSE;
WHILE stillshds(shorthands) AND not found DO BEGIN
takeshd(shd,shorthands);
found:=(TSTRING_compare(currenttree^.ldfield.TERMINAL^.str,shd.str)=0);
END;
IF found THEN BEGIN
SURFLINKCODE_GRAPHproc(loopholes.retype(shd.tree,SURFLINKDECL_psnode),
GRAPH__iteration,
GRAPH__shorthands,
GRAPH__nodebefore,
GRAPH__nodeafter,
GRAPH__possempty,
GRAPH__basestate);
END
ELSE writeln('shorthand ',currenttree^.ldfield.TERMINAL^.str,' not found');
END
;
 BEGIN possempty:=GRAPH__possempty;
basestate:=GRAPH__basestate;
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN ELEMGRAPH_possempty:=possempty;
ELEMGRAPH_basestate:=basestate;
END
END;
PROCEDURE surflinkCODE_NUMBERproc(top:surflinkDECL_psnode
);
VAR currenttree:surflinkDECL_psnode;
    rsnode1:surflinkDECL_prsnode;

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
