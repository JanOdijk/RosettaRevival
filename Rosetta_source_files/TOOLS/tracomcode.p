EXPORT(tracomcode);
pragma C_include('tracomcode.pf');
pragma C_include('tracomdecl.pf');
pragma C_include('tracomlangspec.pf');
pragma C_include('liilrules.pf');
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
PROGRAM tracomCODE;
WITH tracomlangspec,
liilrules,
tracomdecl,ldtypetostr,lduniquerels,ldmrules,files,tfiles,tstring,lidomaint,str,mem,
tldstrtostr,ldconvrec,tldconvrec,ldstrtotype,ldcatsets,strng;
VAR LANGVERSION__language              :TSTRING_string
;RULESTRANS__pairsets              :tracomlangspec_setofpairsets
;RULESTRANS__anfile              :LOCALFILE
;RULESTRANS__intequals              :LOCALFILE
;RULESTRANS__genfile              :LOCALFILE
;RULETRANS__pairsets              :tracomlangspec_setofpairsets
;RULETRANS__leftnumcodes              :tracomlangspec_setofnumcodes
;RULETRANS__intequals              :LOCALFILE
;RULETRANS__rightnumcodes              :tracomlangspec_setofnumcodes
;ANDCOND__rulenumber              :tracomlangspec_int
;ANDCOND__copy              :LOCALFILE
;ANDCOND__intequals              :LOCALFILE
;ANDCOND__simple              :tracomlangspec_simple
;ORCOND__rulenumber              :tracomlangspec_int
;ORCOND__copy              :LOCALFILE
;ORCOND__intequals              :LOCALFILE
;ORCOND__simple              :tracomlangspec_simple
;ELEMENTARYCOND__rulenumber              :tracomlangspec_int
;ELEMENTARYCOND__copy              :LOCALFILE
;ELEMENTARYCOND__simple              :tracomlangspec_simple
;ELEMENTARYCOND__intequals              :LOCALFILE
;PASCALEXPR__rulenumber              :tracomlangspec_int
;PASCALEXPR__copy              :LOCALFILE
;PASCALEXPR__intequals              :LOCALFILE
;PASCALEXPR__simple              :tracomlangspec_simple
;SETVALUENAME__copy              :LOCALFILE
;of1:files_text;
of2:files_text;
PROCEDURE tracomCODE_UTTproc(top:tracomDECL_psnode
);
VAR currenttree:tracomDECL_psnode;
    rsnode1:tracomDECL_prsnode;
 pairsets: tracomLANGSPEC_setofpairsets; 
pairset: tracomLANGSPEC_pairset;
pairs: tracomLANGSPEC_setofpairs;
idents: tracomLANGSPEC_setofidents;
ident: tracomLANGSPEC_ident;
pair: tracomLANGSPEC_pair;
intequals:LOCALFILE;
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
 BEGIN 
TFILES_open(of1,'anofpas',7,3);
BEGIN
TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'EXPORT(LDANILRULES);',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'pragma C_include(''lsparams.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'pragma C_include(''ldanilrules.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'pragma C_include(''hiltree.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'pragma C_include(''liilrules.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'pragma C_include(''ldmrules.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'PROGRAM LDANILRULES;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'WITH lsparams,lsdomaint,',FILES_maxIO,0,left);


TFILES_writestr(of1,
'hiltree,liilrules,ldmrules;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' FUNCTION LDAnIlrules_RuleTransFer(',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' R:LDMrules_Ruleindex;ps:LDMrules_LiParameters):',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' HILtree_SetOfHyperNodeElt;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' VAR resultelt:HILTREE_HyperNodeElt;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' p:HILTREE_pHyperNodeElt;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' result,result1,result2,helpresult1:HILTREE_SetOfHyperNodeElt;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' lsps:LSPARAMS_precord;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' lips:LIILRULES_ilparams;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' X1,X2,X3:INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


END;
TFILES_open(of2,'genofpas',8,3);
BEGIN
TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'EXPORT(LDGENILRULES);',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'pragma C_include(''lsparams.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'pragma C_include(''ldgenilrules.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'pragma C_include(''hiltree.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'pragma C_include(''liilrules.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'pragma C_include(''ldmrules.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'pragma C_include(''hyperdtree.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'pragma C_include(''mem.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'PROGRAM LDGENILRULES;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'WITH lsparams,lsdomaint,',FILES_maxIO,0,left);


TFILES_writestr(of2,
'hiltree,liilrules,ldmrules,hyperdtree,mem;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' FUNCTION LDGenIlrules_RuleTransFer(',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' R:LIILrules_Ruleindex;ps:LIILrules_LiParameters):',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' HyperDtree_SetOfHNECluster;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' VAR resultelt:HYPERDTREE_HyperNodeElt;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' p:HYPERDTREE_pHyperNodeElt;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' result:HYPERDTREE_setofHNECluster;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' result1,result2,helpresult1:HYPERDTREE_SetOfHyperNodeElt;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' lsps,lsps1:LSPARAMS_precord;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' X1,X2,X3:INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


END;
END
END;

2: begin
  BEGIN pairsets:=currenttree^.ldfield.PARAMETERSTRANSfield^.pairsets END
; tracomCODE_PARAMETERSTRANSproc(currenttree
);
 BEGIN
END
END;

3: begin
  BEGIN 
TFILES_writestr(of1,
'procedure appendresults(result1:HILTREE_SetOfHyperNodeElt;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' VAR result:HILTREE_SetOfHyperNodeElt);',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'VAR node:HILTREE_pHypernodeelt;listrec:HILTREE_LoHyperIltree;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'IF HILTREE_Isemptynode(result) THEN result:=result1 ELSE BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'WHILE NOT HILTREE_Isemptynode(result1) DO',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' HILTREE_Takefromnode(node,result1);',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' HILTREE_Addtonode(node,result);',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' END;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


{also:
TFILES_writestr(of1,
'IF NOT(HILTREE_Isemptynode(result1)) THEN BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'HILtree_LoadLoHyperILtree(result.last,listrec);',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'listrec.next:=result1.first;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'HILtree_StoreLoHyperILtree(result.last,listrec);',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'result.last:=result1.last END END;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);

}

TFILES_writestr(of2,
'procedure appendresults(sg:INTEGER;result1:HYPERDTREE_SetOfHyperNodeElt;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' VAR result:HYPERDTREE_SetOfHNECluster);',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'VAR helpset1,helpset2:HYPERDTREE_SetOfHNECluster;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' cluster:HYPERDTREE_setofhypernodeelt;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' found:BOOLEAN;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'procedure appendresults(result1:HYPERDTREE_SetOfHyperNodeElt;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' VAR result:HYPERDTREE_SetOfHyperNodeElt);',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'VAR node:HYPERDTREE_pHypernodeelt;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'IF HYPERDTREE_Isemptynode(result) THEN result:=result1 ELSE BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'IF NOT(HYPERDTREE_Isemptynode(result1)) THEN BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'result.last^.next:=result1.first;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'result.last:=result1.last END END;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


{also:
TFILES_writestr(of2,
'WHILE NOT HYPERDTREE_Isemptynode(result1) DO',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' HYPERDTREE_Takefromnode(node,result1);',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' HYPERDTREE_Addtonode(node,result);',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' END;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);

}
TFILES_writestr(of2,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'helpset1:=result;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'found:=FALSE;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'WHILE NOT(HYPERDTREE_isemptyclusterset(helpset1)) AND NOT(found) DO',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' helpset2:=helpset1;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' HYPERDTREE_takeCluster(cluster,helpset1);',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' IF cluster.sg=sg THEN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' found:=TRUE;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' appendresults(result1,helpset2.first^.elts);',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' END;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' END;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'IF NOT found THEN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' cluster:=result1;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' cluster.sg:=sg;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' HYPERDTREE_Addcluster(cluster,result)',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' END;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


RULESTRANS__pairsets:=pairsets;
END
; tracomCODE_RULESTRANSproc(currenttree
,RULESTRANS__pairsets
,RULESTRANS__anfile
,RULESTRANS__intequals
,RULESTRANS__genfile
);
 BEGIN intequals:=RULESTRANS__intequals;
appendfile(intequals,of1);
appendfile(RULESTRANS__intequals,of2);

TFILES_writestr(of1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'resultelt.nodeKind := Hiltree_RuleNode;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'HILTREE_EmptyNode(result);',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'HILTREE_EmptyNode(result1);',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);



TFILES_writestr(of2,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'resultelt.nodeKind := HyperDtree_RuleNode;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'HYPERDTREE_EmptyClusterSet(result);',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'HYPERDTREE_EmptyNode(result1);',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


appendfile(RULESTRANS__anfile,of1);
appendfile(RULESTRANS__genfile,of2);
END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN 
TFILES_writestr(of1,
'LDANILRULES_RuleTransfer:=result;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);

 

TFILES_writestr(of2,
'LDGENILRULES_RuleTransfer:=result;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);

 
TFILES_close(of1);
TFILES_close(of2);
END
END;
PROCEDURE tracomCODE_PARAMETERSTRANSproc(top:tracomDECL_psnode
);
VAR currenttree:tracomDECL_psnode;
    rsnode1:tracomDECL_prsnode;
 
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
; tracomCODE_PARAMETERTRANSproc(currenttree
);
 BEGIN
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
END
END;
PROCEDURE tracomCODE_PARAMETERTRANSproc(top:tracomDECL_psnode
);
VAR currenttree:tracomDECL_psnode;
    rsnode1:tracomDECL_prsnode;
 
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
;
 BEGIN
END
END;

5: begin
  BEGIN END
;
 BEGIN
END
END;

6: begin
  BEGIN END
; tracomCODE_ELEMENTTRANSproc(currenttree
);
 BEGIN
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
 BEGIN
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
END
END;
PROCEDURE tracomCODE_ELEMENTTRANSproc(top:tracomDECL_psnode
);
VAR currenttree:tracomDECL_psnode;
    rsnode1:tracomDECL_prsnode;
 
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
;
 BEGIN
END
END;

5: begin
  BEGIN END
;
 BEGIN
END
END;

6: begin
  BEGIN END
;
 BEGIN
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
 BEGIN
END
END;

9: begin
  BEGIN END
;
 BEGIN
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
END
END;
PROCEDURE tracomCODE_LANGVERSIONproc(top:tracomDECL_psnode
;var LANGVERSION_language              :TSTRING_string
);
VAR currenttree:tracomDECL_psnode;
    rsnode1:tracomDECL_prsnode;
 language : TSTRING_string;
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
language:=currenttree^.ldfield.TERMINAL^.str;
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
LANGVERSION_language:=language;
END
END;
PROCEDURE tracomCODE_RULESTRANSproc(top:tracomDECL_psnode
;RULESTRANS_pairsets              :tracomlangspec_setofpairsets
;var RULESTRANS_anfile              :LOCALFILE
;var RULESTRANS_intequals              :LOCALFILE
;var RULESTRANS_genfile              :LOCALFILE
);
VAR currenttree:tracomDECL_psnode;
    rsnode1:tracomDECL_prsnode;
 
rightpresent,leftpresent: tracomLANGSPEC_bool;
rightsimples,leftsimples: tracomLANGSPEC_setofsimples;
intequals,leftcopy,rightcopy,anfile,genfile,helpfile:LOCALFILE;
ilrulenr,mrulenr: tracomLANGSPEC_int;
helpcodes,leftnumcodes,rightnumcodes,numcodes: tracomLANGSPEC_setofnumcodes;
numcode: tracomLANGSPEC_numcode;
pairsets: tracomLANGSPEC_setofpairsets;
 PROCEDURE MERGEleftnumcode(numcode: tracomLANGSPEC_numcode);
VAR table: tracomLANGSPEC_setofnumcodes;
numcode1: tracomLANGSPEC_numcode;
found: tracomLANGSPEC_bool;
BEGIN
table:=leftnumcodes;
found:=false;
WHILE stillnumcodes(table) and not found DO
BEGIN
takenumcode(numcode1,table);
IF numcode1.num=numcode.num THEN found:=true
END;
IF not found then appendnumcode(numcode,leftnumcodes)
ELSE
BEGIN
table:=leftnumcodes;
initsetofnumcodes(leftnumcodes);
WHILE stillnumcodes(table) DO
BEGIN
takenumcode(numcode1,table);
IF numcode1.num=numcode.num THEN
BEGIN
appendlocfile(numcode.code,numcode1.code);
END;
appendnumcode(numcode1,leftnumcodes);
END;
END;
END;
PROCEDURE MERGErightnumcode(numcode: tracomLANGSPEC_numcode);
VAR table: tracomLANGSPEC_setofnumcodes;
numcode1: tracomLANGSPEC_numcode;
found: tracomLANGSPEC_bool;
BEGIN
table:=rightnumcodes;
found:=false;
WHILE stillnumcodes(table) and not found DO
BEGIN
takenumcode(numcode1,table);
IF numcode1.num=numcode.num THEN found:=true
END;
IF not found then appendnumcode(numcode,rightnumcodes)
ELSE
BEGIN
table:=rightnumcodes;
initsetofnumcodes(rightnumcodes);
WHILE stillnumcodes(table) DO
BEGIN
takenumcode(numcode1,table);
IF numcode1.num=numcode.num THEN
BEGIN
appendlocfile(numcode.code,numcode1.code);
END;
appendnumcode(numcode1,rightnumcodes);
END;
END;
END;
BEGIN
 BEGIN initlocalfile(anfile);
initlocalfile(genfile);
initlocalfile(intequals);
initsetofnumcodes(rightnumcodes);
initsetofnumcodes(leftnumcodes);
pairsets:=RULESTRANS_pairsets;
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
  BEGIN RULETRANS__pairsets:=pairsets END
; tracomCODE_RULETRANSproc(currenttree
,RULETRANS__pairsets
,RULETRANS__leftnumcodes
,RULETRANS__intequals
,RULETRANS__rightnumcodes
);
 BEGIN
appendlocfile(RULETRANS__intequals,intequals);
leftpresent:=currenttree^.ldfield.RULETRANSfield^.leftpresent;
rightpresent:=currenttree^.ldfield.RULETRANSfield^.rightpresent;
IF leftpresent THEN
BEGIN
numcodes:=RULETRANS__leftnumcodes;
WHILE stillnumcodes(numcodes) DO
BEGIN
takenumcode(numcode,numcodes);
mergeleftnumcode(numcode);
END;
END;
IF rightpresent THEN
BEGIN
numcodes:=RULETRANS__rightnumcodes;
WHILE stillnumcodes(numcodes) DO
BEGIN
takenumcode(numcode,numcodes);
mergerightnumcode(numcode);
END;
END;
END;
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
helpcodes:=leftnumcodes;
appendstring('IF R IN [0..254] THEN',genfile);
appendstring('\\',genfile);

helpcodes:=leftnumcodes;
appendstring('CASE R OF',genfile);
appendstring('\\',genfile);

WHILE stillnumcodes(helpcodes) DO
BEGIN
takenumcode(numcode,helpcodes);
IF numcode.num<=254 THEN
BEGIN
appendstring(tracomDECL_convinttostring(numcode.num),genfile);
 appendstring(' :BEGIN',genfile);
appendstring('\\',genfile);

appendlocfile(numcode.code,genfile);
appendstring(' END;',genfile);
appendstring('\\',genfile);

END;
END;
appendstring('END;{CASE}',genfile);
appendstring('\\',genfile);

appendstring('R:=R-254;',genfile);
appendstring('\\',genfile);

helpcodes:=leftnumcodes;
appendstring('IF R >0 THEN IF R<=254 THEN',genfile);
appendstring('\\',genfile);

helpcodes:=leftnumcodes;
appendstring('CASE R OF',genfile);
appendstring('\\',genfile);

appendstring('0: BEGIN END;',genfile);
appendstring('\\',genfile);
{omdat de case niet leeg mag zijn}
WHILE stillnumcodes(helpcodes) DO
BEGIN
takenumcode(numcode,helpcodes);
IF numcode.num>254 THEN IF numcode.num<=508 THEN
BEGIN
appendstring(tracomDECL_convinttostring(numcode.num-254),genfile);
 appendstring(' :BEGIN',genfile);
appendstring('\\',genfile);

appendlocfile(numcode.code,genfile);
appendstring(' END;',genfile);
appendstring('\\',genfile);

END;
END;
appendstring('END;{CASE}',genfile);
appendstring('\\',genfile);

appendstring('R:=R-254;',genfile);
appendstring('\\',genfile);

helpcodes:=leftnumcodes;
appendstring('IF R >0 THEN',genfile);
appendstring('\\',genfile);

helpcodes:=leftnumcodes;
appendstring('CASE R OF',genfile);
appendstring('\\',genfile);

appendstring('0: BEGIN END;',genfile);
appendstring('\\',genfile);
{omdat de case niet leeg mag zijn}
WHILE stillnumcodes(helpcodes) DO
BEGIN
takenumcode(numcode,helpcodes);
IF numcode.num>762 THEN 
writeln('total number of rules exceeded, WARN Rene');
IF numcode.num>508 THEN
BEGIN
appendstring(tracomDECL_convinttostring(numcode.num-508),genfile);
 appendstring(' :BEGIN',genfile);
appendstring('\\',genfile);

appendlocfile(numcode.code,genfile);
appendstring(' END;',genfile);
appendstring('\\',genfile);

END;
END;
appendstring('END;{CASE}',genfile);
appendstring('\\',genfile);

 
helpcodes:=rightnumcodes;
appendstring('IF R IN [0..254] THEN',anfile);
appendstring('\\',anfile);

helpcodes:=rightnumcodes;
appendstring('CASE R OF',anfile);
appendstring('\\',anfile);

WHILE stillnumcodes(helpcodes) DO
BEGIN
takenumcode(numcode,helpcodes);
IF numcode.num<=254 THEN
BEGIN
appendstring(tracomDECL_convinttostring(numcode.num),anfile);
 appendstring(' :BEGIN',anfile);
appendstring('\\',anfile);

appendlocfile(numcode.code,anfile);
appendstring(' END;',anfile);
appendstring('\\',anfile);

END;
END;
appendstring('END;{CASE}',anfile);
appendstring('\\',anfile);

appendstring('R:=R-254;',anfile);
appendstring('\\',anfile);

helpcodes:=rightnumcodes;
appendstring('IF R >0 THEN IF R<=254 THEN',anfile);
appendstring('\\',anfile);

helpcodes:=rightnumcodes;
appendstring('CASE R OF',anfile);
appendstring('\\',anfile);

appendstring('0: BEGIN END;',anfile);
appendstring('\\',anfile);
{omdat de case niet leeg mag zijn}
WHILE stillnumcodes(helpcodes) DO
BEGIN
takenumcode(numcode,helpcodes);
IF numcode.num>254 THEN IF numcode.num<=508 THEN
BEGIN
appendstring(tracomDECL_convinttostring(numcode.num-254),anfile);
 appendstring(' :BEGIN',anfile);
appendstring('\\',anfile);

appendlocfile(numcode.code,anfile);
appendstring(' END;',anfile);
appendstring('\\',anfile);

END;
END;
appendstring('END;{CASE}',anfile);
appendstring('\\',anfile);

appendstring('R:=R-254;',anfile);
appendstring('\\',anfile);

helpcodes:=rightnumcodes;
appendstring('IF R >0 THEN',anfile);
appendstring('\\',anfile);

helpcodes:=rightnumcodes;
appendstring('CASE R OF',anfile);
appendstring('\\',anfile);

appendstring('0: BEGIN END;',anfile);
appendstring('\\',anfile);
{omdat de case niet leeg mag zijn}
WHILE stillnumcodes(helpcodes) DO
BEGIN
takenumcode(numcode,helpcodes);
IF numcode.num>762 THEN 
writeln('total number of rules exceeded, WARN Rene');
IF numcode.num>508 THEN
BEGIN
appendstring(tracomDECL_convinttostring(numcode.num-508),anfile);
 appendstring(' :BEGIN',anfile);
appendstring('\\',anfile);

appendlocfile(numcode.code,anfile);
appendstring(' END;',anfile);
appendstring('\\',anfile);

END;
END;
appendstring('END;{CASE}',anfile);
appendstring('\\',anfile);

RULESTRANS_intequals:=intequals;
RULESTRANS_genfile:=genfile;
RULESTRANS_anfile:=anfile;
END
END;
PROCEDURE tracomCODE_RULETRANSproc(top:tracomDECL_psnode
;RULETRANS_pairsets              :tracomlangspec_setofpairsets
;var RULETRANS_leftnumcodes              :tracomlangspec_setofnumcodes
;var RULETRANS_intequals              :LOCALFILE
;var RULETRANS_rightnumcodes              :tracomlangspec_setofnumcodes
);
VAR currenttree:tracomDECL_psnode;
    rsnode1:tracomDECL_prsnode;
 leftsimples,rightsimples,rightsimples1: tracomLANGSPEC_setofsimples;
simplesets1,simplesets2,rightsimplesets,leftsimplesets: tracomLANGSPEC_setofsimplesets;
simpleset: tracomLANGSPEC_simpleset;
wbonus,sbonus: tracomLANGSPEC_int;
found: tracomLANGSPEC_bool;
simple: tracomLANGSPEC_simple;
mparamlist:LDMRULES_paramlist;
ilparamlist:LIILRULES_paramlist;
leftpresent,rightpresent: tracomLANGSPEC_bool;
intequals,helpfile,leftcopy,rightcopy,tempfile:LOCALFILE;
numofleftconds,numofrightconds: tracomLANGSPEC_int;
ilrulenr,Mrulenr,sgnr: tracomLANGSPEC_int;
str: STR_string;
len:STRING_range;
paramname:TSTRING_string;
leftnumcodes,rightnumcodes: tracomLANGSPEC_setofnumcodes;
numcode: tracomLANGSPEC_numcode;
pairsets: tracomLANGSPEC_setofpairsets;
pairset: tracomLANGSPEC_pairset;
pairs: tracomLANGSPEC_setofpairs;
pair: tracomLANGSPEC_pair;
leftsets,rightsets: tracomLANGSPEC_setofidentsets;
identset: tracomLANGSPEC_identset;
lefts,rights: tracomLANGSPEC_setofidents;
identset1,identset2: tracomLANGSPEC_identset;
ident: tracomLANGSPEC_ident;
 
FUNCTION FINDILPARAM(pairsets: tracomLANGSPEC_setofpairsets;str:TSTRING_string;
ilparamlist:LIILRULES_paramlist): tracomLANGSPEC_pairset;
VAR result,ilparamname:TSTRING_string;
pairset: tracomLANGSPEC_pairset;
found: tracomLANGSPEC_bool;
list:LIILRULES_paramlist;
BEGIN
initsetofpairs(pairset.pairs);
found:=false;
TSTRING_constantempty(result);
WHILE stillpairsets(pairsets) and not found DO
BEGIN
takepairset(pairset,pairsets);
found:=(TSTRING_compare(pairset.mruparam,str)=0);
IF found THEN
BEGIN
found:=FALSE;
list:=ilparamlist;
WHILE (list<>NIL) AND NOT(found) DO
BEGIN
TSTRING_constant(ilparamname,list^.paramname,
list^.length);
found:=(TSTRING_compare(pairset.ilparam,ilparamname)=0);
list:=list^.next
END;
END;
END;
IF found THEN result:=pairset.ilparam
ELSE writeln('WARNING no translation for MRULE-parameter ',str);
findilparam:=pairset;
END;
FUNCTION FINDMRUPARAM(pairsets: tracomLANGSPEC_setofpairsets;str:TSTRING_string;
mparamlist:LDMRULES_paramlist): tracomLANGSPEC_pairset;
VAR result,mparamname:TSTRING_string;
pairset: tracomLANGSPEC_pairset;
found: tracomLANGSPEC_bool;
list:LDMRULES_paramlist;
BEGIN
initsetofpairs(pairset.pairs);
found:=false;
TSTRING_constantempty(result);
WHILE stillpairsets(pairsets) and not found DO
BEGIN
takepairset(pairset,pairsets);
found:=(TSTRING_compare(pairset.ilparam,str)=0);
IF found THEN
BEGIN
found:=FALSE;
list:=mparamlist;
WHILE (list<>NIL) AND NOT(found) DO
BEGIN
TSTRING_constant(mparamname,list^.paramname,
list^.length);
found:=(TSTRING_compare(pairset.mruparam,mparamname)=0);
list:=list^.next
END;
END;
END;
IF found THEN result:=pairset.mruparam
ELSE writeln('WARNING no translation for IL-parameter ',str);
findmruparam:=pairset;
END;
PROCEDURE MERGEleftnumcode(numcode: tracomLANGSPEC_numcode);
VAR table: tracomLANGSPEC_setofnumcodes;
numcode1: tracomLANGSPEC_numcode;
found: tracomLANGSPEC_bool;
BEGIN
table:=leftnumcodes;
found:=false;
WHILE stillnumcodes(table) and not found DO
BEGIN
takenumcode(numcode1,table);
IF numcode1.num=numcode.num THEN found:=true
END;
IF not found then appendnumcode(numcode,leftnumcodes)
ELSE
BEGIN
table:=leftnumcodes;
initsetofnumcodes(leftnumcodes);
WHILE stillnumcodes(table) DO
BEGIN
takenumcode(numcode1,table);
IF numcode1.num=numcode.num THEN
BEGIN
appendlocfile(numcode.code,numcode1.code);
END;
appendnumcode(numcode1,leftnumcodes);
END;
END;
END;
PROCEDURE MERGErightnumcode(numcode: tracomLANGSPEC_numcode);
VAR table: tracomLANGSPEC_setofnumcodes;
numcode1: tracomLANGSPEC_numcode;
found: tracomLANGSPEC_bool;
BEGIN
table:=rightnumcodes;
found:=false;
WHILE stillnumcodes(table) and not found DO
BEGIN
takenumcode(numcode1,table);
IF numcode1.num=numcode.num THEN found:=true
END;
IF not found then appendnumcode(numcode,rightnumcodes)
ELSE
BEGIN
table:=rightnumcodes;
initsetofnumcodes(rightnumcodes);
WHILE stillnumcodes(table) DO
BEGIN
takenumcode(numcode1,table);
IF numcode1.num=numcode.num THEN
BEGIN
appendlocfile(numcode.code,numcode1.code);
END;
appendnumcode(numcode1,rightnumcodes);
END;
END;
END;
BEGIN
 BEGIN initsetofsimples(leftsimples);
initsetofsimples(rightsimples);
initsetofsimplesets(leftsimplesets);
initsetofsimplesets(rightsimplesets);
numofleftconds:=0;
numofrightconds:=0;
initlocalfile(leftcopy);
initlocalfile(rightcopy);
leftpresent:=top^.ldfield.RULETRANSfield^.leftpresent;
rightpresent:=top^.ldfield.RULETRANSfield^.rightpresent;
mrulenr:=-1;
initlocalfile(intequals);
initsetofnumcodes(leftnumcodes);
initsetofnumcodes(rightnumcodes);
pairsets:=RULETRANS_pairsets;
wbonus:=top^.ldfield.RULETRANSfield^.wbonus;
sbonus:=top^.ldfield.RULETRANSfield^.sbonus;
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
  BEGIN TSTRING_extractchars(str,len,currenttree^.ldfield.TERMINAL^.str,0,TSTRING_length(currenttree^.ldfield.MRULENAMEfield^.str));
mrulenr:=-1;
LDMRULES_rulenumber(mrulenr,str,len);
IF mrulenr=-1 THEN
BEGIN
mrulenr:=1;
writeln('WARNING: unknown Mrule ',currenttree^.ldfield.MRULENAMEfield^.str);
END;
sgnr:=-1;
LDMRULES_subgrammarnumber(mrulenr,sgnr);
IF sgnr=-1 THEN BEGIN
writeln('WARNING:RULE ',currenttree^.ldfield.MRULENAMEfield^.str,' is not in any SUBGRAMMAR');
END;
END
;
 BEGIN END
END;

3: begin
  BEGIN TSTRING_extractchars(str,len,currenttree^.ldfield.TERMINAL^.str,0,TSTRING_length(currenttree^.ldfield.ILRULENAMEfield^.str));
LIILRULES_Rulenumber(ilrulenr,str,len);
IF ilrulenr=-1 THEN
BEGIN
ilrulenr:=1;
writeln('WARNING: unknown ILrule ',currenttree^.ldfield.ILRULENAMEfield^.str);
END;
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

6: begin
  BEGIN numofleftconds:=numofleftconds+1;
ANDCOND__rulenumber:=mrulenr;
END
; tracomCODE_ANDCONDproc(currenttree
,ANDCOND__rulenumber
,ANDCOND__copy
,ANDCOND__intequals
,ANDCOND__simple
);
 BEGIN appendlocfile(ANDCOND__intequals,intequals);
IF leftpresent THEN
appendsimple(ANDCOND__simple,leftsimples);

IF numofleftconds=1 THEN appendstring('(',leftcopy);

IF numofleftconds>1 THEN BEGIN appendstring(' AND (',leftcopy);
 appendstring('\\',leftcopy);
 END;
appendlocfile(ANDCOND__copy,leftcopy);
appendstring(')',leftcopy);

END
END;

7: begin
  BEGIN numofrightconds:=numofrightconds+1;
ANDCOND__rulenumber:=ilrulenr;
END
; tracomCODE_ANDCONDproc(currenttree
,ANDCOND__rulenumber
,ANDCOND__copy
,ANDCOND__intequals
,ANDCOND__simple
);
 BEGIN appendlocfile(ANDCOND__intequals,intequals);
IF rightpresent THEN
appendsimple(ANDCOND__simple,rightsimples);

IF numofrightconds=1 THEN appendstring('(',rightcopy);

IF numofrightconds>1 THEN BEGIN appendstring(' AND (',rightcopy);
 appendstring('\\',rightcopy);
 END;
appendlocfile(ANDCOND__copy,rightcopy);
appendstring(')',rightcopy);

END
END;

8: begin
  BEGIN 
IF numofleftconds=0 THEN 
BEGIN initlocalfile(leftcopy);appendstring(' TRUE ',leftcopy);
 appendstring('\\',leftcopy);
 END;
simpleset.val:=leftsimples;
simpleset.copy:=leftcopy;
simpleset.rulenr:=mrulenr;
appendsimpleset(simpleset,leftsimplesets);
numofleftconds:=0;
initlocalfile(leftcopy);
initsetofsimples(leftsimples);
END
;
 BEGIN
END
END;

9: begin
  BEGIN 
IF numofrightconds=0 THEN 
BEGIN initlocalfile(rightcopy); appendstring('TRUE ',rightcopy);
 appendstring('\\',rightcopy);
 END;
simpleset.val:=rightsimples;
simpleset.copy:=rightcopy;
simpleset.rulenr:=ilrulenr;
appendsimpleset(simpleset,rightsimplesets);
numofrightconds:=0;
initlocalfile(rightcopy);
initsetofsimples(rightsimples);
END
;
 BEGIN
END
END;

10: begin
  BEGIN
END
;
 BEGIN
END
END;

11: begin
  BEGIN
END
;
 BEGIN
END
END;

12: begin
  BEGIN
END
;
 BEGIN
END
END;

13: begin
  BEGIN
END
;
 BEGIN
END
END;

14: begin
  BEGIN
END
;
 BEGIN
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
IF numofleftconds=0 THEN BEGIN initlocalfile(leftcopy);appendstring(' TRUE ',leftcopy);
 appendstring('\\',leftcopy);
 END;

IF numofrightconds=0 THEN BEGIN initlocalfile(rightcopy); appendstring(' TRUE ',rightcopy);
 appendstring('\\',rightcopy);
 END;
simpleset.val:=leftsimples;
simpleset.copy:=leftcopy;
simpleset.rulenr:=mrulenr;
appendsimpleset(simpleset,leftsimplesets);
simpleset.val:=rightsimples;
simpleset.copy:=rightcopy;
simpleset.rulenr:=ilrulenr;
appendsimpleset(simpleset,rightsimplesets);
IF leftpresent THEN
BEGIN

simplesets1:=rightsimplesets;
WHILE stillsimplesets(simplesets1) DO
BEGIN
takesimpleset(simpleset,simplesets1);
rightcopy:=simpleset.copy;
ilrulenr:=simpleset.rulenr;
rightsimples:=simpleset.val;
simplesets2:=leftsimplesets;
WHILE stillsimplesets(simplesets2) DO
BEGIN
initlocalfile(helpfile);
takesimpleset(simpleset,simplesets2);
leftsimples:=simpleset.val;
leftcopy:=simpleset.copy;
mrulenr:=simpleset.rulenr;
appendstring(' HYPERDTREE_emptyNode(result1);',helpfile);
appendstring('\\',helpfile);

appendstring(' WITH ps.params DO BEGIN',helpfile);
appendstring('\\',helpfile);

appendstring('IF ',helpfile);

savelocfile(rightcopy,tempfile);
appendlocfile(tempfile,helpfile);
LDMRULES_subgrammarnumber(mrulenr,sgnr);
appendstring(' THEN BEGIN',helpfile);
appendstring('\\',helpfile);

IF wbonus<0 THEN BEGIN appendstring('resultelt.bonus:=-',helpfile);
 appendstring(tracomDECL_convinttostring(-wbonus),helpfile);
 appendstring(';',helpfile);
appendstring('\\',helpfile);

END ELSE BEGIN appendstring('resultelt.bonus:=',helpfile);
 appendstring(tracomDECL_convinttostring(wbonus),helpfile);
 appendstring(';',helpfile);
 appendstring('\\',helpfile);
 END;
appendstring(' resultelt.sg:=',helpfile);
 appendstring(tracomDECL_convinttostring(sgnr),helpfile);
 appendstring(';',helpfile);
appendstring('\\',helpfile);

appendstring(' resultelt.R:=',helpfile);
 appendstring(tracomDECL_convinttostring(mrulenr),helpfile);
 appendstring(';',helpfile);
appendstring('\\',helpfile);

appendstring(' MEM_newdefault(loopholes.sizeof(LSPARAMS_record),',helpfile);
 
appendstring('loopholes.retype(lsps,MEM_ptr));',helpfile);
appendstring('\\',helpfile);
 
appendstring(' lsps^.rulenr:=',helpfile);
 appendstring(tracomDECL_convinttostring(mrulenr),helpfile);
 appendstring(';',helpfile);
appendstring('\\',helpfile);

appendstring(' resultelt.parameters.rulenr:=',helpfile);
 appendstring(tracomDECL_convinttostring(mrulenr),helpfile);
 appendstring(';',helpfile);
appendstring('\\',helpfile);

appendstring(' resultelt.parameters.subst:=ps.subst;',helpfile);
appendstring('\\',helpfile);

appendstring(' resultelt.parameters.index:=-1;',helpfile);
appendstring('\\',helpfile);

LDMRULES_ruleparameters(mrulenr,mparamlist);
WHILE mparamlist<>NIL DO
BEGIN
TSTRING_constant(paramname,mparamlist^.paramname,
mparamlist^.length);
IF TSTRING_comparechars(paramname,'LEVEL',5)=0 THEN
BEGIN
appendstring(' resultelt.parameters.index:=ps.index;',helpfile);
appendstring('\\',helpfile);

END;
mparamlist:=mparamlist^.next;
END;
WHILE stillsimples(leftsimples) DO
BEGIN
takesimple(simple,leftsimples);
savelocfile(simple.valeu,tempfile);
appendstring(' lsps^.X',helpfile);
 appendstring(tracomDECL_convinttostring(mrulenr),helpfile);
 appendstring(simple.param,helpfile);

appendstring(':=',helpfile);
 appendlocfile(tempfile,helpfile); appendstring(';',helpfile);
appendstring('\\',helpfile);

END;
appendstring(' resultelt.parameters.ls:=loopholes.retype',helpfile);
 
appendstring('(lsps,LDMRULES_lsparams);',helpfile);
appendstring('\\',helpfile);

appendstring(' MEM_newdefault(loopholes.sizeof',helpfile);
 appendstring('(HYPERDTREE_hypernodeelt),',helpfile);

appendstring('loopholes.retype(p,MEM_ptr));',helpfile);
appendstring('\\',helpfile);

appendstring(' p^:=resultelt;',helpfile);
appendstring('\\',helpfile);

appendstring(' HYPERDTREE_AddToNode(p,result1);',helpfile);
appendstring('\\',helpfile);

LDMRULES_ruleparameters(mrulenr,mparamlist);
LIILRULES_ruleparameters(ilrulenr,ilparamlist);
WHILE mparamlist<>NIL DO
BEGIN
TSTRING_constant(paramname,mparamlist^.paramname,
mparamlist^.length);
IF TSTRING_comparechars(paramname,'LEVEL',5)<>0 THEN
BEGIN
found:=false;
leftsimples:=simpleset.val;
WHILE stillsimples(leftsimples) and not found DO
BEGIN
takesimple(simple,leftsimples);
found := TSTRING_compare(simple.param,paramname)=0
END;
IF not found THEN
BEGIN
pairset:=findilparam(pairsets,paramname,ilparamlist);
pairs:=pairset.pairs;
appendstring('helpresult1:=result1;',helpfile);
appendstring('\\',helpfile);

appendstring('HYPERDTREE_emptyNode(result1);',helpfile);
appendstring('\\',helpfile);

WHILE stillpairs(pairs) DO
BEGIN
takepair(pair,pairs);
IF pair.leftpresent THEN
BEGIN
IF pair.rightsetvalued THEN
BEGIN
rightsets:=pair.rightsets;
WHILE stillidentsets(rightsets) DO
BEGIN
takeidentset(identset1,rightsets);
appendstring(' IF X',helpfile);
 appendstring(tracomDECL_convinttostring(ilrulenr),helpfile);

appendstring(pairset.ilparam,helpfile);
 appendstring('= [',helpfile);

WHILE stillidents(identset1.val) DO
BEGIN
takeident(ident,identset1.val);
appendstring(ident.str,helpfile);

IF stillidents(identset1.val) THEN appendstring(',',helpfile);

appendstring('\\',helpfile);

END;
appendstring(' ] THEN BEGIN',helpfile);
appendstring('\\',helpfile);

IF pair.leftsetvalued THEN
BEGIN
leftsets:=pair.leftsets;
WHILE stillidentsets(leftsets) DO
BEGIN
takeidentset(identset2,leftsets);
appendstring('result2:=helpresult1;',helpfile);
appendstring('\\',helpfile);

appendstring('WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO',helpfile);
appendstring('\\',helpfile);

appendstring(' BEGIN',helpfile);
appendstring('\\',helpfile);

appendstring(' HYPERDTREE_TakeFromNode(p,result2);',helpfile);
appendstring('\\',helpfile);

appendstring(' resultelt:=p^;',helpfile);
appendstring('\\',helpfile);

appendstring('lsps1:=loopholes.retype',helpfile);

appendstring('(resultelt.parameters.ls,LSPARAMS_precord);',helpfile);
appendstring('\\',helpfile);

appendstring('MEM_newdefault(loopholes.sizeof(LSPARAMS_record),',helpfile);

appendstring('loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;',helpfile);
appendstring('\\',helpfile);

appendstring('lsps^.X',helpfile);
 appendstring(tracomDECL_convinttostring(mrulenr),helpfile);
 appendstring(paramname,helpfile);

appendstring(':=[',helpfile);

WHILE stillidents(identset2.val) DO
BEGIN
takeident(ident,identset2.val);
appendstring(ident.str,helpfile);

IF stillidents(identset2.val) THEN appendstring(',',helpfile);

appendstring('\\',helpfile);

END;
appendstring(' ];',helpfile);
appendstring('\\',helpfile);

appendstring('resultelt.parameters.ls:=loopholes.retype',helpfile);
 
appendstring('(lsps,LDMRULES_lsparams);',helpfile);
appendstring('\\',helpfile);

appendstring('MEM_newdefault(loopholes.sizeof',helpfile);
 appendstring('(HYPERDTREE_hypernodeelt),',helpfile);

appendstring('loopholes.retype(p,MEM_ptr));',helpfile);
appendstring('\\',helpfile);

appendstring('p^:=resultelt;',helpfile);
appendstring('\\',helpfile);

appendstring('HYPERDTREE_addtoNode(p,result1);',helpfile);
appendstring('\\',helpfile);

appendstring('END;',helpfile);
appendstring('\\',helpfile);

END;
END
ELSE {not pair.leftsetvalued}
BEGIN
lefts:=pair.lefts;
WHILE stillidents(lefts) DO
BEGIN
takeident(ident,lefts);
appendstring('result2:=helpresult1;',helpfile);
appendstring('\\',helpfile);

appendstring('WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO',helpfile);
appendstring('\\',helpfile);

appendstring(' BEGIN',helpfile);
appendstring('\\',helpfile);

appendstring(' HYPERDTREE_TakeFromNode(p,result2);',helpfile);
appendstring('\\',helpfile);

appendstring(' resultelt:=p^;',helpfile);
appendstring('\\',helpfile);

appendstring('lsps1:=loopholes.retype',helpfile);

appendstring('(resultelt.parameters.ls,LSPARAMS_precord);',helpfile);
appendstring('\\',helpfile);

appendstring('MEM_newdefault(loopholes.sizeof(LSPARAMS_record),',helpfile);

appendstring('loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;',helpfile);
appendstring('\\',helpfile);

appendstring('lsps^.X',helpfile);
 appendstring(tracomDECL_convinttostring(mrulenr),helpfile);
 appendstring(paramname,helpfile);

appendstring(':=',helpfile);
 appendstring(ident.str,helpfile);
 appendstring(';',helpfile);
appendstring('\\',helpfile);

appendstring('resultelt.parameters.ls:=loopholes.retype',helpfile);
 
appendstring('(lsps,LDMRULES_lsparams);',helpfile);
appendstring('\\',helpfile);

appendstring(' MEM_newdefault(loopholes.sizeof',helpfile);
 appendstring('(HYPERDTREE_hypernodeelt),',helpfile);

appendstring('loopholes.retype(p,MEM_ptr));',helpfile);
appendstring('\\',helpfile);

appendstring('p^:=resultelt;',helpfile);
appendstring('\\',helpfile);

appendstring('HYPERDTREE_addtonode(p,result1);',helpfile);
appendstring('\\',helpfile);

appendstring('END;',helpfile);
appendstring('\\',helpfile);

END;
END;
appendstring(' END;',helpfile);
appendstring('\\',helpfile);

END;
END
ELSE {not pair.rightsetvalued}
BEGIN
rights:=pair.rights;
WHILE stillidents(rights) DO
BEGIN
takeident(ident,rights);
appendstring(' IF X',helpfile);
 appendstring(tracomDECL_convinttostring(ilrulenr),helpfile);

appendstring(pairset.ilparam,helpfile);
 appendstring('=',helpfile);
 appendstring(ident.str,helpfile);

appendstring(' THEN BEGIN',helpfile);
appendstring('\\',helpfile);

IF pair.leftsetvalued THEN
BEGIN
leftsets:=pair.leftsets;
WHILE stillidentsets(leftsets) DO
BEGIN
takeidentset(identset2,leftsets);
appendstring('result2:=helpresult1;',helpfile);
appendstring('\\',helpfile);

appendstring('WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO',helpfile);
appendstring('\\',helpfile);

appendstring(' BEGIN',helpfile);
appendstring('\\',helpfile);

appendstring(' HYPERDTREE_TakeFromNode(p,result2);',helpfile);
appendstring('\\',helpfile);

appendstring(' resultelt:=p^;',helpfile);
appendstring('\\',helpfile);

appendstring('lsps1:=loopholes.retype',helpfile);

appendstring('(resultelt.parameters.ls,LSPARAMS_precord);',helpfile);
appendstring('\\',helpfile);

appendstring('MEM_newdefault(loopholes.sizeof(LSPARAMS_record),',helpfile);

appendstring('loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;',helpfile);
appendstring('\\',helpfile);

appendstring('lsps^.X',helpfile);
 appendstring(tracomDECL_convinttostring(mrulenr),helpfile);
 appendstring(paramname,helpfile);

appendstring(':=[',helpfile);

WHILE stillidents(identset2.val) DO
BEGIN
takeident(ident,identset2.val);
appendstring(ident.str,helpfile);

IF stillidents(identset2.val) THEN appendstring(',',helpfile);

appendstring('\\',helpfile);

END;
appendstring(' ];',helpfile);
appendstring('\\',helpfile);

appendstring('resultelt.parameters.ls:=loopholes.retype',helpfile);
 
appendstring('(lsps,LDMRULES_lsparams);',helpfile);
appendstring('\\',helpfile);

appendstring(' MEM_newdefault(loopholes.sizeof',helpfile);
 appendstring('(HYPERDTREE_hypernodeelt),',helpfile);

appendstring('loopholes.retype(p,MEM_ptr));',helpfile);
appendstring('\\',helpfile);

appendstring('p^:=resultelt;',helpfile);
appendstring('\\',helpfile);

appendstring('HYPERDTREE_addtoNode(p,result1);',helpfile);
appendstring('\\',helpfile);

appendstring('END;',helpfile);
appendstring('\\',helpfile);

END;
END
ELSE {not pair.leftsetvalued}
BEGIN
lefts:=pair.lefts;
WHILE stillidents(lefts) DO
BEGIN
takeident(ident,lefts);
appendstring('result2:=helpresult1;',helpfile);
appendstring('\\',helpfile);

appendstring('WHILE NOT(HYPERDTREE_IsEmptyNode(result2)) DO',helpfile);
appendstring('\\',helpfile);

appendstring(' BEGIN',helpfile);
appendstring('\\',helpfile);

appendstring(' HYPERDTREE_TakeFromNode(p,result2);',helpfile);
appendstring('\\',helpfile);

appendstring(' resultelt:=p^;',helpfile);
appendstring('\\',helpfile);

appendstring('lsps1:=loopholes.retype',helpfile);

appendstring('(resultelt.parameters.ls,LSPARAMS_precord);',helpfile);
appendstring('\\',helpfile);

appendstring('MEM_newdefault(loopholes.sizeof(LSPARAMS_record),',helpfile);

appendstring('loopholes.retype(lsps,MEM_ptr));lsps^:=lsps1^;',helpfile);
appendstring('\\',helpfile);

appendstring('lsps^.X',helpfile);
 appendstring(tracomDECL_convinttostring(mrulenr),helpfile);
 appendstring(paramname,helpfile);

appendstring(':=',helpfile);
 appendstring(ident.str,helpfile);
 appendstring(';',helpfile);
appendstring('\\',helpfile);

appendstring('resultelt.parameters.ls:=loopholes.retype',helpfile);
 
appendstring('(lsps,LDMRULES_lsparams);',helpfile);
appendstring('\\',helpfile);

appendstring(' MEM_newdefault(loopholes.sizeof',helpfile);
 appendstring('(HYPERDTREE_hypernodeelt),',helpfile);

appendstring('loopholes.retype(p,MEM_ptr));',helpfile);
appendstring('\\',helpfile);

appendstring('p^:=resultelt;',helpfile);
appendstring('\\',helpfile);

appendstring('HYPERDTREE_addtoNode(p,result1);',helpfile);
appendstring('\\',helpfile);

appendstring('END;',helpfile);
appendstring('\\',helpfile);

END;
END;
appendstring('END;',helpfile);
appendstring('\\',helpfile);

END;
END;
END;
END;
END;
END;
mparamlist:=mparamlist^.next;
END;
appendstring('appendresults(',helpfile);
 appendstring(tracomDECL_convinttostring(sgnr),helpfile);
 appendstring(',result1,result);',helpfile);
appendstring('\\',helpfile);

appendstring(' END;',helpfile);
appendstring('\\',helpfile);

appendstring(' END{WITH};',helpfile);
appendstring('\\',helpfile);

numcode.code:=helpfile;
numcode.num:=ilrulenr;
mergeleftnumcode(numcode);
END;
END;
END;
IF rightpresent THEN
BEGIN

simplesets1:=rightsimplesets;
WHILE stillsimplesets(simplesets1) DO
BEGIN
takesimpleset(simpleset,simplesets1);
rightsimples:=simpleset.val;
rightcopy:=simpleset.copy;
ilrulenr:=simpleset.rulenr;
simplesets2:=leftsimplesets;
WHILE stillsimplesets(simplesets2) DO
BEGIN
takesimpleset(simpleset,simplesets2);
leftsimples:=simpleset.val;
leftcopy:=simpleset.copy;
mrulenr:=simpleset.rulenr;
initlocalfile(helpfile);
rightsimples1:=rightsimples;
LIILRULES_ruleparameters(ilrulenr,ilparamlist);
appendstring('lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);',helpfile);
appendstring('\\',helpfile);

appendstring('HILTREE_emptyNode(result1);',helpfile);
appendstring('\\',helpfile);

appendstring('WITH lsps^ DO BEGIN',helpfile);
appendstring('\\',helpfile);

appendstring('IF ',helpfile);

savelocfile(leftcopy,tempfile);
appendlocfile(tempfile,helpfile);
appendstring(' THEN BEGIN',helpfile);
appendstring('\\',helpfile);

IF wbonus<0 THEN BEGIN appendstring('resultelt.sembonus:=-',helpfile);
 appendstring(tracomDECL_convinttostring(-wbonus),helpfile);
 appendstring(';',helpfile);
appendstring('\\',helpfile);

END ELSE BEGIN appendstring('resultelt.sembonus:=',helpfile);
 appendstring(tracomDECL_convinttostring(wbonus),helpfile);
 appendstring(';',helpfile);
 appendstring('\\',helpfile);
END;
appendstring(' resultelt.R:=',helpfile);
 appendstring(tracomDECL_convinttostring(ilrulenr),helpfile);
 appendstring(';',helpfile);
appendstring('\\',helpfile);

appendstring(' lips.rulenr:=',helpfile);
 appendstring(tracomDECL_convinttostring(ilrulenr),helpfile);
 appendstring(';',helpfile);
appendstring('\\',helpfile);

appendstring(' resultelt.parameters.index:=-1;',helpfile);
appendstring('\\',helpfile);

appendstring(' resultelt.parameters.subst:=ps.subst;',helpfile);
appendstring('\\',helpfile);

WHILE stillsimples(rightsimples1) DO
BEGIN
takesimple(simple,rightsimples1);
savelocfile(simple.valeu,tempfile);
appendstring(' lips.X',helpfile);
 appendstring(tracomDECL_convinttostring(ilrulenr),helpfile);
 appendstring(simple.param,helpfile);

appendstring(':=',helpfile);
 appendlocfile(tempfile,helpfile); appendstring(';',helpfile);
appendstring('\\',helpfile);

END;
LIILRULES_ruleparameters(ilrulenr,ilparamlist);
WHILE ilparamlist<>NIL DO
BEGIN
TSTRING_constant(paramname,ilparamlist^.paramname,
ilparamlist^.length);
IF TSTRING_comparechars(paramname,'LEVEL',5)=0 THEN
BEGIN
appendstring(' resultelt.parameters.index:=ps.index;',helpfile);
appendstring('\\',helpfile);

END;
ilparamlist:=ilparamlist^.next;
END;
appendstring(' resultelt.parameters.params:=lips;',helpfile);
appendstring('\\',helpfile);

appendstring(' HILTREE_newhyperiltreerule(p,',helpfile);
 appendstring(tracomDECL_convinttostring(ilrulenr),helpfile);

appendstring(',resultelt.parameters);',helpfile);
appendstring('\\',helpfile);

appendstring(' HILTREE_storehypernodeelt(p,resultelt);',helpfile);
appendstring('\\',helpfile);

appendstring(' HILTREE_AddToNode(p,result1);',helpfile);
appendstring('\\',helpfile);

LDMRULES_ruleparameters(mrulenr,mparamlist);
LIILRULES_ruleparameters(ilrulenr,ilparamlist);
WHILE ilparamlist<>NIL DO
BEGIN
TSTRING_constant(paramname,ilparamlist^.paramname,
ilparamlist^.length);
IF TSTRING_comparechars(paramname,'LEVEL',5)<>0 THEN
BEGIN
found:=false;
rightsimples1:=rightsimples;
WHILE stillsimples(rightsimples1) and not found DO
BEGIN
takesimple(simple,rightsimples1);
found := TSTRING_compare(simple.param,paramname)=0
END;
IF not found THEN
BEGIN
pairset:=findmruparam(pairsets,paramname,mparamlist);
pairs:=pairset.pairs;
appendstring('helpresult1:=result1;',helpfile);
appendstring('\\',helpfile);

appendstring('HILTREE_emptyNode(result1);',helpfile);
appendstring('\\',helpfile);

WHILE stillpairs(pairs) DO
BEGIN
takepair(pair,pairs);
IF pair.rightpresent THEN
BEGIN
IF pair.leftsetvalued THEN
BEGIN
leftsets:=pair.leftsets;
WHILE stillidentsets(leftsets) DO
BEGIN
takeidentset(identset1,leftsets);
appendstring(' IF X',helpfile);
 appendstring(tracomDECL_convinttostring(mrulenr),helpfile);

appendstring(pairset.mruparam,helpfile);
 appendstring('= [',helpfile);

WHILE stillidents(identset1.val) DO
BEGIN
takeident(ident,identset1.val);
appendstring(ident.str,helpfile);

IF stillidents(identset1.val) THEN appendstring(',',helpfile);

appendstring('\\',helpfile);

END;
appendstring(' ] THEN BEGIN',helpfile);
appendstring('\\',helpfile);

IF pair.rightsetvalued THEN
BEGIN
rightsets:=pair.rightsets;
WHILE stillidentsets(rightsets) DO
BEGIN
takeidentset(identset2,rightsets);
appendstring('result2:=helpresult1;',helpfile);
appendstring('\\',helpfile);

appendstring('WHILE NOT(HILTREE_IsEmptyNode(result2)) DO',helpfile);
appendstring('\\',helpfile);

appendstring(' BEGIN',helpfile);
appendstring('\\',helpfile);

appendstring(' HILTREE_TakeFromNode(p,result2);',helpfile);
appendstring('\\',helpfile);

appendstring(' HILTREE_LoadHypernodeelt(p,resultelt);',helpfile);
appendstring('\\',helpfile);

appendstring('lips:=resultelt.parameters.params;',helpfile);
appendstring('\\',helpfile);

appendstring('lips.X',helpfile);
 appendstring(tracomDECL_convinttostring(ilrulenr),helpfile);
 appendstring(paramname,helpfile);

appendstring(':=[',helpfile);

WHILE stillidents(identset2.val) DO
BEGIN
takeident(ident,identset2.val);
appendstring(ident.str,helpfile);

IF stillidents(identset2.val) THEN appendstring(',',helpfile);

appendstring('\\',helpfile);

END;
appendstring(' ];',helpfile);
appendstring('\\',helpfile);

appendstring(' resultelt.parameters.params:=lips;',helpfile);
appendstring('\\',helpfile);

appendstring(' HILTREE_newhyperiltreerule(p,',helpfile);
 appendstring(tracomDECL_convinttostring(ilrulenr),helpfile);

appendstring(',resultelt.parameters);',helpfile);
appendstring('\\',helpfile);

appendstring(' HILTREE_storehypernodeelt(p,resultelt);',helpfile);
appendstring('\\',helpfile);

appendstring('HILTREE_addtoNode(p,result1);',helpfile);
appendstring('\\',helpfile);

appendstring(' END;',helpfile);
appendstring('\\',helpfile);

END;
END
ELSE {not pair.rightsetvalued}
BEGIN
rights:=pair.rights;
WHILE stillidents(rights) DO
BEGIN
takeident(ident,rights);
appendstring('result2:=helpresult1;',helpfile);
appendstring('\\',helpfile);

appendstring('WHILE NOT(HILTREE_IsEmptyNode(result2)) DO',helpfile);
appendstring('\\',helpfile);

appendstring(' BEGIN',helpfile);
appendstring('\\',helpfile);

appendstring(' HILTREE_TakeFromNode(p,result2);',helpfile);
appendstring('\\',helpfile);

appendstring(' HILTREE_LoadHypernodeelt(p,resultelt);',helpfile);
appendstring('\\',helpfile);

appendstring('lips:=resultelt.parameters.params;',helpfile);
appendstring('\\',helpfile);

appendstring('lips.X',helpfile);
 appendstring(tracomDECL_convinttostring(ilrulenr),helpfile);
 appendstring(paramname,helpfile);

appendstring(':=',helpfile);
 appendstring(ident.str,helpfile);
 appendstring(';',helpfile);
appendstring('\\',helpfile);

appendstring(' resultelt.parameters.params:=lips;',helpfile);
appendstring('\\',helpfile);

appendstring(' HILTREE_newhyperiltreerule(p,',helpfile);
 appendstring(tracomDECL_convinttostring(ilrulenr),helpfile);

appendstring(',resultelt.parameters);',helpfile);
appendstring('\\',helpfile);

appendstring(' HILTREE_storehypernodeelt(p,resultelt);',helpfile);
appendstring('\\',helpfile);

appendstring('HILTREE_addtonode(p,result1);',helpfile);
appendstring('\\',helpfile);

appendstring(' END;',helpfile);
appendstring('\\',helpfile);

END;
END;
appendstring(' END;',helpfile);
appendstring('\\',helpfile);

END;
END
ELSE {not pair.leftsetvalued}
BEGIN
lefts:=pair.lefts;
WHILE stillidents(lefts) DO
BEGIN
takeident(ident,lefts);
appendstring(' IF X',helpfile);
 appendstring(tracomDECL_convinttostring(mrulenr),helpfile);

appendstring(pairset.mruparam,helpfile);
 appendstring('=',helpfile);
 appendstring(ident.str,helpfile);

appendstring(' THEN BEGIN',helpfile);
appendstring('\\',helpfile);

IF pair.rightsetvalued THEN
BEGIN
rightsets:=pair.rightsets;
WHILE stillidentsets(rightsets) DO
BEGIN
takeidentset(identset2,rightsets);
appendstring('result2:=helpresult1;',helpfile);
appendstring('\\',helpfile);

appendstring('WHILE NOT(HILTREE_IsEmptyNode(result2)) DO',helpfile);
appendstring('\\',helpfile);

appendstring(' BEGIN',helpfile);
appendstring('\\',helpfile);

appendstring(' HILTREE_TakeFromNode(p,result2);',helpfile);
appendstring('\\',helpfile);

appendstring(' HILTREE_LoadHypernodeelt(p,resultelt);',helpfile);
appendstring('\\',helpfile);

appendstring('lips:=resultelt.parameters.params;',helpfile);
appendstring('\\',helpfile);

appendstring('lips.X',helpfile);
 appendstring(tracomDECL_convinttostring(ilrulenr),helpfile);
 appendstring(paramname,helpfile);

appendstring(':=[',helpfile);

WHILE stillidents(identset2.val) DO
BEGIN
takeident(ident,identset2.val);
appendstring(ident.str,helpfile);

IF stillidents(identset2.val) THEN appendstring(',',helpfile);

appendstring('\\',helpfile);

END;
appendstring(' ];',helpfile);
appendstring('\\',helpfile);

appendstring(' resultelt.parameters.params:=lips;',helpfile);
appendstring('\\',helpfile);

appendstring(' HILTREE_newhyperiltreerule(p,',helpfile);
 appendstring(tracomDECL_convinttostring(ilrulenr),helpfile);

appendstring(',resultelt.parameters);',helpfile);
appendstring('\\',helpfile);

appendstring(' HILTREE_storehypernodeelt(p,resultelt);',helpfile);
appendstring('\\',helpfile);

appendstring('HILTREE_addtoNode(p,result1);',helpfile);
appendstring('\\',helpfile);

appendstring(' END;',helpfile);
appendstring('\\',helpfile);

END;
END
ELSE {not pair.rightsetvalued}
BEGIN
rights:=pair.rights;
WHILE stillidents(rights) DO
BEGIN
takeident(ident,rights);
appendstring('result2:=helpresult1;',helpfile);
appendstring('\\',helpfile);

appendstring('WHILE NOT(HILTREE_IsEmptyNode(result2)) DO',helpfile);
appendstring('\\',helpfile);

appendstring(' BEGIN',helpfile);
appendstring('\\',helpfile);

appendstring(' HILTREE_TakeFromNode(p,result2);',helpfile);
appendstring('\\',helpfile);

appendstring(' HILTREE_LoadHypernodeelt(p,resultelt);',helpfile);
appendstring('\\',helpfile);

appendstring('lips:=resultelt.parameters.params;',helpfile);
appendstring('\\',helpfile);

appendstring('lips.X',helpfile);
 appendstring(tracomDECL_convinttostring(ilrulenr),helpfile);
 appendstring(paramname,helpfile);

appendstring(':=',helpfile);
 appendstring(ident.str,helpfile);
 appendstring(';',helpfile);
appendstring('\\',helpfile);

appendstring(' resultelt.parameters.params:=lips;',helpfile);
appendstring('\\',helpfile);

appendstring(' HILTREE_newhyperiltreerule(p,',helpfile);
 appendstring(tracomDECL_convinttostring(ilrulenr),helpfile);

appendstring(',resultelt.parameters);',helpfile);
appendstring('\\',helpfile);

appendstring(' HILTREE_storehypernodeelt(p,resultelt);',helpfile);
appendstring('\\',helpfile);

appendstring('HILTREE_addtoNode(p,result1);',helpfile);
appendstring('\\',helpfile);

appendstring(' END;',helpfile);
appendstring('\\',helpfile);

END;
END;
appendstring('END;',helpfile);
appendstring('\\',helpfile);

END;
END;
END;
END;
END;
END;
ilparamlist:=ilparamlist^.next;
END;
appendstring('appendresults(result1,result);',helpfile);
appendstring('\\',helpfile);

appendstring(' END;',helpfile);
appendstring('\\',helpfile);

appendstring(' END{WITH};',helpfile);
appendstring('\\',helpfile);

numcode.code:=helpfile;
numcode.num:=mrulenr;
mergerightnumcode(numcode);
END;
END;
END;
RULETRANS_intequals:=intequals;
RULETRANS_leftnumcodes:=leftnumcodes;
RULETRANS_rightnumcodes:=rightnumcodes;
END
END;
PROCEDURE tracomCODE_ANDCONDproc(top:tracomDECL_psnode
;ANDCOND_rulenumber              :tracomlangspec_int
;var ANDCOND_copy              :LOCALFILE
;var ANDCOND_intequals              :LOCALFILE
;var ANDCOND_simple              :tracomlangspec_simple
);
VAR currenttree:tracomDECL_psnode;
    rsnode1:tracomDECL_prsnode;
 copy,intequals:LOCALFILE;
simple: tracomLANGSPEC_simple;
rulenumber: tracomLANGSPEC_int;
BEGIN
 BEGIN initlocalfile(copy);
initlocalfile(intequals);

rulenumber:=ANDCOND_rulenumber;
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN END
;
 BEGIN appendstring(' AND ',copy);
appendstring('\\',copy);

END
END;

2: begin
  BEGIN ORCOND__rulenumber:=rulenumber
END
; tracomCODE_ORCONDproc(currenttree
,ORCOND__rulenumber
,ORCOND__copy
,ORCOND__intequals
,ORCOND__simple
);
 BEGIN simple:=ORCOND__simple;
appendlocfile(ORCOND__copy,copy);
appendlocfile(ORCOND__intequals,intequals);
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN ANDCOND_simple:=simple;
ANDCOND_copy:=copy;
ANDCOND_intequals:=intequals;
END
END;
PROCEDURE tracomCODE_ORCONDproc(top:tracomDECL_psnode
;ORCOND_rulenumber              :tracomlangspec_int
;var ORCOND_copy              :LOCALFILE
;var ORCOND_intequals              :LOCALFILE
;var ORCOND_simple              :tracomlangspec_simple
);
VAR currenttree:tracomDECL_psnode;
    rsnode1:tracomDECL_prsnode;
 simple: tracomLANGSPEC_simple;
copy,intequals:LOCALFILE;
rulenumber: tracomLANGSPEC_int;
BEGIN
 BEGIN initlocalfile(copy);
initlocalfile(intequals);

rulenumber:=ORCOND_rulenumber;
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN END
;
 BEGIN appendstring(' OR ',copy);
appendstring('\\',copy);

END
END;

2: begin
  BEGIN ELEMENTARYCOND__rulenumber:=rulenumber
END
; tracomCODE_ELEMENTARYCONDproc(currenttree
,ELEMENTARYCOND__rulenumber
,ELEMENTARYCOND__copy
,ELEMENTARYCOND__simple
,ELEMENTARYCOND__intequals
);
 BEGIN simple:=ELEMENTARYCOND__simple;
appendlocfile(ELEMENTARYCOND__copy,copy);
appendlocfile(ELEMENTARYCOND__intequals,intequals);
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN ORCOND_copy:=copy;
ORCOND_simple:=simple;
ORCOND_intequals:=intequals;
END
END;
PROCEDURE tracomCODE_ELEMENTARYCONDproc(top:tracomDECL_psnode
;ELEMENTARYCOND_rulenumber              :tracomlangspec_int
;var ELEMENTARYCOND_copy              :LOCALFILE
;var ELEMENTARYCOND_simple              :tracomlangspec_simple
;var ELEMENTARYCOND_intequals              :LOCALFILE
);
VAR currenttree:tracomDECL_psnode;
    rsnode1:tracomDECL_prsnode;
 copy,intequals:LOCALFILE;
rulenumber: tracomLANGSPEC_int;
simple: tracomLANGSPEC_simple;
BEGIN
 BEGIN rulenumber:=ELEMENTARYCOND__rulenumber
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
  BEGIN ANDCOND__rulenumber:=rulenumber END
; tracomCODE_ANDCONDproc(currenttree
,ANDCOND__rulenumber
,ANDCOND__copy
,ANDCOND__intequals
,ANDCOND__simple
);
 BEGIN copy:=ANDCOND__copy;
simple:=ANDCOND__simple;
intequals:=ANDCOND__intequals;
END
END;

3: begin
  BEGIN PASCALEXPR__rulenumber:=rulenumber END
; tracomCODE_PASCALEXPRproc(currenttree
,PASCALEXPR__rulenumber
,PASCALEXPR__copy
,PASCALEXPR__intequals
,PASCALEXPR__simple
);
 BEGIN copy:=PASCALEXPR__copy;
simple:=PASCALEXPR__simple;
intequals:=PASCALEXPR__intequals;
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN ELEMENTARYCOND_copy:=copy;
ELEMENTARYCOND_simple:=simple;
ELEMENTARYCOND_intequals:=intequals;
END
END;
PROCEDURE tracomCODE_PASCALEXPRproc(top:tracomDECL_psnode
;PASCALEXPR_rulenumber              :tracomlangspec_int
;var PASCALEXPR_copy              :LOCALFILE
;var PASCALEXPR_intequals              :LOCALFILE
;var PASCALEXPR_simple              :tracomlangspec_simple
);
VAR currenttree:tracomDECL_psnode;
    rsnode1:tracomDECL_prsnode;
 copy,intequals:LOCALFILE;
param:TSTRING_string;
valeu,tempfile:LOCALFILE;
str,str1:TSTRING_string;
simple: tracomLANGSPEC_simple;
notpresent: tracomLANGSPEC_bool;
rulenumber,initialcounter: tracomLANGSPEC_int;
BEGIN
 BEGIN initlocalfile(copy);
initlocalfile(intequals);
initlocalfile(valeu);
initialcounter:=top^.ldfield.PASCALEXPRfield^.initialcounter;
rulenumber:=PASCALEXPR_rulenumber;
notpresent:=top^.ldfield.PASCALEXPRfield^.notpresent;

If notpresent THEN appendstring('NOT(',copy);

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
 BEGIN appendstring(' = ',copy);

END
END;

3: begin
  BEGIN END
;
 BEGIN appendstring(' = ',copy);

END
END;

4: begin
  BEGIN END
;
 BEGIN 
END
END;

5: begin
  BEGIN END
;
 BEGIN 
END
END;

6: begin
  BEGIN END
;
 BEGIN appendstring(' IN ',copy);

END
END;

7: begin
  BEGIN END
;
 BEGIN appendstring('<=',copy);

END
END;

8: begin
  BEGIN END
;
 BEGIN appendstring('>=',copy);

END
END;

9: begin
  BEGIN END
;
 BEGIN 
END
END;

10: begin
  BEGIN END
;
 BEGIN str:=currenttree^.ldfield.PARAMNAMEfield^.str;
appendstring('X',copy);
 appendstring(tracomDECL_convinttostring(rulenumber),copy);
 appendstring(str,copy);

param:=str;
END
END;

11: begin
  BEGIN END
;
 BEGIN 
str:=currenttree^.ldfield.VALUENAMEfield^.str;
appendstring(str,valeu);


appendstring(str,copy);

END
END;

12: begin
  BEGIN END
; tracomCODE_SETVALUENAMEproc(currenttree
,SETVALUENAME__copy
);
 BEGIN savelocfile(SETVALUENAME__copy,tempfile);
appendlocfile(tempfile,copy);
savelocfile(SETVALUENAME__copy,tempfile);
appendlocfile(tempfile,valeu);
END
END;

13: begin
  BEGIN END
;
 BEGIN str:=currenttree^.ldfield.PARAMNAMEfield^.str;
appendstring(str,copy);

END
END;

14: begin
  BEGIN END
; tracomCODE_SETVALUENAMEproc(currenttree
,SETVALUENAME__copy
);
 BEGIN appendlocfile(SETVALUENAME__copy,copy)
END
END;

15: begin
  BEGIN END
;
 BEGIN str1:=currenttree^.ldfield.PARAMNAMEfield^.str;
END
END;

16: begin
  BEGIN END
;
 BEGIN str:=currenttree^.ldfield.VALUENAMEfield^.str;
appendstring(str,copy);
 appendstring(' IN ',copy);
 appendstring(str1,copy);

END
END;

17: begin
  BEGIN END
;
 BEGIN str:=currenttree^.ldfield.TERMINAL^.str;
initialcounter:=initialcounter+1;
appendstring('intequals',copy);
 appendstring(tracomDECL_convinttostring(initialcounter),copy);
 appendstring('(X',copy);

appendstring(tracomDECL_convinttostring(rulenumber),copy);
 appendstring(param,copy);
 appendstring(')',copy);


appendstring('function intequals',intequals);
 appendstring(tracomDECL_convinttostring(initialcounter),intequals);
 
appendstring('(param:INTEGER):BOOLEAN;',intequals);
appendstring('\\',intequals);

appendstring('begin',intequals);
appendstring('\\',intequals);

appendstring(str,intequals);
 appendstring(':=',intequals);
 appendstring('param',intequals);
 appendstring(';',intequals);

appendstring('\\',intequals);
 appendstring('intequals',intequals);
 appendstring(tracomDECL_convinttostring(initialcounter),intequals);

appendstring(':=TRUE',intequals);
appendstring('\\',intequals);

appendstring('end;',intequals);
appendstring('\\',intequals);


str:=currenttree^.ldfield.VALUENAMEfield^.str;
appendstring(str,valeu);

END
END;

18: begin
  BEGIN END
;
 BEGIN str:=currenttree^.ldfield.PARAMNAMEfield^.str;
param:=str;
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN IF notpresent THEN BEGIN appendstring(')',valeu);
 appendstring('\\',valeu);
END;
PASCALEXPR_intequals:=intequals;
PASCALEXPR_copy:=copy;
simple.valeu:=valeu;
simple.param:=param;
simple.copy:=copy;
PASCALEXPR_simple:=simple;
END
END;
PROCEDURE tracomCODE_SETVALUENAMEproc(top:tracomDECL_psnode
;var SETVALUENAME_copy              :LOCALFILE
);
VAR currenttree:tracomDECL_psnode;
    rsnode1:tracomDECL_prsnode;
 copy:LOCALFILE;
str:TSTRING_string;
BEGIN
 BEGIN initlocalfile(copy);

appendstring('[',copy);

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
str:=currenttree^.ldfield.VALUENAMEfield^.str;

appendstring(str,copy);

END
END;

3: begin
  BEGIN END
;
 BEGIN

appendstring(',',copy);
appendstring('\\',copy);

END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 

appendstring(']',copy);

SETVALUENAME_copy:=copy;
END
END;
PROCEDURE tracomCODE_VALUENAMEproc(top:tracomDECL_psnode
);
VAR currenttree:tracomDECL_psnode;
    rsnode1:tracomDECL_prsnode;

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
 BEGIN 
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN END
END;
PROCEDURE tracomCODE_PARAMNAMEproc(top:tracomDECL_psnode
);
VAR currenttree:tracomDECL_psnode;
    rsnode1:tracomDECL_prsnode;

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
 BEGIN 
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN END
END;
PROCEDURE tracomCODE_TYPENAMEproc(top:tracomDECL_psnode
);
VAR currenttree:tracomDECL_psnode;
    rsnode1:tracomDECL_prsnode;

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
 BEGIN 
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN END
END;
PROCEDURE tracomCODE_MRULENAMEproc(top:tracomDECL_psnode
);
VAR currenttree:tracomDECL_psnode;
    rsnode1:tracomDECL_prsnode;

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
 BEGIN 
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN END
END;
PROCEDURE tracomCODE_ILRULENAMEproc(top:tracomDECL_psnode
);
VAR currenttree:tracomDECL_psnode;
    rsnode1:tracomDECL_prsnode;

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
 BEGIN 
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN END
END;
